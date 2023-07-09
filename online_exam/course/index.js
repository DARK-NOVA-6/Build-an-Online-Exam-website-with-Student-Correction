const express = require("express");
const connection_attr = require("../config/db").connection_attr;
const oracle_db = require("oracledb");
const auth = require('../user/auth');
const router = express.Router();


router.get('/', auth, async (req, res) => {
    let connection, result = [];
    try {
        connection = await oracle_db.getConnection(connection_attr);
        const query = 'select * from course';
        const result_db = await connection.execute(query);
        for (const row of result_db.rows) {
            result.push(
                row [1]
            );
        }
    } catch (ex) {
    } finally {
        try {
            connection.release();
        } catch (e) {
        }
    }
    res.json(result);
});


module.exports = router;