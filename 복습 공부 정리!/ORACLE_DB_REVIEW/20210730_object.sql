--[객체 (object)종류]

/*
-테이블(table) : 데이터 저장 공간
-데이터 사전(data dictionary)
-인덱스(index)
-뷰(view)
-시퀀스(sequence)
-동의어 (synonym)

*/

--[데이터 사전]
--DB 운영하는데 중요한 데이터 보관
--문제가 생기면 DB 사용 불가능
--데이터 사전 뷰 (view)로 열람
-- * 뷰 (view) : 테이블 일부 / 전체를 가상의 테이블로 볼 수 있게 객체

--USER_XXXX : DB 접속중인 사용자 객체 정보
--ALL_XXXX : 모두 사용 가능한 객체 정보
--DBA_XXXX :  최고 관리자만 볼수 있는 DB 관리/운용을 위한 정보
--            (SYSTEM,SYS와 같은 DBA 열람 가능)
--V$_XXXX : DB 성능 관련 (X$_XXXX 테이블 뷰)

--SCOTT 계정에서 사용 가능한 데이터 사전
SELECT * FROM DICT;
SELECT * FROM DICTIONARY;

SELECT * FROM DBA_USERS;

--USER_: SCOTT 이 가지고 있는 객체
SELECT TABLE_NAME
FROM USER_TABLES;
--ALL_: SCOTT 계정이 볼 수 있는 모든 객체
SELECT OWNER,TABLE_NAME
FROM ALL_TABLES;
--DBA_: DBA(Data Base Adminn) 을 가진 사용자만 볼 수 있는 객체
--SCOTT DBA 권한이 없는 경우에는 TABLE DOES NOT EXIST
--"사실 뭐 많은데 너는 볼 권한이 없음 ㅋ "
SELECT *
FROM DBA_TABLES;
--DBA 권한을 가지고 있는 유저 확인
SELECT *
FROM DBA_USERS; --볼려면 우측 SYSTEM - oracle 연결 변경

--[인덱스 (index)]
-- : DB 에서 데이터 검색 성능 향상
-- : "INDEX SCAN"(인덱스 값만 확인 ) VS "TABLE FULL SCAN"(전부 다 확인)

-- 테이블에 인덱스는 누굴까요?
--=> 기본키 (primary key)

--SCOTT 계정이 가진 인덱스 정보 확인
--인덱스가 속한 테이블 검색
SELECT * FROM USER_INDEXES;

--인덱스가 지정한 열 이름 확인
SELECT *
FROM USER_IND_COLUMNS;

--* 인덱스 열을 따로 지정하지 않으면
--기본키로 자동으로 생성

--1) 인덱스 생성
/*형식)

CREATE INDEX 인덱스 이름
  ON 테이블 이름 (열 이름1 ASC OR DESC, --디폴트는 ASC
               열 이름2 ASC OR DESC,
               .....
               열 이름N ASC OR DESC)

*/

SELECT * fROM EMP;

CREATE INDEX IDX_EMP_ENAME
ON EMP(ENAME
       );

SELECT * FROM USER_IND_COLUMNS;

--SAL,COMM 인덱스로 지정 (INDEX_EMP_SAL_COMM)
CREATE INDEX INDEX_EMP_SAL_COMM
ON EMP (SAL ,
        COMM )

SELECT * FROM USER_IND_COLUMNS;

--인덱스 추가 : CREATE
--인덱스 삭제 : DELETE
--인덱스 수정 : UPDATE

-- 인덱스 사용 장점?
--: 데이터 조회 속도 (SELECT )향상
--: 시스템의 부하 줄일 수 있음
--: 사이즈가 큰 테이블에 한해서 사용하기!
-- : 추가 /수정 /삭제 자주 발생하지 않는 열
-- : JOIN,WHERE 에 자주 사용되는 열

--인덱스 사용 단점
--추가 작업이 필요
-- 인덱스를 위한 저장공간이 따로 필요 (10%)
-- 인덱스를 잘못 사용할 경우 성능이 오히려 역효과

--CREATE , DELETE,UPDATE 가 빈번한 속성에 인덱스 사용하게 되면
--인덱스의 크기가 커짐

--인덱스 삭제
-- 형식 )DROP INDEX 인덱스 이름;
DROP INDEX IDX_EMP_ENAME;
SELECT * FROM USER_IND_COLUMNS;

