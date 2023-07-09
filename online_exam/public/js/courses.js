var courses = [];
var courseCount = 0;
var role;
$(document)
    .ready(
        () => {
            pageCourse= true;
            url = 'http://127.0.0.1:8888/fetch/course/';
            $.get(url, function (data) {
                role = getCookie('role');
                for (i = 0; i < data.length; i++) {
                    $('#courses').append(newCourse(data[i]));
                }
                courses = data;
            });
        }
    )


function newCourse(courseName) {
    courseCount++;
    return $('<div/>', {
        id: 'courseContainer' + courseCount,
        class: 'courseContainer'
    })
        .append(
            $('<div/>', {
                id: 'course' + courseCount,
                class: 'courseB button'
            })
                .on('click',
                    e => {
                        window.location.href = 'http://127.0.0.1:8888/test/' + courseName;
                    }
                )
                .text(courseName)
        );
}