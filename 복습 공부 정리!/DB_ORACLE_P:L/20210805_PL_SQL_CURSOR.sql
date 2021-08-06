/*
커서 (Cursor)
;SELECT 문 또는 DML (Data Manipulation Lang. 데이터 조작어) 와 같은 SQL 문을 실행헀을때
해당 SQL 문을 처리할수 있는 메모리 공간 (Private SQL Area)

:커서는 메모리 공간의 주소를 가르키는 포인터
: SELECT , DML 을 통해 접근해야 하는 행이 여러 개일때 커서 가능
*/

--1) 명시적 커서 (explicit cursor)
--2) 암시적 커서 (implicit cursor)
--SELECT INTO ROWTYPE 형 변수
--: 조회했을떄 하나의 행만 가능
--: 커서는 여러개의 행 조회(보통은 결과 행이 하나일지 여러개 일지 모름 )

--1) 명시적 커서
/*
:명시적으로 사용자가 직접 커서를 선언하고 사용하는 커서
A. 커서 선언 (declaration)
: SQL 문 함께 선언

B. 커서 열기 (open)
:커서 선언 할때 작성한 SQL 문 실행
:ACTIVE SET : SQL 문에 영향 받는 행

C. 커서를 통해 읽어온 데이터 사용 (fetch)
:SQL 문 결과 정보를 변수 저장하고 필요한 작업을 수행
: 각 행별로 작업을 하기위해 반복문과 같이 사용

D. 커서 닫기 (close )
: 모든행에서 사용 후 커서 종료

형식) DECLARE
CURSOR 커서 이름 IS SQL문 - 커서 선언
BEGIN
  OPEN 커서 이름 ; - 커서 열기
 FETCH 커서 이름 INTO 변수명; -커서로 부터 읽어온 데이터 사용
CLOSE 커서 이름 ; - 커서 닫기
END;


*/
--하나의 행만 조회를 위해 커서 사용 (잘안씀.>!) => 조회되는 행이 여러개일때 좋음!
--하나의 행일떈 걍 원래 하던대로 SELECT 하면됨
DECLARE
    DEPT_ROW DEPT%ROWTYPE;

    --커서 명시적 선언
    CURSOR TEST_CURSOR IS
    SELECT *
    FROM DEPT
    WHERE DEPTNO =40;

    BEGIN
    --커서 열기
    OPEN TEST_CURSOR;

    --커서로 읽은 데이터를 DEPT_ROW 에 대입
    FETCH TEST_CURSOR INTO DEPT_ROW;

    DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || DEPT_ROW.DEPTNO);
    DBMS_OUTPUT.PUT_LINE('DNAME : ' || DEPT_ROW.DNAME);
    DBMS_OUTPUT.PUT_LINE('LOC : ' || DEPT_ROW.LOC);
    CLOSE TEST_CURSOR;
end;
/

--여러행 조회되는경우 (+LOOP 문)
DECLARE
    DEPT_ROW DEPT%ROWTYPE;

    --커서 선언
    CURSOR  C1 IS
    SELECT *
    FROM DEPT;

    BEGIN
    --커서 열기
    --SQL 문으로 영향받은 행을 확인할 수 있음 (ACTIVE SET)
    OPEN C1;
    LOOP
        --커서로 부터 읽은 데이터 사용
        FETCH C1 INTO DEPT_ROW;

        --커서를 속성중에서 NOTFOUND 를 이용하면
       --더이상 읽을 데이터가 없다는 것을 알수 있음
        --FETCH 문에서 행 추출헀으면 false, 행추출하지않으면 true 반환
        EXIT WHEN C1%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || DEPT_ROW.DEPTNO);
        DBMS_OUTPUT.PUT_LINE('DNAME : ' || DEPT_ROW.DNAME);
        DBMS_OUTPUT.PUT_LINE('LOC : ' || DEPT_ROW.LOC);



    end loop;
    CLOSE C1;

end;
/
--커서 속성
--커서 이름 %NOTFOND : FETCH문을 통해 추출된 행이 있으면 false , 없으면 true 반환
-- 커서 이름%FOUND : FETCH 문을 통해 추출된 행이 있으면 true,없으면 false 반환
--커서 이름 %ROWCOUNT : 추출된 행수 반환
--커서이름 %ISOPEN : 커서 열려 있으면 true, 없으면 false 반환

--커서 for LOOP 문

/*
형식 )
FOR 루프 인덱스 이름 IN 커서이름 LOOP
 반복 수행할 직업
END LOOP;

--OPEN ,FETCH,CLOSE 작성할 필요없음
--FOR LOOP 자동으로 수행
*/
DECLARE
    CURSOR C1 IS
    SELECT *
        FROM SCOTT.EMP;

    BEGIN
    --커서 FOR LOOP 시작 (OPEN,FETCH,CLOSE)(X)
    FOR C1_INX IN C1 LOOP --각행을 C1_IDX 저장하므로 ROWTYPE 형 변수가 필요없음!
            DBMS_OUTPUT.PUT_LINE('EMPNO : ' || C1_INX.EMPNO);
            DBMS_OUTPUT.PUT_LINE('ENAME : ' || C1_INX.ENAME);
            DBMS_OUTPUT.PUT_LINE('JOB : ' || C1_INX.JOB);
        end loop;

