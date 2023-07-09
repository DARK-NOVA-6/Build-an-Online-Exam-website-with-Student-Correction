const express = require("express");
const connection_attr = require("../config/db").connection_attr;
const oracle_db = require("oracledb");
const user_auth = require("../user/auth");
const router = express.Router();

router.post('/:solved_id', user_auth, async (req, res) => {
    if (req.cookies.role !== 'student')
        return res.status(400);
    let connection, status = 200, msg = 'test started ...';
    console.log('starting....') ;
    try {
        const binds = [
            req.cookies.username,
            parseInt(req.params.solved_id)
        ];
        console.log('connecting ...') ;
        connection = await oracle_db.getConnection(connection_attr);
        const query = "begin add_corrected_test ( :p_student_username , :p_solved_id); end;";
        await connection.execute(query, binds, {autoCommit: true});
    } catch (ex) {
        if (!ex.message.includes('unique constraint')) {
            msg = "you can't enter this test right now";
            status = 401;
        }
    } finally {
        try {
            connection.release();
        } catch (e) {
            msg = "you can't enter this test right now";
            status = 401;
        }
    }
    return res.status(status).json({msg: msg});
});


module.exports = router;