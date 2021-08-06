--PL/ SQL  :SQL 만으로는 구현이 어려운 작업을 수행하기 위해서 오라클에서
--제공한 언어
--EX) 조건문,반복문,변수설정...
--DB 작업을 수행하는 명령어 + 실행 명령어
--:블록 단위로 작성
--* 블록 (block):  PL/SQL 프로그램의 기본 단위

/*
형식)

DECLAPE(생략가능)
[선언부];
BEGIN
[명령어];
EXCEPTION(생략가능)
[오류처리];
END;

*/

--화면에 문자열 출력 (SERVEROUTPUT ON으로 변경 )
--DB에 연결이 끊겼거나 재접할때 다시 실행해야함
SET SERVEROUTPUT ON;
BEGIN
 DBMS_OUTPUT.PUT_LINE('HI ORACKE PL/SQL');

end;
/
--작성이 끝났다!

--실행: CTRL +ENTER ,F9 (여기말고)

--변수와 상수
--변수 (variable)
--: 데이터를 저장하는 공간 (변수 이름 + 자료형)
-- : declare (선언부) 에 작성
--형삭 ) 변수 이름 자료형 : =값
DECLARE --선언부
    SCOTT_NUM NUMBER(4) := 1234; --변수 생성 하자마자 데이터 초기화
    SCOTT_BIRTHDATE DATE; --변수만 생성
BEGIN
        SCOTT_BIRTHDATE := SYSDATE;--실행부에서 데이터 선언
        DBMS_OUTPUT.PUT_LINE('ID' || SCOTT_NUM);
        DBMS_OUTPUT.PUT_LINE('BIRTHDAY' || SCOTT_BIRTHDATE);
END;
/


   -- Q1. 두수를 저장하는 변수를 만들고 해당 수 더하는 출력문 작성
DECLARE
NUM_1 NUMBER(5) := 10;
NUM_2 NUMBER (5) := 20;
BEGIN
DBMS_OUTPUT.PUT_LINE (NUM_1 + NUM_2);

END;
/

--본인이 좋아하는 음악,영화를 저장하는 변수를 만들고 그 변수를 출력문 작성
DECLARE
    MY_MUSIC VARCHAR(20) := 'A SONG FOR YOU';
    MY_MOVIE VARCHAR(20) := '본 투 비 블루';
    BEGIN
    DBMS_OUTPUT.PUT_LINE (MY_MUSIC);
    DBMS_OUTPUT.PUT_LINE (MY_MOVIE);
    END;
    /

    --2) 상수 (Constant)
    -- : 변하지 않는값
    --(프로그램이 종료 될때까지 변하지 않음)
    --형식) 변수 이름 CONSTANT 자료형 := 값;
    DECLARE
    PI CONSTANT NUMBER(5,2) := 3.14;
    RADIUS NUMBER(5) :=5;

    BEGIN
    --원을 넓이를 구해서 출력
    DBMS_OUTPUT.PUT_LINE ('원을 넓이 : ' || RADIUS * RADIUS * PI);
    DBMS_OUTPUT.PUT_LINE ('원을 둘레 : ' || RADIUS * 2 * PI);

    END;
/
--3) 변수의 기본값 설정
-- : DEFAULT 키워드 사용
-- 형식 ) 변수 이름 자료형 DEFAULT 디폴트 값;

DECLARE
    SCOTT_ID NUMBER(2) DEFAULT 1;
 BEGIN
    DBMS_OUTPUT.PUT_LINE (SCOTT_ID);
end;
/
--기본값 설정이유?
--: 만약 아무런 값이 없을때 (NULL) 출력 오류가 생길수 있음을 방지

--4) 변수에 NOT NULL 지정
--: 특정 변수에 NULL 값을 넣을 수가 없음
-- : NOT NULL 키워드를 사용하는 변수는 반드시 변수 선언과
-- : 동시에 데이터 초기화! (DECLARE 부분에서)
--형식) 변수 이름 자료형 NOT NULL :=값;

DECLARE
    SCOTT_NAME VARCHAR(20) NOT NULL := '';--오류
    -- '' -> 빈문자열도 NULL 로 인식한다
    BEGIN
    DBMS_OUTPUT.PUT_LINE(SCOTT_NAME);
end;
/
DECLARE
    SCOTT_NAME VARCHAR(20) NOT NULL DEFAULT  := ' ';
    -- '' -> 빈문자열도 NULL 로 인식한다
BEGIN
    DBMS_OUTPUT.PUT_LINE(SCOTT_NAME);
end;
/

--변수 이름 명명법
--1) 같은 블록 내에 변수 이름이 중복될수 없음
--2) 대소문자 구별 X (ABC == abc)

