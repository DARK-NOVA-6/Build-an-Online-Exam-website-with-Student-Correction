function takeTest() {
    window.location.href = 'http://127.0.0.1:8888/test/' + courseName + '?take=true';
}

function correctTest() {
    window.location.href = 'http://127.0.0.1:8888/test/' + courseName + '?take=false';
}