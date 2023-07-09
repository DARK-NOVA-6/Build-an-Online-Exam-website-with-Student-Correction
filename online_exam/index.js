const express = require("express");
const path = require("path");
const bodyParser = require('body-parser');
const urlencoded = bodyParser.urlencoded({extended: false});
const register_user = require("./user/register");
const login_user = require("./user/login");
const logout_user = require("./user/logout");
const add_test = require("./test/createTest");
const take_test = require("./test/takeTest");
const correct_test = require("./test/correctTest");
const delete_test = require("./test/deleteTest");
const list_test = require("./test/testByCourse");
const submit_test = require("./test/submitSolve") ;
const update_answer = require('./test/updateSolvedQues');
const update_correct = require('./test/updateCorrectedQues');

const full_test = require("./test/getById");
const user_auth = require("./user/auth");
const course_check = require("./course/check");
const test_check = require("./test/check");
const user_get = require('./user/info');
const username_check = require("./user/availableUsername");
const course = require("./course/index");

const app = express();
const cookieParser = require('cookie-parser');
app.use(cookieParser());


app.use(express.json());
app.use(express.urlencoded());
app.use(express.static(__dirname));
app.use(urlencoded);

app.use('/sign-up', register_user);
app.use('/user/check', username_check);
app.use('/login', login_user);
app.use('/user/auth', user_auth);
app.use('/logout', logout_user);
app.use('/post/add-test', add_test);
app.use('/test/enter', take_test);
app.use('/test/enter-correct', correct_test);
app.use('/test/update-answer', update_answer);
app.use('/test/update-correct', update_correct);
app.use('/test-submit' , submit_test);
app.use('/delete-test', delete_test);
app.use('/fetch/test', list_test);
app.use('/fetch/full-test', full_test);
app.use('/fetch/course', course);
app.use('/fetch/user-me', user_get);

app.set('view engine', 'ejs');


app.get('/sign-up', function (req, res) {
    if (req.cookies.token)
        res.redirect('/');
    res.render('signup');
});

app.get('/login', function (req, res) {
    if (req.cookies.token)
        res.redirect('/');
    res.render('login');
});

app.get('/', function (req, res) {
    if (req.cookies.username)
        res.redirect('http://127.0.0.1:8888/course/');
    else
        res.render('home');
});

app.get('/course', user_auth, function (req, res) {
    res.render('courses');
});


app.get('/test/:course', user_auth, course_check, function (req, res) {
    if (req.cookies.role === 'teacher')
        res.render('allTest', {course: req.params.course});
    else {
        if (req.query.take === 'true')
            res.render('takeTests', {course: req.params.course});
        else if (req.query.take === 'false')
            res.render('correctTests', {course: req.params.course});
        else if (typeof req.query.take !== 'undefined')
            res.redirect('http://127.0.0.1:8888/test/' + req.params.course);
        else
            res.render('takeOrCorrect', {course: req.params.course});
    }
});

app.get('/test/:course/:id', user_auth, course_check, test_check, function (req, res) {
    if (req.cookies.role === 'teacher') {
        console.log('rendering....');
        res.render('testDescription', {course: req.params.course, test_id: req.params.id});
    } else {
        if (req.query.take === 'true') {
            res.render('test', {course: req.params.course, test_id: req.params.id});
        } else if (req.query.take === 'false') {
            res.render('testC', {course: req.params.course, test_id: req.params.id});
        } else {
            res.redirect('http://127.0.0.1:8888/test/' + req.params.course);
        }
    }
});

app.get('/test-correct/:solved_id', user_auth, function (req, res) {
    if (req.cookies.role === 'teacher')
        return res.redirect('/');
    res.render('testCorrection', {solved_id: req.params.solved_id});
});


app.get('/add-test/:course', user_auth, function (req, res) {
    if (req.cookies.role !== 'teacher')
        res.redirect('/');
    else
        res.render('addTest', {course: req.params.course});
});

app.get('/profile', user_auth, async function (req, res) {
    res.render('profile');
});


app.listen(8888, () => console.log("server is running on 8888"));
