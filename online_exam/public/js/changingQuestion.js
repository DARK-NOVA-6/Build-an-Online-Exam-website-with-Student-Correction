function changeQues(val) {
    if (val >= 1 && val <= totques) {
        currQues = val;
        $("#currQues")
            .text(currQues);
    }
    setCookie('curQ', currQues);
    buildList();
    buildQuestion();
}

function buildList() {
    $("#list")
        .empty();
    start = Math.max(1, currQues - 2);
    end = Math.min(totques, currQues + 2);
    if (end - start + 1 < 5) {
        if (start == 1) {
            end = Math.min(5, totques);
        } else {
            start = Math.max(1, totques - 5);
        }
    }
    for (i = start; i <= end; i++) {
        $("#list")
            .append(
                $('<div/>', {
                    id: i,
                    class: 'pageNumber'
                })
                .on('click',
                    e => {
                        var x = parseInt(e.currentTarget.id);
                        if (x != currQues)
                            changeQues(x);
                    }
                )
                .append(
                    (i == currQues) ?
                    $('<b/>')
                    .append(i) :
                    $('<span/>')
                    .append(i)
                )
            );
    }

    function hide(id) {
        $('#' + id)
            .attr("hidden", '');
    }

    function unhide(id) {
        $('#' + id)
            .removeAttr("hidden");
    }

    if (currQues == 1) {
        hide("prev");
        hide("first");
    } else {
        unhide("prev");
        unhide("first");
    }
    if (currQues == totques) {
        hide("last");
        hide("next");
    } else {
        unhide("last");
        unhide("next");
    }
}

function buildQuestion() {
    disableOp = false;
    if (examFinished)
        disableOp = true;
    $('#quesNumb')
        .text(currQues + ':');
    $('#textQuesSec p')
        .empty();
    $('#textQuesSec p')
        .append(questions[currQues].text);
    $('#optionsSec')
        .empty();
    if (questions[currQues].type === 2 || questions[currQues].type === 3) {
        for (i = 1; i < questions[currQues].options.length; i++) {
            $('#optionsSec')
                .append(
                    $('<div/>', {
                        class: 'radWthLab'
                    })
                    .append(
                        $('<label/>', {
                            class: 'choice',
                            for: 'opt' + questions[currQues].options[i].order
                        })
                        .append(questions[currQues].options[i].text)
                        .append(
                            $('<input/>', {
                                type: (questions[currQues].type === 2) ? 'radio' : 'checkbox',
                                name: (questions[currQues].type === 2) ? 'tf' : '',
                                disabled: disableOp,
                                value: 'opt' + questions[currQues].options[i].order,
                                id: 'opt' + questions[currQues].options[i].order
                            })
                            .prop('checked', (questions[currQues].options[i].isSelected)),

                            $('<span/>', {
                                class: 'checkmark'
                            })
                        ),

                        $('<br/>')
                    )
                );
        }
    } else if (questions[currQues].type === 1) {
        $('#optionsSec')
            .append(
                $('<div/>', {
                    class: 'textInputAnswer'
                })
                .append(
                    $('<div/>', {
                        class: 'textType'
                    })
                    .text('Type your answer here:'),

                    $('<textarea/>', {
                        disabled: disableOp,
                        id: 'textAnswerContent',
                        class: 'textAnswerContent',
                    })
                    .css({
                        'height': $('#textAnswerContent')
                            .prop('scrollHeight') + 'px',
                        'overflow-y': 'hidden'
                    })
                    .val(questions[currQues].answer)
                        .on('input',
                            () => {
                                $textArea = $('#textAnswerContent');
                                $textArea
                                    .css('height', 'auto');
                                $textArea
                                    .css('height',
                                        $textArea
                                            .prop('scrollHeight') + 'px'
                                    );
                            }
                        )
                        .change(
                            () => {
                                console.log('khra');
                                console.log(questions[currQues].answer);
                                const newS = $('#textAnswerContent')
                                    .val();
                                if (questions[currQues].answer.length === 0)
                                    if (newS.length !== 0)
                                        nQuesLeft--;
            
            
                                if (questions[currQues].answer.length !== 0)
                                    if (newS.length === 0)
                                        nQuesLeft++;
            
                                changeAnswer('textAnswerContent');
                                sendQueryUpdateAnswer(newS);
                                $("#nQuesLeft").text(nQuesLeft);
                            }
                        ),

                    $('<br/>')
                )
            );
    }
}



function setCookie(cname, cvalue) {
    document.cookie = cname + "=" + cvalue + ";";
}