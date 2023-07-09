--------------------------------------------------------
--  File created - Thursday-June-30-2022   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence CORRECTED_QUESTION_ID_SEQ
--------------------------------------------------------

CREATE SEQUENCE "EXAM_DB"."CORRECTED_QUESTION_ID_SEQ" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH

41 NOCACHE ORDER NOCYCLE;
--------------------------------------------------------
--  DDL for Sequence CORRECTED_TEST_ID_SEQ
--------------------------------------------------------

CREATE SEQUENCE "EXAM_DB"."CORRECTED_TEST_ID_SEQ" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 38

NOCACHE ORDER NOCYCLE;
--------------------------------------------------------
--  DDL for Sequence COURSE_ID_SEQ
--------------------------------------------------------

CREATE SEQUENCE "EXAM_DB"."COURSE_ID_SEQ" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 13 NOCACHE

ORDER NOCYCLE;
--------------------------------------------------------
--  DDL for Sequence OPTION_ID_SEQ
--------------------------------------------------------

CREATE SEQUENCE "EXAM_DB"."OPTION_ID_SEQ" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 125 NOCACHE

ORDER NOCYCLE;
--------------------------------------------------------
--  DDL for Sequence QUESTION_ID_SEQ
--------------------------------------------------------

CREATE SEQUENCE "EXAM_DB"."QUESTION_ID_SEQ" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 91 NOCACHE

ORDER NOCYCLE;
--------------------------------------------------------
--  DDL for Sequence SOLVED_QUESTION_ID_SEQ
--------------------------------------------------------

CREATE SEQUENCE "EXAM_DB"."SOLVED_QUESTION_ID_SEQ" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 80

NOCACHE ORDER NOCYCLE;
--------------------------------------------------------
--  DDL for Sequence SOLVED_TEST_ID_SEQ
--------------------------------------------------------

CREATE SEQUENCE "EXAM_DB"."SOLVED_TEST_ID_SEQ" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 66 NOCACHE

ORDER NOCYCLE;
--------------------------------------------------------
--  DDL for Sequence STUDENT_ID_SEQ
--------------------------------------------------------

CREATE SEQUENCE "EXAM_DB"."STUDENT_ID_SEQ" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 80 NOCACHE

ORDER NOCYCLE;
--------------------------------------------------------
--  DDL for Sequence TEACHER_ID_SEQ
--------------------------------------------------------

CREATE SEQUENCE "EXAM_DB"."TEACHER_ID_SEQ" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 80 NOCACHE

ORDER NOCYCLE;
--------------------------------------------------------
--  DDL for Sequence TEST_ID_SEQ
--------------------------------------------------------

CREATE SEQUENCE "EXAM_DB"."TEST_ID_SEQ" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 91 NOCACHE ORDER

NOCYCLE;
--------------------------------------------------------
--  DDL for Table CORRECTED_QUESTION
--------------------------------------------------------

CREATE TABLE "EXAM_DB"."CORRECTED_QUESTION" (
    "ID"                  NUMBER(*, 0),
    "SUB_POINTS"          NUMBER(*, 0) DEFAULT 0,
    "SOLVED_QUESTION_ID"  NUMBER(*, 0),
    "CORRECTED_TEST_ID"   NUMBER(*, 0),
    "VALIDATION"          NUMBER(*, 0)
)
SEGMENT CREATION IMMEDIATE
PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645 PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
    DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT )
TABLESPACE "SYSTEM";
--------------------------------------------------------
--  DDL for Table CORRECTED_TEST
--------------------------------------------------------

CREATE TABLE "EXAM_DB"."CORRECTED_TEST" (
    "ID"              NUMBER(*, 0),
    "POINTS"          NUMBER(*, 0) DEFAULT 0,
    "SOLVED_TEST_ID"  NUMBER(*, 0),
    "STUDENT_ID"      NUMBER(*, 0),
    "FINISHED"        VARCHAR2(1 BYTE)
)
SEGMENT CREATION IMMEDIATE
PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645 PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
    DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT )
TABLESPACE "SYSTEM";
--------------------------------------------------------
--  DDL for Table COURSE
--------------------------------------------------------

CREATE TABLE "EXAM_DB"."COURSE" (
    "ID"     NUMBER(*, 0),
    "TITLE"  VARCHAR2(60 BYTE)
)
SEGMENT CREATION IMMEDIATE
PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645 PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
    DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT )
TABLESPACE "SYSTEM";
--------------------------------------------------------
--  DDL for Table OPTIONS
--------------------------------------------------------

CREATE TABLE "EXAM_DB"."OPTIONS" (
    "ID"           NUMBER(*, 0),
    "TEXT"         VARCHAR2(250 BYTE),
    "IS_CORRECT"   CHAR(1 BYTE),
    "ORDER_OPT"    VARCHAR2(1 BYTE),
    "PHOTO_URL"    VARCHAR2(250 BYTE),
    "QUESTION_ID"  NUMBER(*, 0)
)
SEGMENT CREATION IMMEDIATE
PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645 PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
    DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT )
TABLESPACE "SYSTEM";
--------------------------------------------------------
--  DDL for Table QUESTION
--------------------------------------------------------

CREATE TABLE "EXAM_DB"."QUESTION" (
    "ID"                NUMBER(*, 0),
    "TEXT"              VARCHAR2(1500 BYTE),
    "TYPE"              VARCHAR2(10 BYTE),
    "CORRECT_ANSWER"    VARCHAR2(250 BYTE),
    "PHOTO_URL"         VARCHAR2(250 BYTE),
    "SOLVED_POINTS"     NUMBER(*, 0) DEFAULT 150,
    "CORRECTION_POINT"  NUMBER(*, 0) DEFAULT 50,
    "TEST_ID"           NUMBER(*, 0)
)
SEGMENT CREATION IMMEDIATE
PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645 PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
    DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT )
TABLESPACE "SYSTEM";
--------------------------------------------------------
--  DDL for Table SOLVED_QUESTION
--------------------------------------------------------

CREATE TABLE "EXAM_DB"."SOLVED_QUESTION" (
    "ID"                NUMBER(*, 0),
    "ANSWER"            VARCHAR2(250 BYTE),
    "SELECTED_OPTIONS"  VARCHAR2(100 BYTE),
    "SUB_POINTS"        NUMBER(*, 0) DEFAULT 0,
    "QUESTION_ID"       NUMBER(*, 0),
    "SOLVED_TEST_ID"    NUMBER(*, 0)
)
SEGMENT CREATION IMMEDIATE
PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645 PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
    DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT )
TABLESPACE "SYSTEM";
--------------------------------------------------------
--  DDL for Table SOLVED_TEST
--------------------------------------------------------

CREATE TABLE "EXAM_DB"."SOLVED_TEST" (
    "ID"          NUMBER(*, 0),
    "POINTS"      NUMBER(*, 0) DEFAULT 0,
    "TEST_ID"     NUMBER(*, 0),
    "STUDENT_ID"  NUMBER(*, 0),
    "FINISHED"    VARCHAR2(1 BYTE)
)
SEGMENT CREATION IMMEDIATE
PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645 PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
    DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT )
TABLESPACE "SYSTEM";
--------------------------------------------------------
--  DDL for Table STUDENT
--------------------------------------------------------

CREATE TABLE "EXAM_DB"."STUDENT" (
    "ID"          NUMBER(*, 0),
    "FIRST_NAME"  VARCHAR2(60 BYTE),
    "LAST_NAME"   VARCHAR2(60 BYTE),
    "USERNAME"    VARCHAR2(60 BYTE),
    "PASSWORD"    VARCHAR2(250 BYTE),
    "POINTS"      NUMBER(*, 0),
    "PHOTO_URL"   VARCHAR2(250 BYTE)
)
SEGMENT CREATION IMMEDIATE
PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645 PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
    DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT )
TABLESPACE "SYSTEM";
--------------------------------------------------------
--  DDL for Table TEACHER
--------------------------------------------------------

CREATE TABLE "EXAM_DB"."TEACHER" (
    "ID"          NUMBER(*, 0),
    "FIRST_NAME"  VARCHAR2(60 BYTE),
    "LAST_NAME"   VARCHAR2(60 BYTE),
    "USERNAME"    VARCHAR2(60 BYTE),
    "PASSWORD"    VARCHAR2(250 BYTE),
    "PHOTO_URL"   VARCHAR2(250 BYTE)
)
SEGMENT CREATION IMMEDIATE
PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645 PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
    DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT )
TABLESPACE "SYSTEM";
--------------------------------------------------------
--  DDL for Table TEST
--------------------------------------------------------

CREATE TABLE "EXAM_DB"."TEST" (
    "ID"                   NUMBER(*, 0),
    "START_TIME"           DATE,
    "TEST_DURATION"        NUMBER(*, 0),
    "CORRECTING_DURATION"  NUMBER(*, 0),
    "COURSE_ID"            NUMBER(*, 0),
    "TEACHER_ID"           NUMBER(*, 0),
    "VALIDATED"            VARCHAR2(1 BYTE)
)
SEGMENT CREATION IMMEDIATE
PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645 PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
    DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT )
TABLESPACE "SYSTEM";
REM INSERTING into EXAM_DB.CORRECTED_QUESTION
SET DEFINE OFF;
REM INSERTING into EXAM_DB.CORRECTED_TEST
SET DEFINE OFF;
REM INSERTING into EXAM_DB.COURSE
SET DEFINE OFF;

INSERT INTO exam_db.course (
    id,
    title
) VALUES (
    12,
    'math'
);
REM INSERTING into EXAM_DB.OPTIONS
SET DEFINE OFF;
REM INSERTING into EXAM_DB.QUESTION
SET DEFINE OFF;
REM INSERTING into EXAM_DB.SOLVED_QUESTION
SET DEFINE OFF;
REM INSERTING into EXAM_DB.SOLVED_TEST
SET DEFINE OFF;
REM INSERTING into EXAM_DB.STUDENT
SET DEFINE OFF;
REM INSERTING into EXAM_DB.TEACHER
SET DEFINE OFF;
REM INSERTING into EXAM_DB.TEST
SET DEFINE OFF;
--------------------------------------------------------
--  DDL for Index CORRECTED_QUESTION_PK
--------------------------------------------------------

CREATE UNIQUE INDEX "EXAM_DB"."CORRECTED_QUESTION_PK" ON
    "EXAM_DB"."CORRECTED_QUESTION" (
        "ID"
    )
        PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS
            STORAGE ( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645 PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT )
        TABLESPACE "SYSTEM";
--------------------------------------------------------
--  DDL for Index CORRECTED_TEST_PK
--------------------------------------------------------

CREATE UNIQUE INDEX "EXAM_DB"."CORRECTED_TEST_PK" ON
    "EXAM_DB"."CORRECTED_TEST" (
        "ID"
    )
        PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS
            STORAGE ( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645 PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT )
        TABLESPACE "SYSTEM";
--------------------------------------------------------
--  DDL for Index COURSE_PK
--------------------------------------------------------

CREATE UNIQUE INDEX "EXAM_DB"."COURSE_PK" ON
    "EXAM_DB"."COURSE" (
        "ID"
    )
        PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS
            STORAGE ( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645 PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT )
        TABLESPACE "SYSTEM";
--------------------------------------------------------
--  DDL for Index COURSE__UN
--------------------------------------------------------

CREATE UNIQUE INDEX "EXAM_DB"."COURSE__UN" ON
    "EXAM_DB"."COURSE" (
        "TITLE"
    )
        PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS
            STORAGE ( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645 PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT )
        TABLESPACE "SYSTEM";
