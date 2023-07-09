CREATE TABLE corrected_test (
    id              INTEGER NOT NULL,
    points          INTEGER DEFAULT 0 NOT NULL,
    solved_test_id  INTEGER NOT NULL,
    student_id      INTEGER NOT NULL
);