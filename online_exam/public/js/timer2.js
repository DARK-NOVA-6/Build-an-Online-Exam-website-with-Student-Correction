function startTimer() {
    $("#totques").text(totques);
    $("#nQuesLeft").text(nQCLeft);
    $("#currQues").text(currQues);
    
    var START = new Date(startDate).getTime();
    var delta = duration * 60000 + 1;
    var END = START + delta;
    delta = cDuration * 60000 + 1;
    END = END + delta;
    timer = setInterval(
        () => {
            var diff = Math.floor(
                (END - new Date().getTime()) / 1000
            );
            if (diff < 0) {
                clearInterval(timer);
                buildPopup(false,null,false,()=>{
                    window.location.href = 'http://127.0.0.1:8888/course';
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
    if (examFinished) {
        $("#timerBar").text(fTime);
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
        'if you submit now you can not change your Correction later']);
    }
}

function finishExam() {
    examFinished = true;
    doIfExamFinished();
    setCookie('examFinished', true);
    setCookie('fTime', $('#timerBar').text());
    buildQuestion();
    buildCorrectionOption();
    $.post('http://127.0.0.1:8888/test-submit/' + testId, {test: 'corrected_test'}, function (res) {
        buildPopup(false,null,false,()=>{
            window.location.href = 'http://127.0.0.1:8888/course';
        },'Ok');
        insertContent('your Correction Submitted successfully');
    });
}

$(document)
    .ready(
        () => {
            $(".footer")
                .css('margin-left', (-121) + 'px');
        }
    )