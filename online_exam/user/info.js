const connection_attr = require("../config/db").connection_attr;
const oracle_db = require("oracledb");
const user_auth = require("../user/auth");
const express = require("express");
const router = express.Router();

router.get('/', user_auth, async function (req, res) {
    let connection, result = {};
    try {
        connection = await oracle_db.getConnection(connection_attr);
        const username = req.cookies.username;
        const role = req.cookies.role;
        await connection.execute("begin start_system_testing_all; end;" , [], {autoCommit: true});
        let result_db = [];
        if (role === 'teacher') {
            const query = "select first_name, last_name, username, photo_url from teacher where username = :username";
            result_db = await connection.execute(query, [username]);
        } else {
            const query = "select first_name, last_name, username, photo_url, points from student where username = :username";
            result_db = await connection.execute(query, [username]);
            result.points = result_db.rows [0][4];
        }
        result.first_name = result_db.rows [0][0];
        result.last_name = result_db.rows [0][1];
        result.username = result_db.rows [0][2];
        result.photo_url = result_db.rows [0][3];
        result.role = role;
    } catch (ex) {
        console.log(ex) ;
    } finally {
        try {
            connection.release();
        } catch (e) {
            console.log(e) ;
        }
    }
    console.log(result);
    res.json(result);
});

module.exports = router;