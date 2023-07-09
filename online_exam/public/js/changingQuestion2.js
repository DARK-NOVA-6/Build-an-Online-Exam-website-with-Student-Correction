function changeQues(val) {
    if (val >= 1 && val <= totques) {
        currQues = val;
        $("#currQues")
            .text(currQues);
    }
    setCookie('curQ', currQues);
    buildList();
    buildQuestion();
    buildCorrectionOption();
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
    disableOp = true;
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
    if (questions[currQues].type == 2 || questions[currQues].type == 3) {
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
                                type: (questions[currQues].type == 2) ? 'radio' : 'checkbox',
                                name: (questions[currQues].type == 2) ? 'tf' : '',
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
    } else if (questions[currQues].type == 1) {
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
                    ),

                    $('<br/>')
                )
            );
    }
}

function buildCorrectionOption() {
    $('#quesMark')
        .empty();
    var select = false;
    if (questions[currQues].type == 2 || questions[currQues].type == 3) {
        if (getSelectedOptions().length > 0)
            select = true;
    }
    if (questions[currQues].type == 1) {
        if (questions[currQues].answer.length > 0)
            select = true;
    }
    $('<div/>', {
            id: 'CorrOption',
            class: 'CorrOption'
        })
        .append(
            $('<div/>', {
                class: 'someLabel'
            })
            .text((select) ? 'Select your Correction:' : "This Question don't has an Answer"),

            $('<select/>', {
                id: 'desion',
                class: 'desion',
                value: questions[currQues].correction,
                disabled: examFinished||!select,
            })
            .on('change',
                () => {
                    var value = $('#desion').val();
                    changeCorrect(value);
                    sendQuery(value);
                }
            )
            .append(
                $('<option/>', {
                    value: '0',
                    selected: true,
                    disabled: 'disabled',
                })
                .text('-- Select Correction Desion -- '),

                $('<option/>', {
                    value: '1',
                    class: 'listOption button'
                })
                .text('Approve'),

                $('<option/>', {
                    value: '2',
                    class: 'listOption button'
                })
                .text('Disapprove'),

                $('<option/>', {
                    value: '3',
                    class: 'listOption'
                })
                .text('No Opinon')
            )
        )
        .appendTo('#quesMark');

    $('#desion')
        .children()
        .each(
            (index, child) => {
                if ($(child).attr('value') == questions[currQues].correction) {
                    $(child).attr('selected', true);
                }
            }
        )

}



function changeCorrect(value) {
    if (questions[currQues].correction == 0)
        if (value != 0)
            nQCLeft--;
    $('#nQuesLeft')
        .text(nQCLeft);
    questions[currQues].correction = value;
}

function sendQuery(value){
    console.log(questions[currQues].id + " " +value);
    const data = {id: questions[currQues].id, validation: value};
    $.post('http://127.0.0.1:8888/test/update-correct', data, function (res) {
        console.log(res);
    });
}