end;
/
--GOTT_STUDENT 테이블의 행 가지고 오는 CURSOR 작성 (FOR LOOP)
SELECT *fROM GOOTT_STUDENTS;

DECLARE
    CURSOR C1 IS
    SELECT *
    FROM GOOTT_STUDENTS;
    BEGIN
    FOR C1_IDX In C1 LOOP
        DBMS_OUTPUT.PUT_LINE('ID : '|| C1_IDX.ID);
        DBMS_OUTPUT.PUT_LINE('NAME : '|| C1_IDX.NAME);
        DBMS_OUTPUT.PUT_LINE('SEATNUM : '|| C1_IDX.SEATNUM);
        end loop;
end;
/
--사원 부서 번호 10,20,30 => 실행할 문장이 다르면 따로 커서를 만들어야 함
--커서에 파라미터 사용
/*
형식)

CURSOR 커서 이름 (파라미터(매개변수 ) 이름 자료형 ,...)is
SELECT...
*/

DECLARE
    CURSOR C1 (P_DEPTNO DEPT.DEPTNO%TYPE) IS
    SELECT * FROM DEPT WHERE DEPTNO = P_DEPTNO;

    --P_DEPTNO 별로 커서를 새롭게 실행 (마치 GROUP BY 같음)

    DEPT_ROW DEPT%ROWTYPE;
    --커서가 가지고 오는 데이터 저장하는 변수 선언

BEGIN
    OPEN C1(10);
    LOOP
        FETCH C1 INTO DEPT_ROW;
        EXIT WHEN C1%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('10번 부서 사람들의 정보입니다..');
        DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || DEPT_ROW.DEPTNO ||
                             ' ' ||' DNAME : ' || DEPT_ROW.DNAME || ' ' ||
                              'LOC : ' || DEPT_ROW.LOC);

    end loop;
    CLOSE C1;

    OPEN C1(20);
    LOOP  FETCH C1 INTO DEPT_ROW;
    EXIT WHEN C1%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('20번 부서 사람들의 정보입니다..');
    DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || DEPT_ROW.DEPTNO ||
                         ' ' ||' DNAME : ' || DEPT_ROW.DNAME || ' ' ||
                         'LOC : ' || DEPT_ROW.LOC);

    end loop;
    CLOSE C1;

    OPEN C1(30);
    LOOP  FETCH C1 INTO DEPT_ROW;
    EXIT WHEN C1%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('30번 부서 사람들의 정보입니다..');
    DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || DEPT_ROW.DEPTNO ||
                         ' ' ||' DNAME : ' || DEPT_ROW.DNAME || ' ' ||
                         'LOC : ' || DEPT_ROW.LOC);

    end loop;
    CLOSE C1;

    OPEN C1(40);
    LOOP FETCH C1 INTO DEPT_ROW;
    EXIT WHEN C1%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('40번 부서 사람들의 정보입니다..');
    DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || DEPT_ROW.DEPTNO ||
                         ' ' ||' DNAME : ' || DEPT_ROW.DNAME || ' ' ||
                         'LOC : ' || DEPT_ROW.LOC);

    end loop;
    CLOSE C1;
end;
/
 -- FoR LOOP 으로 변환
    DECLARE
    CURSOR C1 (P_DEPTNO DEPT.DEPTNO%TYPE) IS
    SELECT * FROM DEPT WHERE DEPTNO = P_DEPTNO;

    --P_DEPTNO 별로 커서를 새롭게 실행 (마치 GROUP BY 같음)

    --10,20,30,.. 입력을 받을려면?
        --사용자에게 입력받은 부서 번호를 저장할 변수 선언
        DEPTNO_INPUT DEPT.DEPTNO%TYPE;

BEGIN --상용자 에게 입력받기
       --사용자에 부서 번호를 입력받아서 (&)INPUT (치환 변수 ) 에 넣고 DEPTNO_INPUT에 대입
        DEPTNO_INPUT := &INPUT;

     --커서 FOR LOOP
        FOR C_IDX IN C1(DEPTNO_INPUT) LOOP
                DBMS_OUTPUT.PUT_LINE(DEPTNO_INPUT || '번 부서 사람들의 정보입니다..');
                DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || C_IDX.DEPTNO ||
                                     ' ' ||' DNAME : ' || C_IDX.DNAME || ' ' ||
                                     'LOC : ' || C_IDX.LOC);
            end loop;


end;
/
--2)암시적 커서 (안에 속성값들이 있던거임! )
--SQL 문을 작성할 자동으로 오라클에서 선언한 커서
--SELECT ,DML 명렁어 자동으로 생성