--------------------------------------------------------
--  DDL for Index OPTION_PK
--------------------------------------------------------

CREATE UNIQUE INDEX "EXAM_DB"."OPTION_PK" ON
    "EXAM_DB"."OPTIONS" (
        "ID"
    )
        PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS
            STORAGE ( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645 PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT )
        TABLESPACE "SYSTEM";
--------------------------------------------------------
--  DDL for Index QUESTION_PK
--------------------------------------------------------

CREATE UNIQUE INDEX "EXAM_DB"."QUESTION_PK" ON
    "EXAM_DB"."QUESTION" (
        "ID"
    )
        PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS
            STORAGE ( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645 PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT )
        TABLESPACE "SYSTEM";
--------------------------------------------------------
--  DDL for Index SOLVED_QUESTION_PK
--------------------------------------------------------

CREATE UNIQUE INDEX "EXAM_DB"."SOLVED_QUESTION_PK" ON
    "EXAM_DB"."SOLVED_QUESTION" (
        "ID"
    )
        PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS
            STORAGE ( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645 PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT )
        TABLESPACE "SYSTEM";
--------------------------------------------------------
--  DDL for Index SOLVED_TEST_PK
--------------------------------------------------------

CREATE UNIQUE INDEX "EXAM_DB"."SOLVED_TEST_PK" ON
    "EXAM_DB"."SOLVED_TEST" (
        "ID"
    )
        PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS
            STORAGE ( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645 PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT )
        TABLESPACE "SYSTEM";
--------------------------------------------------------
--  DDL for Index STUDENT_PK
--------------------------------------------------------

CREATE UNIQUE INDEX "EXAM_DB"."STUDENT_PK" ON
    "EXAM_DB"."STUDENT" (
        "ID"
    )
        PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS
            STORAGE ( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645 PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT )
        TABLESPACE "SYSTEM";
--------------------------------------------------------
--  DDL for Index STUDENT_TEST
--------------------------------------------------------

CREATE UNIQUE INDEX "EXAM_DB"."STUDENT_TEST" ON
    "EXAM_DB"."SOLVED_TEST" (
        "TEST_ID",
        "STUDENT_ID"
    )
        PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS
            STORAGE ( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645 PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT )
        TABLESPACE "SYSTEM";
--------------------------------------------------------
--  DDL for Index STUDENT__UN
--------------------------------------------------------

CREATE UNIQUE INDEX "EXAM_DB"."STUDENT__UN" ON
    "EXAM_DB"."STUDENT" (
        "USERNAME"
    )
        PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS
            STORAGE ( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645 PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT )
        TABLESPACE "SYSTEM";
--------------------------------------------------------
--  DDL for Index TEACHER_PK
--------------------------------------------------------

CREATE UNIQUE INDEX "EXAM_DB"."TEACHER_PK" ON
    "EXAM_DB"."TEACHER" (
        "ID"
    )
        PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS
            STORAGE ( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645 PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT )
        TABLESPACE "SYSTEM";
--------------------------------------------------------
--  DDL for Index TEACHER__UN
--------------------------------------------------------

CREATE UNIQUE INDEX "EXAM_DB"."TEACHER__UN" ON
    "EXAM_DB"."TEACHER" (
        "USERNAME"
    )
        PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS
            STORAGE ( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645 PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT )
        TABLESPACE "SYSTEM";
--------------------------------------------------------
--  DDL for Index TEST_PK
--------------------------------------------------------

CREATE UNIQUE INDEX "EXAM_DB"."TEST_PK" ON
    "EXAM_DB"."TEST" (
        "ID"
    )
        PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS
            STORAGE ( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645 PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT )
        TABLESPACE "SYSTEM";
--------------------------------------------------------
--  DDL for Index UNI_STUD_SOLVED
--------------------------------------------------------

CREATE UNIQUE INDEX "EXAM_DB"."UNI_STUD_SOLVED" ON
    "EXAM_DB"."CORRECTED_TEST" (
        "SOLVED_TEST_ID",
        "STUDENT_ID"
    )
        PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS
            STORAGE ( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645 PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT )
        TABLESPACE "SYSTEM";
--------------------------------------------------------
--  DDL for Index CORRECTED_QUESTION_PK
--------------------------------------------------------

CREATE UNIQUE INDEX "EXAM_DB"."CORRECTED_QUESTION_PK" ON
    "EXAM_DB"."CORRECTED_QUESTION" (
        "ID"
    )
        PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS
            STORAGE ( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645 PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT )
        TABLESPACE "SYSTEM";
--------------------------------------------------------
--  DDL for Index CORRECTED_TEST_PK
--------------------------------------------------------

CREATE UNIQUE INDEX "EXAM_DB"."CORRECTED_TEST_PK" ON
    "EXAM_DB"."CORRECTED_TEST" (
        "ID"
    )
        PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS
            STORAGE ( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645 PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT )
        TABLESPACE "SYSTEM";
--------------------------------------------------------
--  DDL for Index UNI_STUD_SOLVED
--------------------------------------------------------

CREATE UNIQUE INDEX "EXAM_DB"."UNI_STUD_SOLVED" ON
    "EXAM_DB"."CORRECTED_TEST" (
        "SOLVED_TEST_ID",
        "STUDENT_ID"
    )
        PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS
            STORAGE ( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645 PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT )
        TABLESPACE "SYSTEM";
--------------------------------------------------------
--  DDL for Index COURSE_PK
--------------------------------------------------------

CREATE UNIQUE INDEX "EXAM_DB"."COURSE_PK" ON
    "EXAM_DB"."COURSE" (
        "ID"
    )
        PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS
            STORAGE ( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645 PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT )
        TABLESPACE "SYSTEM";
--------------------------------------------------------
--  DDL for Index COURSE__UN
--------------------------------------------------------

CREATE UNIQUE INDEX "EXAM_DB"."COURSE__UN" ON
    "EXAM_DB"."COURSE" (
        "TITLE"
    )
        PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS
            STORAGE ( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645 PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT )
        TABLESPACE "SYSTEM";
--------------------------------------------------------
--  DDL for Index OPTION_PK
--------------------------------------------------------

CREATE UNIQUE INDEX "EXAM_DB"."OPTION_PK" ON
    "EXAM_DB"."OPTIONS" (
        "ID"
    )
        PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS
            STORAGE ( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645 PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT )
        TABLESPACE "SYSTEM";
--------------------------------------------------------
--  DDL for Index QUESTION_PK
--------------------------------------------------------

CREATE UNIQUE INDEX "EXAM_DB"."QUESTION_PK" ON
    "EXAM_DB"."QUESTION" (
        "ID"
    )
        PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS
            STORAGE ( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645 PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT )
        TABLESPACE "SYSTEM";
--------------------------------------------------------
--  DDL for Index SOLVED_QUESTION_PK
--------------------------------------------------------

CREATE UNIQUE INDEX "EXAM_DB"."SOLVED_QUESTION_PK" ON
    "EXAM_DB"."SOLVED_QUESTION" (
        "ID"
    )
        PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS
            STORAGE ( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645 PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT )
        TABLESPACE "SYSTEM";
--------------------------------------------------------
--  DDL for Index SOLVED_TEST_PK
--------------------------------------------------------

CREATE UNIQUE INDEX "EXAM_DB"."SOLVED_TEST_PK" ON
    "EXAM_DB"."SOLVED_TEST" (
        "ID"
    )
        PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS
            STORAGE ( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645 PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT )
        TABLESPACE "SYSTEM";
--------------------------------------------------------
--  DDL for Index STUDENT_TEST
--------------------------------------------------------

CREATE UNIQUE INDEX "EXAM_DB"."STUDENT_TEST" ON
    "EXAM_DB"."SOLVED_TEST" (
        "TEST_ID",
        "STUDENT_ID"
    )
        PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS
            STORAGE ( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645 PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT )
        TABLESPACE "SYSTEM";
--------------------------------------------------------
--  DDL for Index STUDENT_PK
--------------------------------------------------------

CREATE UNIQUE INDEX "EXAM_DB"."STUDENT_PK" ON
    "EXAM_DB"."STUDENT" (
        "ID"
    )
        PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS
            STORAGE ( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645 PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT )
        TABLESPACE "SYSTEM";
--------------------------------------------------------
--  DDL for Index STUDENT__UN
--------------------------------------------------------

CREATE UNIQUE INDEX "EXAM_DB"."STUDENT__UN" ON
    "EXAM_DB"."STUDENT" (
        "USERNAME"
    )
        PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS
            STORAGE ( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645 PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT )
        TABLESPACE "SYSTEM";
--------------------------------------------------------
--  DDL for Index TEACHER_PK
--------------------------------------------------------

CREATE UNIQUE INDEX "EXAM_DB"."TEACHER_PK" ON
    "EXAM_DB"."TEACHER" (
        "ID"
    )
        PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS
            STORAGE ( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645 PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT )
        TABLESPACE "SYSTEM";
--------------------------------------------------------
--  DDL for Index TEACHER__UN
--------------------------------------------------------

CREATE UNIQUE INDEX "EXAM_DB"."TEACHER__UN" ON
    "EXAM_DB"."TEACHER" (
        "USERNAME"
    )
        PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS
            STORAGE ( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645 PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT )
        TABLESPACE "SYSTEM";
--------------------------------------------------------
--  DDL for Index TEST_PK
--------------------------------------------------------

CREATE UNIQUE INDEX "EXAM_DB"."TEST_PK" ON
    "EXAM_DB"."TEST" (
        "ID"
    )
        PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS
            STORAGE ( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645 PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT )
        TABLESPACE "SYSTEM";
--------------------------------------------------------
--  DDL for Trigger CORRECTED_QUESTION_ACCESS_TRG
--------------------------------------------------------

CREATE OR REPLACE TRIGGER "EXAM_DB"."CORRECTED_QUESTION_ACCESS_TRG" BEFORE
    INSERT OR UPDATE OR DELETE ON corrected_question
    FOR EACH ROW
DECLARE
    v_question_id  INTEGER;
    v_student_id   INTEGER;
    v_counter      INTEGER := 0;
    ex_correcting_access EXCEPTION;
    PRAGMA exception_init ( ex_correcting_access, -20003 );
BEGIN
    SELECT
        question_id
    INTO v_question_id
    FROM
        solved_question
    WHERE
        solved_question.id = :new.solved_question_id;

    SELECT
        student_id
    INTO v_student_id
    FROM
        corrected_test
    WHERE
        corrected_test.id = :new.corrected_test_id;

    SELECT
        COUNT(*)
    INTO v_counter
    FROM
        solved_question
    WHERE
            solved_question.id = v_question_id
        AND solved_question.solved_test_id IN (
            SELECT
                solved_test.id
            FROM
                solved_test
            WHERE
                solved_test.student_id = v_student_id
        );

    IF ( v_counter = 0 ) THEN
        raise_application_error(-20003, 'a student who does not solve a question cannot correct it.');
    END IF;
END;
/

ALTER TRIGGER "EXAM_DB"."CORRECTED_QUESTION_ACCESS_TRG" DISABLE;
--------------------------------------------------------
--  DDL for Trigger CORRECTED_QUESTION_ID_TRG
--------------------------------------------------------

CREATE OR REPLACE TRIGGER "EXAM_DB"."CORRECTED_QUESTION_ID_TRG" BEFORE
    INSERT ON corrected_question
    FOR EACH ROW
    WHEN ( new.id IS NULL )
