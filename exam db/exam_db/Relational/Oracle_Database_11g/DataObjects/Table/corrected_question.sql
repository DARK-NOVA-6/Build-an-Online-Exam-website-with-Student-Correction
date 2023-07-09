CREATE TABLE corrected_question (
    id                  INTEGER NOT NULL,
    validation          VARCHAR2(1) DEFAULT 'D' NOT NULL,
    sub_points          INTEGER DEFAULT 0 NOT NULL,
    solved_question_id  INTEGER NOT NULL,
    corrected_test_id   INTEGER NOT NULL
);

ALTER TABLE corrected_question
    ADD CHECK ( validation IN ( 'C', 'D', 'W' ) );