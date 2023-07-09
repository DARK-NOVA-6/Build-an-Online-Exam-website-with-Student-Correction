const express = require("express");
const connection_attr = require("../config/db").connection_attr;
const oracle_db = require("oracledb");
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");
const router = express.Router();

router.post('/', async (req, res) => {
    if (req.cookies.token)
        return res.redirect('/');
    let connection, logged = false, error = '';
    try {
        connection = await oracle_db.getConnection(connection_attr);
        const username = req.body.username;
        const password = req.body.password;
        const binds = [
            username
        ];
        for (const role of ['teacher', 'student']) {
            const query = "select password, photo_url from " + role + " where username = :username";
            const hashed_password = await connection.execute(query, binds);
            if (hashed_password.rows[0]) {
                const checked = await bcrypt.compare(password, hashed_password.rows[0][0]);
                if (checked === true) {
                    const data = {
                        username: username,
                        role: role,
                        photo_url : hashed_password.rows[0][1]
                    };
                    const secret = '12345';
                    console.log(hashed_password.rows[0][1] + ' ... photo');
                    const token = await jwt.sign(data, secret, {expiresIn: '2h'});
                    res.cookie('role', role, {expires: new Date(Date.now() + 1000 * 60 * 60)})
                        .cookie('username', username, {expires: new Date(Date.now() + 1000 * 60 * 60)})
                        .cookie('token', token, {expires: new Date(Date.now() + 1000 * 60 * 60)})
                        .status(200);
                    if (hashed_password.rows[0][1] !== null)
                        res.cookie('photoLink', hashed_password.rows[0][1], {expires: new Date(Date.now() + 1000 * 60 * 60)});
                    logged = true;
                    break;
                }
            }
        }
    } catch (ex) {
        error = 'please try again later';
    } finally {
        try {
            connection.release();
        } catch (e) {
            error = 'please try again later';
        }
    }
    if (!logged) {
        error = 'username and password do not match';
    }
    if (error.length > 0)
        res.render('login', {error: error});
    else
        res.redirect('/course');
});


module.exports = router;