BEGIN
    :new.id := corrected_question_id_seq.nextval;
END;
/

ALTER TRIGGER "EXAM_DB"."CORRECTED_QUESTION_ID_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger CORRECTED_QUESTION_TIME_TRG
--------------------------------------------------------

CREATE OR REPLACE TRIGGER "EXAM_DB"."CORRECTED_QUESTION_TIME_TRG" BEFORE
    INSERT OR DELETE OR UPDATE OF validation ON corrected_question
    FOR EACH ROW
DECLARE
    v_corrected_question_id  INTEGER;
    v_solved_question_id     INTEGER;
    v_corrected_test_id      INTEGER;
    v_test_id                INTEGER;
    v_solved_test_id         INTEGER;
    ex_test_is_over EXCEPTION;
    PRAGMA exception_init ( ex_test_is_over, -20001 );
    ex_finished_test EXCEPTION;
    PRAGMA exception_init ( ex_finished_test, -20029 );
    v_finished               VARCHAR2(1) := 'n';
BEGIN
    IF deleting THEN
        v_corrected_question_id := :old.id;
        v_solved_question_id := :old.solved_question_id;
        v_corrected_test_id := :old.corrected_test_id;
    ELSE
        v_corrected_question_id := :new.id;
        v_solved_question_id := :new.solved_question_id;
        v_corrected_test_id := :new.corrected_test_id;
    END IF;

    SELECT
        solved_test_id
    INTO v_solved_test_id
    FROM
        solved_question
    WHERE
        v_solved_question_id = solved_question.id;

    SELECT
        test_id
    INTO v_test_id
    FROM
        solved_test
    WHERE
        v_solved_test_id = solved_test.id;

    IF ( check_time(v_test_id, false) = false ) THEN
        raise_application_error(-20001, 'duration of the test is finished');
    END IF;

    SELECT
        finished
    INTO v_finished
    FROM
        corrected_test
    WHERE
        v_corrected_test_id = corrected_test.id;

    IF ( v_finished = 'y' ) THEN
        raise_application_error(-20029, 'student can not edit answers after submition');
    END IF;
END;
/

ALTER TRIGGER "EXAM_DB"."CORRECTED_QUESTION_TIME_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger CORRECTED_TEST_ID_TRG
--------------------------------------------------------

CREATE OR REPLACE TRIGGER "EXAM_DB"."CORRECTED_TEST_ID_TRG" BEFORE
    INSERT ON corrected_test
    FOR EACH ROW
    WHEN ( new.id IS NULL )
BEGIN
    :new.id := corrected_test_id_seq.nextval;
END;
/

ALTER TRIGGER "EXAM_DB"."CORRECTED_TEST_ID_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger CORRECTED_TEST_TIME_TRG
--------------------------------------------------------

CREATE OR REPLACE TRIGGER "EXAM_DB"."CORRECTED_TEST_TIME_TRG" BEFORE
    INSERT OR DELETE ON corrected_test
    FOR EACH ROW
DECLARE
    ex_test_is_over EXCEPTION;
    PRAGMA exception_init ( ex_test_is_over, -20011 );
    ex_finished_test EXCEPTION;
    PRAGMA exception_init ( ex_finished_test, -20019 );
    v_corrected_test_id  INTEGER;
    v_test_id            INTEGER;
    v_finished           VARCHAR2(1);
    v_solved_test_id     INTEGER;
BEGIN
    IF deleting THEN
        v_corrected_test_id := :old.id;
        v_finished := :old.finished;
        v_solved_test_id := :old.solved_test_id;
    ELSE
        v_corrected_test_id := :new.id;
        v_finished := :new.finished;
        v_solved_test_id := :new.solved_test_id;
    END IF;

    SELECT
        solved_test.test_id
    INTO v_test_id
    FROM
        solved_test
    WHERE
        solved_test.id = v_solved_test_id;

    IF ( check_time(v_test_id, false) = false ) THEN
        raise_application_error(-20011, 'duration of the test is finished h1');
    END IF;

    IF ( v_finished = 'y' ) THEN
        raise_application_error(-20019, 'student can not edit answers after submition');
    END IF;
END;
/

ALTER TRIGGER "EXAM_DB"."CORRECTED_TEST_TIME_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger COURSE_ID_TRG
--------------------------------------------------------

CREATE OR REPLACE TRIGGER "EXAM_DB"."COURSE_ID_TRG" BEFORE
    INSERT ON course
    FOR EACH ROW
    WHEN ( new.id IS NULL )
BEGIN
    :new.id := course_id_seq.nextval;
END;
/

ALTER TRIGGER "EXAM_DB"."COURSE_ID_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger OPTION_ID_TRG
--------------------------------------------------------

CREATE OR REPLACE TRIGGER "EXAM_DB"."OPTION_ID_TRG" BEFORE
    INSERT ON "OPTIONS"
    FOR EACH ROW
    WHEN ( new.id IS NULL )
BEGIN
    :new.id := option_id_seq.nextval;
END;
/

ALTER TRIGGER "EXAM_DB"."OPTION_ID_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger QUESTION_ID_TRG
--------------------------------------------------------

CREATE OR REPLACE TRIGGER "EXAM_DB"."QUESTION_ID_TRG" BEFORE
    INSERT ON question
    FOR EACH ROW
    WHEN ( new.id IS NULL )
BEGIN
    :new.id := question_id_seq.nextval;
END;
/

ALTER TRIGGER "EXAM_DB"."QUESTION_ID_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger SOLVED_QUESTION_ID_TRG
--------------------------------------------------------

CREATE OR REPLACE TRIGGER "EXAM_DB"."SOLVED_QUESTION_ID_TRG" BEFORE
    INSERT ON solved_question
    FOR EACH ROW
    WHEN ( new.id IS NULL )
BEGIN
    :new.id := solved_question_id_seq.nextval;
END;
/

ALTER TRIGGER "EXAM_DB"."SOLVED_QUESTION_ID_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger SOLVED_QUESTION_TIME_TRG
--------------------------------------------------------

CREATE OR REPLACE TRIGGER "EXAM_DB"."SOLVED_QUESTION_TIME_TRG" BEFORE
    INSERT OR DELETE OR UPDATE OF selected_options, answer ON solved_question
    FOR EACH ROW
DECLARE
    v_test_id   INTEGER;
    ex_test_is_over EXCEPTION;
    PRAGMA exception_init ( ex_test_is_over, -20001 );
    ex_finished_test EXCEPTION;
    PRAGMA exception_init ( ex_finished_test, -20009 );
    v_finished  VARCHAR2(1) := 'n';
BEGIN
    SELECT
        test_id
    INTO v_test_id
    FROM
        question
    WHERE
        :new.question_id = question.id;

    IF ( NOT check_time(v_test_id, true) ) THEN
        raise_application_error(-20001, 'duration of the test is finished');
    END IF;

    SELECT
        finished
    INTO v_finished
    FROM
        solved_test
    WHERE
        :new.solved_test_id = solved_test.id;

    IF ( v_finished = 'y' ) THEN
        raise_application_error(-20009, 'student can not edit answers after submition');
    END IF;
END;
/

ALTER TRIGGER "EXAM_DB"."SOLVED_QUESTION_TIME_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger SOLVED_TEST_ID_TRG
--------------------------------------------------------

CREATE OR REPLACE TRIGGER "EXAM_DB"."SOLVED_TEST_ID_TRG" BEFORE
    INSERT ON solved_test
    FOR EACH ROW
    WHEN ( new.id IS NULL )
BEGIN
    :new.id := solved_test_id_seq.nextval;
END;
/

ALTER TRIGGER "EXAM_DB"."SOLVED_TEST_ID_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger SOLVED_TEST_TIME_TRG
--------------------------------------------------------

CREATE OR REPLACE TRIGGER "EXAM_DB"."SOLVED_TEST_TIME_TRG" BEFORE
    INSERT OR DELETE ON solved_test
    FOR EACH ROW
DECLARE
    ex_test_is_over EXCEPTION;
    PRAGMA exception_init ( ex_test_is_over, -20001 );
    ex_finished_test EXCEPTION;
    PRAGMA exception_init ( ex_finished_test, -20009 );
BEGIN
    IF ( NOT check_time(:new.test_id, true) ) THEN
        raise_application_error(-20001, 'duration of the test is finished');
    END IF;

    IF ( :new.finished = 'y' ) THEN
        raise_application_error(-20009, 'student can not edit answers after submition');
    END IF;

END;
/

ALTER TRIGGER "EXAM_DB"."SOLVED_TEST_TIME_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger STUDENT_ID_TRG
--------------------------------------------------------

CREATE OR REPLACE TRIGGER "EXAM_DB"."STUDENT_ID_TRG" BEFORE
    INSERT ON student
    FOR EACH ROW
    WHEN ( new.id IS NULL )
BEGIN
    :new.id := student_id_seq.nextval;
END;
/

ALTER TRIGGER "EXAM_DB"."STUDENT_ID_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TEACHER_ID_TRG
--------------------------------------------------------

CREATE OR REPLACE TRIGGER "EXAM_DB"."TEACHER_ID_TRG" BEFORE
    INSERT ON teacher
    FOR EACH ROW
    WHEN ( new.id IS NULL )
BEGIN
    :new.id := teacher_id_seq.nextval;
END;
/

ALTER TRIGGER "EXAM_DB"."TEACHER_ID_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TEST_ADD_TRG
--------------------------------------------------------

CREATE OR REPLACE TRIGGER "EXAM_DB"."TEST_ADD_TRG" BEFORE
    INSERT ON test
    FOR EACH ROW
DECLARE
    ex_test_trig EXCEPTION;
    PRAGMA exception_init ( ex_test_trig, -20004 );
BEGIN
    IF ( sysdate + ( 1 / 1440 * 0 ) >= :new.start_time ) THEN
        raise_application_error(-20004, 'duration of the test is finished2');
    END IF;
END;
/

ALTER TRIGGER "EXAM_DB"."TEST_ADD_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TEST_DELETE_TRG
--------------------------------------------------------

CREATE OR REPLACE TRIGGER "EXAM_DB"."TEST_DELETE_TRG" BEFORE
    DELETE ON test
    FOR EACH ROW
DECLARE
    ex_test_trig2 EXCEPTION;
    PRAGMA exception_init ( ex_test_trig2, -20005 );
    v_counter INTEGER := 0;
BEGIN
    SELECT
        COUNT(*)
    INTO v_counter
    FROM
        solved_test
    WHERE
        solved_test.id = :old.id;

    IF ( v_counter > 0 ) THEN
        raise_application_error(-20005, 'duration of the test is finished 5');
    END IF;
END;
/

ALTER TRIGGER "EXAM_DB"."TEST_DELETE_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TEST_ID_TRG
--------------------------------------------------------

CREATE OR REPLACE TRIGGER "EXAM_DB"."TEST_ID_TRG" BEFORE
    INSERT ON test
    FOR EACH ROW
    WHEN ( new.id IS NULL )
BEGIN
    :new.id := test_id_seq.nextval;
END;
/

ALTER TRIGGER "EXAM_DB"."TEST_ID_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger USERNAMES
--------------------------------------------------------

CREATE OR REPLACE TRIGGER "EXAM_DB"."USERNAMES" BEFORE
    INSERT ON student
    FOR EACH ROW
DECLARE
    ex_username_exist EXCEPTION;
    PRAGMA exception_init ( ex_username_exist, -20008 );
    v_counter INTEGER := 0;
