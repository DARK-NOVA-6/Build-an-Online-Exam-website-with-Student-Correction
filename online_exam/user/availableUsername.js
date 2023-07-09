const express = require("express");
const connection_attr = require("../config/db").connection_attr;
const oracle_db = require("oracledb");
const bcrypt = require("bcrypt");
const {check, validationResult} = require('express-validator');
const router = express.Router();

register_validator = [
    check('username', 'username cant be empty')
        .notEmpty(),
    
    check('username', 'username isnt valid')
        .exists()
        .matches(/^[a-z]+([\.]{0,1}[a-z0-9]+)*$/),
];


router.get('/', register_validator, async (req, res) => {
    console.log(req.query);
    let errors = validationResult(req);
    if (!errors.isEmpty())
        return res.json({res: false, msg: errors.errors[0].msg});
    req.query.username = req.query.username.trim();
    errors = validationResult(req);
    if (!errors.isEmpty())
        return res.json({res: false, msg: errors.errors[0].msg});
    
    let connection, checked = false;
    try {
        connection = await oracle_db.getConnection(connection_attr);
        for (const type of ['teacher', 'student']) {
            const query = "select count(*) from " + type + " where username = :username";
            const result = await connection.execute(query, [req.query.username]);
            if (result.rows [0][0] > 0)
                checked = true;
        }
    } catch (ex) {
        return res.json({res: false, msg: 'bad network'});
    } finally {
        try {
            connection.release();
        } catch (e) {
            console.log(e);
            return res.json({res: false, msg: 'bad network'});
        }
    }
    if (checked)
        res.json({res: false, msg: 'email is already exists'});
    else
        res.json({res: true, msg: 'email is available'});
    return res;
});


module.exports = router;