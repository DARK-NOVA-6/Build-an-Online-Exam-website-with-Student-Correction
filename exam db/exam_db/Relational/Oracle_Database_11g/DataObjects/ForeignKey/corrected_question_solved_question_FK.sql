--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE corrected_question
    ADD CONSTRAINT corrected_question_solved_question_fk FOREIGN KEY ( solved_question_id )
        REFERENCES solved_question ( id );