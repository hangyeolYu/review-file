/*
저장 서브 프로그램
--지금까찌 작성한 PL/SQL 블록은 이름없이 작성(익명블록 (anonymous block))
--: 오라클 DB에 저장되는건 아님

--저장 서브 프로그램 (stored subprogram)
  PL/SQL에 이름을 붙여   오라클에 저장하는 프로그램
  --EX) 프로시저(procedure),함수(function) ,패키지(package),트리거 (trigger)
--: 장점?
   1) 필요할때 마다 재사용할 수 있음
   2) 이름이 있음 -> 다른사람들과 공유하기 쉬움
   3) 다른 프로그램에서 호출하기 쉬움

*/

--1) 프로시저
-- CREATE [OR REPLACE] PROCEDURE 프로시저 이름
-- IS | AS --선언부 (DECLARE 대신 사용 ,선언부가 없어도 무조권 작성 )
-- begin
--     EXCEPTION --생략가능
-- end[프로시저 이름] -- 생략가능

--ON REPLACE 같은 이름의 프로시저가 있을 경우 현재 프로시저로 대체


--프로시져 생성
CREATE OR REPLACE PROCEDURE PRO_TEST
IS
    DEPT_ROW DEPT%rowtype;
BEGIN
    SELECT *INTO DEPT_ROW
    FROM DEPT
        WHERE DEPTNO =10;

    DBMS_OUTPUT.PUT_LINE('DEPTNO : '|| DEPT_ROW.DEPTNO);
    DBMS_OUTPUT.PUT_LINE('DNAME : '|| DEPT_ROW.DNAME);
    DBMS_OUTPUT.PUT_LINE('LOC : '|| DEPT_ROW.LOC);
end;
/

--DEPTNO 가 10인 부서정보를 ROWTYPE 형 변수 (DEPT_ROW)에 저장하는 변수

--프로시저 실행 (EXECUTE 프로사저 이르미)
EXECUTE PRO_TEST;
--익명 블록 내에서 프로시저 실행
BEGIN
    PRO_TEST;
end;
--프로시저 목록확인
SELECT * FROM USER_SOURCE
WHERE NAME = 'PRO_TEST';

--프로시저 삭제 (DROP PROCEDURE)
DROP PROCEDURE PRO_TEST;

--파라미터를 사용하는 프로시져
--: 프로시저를 실행하기 위해 입력 데이터가 필요한 경우 파라미터 정의

--형식)
-- CREATE [OR REPLACE] PROCEDURE 프로시저 이름
--[(파라미터 이름1[modes (생략가능)] 자료형[:= | DEFAULT 기본값(생략가능 )],
-- 파라미터 이름2[modes (생략가능)] 자료형[:= | DEFAULT 기본값(생략가능 )],
-- .......)]
-- IS | AS --선언부 (DECLARE 대신 사용 ,선언부가 없어도 무조권 작성 )
-- begin
--     EXCEPTION --생략가능
-- end[프로시저 이름] -- 생략가능

--ON REPLACE 같은 이름의 프로시저가 있을 경우 현재 프로시저로 대체

--[modes]
--IN: 프로시저 호출이 필요한 값
--OUT: 프로시저 반환시 필요한 값
--IN OUT : 호출 시 값 입력을 받고 결과 반환

--IN모드 파라미터
CREATE OR REPLACE PROCEDURE PRO_TEST_PRAM_IN(
-- NUMBER  (mac length): 어떤값이 올지 모름
PARAM1 IN NUMBER,
PARAM2 IN NUMBER,
PARAM3 IN NUMBER,
PARAM4 IN NUMBER --IN 안줘도 DEFAULT 가 IN 임

--PARAM3 IN NUMBER DEFAULT 3,
--PARAM4 IN NUMBER DEFAULT 4,
    --디폴트 값은 뒤에서 부터 순서대로 (연속적으로 할당 ) (예전버전)
    --*오라클 11버전이상부터 디폴트 값을 연속적으로 주지 않아도 됨(인자로 데이터를 전달할떄 매개변수
    -- 이름을 같이 명시해줘야함 )

)
IS

-- DECLARE
--     PARAM4 int ;
--     PARAM3 int ;
--     PARAM2 int ;
--     PARAM1 int ;
BEGIN
    DBMS_OUTPUT.PUT_LINE('PARAM1 : '|| TO_CHAR(PARAM1));
    DBMS_OUTPUT.PUT_LINE('PARAM2 : '|| TO_CHAR(PARAM2));
    DBMS_OUTPUT.PUT_LINE('PARAM3 : '|| TO_CHAR(PARAM3));
    DBMS_OUTPUT.PUT_LINE('PARAM4 : '|| TO_CHAR(PARAM4));

