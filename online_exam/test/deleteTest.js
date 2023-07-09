const express = require("express");
const connection_attr = require("../config/db").connection_attr;
const oracle_db = require("oracledb");
const router = express.Router();

router.post('/:test_id', async (req, res) => {
    console.log(req.params.test_id);
    let connection, error = '';
    try {
        connection = await oracle_db.getConnection(connection_attr);
        const binds = [
            req.params.test_id,
            req.cookies.username
        ];
        const query = "begin delete_test(:test_id, :username); end;";
        await connection.execute(query, binds, {autoCommit: true});
    } catch (ex) {
        console.log(ex.message);
        if (ex.message.includes('20036'))
            error = 'teacher does not have a permission to delete';
        else if (ex.message.includes('20046'))
            error = 'cannot delete test already begun';
        else
            error = 'teacher does not have a permission to delete';
    } finally {
        try {
            connection.release();
        } catch (e) {
            console.log(e);
            error = 'can not connect to the server';
        }
    }
    if (error.length > 0)
        return res.status(401).json({msg: error});
    else
        return res.json({ok: true});
});


module.exports = router;