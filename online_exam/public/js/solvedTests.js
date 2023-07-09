var studentId = getCookie('studentId');
var students = [{
        name: 'test1',
        id: 0
    },
    {
        name: 'tesddt1',
        id: 1
    },
    {
        name: 'test1241241',
        id: 2
    },
    {
        name: 't1e1c12c1st1',
        id: 3
    },
    {
        name: 'test12f1f1',
        id: 4
    },
];
var studentCount = 0;
var testId = getCookie('testId');
var testName = getCookie('testName');
var testName = 'bar';
var testId = '4';

$(document)
    .ready(
        () => {
            //getCourses();
            $('#title2 i').text(testName);
            for (i = 0; i < students.length; i++) {
                $('#tests').append(newStudent(students[i]));
            }
        }
    )


function getStudents() {
    url = '';
    $.get(url, { 'testId': testId, 'studentId': studentId },
        function(data) {
            students = data.students;
        }
    );
}


function newStudent(student) {
    studentCount++;
    return $('<div/>', {
            id: 'testContainer' + studentCount,
            class: 'testContainer'
        })
        .append(
            $('<div/>', {
                id: 'test' + studentCount,
                class: 'test'
            })
            .text(student.name),


            $('<div/>', {
                id: 'testControler' + studentCount,
                class: 'testControler'
            })
            .append(
                $('<div/>', {
                    id: 'correctB' + studentCount,
                    class: 'correctB button'
                })
                .on('click',
                    () => {
                        correct(student.id);
                    }
                )
                .text('Correct')
            ),

        );
}



function correct(testId) {
    setCookie('solvedTestId', testId);
    location.href = './testCorrection.html';
}