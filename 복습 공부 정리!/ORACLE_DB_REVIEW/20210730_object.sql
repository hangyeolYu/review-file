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


/*[시퀀스](SEQUENCE)
  : 연속되는 숫자 생성 객체
  :지속적으로 효율적인 번호 생성 가능

  ex) 계시판에 글 목록 1,2,3,4,...
  ,쇼핑몰 장바구니,찜목록 1,2,3,4,..

  SELECT MAX(목록)+1
  FROM 게시판 테이블
  (문제점?)
  -MAX(목록): 게시판 글 1000개 가 넘어갈떄 하나하나 다 세봐야함
  >>(테이블의 사이즈가 커지먄 느려짐)

    시퀀스 생성

  형식)
  CREATE SEQUENCE 시퀀스 이름
  [INCREMENT BY n] - 번호의 증가값 (기본값 1) (선택)
  [STRART WITH n] - 번호의 시작값 (기본값 1) (선택 )
  [MAXVALUE n | NOMAXVALUE] (선택)
  -MAXVALUE: 시퀀스의 최댓값
   NOMAXVALUE : 오름차순 10^27, 내림차순 -1
  [MINVALUE n | NOMAXVALUE] (선택)
  -MINVALUE :  시퀀스의 최솟값
   NOMINVALUE : 오름차순 1 ,내림차순 10^-26 == 1/10^ 26
  [CYCLE | NOCYCLE]
  CYCLE : 최댓값 도달했을 경우 다시 시작값으로 돌아감
  NOCYCLE : 최댓값 도달했을 경우 번호 생성 중단 (오류 발생 )
  [CASCE n | NOCACHE](선택) 기본값 (20)
  -CASCE : 생성할 번호 미리 지정
   NOCACHE: 미리 지정 X
*/

    --실습 DEPT_SEQUENCE 테이블 (구조만 복사)

 CREATE TABLE DEPT_SEQUENCE
 AS SELECT *FROM DEPT WHERE 1<>1;

SELECT * FROM DEPT_SEQUENCE;

--DEPTNO를 시작값 10, 10 씩 증가할 수 있도록 생성
CREATE SEQUENCE SEQ_DEPTNO
INCREMENT BY 10
START WITH 10
MAXVALUE 90
MINVALUE 0
NOCYCLE
CACHE  20;

SELECT * FROM USER_SEQUENCES;

--시퀀스 사용

--시퀀스 이름.CURRVAL => 마지막으로 생성한 번호 반환
--*아직 시퀀스를 사용한 적이 없을떄는 CURRVAL 가 없음
-- => 사용하면 오류가 남
--=> 시퀀스를 생성하자마자 바로 CURRVAL 사용할수 없음

--시퀀스 이름.NEXTVAL => 다음 생성할 번호 반환


INSERT INTO DEPT_SEQUENCE (DEPTNO)
VALUES (SEQ_DEPTNO.NEXTVAL);
--최댓값을 넘게 될 경우에는 오류 발생

SELECT * FROM DEPT_SEQUENCE;

SELECT SEQ_DEPTNO.CURRVAL
FROM DUAL;--연산 확인용 테이블(DUMMY TABLE)



--시퀀스 수정(START WITH 는 수정불가)
/*
ALTER SEQUENCE 시퀀스 이름
 형식)
  CREATE SEQUENCE 시퀀스 이름
  [INCREMENT BY n] - 번호의 증가값 (기본값 1) (선택)
  [MAXVALUE n | NOMAXVALUE] (선택)
  -MAXVALUE: 시퀀스의 최댓값
   NOMAXVALUE : 오름차순 10^27, 내림차순 -1
  [MINVALUE n | NOMAXVALUE] (선택)
  -MINVALUE :  시퀀스의 최솟값
   NOMINVALUE : 오름차순 1 ,내림차순 10^-26 == 1/10^ 26
  [CYCLE | NOCYCLE]
  CYCLE : 최댓값 도달했을 경우 다시 시작값으로 돌아감
  NOCYCLE : 최댓값 도달했을 경우 번호 생성 중단 (오류 발생 )
  [CASCE n | NOCACHE](선택) 기본값 (20)
  -CASCE : 생성할 번호 미리 지정
   NOCACHE: 미리 지정 X
*/

 --시퀀스에 CYCLE 추가, 증가값을 2, 최댓값 99
