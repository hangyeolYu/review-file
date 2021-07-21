CREATE TABLE STUDENT (
                         ID INT,
                         LastName VARCHAR(255),
                         FirstName VARCHAR(255),
                         Address VARCHAR(255),
                         City VARCHAR(255)
);
--/Users/yuhangyeol/Library/Application Support/JetBrains/IntelliJIdea2021.1/consoles/db/0e852310-c34a-4f03-bada-510f8e6101e0/console.sql
SELECT * FROM STUDENT;

-- 1) 특정 속성값만 데이터를 삽입하는 경우
-- INSERT INTO 테이블명 (속성 1, 속성 2,....)
-- VALUES (값 1, 값 2, ....)
INSERT INTO STUDENT (ID, LastName, FirstName)
VALUES (1, '홍', '길동');

-- 2) 모든 속성에 대해 데이터를 삽입하는 경우
-- INSERT INTO 테이블명
-- VALUES (값 1, 값 2, ....)
INSERT INTO STUDENT
VALUES (1, '홍', '길동', '구트학원', '서울시');







-- 1) WHERE절
-- : SELECT문으로 데이터를 조회할 때 특정 조건을 기준으로 원하는 행 출력

-- 형식
-- SELECT [열1 이름], [열2 이름]... [열N 이름]
-- FROM [조회할 테이블 이름]
-- WHERE [조회할 행 선별하기 위한 조건식];

SELECT * FROM EMP;
--중복을 제거하지 않고 출력 all
SELECT ALL * FROM EMP;

-- : EMP 테이블에서 부서 번호 (DEPTNO) 30인 행 조회
SELECT * FROM EMP WHERE DEPTNO = 30;

-- : EMP 테이블에서 부서 번호 (DEPTNO) 30인 아닌 행 조회
SELECT * FROM EMP WHERE DEPTNO != 30; -- ISO 표준 X
SELECT * FROM EMP WHERE DEPTNO <> 30; -- ISO 표준 O
-- 부서 번호가 30 초과거나 미만 (30이 아닌 행 조회)

-- 2) AND, OR 연산자
-- : WHERE문에 조건식 추가
SELECT * FROM EMP WHERE DEPTNO = 30 AND JOB = 'salesman'; -- 검색 X
select * from emp where deptno = 30 and job = 'SALESMAN'; -- 검색 가능
-- <주의!>
-- SQL 문장은 대소문자 구별 X
-- 테이블 안의 문자(열) 데이터는 대소문자 구별

SELECT * FROM EMP;
-- 실습)
-- EMP 테이블에서
-- 사원 번호가 7499이고 (AND) 부서 번호가 30인
-- 사원 번호, 사원 이름, 부서 번호만 나오도록 출력

SELECT EMPNO, ENAME, DEPTNO
FROM EMP
WHERE EMPNO = 7499
  AND DEPTNO = 30;

-- EMP 테이블에서
-- 부서 번호가 20이거나 (OR) 직업이 SALESMAN인
-- 사원 번호, 사원 이름, 부서 번호, 직업이 나오도록 출력

SELECT EMPNO, ENAME, DEPTNO, JOB
FROM EMP
WHERE DEPTNO = 20
   OR JOB = 'SALESMAN';


-- 3) 연산자 종류
-- a. 논리 연산자: AND, OR
-- b. 산술 연사자: +, -, *, /

SELECT * FROM EMP;

SELECT EMPNO, ENAME, SAL, COMM, SAL * 12 + COMM AS ANNSAL
FROM EMP;
-- NULL?
-- 데이터가 없는 의미 (값이 없음)
-- 아직 확정되지 않은 값

-- NULL == 0 ??
-- NULL: 데이터 자체가 없음
-- 0: 데이터는 있는데 그 값이 0 의미

-- NULL + 1 = NULL
-- 무한대 + 1 = 무한대
-- NULL > 100 = NULL
-- NULL > NULL = NULL
-- 무한대 > 1000 = 무한대

-- * NULL이나 무한대는 어떤 산술/비교 연산을 만나도 각각 NULL, 무한대 나옴


SELECT *
FROM EMP
WHERE SAL * 12 = 36000;

-- c. 비교 연산자
-- >, <, >=, <=

SELECT *
FROM EMP
WHERE SAL > 3000;

-- 실습)
-- 급여가 2500 달러 이상이고 직업이 ANALYST인
-- 사원 번호, 사원 이름, 급여, 직업 출력

SELECT EMPNO, ENAME, SAL, JOB
FROM EMP
WHERE SAL >= 2500
  AND JOB = 'ANALYST';

SELECT *
FROM EMP
WHERE ENAME >= 'F';
-- 사전 순서로 문자열을 생각했을 때
-- 사원의 이름이 첫 문자가 F이거나 F보다 뒤쪽인 것만 검색

-- c. 논리 부정 연산자 (NOT)
-- : 조건의 결과 T -> F
-- :          F -> T
-- : 전체 조건문 반전시키는 연산자
-- : 일일이 조건문을 바꾸는 것보다 작성 시간이 줄어듦

SELECT *
FROM EMP
WHERE SAL != 3000;

SELECT *
FROM EMP
WHERE NOT SAL = 3000;

SELECT *
FROM EMP
WHERE SAL = 3000
  AND JOB = 'SALESMAN';

SELECT * FROM EMP;

SELECT *
FROM EMP
WHERE SAL != 3000
   OR JOB != 'SALESMAN';

SELECT * -- 이걸쓰면 코드의 중복을 아낄수 있음!
FROM EMP
WHERE NOT (SAL = 3000
    AND JOB = 'SALESMAN');

-- d. IN 연산자
-- : 특정 열에 해당하는 조건을 여러 개 지정할 수 있음

-- 조건식이 늘어날수록 조건식을 많이 사용 (JOB = )
SELECT *
FROM EMP
WHERE JOB = 'MANAGER'
   OR JOB = 'SALESMAN'
   OR JOB = 'CLERK';

