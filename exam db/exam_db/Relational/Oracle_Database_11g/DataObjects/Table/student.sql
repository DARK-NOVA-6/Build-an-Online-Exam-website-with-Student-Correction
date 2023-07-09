CREATE TABLE student (
    id          INTEGER NOT NULL,
    first_name  VARCHAR2(60) NOT NULL,
    last_name   VARCHAR2(60) NOT NULL,
    username    VARCHAR2(60) NOT NULL,
    password    VARCHAR2(250) NOT NULL,
    points      INTEGER,
    photo_url   VARCHAR2(250)
);