--[뷰 (view)]
--: 가상 테이블
-- : 하나 이상의 데이터 조회 (SELECT) 저장한 객체

/*왜쓸까??
1).SELECT 문장이 간단해짐
2). 보안성 : 테이블의 특정 열을 숨기고 싶을때 (정보보호)
  ex) EMP 테이블의 SAL,COMM

*/
SELECT * FROM EMP; --실제 테이블
SELECT * FROM DEPT;-- 실제 테이블

--view 에다가 저장 (VM_DEPT)
SELECT DEPTNO,DNAME --LOC 열(정보보호)을 외부에 숨길수 있음
FROM DEPT
WHERE DEPTNO = 10;

--열을 숨길 수 있음(특정 열만 보여줄 수 있음 )
SELECT *
FROM VW_DEPT;

-- => 서브 쿼리를 사용한 것처럼 표현
SELECT *
FROM (SELECT DEPTNO,DNAME
    FROM DEPT
    WHERE DEPTNO = 10);

--INLINE VIEW (WITH ~AS) 와 차이가 뭘깡
--: 해당 쿼리에어만 사용하는 것과는 달리
--: VIEW :에서는 한번 생성하는 계속 사용 가능!

--1) 뷰 작성
--: 뷰 생성 권한 (SCOTT 뷰 생성 권한을 줘야함 ! )
-- scott 계정에 뷰생성 권한 주는 방법
--cmd 창에서
--docker exec -it oracle sqlplus 입력(DOCKER 통해서 SQLPLUS 접속)
--system/oracle 입력(계정 들어감)
--grant create view to scott; 입력(scott 계정 자격 활성호ㅓ)

--형식)
--CREATE [OR REPLACE(선택)][FORCE | NOFORCE (선택)]
--VIEW 이름
--(열이름 1, 열이름 2...(선택))
--AS (SELECT 문장)

--[WITH CHECK OPTION (CONSTRAINT 제약조건)(선택)]
--[WITH READ ONLY(CONSTRAINT 제약조건)(선택)]

--OR REPLACE : 같은 이름이 존재할 경우 대체할 이름 지정 (산택적)
--FORCE : SELECT 문 기반 테이블이 없어도 강제 생성(선택)
--NOFORCE : SELECT 문 기반 테이블이 없으면 생성 X(기본값) (선택)
--뷰 이름 : 생성할 뷰 이름 지정 (필수)
--열 이름 : SELECT 문 명시둰 이름 대신 사용할 열 이름 지정 (생략가능 ,선택)
-- 저장할 SELECT 문 : 생성할 뷰에 저장할 SELECT 문 (필수 )
--WITH CHECK OPTION :  DML 작업이 가능하도록 뷰 생성 (선택)
--WITH READ ONLY : 뷰 열람만 가능하도록 뷰 생성 (선택)

-- 뷰 생성
SELECT * FROM EMP;

CREATE VIEW VW_EMP
AS (SELECT EMPNO,ENAME,JOB,MGR,HIREDATE,DEPTNO
   FROM EMP);

SELECT * FROM USER_VIEWS;
SELECT * FROM VW_EMP;-- 가상 테이블

--뷰 삭제 (=> EMP 테이블 삭제 ? 가 되는건 아님 ㅋ)
DROP VIEW VW_EMP;

SELECT * FROM USER_VIEWS;
SELECT * FROM VW_EMP;

--Q1. 뷰 (VW_EMP) 생성
--EMPNO,ENAME,HIREDATE => NO,NAME,DATE(뷰 열 이름 변경)
--READ ONLY
--EMPNO,ENAME,HIREDATE(1500 <= SAL <=2500)

CREATE VIEW VW_EMP(NO,NAME,HDATE) --DATE 는 자료형이라 HDATE 로 수정함!
AS(SELECT EMPNO,ENAME ,HIREDATE
   FROM EMP
   WHERE SAL >= 1500 and
         SAL <= 2500)
WITH READ ONLY ; --뷰 열람 (SELECT) 만 가능

SELECT * FROM USER_VIEWS;
SELECT * FROM VW_EMP;