end;
/

    EXECUTE PRO_TEST_PRAM_IN(10,20,30,40);
   -- EXECUTE PRO_TEST_PRAM_IN(10,20); 디폴트를 제외한 인자값 전달
   --EXECUTE PRO_TEST_PRAM_IN(PARAM1=>10,PARAM3=>20); --직접 할당

--OUT모드 파라미터
--: 프로시저 실행후 호출한 프로그램으로 반환
CREATE OR REPLACE PROCEDURE PRO_TEST_PAM_OUT(
    IN_EMP EMP%TYPE,
    OUT_EMP EMP.EMPNO%TYPE,
    OUT_SAL  EMP.SAL%TYPE
)
IS
BEGIN
    SELECT ENAME,SAL INTO OUT_EMP,OUT_SAL
      FROM SCOTT.EMP
          WHERE EMPNO = IN_EMP;
    END PRO_TEST_PAM_OUT;

end;
/
--PROCEDURE (사원번호,사원이름,급여)
DECLARE
    PRO_OUTPUT_ENMAE EMP.ENAME%TYPE,
    PRO_OUTPUT_SAL EMP.SAL%TYPE;
    BEGIN
    PRO_TEST_PAM_OUT(7369,PRO_OUTPUT_ENMAE,PRO_OUTPUT_SAL);
    DBMS_OUTPUT.PUT_LINE('ENAME :' || PRO_OUTPUT_ENMAE);
    DBMS_OUTPUT.PUT_LINE('SAL :' || PRO_OUTPUT_SAL);


end;
/
--PRO_TEST_PRAM_OUT 프로시저 이용해서 7566 사원의 이름과 급여를 출력
DECLARE
    RESNUMBER NUMBER;
    BEGIN
    RESNUMBER :=ADD_FUNC(10,20);
    DBMS_OUTPUT.PUT_LINE('두수의 합 :' || TO_CHAR(RESNUMBER));
end;


-- 2) 함수 (FUNCTION)
-- 프로시저 VS 함수 (SUBSTR, MAX, MIN, .... 내장 함수 / 사용자 정의)
-- 프로시저: PL/SQL 호출 가능, 파라미터 모드 (IN, OUT, IN OUT), 반환값 (OUT 모드 파라미터)이 여러 개일 수 있음
-- 함수: SQL, PL/SQL 호출 가능, 파라미터 모드 (IN, 생략), 반환값이 오직 하나 (RETURN문에 작성)



/* 사용자 정의 함수 생성

형식)
CREATE [OR REPLACE] FUNCTION 함수 이름
[(파라미터 이름1[modes (생략 가능)] 자료형 [ := | DEFAULT 기본값 (생략 가능)],
  파라미터 이름2[modes (생략 가능)] 자료형 [ := | DEFAULT 기본값 (생략 가능)],
 .......
 )]
RETURN 자료형; -- 반환값의 자료형

IS | AS -- 선언부 (DECLARE 대신 사용, 선언부가 없어도 무조건 작성)
BEGIN
    RETURN (반환값);
EXCEPTION -- 생략 가능
END [프로시저 이름]; -- 프로시저 이름은 생략 가능

*/

-- 함수 생성 (두 정수를 덧셈)
CREATE OR REPLACE FUNCTION ADD_FUNC(
    ANUMBER NUMBER,
    BNUMBER NUMBER
)
    RETURN NUMBER
    IS
BEGIN
    RETURN ANUMBER + BNUMBER;
END ADD_FUNC;
/


DECLARE
    RESNUMBER NUMBER;
BEGIN
    RESNUMBER := ADD_FUNC(10, 20);
    DBMS_OUTPUT.PUT_LINE('두 수의 합 : ' || TO_CHAR(RESNUMBER));
END;
/


/
--함수 생성
--SAL*12 +COMM
--소수점 둘재자리까찌만 표현 (세번째 자리에서 반올림)

CREATE OR REPLACE FUNCTION ANNSAL (
EMP_SAL EMP.SAL%TYPE,
EMP_COMM EMP.COMM%TYPE
)
RETURN NUMBER
IS
    BEGIN
        RETURN(ROUND(EMP_SAL*12+NVL(EMP_COMM,0),2));
    end ANNSAL;