SELECT * --코드 중복을 아낄수 있음!
FROM EMP
WHERE JOB IN ('MANAGER', 'SALESMAN', 'CLERK');


-- 형식
-- SELECT [열1 이름], ... [열N 이름]
-- FROM [테이블 명]
-- WHERE 열 이름 IN (데이터 1, 데이터 2, ... 데이터 N);

SELECT *
FROM EMP
WHERE JOB NOT IN ('MANAGER', 'SALESMAN', 'CLERK');

-- 비교 연산자
SELECT *
FROM EMP
WHERE JOB <> 'MANAGER' -- ISO 표준
  AND JOB != 'SALESMAN'
  AND JOB ^= 'CLERK';

-- 실습)
-- IN 연산자 이용해서 부서 번호가 20이거나 30인 사원 정보만 나오도록 코드 작성
SELECT *
FROM EMP
WHERE DEPTNO IN (20, 30);

SELECT *
FROM EMP
WHERE DEPTNO NOT IN (20, 30);


-- e. BETWEEN A AND B 연산자
-- : 특정 범위 내에서 데이터 조회

-- EX) 급여가 2000 ~ 3000인 사원 조회
SELECT *
FROM EMP
WHERE SAL >= 2000
  AND SAL <= 3000;


SELECT *
FROM EMP
WHERE SAL BETWEEN 2000 AND 3000; -- 2000, 3000 포함
-- BETWEEN A AND B: A <= SAL <= B

-- 실습)
-- 1)
-- 사원 정보 테이블에서 JOB이 'MANAGER'거나 (IN)
-- SAL가 2000 <=  <= 3000 사원 정보 조회 (BETWEEN AND)

-- 2)
-- NOT BETWEEN A AND B 연산자를 쓰지 않고
-- 사원 정보 테이블에서 급여 (SAL) 열 값이
-- 2000 이상 3000 이하 범위 이외 값 데이터 출력

-- 3) 아픈 동물 찾기

-- 4) 어린 동물 찾기


-- g. LIKE 연산자와 와일드 카드
-- : 일부 문자열이 포함된 데이터 조회(숫자, 문자 )
-- : 데이터 조회시 와일드 카드 (Wild Card)
-- >> 특정 문자(열) 대체하거나
-- 문자열의 데이터 패턴을 표기하는 특수문자
-- >> 자바에서 와일드 카드는 '?'
-- 데이터의 형 지정되지 않음 (데이터 형 대체)
-- 1) _: 어떤 값이든 상관없는 한 개의 문자 데이터
-- 2) %: 길이와 상관없이 모든 문자 데이터

-- 사원 이름 중에서 첫 문자가 s로 시작하는 사원 정보 출력
-- s_: sa, sb, sc, ss, .....
-- s%: s, sa, sabc, ssss, sebfd

SELECT *
FROM EMP
WHERE ENAME LIKE 'S%';

-- 사원 중에서 해당 사원의 매니저 번호가
-- 79로 시작되는 사원 정보 출력
SELECT *
FROM EMP
WHERE MGR LIKE '79%';

SELECT *
FROM EMP
WHERE MGR LIKE '79__';

-- 사원 이름 중에서 두 번째 글자가 L인 사원 데이터 조회
SELECT *
FROM EMP
WHERE ENAME LIKE '_l%'; -- ?

select *
from emp
where Ename like '_L%';

-- 1) 사원 이름에 'E'라는 문자(열)을 포함하는 이름 검색
-- 2) 입사일 2월인 사원 정보 검색//?
-- 3) 사원 직책에 뒤에서 두번째 글자가 E인 사원 정보 검색
-- 4) 입사일 1981년이 아닌 사원 정보 검색//?

--1)
select *
from EMP
where ENAME like '%E%';

--2)
select *
from EMP
    where HIREDATE like '__/07/__';-- %/07/%
--to_date(): 연도 (2칸)/월(2칸)/일(2칸)

select *
FROM EMP
    WHERE TO_CHAR(HIREDATE,'MM')=7;
--To_char 부분 단어 추츨 하는 함수 근데 년도는 To_DATE 사용된 상태임!
--DATE -> STRING/INT


--3)
select *
from EMP
    where JOB like'%E_';

-- 4)
select *
FROM EMP
WHERE HIREDATE not LIKE '1981%';--'81/%'

select *
FROM EMP
    WHERE NOT TO_CHAR(HIREDATE,'YYYY') = 1981;

select *
FROM EMP
WHERE NOT TO_CHAR(HIREDATE,'YY') = 81;


--먄약에 와일드 카드 문자가 데이터 일부일 경우 :
--데이터 자체에 _ 나 % 포함하고 있다면?
--ex) "A_A","30%">> 와일드 카드 어캐씀?
-- >> gil\_dong (| : escape 문자 )
-- >> "30\%" (\: escape 문자)

--g. IS NULL 연산자

--데이터가 비워져 있는 상태


SELECT *
FROM  EMP
WHERE COMM = NULL; --WHERE 은 조건이 TRUE 일떄만 살행되나 TRUE 가 아니믜로 실행이 안됨!

--comm = null?
-- null + 연산자 (비교/산술) => NULL;

SELECT ENAME,SAL*12+EMP.COMM AS ANNNSAL
FROM EMP;

SELECT *
FROM EMP
WHERE COMM is  NULL ;

SELECT *
FROM EMP
WHERE COMM is NOT  NULL ;

SELECT ENAME,SAL*12+EMP.COMM AS ANNNSAL
FROM EMP

WHERE SAL*12+EMP.COMM is not null;

SELECT *
FROM EMP
WHERE SAL > NULL--(X) 조건식에는 NULL 이 들어가지 않게 하자
AND COMM IS NULL ; --(X) 조건식에는 NULL 이 들어가지 않게 하자

