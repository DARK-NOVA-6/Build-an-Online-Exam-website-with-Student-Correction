const connection_attr = require("../config/db").connection_attr;
const oracle_db = require("oracledb");
const user_auth = require("../user/auth");
const express = require("express");
const router = express.Router();

router.get('/teacher/:id', user_auth, async function (req, res) {
    if (req.cookies.role !== 'teacher')
        return res.status(400);
    let connection, result = {description: {}, questions: [{},]};
    try {
        connection = await oracle_db.getConnection(connection_attr);
        let query = "select start_time, test_duration, correcting_duration from test where test.id = :id ";
        let result_db = await connection.execute(query, [req.params.id]);
        result.description.start_time = result_db.rows[0][0];
        result.description.test_duration = result_db.rows[0][1];
        result.description.correcting_duration = result_db.rows[0][2];
        query = "select id, text, type, correct_answer from question where question.test_id = :id ";
        result_db = await connection.execute(query, [req.params.id]);
        for (const question of result_db.rows) {
            let temp = {
                id: question[0],
                text: question[1],
                type: question[2] === 'trf' ? 2 : question[2] === 'wrd' ? 1 : 3
            };
            if (temp.type === 1)
                temp.answer = question[3];
            else {
                const query_ = "select text, is_correct, order_opt from options where options.question_id = :id";
                const result_db_ = await connection.execute(query_, [temp.id]);
                temp.options = [{},];
                console.log(result_db_);
                for (const option of result_db_.rows) {
                    temp.options.push({
                        text: option[0],
                        order: option[2],
                        isSelected: option[1] === 'y'
                    });
                }
            }
            result.questions.push(temp);
        }
    } catch (ex) {
        console.log(ex);
        return res.status(404);
    } finally {
        try {
            connection.release();
        } catch (e) {
            return res.status(500);
        }
    }
    console.log(result);
    res.json(result);
});
//
// const test_check = async (req, res, next) => {
//     if (req.cookies.role !== 'student' || (req.query.take !== 'false' && req.query.take !== 'true'))
//         return res.status(400);
//     let connection, check = false;
//     try {
//         connection = await oracle_db.getConnection(connection_attr);
//         const table = req.query.take === 'true' ? 'solved_test' : 'corrected_test';
//         const query = "select count(*) from " + table + ", student where " + table + ".id = :id and" +
//             " student.id = " + table + ".student_id and" +
//             " student.username = :username";
//         const result_db = connection.exports(query, [req.params.id, req.cookies.username]);
//         if (result_db.rows [0][0] > 0)
//             check = true;
//     } catch (e) {
//     }
//     if (!check)
//         return res.status(400);
//     return next();
// }
router.get('/student/:id', user_auth, async function (req, res) {
    if (req.cookies.role !== 'student' || (req.query.take !== 'false' && req.query.take !== 'true'))
        return res.status(400);
    let connection, result = {description: {}, questions: [{},]}, status = 200;
    try {
        connection = await oracle_db.getConnection(connection_attr);
        let solved_id = req.params.id, test_id = req.params.id, corrected_id = -1;
        let finished = false;
        if (req.query.take === 'true') {
            let query = "select solved_test.id from solved_test, student where solved_test.student_id = student.id " +
                "and student.username = :username and solved_test.test_id = :id";
            let result_db = await connection.execute(query, [req.cookies.username, req.params.id]);
            solved_id = result_db.rows[0][0];
            query = "select count(*) from solved_test where id = :solved_test and finished = 'y'";
            result_db = await connection.execute(query, [solved_id]);
            if (result_db.rows[0][0] > 0)
                finished = true;
        } else {
            let query = "select solved_test.test_id from solved_test where solved_test.id = :id";
            let result_db = await connection.execute(query, [req.params.id]);
            test_id = result_db.rows[0][0];
            query = "select corrected_test.id from corrected_test where corrected_test.solved_test_id = :id and " +
                "corrected_test.student_id = (select student.id from student where student.username = :username)";
            result_db = await connection.execute(query, [req.params.id, req.cookies.username]);
            corrected_id = result_db.rows[0][0];
            query = "select count(*) from corrected_test where id = :corrected_id and finished = 'y'";
            result_db = await connection.execute(query, [corrected_id]);
            if (result_db.rows[0][0] > 0)
                finished = true;
        }
        console.log(test_id);
        console.log(solved_id);
        console.log(corrected_id);
        
        let query = "select start_time, test_duration, correcting_duration from test where test.id = :id ";
        let result_db = await connection.execute(query, [test_id]);
        result.description.start_time = result_db.rows[0][0];
        result.description.test_duration = result_db.rows[0][1];
        result.description.correcting_duration = result_db.rows[0][2];
        result.description.finished = finished;
        let query0 = "select question.id, solved_question.id , question.text, question.type, solved_question.answer, solved_question.selected_options" +
            " from question, solved_question " +
            "where question.test_id = :id and " +
            "question.id = solved_question.question_id and " +
            "solved_question.solved_test_id = :id2 ";
        let binds0 = [test_id, solved_id];
        let query1 = "select question.id, corrected_question.id , question.text, question.type, solved_question.answer, solved_question.selected_options, " +
            " corrected_question.validation" +
            " from question, solved_question, corrected_question " +
            " where question.id = solved_question.question_id and " +
            " solved_question.id = corrected_question.solved_question_id and " +
            " solved_question.solved_test_id = :id2 and " +
            " corrected_question.corrected_test_id = :id3";
        let binds1 = [solved_id, corrected_id];
        if (req.query.take === 'true')
            result_db = await connection.execute(query0, binds0);
        else
            result_db = await connection.execute(query1, binds1);
        console.log(result_db);
        for (const question of result_db.rows) {
            let temp = {
                id: question[1],
                text: question[2],
                type: question[3] === 'trf' ? 2 : question[3] === 'wrd' ? 1 : 3
            };
            if (temp.type === 1)
                temp.answer = question[4] ?? '';
            else {
                const selected = question[5];
                const query_ = "select text, order_opt from options where options.question_id = :id";
                const result_db_ = await connection.execute(query_, [question [0]]);
                temp.options = [{},];
                console.log(result_db_);
                for (const option of result_db_.rows) {
                    temp.options.push({
                        text: option[0],
                        order: parseInt(option[1]),
                        isSelected: (!!selected.includes(option[1])),
                    });
                }
            }
            if (req.query.take === 'false')
                temp.correction = question[6];
            result.questions.push(temp);
        }
    } catch (ex) {
        console.log(ex);
        
        status = 404;
    } finally {
        try {
            connection.release();
        } catch (e) {
            status = 500;
        }
    }
    
    console.log(result);
    let start = new Date(result.description.start_time);
    let end = start.getTime() + result.description.test_duration * 60 * 1000;
    if (req.query.take === 'false')
        end = start.getTime() + (result.description.test_duration + result.description.correcting_duration) * 60 * 1000;
    let now = new Date().getTime();
    if (now > end || now < start)
        status = 400;
    if (status !== 200)
        return res.status(status);
    else res.json(result);
});

module.exports = router;