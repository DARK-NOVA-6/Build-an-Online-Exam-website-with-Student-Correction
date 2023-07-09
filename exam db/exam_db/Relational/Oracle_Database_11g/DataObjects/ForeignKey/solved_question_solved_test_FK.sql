ALTER TABLE solved_question
    ADD CONSTRAINT solved_question_solved_test_fk FOREIGN KEY ( solved_test_id )
        REFERENCES solved_test ( id );