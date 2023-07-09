ALTER TABLE question
    ADD CONSTRAINT question_test_fk FOREIGN KEY ( test_id )
        REFERENCES test ( id )
            ON DELETE CASCADE;