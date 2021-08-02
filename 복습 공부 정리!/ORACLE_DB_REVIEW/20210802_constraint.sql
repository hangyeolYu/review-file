/*
   -[제약 조건 (CONSTRAINT)]

   : 테이블에 저장할 데이터에 대한 규칙
   데이터정의어 (DDL)과 같이 사용

   1) NOT NULL : 지정한 열에 NULL 허용하지않음
   (데이터 중복 허용 )
   2) UNIQUE : 지정한 열이 유일한 값(붕복 X)
   (데이터에 NULL은 중복 제외 )
   3) PRIMARY KEY(기본 키 ) : 유일한 값 + NULL 허용 X
   (화나의 테이블에 하나만 지정할 수 있음)
   4) FOREIGN KEY (외래키 ) : 다른 테이블에 열 참조하는값 입력
   5) CHECK : 조건식에 만족하는 데이터만 입력 가능

   * 테아블이 생성될떄 제약조건을 같이 지정 (보통)
   나중에 테이블 변경시에도 지정할 수 있음

   --테이블 생성
   EX) GAME_ID_CLASS
   GAME_ID VARCHAR (20)NOT NULL
   GAME_CLASS VARCHAR(20)NOT NULL
   LASTDATE DATE

*/

CREATE TABLE GAME_ID_CLASS (
    GAME_ID VARCHAR (20) NOT NULL,
    GAME_PASS VARCHAR(20)NOT NULL,
    LASTDATE DATE
);

SELECT * FROM GAME_ID_CLASS;

INSERT INTO GAME_ID_CLASS
VALUES ('Hankkkyoring','qsa645',TO_DATE('2021/08/01','YY/MM/DD'));

INSERT INTO GAME_ID_CLASS(LASTDATE)
VALUES (SYSDATE); --CONSTRAINT 를 NOT NULL 로 해놈!

SELECT * FROM GAME_ID_CLASS;

--GAME_PASS 만 널로 지정 (오류)
UPDATE GAME_ID_CLASS
SET GAME_PASS = NULL
WHERE GAME_ID = 'Hankkkyoring';

SELECT * FROM USER_CONSTRAINTS;
/*OWNER : 제약 조간 소유 계정
  CONSTRAINT_NAME: 제약 조건 이름 (생략시 오라클 자동 생성)
  CONSTRAINT_TYPE : 제약 조건 종류
  C : CHECK , NOT NULL
  U : UNIQUE
  P : PRIMARY KEY
  R : FOREIGN KEY
  V : VIEW 에서 WITH CHECK OPTION
  O : VIEW 에서 WITH READ ONLY

  제약 조건 이름 지정
  =>=> 제약 조건 관리를 위해 이름을 지정해주는것이 좋음
*/
CREATE TABLE GAME_ID_PASS_CONS_NAME (
    GAME_ID VARCHAR(20) CONSTRAINT ID__NN NOT NULL ,
    GAME_PASS VARCHAR(20)CONSTRAINT  PASS_NN NOT NULL ,
    LASTDATE DATE
);

SELECT * FROM USER_CONSTRAINTS;

--이미 생성한 테이블에 제약 조건 추가
--형식)
--ALTER TABLE 테이블명
--MODIFY (열이름 제약조건)

--1) NOT NULL
ALTER TABLE GAME_ID_PASS_CONS_NAME
MODIFY (LASTDATE CONSTRAINT LD_NN NOT NULL );
--제약 조건 이름이 지정되있어서 변경 불가

SELECT * FROM USER_CONSTRAINTS;

ALTER TABLE GAME_ID_PASS_CONS_NAME
DROP CONSTRAINT SYS_C007059;
--제약조건 이름을 지우고 생성

SELECT * FROM USER_CONSTRAINTS;

--제약조건 이름 변경(기존에 동일한 이름이 있다면 오류!)
ALTER TABLE GAME_ID_CLASS
RENAME CONSTRAINT SYS_C007055 to ID_NN2;

--sys_C007056 변경
ALTER TABLE GAME_ID_CLASS
RENAME CONSTRAINT SYS_C007056 TO PASS_NN2;

ALTER TABLE GAME_ID_CLASS
   DROP CONSTRAINT  PASS_NN2;

SELECT * FROM USER_CONSTRAINTS;

--2) UNIQUE
-- : 데이터 중복 허용 X
-- : NULl 값은 중복에 포함되지 않음(여러개 올수 있음)

--STUDENT 테이블
--ID : UNIQUE => ID_UQ
--NAME : NOT NULL => NAME_NN
--PHONE

SELECT * FROM TAB;

DROP TABLE STUDENT;

CREATE TABLE STUDENT (
    ID VARCHAR(20) CONSTRAINT ID_UQ UNIQUE ,
    NAME VARCHAR(20) CONSTRAINT NAME_NN NOT NULL ,
    PHONE VARCHAR(20)
);
SELECT * FROM USER_CONSTRAINTS;

