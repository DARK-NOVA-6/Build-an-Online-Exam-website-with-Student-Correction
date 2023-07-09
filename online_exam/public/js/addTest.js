var numberOfQues = 0;
var realNumber = 0;
var pageCourse= false;

$(document)
    .ready(()=>{
        if(!pageCourse)
            $('#title i')
                .text(courseName);
    });
$('.datePicker input')
    .datepicker({
        dateFormat: "yy-mm-dd",
        showOn: 'button',
        showAnim: 'slideDown',
        buttonText: 'Select Date',
        hideIfNoPrevNext: true,
        currentText: "Now",
        minDate: 0,
        defaultDate: 0,
        firstDay: 1,
    });

$(document).ready(
    () => {
        $('.datePicker button')
            .addClass('button')
            .css({
                'padding': '6px',
                'position': 'absolute',
                'top': '-40px',
                'right': '0px',
                'border': 'none'
            });
    }
);

$('#addQues')
    .on('click', () => addEmptyQues());


function addEmptyQues() {
    var id = realNumber;
    $('<div/>', {
        id: 'quesContainer' + id,
        class: 'quesContainer'
    })
        .prependTo('#quesList');
    
    realNumber++;
    numberOfQues++;
    
    $('#noQuestions')
        .text(numberOfQues);
    
    $('<div/>', {
        id: 'quesType' + id,
        class: 'quesType'
    })
        .append(
            $('<div/>', {
                id: 'deletionField' + id,
                class: 'deletionField'
            })
                .append(
                    $('<div/>', {
                        id: 'deleteButton' + id,
                        class: 'button deleteQuestion'
                    })
                        .on('click',
                            () => {
                                $('#quesContainer' + id)
                                    .remove();
                                numberOfQues--;
                                $('#noQuestions')
                                    .text(numberOfQues);
                            }
                        )
                        .text('Delete Question')
                ),
            
            $('<div/>', {
                id: 'quesTitleContainer' + id,
                class: 'quesTitleContainer'
            })
                .append(
                    $('<div/>', {
                        id: 'quesTypeTitle' + id,
                        class: 'quesTypeTitle'
                    })
                        .text('Select the Type of the Question:'),
                    
                    $('<select/>', {
                        id: 'quesTypeList' + id,
                        class: 'quesTypeList'
                    })
                        .attr("value", -1)
                        .on('change',
                            () => {
                                var value = $('#quesTypeList' + id).val();
                                $('#quesAnswers' + id)
                                    .children()
                                    .remove();
                                
                                if (value == '3') {
                                    $('#quesAnswers' + id)
                                        .append(createTextAnswerOption(id));
                                }
                                
                                if (value == '2') {
                                    $('#quesAnswers' + id)
                                        .append(createTrueFalseOption(id));
                                }
                                
                                if (value == '1') {
                                    $('#quesAnswers' + id)
                                        .append(createMultuipleOption(id));
                                }
                            }
                        )
                        .append(
                            $('<option/>', {
                                value: '',
                                selected: 'selected',
                                disabled: 'disabled'
                            })
                                .text('-- Select Type -- '),
                            
                            $('<option/>', {
                                value: '1',
                                class: 'listOption'
                            })
                                .text('Options'),
                            
                            $('<option/>', {
                                value: '2',
                                class: 'listOption'
                            })
                                .text('True / False'),
                            
                            $('<option/>', {
                                value: '3',
                                class: 'listOption'
                            })
                                .text('Text Answer')
                        )
                )
        )
        .appendTo('#quesContainer' + id);
    
    $('<div/>', {
        id: 'quesText' + id,
        class: 'quesText'
    })
        .append(
            $('<div/>', {
                id: 'quesTextTitle' + id,
                class: 'quesTextTitle'
            })
                .text("Type the Question Text Here:"),
            
            $('<textarea/>', {
                id: 'quesTextContent' + id,
                class: 'quesTextContent',
            })
                .css({
                    'height': $('#quesTextContent' + id)
                        .prop('scrollHeight') + 'px',
                    'overflow-y': 'hidden'
                })
                .on('input',
                    () => {
                        $textAreaQ = $('#quesTextContent' + id);
                        $textAreaQ
                            .css('height', 'auto');
                        $textAreaQ
                            .css('height',
                                $textAreaQ
                                    .prop('scrollHeight') + 'px'
                            );
                    }
                ),
        )
        .appendTo('#quesContainer' + id);
    
    $('<div/>', {
        id: 'quesAnswers' + id,
        class: 'quesAnswers'
    })
        .appendTo('#quesContainer' + id);
}


