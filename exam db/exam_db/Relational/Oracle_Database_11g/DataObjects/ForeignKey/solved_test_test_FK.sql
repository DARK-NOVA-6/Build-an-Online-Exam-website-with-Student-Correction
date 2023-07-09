ALTER TABLE solved_test
    ADD CONSTRAINT solved_test_test_fk FOREIGN KEY ( test_id )
        REFERENCES test ( id );