--변수의 자료형 (데이터 타입),(datatype)
--1) 스칼라형 (scalar type ): 오라클에서 정의한 자료형
--: 내부에 넣을수 있는 값이 하나
--ex) 숫자,문자열,바차,날짜 (NUMBER),(CHAR),(VARCAHR),(DATE)
--,논리형 에만 존재 (BOOLEAN)

--2) 참조형 (referrnce type)
--: 어떤 테이블의 열/행 참조하는 자료형
--a. 열 참조 (변수 이름 테이블 이름.열이름 type): 참조할 데이블 열과 동일한 자료형 (크기)
--b. 헹 참조 테이블의 행 구조 전체 참조 (변수 이름 테이블 % ROWTYPE): 참조할 테이블의 전체 행 구조 참조
DECLARE
  DEPTNO2 DEPT.DEPTNO %TYPE :=50;--_DEPT.DEPTNO 열과 동일한 자료형
  EMPNO2 EMP.EMPNO %TYPE := 7000;-- EMP.EMPNO 열과 동일한 자료형
  SAL2 EMP.SAL % TYPE :=5000; --EMP.SAL 과 동일한 자료형
  COMM2 EMP.COMM%TYPE:= NULL; -- ;;
    HIREDATE2 EMP.HIREDATE%TYPE :=TO_DATE('2001/1/1','YYYY/MM/DD');--;;
BEGIN
    DBMS_OUTPUT.PUT_LINE('DEPTNO2 : ' || DEPTNO2);
    DBMS_OUTPUT.PUT_LINE('EMPNO2 : ' || EMPNO2);
    DBMS_OUTPUT.PUT_LINE('SAL2 : ' || SAL2);
    DBMS_OUTPUT.PUT_LINE('COMM2 : ' || COMM2);
    DBMS_OUTPUT.PUT_LINE('HIREDATE2 : ' || HIREDATE2);
END;
/

--EMP 테이블의 EMPNO 를 참조하는 EMPNO2 (참조형 변수)
--EMP 테이블의 SAL,COMM을 참조하는 SAL2.COMM2(참주형 변수)
--테이블의 HIREDATE를 참조하는 HIREDATE2 (참조형 변수 )

--B. 행 참조 (전체 테이블 구조를 다 가지고옴 => 하나의 행이 가지는 자료형을 다 쓸 수 있음)
DECLARE
    DEFT2 DEPT%ROWTYPE;
    --DEPT 테이블의 모든 속성값을 다 가지고옴!
BEGIN
    --하나의 행을 조회하는 셀렉문
    SELECT * INTO DEFT2
    FROM SCOTT.DEPT
    WHERE DEPTNO = 20;

    DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || DEFT2.DEPTNO);
    DBMS_OUTPUT.PUT_LINE('DNAME : ' || DEFT2.DNAME);
    DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || DEFT2.LOC);
end;
/

-- 조건문/반복문
-- : 조건문: IF문, CASE문
-- 1) IF문
-- IF-THEN: 조건이 참이면 수행
-- IF-THEN-ELSE: 조건 참/거짓인지에 따라 수행문 달라짐
-- IF-THEN-ELSIF: 조건을 여러 개 지정할 수 있음
-- 자바: ELSE IF
-- PL/SQL: ELSIF
-- 파이썬: ELIF

-- IF-THEN
-- IF 조건문 THEN
-- 수행할 명령어;
-- END IF;

-- 홀수 판별 프로그램
DECLARE
    TEST_NUM NUMBER(2) := 25;
BEGIN
    IF MOD(TEST_NUM, 2) = 1 THEN
        DBMS_OUTPUT.PUT_LINE('ODD NUMBER');
    END IF;
END;
/

SELECT * FROM EMP;
-- EMP 테이블 행 참조 EMP3 (EMPNO 7902인 행 참조)
-- EMP3.ENAME 안에 E가 들어가면 'E가 있습니다!' 문자열 출력

DECLARE
    EMP3 EMP%ROWTYPE;
BEGIN
    SELECT * INTO EMP3
    FROM EMP
    WHERE EMPNO = 7902;

    IF EMP3.ENAME LIKE '%E%' THEN
        DBMS_OUTPUT.PUT_LINE('E IS IN NAME');
    ELSE
        DBMS_OUTPUT.PUT_LINE('E ISN''T IN NAME');
    END IF;
END;
/

-- ELSIF
-- 이름에 'E'가 있으면 'E IS IN NAME'
-- 이름에 'A'가 있으면 'A IS IN NAME'
-- 이름에 'M'이 있으면 'M IS IN NAME'
-- 아무것도 없으면 'NOTHING'

DECLARE
    EMP3 EMP%ROWTYPE;
