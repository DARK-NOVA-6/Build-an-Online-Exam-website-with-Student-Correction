CREATE TABLE solved_question (
    id                INTEGER NOT NULL,
    answer            VARCHAR2(250),
    selected_options  VARCHAR2(6),
    sub_points        INTEGER DEFAULT 0 NOT NULL,
    question_id       INTEGER NOT NULL,
    solved_test_id    INTEGER NOT NULL
);