--데이터 삽입  2명 (ID가 같은)
INSERT INTO STUDENT
VALUES (2021001,'홍길동','010-1234-5678');

INSERT INTO STUDENT
VALUES (2021001,'홍길순','010-1234-1234');
--데이터 삽입  2명 (ID가 NUlL)

INSERT INTO STUDENT
VALUES (NULL,'홍길동','010-1234-5678');

INSERT INTO STUDENT
VALUES (NULL,'홍길순','010-1234-1234');

SELECT * FROM STUDENT;

SELECT * FROM USER_CONSTRAINTS;

ALTER TABLE STUDENT
DROP CONSTRAINT ID_UQ;

--제약조건 추가 (ID_UQ)
--제약조건 추가 불가! 이미 ID 가 UNIQUE 하지않음!

DELETE FROM STUDENT
WHERE ID = 2021001 and NAME = '홍길순';
--유니크 하게 만들고 다시 해야함!

ALTER TABLE STUDENT
MODIFY (ID CONSTRAINT ID_UQ UNIQUE );

--제약조건 이름 변 (ID_UQ => )

ALTER TABLE STUDENT
RENAME CONSTRAINT ID_UQ to ID_UNIQYE;

--3) PRIMARY KEY (기본키)
-- : UNIQUE + NOT NULL
-- : 기본키가 다른 데이터를 대표할 수 있는 열로 지정
-- : 테이블에서 오직 한 개만 존재
-- :해당 열에는 자동으로 인덱스 만들어짐(보통 기본키가 SELET 문에 자주 사용됨 )

--Q1. PERSON 이라는 TABLE 을  생성
--ID NUMBER (2)
--NAME VARCHAR (20)
--GENDER VARCHAR (5)
--REGISTRATION  VARCHAR(15)

--A.PRIMARY KEY(기본키가 )가 될수 있는 열이 누굴깡(제약 조건 이름 지정)
-- B. NAME NOt NULL (제약 조건 이름 지정)
SELECT * FROM TAB;
DROP TABLE PERSON;
SELECT * FROM USER_CONSTRAINTS;
CREATE TABLE PERSON (
    ID NUMBER(2)CONSTRAINT PID_OK PRIMARY KEY ,
    NAME VARCHAR(20)CONSTRAINT PNAME_NN NOT NULL,
    GENDER VARCHAR(5),
    REGISTRATION VARCHAR(15)
);


CREATE TABLE PERSON (--밑에다가 제약조건 형식 지정  방법(테이블 레벨/아웃 라인 )
                        ID NUMBER(2) ,
                        NAME VARCHAR(20),
                        GENDER VARCHAR(5),
                        REGISTRATION VARCHAR(15),
                        CONSTRAINT PID_OK PRIMARY KEY (ID)
                        --,CONSTRAINT PNAME_NN NOT NULL (NAME)
                            --테이블 레벨 제약 조건 정의는 NOT NULL 지정할수 없음
                        --PRIMARY KEY,UNIQUE,FOREIGN KEY....
);

--PRIMARY KEY(기본키)는 데이터를 식별하는 유일한 값
--(SELECT 문에 많이 사용됨! => INDEX 로 지정 )
--인덱스 이름은 제약 조건 이름과 동일해줌

SELECT * FROM USER_INDEXES;

--PERSON 테이블에 총 5명을 삽입
--PERSON 테이블에 ID 는 SEQUENCE를 통해 생성(SEQ_PERSON)
--START WITH : 1
--MINVALUE : 1
--MAXVALUE: 5
--INCREMENT BY :1
--CYCLE

--2) SEQ_PERSON 통해 데이터 삽입
SELECT * FROM PERSON;

CREATE SEQUENCE SEQ_PERSON
    INCREMENT BY 1
    START WITH 1
    MINVALUE 1
    MAXVALUE 5
    CYCLE
    NOCACHE;

SELECT * FROM USER_SEQUENCES;

INSERT INTO PERSON(ID,NAME)
VALUES (SEQ_PERSON.nextval,'홍길동');
-- 키의 성격을 넣어줌!
INSERT INTO PERSON(ID,NAME)
VALUES (NULL,'홍길동');--ID 지정이 되있으므로 NOT NULL 조건에 만족 X

--ALTER,MODIFy,RENAME,DROP 문 작성할 수 있음!

--4) 외래 | 외부  키 (FOREIGN KEY)
--: 두 테이블의 관계 정의하는 제약 조건
-- : EMp,DEPT
--EMP 테이블에서 DEPTNO는 외래키 ,DEPT 테이블에서 DEPTNO 는 기본키
SELECT * FROM USER_CONSTRAINTS;
SELECT * FROM EMP;
SELECT * FROM DEPT;

