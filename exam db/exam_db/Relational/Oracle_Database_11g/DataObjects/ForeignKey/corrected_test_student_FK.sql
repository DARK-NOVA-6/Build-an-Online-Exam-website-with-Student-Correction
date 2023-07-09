ALTER TABLE corrected_test
    ADD CONSTRAINT corrected_test_student_fk FOREIGN KEY ( student_id )
        REFERENCES student ( id );