const jwt = require("jsonwebtoken");

const verifyToken = async (req, res, next) => {
    const token = req.cookies.token;
    if (!token)
        return res.redirect('/');
    try {
        const data = await jwt.verify(token, '12345');
        const username = data.username;
        const role = data.role;
        const photo_url = data.photo_url;
        res.cookie('username', username, {expires: new Date(Date.now() + 1000 * 60 * 60)});
        res.cookie('role', role, {expires: new Date(Date.now() + 1000 * 60 * 60)});
        res.cookie('token', token, {expires: new Date(Date.now() + 1000 * 60 * 60)});
        if (photo_url !== null)
            res.cookie('photoLink', photo_url, {expires: new Date(Date.now() + 1000 * 60 * 60)});
        if (req.cookies.username !== username || req.cookies.role !== role)
            res.redirect('/');
    } catch (err) {
        res.cookie('username', '', {expires: new Date(0)});
        res.cookie('role', '', {expires: new Date(0)});
        res.cookie('token', '', {expires: new Date(0)});
        return res.redirect('/');
    }
    return next();
};


module.exports = verifyToken;