BEGIN
    SELECT * INTO EMP3
    FROM EMP
    WHERE EMPNO = 7902;

    IF EMP3.ENAME LIKE '%E%' THEN
        DBMS_OUTPUT.PUT_LINE('E IS IN NAME');
    ELSIF EMP3.ENAME LIKE '%A%' THEN
        DBMS_OUTPUT.PUT_LINE('A IS IN NAME');
    ELSIF EMP3.ENAME LIKE '%M%' THEN
        DBMS_OUTPUT.PUT_LINE('M IS IN NAME');
    ELSE
        DBMS_OUTPUT.PUT_LINE('NOTHING');
    END IF;
END;
/

-- EMPNO가 7902인 사원을 참조하는 EMP4를 참조형 변수 생성
-- SAL >= 5000이상 일 경우, 세금 15%
-- SAL >= 4000이상 일 경우, 세금 10%
-- SAL >= 3000이상 일 경우, 세금 8%
-- 나머지 SAL에 대해서는 세금 5% 매긴다고 가정
-- 지불해야하는 세금을 계산 출력

DECLARE
    EMP4 EMP%ROWTYPE;
BEGIN
    SELECT * INTO EMP4
    FROM EMP
    WHERE EMPNO = 7902;

    IF EMP4.SAL >= 5000 THEN
        DBMS_OUTPUT.PUT_LINE('TAX : ' || EMP4.SAL * 0.15);
    ELSIF EMP4.SAL >= 4000 THEN
        DBMS_OUTPUT.PUT_LINE('TAX : ' || EMP4.SAL * 0.1);
    ELSIF EMP4.SAL >= 3000 THEN
        DBMS_OUTPUT.PUT_LINE('TAX : ' || EMP4.SAL * 0.08);
    ELSE
        DBMS_OUTPUT.PUT_LINE('TAX : ' || EMP4.SAL * 0.05);
    END IF;
END;
/

-- CASE 조건문
-- : IF문을 조금 더 단순화시킨 버전
-- 1) 단순 CASE문: 비교 기준 값 명시 (= 만 가능)
-- CASE 비교 기준
--  WHEN 값1 THEN
--      명령어;
--  WHEN 값2 THEN
--      명령어;
--  WHEN 값3 THEN
--      명령어;
--  ...
--  ELSE
--      명령어;
-- END CASE;

-- Q1. EMPNO가 7654인 사람을 참조형 변수 EMP5의
-- 입사년도가 1980, 1981, 1982인지 확인하는 조건식 작성


SELECT * FROM EMP;

DECLARE
    EMP5 EMP%ROWTYPE;
BEGIN
    SELECT * INTO EMP5
    FROM EMP
    WHERE EMPNO = 7654;

    --    CASE TO_CHAR(EMP5.HIREDATE, 'YYYY')
--    CASE SUBSTR(EMP5.HIREDATE, 1, 4)
    CASE LPAD(EMP5.HIREDATE, 4)
        WHEN '1980' THEN
            DBMS_OUTPUT.PUT_LINE('1980');
        WHEN '1981' THEN
            DBMS_OUTPUT.PUT_LINE('1981');
        WHEN '1982' THEN
            DBMS_OUTPUT.PUT_LINE('1982');
        ELSE
            DBMS_OUTPUT.PUT_LINE(TO_CHAR(EMP5.HIREDATE, 'YYYY'));
        END CASE;
END;
/



-- 2) 검색 CASE문: 조건식 (IF문과 거의 유사) == 조건식에  equal 이 아닌 다양한 문장을 쓸수 있음!
-- CASE
--  WHEN 조건식1 THEN
--      명령어;
--  WHEN 조건식2 THEN
--      명령어;
--  WHEN 조건식3 THEN
--      명령어;
--  ...
--  ELSE
--      명령어;
-- END CASE;

DECLARE
    EMP4 EMP%ROWTYPE;
BEGIN
    SELECT * INTO EMP4
    FROM EMP
    WHERE EMPNO = 7902;

    CASE
        WHEN EMP4.SAL >= 5000 THEN
            DBMS_OUTPUT.PUT_LINE('TAX : ' || EMP4.SAL * 0.15);
        WHEN EMP4.SAL >= 4000 THEN
            DBMS_OUTPUT.PUT_LINE('TAX : ' || EMP4.SAL * 0.1);
        WHEN EMP4.SAL >= 3000 THEN
            DBMS_OUTPUT.PUT_LINE('TAX : ' || EMP4.SAL * 0.08);
        ELSE
            DBMS_OUTPUT.PUT_LINE('TAX : ' || EMP4.SAL * 0.05);
        END CASE;
END;
/

-- SQL: DECODE(), CASE -- 정보 검색
-- PL/SQL: CASE ~ WHEN, IF -- 정보 검색 + 정보 검색 결과에 의해 수행할 작업