ALTER SEQUENCE SEQ_DEPTNO
INCREMENT BY 2
MAXVALUE 99
CYCLE;

SELECT * FROM USER_SEQUENCES;
INSERT INTO DEPT_SEQUENCE(DEPTNO)
VALUES (SEQ_DEPTNO.NEXTVAL);

SELECT * FROM DEPT_SEQUENCE;

--시퀀스 삭제
--DROP SEQUENCE

--DEPTNO => 시퀀스 통해 생성 (스퀀스를 삭제해도 DEPTNO 데이터는 사라지지 않음)

DROP SEQUENCE SEQ_DEPTNO;
SELECT * FROM USER_SEQUENCES;
SELECT * FROM DEPT_SEQUENCE;

/* 동의어 (synonym)
 : 테이블,뷰,시퀀스의 객체 이름 대신 사용할 수 있는 다름 이름 부여
 : ex) 테이블의 이름이 길 경우 동의어를 만듬

  동의어 생성법
  CREATE [PUBLIC(다른 계정에서도 사용가능)] SYNONYM 동의어 이름
  FOR [사용자.][객체이름];

   PUBLIC - DB 내의  모든 사용자가 사용할 수 있도록 생성
   (생략할 경우, 동의어를 생성한 사용자만 사용이 가능 )(선택)
   동의어 이름 - 생성할 동의어 이름 (필수)
   사용자. - 생성할 동의어를 소유 사용자 지정
   (생략할 경우 , 현재 접속한 사용자 지정 ) (선택 )
   객체 이름 - 동의어를 생성할 객체 이름 (테이블,뷰,시퀀스) (필수)


   동의어가 VS 테이븡 별칭 (FROM 테이블 이름 별칭 )
   :동의어는 DB에 저장되는 객체 (일회성 X)
   :테이븧 객체는 일회성

   --SCOOTT 계정에 동의어를 생상할수 있는 권한 부여 (SQLPLUS)
   --1)동의어 권한 부여
   2) public 권한 부여

   --cmd | terminal 창에서
--docker exec -it oracle sqlplus 입력(DOCKER 통해서 SQLPLUS 접속)
--system/oracle 입력(최고 권한 계정 들어감)
--grant create synonym to scott; 입력(scott 계정 동의어 자격 활성화)
--grant create public synonym to scott; 입력(scott 계정 public 동의어 자격 활성화)

*/
--동의어 생성 (EMP -> E)
CREATE SYNONYM E
FOR EMP;

SELECT * FROM E;

--동의어 생성 (DEPT -> D)
CREATE SYNONYM D
FOR DEPT;

SELECT * FROM D;

--Q1 .부서가 RESEARCH 에서 일하는 사원출력
SELECT E.*
FROM E join D on (E.DEPTNO = D.DEPTNO)
WHERE DNAME like 'RESEARCH';
--join 없이 출력 가능
SELECT *
FROM E
WHERE E.DEPTNO in (SELECT DEPTNO
                    FROM D
                    WHERE DNAME like 'RESEARCH');


--Q2 . 부서가 SALES 에서 일하는 사원 평균 연봉 출력
SELECT ROUND(AVG(SAL*12+NVL(E.COMM,0)),2) AS PEEE
FROM E join D on (E.DEPTNO = D.DEPTNO)
where D.DNAME like 'SALES';

--join 없이 출력

WITH  DEPT_D AS (SELECT DEPTNO FROM D WHERE D.DNAME like 'SALES')
SELECT AVG(SAL*12 +NVL(COMM,0))
FROM E
WHERE E.DEPTNO in DEPT_D.DEPTNO;