BEGIN
    SELECT
        COUNT(*)
    INTO v_counter
    FROM
        teacher
    WHERE
        teacher.username = :new.username;

    IF ( v_counter > 0 ) THEN
        raise_application_error(-20008, 'unique constraint');
    END IF;
END;
/

ALTER TRIGGER "EXAM_DB"."USERNAMES" ENABLE;
--------------------------------------------------------
--  DDL for Trigger USERNAMES2
--------------------------------------------------------

CREATE OR REPLACE TRIGGER "EXAM_DB"."USERNAMES2" BEFORE
    INSERT ON teacher
    FOR EACH ROW
DECLARE
    ex_username_exist EXCEPTION;
    PRAGMA exception_init ( ex_username_exist, -20008 );
    v_counter INTEGER := 0;
BEGIN
    SELECT
        COUNT(*)
    INTO v_counter
    FROM
        student
    WHERE
        student.username = :new.username;

    IF ( v_counter > 0 ) THEN
        raise_application_error(-20008, 'unique constraint');
    END IF;
END;
/

ALTER TRIGGER "EXAM_DB"."USERNAMES2" ENABLE;
--------------------------------------------------------
--  DDL for Trigger CORRECTED_QUESTION_ID_TRG
--------------------------------------------------------

CREATE OR REPLACE TRIGGER "EXAM_DB"."CORRECTED_QUESTION_ID_TRG" BEFORE
    INSERT ON corrected_question
    FOR EACH ROW
    WHEN ( new.id IS NULL )
BEGIN
    :new.id := corrected_question_id_seq.nextval;
END;
/

ALTER TRIGGER "EXAM_DB"."CORRECTED_QUESTION_ID_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger CORRECTED_QUESTION_ACCESS_TRG
--------------------------------------------------------

CREATE OR REPLACE TRIGGER "EXAM_DB"."CORRECTED_QUESTION_ACCESS_TRG" BEFORE
    INSERT OR UPDATE OR DELETE ON corrected_question
    FOR EACH ROW
DECLARE
    v_question_id  INTEGER;
    v_student_id   INTEGER;
    v_counter      INTEGER := 0;
    ex_correcting_access EXCEPTION;
    PRAGMA exception_init ( ex_correcting_access, -20003 );
BEGIN
    SELECT
        question_id
    INTO v_question_id
    FROM
        solved_question
    WHERE
        solved_question.id = :new.solved_question_id;

    SELECT
        student_id
    INTO v_student_id
    FROM
        corrected_test
    WHERE
        corrected_test.id = :new.corrected_test_id;

    SELECT
        COUNT(*)
    INTO v_counter
    FROM
        solved_question
    WHERE
            solved_question.id = v_question_id
        AND solved_question.solved_test_id IN (
            SELECT
                solved_test.id
            FROM
                solved_test
            WHERE
                solved_test.student_id = v_student_id
        );

    IF ( v_counter = 0 ) THEN
        raise_application_error(-20003, 'a student who does not solve a question cannot correct it.');
    END IF;
END;
/

ALTER TRIGGER "EXAM_DB"."CORRECTED_QUESTION_ACCESS_TRG" DISABLE;
--------------------------------------------------------
--  DDL for Trigger CORRECTED_QUESTION_TIME_TRG
--------------------------------------------------------

CREATE OR REPLACE TRIGGER "EXAM_DB"."CORRECTED_QUESTION_TIME_TRG" BEFORE
    INSERT OR DELETE OR UPDATE OF validation ON corrected_question
    FOR EACH ROW
DECLARE
    v_corrected_question_id  INTEGER;
    v_solved_question_id     INTEGER;
    v_corrected_test_id      INTEGER;
    v_test_id                INTEGER;
    v_solved_test_id         INTEGER;
    ex_test_is_over EXCEPTION;
    PRAGMA exception_init ( ex_test_is_over, -20001 );
    ex_finished_test EXCEPTION;
    PRAGMA exception_init ( ex_finished_test, -20029 );
    v_finished               VARCHAR2(1) := 'n';
BEGIN
    IF deleting THEN
        v_corrected_question_id := :old.id;
        v_solved_question_id := :old.solved_question_id;
        v_corrected_test_id := :old.corrected_test_id;
    ELSE
        v_corrected_question_id := :new.id;
        v_solved_question_id := :new.solved_question_id;
        v_corrected_test_id := :new.corrected_test_id;
    END IF;

    SELECT
        solved_test_id
    INTO v_solved_test_id
    FROM
        solved_question
    WHERE
        v_solved_question_id = solved_question.id;

    SELECT
        test_id
    INTO v_test_id
    FROM
        solved_test
    WHERE
        v_solved_test_id = solved_test.id;

    IF ( check_time(v_test_id, false) = false ) THEN
        raise_application_error(-20001, 'duration of the test is finished');
    END IF;

    SELECT
        finished
    INTO v_finished
    FROM
        corrected_test
    WHERE
        v_corrected_test_id = corrected_test.id;

    IF ( v_finished = 'y' ) THEN
        raise_application_error(-20029, 'student can not edit answers after submition');
    END IF;
END;
/

ALTER TRIGGER "EXAM_DB"."CORRECTED_QUESTION_TIME_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger CORRECTED_TEST_ID_TRG
--------------------------------------------------------

CREATE OR REPLACE TRIGGER "EXAM_DB"."CORRECTED_TEST_ID_TRG" BEFORE
    INSERT ON corrected_test
    FOR EACH ROW
    WHEN ( new.id IS NULL )
BEGIN
    :new.id := corrected_test_id_seq.nextval;
END;
/

ALTER TRIGGER "EXAM_DB"."CORRECTED_TEST_ID_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger CORRECTED_TEST_TIME_TRG
--------------------------------------------------------

CREATE OR REPLACE TRIGGER "EXAM_DB"."CORRECTED_TEST_TIME_TRG" BEFORE
    INSERT OR DELETE ON corrected_test
    FOR EACH ROW
DECLARE
    ex_test_is_over EXCEPTION;
    PRAGMA exception_init ( ex_test_is_over, -20011 );
    ex_finished_test EXCEPTION;
    PRAGMA exception_init ( ex_finished_test, -20019 );
    v_corrected_test_id  INTEGER;
    v_test_id            INTEGER;
    v_finished           VARCHAR2(1);
    v_solved_test_id     INTEGER;
BEGIN
    IF deleting THEN
        v_corrected_test_id := :old.id;
        v_finished := :old.finished;
        v_solved_test_id := :old.solved_test_id;
    ELSE
        v_corrected_test_id := :new.id;
        v_finished := :new.finished;
        v_solved_test_id := :new.solved_test_id;
    END IF;

    SELECT
        solved_test.test_id
    INTO v_test_id
    FROM
        solved_test
    WHERE
        solved_test.id = v_solved_test_id;

    IF ( check_time(v_test_id, false) = false ) THEN
        raise_application_error(-20011, 'duration of the test is finished h1');
    END IF;

    IF ( v_finished = 'y' ) THEN
        raise_application_error(-20019, 'student can not edit answers after submition');
    END IF;
END;
/

ALTER TRIGGER "EXAM_DB"."CORRECTED_TEST_TIME_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger COURSE_ID_TRG
--------------------------------------------------------

CREATE OR REPLACE TRIGGER "EXAM_DB"."COURSE_ID_TRG" BEFORE
    INSERT ON course
    FOR EACH ROW
    WHEN ( new.id IS NULL )
BEGIN
    :new.id := course_id_seq.nextval;
END;
/

ALTER TRIGGER "EXAM_DB"."COURSE_ID_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger OPTION_ID_TRG
--------------------------------------------------------

CREATE OR REPLACE TRIGGER "EXAM_DB"."OPTION_ID_TRG" BEFORE
    INSERT ON "OPTIONS"
    FOR EACH ROW
    WHEN ( new.id IS NULL )
BEGIN
    :new.id := option_id_seq.nextval;
END;
/

ALTER TRIGGER "EXAM_DB"."OPTION_ID_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger QUESTION_ID_TRG
--------------------------------------------------------

CREATE OR REPLACE TRIGGER "EXAM_DB"."QUESTION_ID_TRG" BEFORE
    INSERT ON question
    FOR EACH ROW
    WHEN ( new.id IS NULL )
BEGIN
    :new.id := question_id_seq.nextval;
END;
/

ALTER TRIGGER "EXAM_DB"."QUESTION_ID_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger SOLVED_QUESTION_ID_TRG
--------------------------------------------------------

CREATE OR REPLACE TRIGGER "EXAM_DB"."SOLVED_QUESTION_ID_TRG" BEFORE
    INSERT ON solved_question
    FOR EACH ROW
    WHEN ( new.id IS NULL )
BEGIN
    :new.id := solved_question_id_seq.nextval;
END;
/

ALTER TRIGGER "EXAM_DB"."SOLVED_QUESTION_ID_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger SOLVED_QUESTION_TIME_TRG
--------------------------------------------------------

CREATE OR REPLACE TRIGGER "EXAM_DB"."SOLVED_QUESTION_TIME_TRG" BEFORE
    INSERT OR DELETE OR UPDATE OF selected_options, answer ON solved_question
    FOR EACH ROW
DECLARE
    v_test_id   INTEGER;
    ex_test_is_over EXCEPTION;
    PRAGMA exception_init ( ex_test_is_over, -20001 );
    ex_finished_test EXCEPTION;
    PRAGMA exception_init ( ex_finished_test, -20009 );
    v_finished  VARCHAR2(1) := 'n';
BEGIN
    SELECT
        test_id
    INTO v_test_id
    FROM
        question
    WHERE
        :new.question_id = question.id;

    IF ( NOT check_time(v_test_id, true) ) THEN
        raise_application_error(-20001, 'duration of the test is finished');
    END IF;

    SELECT
        finished
    INTO v_finished
    FROM
        solved_test
    WHERE
        :new.solved_test_id = solved_test.id;

    IF ( v_finished = 'y' ) THEN
        raise_application_error(-20009, 'student can not edit answers after submition');
    END IF;
END;
/

ALTER TRIGGER "EXAM_DB"."SOLVED_QUESTION_TIME_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger SOLVED_TEST_ID_TRG
--------------------------------------------------------

CREATE OR REPLACE TRIGGER "EXAM_DB"."SOLVED_TEST_ID_TRG" BEFORE
    INSERT ON solved_test
    FOR EACH ROW
    WHEN ( new.id IS NULL )
BEGIN
    :new.id := solved_test_id_seq.nextval;
END;
/

ALTER TRIGGER "EXAM_DB"."SOLVED_TEST_ID_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger SOLVED_TEST_TIME_TRG
--------------------------------------------------------

CREATE OR REPLACE TRIGGER "EXAM_DB"."SOLVED_TEST_TIME_TRG" BEFORE
    INSERT OR DELETE ON solved_test
    FOR EACH ROW
DECLARE
    ex_test_is_over EXCEPTION;
    PRAGMA exception_init ( ex_test_is_over, -20001 );
    ex_finished_test EXCEPTION;
    PRAGMA exception_init ( ex_finished_test, -20009 );
BEGIN
    IF ( NOT check_time(:new.test_id, true) ) THEN
        raise_application_error(-20001, 'duration of the test is finished');
    END IF;

    IF ( :new.finished = 'y' ) THEN
        raise_application_error(-20009, 'student can not edit answers after submition');
    END IF;

END;
/

ALTER TRIGGER "EXAM_DB"."SOLVED_TEST_TIME_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger STUDENT_ID_TRG
--------------------------------------------------------

