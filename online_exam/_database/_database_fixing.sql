ALTER TABLE corrected_question
    PARALLEL 1;

ALTER TABLE corrected_test
    PARALLEL 1;

ALTER TABLE course
    PARALLEL 1;

ALTER TABLE options
    PARALLEL 1;

ALTER TABLE question
    PARALLEL 1;

ALTER TABLE solved_question
    PARALLEL 1;

ALTER TABLE solved_test
    PARALLEL 1;

ALTER TABLE student
    PARALLEL 1;

ALTER TABLE teacher
    PARALLEL 1;

ALTER TABLE test
    PARALLEL 1;

COMMIT;