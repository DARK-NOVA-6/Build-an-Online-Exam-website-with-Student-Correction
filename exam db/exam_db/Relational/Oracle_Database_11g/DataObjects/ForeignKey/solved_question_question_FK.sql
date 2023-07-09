ALTER TABLE solved_question
    ADD CONSTRAINT solved_question_question_fk FOREIGN KEY ( question_id )
        REFERENCES question ( id );