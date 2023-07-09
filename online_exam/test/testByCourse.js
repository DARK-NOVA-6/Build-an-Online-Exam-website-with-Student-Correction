const express = require("express");
const connection_attr = require("../config/db").connection_attr;
const oracle_db = require("oracledb");
const auth = require('../user/auth');
const router = express.Router();


router.get('/teacher/:course_title', auth, async (req, res) => {
    const course_title = req.params.course_title;
    const username = req.cookies.username;
    const role = req.cookies.role;
    if (role !== 'teacher')
        return res.status(400);
    console.log(username);
    console.log(course_title);
    let connection, result = [];
    try {
        connection = await oracle_db.getConnection(connection_attr);
        const query = 'select id, start_time, test_duration, correcting_duration from test' +
            ' where test.course_id = (select id from course where course.title = :title) '
        ;
        const result_db = await connection.execute(query, [course_title]);
        for (const row of result_db.rows) {
            result.push({
                id: row[0],
                start_time: row [1],
                duration: row[2],
                corr_duration: row[3],
            });
        }
        console.log(result);
        res.json(result);
    } catch (ex) {
    } finally {
        try {
            connection.release();
        } catch (e) {
        }
    }
});

router.get('/student/:course_title', auth, async (req, res) => {
    const course_title = req.params.course_title;
    const username = req.cookies.username;
    const role = req.cookies.role;
    console.log(username);
    console.log(role);
    console.log(req.query);
    if (role !== 'student' || (req.query.take !== 'false' && req.query.take !== 'true'))
        return res.status(400);
    console.log('passed');
    let connection, result = [], result_db;
    try {
        connection = await oracle_db.getConnection(connection_attr);
        if (req.query.take === 'true') {
            const query = 'select id, start_time, test_duration, correcting_duration from test' +
                ' where test.course_id = (select id from course where course.title = :title) ' +
                'and start_time +  (1 / 1440 * test_duration) >= sysdate ' +
                // 'and start_time <= sysdate ' +
                'and (select count(*) from solved_test where solved_test.test_id = id ' +
                '       and solved_test.student_id = (select student.id from student where student.username = :username)' +
                '       and finished = :finished ) = 0 '
            ;
            result_db = await connection.execute(query, [course_title, username, 'n']);
        } else {
            const query = 'select id, start_time, test_duration, correcting_duration from test' +
                    ' where test.course_id = (select id from course where course.title = :title) ' +
                    // 'and start_time +  (1 / 1440 * test_duration) < sysdate ' +
                    'and start_time +  (1 / 1440 * (test_duration + correcting_duration)) >= sysdate'
                // ' and (select count(*) from solved_test, student where student.id = solved_test.student_id' +
                // '   and solved_test.test_id = test.id and username = :username ) > 0 '
            ;
            result_db = await connection.execute(query, [course_title]);
        }
        for (const row of result_db.rows) {
            result.push({
                id: row[0],
                start_time: row [1],
                duration: row[2],
                corr_duration: row[3],
            });
        }
        console.log(result);
        res.json(result);
    } catch (ex) {
    } finally {
        try {
            connection.release();
        } catch (e) {
        }
    }
});

const correctingCheck = async (req, res, next) => {
    let connection, checked = false, result_db;
    try {
        connection = await oracle_db.getConnection(connection_attr);
        const query = 'select id, start_time, test_duration, correcting_duration from test' +
            ' where test.course_id = (select id from course where course.title = :title) ' +
            // 'and start_time +  (1 / 1440 * test_duration) < sysdate ' +
            'and start_time +  (1 / 1440 * (test_duration + correcting_duration)) >= sysdate' +
            // ' and (select count(*) from solved_test, student where student.id = solved_test.student_id' +
            // '   and solved_test.test_id = test.id and username = :username ) > 0 ' +
            '   and test.id = :test_id '
        ;
        result_db = await connection.execute(query, [course_title, username, req.params.test_id]);
        if (result_db.rows[0][0] > 0)
            checked = true;
    } catch (ex) {
    } finally {
        try {
            connection.release();
        } catch (e) {
        }
    }
    if (!checked)
        return res.status(400);
    return next();
}

router.get('/student/corrector/:test_id', auth, async (req, res) => {
    const test_id = req.params.test_id;
    const username = req.cookies.username;
    const role = req.cookies.role;
    if (role !== 'student')
        return res.status(400);
    let connection, result = {original: {}, solved: []}, result_db, msg = '';
    try {
        connection = await oracle_db.getConnection(connection_attr);
        let query = 'select id, start_time, test_duration, correcting_duration from test' +
            ' where test.id = :test_id ' +
            'and start_time +  (1 / 1440 * (test_duration + correcting_duration)) >= sysdate' +
            ' and (select count(*) from solved_test, student where student.id = solved_test.student_id' +
            '   and solved_test.test_id = test.id and username = :username ) > 0 '
        ;
        result_db = await connection.execute(query, [test_id, username]);
        console.log(result_db);
        result.original.id = result_db.rows[0][0];
        result.original.start_time = result_db.rows[0][1];
        result.original.test_duration = result_db.rows[0][2];
        result.original.correcting_duration = result_db.rows[0][3];
        query = ' select username, solved_test.id from student, solved_test where solved_test.student_id = student.id and ' +
            ' solved_test.test_id = :test_id  ' +
            ' and username != :username ';
        result_db = await connection.execute(query, [test_id, username]);
        console.log(result_db);
        for (const row of result_db.rows) {
            result.solved.push({
                username: row[0],
                id: row[1],
            });
        }
        console.log(result);
    } catch (ex) {
        msg = ex.message;
        console.log('exp1');
        console.log(ex);
    } finally {
        try {
            connection.release();
        } catch (e) {
            console.log('exp2');
            console.log(e);
            msg = e.message;
        }
    }
    // res.status(400).json({ok: false, msg: msg});
    return res.json(result);
});

module.exports = router;