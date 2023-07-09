--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE corrected_question
    ADD CONSTRAINT corrected_question_corrected_test_fk FOREIGN KEY ( corrected_test_id )
        REFERENCES corrected_test ( id );