ALTER TABLE teacher ADD CONSTRAINT teacher_pk PRIMARY KEY ( id );

ALTER TABLE teacher ADD CONSTRAINT teacher__un UNIQUE ( username );