-- 02. 뷰 (VW_EMP) 생성
-- 동일한 이름이 있다면 REPLACE 옵션을 통해 VW_EMP로 현재 뷰로 생성
-- WITH CHECK OPTION (DML 사용 가능)
-- SMITH보다 연봉 (SAL * 12 + COMM)을
-- 조금 받는 EMPNO, ENAME, SAL 열을 가진 뷰 생성

-- WITH CHECK OPTION 기능은 VIEW에 DML 사용 가능
-- 1) 뷰에 데이터 삽입 테스트 해보기 (2021, GILDONG, 1000)
-- 2) 뷰에 데이터 삽입 테스트 해보기 (2025, GILSUN, 500)
SELECT * FROM EMP;
CREATE OR REPLACE view VW_EMP
    --기존에 있던 이름일 경우 새로운 조건으로 바꾸고 이름은 그대로감
AS(SELECT EMPNO,ENAME ,SAL
  FROM EMP
  WHERE  SAL * 12 + NVL(COMM,0) <  (SELECT EMP.SAL* 12 + NVL(EMP.COMM,0)
                 FROM EMP WHERE
                 EMP.ENAME like 'SMITH' ))
WITH CHECK OPTION ; --DML 사용가능!(조건절에 만족할때만 ㅋ )
--이거 안써도 DML 되긴하는데 조건에 상관없이 들어감. 쓰는게 좋겠쥬?
--헐 안쓰고 추가하면 원본 EMP 에도 데이터 전달되는거 같음

SELECT * FROM USER_VIEWS;
SELECT * FROM VW_EMP;

INSERT INTO VW_EMP
VALUES (2021, 'GILDONG', 1000); --문제!
--ㅋㅋ 세상에 SMITH 보다 연봉이 낮아서 못들어감 ㄹㅇ ㅋㅋ
--(VIEW 조건절 기준에 들어가지않음 )

INSERT INTO VW_EMP
VALUES (2025, 'GILSUN', 500); --정상적

--(***)VIEW 에 500 데이터가 들어갈때 COMM 은 아예 없는데
-- 없어도 NULL 로 인식해 0으로 들어감
-- (NULL 은 데이터가 아직 들어오지 않았다는 뜻임을 잊지말자..)

DROP VIEW VW_EMP;

--3) 인라인 뷰를 이용한 TOP_N SQL문
--: 인라인 뷰(inline view ) VS 뷰
--: 인라인 뷰 : SELECT문 에 일회성으로 만들어서 사용하는 뷰(with ~~ AS ~~)

--1-1. 인라인 뷰 + ROWNUM 사용
SELECT ROWNUM,E.*
FROM EMP E;

--의사열 (PSEUDO COLUMN) (ROWNUM) : 데이터에 실제 테이블에 존재하지는 않지만 특수 목적을
--위해서 열처럼 사용

--cf) 의사 코드 (PSEUDO CODE)
--: 실제 코드는 아니고 알고리즘(방법)을 표현하기위한 언어

--인라인 뷰를 이용한 TOP-N 추출
--ex)급여가 높은 상위 3명 데이터 출력 (ROWNUM)

SELECT ROWNUM,E.*
FROM (SELECT * FROM EMP ORDER BY SAL DESC ) E
WHERE ROWNUM <= 3;
--인라인 뷰 방법이지만 (WHERE) 절에 있어서 가독성 떨어짐

--인라인 뷰 방법(WITH ~~ AS ~~)
with E AS (SELECT * FROM EMP ORDER BY SAL DESC )
SELECT ROWNUM,E.*
FROM E
WHERE ROWNUM <=3;

--Q1. TOP-N 추출 문제 : 사원의 매니져의 입사일이 최근인 5명
WITH E AS (SELECT *
            FROM EMP L join EMP R on(L.MGR = R.EMPNO)
            ORDER BY R.HIREDATE DESC )
SELECT ROWNUM,E.*
FROM E
WHERE ROWNUM <=5;

--Q2.COMM이 NULL인 사람들 중에 EMPNO 가 높은사람 3명 추출
WITH E AS (SELECT *
           FROM EMP
           WHERE COMM IS NULL
           ORDER BY EMPNO DESC )
SELECT ROWNUM,E.*
FROM E
WHERE ROWNUM <=3;

--컴퓨터는 셀렉할때 위에서 아래로 읽음! 