SELECT *
FROM EMP
WHERE SAL > NULL--(X) 조건식에는 NULL 이 들어가지 않게 하자
  OR COMM IS NULL ;--(X) 조건식에는 NULL 이 들어가지 않게 하자

--i.집합 연산자

--: SELECT 문을 통해 조화헌 결과를 집합으로 표현 연산자

--[UNION]
--합집합
--연산의 결과를 합집합으로 묶어줌
--if 출력 하려고 하는 열 개수 ,각 열의 자료형이 같아야 함!

SELECT EMPNO,ENAME,SAL,DEPTNO --잘못된 데이터임! // 자료형, 순서 다 맞지만 데이터 형식은 전혀 다름!
FROM EMP
UNION
SELECT SAL,ENAME,EMPNO,DEPTNO
FROM EMP
WHERE DEPTNO = 20;

--clas Employee (OVerload)
--public Employee (int id, int sal){...}
--public Employee (int sal, int id){...}
--파일의 타입이나 ,순서 ,갯수 하나는 달라야함!
--하지만 DB 에선 다름!
--행과 열, 갯수와 자료형이 같아야하고 데이터 형식도 같아야함!

--1) 자료형, 순서 다 맞지만 데이터 형식은 전혀 다름!
--2) 열은 첫번째 SELECT  문을 따라감
--3) 에러 X

SELECT EMPNO,ENAME,SAL,DEPTNO
FROM EMP
UNION
SELECT SAL,ENAME,EMPNO
FROM EMP
WHERE DEPTNO = 20;

--1) 열 개수가 다르므로 에러 발생! 심지어 데이터 형식도 다름 ㅋ

SELECT EMPNO,ENAME,SAL,DEPTNO
FROM EMP
UNION
SELECT ENAME,SAL,EMPNO,DEPTNO
FROM EMP
WHERE DEPTNO = 20;

--1) 이친구는 열은 같지만 자료형이 다름!  에러발생!

SELECT EMPNO,ENAME,SAL,DEPTNO
FROM EMP
WHERE DEPTNO = 10
UNION
SELECT EMPNO,ENAME,SAL,DEPTNO
FROM EMP
WHERE DEPTNO = 10;

-- 오  중복 안되있음!

SELECT EMPNO,ENAME,SAL,DEPTNO
FROM EMP
WHERE DEPTNO = 10
UNION ALL --중복 허용
SELECT EMPNO,ENAME,SAL,DEPTNO
FROM EMP
WHERE DEPTNO = 10;

-- 얜 중복 ㅋ(중복 제거 X )

--[INTERSECT]

--교집합
--두 SELECT 문장의 결과 값이 같은 데이터만 출력
SELECT * FROM EMP;

--SELECT 첫번째: 사원 정보중에서 이름에 A가 들어가는 사원출력
--SELECT 두번재 : 사원 정보 중에서 DEPTNO 30인 사원 출력
-- and 같음 ㅋ

SELECT EMPNO,ENAME,DEPTNO
FROM EMP
WHERE ENAME LIKE '%A%'
INTERSECT
SELECT EMPNO,ENAME,DEPTNO
FROM EMP
WHERE DEPTNO = 30;

--[MINUS]
--A
--MINUS
--B

--A - B
--A의 결과중 B 에 졵하지 않은 데이터만 출력
--차집합 ㅋ

SELECT EMPNO,ENAME,JOB,DEPTNO
FROM EMP
WHERE JOB = 'SALESMAN'
MINUS
SELECT EMPNO,ENAME,JOB,DEPTNO
FROM EMP
WHERE EMP.ENAME   LIKE '%T%';

--i.연산자 우선순위
--where 절 조건식에 여러 연산자 사용 하는경우
--()우선순위가 제일 높음!

--2021/07/19 한번 새로 만들어서 SCOTT 추가해보자

--[오라클 함수 ]
--함수 (Function): 입력값이 있고 그 입력값에 따른 결과값 출력
-- x 값이 변하면 y 의 결과도 달라지는 연산

--함수의 종류
--1) 내장함수 (built - in function) : 오라클 기본 제공 함수
-- a. 단일행 함수
-- : 한 행씩 입력 => 한 행의 결과
-- b. 다중행 함수 (ex. 집계 함수 , aggregate)
-- : 여러 행 입력 => 한 행의 결과
-- : ex.AVG(),SUM(),COUNT(),MAX(),MIN()

--Q1. EMP 테이블에서 연봉 (SAL * 12 + COMM)의 평균
--Q2. EMP 테이블에서 사원 이름에 'E'가 들어가는 사원이 몇명인지
--Q3. EMP 테이블에서 부서 번호가 30인 사원들 중에서 시원 이름이 최댓값
--Q4. EMP 테이블에서 직업이 'salesman'인 사원들 중에서 입사일이 최솟값

--1
--내가 한거
SELECT EMPNO,ENAME,SAL,COMM,AVG(SAL*12+EMP.COMM  )OVER (  )
FROM EMP;
--센세
SELECT AVG(SAL*12+COMM) AS AVG_ANNSAL
FROM EMP;


--2
--내가한거 다중 행 함수는 단일 행 함수 또는 속성값 (열)와 같이 올수 없음
SELECT EMPNO,ENAME,SAL,COUNT(ENAME) over ()
FROM EMP
where lower(ENAME) like '%e%';

--센세
SELECT COUNT(ENAME) as COUnt_E
FROM EMP
WHERE lower (ENAME)like '%e%';



--3
--VARCHAR 데이터형 에서 최댓값
SELECT  MAX(ENAME) as MAX_ENAME
FROM EMP
WHERE DEPTNO = 30;

--4
--DATE 데이터형에서 최솟값 (DATE 형을 문자열로 생각했을떄 최솟값)
SELECT MIN(HIREDATE) as MIN_HIREDATE
FROM EMP
WHERE JOB = 'SALESMAN';