CREATE OR REPLACE TRIGGER "EXAM_DB"."STUDENT_ID_TRG" BEFORE
    INSERT ON student
    FOR EACH ROW
    WHEN ( new.id IS NULL )
BEGIN
    :new.id := student_id_seq.nextval;
END;
/

ALTER TRIGGER "EXAM_DB"."STUDENT_ID_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger USERNAMES
--------------------------------------------------------

CREATE OR REPLACE TRIGGER "EXAM_DB"."USERNAMES" BEFORE
    INSERT ON student
    FOR EACH ROW
DECLARE
    ex_username_exist EXCEPTION;
    PRAGMA exception_init ( ex_username_exist, -20008 );
    v_counter INTEGER := 0;
BEGIN
    SELECT
        COUNT(*)
    INTO v_counter
    FROM
        teacher
    WHERE
        teacher.username = :new.username;

    IF ( v_counter > 0 ) THEN
        raise_application_error(-20008, 'unique constraint');
    END IF;
END;
/

ALTER TRIGGER "EXAM_DB"."USERNAMES" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TEACHER_ID_TRG
--------------------------------------------------------

CREATE OR REPLACE TRIGGER "EXAM_DB"."TEACHER_ID_TRG" BEFORE
    INSERT ON teacher
    FOR EACH ROW
    WHEN ( new.id IS NULL )
BEGIN
    :new.id := teacher_id_seq.nextval;
END;
/

ALTER TRIGGER "EXAM_DB"."TEACHER_ID_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger USERNAMES2
--------------------------------------------------------

CREATE OR REPLACE TRIGGER "EXAM_DB"."USERNAMES2" BEFORE
    INSERT ON teacher
    FOR EACH ROW
DECLARE
    ex_username_exist EXCEPTION;
    PRAGMA exception_init ( ex_username_exist, -20008 );
    v_counter INTEGER := 0;
BEGIN
    SELECT
        COUNT(*)
    INTO v_counter
    FROM
        student
    WHERE
        student.username = :new.username;

    IF ( v_counter > 0 ) THEN
        raise_application_error(-20008, 'unique constraint');
    END IF;
END;
/

ALTER TRIGGER "EXAM_DB"."USERNAMES2" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TEST_ID_TRG
--------------------------------------------------------

CREATE OR REPLACE TRIGGER "EXAM_DB"."TEST_ID_TRG" BEFORE
    INSERT ON test
    FOR EACH ROW
    WHEN ( new.id IS NULL )
BEGIN
    :new.id := test_id_seq.nextval;
END;
/

ALTER TRIGGER "EXAM_DB"."TEST_ID_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TEST_ADD_TRG
--------------------------------------------------------

CREATE OR REPLACE TRIGGER "EXAM_DB"."TEST_ADD_TRG" BEFORE
    INSERT ON test
    FOR EACH ROW
DECLARE
    ex_test_trig EXCEPTION;
    PRAGMA exception_init ( ex_test_trig, -20004 );
BEGIN
    IF ( sysdate + ( 1 / 1440 * 0 ) >= :new.start_time ) THEN
        raise_application_error(-20004, 'duration of the test is finished2');
    END IF;
END;
/

ALTER TRIGGER "EXAM_DB"."TEST_ADD_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TEST_DELETE_TRG
--------------------------------------------------------

CREATE OR REPLACE TRIGGER "EXAM_DB"."TEST_DELETE_TRG" BEFORE
    DELETE ON test
    FOR EACH ROW
DECLARE
    ex_test_trig2 EXCEPTION;
    PRAGMA exception_init ( ex_test_trig2, -20005 );
    v_counter INTEGER := 0;
BEGIN
    SELECT
        COUNT(*)
    INTO v_counter
    FROM
        solved_test
    WHERE
        solved_test.id = :old.id;

    IF ( v_counter > 0 ) THEN
        raise_application_error(-20005, 'duration of the test is finished 5');
    END IF;
END;
/

ALTER TRIGGER "EXAM_DB"."TEST_DELETE_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Procedure ADD_CORRECTED_QUESTION
--------------------------------------------------------
SET DEFINE OFF;

CREATE OR REPLACE PROCEDURE "EXAM_DB"."ADD_CORRECTED_QUESTION" (
    p_validation          VARCHAR,
    p_sub_points          INTEGER,
    p_solved_question_id  INTEGER,
    p_corrected_test_id   INTEGER
) IS
BEGIN
    INSERT INTO corrected_question (
        validation,
        sub_points,
        solved_question_id,
        corrected_test_id
    ) VALUES (
        p_validation,
        p_sub_points,
        p_solved_question_id,
        p_corrected_test_id
    );

END;
/
--------------------------------------------------------
--  DDL for Procedure ADD_CORRECTED_TEST
--------------------------------------------------------
SET DEFINE OFF;

CREATE OR REPLACE PROCEDURE "EXAM_DB"."ADD_CORRECTED_TEST" (
    p_student_username  VARCHAR2,
    p_solved_id         INTEGER
) IS

    ex_student_not_found EXCEPTION;
    PRAGMA exception_init ( ex_student_not_found, -20006 );
    CURSOR c_solved_questios_id IS
    SELECT UNIQUE
        id
    FROM
        solved_question
    WHERE
        solved_question.solved_test_id = p_solved_id;

    v_solved_question_id  INTEGER;
    v_student_id          INTEGER := -1;
    v_corrected_id        INTEGER := -1;
BEGIN
    SELECT
        id
    INTO v_student_id
    FROM
        student
    WHERE
        username = p_student_username;

    IF ( v_student_id = -1 ) THEN
        raise_application_error(-20006, 'user should be a student');
    END IF;

    INSERT INTO corrected_test (
        points,
        student_id,
        solved_test_id,
        finished
    ) VALUES (
        0,
        v_student_id,
        p_solved_id,
        'n'
    );

    SELECT
        MAX(id)
    INTO v_corrected_id
    FROM
        corrected_test;

    OPEN c_solved_questios_id;
    LOOP
        FETCH c_solved_questios_id INTO v_solved_question_id;
        EXIT WHEN c_solved_questios_id%notfound;
        INSERT INTO corrected_question (
            validation,
            sub_points,
            solved_question_id,
            corrected_test_id
        ) VALUES (
            0,
            0,
            v_solved_question_id,
            v_corrected_id
        );

    END LOOP;

    CLOSE c_solved_questios_id;
END;
/
--------------------------------------------------------
--  DDL for Procedure ADD_COURSE
--------------------------------------------------------
SET DEFINE OFF;

CREATE OR REPLACE PROCEDURE "EXAM_DB"."ADD_COURSE" (
    p_title VARCHAR
) IS
BEGIN
    INSERT INTO course ( title ) VALUES ( p_title );

END;
/
--------------------------------------------------------
--  DDL for Procedure ADD_OPTION
--------------------------------------------------------
SET DEFINE OFF;

CREATE OR REPLACE PROCEDURE "EXAM_DB"."ADD_OPTION" (
    p_question_id  INTEGER,
    p_text         VARCHAR,
    p_is_correct   VARCHAR,
    p_order_opt    VARCHAR,
    p_photo_url    VARCHAR := NULL
) IS
BEGIN
    INSERT INTO options (
        question_id,
        text,
        is_correct,
        order_opt,
        photo_url
    ) VALUES (
        p_question_id,
        p_text,
        p_is_correct,
        p_order_opt,
        p_photo_url
    );

END;
/
--------------------------------------------------------
--  DDL for Procedure ADD_QUESTION
--------------------------------------------------------
SET DEFINE OFF;

CREATE OR REPLACE PROCEDURE "EXAM_DB"."ADD_QUESTION" (
    p_test_id           INTEGER,
    p_text              VARCHAR,
    p_type              VARCHAR,
    p_correct_answer    VARCHAR := NULL,
    p_photo_url         VARCHAR := NULL,
    p_solved_points     INTEGER := 20,
    p_correction_point  INTEGER := 5
) IS
BEGIN
    INSERT INTO question (
        test_id,
        text,
        type,
        correct_answer,
        photo_url,
        solved_points,
        correction_point
    ) VALUES (
        p_test_id,
        p_text,
        p_type,
        p_correct_answer,
        p_photo_url,
        p_solved_points,
        p_correction_point
    );

END;
/
--------------------------------------------------------
--  DDL for Procedure ADD_SOLVED_QUESTION
--------------------------------------------------------
SET DEFINE OFF;

CREATE OR REPLACE PROCEDURE "EXAM_DB"."ADD_SOLVED_QUESTION" (
    p_answer            VARCHAR,
    p_selected_options  VARCHAR,
    p_sub_points        INTEGER,
    p_question_id       INTEGER,
    p_solved_test_id    INTEGER
) IS
BEGIN
    INSERT INTO solved_question (
        answer,
        selected_options,
        sub_points,
        question_id,
        solved_test_id
    ) VALUES (
        p_answer,
        p_selected_options,
        p_sub_points,
        p_question_id,
        p_solved_test_id
    );

END;
/
--------------------------------------------------------
--  DDL for Procedure ADD_SOLVED_TEST
--------------------------------------------------------
SET DEFINE OFF;

CREATE OR REPLACE PROCEDURE "EXAM_DB"."ADD_SOLVED_TEST" (
    p_student_username  VARCHAR2,
    p_test_id           INTEGER
) IS

    v_solved_id    INTEGER;
    v_student_id   INTEGER := -1;
    ex_student_not_found EXCEPTION;
    PRAGMA exception_init ( ex_student_not_found, -20006 );
    CURSOR c_questios_id IS
    SELECT UNIQUE
        id
    FROM
        question
    WHERE
        question.test_id = p_test_id;

    v_question_id  INTEGER;
BEGIN
    SELECT
        id
    INTO v_student_id
    FROM
        student
    WHERE
        username = p_student_username;

    IF ( v_student_id = -1 ) THEN
        raise_application_error(-20006, 'user should be a student');
    END IF;

    INSERT INTO solved_test (
        points,
        student_id,
        test_id,
        finished
    ) VALUES (
        0,
        v_student_id,
        p_test_id,
        'n'
    );

    SELECT
        MAX(id)
    INTO v_solved_id
    FROM
        solved_test;

    OPEN c_questios_id;
    LOOP
        FETCH c_questios_id INTO v_question_id;
        EXIT WHEN c_questios_id%notfound;
        INSERT INTO solved_question (
            answer,
            selected_options,
            sub_points,
            question_id,
            solved_test_id
        ) VALUES (
            '',
            '_',
            0,
            v_question_id,
            v_solved_id
        );

    END LOOP;

    CLOSE c_questios_id;
END;
/
--------------------------------------------------------
--  DDL for Procedure ADD_STUDENT
--------------------------------------------------------
SET DEFINE OFF;

CREATE OR REPLACE PROCEDURE "EXAM_DB"."ADD_STUDENT" (
    p_fname      VARCHAR,
    p_lname      VARCHAR,
    p_username   VARCHAR,
    p_password   VARCHAR,
    p_photo_url  VARCHAR
) IS
BEGIN
    INSERT INTO student (
        first_name,
        last_name,
        username,
        password,
        photo_url,
        points
    ) VALUES (
        p_fname,
        p_lname,
        p_username,
        p_password,
        p_photo_url,
        0
    );

END;
/
--------------------------------------------------------
--  DDL for Procedure ADD_TEACHER
--------------------------------------------------------
SET DEFINE OFF;