--Q1.EMPNO가 7654인 사람을 참조형 변수 EMP5 의 입사년도가 1980,1981,1982인지 확인하는 조건식 작성

DECLARE
    EMP5 EMP%ROWTYPE;
    BEGIN
    SELECT * INTO EMP5
    FROM SCOTT.EMP
    WHERE EMPNO = 7654;
end;
/
 --SQL : DEDCODE(),CASE --정보 검색
 --FL/SQL : CASE ~ WHEN IF -- 정보 검색 + 정보 검색 결과에 의해 수행할 작업

--반복문
--A. 기본 LOOP : 무한 반복문 + (주로 EXIT,EXIT_WHEN  를 같이 사용함 )
--B. WHILE LOOP : 조건식의 결과에 따라 반복
--C. FOR LOOP : 반복횟수를 지정해서 반복
--D. Cursor FOR LOOP (공부안함)

--반복문 수행 중단 시키거나 특정 반복 주기를 건너띔
--EXIT : 반복 종료 IF 문과 같이 쓰임
--EXIT-WHEN : 반복문을 종료하기위한 조건식을 지정하고 조건식이 참이면 반복 종료
--CONTINUE : 반복주기를 건너띔 IF 문과 같이 쓰임!
--CONTINUE-WHEN : 조건식이 참이면 반복 주기를 건너띔

--반복문을 5번 도는 문장을 작성
--A.기본 반복문
DECLARE
 --한번만 선언!
    LOOP_NUM NUMBER(5) :=0;
    BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE('CURRENT NUM : ' || LOOP_NUM);
        LOOP_NUM := LOOP_NUM +1;
        EXIT WHEN LOOP_NUM > 4;
        --(IF LOOP_NUM =5) THEN
        --EXIT;-- 바로종류 (조건식과 많이쓰임 )
        --END IF;
    end loop;
end;
/

--B.WHILE LOOP
--: 조건이 참일 동안 반복
/*
형식)
WHILE 조건식 LOOP
  반복문장
END LOOP;


*/
DECLARE
    LOOP_NUM NUMBER (5) :=0;
    BEGIN
    WHILE LOOP_NUM < 5 LOOP
        DBMS_OUTPUT.PUT_LINE('CURRENT NUM : '||LOOP_NUM);
        LOOP_NUM := LOOP_NUM +1;
        end loop;
end;
/

--C.FOR LOOP
    --:반복문 횟수 지정
    --형식)

    --FOR i IN 시작값 .. 종료값 LOOP
        --반복 문장
--END LOOP;
--시작값부터 1씩 (오로지)증가하여 종료값에 이르면 종료
--시작값 > 종료값 : 반복문이 실행이 안됨!
--반대로 돌고 싶으면 REVERSE 붙이면 됨 ㅋ


-- ==> i: 카운터 (counter) 자바에서는 이터레이터 반복문 i ㅋ
 -- 반복문 내에서만 사용 DECLARE 선언부에 정의하지않고 FOR LOOP 내에서 정의!

DECLARE
    LOOP_NUM NUMBER (5):=0;
    BEGIN
    FOR i IN 0..4 LOOP
    --FOR i IN REVERSE 0..4 LOOP 반대로 돌아라 이눔아 ㅋ 이런말임
        DBMS_OUTPUT.PUT_LINE('CURRENT NUM : '|| i);
        LOOP_NUM := LOOP_NUM+1;
        end loop;
end;
/
 SET SERVEROUT ON;
--종료 시키거나 건너뛸 수 있는 문장
--A.EXIT
--B.EXIT-WHEN
--C.CONTINUE
--D. CONTINUE-WHEN

--CONTINUE,CONTINUE-WHEN
--CONTINUE : 현재 반복하고 있는  주기를 무시하고 재반복 하라 (이후 작업을 건너뜀 )
--CONTINUE-WHEN: 특정 조건식을 만족할떄 현재 반복하고 있는  주기를 무시하고 재반복 하라 (이후 작업을 건너뜀 )

DECLARE
    LOOP_NUM NUMBER (5):=0;
BEGIN
    FOR i IN 0..4 LOOP
--  FOR i IN 4..4 LOOP 같을경우 한번만 돔!
        CONTINUE WHEN MOD(i,2) = 1;--% 모듈러스임
        --홀수는 건너뛰어라 이눔아~
            --FOR i IN REVERSE 0..4 LOOP: 반대로 돌아라 이눔아 ㅋ 이런말임
            DBMS_OUTPUT.PUT_LINE('CURRENT NUM : '|| i);
            LOOP_NUM := LOOP_NUM+1;
        end loop;
end;
/



