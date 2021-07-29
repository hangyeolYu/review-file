/*
데이터 정의어 (DDL,Data Definition Language)
: 여러 객체 (object)의 생성 ,변경,삭제 관련 기능
* 여기서 객체? ==테이블

: 객체 생성 : CREATE
: 객체 변경 : ALTER
:객체 삭제 : DROP

:수행 내용이 바로 반영(바로 자동 COMMIT,ROLLBACK 불가)

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

CREATE TABLE ATTENDANCE (
  ATTENDDATE DATE,
  PEOPLE VARCHAR2(10),--VARCHAR2 는 오라클 기준 VARCHAR 는 표준
  ATTEND NUMBER(10),



);