function createTextAnswerOption(id) {
    return $('<div/>', {
        id: 'textAnswer' + id,
        class: 'textAnswer'
    })
        .append(
            $('<div/>', {
                id: 'textAnswerTitle' + id,
                class: 'quesTextTitle'
            })
                .text("Type the Answer Text Here:"),
            
            $('<textarea/>', {
                id: 'textAnswerContent' + id,
                class: 'textAnswerContent',
            })
                .css({
                    'height': $('#textAnswerContent' + id)
                        .prop('scrollHeight') + 'px',
                    'overflow-y': 'hidden'
                })
                .on('input',
                    () => {
                        $textAreaA = $('#textAnswerContent' + id);
                        $textAreaA
                            .css('height', 'auto');
                        $textAreaA
                            .css('height',
                                $textAreaA
                                    .prop('scrollHeight') + 'px'
                            );
                    }
                ),
        );
}

function createTrueFalseOption(id) {
    return $('<div/>', {
        id: 'trueFalse' + id,
        class: 'trueFalse'
    })
        .append(
            $('<div/>', {
                id: 'trueOption' + id,
                class: 'optionItem'
            })
                .append($('<input/>', {
                        id: 'true' + id,
                        name: 'trueOrFalse' + id,
                        class: 'radio',
                        type: 'Radio'
                    }),
                    
                    $('<label/>', {
                        for: 'true' + id,
                        class: 'radioLabel'
                    })
                        .text('True')
                ),
            
            $('<div/>', {
                id: 'falseOption' + id,
                class: 'optionItem'
            })
                .append($('<input/>', {
                        id: 'false' + id,
                        name: 'trueOrFalse' + id,
                        class: 'radio',
                        type: 'Radio'
                    }),
                    
                    $('<label/>', {
                        for: 'false' + id,
                        class: 'radioLabel'
                    })
                        .text('False')
                )
        );
}

function createMultuipleOption(id) {
    return $('<div/>', {
        id: 'multipleOptions' + id,
        class: 'multipleOptions'
    })
        .append(
            $('<div/>', {
                id: 'addOptions' + id,
                class: 'addOptions'
            })
                .append(
                    $('<div/>', {
                        id: 'addOptionNote' + id,
                        class: 'addOptionNote'
                    })
                        .text('number of Options must be between 2 and 9 !!!'),
                    
                    $('<div/>', {
                        id: 'addOptionButton' + id,
                        class: 'addOption button'
                    })
                        .on('click',
                            () => {
                                $optionList = $('#optionsList' + id);
                                var count = $optionList
                                    .data('numberOfOptions');
                                
                                $optionList
                                    .prepend(
                                        newOption(id, count)
                                    );
                                
                                count++;
                                $optionList
                                    .data('numberOfOptions', count);
                            }
                        )
                        .text('Add Option')
                ),
            
            $('<div/>', {
                id: 'optionsList' + id,
                class: 'optionsList'
            })
                .data('numberOfOptions', 0)
        );
}

const SELECTDATE = 'Please select a Start Date!!';
const SELECTTIME1 = 'Please select a Start Time!!';
const SELECTTIME2 = 'Please select a Starting Time that is after this moment!!';
const TORF = 'one of True/False option of a question should be correct';

var myMsg = '';


function newOption(id, secId) {
    return $('<div/>', {
        id: 'option' + id + '-' + secId,
        class: 'option'
    })
        .append(
            $('<input/>', {
                id: 'checkBox' + id + '-' + secId,
                class: 'checkBox',
                type: 'checkBox'
            }),
            
            $('<input/>', {
                id: 'text' + id + '-' + secId,
                type: 'text'
            }),
            
            $('<div/>', {
                id: 'deleteOption' + id + '-' + secId,
                class: 'deleteOption button'
            })
                .on('click',
                    () => {
                        $('#option' + id + '-' + secId)
                            .remove();
                        var count = $('#optionsList' + id)
                            .data('numberOfOptions');
                        
                        $('#optionsList' + id)
                            .data('numberOfOptions', count);
                    }
                )
                .text('X')
        );
}


