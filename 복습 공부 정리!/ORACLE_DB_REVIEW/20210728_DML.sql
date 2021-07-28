--[데이터 조작어 ](DML,Data Manipulation Language)
--: 테이블 데이터를 조작하는 언어 (데이터 추가,수정,삭제)

--1) 데이터 추가 (INSERT문)
SELECT * FROM TAB;
--테이블이 있으면 삭제
DROP TABLE DEPT_TEMP;
DROP TABLE DEPT_TEMP2;

--테이블 생성

CREATE TABLE DEPT_TEMP
AS SELECT * FROM DEPT;

SELECT * FROM DEPT_TEMP;

--형식)
/*INSERT INTO 테이블 명 [(열1,열2,...)]
VALUES (열1에 들어갈 데이터, 열2에 들어갈 데이터 ,...)
*/
--부서번호 50, 부서이름 GOTT 위치 서울 추가
INSERT INTO DEPT_TEMP (DEPTNO, DNAME, LOC)
VALUES (50,'GOTT','SEOUL');

--INSERT 오류
--A. 열 개수 ! = 데이터 개수
SELECT * FROM DEPT_TEMP;
INSERT INTO DEPT_TEMP (DEPTNO, DNAME, LOC)
VALUES (60,'GOTT2'); --불가능~

SELECT * FROM DEPT_TEMP;
INSERT INTO DEPT_TEMP (DEPTNO, DNAME)
VALUES (60,'GOTT2');--이건가능

SELECT * FROM DEPT_TEMP;
INSERT INTO DEPT_TEMP (DEPTNO, DNAME)
VALUES ('60','GOTT2'); --암시적 형변환 잘됨!

SELECT * FROM DEPT_TEMP;
INSERT INTO DEPT_TEMP (DEPTNO, DNAME)
VALUES ('GOOD','GOTT2');--얘는 암시적으로도 자리형이 맞지않음 안됨

DESC DEPT_TEMP;

--DESC DEPT_TEMP; -- SQLPLUS 툴 X
--C

INSERT INTO DEPT_TEMP (DEPTNO, DNAME)
VALUES ('100','GOTT2');--DEPTNO(NUMBER(2))

--촤대 범위는 2칸 100은 3칸임 ㅋ

-- 아직 데이터가 확정되지 않았을 경우
--1
INSERT INTO DEPT_TEMP (DEPTNO, DNAME, LOC)
VALUES (70,'WEB DEVELOP',null);
--가독성이 좋음 베스트!

--빈공간으로 NULL 로 대체가능
INSERT INTO DEPT_TEMP (DEPTNO, DNAME, LOC)
VALUES (70,'WEB DEVELOP','');
--숫자형,문자형,데이트형

--테이블 생성(EMP_TEMP)
--ㅋ테이블의 구조만 들고 오고싶음
CREATE TABLE EMP_TEMP
AS SELECT * FROM EMP WHERE 1 <> 1;
-- 조건이 fALSE 가 되기 떄문에 행 셀렉션이 일어나지 않음
--열 이름만 가지고 올수 있음

SELECT  * FROM EMP_TEMP;

-- 데이터에 DATE형 실습
-- 년/월/일, 년-월-일
INSERT INTO EMP_TEMP (EMPNO, ENAME, JOB, HIREDATE)
VALUES (5555, '최은빈', 'PRESIDENT', '2021/12/10');

SELECT * FROM EMP_TEMP;

INSERT INTO EMP_TEMP (EMPNO, ENAME, JOB, HIREDATE)
VALUES (6666, '홍길동', 'DEVELOPER', '2021-12-10');

-- 1
INSERT INTO EMP_TEMP (EMPNO, ENAME, JOB, HIREDATE)
VALUES (7777, '홍길순', 'DEVELOPER', '10/12/2021');

-- 2
INSERT INTO EMP_TEMP (EMPNO, ENAME, JOB, HIREDATE)
VALUES (7777, '홍길순', 'DEVELOPER', '10-12-2021');

/* 1번 2번 가능할까요 ?
 * 오라클 설치 지역, 기본 언어 (날짜 표기 방법 => 한국식만 가능)
 *
 */

INSERT INTO EMP_TEMP (EMPNO, ENAME, JOB, HIREDATE)
VALUES (7777, '홍길순', 'DEVELOPER',
        TO_DATE('10-12-2021', 'DD-MM-YYYY'));
-- 포맷 지정하면 미국식 날짜 가능!

SELECT * FROM EMP_TEMP;

INSERT INTO EMP_TEMP (EMPNO, ENAME, JOB, HIREDATE)
VALUES (8888, '홍길묵', 'SALESMAN', SYSDATE);
-- SYSDATE: 현재 시스템 시간으로 날짜 입력
-- 데이터가 언제 들어갔는지 확인하기 좋음

-- 데이터 일괄적으로 추가 (서브쿼리)
-- VALUES 부분을 서브쿼리로 대신
-- 열 개수, 자료형 일치

