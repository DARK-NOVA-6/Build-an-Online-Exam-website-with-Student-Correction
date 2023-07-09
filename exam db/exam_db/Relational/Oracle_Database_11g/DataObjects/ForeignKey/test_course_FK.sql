ALTER TABLE test
    ADD CONSTRAINT test_course_fk FOREIGN KEY ( course_id )
        REFERENCES course ( id );