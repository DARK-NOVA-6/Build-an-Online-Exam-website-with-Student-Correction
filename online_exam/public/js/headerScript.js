role = getCookie('role');
userName = getCookie('username');
photoLink = getCookie('photoLink');

function initHeader() {
    role = getCookie('role');
    userName = getCookie('username');
    photoLink = getCookie('photoLink');
    
    date = new Date().getHours();
    $('#logo')
        .text((date > 12) ? 'Good Evening' : 'Good Morning');
    $()
    $('#footerSubTitle')
        .append('&#169;2022 CopyRights Served Tester Online Team')
    
    if (userName !== undefined) {
        $("#logInOut")
            .text("Log-Out");
        
        $("#accountDetails")
            .text(userName);
        
        if (typeof PREF_URL === 'undefined')
            PREF_URL = '../';
        
        
        if (photoLink === undefined)
            photoLink = PREF_URL + 'public/icon/accTypAdmin.svg';
        
        $('#accountPhoto')
            .attr('src', photoLink);
    } else {
        $("#logInOut")
            .text((window.location.href == 'http://127.0.0.1:8888/login') ? 'Sign-Up' : "Log-In");
        
        $("#accountDetails")
            .text('');
        
        $('#accountPhoto')
            .remove();
    }
    
    $('#logInOut')
        .on('click',
            () => {
                window.location.href = 'http://127.0.0.1:8888/' +
                    ((window.location.href == 'http://127.0.0.1:8888/login')
                        ? 'sign-up' : (typeof userName === 'undefined')
                            ? 'login'
                            : 'logout')
            }
        );
    if (userName !== undefined)
        addCourseButton();
}


$('#headBody').ready(initHeader);


function getCookie(cookieName) {
    let cookie = {};
    document.cookie.split(';').forEach(function (el) {
        let [key, value] = el.split('=');
        if (value !== undefined)
            cookie[key.trim()] = value.replaceAll('%2F', '\\');
    })
    return cookie[cookieName];
}

function setCookie(cname, cvalue) {
    document.cookie = cname + "=" + cvalue + ";";
}

function addCourseButton() {
    $('<div/>', {
        id: 'courseButton',
        class: 'courseButton button'
    })
        .text('Courses')
        .on('click',
            () => {
                window.location.href = ' http://127.0.0.1:8888/course';
            }
        )
        .insertBefore($('#optionContainer'));
}


function showError(msg) {
    buildPopup(false);
    insertContent(msg);
}