-- 사원 급여 등급이 2등급인 사원 정보 테이블 추가
-- EMP_TEST: EMP 복제
-- EMP + SALGRADE 조인
INSERT INTO EMP_TEMP (EMPNO, ENAME, JOB, HIREDATE, SAL)
SELECT E.EMPNO, E.ENAME, E.JOB,
       E.HIREDATE, E.SAL
FROM EMP E, SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
  AND S.GRADE = 2;
-- 서브쿼리

SELECT * FROM EMP_TEMP;
SELECT * FROM EMP;
SELECT * FROM TAB;

DROP TABLE EMP_TEMP_Q1; --지우기

CREATE TABLE EMP_TEMP_Q2 --새로운 테이블 생성
AS SELECT *
FROM EMP
    WHERE 1<>1;



-- Q1. SMITH보다 SAL를 많이 받고 있는 사원들 추가
INSERT INTO EMP_TEMP(EMPNO, ENAME, JOB, HIREDATE, SAL)
SELECT EMPNO,ENAME,JOB,HIREDATE,SAL
FROM EMP
WHERE SAL > (SELECT SAL FROM EMP WHERE ENAME = 'SMITH');

--센세 풀이

INSERT INTO EMP_TEMP_Q1
SELECT *
FROM EMP E
WHERE E.SAL > (SELECT SAL FROM EMP WHERE ENAME = 'SMITH');

SELECT * FROM EMP_TEMP_Q1;


-- Q2. 30번  부서 평균 급여 보다 적게 받고 있는 사원들 추가 ** 내가푼건 셀렉해서 추가한 형태
INSERT INTO EMP_TEMP -- 모든 데이터에 넣고 싶을떈 (블라블라,..)안해도됨
SELECT *
FROM EMP
WHERE SAL < (SELECT AVG(SAl) FROM EMP WHERE DEPTNO = 30 GROUP BY DEPTNO);

--센세 풀이 + 추가 문제 30 번 부서 사원들중 30번 부서 평균보다 작은 급여를 받는 사원들 추가
--서브 쿼리를 두개 돌린거임!
-- FROM EMP 형태로 해서 WHERE 절에 조건 추가한거랑 같은형태임
--다만 여기서 인라인 뷰 (WITH)에서는 일부 열만 들고올수 있음!
-- 인라인뷰 (테이블 안의 일부 데이터를 추출해서 일부 테이블을 만드는것)
 -- ** 여기선 (인라인뷰 )서치 대상들을 따로모아 새로운 테이블 형태를 생성 할수 있음
INSERT  INTO EMP_TEMP_Q2
WITH
E30 AS (SELECT * FROM EMP WHERE DEPTNO =30)
SELECT *
FROM E30
    WHERE E30.SAL < (SELECT AVG(SAL) FROM EMP WHERE DEPTNO = 30);


-- Q3. KING보다 입사일이 빠른 사원들 추가
INSERT INTO EMP_TEMP
SELECT *
FROM EMP
WHERE HIREDATE <  (SELECT HIREDATE FROM EMP WHERE ENAME = 'KING');

--센세 풀이

CREATE TABLE EMP_TEMP_Q3 --새로운 테이블 생성
AS SELECT *
   FROM EMP
   WHERE 1<>1;

INSERT INTO EMP_TEMP_Q3
SELECT *
FROM EMP
WHERE HIREDATE <  (SELECT HIREDATE FROM EMP WHERE ENAME = 'KING');

SELECT * FROM EMP_TEMP_Q3; --드래그 해서 실행할때 셀렉은 따로 해야함 ㅋ


-- Q4. 매니저 이름이 'BLACK'인 사원 추가
INSERT INTO EMP_TEMP
SELECT *
FROM EMP
WHERE ENAME = 'BLACK';

--센세 풀이 (ㅋㅋ 문제를 잘못 이해함 사원이 가지고 있는 매니져 번호의 사람이 블랙을 찾으란 거임)
--내 상가가 블랙이면 날 추가하는거임 (?) 꼬였군 ㅋ
CREATE TABLE EMP_TEMP_Q4 --새로운 테이블 생성
AS SELECT *
   FROM EMP
   WHERE 1<>1;

INSERT INTO EMP_TEMP_Q4
SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR,
       E.HIREDATE, E.SAL, E.COMM, E.DEPTNO -- 두개를 쪼인해서 벨류가 옆으로
        --길게 늘어젼 상태임 벨류가 불분명함 * 쓰지말고 직접 지정해 줘야함!
FROM  EMP E,EMP E2 --셀프 조인
WHERE E.MGR = E2.DEPTNO
AND E2.ENAME = 'BLAKE';

SELECT * FROM EMP_TEMP_Q4;


-- Q5. 급여등급이 1등급인 사원 추가

INSERT INTO EMP_TEMP
SELECT E.EMPNO, E.ENAME, E.JOB,E. MGR, E.HIREDATE, E.SAL, E.COMM, E.DEPTNO
FROM EMP E,SALGRADE S
WHERE (SAL BETWEEN S.LOSAL and S.HISAL) and S.GRADE = 1;