CREATE OR REPLACE PROCEDURE "EXAM_DB"."ADD_TEACHER" (
    p_fname      VARCHAR,
    p_lname      VARCHAR,
    p_username   VARCHAR,
    p_password   VARCHAR,
    p_photo_url  VARCHAR
) IS
BEGIN
    INSERT INTO teacher (
        first_name,
        last_name,
        username,
        password,
        photo_url
    ) VALUES (
        p_fname,
        p_lname,
        p_username,
        p_password,
        p_photo_url
    );

END;
/
--------------------------------------------------------
--  DDL for Procedure ADD_TEST
--------------------------------------------------------
SET DEFINE OFF;

CREATE OR REPLACE PROCEDURE "EXAM_DB"."ADD_TEST" (
    p_time                 VARCHAR2,
    p_test_duration        INTEGER,
    p_correcting_duration  INTEGER,
    p_course_title         VARCHAR2,
    p_teacher_username     VARCHAR2
) IS
    v_course_id   INTEGER;
    v_teacher_id  INTEGER;
BEGIN
    SELECT
        id
    INTO v_course_id
    FROM
        course
    WHERE
        course.title = p_course_title;

    SELECT
        id
    INTO v_teacher_id
    FROM
        teacher
    WHERE
        teacher.username = p_teacher_username;

    INSERT INTO test (
        start_time,
        test_duration,
        correcting_duration,
        course_id,
        teacher_id,
        validated
    ) VALUES (
        ( to_date(p_time, 'DD/MM/YYYY HH24:MI:SS') ),
        p_test_duration,
        p_correcting_duration,
        v_course_id,
        v_teacher_id,
        'n'
    );

END;
/
--------------------------------------------------------
--  DDL for Procedure CLEAR_TEST
--------------------------------------------------------
SET DEFINE OFF;

CREATE OR REPLACE PROCEDURE "EXAM_DB"."CLEAR_TEST" (
    p_test_id INTEGER
) IS
BEGIN
    DELETE FROM options
    WHERE
        options.question_id IN (
            SELECT
                question.id
            FROM
                question
            WHERE
                question.test_id = p_test_id
        );

    DELETE FROM question
    WHERE
        question.test_id = p_test_id;

END;
/
--------------------------------------------------------
--  DDL for Procedure DELETE_TEST
--------------------------------------------------------
SET DEFINE OFF;

CREATE OR REPLACE PROCEDURE "EXAM_DB"."DELETE_TEST" (
    p_test_id   INTEGER,
    p_username  VARCHAR2
) IS

    ex_teacher_owner EXCEPTION;
    PRAGMA exception_init ( ex_teacher_owner, -20036 );
    ex_teacher_owner_time EXCEPTION;
    PRAGMA exception_init ( ex_teacher_owner_time, -20046 );
    v_user_0id  INTEGER;
    v_user_1id  INTEGER;
    v_timer     DATE;
BEGIN
    SELECT
        id
    INTO v_user_0id
    FROM
        teacher
    WHERE
        username = p_username;

    SELECT
        teacher_id,
        start_time
    INTO
        v_user_1id,
        v_timer
    FROM
        test
    WHERE
        id = p_test_id;

    IF ( v_user_1id != v_user_0id ) THEN
        raise_application_error(-20036, 'teacher does not have a permission to delete');
    END IF;

    IF ( v_timer < sysdate ) THEN
        raise_application_error(-20046, 'cannot delete test already begun');
    END IF;
    DELETE FROM test
    WHERE
        test.id = p_test_id;

END;
/
--------------------------------------------------------
--  DDL for Procedure PROC_COMMIT_
--------------------------------------------------------
SET DEFINE OFF;

CREATE OR REPLACE PROCEDURE "EXAM_DB"."PROC_COMMIT_" IS BEGIN
    ALTER TABLE corrected_question
    PARALLEL 1;
ALTER TABLE corrected_test
    PARALLEL 1;

ALTER TABLE course
    PARALLEL 1;

ALTER TABLE options
    PARALLEL 1;

ALTER TABLE question
    PARALLEL 1;

ALTER TABLE solved_question
    PARALLEL 1;

ALTER TABLE solved_test
    PARALLEL 1;

ALTER TABLE student
    PARALLEL 1;

ALTER TABLE teacher
    PARALLEL 1;

ALTER TABLE test
    PARALLEL 1;

COMMIT;
END;

/
--------------------------------------------------------
--  DDL for Procedure START_SYSTEM_TESTING
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "EXAM_DB"."START_SYSTEM_TESTING" (
    p_test_id INTEGER
) IS

    ex_test_is_over EXCEPTION;
    PRAGMA exception_init ( ex_test_is_over, -20002 );
    v_validated VARCHAR2(1) := 'n';
BEGIN
    IF ( check_time(p_test_id, true) ) THEN
        raise_application_error(-20002, 'test is running, cant validate the test');
    END IF;

    IF ( check_time(p_test_id, false) ) THEN
        raise_application_error(-20002, 'test is under correcting, cant validate the test');
    END IF;

    SELECT
        validated
    INTO v_validated
    FROM
        test
    WHERE
        test.id = p_test_id;

    IF ( v_validated != 'y' ) THEN
        start_system_testing_solved(p_test_id);
        start_system_testing_corrected(p_test_id);
        UPDATE test
        SET
            validated = 'y'
        WHERE
            test.id = p_test_id;

        UPDATE student
        SET
            points = points + (
                SELECT
                    points
                FROM
                    solved_test
                WHERE
                        solved_test.student_id = student.id
                    AND solved_test.test_id = p_test_id
            ) + (
                SELECT
                    SUM(points)
                FROM
                    corrected_test
                WHERE
                        student.id = corrected_test.student_id
                    AND corrected_test.solved_test_id IN (
                        SELECT
                            solved_test.id
                        FROM
                            solved_test
                        WHERE
                            solved_test.test_id = p_test_id
                    )
            );

    END IF;

END;

/
--------------------------------------------------------
--  DDL for Procedure START_SYSTEM_TESTING_ALL
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "EXAM_DB"."START_SYSTEM_TESTING_ALL" IS

    CURSOR c_test IS
    SELECT
        *
    FROM
        test
    WHERE
            sysdate > test.start_time + 1 / 1440 * ( test_duration + correcting_duration )
        AND validated != 'y'
    FOR UPDATE;

BEGIN
    FOR rec IN c_test LOOP
        start_system_testing_solved(rec.id);
        start_system_testing_corrected(rec.id);
        UPDATE test
        SET
            validated = 'y'
        WHERE
            test.id = rec.id;

        UPDATE student
        SET
            points = points + (
                SELECT
                    SUM(points)
                FROM
                    corrected_test
                WHERE
                        student.id = corrected_test.student_id
                    AND corrected_test.solved_test_id IN (
                        SELECT
                            solved_test.id
                        FROM
                            solved_test
                        WHERE
                            solved_test.test_id = rec.id
                    )
            )
        WHERE
            (
                SELECT
                    SUM(points)
                FROM
                    corrected_test
                WHERE
                        student.id = corrected_test.student_id
                    AND corrected_test.solved_test_id IN (
                        SELECT
                            solved_test.id
                        FROM
                            solved_test
                        WHERE
                            solved_test.test_id = rec.id
                    )
            ) IS NOT NULL;

        UPDATE student
        SET
            points = points + (
                SELECT
                    SUM(points)
                FROM
                    solved_test
                WHERE
                        solved_test.student_id = student.id
                    AND solved_test.test_id = rec.id
            )
        WHERE
            (
                SELECT
                    SUM(points)
                FROM
                    solved_test
                WHERE
                        solved_test.student_id = student.id
                    AND solved_test.test_id = rec.id
            ) IS NOT NULL;

    END LOOP;
END;

/
--------------------------------------------------------
--  DDL for Procedure START_SYSTEM_TESTING_CORRECTED
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "EXAM_DB"."START_SYSTEM_TESTING_CORRECTED" (
    p_test_id INTEGER
) IS

    CURSOR c_corrected_test IS
    SELECT
        *
    FROM
        corrected_test
    WHERE
        corrected_test.solved_test_id IN (
            SELECT
                solved_test.id
            FROM
                solved_test
            WHERE
                test_id = p_test_id
        )
    FOR UPDATE;

BEGIN
    FOR rec IN c_corrected_test LOOP
        UPDATE corrected_test
        SET
            corrected_test.points = validate_corrected_test(corrected_test.id)
        WHERE
            rec.id = corrected_test.id;

    END LOOP;
END;

/
--------------------------------------------------------
--  DDL for Procedure START_SYSTEM_TESTING_SOLVED
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "EXAM_DB"."START_SYSTEM_TESTING_SOLVED" (
    p_test_id INTEGER
) IS
    CURSOR c_solved_test IS
    SELECT
        *
    FROM
        solved_test
    WHERE
        p_test_id = solved_test.test_id
    FOR UPDATE;

BEGIN
    FOR rec IN c_solved_test LOOP
        UPDATE solved_test
        SET
            solved_test.points = validate_solved_test(solved_test.id)
        WHERE
            rec.id = solved_test.id;

    END LOOP;
END;

/
--------------------------------------------------------
--  DDL for Procedure UPDATE_CORRECTED_QUESTION
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "EXAM_DB"."UPDATE_CORRECTED_QUESTION" (
    p_validation             INTEGER,
    p_corrected_question_id  INTEGER
) IS
BEGIN
    UPDATE corrected_question
    SET
        corrected_question.validation = p_validation
    WHERE
        corrected_question.id = p_corrected_question_id;

END;

/
--------------------------------------------------------
--  DDL for Procedure UPDATE_SOLVED_QUESTION
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "EXAM_DB"."UPDATE_SOLVED_QUESTION" (
    p_answer              VARCHAR2,
    p_selected_options    VARCHAR2,
    p_solved_question_id  INTEGER
) IS
BEGIN
    UPDATE solved_question
    SET
        solved_question.answer = p_answer
    WHERE
        solved_question.id = p_solved_question_id;

    UPDATE solved_question
    SET
        solved_question.selected_options = p_selected_options
    WHERE
        solved_question.id = p_solved_question_id;

END;

/
--------------------------------------------------------
--  DDL for Function CHECK_TIME
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "EXAM_DB"."CHECK_TIME" (
    p_test_id  IN  INTEGER,
    p_solving  IN  BOOLEAN
) RETURN BOOLEAN IS
    start_time_date          DATE;
    solving_duration_min     INTEGER;
    correcting_duration_min  INTEGER;
    end_time_date            DATE;
    out_result               BOOLEAN;
BEGIN
    SELECT
        start_time,
        test_duration,
        correcting_duration
    INTO
        start_time_date,
        solving_duration_min,
        correcting_duration_min
    FROM
        test
    WHERE
        test.id = p_test_id;

    IF ( p_solving ) THEN
        end_time_date := start_time_date + ( 1 / 1440 * solving_duration_min );
    ELSE
        start_time_date := start_time_date + ( 1 / 1440 * solving_duration_min );
        end_time_date := start_time_date + ( 1 / 1440 * correcting_duration_min );
    END IF;

    IF ( sysdate BETWEEN start_time_date AND end_time_date ) THEN
        RETURN true;
    ELSE
        RETURN false;
    END IF;

END;

/
--------------------------------------------------------
--  DDL for Function SORT_STRING
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "EXAM_DB"."SORT_STRING" (
    p_string IN VARCHAR2
) RETURN VARCHAR2 IS
    v_sorted_string VARCHAR2(10);
