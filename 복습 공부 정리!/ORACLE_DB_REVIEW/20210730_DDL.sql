/*
데이터 정의어 (DDL,Data Definition Language)
: 여러 객체 (object)의 생성 ,변경,삭제 관련 기능
* 여기서 객체? ==테이블

: 객체 생성 : CREATE
: 객체 변경 : ALTER
:객체 삭제 : DROP

: ****수행 내용이 바로 반영(바로 자동 COMMIT,ROLLBACK 불가)

*/

--객체 생성 (CREATE)
--CREATE TABLE 소유계정(SYSTEM,SCOTT(선택)).테이블 명(
-- 열이름 자료형 ,
-- 열이름 자료형 ,
-- 열이름 자료형
-- );

--테이블명 명명법
--1) 테이블 명은 중복 X
--2) 30 byte 이하 (영어는 30글자, 한글은 15 글자 )
--3) 테이블 이름 사이에 특수문자가 들어갈 수 있음
---> 첫 문자는 영어 이어야함 (EMP11 (O),11EMP (X))
--4) 키워드는 이름으로 사용할 수 없음 (SELECT,DROP,FROM ...)

--열 이름을 만드는 규칙
--1) 첫 문자 문자 시작
--2) 30byte 이하
--3) 하나의 테이블 안에서 열 이름 중복 X (EMPNO,EMPNO (X)
--4) 열 이름 사이에 특수 문자가 들어갈 수 있음 (_,#,$)
--5) 키워드 사용 불가

--Q1. CREATE TABLE ATTENDANCE
--열 1: 출석날짜
--열 2 : 출석한 사람 이름
--열 3 : 출석 인원
--열 4 : 신체 온도


--[CREATE]
SELECT * FROM TAB;
DROP TABLE ATTENDANCE;

CREATE TABLE ATTENDANCE (
  ATTENDDATE DATE,
  PARTICIPANT VARCHAR2(10),--VARCHAR2 는 오라클 기준 VARCHAR 는 표준
  ID NUMBER(10),
  TEMP VARCHAR2(10)
  --TEMP NUMBER (10,2) 소수점 둘째 자리까지 표현하기 숫자형


);
-- 데이터 정의어 들은 자동으로 COMMIT, ROLLBACK 됨!

SELECT * FROM ATTENDANCE;

--데이터 3명 정도 추가!(DML)
INSERT INTO ATTENDANCE
VALUES (TO_DATE(sysdate),'유한결',1,'99.9');

INSERT INTO ATTENDANCE
VALUES (TO_DATE(sysdate),'홍길동',2,'20.4');

INSERT INTO ATTENDANCE
VALUES (TO_DATE(sysdate),'홍길순',3,'35.5');

INSERT INTO ATTENDANCE
VALUES (TO_DATE(sysdate),'이클립',4,'32.8');

INSERT INTO ATTENDANCE
VALUES (TO_DATE(sysdate),'유인텔',5,'36.6');

COMMIT




--기존 ATTENDANCE 테이블 복사 (모든 데이터)
DROP TABLE ATTENDANCE_TEMP;
CREATE TABLE ATTENDANCE_TEMP
AS SELECT * FROM ATTENDANCE;

SELECT * FROM ATTENDANCE_TEMP;

--기존 ATTENDANCE 테이블 구조만 복사
DROP TABLE ATTENDANCE_TEMP2;
CREATE TABLE ATTENDANCE_TEMP2
AS SELECT * FROM ATTENDANCE
WHERE 1<> 1; --false  조건문을 추가하면 구조만 복사 할수 있음 !

SELECT * FROM ATTENDANCE_TEMP2;

--일부 데이터만 복사 (ID =1인 사람많 복사)해서 새로운 테이블 생성

DROP TABLE ATTENDANCE_TEMP3;
CREATE TABLE ATTENDANCE_TEMP3
AS SELECT * FROM ATTENDANCE
   WHERE ID =1;

SELECT * FROM ATTENDANCE_TEMP3;

--[ALTER]
--테이블 열단위의 변경 및 추가하는 명령어

CREATE TABLE ATTENDANCE_ALTTER
AS SELECT * FROM ATTENDANCE;

SELECT * FROM ATTENDANCE_ALTTER;

--1) 열 이름 추가 ADD
--: 과제 제츌 여부 (ISSUBMiTTED,VARCHAR(1))
ALTER TABLE ATTENDANCE_ALTTER
ADD ISSUBMITTED VARCHAR2(1);

SELECT * FROM ATTENDANCE_ALTTER;

--2) 열 이름 수정 RENAME
ALTER TABLE ATTENDANCE_ALTTER
RENAME COLUMN ISSUBMITTED TO ISSUBMIT;

--3) 열 데이터 자료형 변셩 MODIFY('O','X' => 1,0)
ALTER TABLE ATTENDANCE_ALTTER
MODIFY  ISSUBMIT NUMBER(1);

--4) 열 삭제 DROP (DROP TABLE / DROP COLUMN)
ALTER TABLE ATTENDANCE_ALTTER
DROP COLUMN ISSUBMIT ;

SELECT * FROM ATTENDANCE_ALTTER;

--[]테이블 관련
--1) 테이블 이름 변경 RENAME (RENAME COLUMN == 테이블 열이름 변경)
-- 그냥 RENAME 만 하면 테이블 이름 변경
RENAME ATTENDANCE_ALTTER TO ATTENDANCE_RENAME;

SELECT * FROM ATTENDANCE_ALTTER; -- 사용 불가
SELECT * FROM ATTENDANCE_RENAME;

--2) 테이블 내부 모든 데이터를 삭제 TRUNCATE
TRUNCATE TABLE ATTENDANCE_RENAME;

SELECT * FROM ATTENDANCE_RENAME;--tq

/*
TRUNCATE VS DELETE
TRUNCATE (DDL) -- 자동 커밋 (ROLLBACK 불가)(**되돌릴수 없음!)
DELETE (*그래서 요거 주로씀 )(DML) -- (우리가 COMMIT 을 해줘야 DB 적용 가능)

*/

--3) 테이블 삭제 DROP (DROP TABLE ~~)
DROP TABLE SSS; --TABLE OR VIEW DOES NOT EXIST 에러
--해당 테이블이 없을경우
DROP TABLE ATTENDANCE_RENAME;
SELECT * FROM ATTENDANCE_RENAME;








