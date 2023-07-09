const express = require("express");
const connection_attr = require("../config/db").connection_attr;
const oracle_db = require("oracledb");
const user_auth = require("../user/auth");
const router = express.Router();

router.post('/:test_id', user_auth, async (req, res) => {
    console.log(req.params.test_id);
    console.log(req.cookies.username);
    const table = req.body.test;
    const table2 = (table === 'solved_test' ? 'test' : 'solved_test');
    console.log('temp ....' + req.cookies.username + ' ... ' + req.params.test_id + ' tab:' + table);
    if (req.cookies.role !== 'student')
        return res.status(400);
    
    let connection, status = 200, msg = 'test closed ...';
    try {
        const binds = [
            parseInt(req.params.test_id),
            req.cookies.username,
        ];
        
        connection = await oracle_db.getConnection(connection_attr);
        let query;
        if (table === 'solved_test')
            query = "update solved_test set finished = 'y' where test_id = :id " +
                "and student_id = (select id from student where username = :username) ";
        else
            query = "update corrected_test set finished = 'y' where solved_test_id = :test_id " +
                "and student_id = (select id from student where username = :username) ";
        await connection.execute(query, binds, {autoCommit: true});
    } catch (ex) {
        console.log(ex.message);
        msg = ex.message;
        status = 400;
        // if (ex.message.includes('unique constraint'))
        //
        // else
        //     return res.status(500).json({"error": "cannt connect to the server"});
    } finally {
        try {
            connection.release();
        } catch (e) {
            console.log(e.message);
            status = 400;
            msg = e.message;
            // res.status(500).json({"error": "cannt connect to the server"});
        }
    }
    status = 200;
    console.log('msg is ::' + msg);
    return res.status(status).json({ok: status === 200, msg: msg});
});


module.exports = router;