BEGIN
    SELECT
        LISTAGG(regexp_substr(p_string, '\w', 1, level), '') WITHIN GROUP(
            ORDER BY
                1
        )
    INTO v_sorted_string
    FROM
        dual
    CONNECT BY
        regexp_substr(p_string, '\w', 1, level) IS NOT NULL;

    RETURN v_sorted_string;
END;

/
--------------------------------------------------------
--  DDL for Function VALIDATE_CORRECTED_QUESTION
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "EXAM_DB"."VALIDATE_CORRECTED_QUESTION" (
    p_corrected_question_id  IN  INTEGER,
    p_validation             IN  INTEGER,
    p_solved_question_id     IN  INTEGER
) RETURN INTEGER IS
    v_result               INTEGER;
    v_validation           VARCHAR(1);
    v_row_solved_question  solved_question%rowtype;
    v_row_question         question%rowtype;
BEGIN
    SELECT
        *
    INTO v_row_solved_question
    FROM
        solved_question
    WHERE
        id = p_solved_question_id;

    SELECT
        *
    INTO v_row_question
    FROM
        question
    WHERE
        id = v_row_solved_question.question_id;

    IF ( p_validation = 0 OR p_validation = 3 ) THEN
        RETURN 0;
    END IF;
    IF ( v_row_solved_question.sub_points > 0 ) THEN
        v_validation := 1;
    ELSE
        v_validation := 2;
    END IF;

    IF ( v_validation = p_validation ) THEN
        RETURN v_row_question.correction_point;
    ELSE
        RETURN -v_row_question.correction_point;
    END IF;

END;

/
--------------------------------------------------------
--  DDL for Function VALIDATE_CORRECTED_TEST
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "EXAM_DB"."VALIDATE_CORRECTED_TEST" (
    p_corrected_test_id IN INTEGER
) RETURN INTEGER IS
    v_total_result INTEGER := 0;
    CURSOR c_corrected_question IS
    SELECT
        *
    FROM
        corrected_question
    WHERE
        corrected_test_id = p_corrected_test_id
    FOR UPDATE;

BEGIN
    FOR rec IN c_corrected_question LOOP
        UPDATE corrected_question
        SET
            corrected_question.sub_points = validate_corrected_question(corrected_question.id, corrected_question.validation, corrected_question.
            solved_question_id)
        WHERE
            rec.id = corrected_question.id;

    END LOOP;

    SELECT
        SUM(sub_points)
    INTO v_total_result
    FROM
        corrected_question
    WHERE
        corrected_test_id = p_corrected_test_id;

    RETURN v_total_result;
END;

/
--------------------------------------------------------
--  DDL for Function VALIDATE_OPT_QUESTION
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "EXAM_DB"."VALIDATE_OPT_QUESTION" (
    p_selected_options  IN  VARCHAR2,
    p_question          IN  question%rowtype
) RETURN INTEGER IS

    CURSOR c_options IS
    SELECT
        order_opt
    FROM
        options
    WHERE
            question_id = p_question.id
        AND is_correct = 'y';

    v_order_opt           options.order_opt%TYPE;
    v_all_order_opt       VARCHAR2(100);
    v_selected_order_opt  VARCHAR2(100);
BEGIN
    v_all_order_opt := '';
    OPEN c_options;
    LOOP
        FETCH c_options INTO v_order_opt;
        EXIT WHEN c_options%notfound;
        v_all_order_opt := concat(v_all_order_opt, concat(v_order_opt, ','));
    END LOOP;

    CLOSE c_options;
    v_all_order_opt := sort_string(v_all_order_opt);
    v_selected_order_opt := sort_string(p_selected_options);
    IF ( v_all_order_opt = v_selected_order_opt ) THEN
        RETURN p_question.solved_points;
    ELSE
        RETURN 0;
    END IF;

END;

/
--------------------------------------------------------
--  DDL for Function VALIDATE_SOLVED_QUESTION
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "EXAM_DB"."VALIDATE_SOLVED_QUESTION" (
    p_solved_question_id  IN  INTEGER,
    p_question_id         IN  INTEGER,
    p_answer              IN  VARCHAR2,
    p_selected_options    IN  VARCHAR2
) RETURN INTEGER IS

    v_result        INTEGER := 0;
    v_row_question  question%rowtype;
    CURSOR c_question IS
    SELECT
        *
    FROM
        question
    WHERE
        id = p_question_id;

BEGIN
    FOR rec IN c_question LOOP
        v_row_question := rec;
    END LOOP;
    IF ( v_row_question.type = 'opt' ) THEN
        v_result := validate_opt_question(p_selected_options, v_row_question);
    END IF;

    IF ( v_row_question.type = 'trf' ) THEN
        v_result := validate_trf_question(p_selected_options, v_row_question);
    END IF;

    IF ( v_row_question.type = 'wrd' ) THEN
        v_result := validate_wrd_question(p_answer, v_row_question);
    END IF;

    RETURN v_result;
END;

/
--------------------------------------------------------
--  DDL for Function VALIDATE_SOLVED_TEST
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "EXAM_DB"."VALIDATE_SOLVED_TEST" (
    p_solved_test_id IN INTEGER
) RETURN INTEGER IS

    v_row_solved_question  solved_question%rowtype;
    v_total_result         INTEGER := 0;
    CURSOR c_solved_question IS
    SELECT
        *
    FROM
        solved_question
    WHERE
        solved_test_id = p_solved_test_id
    FOR UPDATE;

BEGIN
    FOR rec IN c_solved_question LOOP
        v_row_solved_question := rec;
        UPDATE solved_question
        SET
            solved_question.sub_points = validate_solved_question(solved_question.id, rec.question_id, rec.answer, rec.selected_options)
        WHERE
            rec.id = solved_question.id;

    END LOOP;

    SELECT
        SUM(sub_points)
    INTO v_total_result
    FROM
        solved_question
    WHERE
        solved_test_id = p_solved_test_id;

    RETURN v_total_result;
END;

/
--------------------------------------------------------
--  DDL for Function VALIDATE_TRF_QUESTION
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "EXAM_DB"."VALIDATE_TRF_QUESTION" (
    p_selected_options  IN  VARCHAR2,
    p_question          IN  question%rowtype
) RETURN INTEGER IS
BEGIN
    RETURN validate_opt_question(p_selected_options, p_question);
END;

/
--------------------------------------------------------
--  DDL for Function VALIDATE_WRD_QUESTION
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "EXAM_DB"."VALIDATE_WRD_QUESTION" (
    p_answer    IN  VARCHAR2,
    p_question  IN  question%rowtype
) RETURN INTEGER is begin
IF ( p_answer = p_question.correct_answer ) THEN
    RETURN p_question.solved_points;
ELSE
    RETURN 0;
END IF;

end;
/
--------------------------------------------------------
--  Constraints for Table CORRECTED_QUESTION
--------------------------------------------------------

ALTER TABLE "EXAM_DB"."CORRECTED_QUESTION"
    ADD CONSTRAINT "CORRECTED_QUESTION_PK" PRIMARY KEY ( "ID" )
        USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS
            STORAGE ( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645 PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT )
        TABLESPACE "SYSTEM"
    ENABLE;

ALTER TABLE "EXAM_DB"."CORRECTED_QUESTION" MODIFY (
    "CORRECTED_TEST_ID"
        NOT NULL ENABLE
);

ALTER TABLE "EXAM_DB"."CORRECTED_QUESTION" MODIFY (
    "SOLVED_QUESTION_ID"
        NOT NULL ENABLE
);

ALTER TABLE "EXAM_DB"."CORRECTED_QUESTION" MODIFY (
    "SUB_POINTS"
        NOT NULL ENABLE
);

ALTER TABLE "EXAM_DB"."CORRECTED_QUESTION" MODIFY (
    "ID"
        NOT NULL ENABLE
);
--------------------------------------------------------
--  Constraints for Table CORRECTED_TEST
--------------------------------------------------------

ALTER TABLE "EXAM_DB"."CORRECTED_TEST"
    ADD CONSTRAINT "CORRECTED_TEST_PK" PRIMARY KEY ( "ID" )
        USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS
            STORAGE ( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645 PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT )
        TABLESPACE "SYSTEM"
    ENABLE;

ALTER TABLE "EXAM_DB"."CORRECTED_TEST" MODIFY (
    "STUDENT_ID"
        NOT NULL ENABLE
);

ALTER TABLE "EXAM_DB"."CORRECTED_TEST" MODIFY (
    "SOLVED_TEST_ID"
        NOT NULL ENABLE
);

ALTER TABLE "EXAM_DB"."CORRECTED_TEST" MODIFY (
    "POINTS"
        NOT NULL ENABLE
);

ALTER TABLE "EXAM_DB"."CORRECTED_TEST" MODIFY (
    "ID"
        NOT NULL ENABLE
);

ALTER TABLE "EXAM_DB"."CORRECTED_TEST"
    ADD CONSTRAINT "UNI_STUD_SOLVED" UNIQUE ( "SOLVED_TEST_ID",
                                              "STUDENT_ID" )
        USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS
            STORAGE ( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645 PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT )
        TABLESPACE "SYSTEM"
    ENABLE;
--------------------------------------------------------
--  Constraints for Table COURSE
--------------------------------------------------------

ALTER TABLE "EXAM_DB"."COURSE"
    ADD CONSTRAINT "COURSE__UN" UNIQUE ( "TITLE" )
        USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS
            STORAGE ( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645 PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT )
        TABLESPACE "SYSTEM"
    ENABLE;

ALTER TABLE "EXAM_DB"."COURSE"
    ADD CONSTRAINT "COURSE_PK" PRIMARY KEY ( "ID" )
        USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS
            STORAGE ( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645 PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT )
        TABLESPACE "SYSTEM"
    ENABLE;

ALTER TABLE "EXAM_DB"."COURSE" MODIFY (
    "TITLE"
        NOT NULL ENABLE
);

ALTER TABLE "EXAM_DB"."COURSE" MODIFY (
    "ID"
        NOT NULL ENABLE
);
--------------------------------------------------------
--  Constraints for Table OPTIONS
--------------------------------------------------------

ALTER TABLE "EXAM_DB"."OPTIONS"
    ADD CONSTRAINT "OPTION_PK" PRIMARY KEY ( "ID" )
        USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS
            STORAGE ( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645 PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT )
        TABLESPACE "SYSTEM"
    ENABLE;

ALTER TABLE "EXAM_DB"."OPTIONS" MODIFY (
    "QUESTION_ID"
        NOT NULL ENABLE
);

ALTER TABLE "EXAM_DB"."OPTIONS" MODIFY (
    "ORDER_OPT"
        NOT NULL ENABLE
);

ALTER TABLE "EXAM_DB"."OPTIONS" MODIFY (
    "IS_CORRECT"
        NOT NULL ENABLE
);

ALTER TABLE "EXAM_DB"."OPTIONS" MODIFY (
    "ID"
        NOT NULL ENABLE
);
--------------------------------------------------------
--  Constraints for Table QUESTION
--------------------------------------------------------

ALTER TABLE "EXAM_DB"."QUESTION"
    ADD CONSTRAINT "QUESTION_PK" PRIMARY KEY ( "ID" )
        USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS
            STORAGE ( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645 PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT )
        TABLESPACE "SYSTEM"
    ENABLE;

ALTER TABLE "EXAM_DB"."QUESTION"
    ADD CHECK ( type IN ( 'opt', 'trf', 'wrd' ) ) ENABLE;

