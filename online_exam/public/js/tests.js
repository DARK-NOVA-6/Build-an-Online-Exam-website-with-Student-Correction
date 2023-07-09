var tests = [];
var testCount = 0;
var testID = -1;
$(document)
    .ready(
        () => {
            url = 'http://127.0.0.1:8888/fetch/test/teacher/' + courseName;
            $.get(url, function (data) {
                $('#title2 i').text(courseName);
                for (i = 0; i < data.length; i++) {
                    $('#tests').append(newTest({name: 'test-' + data[i].id, id: data[i].id}));
                }
                tests = data;
            });
        }
    );


function newTest(test) {
    testCount++;
    return $('<div/>', {
        id: 'testContainer' + testCount,
        class: 'testContainer'
    })
        .append(
            $('<div/>', {
                id: 'test' + testCount,
                class: 'testB button'
            })
                .on('click',
                    () => {
                        //post
                        window.location.href = 'http://127.0.0.1:8888/test/' + courseName + '/' + test.id
                    }
                )
                .text(test.name),
            
            $('<div/>', {
                id: 'deleteTest' + testCount,
                class: 'deleteTestB button'
            })
                .on('click',
                    () => {
                        askToDelete(test.id);
                    }
                )
                .text('X')
        );
}

$('#addNTest')
    .on('click',
        () => {
            window.location.href = 'http://127.0.0.1:8888/add-test/' + courseName;
        }
    );

function askToDelete(testId) {
    testID = testId;
    buildPopup(true, deleteTest);
    insertContent('Are you sure you want to Delete test ' + courseName + '-' + testId + ' ?');
}

function deleteTest() {
    tryDelete(testID);
}


function tryDelete(testId) {
    $.post('http://127.0.0.1:8888/delete-test/' + testId, function (res) {
        showSuccess(testId);
    }).fail(err => console.log(err)).catch(e => {
        showError(e.responseJSON.msg);
    });
}

function showSuccess(id) {
    buildPopup(false, () => {
    }, false, () => {
        window.location.href = window.location.href;
    });
    insertContent('Test ' + courseName + '-' + id + ' deleted Successfully');
}