/* 변수의 자료형
1) 스칼라 형 (SCALAR TYPE)
 --: 오라클에서 제공하는 기본형
 --: 내부에 들어갈 값이 오직 하나
-- :EX) VARCHAR,NUMBER,DATE,BOOLEAN

2) 참조형 (REFERENCE TYPE)
   (%ROWTYPE,%TYPE)
   --: 행 참조 (테이블이름 %LOWTYPE):테이블에 들어간 자료형 모두 참조
     (SELECT * INTO 변수명)(순서/자료형/개수 모두 일치 시켜야함)
   --: 열 참조 (테이블 이름.열이름 %TYPE): 열에 들어간 자료형 참조(열의 자료형은 무조건 한개 )
3) 복합형(COMPOSITE TYPE)
   --: 여러 종류의 갯수 데이터를 저장할수 있는 자료형
   A.레코드 (RECORD) = 테이블의 행 (행단위 한사람의 데이터) 데이터 자료형이 여러개 일수도 있음
   B.컬렉션 (COLLECTION) :데이터의 열(데이터의 자료형이 하나)

A. 레코드
   형식)
   TYPE 레코드이름 IS RECORD(
   변수이름 자료형 NOT NULL := (또는 DEFAULT) 값
   );

   --변수이름 : 레코드 안에 들어갈 변수지정 (여러 개 올수 있음(, 로 구분))
   --자료형 : 변수의 자료형 지정 (%TYPE,%ROWTYPE 가능)
   --NOT NULL,DEFAULT 생략가능
*/

DECLARE
    --레코드도 하나의 자료형 (클래스 )
    TYPE REC_TEST IS RECORD(
      DEFTNO DEPT.DEPTNO%TYPE,
      DNAME DEPT.DNAME%TYPE,
      LOC DEPT.LOC%TYPE
                           );
    DEFT_REC REC_TEST;-- 레코드의 타입을 갖는 DEFT_REC 변수지정
    DEFT_REC2 REC_TEST;-- 레코드의 타입을 갖는 DEFT_REC2 변수지정

         --자바의 STUDENT 클래스를 변수에 넣고 변수 타입을 STUDENT 같이 한거랑
         --같은 맥락
BEGIN
    --각 레코드에 포함된 변수
    DEFT_REC.DEFTNO := 40;
    DEFT_REC.DNAME :='DB';
    DEFT_REC.LOC :='USA';

    DEFT_REC2.DEFTNO := 50;
    DEFT_REC2.DNAME :='DB';
    DEFT_REC2.LOC :='ASIA';

    DBMS_OUTPUT.PUT_LINE('DEPT_REC.DEPTNO : ' || DEFT_REC.DEFTNO);
    DBMS_OUTPUT.PUT_LINE('DEPT_REC.DEPTNO : ' || DEFT_REC.DNAME);
    DBMS_OUTPUT.PUT_LINE('DEPT_REC.DEPTNO : ' || DEFT_REC.LOC);

    DBMS_OUTPUT.PUT_LINE('DEPT_REC2.DEPTNO : ' || DEFT_REC2.DEFTNO);
    DBMS_OUTPUT.PUT_LINE('DEPT_REC2.DEPTNO : ' || DEFT_REC2.DNAME);
    DBMS_OUTPUT.PUT_LINE('DEPT_REC2.DEPTNO : ' || DEFT_REC2.LOC);


end;
/
CREATE TABLE DEPT_RECORD
    AS SELECT * FROM SCOTT.DEPT;

SELECT * FROM DEPT_RECORD;


--2) 레코드를 이용해서 데이터를 INSERT
DECLARE
    TYPE REC_TEST IS RECORD(
                               DEFTNO DEPT.DEPTNO%TYPE,
                               DNAME DEPT.DNAME%TYPE,
                               LOC DEPT.LOC%TYPE
                           );
    DEFT_REC REC_TEST;-- 레코드의 타입을 갖는 DEFT_REC 변수지정
    DEFT_REC2 REC_TEST;

BEGIN
    DEFT_REC.DEFTNO := 40;
    DEFT_REC.DNAME :='DB';
    DEFT_REC.LOC :='USA';

    DEFT_REC2.DEFTNO := 50;
    DEFT_REC2.DNAME :='DB';
   DEFT_REC2.LOC :='ASIA';
    --DEFT_REC2.LOC :='ASIA'; 하나는 이렇게 하면 NULL 이 들어감

    --VALUES 통해 데이터를 넣을때 하나하나 데이터 명시
    --VALUES 에 레코드 이름을 통해 행 전체를 삽입 (레코드 이름만 명시 )
    INSERT INTO DEPT_RECORD
    VALUES DEFT_REC;


    INSERT INTO DEPT_RECORD
     VALUES DEFT_REC2;