INSERT INTO EMP (EMPNO,ENAME,JOB,DEPTNO)
VALUES (5000,'이클립','DEVELOPER',50);
--?? 50은 안됨 ㅋ
--외래키 지정 : 참조하는 테이블의 기본키 이거나
--NULL 값인 값 ('참조할 데이터가 없다! ')지정가능!
--외래키가 NULL인경우 JOIN 을 하면 결과 테이블?
--: 외래키가 NULL인 행 제외

--FOREGIN KEY 지정
--CREATE TABLE 테이블명 (
-- ....(다른열 정의),
-- 열 자료형 CONSTRAINT [제약조건 이름(선택)] FOREIGN KEY (열이름 )
-- REFERENCE 참조 테이블(열 )
--
--
-- );

--DEPT_FK 테이블 생성
CREATE TABLE DEPT_FK(
  DEPTNO NUMBER(2) CONSTRAINT DEPT_FK_PK PRIMARY KEY ,
  DNAME VARCHAR(20),
  LOC   VARCHAR(20)
);
--EMP_FK 테이블 생성 (DEPT_FK의 DEPTNO를 참조 )
--기본키 : EMPNO
--외래키 :DEPTNO
CREATE TABLE EMP_FK (
    EMP NUMBER(4) CONSTRAINT EMP_FK_PK PRIMARY KEY ,
    ENAME VARCHAR(20),
    JOB VARCHAR(20),
    MGR NUMBER(4),
    HIREDATE DATE,
    SAL NUMBER(7,2),
    COMM NUMBER(7,2),
    DEPTNO NUMBER(2) CONSTRAINT EMP_FK_FK REFERENCES DEPT_FK(DEPTNO)
);

INSERT INTO EMP_FK(EMPNO,ENAME,DEPTNO)
values (1000,'홍길동',10);
--외래키가 참조할 DEPTNO 생성되지 않은 채로 데이터 삽입이 불가능

INSERT INTO DEPT_FK(DEPTNO, DNAME, LOC)
VALUES(10,'ACCOUNTING','SEOUL');
--먼저 DEPTNO 를 생성한 다음에 (1000,'홍길동',10)데이터 삽입 가능

SELECT * FROM EMP_FK;
SELECT * FROM DEPT_FK;

DELETE FROM DEPT_FK
WHERE DEPTNO = 10;
--오류 발생!
--DEPTNO 10번을 참조하고 있는 레코드가 존재 ('홍길동 ')

/*1.EMP 테이블의  '홍길동' 삭제하고 DEPT 테이블에 10번을 삭제
  2. EMP 테이블의 '홍길동'의 DEPTNO를 NULL 수정
  3. EMP 테이블의 FOREIGN KEY 제약조건 삭제


  **** FOREIGN KEY 는 수정이 빈번하지 않은 열을 참조하는게 좋음!
  ON DELETE CASCADE : DEPT 테이블에 10번이 삭제될 경우에
  이를 참조하는 데이터를 함꼐 삭제

  ON DELETE SET NULL : DEPT 테이블에 10번이 삭제될 경우에
  이를 참조하는 데이터를 NULL 로 지정

*/

CREATE TABLE EMP_FK (
                EMP NUMBER(4) CONSTRAINT EMP_FK_PK PRIMARY KEY ,
                ENAME VARCHAR(20),
                JOB VARCHAR(20),
                MGR NUMBER(4),
                HIREDATE DATE,
                SAL NUMBER(7,2),
                COMM NUMBER(7,2),
               DEPTNO NUMBER(2)
              CONSTRAINT EMP_FK_FK
             REFERENCES DEPT_FK(DEPTNO) ON DELETE CASCADE
                    -- 삭제 할때 나도 같이 삭제!
);
--Q1. EMP_FK, DEPT_FK 를 생성
--1) ON DELETE SET NULL
--2) ON DELETE CASCADE

SELECT * FROM TAB;
DROP TABLE EMP_FK;
DROP TABLE DEPT_FK;

CREATE TABLE EMP_FK (
      EMPNO NUMBER(4)  ,
      ENAME VARCHAR(20),
      JOB VARCHAR(20),
      MGR NUMBER(4),
      HIREDATE DATE,
      SAL NUMBER(7,2),
      COMM NUMBER(7,2),
     DEPTNO NUMBER(2),
     CONSTRAINT  EMP_FK_PK PRIMARY KEY  (EMPNO),
     CONSTRAINT EMP_FK_FK FOREIGN KEY (DEPTNO)
     REFERENCES DEPT_FK(DEPTNO) ON DELETE SET NULL
    -- 삭제 할때 나도 같이 삭제!
);

SELECT * FROM USER_CONSTRAINTS;
SELECT * FROM EMP_FK;
SELECT * FROM DEPT_FK;


--연결된 보조키가 널값으로 바뀜
DELETE FROM DEPT_FK
WHERE DEPTNO =10;
--ON DELETE CASCADE 시 관련된 10 데이터가 전부 사라짐 ! EMP_FK 에도!
--데이터에 형식,관계도에 따라 상황에 마춰 사용하자~!
