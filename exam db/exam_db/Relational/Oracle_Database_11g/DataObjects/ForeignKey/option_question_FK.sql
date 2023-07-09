ALTER TABLE "option"
    ADD CONSTRAINT option_question_fk FOREIGN KEY ( question_id )
        REFERENCES question ( id )
            ON DELETE CASCADE;