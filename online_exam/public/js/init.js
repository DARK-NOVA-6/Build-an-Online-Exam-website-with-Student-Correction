var startDate;
var duration;
var cDuration;
var questions;
var correction = [{}];
var nSolved;
var nCorrect;
var currQues;
var totques;
var nQuesLeft;
var nQCLeft;
var newMinutes;
var examFinished;
var fTime;
// $(document).ready(async () => {
//     await teacherTest();
// });

async function teacherTest() {
    await initialGet('http://127.0.0.1:8888/fetch/full-test/teacher/' + testId);
}

async function studentSolveTest() {
    await initialGet('http://127.0.0.1:8888/fetch/full-test/student/' + testId + '?take=true');
}

async function studentCorrectTest() {
    await initialGet('http://127.0.0.1:8888/fetch/full-test/student/' + testId + '?take=false');
}

function initialGet(url) {
    $.get(url, async function (data) {
        initialData(data);
        setTimeout(() => {
            initial();
        }, 100);
    });
}


function initialData(data) {
    startDate = data.description.start_time;
    duration = data.description.test_duration;
    cDuration = data.description.correcting_duration;
    examFinished = data.description.finished ;
    questions = data.questions;
}

function initial() {
    console.log(questions);
    correction = [{}];
    nSolved = 0;
    nCorrect = 0;
    for (q in questions) {
        if (q == 0)
            continue;
        
        if (questions[q].correction != 0)
            nCorrect++;
        
        solved = false;
        if (questions[q].type == 2 || questions[q].type == 3)
            for (o in questions[q].options)
                solved |= questions[q].options[o].isSelected;
        
        if (questions[q].type == 1)
            if (questions[q].answer.length > 0)
                nSolved++;
        
        if (solved)
            nSolved++;
        
    }
    currQues = getCookie('curQ');
    if(currQues===undefined)
        currQues = 1;
    totques = questions.length - 1;
    nQuesLeft = totques - nSolved;
    nQCLeft = totques - nCorrect - nQuesLeft;
    // newMinutes = startDate.getMinutes() - 5;
    // startDate.setMinutes(newMinutes);
    fTime = '';
}
