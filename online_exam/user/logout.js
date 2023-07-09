const express = require("express");
const router = express.Router();

router.get('/', async (req, res) => {
    res.cookie('username', '', {expires: new Date(0)});
    res.cookie('role', '', {expires: new Date(0)});
    res.cookie('token', '', {expires: new Date(0)});
    res.cookie('photoLink', '', {expires: new Date(0)});
    res.redirect('/');
});


module.exports = router;