--2) 사용자 정의 함수 (user-defined-function)
--: 사용자 필요에 의해 직접 정의한 함

--<내장 함수 중에서 단일 행 함수>

--[문자형 함수]
--: 1) 대소문자 변환 함수
--UPPER(문자열):모두 대문자로 변환해서 반환
--LOWER(문자열): 모두 소문자로 변환하여 반환
--INITCAP (문자열) : 첫 글자는 대문자, 나머지를 소문자로 변환하여 변환,initial capital

SELECT ENAME,UPPER(ENAME),LOWER(ENAME),INITCAP(ENAME)
FROM EMP;

--* 언제 사용할까요?
--데이터의 형태 (소문자, 대문자)를 일괄로 변경해서 검색
--ex) scott,SCOTT,Scott

--Q1. 사원이름에 'A','a'라는 문자가 들어간 사원 정보 출력
SELECT *
FROM EMP
WHERE LOWER(ENAME)like '%a%';

--2) 문자형 길이 함수(LENGH)
SELECT ENAME,LENGTH(ENAME)
FROM EMP;

--사원의 직업 문자열의 길이가 6글자 이상인 행만 출력
SELECT *
FROM EMP
WHERE LENGTH(JOB) >=6;

--3) 문자열 일부 추출 함수 (SUBSTR)
--언제 사용? 학번 2001100003 중 100 을 추출을 원할때
-- 주민등록 번호 생년월일 뽑기 등
--SUBSTR(문자열 데이터, 시작위치) : 시작위치 ~ 문자열 끝까지 추출
--SUBSTR(문자열 데이터, 시작위치,추출길이): 시작위치부터 추출 길이만큼 추출

SELECT ENAME ,SUBSTR(ENAME,3)
FROM EMP;

SELECT ENAME,SUBSTR(ENAME,3,2)
FROM EMP;
--인덱스 3번부터 2개의 길이 만큼 추출함

--* 시작 인덱스가 0이 아니라 1부터 시작함
--* EX) SMITH => 3번째 글자 'I'

--Q1. MGR 에서 앞에 글자 (79,76,78 ) 만 추출

SELECT MGR,SUBSTR(MGR,-LENGTH(MGR),2)
FROM EMp;
-- -length 는 돌아서 첫 글자

-- 압에 두글자 추출중 널값 빼고 출력
SELECT MGR,SUBSTR(MGR,1,2)
FROM EMP
WHERE MGR is not null
order by MGR;
-- 뒤에서 두글자 출력
SELECT MGR,SUBSTR(MGR,-2,2)
FROM EMP;
-- -2 는  뒤에서 두칸!
-- length-1 도 가능함!
--가독성 측면에선 -2 이게더 좋음!


-- 뒤에서 두글자 출력 널값 빼고
SELECT MGR,SUBSTR(MGR,3,2)
FROM EMP
WHERE MGR IS not NULL
order by SUBSTR(MGR,3,2) DESC;

--글자중 중간값을 추출 근데 짝수 일경우 중간수 두수중 두번째거 출력
SELECT ENAME,SUBSTR(ENAME,LENGTH(ENAME)/2+1,1)
FROM EMP;

--MOD (modulus) 나머지 => MOD(숫자,나눌숫자)
-- MOD(2,2)== 0 => 짝수판단
--MOD(3,2)==1 => 홀수 판단
SELECT ENAME,SUBSTR(ENAME,LENGTH(ENAME)/2+1,1)
FROM EMP
WHERE MOD(LENGTH(ENAME,2)) = 1
UNION
SELECT ENAME,SUBSTR(ENAME,LENGTH(ENAME)/2,2)
FROM EMP
WHERE MOD(LENGTH(ENAME,2)) = 0;

--중복 허용
--UNION ALL

--SELECT (ALL) 기본적으로 중복 허용
--SELECT DISTINCT 사용시 중복을 허용하지않음! (결과물의 중복을 )

--4) 문자열 데이터 안에서 특정 위치를 찾는 INSTR 함수
--: 특정 문자 (열)이 어디에 포함되어 잇는 지 알고자 할때

SELECT INSTR('HELLO,ORACLE!','L') AS INSTR_1 --가장 먼저 나오는 L을 찾음!
FROM DUAL; --잠깐 연산이나 함수의 결과를 보기위해 계산을 보여주기 위한 가상 공간(테이블)
            --쓸애귀 테이블
SELECT INSTR('HELLO,ORACLE!','L',5) AS INSTR_1 --5번째 부터 세기 시작해서 나오는 L의 위치를 출력해줌
FROM DUAL;

SELECT INSTR('HELLO,ORACLE!','L',2,2) AS INSTR_1 --2 부터 찾기 시작해서 2번쨰로 나오는 L의 위치를 출력
FROM DUAL;

--형식
-- INSTR [문자열 (필수)or 열 이름 (필수)],[부분문자 (필수)],
-- [시작 위치 (선택)],
-- [찾으려고 하는 문자가 몇번째인지 지정 (선택)])

-- *만약 찾으려고 하는 문자가 없는경우 => 0을 반환
-- *만약 시작 위치를 음수를 작성하면 서치의 방향이 오른쪽부터 왼쪽 방향으로 검색하게 됨!

SELECT INSTR('HELLO,ORACLE!','L',-2,2) AS INSTR_1
FROM DUAL; -- 위치 지정에서 - 가 붙으면 뒤에서 앞으로 오면서 확인함!

--응용문제
SELECT *
FROM EMP
WHERE  INSTR(ENAME,'S') > 0;
--* 함수를 사용함 반환값이 있으므로 true 값을 만들수 있는 추가 요구식 0< 이 필요로 함!
-- Ename 이 들어간건 포문 돌린다고 생각하자

-- 5) 특정 문자를 다른 문자로 바꾸는 REPLACE 함수

