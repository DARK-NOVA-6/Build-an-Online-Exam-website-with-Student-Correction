const connection_attr = require("../config/db").connection_attr;
const oracle_db = require("oracledb");

const verifyCourse = async (req, res, next) => {
    console.log('course check');
    let connection, result = 0;
    try {
        connection = await oracle_db.getConnection(connection_attr);
        const query = 'select count(*) from course where course.title = :course';
        const result_db = await connection.execute(query, [req.params.course]);
        result = result_db.rows [0][0];
    } catch (ex) {
    } finally {
        try {
            connection.release();
        } catch (e) {
        }
    }
    if (result === 0)
        return res.redirect('http://127.0.0.1:8888/course');
    console.log('course check + .. ' + result);
    return next();
};


module.exports = verifyCourse;