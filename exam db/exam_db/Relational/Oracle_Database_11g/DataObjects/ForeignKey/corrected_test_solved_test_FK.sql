ALTER TABLE corrected_test
    ADD CONSTRAINT corrected_test_solved_test_fk FOREIGN KEY ( solved_test_id )
        REFERENCES solved_test ( id );