/
--프로시저 (PLSQL 에서만 사용할수 있음 )랑 다르게 함수는 PLSQL SQL 에서도 사용가능!
SELECT EMPNO,ENAME,ANNSAL(SAL,COMM)
FROM SCOTT.EMP;
--함수삭제
DROP FUNCTION ANNSAL;
/*
패키지 (package)
:기능상으로 비슷한 프로시저,함수 등을 하나로 묶어서 관리하는 객체
:패키지 = 프로시저1,프로시저 2,함수2 ...(비슷한 기능을 하는 프로그램을 묶어서 관리)

장점?
1)관리 쉬움 (패키지를 하나의 모듈로써 표현)
2) 각 서브 프로그램의 정보 은닉 (외부 노출 / 접근여부 )

--패키지
--1) 명세 (선언부)
--2) 본문 (body)

형식)
CREATE [OR REPLACE] PACKAGE 패키지 이름
IS | AS
   서브 프로그램 선언
END [패키지 이름];
*/

CREATE OR REPLACE PACKAGE PKG_TEST
IS
    FUNCTION ANNSAL(EMP_SAL EMP.SAL%TYPE,EMP_COMM EMP.COMM%TYPE)RETURN NUMBER;
    --IN (패키지 명세 작성시 IN 부분만 파라미터 작성),OUT (패키지 본문 작성시 파라미터 작성)
     PROCEDURE PRO_EMP (EMP_EMPNO EMP.EMPNO%TYPE);--EMPNO (in 모드 파라미터)를 통해서 사원 이름 ,급여(out 모드 파라미터)반환
    PROCEDURE PRO_DEPT (EMP_DEPTNO EMP.DEPTNO%TYPE); --DEPTNO(in 모드 파라미터)를 통해 부서이름 ,부서 위치(out 모드 파라미터)를 반환
END;
/
--패키지 조회 SER_SOURCE 데이터 사전 조회 OR DESC 명령어
SELECT * FROM USER_SOURCE
WHERE TYPE = 'PACKAGE';

DESC PKG_TEST;
--DESCRIBE 명령어 (객체의 구조 확인)
DESC SCOTT.EMP;
DESC SCOTT.DEPT;

--2) 본문 (BODY)
-- 형식)
-- CREATE [OR REPLACE] PACKAGE BODY 패키지 이름
-- IS | AS
--    서브 프로그램 선언
-- END [패키지 이름];

CREATE OR REPLACE PACKAGE BODY PKG_TEST
IS

    FUNCTION ANNSAL(EMP_SAL EMP.SAL%TYPE,EMP_COMM EMP.COMM%TYPE)RETURN NUMBER
    IS
    BEGIN
        RETURN (ROUND(EMP_SAL *12 + NVL(EMP_COMM,0)),2);
    END;

    PROCEDURE PRO_EMP (EMP_EMPNO EMP.EMPNO%TYPE)

     IS
    EMP_ENAME EMP.ENAME%TYPE;
        --OUT 모드를 작성하지 않아도 패키지 본문(body)에서 정의되는 파라미터는
        --OUT 모드이기 때문에 생략가능
        EMP_SAL EMP.SAL%TYPE;
    BEGIN
        SELECT ENAME,SAL INTO EMP_ENAME,EMP_SAL
        FROM SCOTT.EMP
            WHERE EMPNO = EMP_EMPNO;

        DBMS_OUTPUT.PUT_LINE('ENAME : ' || EMP_ENAME);
        DBMS_OUTPUT.PUT_LINE('SAL : ' || EMP_SAL);


    END PRO_EMP;
    PROCEDURE PRO_DEPT (EMP_DEPTNO EMP.DEPTNO%TYPE)
        IS
        DEPT_DNAME DEPT.DNAME%TYPE;
         DEPT_LOC DEPT.LOC%TYPE;
    BEGIN
        SELECT DNAME,LOC INTO DEPT_DNAME,DEPT_LOC
        FROM SCOTT.DEPT
            WHERE DEPTNO = EMP_DEPTNO;
        DBMS_OUTPUT.PUT_LINE('DNAME : '||DEPT_DNAME);
        DBMS_OUTPUT.PUT_LINE('LOC : '|| DEPT_LOC);

    END PRO_DEPT;
        END;
/

SHOW ERROR;

