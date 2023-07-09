const connection_attr = require("../config/db").connection_attr;
const oracle_db = require("oracledb");

const verifyTest = async (req, res, next) => {
    console.log('test');
    let connection, result = 0;
    try {
        connection = await oracle_db.getConnection(connection_attr);
        const query = 'select count(*) from test, course where course.title = :course' +
            ' and course.id = test.course_id' +
            ' and test.id = :id';
        const result_db = await connection.execute(query, [req.params.course, req.params.id]);
        console.log([req.params.course, req.params.id]);
        result = result_db.rows [0][0];
        console.log(result);
    } catch (ex) {
    } finally {
        try {
            connection.release();
        } catch (e) {
        }
    }
    if (result === 0)
        return res.redirect('http://127.0.0.1:8888/test/' + req.params.course);
    return next();
};


module.exports = verifyTest;