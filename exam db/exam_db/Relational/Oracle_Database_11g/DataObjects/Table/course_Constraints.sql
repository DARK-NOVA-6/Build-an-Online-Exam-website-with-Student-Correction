ALTER TABLE course ADD CONSTRAINT course_pk PRIMARY KEY ( id );

ALTER TABLE course ADD CONSTRAINT course__un UNIQUE ( title );