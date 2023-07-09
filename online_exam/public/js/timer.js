function startTimer() {
    $("#totques").text(totques);
    $("#nQuesLeft").text(nQuesLeft);
    $("#currQues").text(currQues);
    
    var START = new Date(startDate).getTime();
    var delta = duration * 60000 + 1;
    var END = START + delta;
    timer = setInterval(
        () => {
            var diff = Math.floor(
                (END - new Date().getTime()) / 1000
            );
            if (diff < 0) {
                clearInterval(timer);
                buildPopup(false,null,false,()=>{
                    window.location.href = 'http://127.0.0.1:8888/test/'+courseName;
                },'Ok');
                insertContent('Times Up ... Test Ended');
                diff = 0;
            }
            var h = Math.floor(diff / (60 * 60));
            var m = Math.floor(diff / 60) % 60;
            var s = diff % 60;
            
            function getChar(x) {
                if (x >= 10) {
                    return x;
                } else {
                    return "0" + x;
                }
            }
            
            $("#timerBar").text(
                getChar(h) + ":" +
                getChar(m) + ":" +
                getChar(s)
            );
        },
        1
    );
    $("#timerBar").text(fTime);
    if (examFinished) {
        doIfExamFinished();
    }
}

function doIfExamFinished() {
    // clearInterval(timer);
    $('#submitB')
        .text('Submited')
        .css({
            'background-color': 'var(--c11)',
            'color': 'var(--c6)'
        });
}

function askToEnd() {
    if (!examFinished) {
        
        buildPopup(true, finishExam);
        insertContent(['are you sure you want to SUBMIT ? <br/>',
            'if you submit now you can not change your Answers later']);
    }
}

function finishExam() {
    examFinished = true;
    doIfExamFinished();
    buildQuestion();
    $.post('http://127.0.0.1:8888/test-submit/' + testId, {test: 'solved_test'}, function (res) {
        showSuccess2();
    });
}

function showSuccess2(){
    buildPopup(false,()=>{},false,()=>{
        window.location.href = 'http://127.0.0.1:8888/test/'+courseName;
    },'Ok');
    insertContent('Test Submitted Successfully');
}

$(document)
    .ready(
        () => {
            $(".footer")
                .css('margin-left', (-121) + 'px');
        }
    )