CREATE TABLE "option" (
    id           INTEGER NOT NULL,
    text         VARCHAR2(250),
    is_correct   CHAR(1) NOT NULL,
    "order"      VARCHAR2(1) NOT NULL,
    photo_url    VARCHAR2(250),
    question_id  INTEGER NOT NULL
);