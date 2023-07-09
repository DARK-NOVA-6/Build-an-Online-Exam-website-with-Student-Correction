// alert('start');
const url_add_test = "http://127.0.0.1:8888/test/add";
const url_enter_test = "http://127.0.0.1:8888/test/enter";
const url_delete_test = "http://127.0.0.1:8888/test/delete";

const test_data = {
    courseName: "math",
    teacherId: "1",
    startDate: "28/6/2022",
    startTime: "17:04:00",
    numberOfQuestion: 3,
    testLength: "10",
    correctionLength: "30",
    questions: [
        {type: "2", text: "true false question", trueFlase: true},
        {
            type: "1", text: "multi options question",
            options: [
                {text: "opt1", checked: true, order: 0},
                {text: "opt2", checked: true, order: 1},
                {text: "opt3", checked: false, order: 2}
            ]
        },
        {type: "3", text: "single answer quest", textAnswer: "correct answer"}
    ]
}

const customHeaders = {
    "Content-Type": "application/json",
}

// $.post(url_add_test, test_data, function (data) {
//     console.log('dsd');
// });
//
// $.post(url_enter_test, {username: 'admin.dasdmin' , test_id: '52'}, function (data) {
//     console.log('dsd');
// });

// $.post(url_delete_test, {username: '' , test_id: '55'}, function (data) {
//     console.log('dsd');
// });

$.post('http://127.0.0.1:8888/user/auth', {test_id: '14'}, function (data) {
    console.log('trying');
    console.log(data) ;
});



// alert('end')