--) 형식
--REPLACE([문자열(필수)or열 이름(필수)],[찾는 문자(필수)],[대체할 문자 (선택)])
--대체할 문자가 없으면 문자열 데이터에서 삭-제

SELECT '801111-1234567' AS REGNUM,
       REPLACE('801111-1234567','-',' ') AS_REPLACE_1,
       REPLACE('801111-1234567','-') AS_REPLACE_2
FROM DUAL;

--*언제씀?
--특정 문자가 포함된 데이터에서 특정 문자를 삭제하거나 대체할떄
--* ex) 계좌번호,주민번호 ,핸드폰 번호 ... 등 123-1234-56-21-1

--6) 데이터의 빈 공간을 특정 문자로 채우는 함수 (LPAD,RPAD)
--LPAD : Left Padding (왼쪽 패딩)
--RPAD : Right Padding (오른쪽 패딩)

-- 형삭)
--LPAD ([문자열 /열이름(필수)],[데이터 자릿수 (필수)],[패딩할 문자 (선택])
--RPAD ([문자열 /열이름(필수)],[데이터 자릿수 (필수)],[패딩할 문자 (선택])

-- * 패딩할 문자가 없으면 빈 공간의 자릿수 만큼 공백 문자로 채움 (space)


SELECT 'SQL',
       LPAD('SQL',10,'*')AS LPAD_1,
    LPAD('SQL',10)AS LPAD_2, --데채 문자가 없으므로 공백 표시
    RPAD('SQL',10,'*')AS RPAD_1,
        RPAD('SQL',10)AS RPAD_2,
   LENGTH( RPAD('SQL',10))AS RPAD_2_LENGTH
FROM DUAL;

-- 주민번호 앞자리만 추출해서 뒷자리 * 출력 (RPAD)
SELECT '901111-1234567',
       RPAD(SUBSTR('901111-1234567',1,7),14,'*') AS REG
FROM DUAL;

-- LENGTH 활용
SELECT '901111-1234567',
       RPAD(SUBSTR('901111-1234567',1,7),LENGTH('901111-1234567'),'*') AS REG
FROM DUAL;

--핸드폰 번호 010-1234- 만 추출 (SUBSTR )해서 뒷자리 * 출력(RPAD)

SELECT '010-1234-5678',
       RPAD(SUBSTR('010-1234-5678',1,9),13,'*') AS Phone_Number_RPAD
FROM DUAL;

-- if 넣으려는 문자열보다 자리가 작은 경우에는
--문자열이 뒤에서 부터 손실됩니다 .
SELECT 'HELLO!',
LPAD('HELLO!',4,'#') AS LPAD_1
FROM DUAL;

SELECT 'HELLO!',
       RPAD('HELLO!',4,'#') AS RPAD_1
FROM DUAL;

--7) 두 문자열을 합치는 CONCAT 함수 (concatenate)
--: 두 문자열을 하나의 데이터로 연결

SELECT *
FROM EMP;

SELECT EMPNO,ENAME,CONCAT(EMPNO,ENAME)
FROM EMP;

--결합에 결합 (또잉?)
SELECT EMPNO,ENAME,CONCAT(EMPNO,CONCAT('-',ENAME))
FROM EMP;

SELECT EMPNO,ENAME,CONCAT(CONCAT(EMPNO,' '),ENAME)
FROM EMP;

-- 문자 활용
SELECT EMPNO || ' '||ENAME -- '||' 결합 문자
FROM EMP;

SELECT EMPNO || ':'|| ENAME AS THORI
FROM EMP
ORDER BY THORI DESC;


--LPAD 활용
SELECT EMPNO,ENAME,CONCAT(EMPNO, LPAD(ENAME, LENGTH(ENAME)+1, ' ')) AS CONCAT
FROM EMP;

--8) 특정 문자를 지우는 TRIM,LTRIM,RTRIM
--: TRIM (다듬다)
--: 문자열 내에 특정 문자를 지우기 위해 사용
-- 형식 )
--TRIM ([삭제옵션(선택)],[삭제할 문자 (선택)]FROM[원본 문자열(필수)])
--삭제 옵션
--1) LEADING: 왼쪽에 있는 글자 지움
--2) TRAILING: 오른쪽에 있는 글자 지움
--3) BOTH: 양쪽 글자 지움

--삭제할 문자가 지정되지않으면 공백을 제거
--보통은 삭제할 문자를 지정하지않고 공백 제거시 사용

--제일많이 사용함
SELECT TRIM('     안녕하세요.     ') as TRIM_1
FROM DUAL;

--문자열안에 있으면 순수 문자열로 인식해 제거되지않음!
SELECT TRIM('_'FROM '_______안녕하__세요._____') as TRIM_1
FROM DUAL;

--앞
SELECT TRIM(LEADING '_'FROM '_______안녕하세요._____') as TRIM_1
FROM DUAL;
 --뒤
SELECT TRIM(TRAILING '_' FROM '_______안녕하세요._____') as TRIM_1
FROM DUAL;

SELECT TRIM(BOTH '_' FROM '_______안녕하세요._____') as TRIM_1
FROM DUAL;

--LIRIM,RIRIM 함수
--TRIM 함수와 다른 점은 문자를여러개 지정가능
--LTRIM : Left TRIM (왼쪽 지정 문자를 삭제)
--RTRIM : RIGHT TRIM (오른쪽 지정 문자를 삭제)
--형식)
--LTRIM([원본 문자열/데이터(필수)],[삭제문자 (여러개 지정가능)(선택)])
--RTRIM([원본 문자열/데이터(필수)],[삭제문자 (여러개 지정가능)(선택)])

--TRIM 함수는 여러개의 문자 지정이 불가능함
SELECT TRIM ('   _ORACLE_    ') AS TRIM_1,
       LENGTH(TRIM ('   _ORACLE_    ')) AS TRIM_1_LENGTH
 FROM DUAL;

