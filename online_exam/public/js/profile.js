var isStudent = true;
var fName;
var lName;
var userName;
var photoLink2 ;
// var photoLink = '../../user/uploads/image/60.jpg';
// var photoLink = '../4Q9q1TI.png';
var points;

$(document)
    .ready(
        async () => {
            $.get('http://127.0.0.1:8888/fetch/user-me',
                function (data) {
                    fName = data.first_name;
                    lName = data.last_name;
                    userName = data.username;
                    photoLink2 = data.photo_url || '../public/icon/accTypAdmin.svg';
                    if (data.role === 'student') {
                        points = data.points || 0;
                        isStudent = true;
                    } else {
                        isStudent = false;
                    }
                    createFields();
                    displayData();
                }
            );
        }
    );


function displayData() {
    $('#datafnameL')
        .text(fName);
    $('#datalnameL')
        .text(lName);
    $('#datausernameL')
        .text(userName);
    $('#photoContainerphotoDis img')
        .attr('src', photoLink2);
    if (isStudent) {
        $('#datapointsF')
            .text(points);
    }
}


function createFields() {
    $('<div/>', {
        id: 'firstCol',
    })
        .append(
            createTFields('fnameL', 'First Name'),
            createTFields('lnameL', 'Last Name'),
            createTFields('usernameL', 'User Name'),
        )
        .appendTo('#mainProfile');
    
    $('<div/>', {
        id: 'secondCol',
    })
        
        .append(
            createPFields('photoDis', 'Profile Photo')
        )
        .appendTo('#mainProfile');
    
    if (isStudent) {
        $('<div/>', {
            id: 'thirdCol',
        })
            .append(
                createTFields('pointsF', 'Points'),
            )
            .appendTo('#extra');
    }
}


function createTFields(id, fieldName) {
    return $('<div/>', {
        id: id,
        class: 'textField'
    })
        .append(
            $('<div/>', {
                id: 'labelF' + id,
                class: 'labelF'
            })
                .append(
                    $('<span/>')
                        .text(fieldName + ': '),
                    
                    $('<span/>', {
                        id: 'data' + id,
                        class: 'data'
                    })
                )
        );
}

function createPFields(id, fieldName) {
    return $('<div/>', {
        id: id,
        class: 'photoField'
    })
        
        .append(
            $('<div/>', {
                id: 'photoContainer' + id,
                class: 'photoContainer'
            })
                .css({
                    'width': $('#firstCol').css('height'),
                    'height': $('#firstCol').css('height')
                })
                .append(
                    $('<img/>', {
                        id: 'profilePhoto',
                        src: ''
                    })
                )
        );
}