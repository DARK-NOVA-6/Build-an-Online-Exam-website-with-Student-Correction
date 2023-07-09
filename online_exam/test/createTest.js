const express = require("express");
const connection_attr = require("../config/db").connection_attr;
const oracle_db = require("oracledb");
const router = express.Router();
const user_auto = require("../user/auth");

router.post('/', user_auto, async (req, res) => {
    if (req.cookies.role !== 'teacher')
        return res.status(500).redirect('/');
    
    let connection, error = '', test_id = -1;
    console.log(req.body);
    if (req.body.numberOfQuestion === '0')
        error = 'test must have at least one question';
    else try {
        connection = await oracle_db.getConnection(connection_attr);
        const binds = [
            req.body.startDate + " " + req.body.startTime,
            parseInt(req.body.testLength),
            parseInt(req.body.correctionLength),
            req.body.courseName,
            req.cookies.username
        ];
        console.log(binds);
        const query = "begin add_test(:start_time, :test_duration, :correcting_duration, :course_title, :teacher_username); end;";
        console.log('inserting ...');
        await connection.execute(query, binds, {autoCommit: true});
        test_id = (await connection.execute("select max(id) from test")).rows[0][0];
        console.log(test_id);
        for (const question of req.body.questions) {
            if (question.text.trim().length === 0)
                error = 'text of a question can not be empty';
            
            const type = (question.type === '1' ? 'opt' : question.type === '2' ? 'trf' : 'wrd');
            if (type === 'wrd') {
                if (question.textAnswer.trim().length === 0)
                    error = 'answer of a question can not be empty';
            } else {
                if (type !== 'trf') {
                    let checked = false, options = [];
                    for (const option of question.options) {
                        if (option.text.trim().length === 0)
                            error = 'options of a question can not be empty';
                        if (options.includes(option.text.trim()))
                            error = 'options of a question should be distinct';
                        options.push(option.text);
                        if (option.checked === 'true')
                            checked = true;
                    }
                    if (checked === false)
                        error = 'at lease one options of a question should be correct';
                } else {
                }
            }
        }
        if (error.length === 0) {
            for (const question of req.body.questions) {
                const type = (question.type === '1' ? 'opt' : question.type === '2' ? 'trf' : 'wrd');
                if (type === 'wrd') {
                    const binds = [
                        test_id,
                        question.text,
                        type,
                        question.textAnswer
                    ];
                    const query = "begin add_question(:test_id, :text, :type, :correct_answer) ; end;";
                    await connection.execute(query, binds, {autoCommit: true});
                } else {
                    const binds = [
                        test_id,
                        question.text,
                        type,
                    ];
                    const query = "begin add_question(:test_id, :text, :type) ; end;";
                    await connection.execute(query, binds, {autoCommit: true});
                    const ques_id = (await connection.execute("select max(id) from question")).rows[0][0];
                    let opts = [];
                    if (type === 'trf')
                        opts = [
                            {text: 'True', order: 0, checked: question.trueFlase === 'true' ? 'true' : 'false'},
                            {text: 'False', order: 1, checked: question.trueFlase === 'false' ? 'true' : 'false'},
                        ]
                    else
                        opts = question.options;
                    
                    for (const option of opts) {
                        const binds2 = [
                            ques_id,
                            option.text,
                            option.checked === 'true' ? 'y' : 'n',
                            option.order
                        ];
                        const query2 = "begin add_option(:ques_id, :text, :is_corr, :order); end;";
                        await connection.execute(query2, binds2, {autoCommit: true});
                    }
                }
            }
        } else {
            const query = "begin delete_test(:id); end;";
            console.log('deleting0 ...' + test_id);
            await connection.execute(query, [test_id], {autoCommit: true});
        }
    } catch (ex) {
        try {
            const query = "delete from test where test.id = :id";
            console.log('deleting1 ...' + test_id);
            await connection.execute(query, [test_id], {autoCommit: true});
        } catch (e) {
        }
        console.log(ex);
        error = 'test description is not valid';
    } finally {
        try {
            connection.release();
        } catch (e) {
            console.log(e);
            error = 'can not connect to the server';
        }
    }
    console.log('.... finish' + error);
    if (error.length > 0)
        res.status(400).json({msg: error});
    else
        res.json({msg: 'test added successfully'});
    return res;
});


module.exports = router;