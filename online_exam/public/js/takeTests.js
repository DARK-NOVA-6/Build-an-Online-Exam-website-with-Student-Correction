var studentId = getCookie('userId');
var testCount = 0;
var tests = [];

$(document)
    .ready(
        () => {
            $.get('http://127.0.0.1:8888/fetch/test/student/' + courseName + '?take=true', function (data) {
                tests = [];
                for (i = 0; i < data.length; i++) {
                    tests.push({
                        id: data[i].id,
                        name: courseName + '-' + data[i].id,
                        startTime: data [i].start_time,
                        duration: data[i].duration,
                        cDuration: data[i].corr_duration
                    });
                }
                console.log(data);
                $('#title2 i')
                    .text(courseName);
                runningGroup = [];
                beforeStartGroup = [];
                allTest = 0;
                for (i = 0; i < tests.length; i++) {
                    console.log(new Date(tests[i].startTime));
                    console.log(new Date());
                    var running = ((new Date() - new Date(tests[i].startTime)) > 0);
                    if (running)
                        runningGroup.push(tests[i]);
                    else
                        beforeStartGroup.push(tests[i]);
                }
                
                runningGroup = sort(runningGroup, true);
                beforeStartGroup = sort(beforeStartGroup, false);
                
                for (i = 0; i < runningGroup.length; i++) {
                    $('#tests')
                        .append(newTest(runningGroup[i]));
                    
                    setTimer('time' + (allTest + 1), runningGroup[i]);
                    allTest++;
                }
                
                for (i = 0; i < beforeStartGroup.length; i++) {
                    $('#tests')
                        .append(newTest(beforeStartGroup[i]));
                    
                    setTimer('time' + (allTest + 1), beforeStartGroup[i]);
                    allTest++;
                }
                
                if (tests.length == 0)
                    noTests();
            });
        }
    )


function sort(array, run) {
    for (i = 0; i < array.length - 1; i++) {
        var START = new Date(array[i].startTime).getTime();
        var START2 = new Date(array[i + 1].startTime).getTime();
        
        var delta = array[i].duration * 60000 + 1;
        var END = START + delta;
        var delta2 = array[i + 1].duration * 60000 + 1;
        var END2 = START2 + delta2;
        
        if (run) {
            if (END2 < END) {
                tmp = array[i];
                array[i] = array[i + 1];
                array[i + 1] = tmp;
            }
        } else {
            if (START2 < START) {
                tmp = array[i];
                array[i] = array[i + 1];
                array[i + 1] = tmp;
            }
        }
    }
    return array;
}

function setTimer(id, test) {
    var START = new Date(test.startTime).getTime();
    var running = ((new Date() - new Date(test.startTime)) > 0);
    var delta = test.duration * 60000 + 1;
    var END = START + delta;
    
    if (!running)
        END = START;
    
    $('#' + id).data('timer',
        setInterval(
            () => {
                var diff = Math.floor(
                    (END - new Date().getTime()) / 1000
                );
                if (diff < 0) {
                    clearInterval($('#' + id).data('timer'));
                    buildPopup(true, refresh);
                    insertContent('Refresh The Page Please');
                    diff = 0;
                }
                
                if (diff == 0)
                    $("#" + id)
                        .css('color', 'darkred');
                else if (diff < 5 * 60)
                    $("#" + id)
                        .css('color', 'red');
                else $("#" + id)
                        .css('color', 'green');
                
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
                
                $("#" + id)
                    .text(
                        getChar(h) + ":" +
                        getChar(m) + ":" +
                        getChar(s)
                    );
            },
            1
        )
    );
}

function refresh() {
    window.location.href = window.location.href;
}


function newTest(test) {
    var START = new Date(test.startTime).getTime();
    var delta = test.duration * 60000 + 1;
    var END = START + delta;
    running = ((new Date().getTime() - START) > 0);
    testCount++;
    
    return $('<div/>', {
        id: 'testContainer' + testCount,
        class: 'testContainer'
    })
        .append(
            $('<div/>', {
                id: 'testC' + testCount
            })
                .append(
                    $('<div/>', {
                        id: 'test' + testCount,
                        class: 'test'
                    })
                        .text(test.name),
                    
                    $('<div/>', {
                        id: 'testDuration' + testCount,
                        class: 'testDuration'
                    })
                        .append(
                            $('<span/>', {
                                id: 'timeLabel' + testCount
                            })
                                .text(running ? 'Running Time: ' : 'Test Start in: '),
                            
                            $('<span/>', {
                                id: 'time' + testCount,
                                class: 'time'
                            })
                        )
                ),
            
            
            $('<div/>', {
                id: 'testControler' + testCount,
                class: 'testControler'
            })
                .append(
                    $('<div/>', {
                        id: 'takeB' + testCount,
                        class: 'takeB button'
                    })
                        .on('click',
                            () => {
                                take(test.id);
                            }
                        )
                        .text('Take')
                ),
        );
    
}


function noTests() {
    $('#tests')
        .append(
            $('<div/>', {
                class: 'noTests'
            })
                .append(
                    'There is No Tests Availabe Now to Take <br/> ' +
                    'Please Try Again Later <b><h1>:(</h1></b>'
                )
        )
}

function take(testId) {
    $.post('http://127.0.0.1:8888/test/enter/' + testId, function (res) {
        location.href = 'http://127.0.0.1:8888/test/' + courseName + '/' + testId + '?take=true';
    }).fail(e => {
        showError(e.responseJSON.msg);
    });
}