-- ' '와 '_' 사용해서 조합할수 있는  문자를 모두 제거(몇개를 쓰던 상관 X)
--' '
--'_'
--' _'
--'_ '
-- '    '
--'_____'
--지정한 문자들로 조합할 수 있는 문자 제거
--조합할수 없는 문자가 시작되면 삭제 작업 끝남
SELECT LTRIM(' __ORACLE__  ',' _') AS LTRIM_1
FROM DUAL;

SELECT RTRIM(' __ORACLE__  ',' _') AS RTRIM_1
FROM DUAL;

SELECT RTRIM( LTRIM(  '<title>A meaningful Page</title>',
    '<title>') ,'</title>')
as TRIM_2
FROM DUAL;

SELECT RTRIM(RTRIM( LTRIM(  '<title>A meaningful Page</title>',
                      '<title>') ,'<title>'),'<,/')
           as TRIM_2
FROM DUAL;


--[숫자형 함수]
--: 숫자 데이터 (NUMBER) 을 연산하는 함수
--ROUND : 반올림 함수 12.5 => 13
--TRUNC (truncate , 길이를 줄이다 ): 버림 함수 12.5 => 12
--CEIL:올림 함수
--FLOOR : 내림 함수
--MOD : 나머지 함수

--1) ROUND ()
--: 특정 위치에서 숫자를 반올림 하는 함수
--: 반올림할 위치를 지정하지 않으면 소수점 첫번째 자리에서 반올림

-- 형식)
--ROUND([숫자 (필수)],[반올람할 위치 (선택)])

SELECT ROUND(1234.5678) AS ROUND
FROM DUAL;

SELECT ROUND(1234.5678,1) AS ROUND -- 반올림 해서 그자리까지 보여줌
FROM DUAL;

SELECT ROUND(1234.5678,3) AS ROUND -- 반올림 해서 그자리까지 보여줌
FROM DUAL;

--*반올림 할 위치에 음수값 지정할 수 있음
--* 반올림 위치 값이 음수면 자연수 쪽으로 반올림

--2) TRUNC() (truncate, 줄이다)
--: 지정된 자리에서 숫자 버림 (뭐든 진짜 걍 버림 ㅋ)
--: 버림할 자릴수를 지정 할 수 있음
-- : 버림할 자릿수가 지정되지 않으면 소수점 첫번째 자리에서 버림 ㅋ

-- 형식)
--TRUNC([숫자 (필수)],[버림할 위치 (선택)])

SELECT TRUNC(1234.5678) AS TRUNC
FROM DUAL;

SELECT TRUNC(1234.5678,3) AS TRUNC
FROM DUAL;

--3) CEIL () (천장),FLOOR () (바닥)
--: 지정한 숫자의 가까운 정수를 찾는 함수
--CEIL ([숫자 (필수)]): 입력한 숫자와 가까운 큰 정수
--FLOOR ([숫자(필수)]): 입력한 숫자와 가장 가까운 작은 정수

SELECT CEIL(12.4),FLOOR(12.4)
FROM DUAL;

SELECT CEIL(-12.4),FLOOR(-12.4)
FROM DUAL;

--4) MOD() (나머지 함수,modulus)
--MOD([나눗셈이 될 숫자 (필수)],[나눌 숫자 (필수)])

SELECT MOD(15,4)
FROM DUAL;

--* 해당수가 짝수인지 홀수인지 구별할 때 사용
--1) EMP 테이블에서 사원번호가 짝수인 사원 정보 출력

SELECT *
FROM EMP
WHERE MOD(EMPNO,2) = 0;
--2) EMP 테이블에서 사원번호가 홀수인 사원 정보 출력

SELECT *
FROM EMP
WHERE MOD(EMPNO,2) <> 0;





--[날짜형 함수]
--날짜 데이터 (DATE) 다루는 함수

--날짜 데이터 + 숫자 => 날짜 데이터보다 숫자만큼 이후의 날짜 반환
--날짜 데이터 - 숫자 => 날짜 데이터보다 숫자만큼 이전 날짜 반환
--날짜 데이터 + 날짜 데이터 => 지원 x
--날짜 데이터 - 날짜 데이터 => 두 데이터 간의 일수 차이


--1) SYSDATE 함수
-- :Oracle DB가 설치된 OS (운영체제)의 현재 날짜와 시간을 반환

SELECT SYSDATE
FROM DUAL;

SELECT SYSDATE +1 -- 일수를 더함
FROM DUAL;

--2) ADD_MONTHS()
--: 특정 날짜에 지정한 개월 수 이후 날짜 데이터 반환
-- 형식) ADD_MONTHS([날짜 데이터(필수)], [더할 개월 수 (정수)(필수)])
SELECT SYSDATE,ADD_MONTHS(SYSDATE,3) -- 개월수를 더함
FROM DUAL;

SELECT SYSDATE,ADD_MONTHS(SYSDATE,-3) -- 음수도 가능!
FROM DUAL;

--1) EMP 테이블 사우넏르의 근무 일수 계산
SELECT ENAME,TRUNC(SYSDATE - HIREDATE) as WORKDAYS
FROM EMP;

--2) EMP 테이블의 사우너들 중에서 입사한지 40년이 넘는 사람들을 추출해서 모든 정보 출력
SELECT *
FROM EMP
WHERE HIREDATE- ( ADD_MONTHS(HIREDATE,12*40))>0;

SELECT *
FROM EMP
WHERE (SYSDATE - HIREDATE) / 365 > 40;

--Q3. EMP 테이블의 사원들의 10주년이 되는 날짜 사원 이름과 같이 출력
SELECT ENAME,ADD_MONTHS(HIREDATE,10*12) AS WORK_10_YEAR
FROM EMP;

--3) 개월수 차이를 구하는 MONTHS_BETWEEN()
--: 두 날짜 사이의 개월 수 차이를 구함
-- 형식 ) MONTHS_BETWEEN([날짜 데이터1(필수)],[날짜 데이터2(필수)])


