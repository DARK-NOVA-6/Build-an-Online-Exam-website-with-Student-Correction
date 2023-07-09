ALTER TABLE test
    ADD CONSTRAINT test_teacher_fk FOREIGN KEY ( teacher_id )
        REFERENCES teacher ( id );