--센세풀이
--조인하지 않고 해보자
CREATE TABLE EMP_TEMP_Q5 --새로운 테이블 생성
AS SELECT *
   FROM EMP
   WHERE 1<>1;

INSERT INTO EMP_TEMP_Q5
SELECT *
FROM EMP
WHERE SAL BETWEEN (SELECT LOSAL FROM SALGRADE WHERE GRADE =1)
and (SELECT HISAL FROM SALGRADE WHERE GRADE =1);

SELECT * FROM EMP_TEMP_Q5;

-- 좀더 깔끔히 현쭌님 방법

INSERT INTO EMP_TEMP_Q5
SELECT *
FROM EMP
WHERE SAL in (SELECT  SAL
              FROM EMP,SALGRADE
              WHERE SAL BETWEEN LOSAL
              AND HISAL
              AND GRADE =1  )   ;

--[데이터 수정] 늘 조심하셈 수정이나 삭제는 본래 데이터를 없앰 ㅋ
/*
  DB 테이블에 저장된 데이터 변경 UPDATE
  형식 )
  UPDATE [테이블명]
  SET [변경할 열1] = [데이터],[변경할 열2] = [데이터],...
  [WHERE 데이터 변경 대상 셀렉션 (옵션)]

  WHERE 절 생략시?
  지정된 대상 열에 모든 데이터가 전부 바뀔수도 있음!

*/

SELECT * FROM TAB;
CREATE TABLE DEPT_TEMP2
AS SELECT * FROM DEPT; -- DEPT 형태로 복사!

SELECT * FROM DEPT_TEMP2;

UPDATE DEPT_TEMP2
SET LOC = 'SEOUL';
--WHERE 절이 생략 전부다 바뀜 ㅋ

UPDATE DEPT_TEMP2
SET LOC = 'CHICAGO',DNAME = 'FACTORY'
WHERE DEPTNO = 40;

--Q1.EMP TEMP 테이블에서 사원중 급여가 2500 이하인 사원만
--추가수당을 50으로 수정

DROP TABLE EMP_TEMP; --삭제하고
CREATE TABLE EMP_TEMP --새로만들고
AS SELECT * FROM EMP; -- 그테이블의 형태는 EMP 테이블을 그대로 가지고옴 만약
--WHERE 절을 FALSE EX(1 <> 1)형태로 만들면 형식만 들고옴!


UPDATE EMP_TEMP
SET COMM = '50'
WHERE SAL <=2500;

SELECT * FROM EMP_TEMP;

--데이터 수정 (서브쿼리 활용)
SELECT * FROM DEPT;
SELECT * FROM DEPT_TEMP2;

UPDATE DEPT_TEMP2
SET (DNAME,LOC) = (SELECT  DNAME,LOC FROM DEPT WHERE DEPTNO =40 )
--다중열 서브쿼리 --데이터 타입 ,개수 조심해야함!
--여기에 40 안적으면 전부다 가지고옴
WHERE DEPTNO = 40;-- 여기에 조건을 안넣으면 전부다 바꿔버림

--각자 추가하기

UPDATE DEPT_TEMP2
SET (DNAME) = (SELECT  DNAME FROM DEPT WHERE DEPTNO =40 )
   ,(LOC) = (SELECT  LOC FROM DEPT WHERE DEPTNO =40 )-- 콤마 연결 주으!
WHERE DEPTNO = 40;

--[데이터 삭제 ]
/*
    형식)

    DELETE [FROM] [테이블 명]
    [WHERE 삭제할 대상 셀렉션 조건식(옵션)]

    -WHERE 절 안쓰면
    테이블 전체 데이터 삭제
    -특정행 삭제하고 싶으면 WHERE 절 추가!
*/

SELECT * FROM EMP_TEMP2;

DROP TABLE EMP_TEMP2;

CREATE TABLE EMP_TEMP2
 as SELECT * FROM EMP;

--Q1 이름에 M이 들어간 사원 삭제
DELETE FROM EMP_TEMP2
WHERE ENAME like UPPER('%E%');

--Q2. 급여등급 3등급 (SALGRADE,EMP_TEMP2)인
--사원중에 30번 부서 사원 삭제

DELETE FROM EMP_TEMP2
WHERE DEPTNO =30 and SAL in
  (SELECT SAL FROM EMP,SALGRADE
   WHERE  EMP.SAL BETWEEN SALGRADE.LOSAL
   and SALGRADE.HISAL and GRADE = 3);


--Q3. 추가 수당이 NULL 인 사원 삭제

DELETE FROM EMP_TEMP2
WHERE COMM is null;

--Q4. 부서 근무지가 'NEW YORK'인 부서에서 일하는 사원 삭제
SELECT * FROM DEPT;


--Q5. 부서별 가장 연봉이 높은 사람을 제외하고 사원 삭제
--GROUP BY , MAX()






