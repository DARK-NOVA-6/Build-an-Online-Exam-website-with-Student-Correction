CREATE TABLE question (
    id                INTEGER NOT NULL,
    text              VARCHAR2(1500) NOT NULL,
    type              VARCHAR2(10),
    correct_answer    VARCHAR2(250),
    photo_url         VARCHAR2(250),
    solved_points     INTEGER DEFAULT 150,
    correction_point  INTEGER DEFAULT 50,
    test_id           INTEGER NOT NULL
);

ALTER TABLE question
    ADD CHECK ( type IN ( 'opt', 'trf', 'wrd' ) );