--EMP 테이블에서 사원의 입사날과 현재 시스템의 날짜 개월 수 차이를 계산

SELECT ENAME,HIREDATE,SYSDATE,TRUNC(MONTHS_BETWEEN(SYSDATE,HIREDATE)) AS MONTH1
       -- SYSDATE-HIREDATE 최근 일자를 앞에 적어야함!
-- 현재까지 일한 개월수

,ROUND(TRUNC(MONTHS_BETWEEN(SYSDATE,HIREDATE))/12,1)AS YEAR_TRUNC
--현재까지 일한 년수 . 개월수
FROM EMP;

--4) NEEXT_DAY(),LAST_DAY()
-- : NEXT_DAY([날짜 데이터 (필수)],[요일문자(필수)])
-- : 특정 날짜 기준으로 돌아오는 요일 날짜 출력
-- : LAST_DAY([날짜 데이터 (필수)])
-- : 특정 날짜가 속한 달의 마지막 날짜 출력

SELECT SYSDATE,
NEXT_DAY(SYSDATE,'월'), --'월요일' 도 가능
LAST_DAY(SYSDATE)
FROM DUAL;

--요일문자보다는 요일 숫자를 해놓는게 좋다 유지보수에 편함!

--요일문자
--1 : '일','일요일','MON','MONDAY'
--2 : '월','월요일','MON','MONDAY'
--3 : '화'....
-- ...

--5) ROUND(),TRUNC() 함수
--: 숫자에서도 지우너하는 함수 -> 날짜 에서도 지원함
-- : 소수점 자리 표현하지 않고 반올림/버림의 기준이 될 포멧 지정
-- 형식)
--ROUND([날짜 데이터 (필수)],[반올림 기준 포멧(필수)])
--TRUNC([날짜 데이터 (필수)],[버림 기준 포멧(필수)])

--포멧 값
--CC(century),SCC: 네 자리 연도 끝 두자리 기준
-- EX) 2020 -> 20년 기준으로 올릴지 말지 결정
-- 2020 ->  50 이상이 아니기 때문에 반올림 X -> 2001년
-- 2050 -> 50 이상이기 때문에 반올림 O -> 2002

-- YYYY,YYY,YY,Y
-- : 날짜 데이터의 연,월,일의 7월 1일 기준

--Q(queter)
-- : 각 분기의 두번째 달의 16일 기준
--(1/1~3/31, 2월 16일), (4/1~6/30,5월 16일),(7/1~9/31,6월 16일),(10/1~12/31,11월 16일)

--DD,DDD
-- : 해당 일의 정오 (12:00:00 기준)

-- HH (hour),HH12,HH24
-- : 해당 일의 시간을 기준 반올림은 30분 기준


SELECT ROUND(SYSDATE,'CC') AS FORMAT_CC, --세기를 기준으로 반올림 2001년 표기
 ROUND(SYSDATE,'YYYY') AS FORMAT_YYYY,-- 7월 1일을 넘었기 떄문에 2022년 반올림
 ROUND(SYSDATE,'Q') AS FORMAT_Q, --8월 16일 이전이므로 7월1일 반올림
 ROUND(SYSDATE,'DDD') AS FORMAT_DDD,--시간이 정오가 넘어가면 7/21 표기 아니면 내림
 ROUND(SYSDATE,'HH') AS FORMAT_HH--
FROM DUAL;

SELECT TRUNC(SYSDATE,'CC') AS FORMAT_CC, --세기를 기준으로 버림
       TRUNC(SYSDATE,'YYYY') AS FORMAT_YYYY,
       TRUNC(SYSDATE,'Q') AS FORMAT_Q,
       TRUNC(SYSDATE,'DDD') AS FORMAT_DDD,
       TRUNC(SYSDATE,'HH') AS FORMAT_HH
FROM DUAL;

-- [형 변환 함수]
-- : 자료형 (숫자형,문자형,날짜형)
--1) 암시적 형 변환

--숫자형 (EMPNO) + 문자열('500') (**)
--'500'이 숫자로 변환이 가능 => 숫자 형 변환 자동(암시적 형 변환 )
SELECT EMPNO + '500',empno
FROM EMP;

--숫자형 (EMPNO) + 문자열('zzz') (**)
--'zzz' 는 숫자로 변환 불가능 => 숫자로 인식할수 없음 (형 변환 X )
SELECT EMPNO + 'zzz'
FROM EMP;


--2) 명시적 형 변환

--TO_CHAR: 숫자 /날짜형 => 문자형
--형식 ) TO_CHAR([날짜 데이터(필수)],'[출력하고자 하는 문자열(필수)]')

--무적권 문자형을 지나감!

--    숫자형    ===>    문자형   ===>  날짜형
--    숫자형    <===    문자형   <===  날짜형
SELECT  TO_CHAR(SYSDATE,'YYYY/MM/DD HH24:MI:SS') --MINUTE
AS NOW
FROM DUAL;

SELECT  TO_CHAR(SYSDATE,'YYYY/MM/DD HH12:MI:SS AM') --MINUTE 12시간 체제
            AS NOW
FROM DUAL;

--형식 지정자
-- CC: 세기
-- YYYY, RRRR: 연 (4자리 숫자)
-- YY, RR: 연 (2자리 숫자)
-- MM: 월 (2자리 숫자)
-- MON: 월 (월 이름 약자)
-- MONTH: 월 (월 이름 전체)
-- DD: 일 (2자리 숫자)
-- DDD: 1년 중 며칠 (1 ~ 366)
-- DY: 요일 (요일 이름 약자)
-- DAY: 요일 (요일 이름 전체)
-- W: 1년 중 몇 번째 주

    -- 특정 언어 맞춰서 출력
    -- 'NLS_DATE_LANGuAGE = ENGLISH....'