end;
/

SELECT * FROM DEPT_RECORD;



--3) 레코드 이용해서 데이터 업데이트

DECLARE
    TYPE REC_TEST IS RECORD(
                               DEFTNO DEPT.DEPTNO%TYPE,
                               DNAME DEPT.DNAME%TYPE,
                               LOC DEPT.LOC%TYPE
                           );
    DEFT_REC REC_TEST;
    DEFT_REC2 REC_TEST;
    DEPT_REC_REVISED REC_TEST;

BEGIN
    DEPT_REC_REVISED.DEFTNO :=50;
    DEPT_REC_REVISED.DNAME := 'DATABASE';
    DEPT_REC_REVISED.LOC :='BUSAN';

--VALUES 에 레코드를 통해 행 전체 수정 (UPDATE ~~ SET + ROW 키워드)
    UPDATE DEPT_RECORD --요 테이블에
    SET ROW = DEPT_REC_REVISED -- 요 형식의 레코드로 바꾼다
    WHERE DEPTNO =50; --조건이 부합할때
END;
/
--VALUES 에 레코드를 통해 행 전체 수정

SELECT * FROM DEPT_RECORD;

--Q1. 테이블 생성(GOOTT_STUDENT)
--속성 : ID NUMBER
--     NAME  VARCHAR
--      SEATNUM   NUMBER

--테이블의 데이터를 삽입하기 위해 레코드를 생성하고 레코드를 통해 데이터를 삽입

CREATE TABLE GOOTT_STUDENTS(
    ID NUMBER(2) UNIQUE ,
    NAME VARCHAR(20),
    SEATNUM NUMBER (2)

    --테이블 열이름 만들떄는 명확하게 저장하자
    --(많이 사용하는 NAME..ID 등등)


);

DROP TABLE GOOTT_STUDENTS;
SELECT * fROM GOOTT_STUDENTS;



DECLARE
    TYPE REC_STUDENT IS RECORD (
          ID GOOTT_STUDENTS.ID%TYPE,
          NAME GOOTT_STUDENTS.NAME%TYPE,
          SEATNUM GOOTT_STUDENTS.SEATNUM%TYPE
                               );
    STUDENT1 REC_STUDENT;
    STUDENT2 REC_STUDENT;

BEGIN

    STUDENT1.ID :=1;
    STUDENT1.NAME :='홍길동';
    STUDENT1.SEATNUM := 27;

    STUDENT2.ID :=2;
    STUDENT2.NAME :='홍길순';
    STUDENT2.SEATNUM := 36;

    INSERT INTO GOOTT_STUDENTS
    VALUES STUDENT1;
    INSERT INTO GOOTT_STUDENTS
    VALUES STUDENT2;

end;
/

SELECT * FROM GOOTT_STUDENTS;

--Q1. 수정

DECLARE
    TYPE REC_STUDENT IS RECORD (
                                   ID GOOTT_STUDENTS.ID%TYPE,
                                   NAME GOOTT_STUDENTS.NAME%TYPE,
                                   SEATNUM GOOTT_STUDENTS.SEATNUM%TYPE
                               );
    STUDENTAGAIN REC_STUDENT;


BEGIN



    STUDENTAGAIN.ID :=2;
    STUDENTAGAIN.NAME :='나는 수정본임';
    STUDENTAGAIN.SEATNUM := 18;

   UPDATE GOOTT_STUDENTS
   SET ROW = STUDENTAGAIN
    WHERE ID =2;

end;
/

SELECT * FROM GOOTT_STUDENTS;


--레코드안에 레코드가 들어간 형태
DECLARE
TYPE REC_DEPT IS RECORD(
    DEPTNO DEPT.DEPTNO%TYPE,
    DNAME DEPT.DNAME%TYPE,
    LOC DEPT.LOC%TYPE
                       );

TYPE REC_EMP IS RECORD(
    EMPNO EMP.EMPNO%TYPE,
    ENAME EMP.ENAME%TYPE,
    DEPART REC_DEPT --레코드 안에 레코드가 들어간 형태
                      );
    EMP_INFO REC_EMP;

