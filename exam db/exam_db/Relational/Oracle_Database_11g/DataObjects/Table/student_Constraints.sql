ALTER TABLE student ADD CONSTRAINT student_pk PRIMARY KEY ( id );

ALTER TABLE student ADD CONSTRAINT student__un UNIQUE ( username );