SELECT SYSDATE,
       TO_CHAR(SYSDATE,'MM') AS MM,
       TO_CHAR(SYSDATE,'RR') AS RR,
       TO_CHAR(SYSDATE,'MON','NLS_DATE_LANGuAGE = JAPANESE') AS MON,
       TO_CHAR(SYSDATE,'MONTH')AS MONTH
FROM DUAL;

SELECT SYSDATE,
       TO_CHAR(SYSDATE,'DD') AS DD,
       TO_CHAR(SYSDATE,'DY','NLS_DATE_LANGuAGE = JAPANESE') AS DY,
       TO_CHAR(SYSDATE,'DAY')AS DAY
FROM DUAL;

--시간 형식
--HH24 : 24시간으로 표현한 시간
--HH,HH12: 12시간 표현한 시간
--MI : 분
--SS : 초
--AM,PM,A.M.,P.M.: 오전 오후 표시

SELECT SYSDATE,TO_CHAR(SYSDATE,'HH:MI:SS P.M.')
FROM DUAL;


--TO_NUMBER: 문자 => 숫자형
--1) 암시적 형 변환 (몰래 해주는거)

SELECT 5000 - '3000' -- '$3,000' 이런건 암시적 형 변환이 안됨(숫자로 표기된게 아님)
-- '3.000' => 3.000 으로 인식
FROM DUAL;

--2) 명시적 형 번환(내가 해야되는거)
--형식 ) TO_NUMBER ([문자열 데이터 (필수)],[인식 되어야할 숫자 형태(필수)])

select 5000-TO_NUMBER('$3,000','$9,999') -- 각 자릿수의 0~9 까지 인식함!
FROM dual;

--Q1.   200000-123,500 //////자리 공간만큼 데이터 공간을 만들어 놔야함! '$22,222','$9,999'(X)
SELECT 200000 - TO_NUMBER('123,500','999,999')
FROM dual;
--Q2.5000 - $3,000
SELECT 5000- TO_NUMBER('$3,000','$9,999')
FROM dual;


--TO_DATE:문자형 => 날짜형
--scott.sql 파일에 날짜를 문자 형태로 대입할 때 사용
-- :  문자열 데이터를 입력한 후 그 데이터를 날짜 형태로 변환할때
--형식) TO_DATE([문자열 데이터(필수)],[인식되어야할 날짜 형태(필수)])

SELECT TO_DATE('2018-07-20','YYYY-MM-DD')AS TODATE
FROM DUAl;
SELECT  TO_DATE('2021/07/22','YYYY/MM/DD')AS TODATE
FROM DUAL;

--Q1. EMP 테이블에서 입사날이 1981년 7월 20일 이후인 사원 정보 모든 열 출력
SELECT *
FROM EMP
WHERE HIREDATE>TO_DATE('1981/07/20','YYYY/MM/DD'); --DATE 와 DATE 사이도 크기 비교

--날짜 데이터 형식 지정할때
-- YYYY,RRRR : 네자리 연도
-- YY,RR : 두자리 연도

SELECT  TO_DATE('49/12/10','YY/MM/DD') AS YY_YEAR,
       TO_DATE('49/12/10','RR/MM/DD') AS RR_YEAR,
    TO_DATE('50/12/10','YY/MM/DD') AS YY_YEAR2,
        TO_DATE('50/12/10','RR/MM/DD') AS RR_YEAR2
FROM DUAL;

--1950년도 기준으로 YY,RR 다르게 인식
--YY : 현 시점의 연도와 동일한 연도 계산 (EX.2021)
--RR : 현 시점의 연도 끝 두자리 수 (20(21))가 0~49 => 1900 년대
                                --    50~99 => 2000 년대

--[NULL 처리 함수]
--: 데이터 NULL 값(아직 확정되지 않은값,데이터 입력 안된 값) => 산술/비교 연산자(만나면 )=>결과 NULL
--: 데이터가 NULL 일 경우 , 연산 수행을 위해 NULL 아닌 다른 값으로 대체

--1)NVL(NULL VALUE)
--형식 )
-- NVL([NULL 인지 여부를 검사할 데이터/열(필수)],[앞의 데이터가 NULL일 경우 대체할 데이터(필수)])
--: NULL이 아니면 그대로 반환
--: NULL이면 두번째 인자로 지정한 데이터 반환

SELECT ENAME,SAL,COMM,SAL*12+COMM AS ANNSAL,SAL*12+NVL(COMM,0)AS ANNSAL_NVL
FROM EMP;


--2)NVL2(NULL VALUE)
-- 형식)
--NVL2([NULL 인지 여부를 검사할 데이터/열(필수)],[앞의 데이터가 NULL이 아닐 경우 대체할 데이터 또는 계산식(필수)],
-- [앞의 데이터가 NULL알 경우 대체할 데이터 또는 계산식(필수)])

SELECT ENAME,SAL,COMM,SAL*12+COMM AS ANNSAL,NVL2(COMM,SAL*12+COMM,SAL*12)AS ANNSAL_NVL2
-- NVL2(COMM,'O','X') 데이터
FROM EMP;

SELECT ENAME,SAL,COMM,SAL*12+COMM AS ANNSAL,NVL2(COMM,'O','X')AS ANNSAL_NVL2
-- NVL2(COMM,'O','X') 데이터
FROM EMP;

--[DECODE 함수,CASE 문]
--: if, switch 문과 비슷
--: NVL,NVL2 값이 NULL인 경우에만 처리
--: NULL 값이 아닌 경우에도 데이터 / 특정 열 값에 따라 반환할 데이터 결정

--1) DECODE 함수

--ex) EMP 테이블에서 직채에 따라 급여의 인상률을 달리할 수 있음
--a. MANAGER : 10%


--무적권 문자형을 지나감!

--    숫자형    ===>    문자형   ===>  날짜형
--    숫자형    <===    문자형   <===  날짜형









