--패키지 사용 (패키지 이름,함수/프로시저 이름 (IN 모드 파라미터 ))
DECLARE
    IN_SAL EMP.SAL%TYPE;
    IN_COMM EMP.COMM%TYPE;
BEGIN
    SELECT SAL,COMM INTO IN_SAL,IN_COMM
    FROM EMP
    WHERE EMPNO = 7839;
DBMS_OUTPUT.PUT_LINE(PKG_TEST.ANNSAL(IN_SAL,IN_COMM));
                         --사원번호 해당하는 사원의 연봉 계산
PKG_TEST.PRO_EMP(7839); --EMPNO를 IN 으로 넘겨주면 ENAME ,SAL 반환
PKG_TEST.PRO_DEPT(10); --DEPTNO 를 IN 으로 넘겨주면 DNAME,LOC 반환
    END;
/
--패키지 삭제
--DROP PACKAGE 패키지 이름 ;--명 본문 한꺼번에 삭제
--DROP PACKAGE BODY 패키지 이름; --본문만 식제

DROP PACKAGE PKG_TEST;

--4) 트리거(trigger)
--동작이나 이벤트가 발생할 경우에 자동으로 시행되는 기능
--EX) 서버 업데이트를 시간 주중에만 할수 있게 만든다거나
--        DML 작업을 하려고 하는데 막아놓을 수도 있음

--: 데이터 관련 작업을 간편하게 수행할 순 있지만 너무 많이 작성을 하면 DB 성능을 저하
--: 트리거롤 지정할 수 있는 동작
/*
DML : INSERT,UPDATE,DELETE
2) DDL : CREATE,DROP,ALTER
3) DB 동작 : SERVERERROR,LOGON ,LOGOFF,STARTUP,SHUTDOWN
*/

/*
 1) DML 트리거
형식)
CREATE [OR REPLACE] TRIGGER 트리거 이름
BEFORE | AFTER -- BEFORE : DML 명령어  실행 전
              -- AFTER : DML 명렁어 실행후 트리거 동작

 INSER | UPDATE | DELETE ON 테이블 이름
 FOR EACH ROW WHEN 조건식
*/

--트리거 제작 및 사용 (BEFORE)
CREATE TABLE EMP_TRG
AS SELECT * FROM SCOTT.EMP;

CREATE OR REPLACE TRIGGER TRG_EMP_NODML_WEEKEND
    BEFORE --명령어 사용전에 실행
    INSERT OR UPDATE OR DELETE ON EMP_TRG
    BEGIN
    IF TO_CHAR(SYSDATE,'DY') NOT IN ('토','일') THEN
      IF INSERTING THEN
          DBMS_OUTPUT.PUT_LINE('주말엔 사원정보 추가 불가!');
          RAISE_APPLICATION_ERROR(-20000,'주말엔 사원정보 추가 불가!');--예외발생 만들기 (사용자 정의 예외가 필요함! -20000~20999)
          ELSIF UPDATING THEN
              DBMS_OUTPUT.PUT_LINE('주말엔 사원정보 수정 불가!');
              RAISE_APPLICATION_ERROR(-20001,'주말엔 사원정보 수정 불가!');
      ELSIF DELETING THEN
          DBMS_OUTPUT.PUT_LINE('주말엔 사원정보 삭제 불가!');
          RAISE_APPLICATION_ERROR(-20002,'주말엔 사원정보 삭제 불가!');
      ELSE
          DBMS_OUTPUT.PUT_LINE('주말엔 사원정보 변경 불가!');
          RAISE_APPLICATION_ERROR(-20003,'주말엔 사원정보 변경 불가!');
    END IF;
      END IF;


END;
/
UPDATE EMP_TRG
SET SAL = 3500
WHERE EMPNO = 7698;
SELECT * FROM EMP_TRG;

UPDATE EMP_TRG
SET SAL = 300
WHERE EMPNO = 7566;

--평일에는 수정 불가!

--트리거 제작 및 사용 (AFTER)
--: DML 명령된 후에 작동
--: DML 명령어 로그에 저장

CREATE TABLE EMP_TRG_LOG (
TABLENAME VARCHAR2(10),
 --DML이 수정돤 테이블 이름
DMLTYPE VARCHAR2(10),
--DML 명령어 종류
EMPNO EMP.EMPNO%TYPE,
USERNAME VARCHAR(20),
-- DML 을 수행한 사용자 이름
CHANGEDATE DATE
--DML 수정된 날짜
                   );








