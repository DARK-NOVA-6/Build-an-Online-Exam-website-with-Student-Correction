const express = require("express");
const connection_attr = require("../config/db").connection_attr;
const oracle_db = require("oracledb");
const user_auth = require("../user/auth");
const router = express.Router();

router.post('/', user_auth, async (req, res) => {
    console.log('correcting ,,,');
    if (req.cookies.role !== 'student')
        return res.status(400);
    const corrected_question_id = req.body.id;
    const validation = req.body.validation ;
    let connection, status = 200, msg = 'answer saved ...';
    console.log('correcting2 ,,,');
    try {
        const binds = [
            validation,
            corrected_question_id
        ];
        connection = await oracle_db.getConnection(connection_attr);
        const query = "begin update_corrected_question ( :p_validation , :p_corrected_question_id); end;";
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
    return res.status(status).json({ok: status === 200, msg: msg});
});


module.exports = router;