BEGIN --EMP 테이블에서 사원번호 7654인 사원의 정보
 SELECT E.EMPNO,E.ENAME,D.DEPTNO,D.DNAME,D.LOC
INTO EMP_INFO.EMPNO,EMP_INFO.ENAME,EMP_INFO.DEPART.DEPTNO,
EMP_INFO.DEPART.DNAME,EMP_INFO.DEPART.LOC
    --셀렉을 하는데 그안에 이 레코드를 넣는다는말임
 --열 이름 순서 개수 자료형 일치 해야함
 FROM EMP E JOIN DEPT D ON (E.DEPTNO = D.DEPTNO)
WHERE E.EMPNO = 7654;

DBMS_OUTPUT.PUT_LINE('REC_EMP.DEPART.DEPTNO : ' || EMP_INFO.DEPART.DEPTNO);
DBMS_OUTPUT.PUT_LINE('REC_EMP.DEPART.DNAME : ' || EMP_INFO.DEPART.DNAME);
DBMS_OUTPUT.PUT_LINE('REC_EMP.DEPART.LOC : ' || EMP_INFO.DEPART.LOC);
DBMS_OUTPUT.PUT_LINE('REC_EMP.EMPNO : ' || EMP_INFO.EMPNO);
DBMS_OUTPUT.PUT_LINE('REC_EMP.ENAME : ' || EMP_INFO.ENAME);





end;
/

 --B. 컬렉션
 --: 데이터 자료형이 동일한 데이터만 저장할 수 있음
 --: 테이블의 열과 같은 형태
 --: 연관 배열 (+ 반복문)
 --: associative array (or index by table)

 --: 키 (key)(인덱스 ) + 값 (value)
-- : 키 (인덱스) 중복 X

    --형삭)
--TYPE 연관 배열 이름 IS TABLE OF 자료형 (NOT NULL(생략가능 )) --자료형 : 스칼라형,참조형 (%TYPE,%ROWTYPE)
--INDEX BY 인덱스 자료형; ---정수(BINARY_INTEGER,PLS_INTEGER)(PL/SQL 자료형)(**), 문자형 (VARCHAR,VARCHAR2)

    DECLARE
     -- 컬렉션 (자료형 )
    TYPE ARRAY_TEST IS TABLE OF VARCHAR(20)
     INDEX BY PLS_INTEGER;
       --인덱스 (정수)를 통해 ARRAY_TEST 배열 원소를 접근
       --인덱스 (정수) : -1,0,1,2,...100

      ARRAY_TEST1 ARRAY_TEST;
    BEGIN
     ARRAY_TEST1(1) := '1번 데이터';
     ARRAY_TEST1(2) := '2번 데이터';
     ARRAY_TEST1(3) := '3번 데이터';

     DBMS_OUTPUT.PUT_LINE(ARRAY_TEST1(1));
     DBMS_OUTPUT.PUT_LINE(ARRAY_TEST1(2));
     DBMS_OUTPUT.PUT_LINE(ARRAY_TEST1(3));

    END;
/
--연관 배열이 반복문과 만나면 응용할수 있는것이 많음 !
DECLARE                       --하나의 행을 정의 하기위해 레코드를 만든것
            --연관배열 + 레코드 (record)
            --연관 배열 안에 데이터 자료형이 레코드가 될수 있음
--TYPE REC_DEPT IS RECORD(
  --  DEPTNO DEPT.DEPTNO%TYPE,
   -- DNAME DEPT.DNAME%TYPE,
    --LOC DEPT.LOC%TYPE
                     --  );

    --TYPE ASSARRAY IS TABLE OF REC_DEPT
    --INDEX BY PLS_INTEGER;

    TYPE ASSARRAY IS TABLE OF DEPT%ROWTYPE --새로운 행의 구조를 가지는것이 아닌 기존의 DEFT 같은 구조를 가지므로 레코드형을 안써도됨!
    INDEX BY PLS_INTEGER;

    DEPT_ARRAY ASSARRAY;
    idx PLS_INTEGER :=0;
