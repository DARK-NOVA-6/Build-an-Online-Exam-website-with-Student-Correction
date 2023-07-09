const express = require("express");
const connection_attr = require("../config/db").connection_attr;
const oracle_db = require("oracledb");
const bcrypt = require("bcrypt");
const multer = require("multer");
const fs = require("fs");
const path = require("path");
const {check, validationResult} = require('express-validator');
const router = express.Router();

const upload = multer({
    dest: "/tmp#$.%%.#22$33/uploaded"
});
register_validator = [
    check('username', 'username cant be empty')
        .notEmpty(),
    
    check('username', 'username isnt valid')
        .exists()
        .matches(/^[a-z]+([\.]{0,1}[a-z0-9]+)*$/),
    
    
    check("password", "Password must include one lowercase character, one uppercase character, a number, and a special character.")
        .matches(/^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z0-9]).{4,}$/, "i"),
    
    check('first_name', 'first name cant be empty')
        .notEmpty(),
    
    check('first_name', 'first name must include only alpha letters')
        .exists()
        .isAlpha('en-US', {ignore: '\s'}),
    
    check('last_name', 'last name cant be empty')
        .notEmpty(),
    
    check('last_name', 'last name must include only alpha letters')
        .exists()
        .isAlpha('en-US', {ignore: '\s'}),

];


router.post('/', upload.single("photo"), register_validator, async (req, res) => {
    console.log(req.body);
    let errors = validationResult(req);
    if (!errors.isEmpty()) {
        return res.render('signup', {msg: errors.errors[0].msg});
    }
    req.body.first_name = req.body.first_name.trim();
    req.body.last_name = req.body.last_name.trim();
    req.body.username = req.body.username.trim();
    errors = validationResult(req);
    if (!errors.isEmpty())
        return res.render('signup', {msg: errors.errors[0].msg});
    if (req.body.password !== req.body.conf_password)
        return res.render('signup', {msg: 'password and confirm password didnt match'});
    const salt = await bcrypt.genSalt(10);
    req.body.password = await bcrypt.hash(req.body.password, salt);
    const binds = [
        req.body.first_name,
        req.body.last_name,
        req.body.username,
        req.body.password,
        ''
    ];
    
    let connection, msg = 'can not connect to the server';
    try {
        
        connection = await oracle_db.getConnection(connection_attr);
        const type = req.body.role_title === 'Instructor' ? 'teacher' : 'student';
        let query = "begin add_" + type + " ( :first_name , :last_name , :username , :password , :photo_url ); end;";
        await connection.execute(query, binds, {autoCommit: true});
        query = "select id from " + type + " where username = :username";
        const result_db = await connection.execute(query, [req.body.username]);
        const user_id = result_db.rows[0][0];
        if (req.file) {
            const tempPath = req.file.path;
            const targetPath = path.join(__dirname + "\\uploads\\image\\" + user_id + path.extname(req.file.originalname).toLowerCase());
            const targetString = "../../user/uploads/image/" + user_id + path.extname(req.file.originalname).toLowerCase();
            console.log(targetString);
            console.log(req.file.originalname);
            console.log(path.extname(req.file.originalname).toLowerCase());
            
            await fs.rename(tempPath, targetPath, async err => {
                let connection2;
                try {
                    connection2 = await oracle_db.getConnection(connection_attr);
                    if (err) {
                        msg = 'please try to upload the photo again';
                        let query = "delete from " + type + " where id = :id";
                        await connection2.execute(query, [user_id], {autoCommit: true});
                    } else {
                        msg = 'registration completed';
                        let query = "update " + type + " set photo_url = :targetPath where id = :id";
                        await connection2.execute(query, [targetString, user_id], {autoCommit: true});
                    }
                } catch (e) {
                    console.log('ecp11');
                    console.log(e);
                } finally {
                    try {
                        connection2.release();
                    } catch (e) {
                        console.log('exp22');
                        console.log(e);
                    }
                }
            });
        } else
            msg = 'registration completed';
        
    } catch (ex) {
        console.log(ex);
        if (ex.message.includes('unique constraint'))
            msg = 'email is already exists';
        else
            msg = 'can not connect to the server';
    } finally {
        try {
            connection.release();
        } catch (e) {
            console.log(e);
            msg = 'can not connect to the server';
        }
    }
    setTimeout(() => {
        res.render('signup', {msg: msg});
    }, 1000);
});


module.exports = router;