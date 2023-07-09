ALTER TABLE solved_test
    ADD CONSTRAINT solved_test_student_fk FOREIGN KEY ( student_id )
        REFERENCES student ( id );