BEGIN
    FOR i in (SELECT DEPTNO,DNAME,LOC FROM DEPT) LOOP
        idx := idx+1;
        DEPT_ARRAY(idx).DEPTNO := i.DEPTNO;
            DEPT_ARRAY(idx).DNAME := i.DNAME;
            DEPT_ARRAY(idx).LOC := i.LOC;

        DBMS_OUTPUT.PUT_LINE(DEPT_ARRAY(idx).DEPTNO || ' ' || DEPT_ARRAY(idx).DNAME || ' ' || DEPT_ARRAY(idx).LOC);
        end loop;




end;
/
--EMP 테이블의 EMPNO,ENMAE,JOB 의 데이터 자료형을 참조하는 RECORD 만들고,
--해당 RECORD 하나의 요소를 갖는 연관 배열을 만들어보자!
--그리고 EMP 테이블의 EMPNO,ENAME,JOB 을 복사해서 연관 배열에 저장 및 출력해보자

DECLARE
TYPE REC_EMP IS RECORD (

    EMPNO EMP.EMPNO%TYPE,
    ENAME EMP.ENAME%TYPE,
    JOB EMP.JOB%TYPE
                       );
    TYPE ASSARRAY IS TABLE Of REC_EMP
    INDEX BY PLS_INTEGER;
    EMP_ARRAY ASSARRAY;
    idx PLS_INTEGER :=0;
BEGIN
        FOR i IN (SELECT * FROM EMP)LOOP
            idx := idx + 1;
            EMP_ARRAY(idx).EMPNO := i.EMPNO;
            EMP_ARRAY(idx).ENAME := i.ENAME;
            EMP_ARRAY(idx).JOB := i.JOB;

           DBMS_OUTPUT.PUT_LINE(EMP_ARRAY(idx).EMPNO ||
                                ' ' || EMP_ARRAY(idx).ENAME || ' ' ||
                                EMP_ARRAY(idx).JOB);

            end loop;
end;

--컬렉션 메소드

/*

1) EXISTS (n) : n 인덱스의 데이터 존재하면 true,존재하지않으면 false
2) COUNT  : 저장된 요소 반환
3) FIRST  : 첫번쨰 인덱스 반환
4) LAST  : 마지막 인덱스 반환
5) FRIOR (n) : n인덱스 바로앞에 있는 인덱스 값 반환 (없으면 NULL 반환 )
6) NEXT (n) : n인덱스 바로 다음 인덱스 값 반환 (없으면 NULL 반환 )
7) DELETE  : 저장된 요소를 지움
DELETE : 모든 요소삭제
DELETE(n) : n 인덱스의 요소를 삭제
DELETE(n,m) : n~ M 인덱스 요소를 삭제

*컬렉션 이름.메소드이름 호출 (메소드 이름에 () 없음 )
*/

DECLARE
    TYPE ARRAY_METHOD IS TABLE OF VARCHAR(20)
    INDEX BY PLS_INTEGER;

    TEST_ARRAY ARRAY_METHOD;
    BEGIN
    TEST_ARRAY(1) := '1번 데이터';
    TEST_ARRAY(2) := '2번 데이터';
    TEST_ARRAY(3) := '3번 데이터';
    TEST_ARRAY(-50) := '-50번 데이터';
    TEST_ARRAY(100) := '100번 데이터';

    IF TEST_ARRAY.EXISTS(-50) THEN
        DBMS_OUTPUT.PUT_LINE('50번 요소 존재!');
        END IF;
    IF TEST_ARRAY.EXISTS(1) THEN
        DBMS_OUTPUT.PUT_LINE('1번 요소 존재!');
    END IF;
    IF TEST_ARRAY.EXISTS(100) THEN
        DBMS_OUTPUT.PUT_LINE('100번 요소 존재!');
    END IF;

    TEST_ARRAY.DELETE(1); --1번 요소 삭제

    IF TEST_ARRAY.EXISTS(1) THEN
        DBMS_OUTPUT.PUT_LINE('1번 요소 존재!'); --없으면 안뜸 !

ELSE   DBMS_OUTPUT.PUT_LINE('1번 요소 존재안함 ㅋ');

    END IF;

    DBMS_OUTPUT.PUT_LINE(TEST_ARRAY.COUNT);
    DBMS_OUTPUT.PUT_LINE(TEST_ARRAY.FIRST);
    DBMS_OUTPUT.PUT_LINE(TEST_ARRAY.LAST);
    DBMS_OUTPUT.PUT_LINE(TEST_ARRAY.PRIOR(50));
    DBMS_OUTPUT.PUT_LINE(TEST_ARRAY.NEXT(-100));




end;
/

