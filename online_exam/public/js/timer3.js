var courseName = '';


function startTimer() {
    $("#totques").text(totques);
    $("#duration").text(duration);
    $("#cDuration").text(cDuration);

    var START = new Date(startDate).getTime();
    var delta = duration * 60000 + 1;
    var END = START + delta;
    // timer = setInterval(
    //     () => {
    //         var diff = Math.floor(
    //             (END - new Date().getTime()) / 1000
    //         );
    //         if (diff < 0) {
    //             clearInterval(timer);
    //             buildPopup(false);
    //             insertContent('Times Up ... Test Ended');
    //             diff = 0;
    //         }
    //         var h = Math.floor(diff / (60 * 60));
    //         var m = Math.floor(diff / 60) % 60;
    //         var s = diff % 60;

    //         function getChar(x) {
    //             if (x >= 10) {
    //                 return x;
    //             } else {
    //                 return "0" + x;
    //             }
    //         }
    //         $("#timerBar").text(
    //             getChar(h) + ":" +
    //             getChar(m) + ":" +
    //             getChar(s)
    //         );
    //     },
    //     1
    // );
    day = (new Date()).getDay();
    mon = (new Date()).getMonth();
    year = (new Date()).getFullYear();
    hour = (new Date()).getHours();
    min = (new Date()).getMinutes();
    sec = (new Date()).getSeconds();

    function getChar(x) {
        if (x >= 10) {
            return x;
        } else {
            return "0" + x;
        }
    }

    date = year + '/' + getChar(day) + '/' + getChar(mon);
    date += ' ' + getChar(hour) + ':';
    date += getChar(min) + ':' + getChar(sec);
    $("#timerBar")
        .css({
            'font-size': '17pt',
            'margin-left': '-20px'
        })
        .text(date);
    // if (examFinished) {
    //     $("#timerBar").text(fTime);
    //     doIfExamFinished();
    // }
}

function doIfExamFinished() {
    clearInterval(timer);
    $('#submitB')
        .text('Submited')
        .css({
            'background-color': 'var(--c11)',
            'color': 'var(--c6)'
        });
}

function askToEnd() {
    window.location.href =
        'http://127.0.0.1:8888/test/' + courseName;
}

function finishExam() {
    examFinished = true;
    doIfExamFinished();
    setCookie('examFinished', true);
    setCookie('fTime', $('#timerBar').text());
    buildQuestion();
}

$(document)
    .ready(
        () => {
            $(".footer")
                .css('margin-left', (-121) + 'px');
        }
    )