ALTER TABLE "EXAM_DB"."QUESTION" MODIFY (
    "TEST_ID"
        NOT NULL ENABLE
);

ALTER TABLE "EXAM_DB"."QUESTION" MODIFY (
    "TEXT"
        NOT NULL ENABLE
);

ALTER TABLE "EXAM_DB"."QUESTION" MODIFY (
    "ID"
        NOT NULL ENABLE
);
--------------------------------------------------------
--  Constraints for Table SOLVED_QUESTION
--------------------------------------------------------

ALTER TABLE "EXAM_DB"."SOLVED_QUESTION"
    ADD CONSTRAINT "SOLVED_QUESTION_PK" PRIMARY KEY ( "ID" )
        USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS
            STORAGE ( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645 PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT )
        TABLESPACE "SYSTEM"
    ENABLE;

ALTER TABLE "EXAM_DB"."SOLVED_QUESTION" MODIFY (
    "SOLVED_TEST_ID"
        NOT NULL ENABLE
);

ALTER TABLE "EXAM_DB"."SOLVED_QUESTION" MODIFY (
    "QUESTION_ID"
        NOT NULL ENABLE
);

ALTER TABLE "EXAM_DB"."SOLVED_QUESTION" MODIFY (
    "SUB_POINTS"
        NOT NULL ENABLE
);

ALTER TABLE "EXAM_DB"."SOLVED_QUESTION" MODIFY (
    "ID"
        NOT NULL ENABLE
);
--------------------------------------------------------
--  Constraints for Table SOLVED_TEST
--------------------------------------------------------

ALTER TABLE "EXAM_DB"."SOLVED_TEST"
    ADD CONSTRAINT "STUDENT_TEST" UNIQUE ( "TEST_ID",
                                           "STUDENT_ID" )
        USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS
            STORAGE ( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645 PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT )
        TABLESPACE "SYSTEM"
    ENABLE;

ALTER TABLE "EXAM_DB"."SOLVED_TEST"
    ADD CONSTRAINT "SOLVED_TEST_PK" PRIMARY KEY ( "ID" )
        USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS
            STORAGE ( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645 PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT )
        TABLESPACE "SYSTEM"
    ENABLE;

ALTER TABLE "EXAM_DB"."SOLVED_TEST" MODIFY (
    "STUDENT_ID"
        NOT NULL ENABLE
);

ALTER TABLE "EXAM_DB"."SOLVED_TEST" MODIFY (
    "TEST_ID"
        NOT NULL ENABLE
);

ALTER TABLE "EXAM_DB"."SOLVED_TEST" MODIFY (
    "POINTS"
        NOT NULL ENABLE
);

ALTER TABLE "EXAM_DB"."SOLVED_TEST" MODIFY (
    "ID"
        NOT NULL ENABLE
);
--------------------------------------------------------
--  Constraints for Table STUDENT
--------------------------------------------------------

ALTER TABLE "EXAM_DB"."STUDENT"
    ADD CONSTRAINT "STUDENT__UN" UNIQUE ( "USERNAME" )
        USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS
            STORAGE ( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645 PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT )
        TABLESPACE "SYSTEM"
    ENABLE;

ALTER TABLE "EXAM_DB"."STUDENT"
    ADD CONSTRAINT "STUDENT_PK" PRIMARY KEY ( "ID" )
        USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS
            STORAGE ( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645 PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT )
        TABLESPACE "SYSTEM"
    ENABLE;

ALTER TABLE "EXAM_DB"."STUDENT" MODIFY (
    "PASSWORD"
        NOT NULL ENABLE
);

ALTER TABLE "EXAM_DB"."STUDENT" MODIFY (
    "USERNAME"
        NOT NULL ENABLE
);

ALTER TABLE "EXAM_DB"."STUDENT" MODIFY (
    "LAST_NAME"
        NOT NULL ENABLE
);

ALTER TABLE "EXAM_DB"."STUDENT" MODIFY (
    "FIRST_NAME"
        NOT NULL ENABLE
);

ALTER TABLE "EXAM_DB"."STUDENT" MODIFY (
    "ID"
        NOT NULL ENABLE
);

ALTER TABLE "EXAM_DB"."STUDENT" MODIFY (
    "POINTS"
        NOT NULL ENABLE
);
--------------------------------------------------------
--  Constraints for Table TEACHER
--------------------------------------------------------

ALTER TABLE "EXAM_DB"."TEACHER"
    ADD CONSTRAINT "TEACHER__UN" UNIQUE ( "USERNAME" )
        USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS
            STORAGE ( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645 PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT )
        TABLESPACE "SYSTEM"
    ENABLE;

ALTER TABLE "EXAM_DB"."TEACHER"
    ADD CONSTRAINT "TEACHER_PK" PRIMARY KEY ( "ID" )
        USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS
            STORAGE ( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645 PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT )
        TABLESPACE "SYSTEM"
    ENABLE;

ALTER TABLE "EXAM_DB"."TEACHER" MODIFY (
    "PASSWORD"
        NOT NULL ENABLE
);

ALTER TABLE "EXAM_DB"."TEACHER" MODIFY (
    "USERNAME"
        NOT NULL ENABLE
);

ALTER TABLE "EXAM_DB"."TEACHER" MODIFY (
    "LAST_NAME"
        NOT NULL ENABLE
);

ALTER TABLE "EXAM_DB"."TEACHER" MODIFY (
    "FIRST_NAME"
        NOT NULL ENABLE
);

ALTER TABLE "EXAM_DB"."TEACHER" MODIFY (
    "ID"
        NOT NULL ENABLE
);
--------------------------------------------------------
--  Constraints for Table TEST
--------------------------------------------------------

ALTER TABLE "EXAM_DB"."TEST"
    ADD CONSTRAINT "TEST_PK" PRIMARY KEY ( "ID" )
        USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS
            STORAGE ( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645 PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT )
        TABLESPACE "SYSTEM"
    ENABLE;

ALTER TABLE "EXAM_DB"."TEST" MODIFY (
    "TEACHER_ID"
        NOT NULL ENABLE
);

ALTER TABLE "EXAM_DB"."TEST" MODIFY (
    "COURSE_ID"
        NOT NULL ENABLE
);

ALTER TABLE "EXAM_DB"."TEST" MODIFY (
    "CORRECTING_DURATION"
        NOT NULL ENABLE
);

ALTER TABLE "EXAM_DB"."TEST" MODIFY (
    "TEST_DURATION"
        NOT NULL ENABLE
);

ALTER TABLE "EXAM_DB"."TEST" MODIFY (
    "START_TIME"
        NOT NULL ENABLE
);

ALTER TABLE "EXAM_DB"."TEST" MODIFY (
    "ID"
        NOT NULL ENABLE
);
--------------------------------------------------------
--  Ref Constraints for Table CORRECTED_QUESTION
--------------------------------------------------------

ALTER TABLE "EXAM_DB"."CORRECTED_QUESTION"
    ADD CONSTRAINT "CORRECTED_QUESTION_TEST_FK" FOREIGN KEY ( "CORRECTED_TEST_ID" )
        REFERENCES "EXAM_DB"."CORRECTED_TEST" ( "ID" )
    ENABLE;

ALTER TABLE "EXAM_DB"."CORRECTED_QUESTION"
    ADD CONSTRAINT "CORRECTED_SOLVED_QUESTION_FK" FOREIGN KEY ( "SOLVED_QUESTION_ID" )
        REFERENCES "EXAM_DB"."SOLVED_QUESTION" ( "ID" )
    ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table CORRECTED_TEST
--------------------------------------------------------

ALTER TABLE "EXAM_DB"."CORRECTED_TEST"
    ADD CONSTRAINT "CORRECTED_TEST_SOLVED_TEST_FK" FOREIGN KEY ( "SOLVED_TEST_ID" )
        REFERENCES "EXAM_DB"."SOLVED_TEST" ( "ID" )
    ENABLE;

ALTER TABLE "EXAM_DB"."CORRECTED_TEST"
    ADD CONSTRAINT "CORRECTED_TEST_STUDENT_FK" FOREIGN KEY ( "STUDENT_ID" )
        REFERENCES "EXAM_DB"."STUDENT" ( "ID" )
    ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table OPTIONS
--------------------------------------------------------

ALTER TABLE "EXAM_DB"."OPTIONS"
    ADD CONSTRAINT "OPTION_QUESTION_FK" FOREIGN KEY ( "QUESTION_ID" )
        REFERENCES "EXAM_DB"."QUESTION" ( "ID" )
            ON DELETE CASCADE
    ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table QUESTION
--------------------------------------------------------

ALTER TABLE "EXAM_DB"."QUESTION"
    ADD CONSTRAINT "QUESTION_TEST_FK" FOREIGN KEY ( "TEST_ID" )
        REFERENCES "EXAM_DB"."TEST" ( "ID" )
            ON DELETE CASCADE
    ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table SOLVED_QUESTION
--------------------------------------------------------

ALTER TABLE "EXAM_DB"."SOLVED_QUESTION"
    ADD CONSTRAINT "SOLVED_QUESTION_QUESTION_FK" FOREIGN KEY ( "QUESTION_ID" )
        REFERENCES "EXAM_DB"."QUESTION" ( "ID" )
    ENABLE;

ALTER TABLE "EXAM_DB"."SOLVED_QUESTION"
    ADD CONSTRAINT "SOLVED_QUESTION_SOLVED_TEST_FK" FOREIGN KEY ( "SOLVED_TEST_ID" )
        REFERENCES "EXAM_DB"."SOLVED_TEST" ( "ID" )
    ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table SOLVED_TEST
--------------------------------------------------------

ALTER TABLE "EXAM_DB"."SOLVED_TEST"
    ADD CONSTRAINT "SOLVED_TEST_STUDENT_FK" FOREIGN KEY ( "STUDENT_ID" )
        REFERENCES "EXAM_DB"."STUDENT" ( "ID" )
    ENABLE;

ALTER TABLE "EXAM_DB"."SOLVED_TEST"
    ADD CONSTRAINT "SOLVED_TEST_TEST_FK" FOREIGN KEY ( "TEST_ID" )
        REFERENCES "EXAM_DB"."TEST" ( "ID" )
    ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table TEST
--------------------------------------------------------

ALTER TABLE "EXAM_DB"."TEST"
    ADD CONSTRAINT "TEST_COURSE_FK" FOREIGN KEY ( "COURSE_ID" )
        REFERENCES "EXAM_DB"."COURSE" ( "ID" )
    ENABLE;

ALTER TABLE "EXAM_DB"."TEST"
    ADD CONSTRAINT "TEST_TEACHER_FK" FOREIGN KEY ( "TEACHER_ID" )
        REFERENCES "EXAM_DB"."TEACHER" ( "ID" )
    ENABLE;
      
      
----------------------------------------------------------
ALTER TABLE corrected_question
    PARALLEL 1;

ALTER TABLE corrected_test
    PARALLEL 1;

ALTER TABLE course
    PARALLEL 1;

ALTER TABLE options
    PARALLEL 1;

ALTER TABLE question
    PARALLEL 1;

ALTER TABLE solved_question
    PARALLEL 1;

ALTER TABLE solved_test
    PARALLEL 1;

ALTER TABLE student
    PARALLEL 1;

ALTER TABLE teacher
    PARALLEL 1;

ALTER TABLE test
    PARALLEL 1;

ALTER SESSION SET nls_date_format = 'DD-MM-YYYY HH24:MI:SS';

COMMIT;

----------------------------------------------------------