$('#addTest')
    .on('click',
        () => {
            if (checkData()) {
                sendData();
            } else {
                showError(myMsg);
            }
        }
    )


function checkData() {
    if ($('#startD').val() == '') {
        myMsg = SELECTDATE;
        return false;
    }
    start = $('#startT').val();
    if (start == '') {
        myMsg = SELECTTIME1;
        return false;
    }
    const date = $('#startD').datepicker('getDate');
    const ndate = new Date();
    ndate.setHours(0, 0, 0, 0);
    days = date.getDate() + (date.getMonth() * 30) + (date.getFullYear() * 365 * 30);
    ndays = ndate.getDate() + (ndate.getMonth() * 30) + (ndate.getFullYear() * 365 * 30);
    if (days == ndays) {
        
        h = new Date().getHours();
        m = new Date().getMinutes();
        timenow = m + (h * 60);
        timeselected = parseInt(start.slice(3)) + (parseInt(start.slice(0, 2)) * 60);
        if (timeselected < timenow) {
            myMsg = SELECTTIME2;
            return false;
        }
    }
    for (id = 0; id < realNumber; id++) {
        if ($('#quesTypeList' + id).val() == undefined)
            continue;
        if($('#quesTypeList' + id).val()==2) {
            otrue = $('#true' + id).prop('checked');
            oflase = $('#false' + id).prop('checked');
            if (!otrue && !oflase) {
                myMsg = TORF;
                return false;
            }
        }
    }
    
    
    return true;
}

function sendData() {
    // var fetchOptions = {
    //     method: "POST",
    //     header: new Headers({
    //         "Content-Type": "application/json",
    //     }),
    //     //cross origin mode is needed as we are not using the same domain
    //     mode: "cors"
    // }
    
    const url = "http://localhost:8080/postRequest"
    var jsonData = {}
    const date = $('#startD').datepicker('getDate');
    const day = date.getDate();
    const month = date.getMonth() + 1; // getMonth() returns month from 0 to 11
    const year = date.getFullYear();
    const str = `${day}/${month}/${year}`;
    jsonData.courseName = courseName;
    jsonData.startDate = str;
    jsonData.startTime = $('#startT').val();
    jsonData.numberOfQuestion = numberOfQues;
    jsonData.testLength = $('#testL').val();
    jsonData.correctionLength = $('#correctL').val();
    jsonData.questions = [];
    for (id = 0; id < realNumber; id++) {
        var question = {}
        if ($('#quesTypeList' + id).val() == undefined)
            continue;
        
        question.type = $('#quesTypeList' + id).val();
        question.text = $('#quesTextContent' + id).val();
        question.text = $('#quesTextContent' + id).val();
        if (question.type == 1) {
            var count = $('#optionsList' + id).data('numberOfOptions');
            question.options = [];
            var order = 0;
            for (secId = 0; secId < count; secId++) {
                var option = {};
                if ($('#text' + id + '-' + secId).val() == undefined)
                    continue;
                
                option.text = $('#text' + id + '-' + secId).val();
                option.checked = $('#checkBox' + id + '-' + secId).prop('checked');
                option.order = order;
                order++;
                question.options.push(option);
            }
        }
        
        if (question.type == 2) {
            question.trueFlase = $('#true' + id).prop('checked');
        }
        
        if (question.type == 3) {
            question.textAnswer = $('#textAnswerContent' + id).val();
        }
        
        jsonData.questions.push(question);
    }
    
    // fetchOptions.body = JSON.stringify(jsonData);
    console.log(jsonData);
    $.post('http://127.0.0.1:8888/post/add-test', jsonData, function (res_data, status) {
        showSuccess();
        // console.log('sent. ..') ;
        // console.log(status.status) ;
        // console.log(res_data);
    }).fail(e => {
        showError(e.responseJSON.msg);
        // console.log();
        // console.log('fail...');
    });
}


function showError(msg) {
    buildPopup(false);
    insertContent(msg);
}

function showSuccess() {
    buildPopup(false);
    insertContent('Test Added Successfully.');
    
}