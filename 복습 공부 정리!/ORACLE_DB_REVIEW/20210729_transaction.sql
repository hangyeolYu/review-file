/*
   :[트랜색션][transaction]
   : 더 이상 분할 할수 없는 최소 수행 단위
   : 한개 이상의 데이터 조작어 (DML) 구성


   : 트랜잭션을 왜 쓸까요?
   ex) 농협 계좌 내역 DB
   1) A 계좌 (현재 잔액 200)
   UPDATE 200 -> 0
   2) B 계좌 (현재 잔액 0)
   UPDATE 0 -> 200

   -> 1) , 2), 은 같이 수행 되어야함!(트랜젝션으로 묶어야함!)
   -> ALL OR NOTHING
   -> 트랜잭션 제어 명령어 : TCL
   (Transaction Control Language)
   -> 트랜잭션 상태
   1) 모든 명령어가 정상적으로 수행
   2) 취소 된 상태

*/
--DEPT 테이블 복사 DEPT_TCL 테이블 만듬
CREATE TABLE DEPT_TCL
AS SELECT * FROM DEPT;
DROP TABLE DEPT_TCL;

SELECT * FROM DEPT_TCL;

INSERT INTO DEPT_TCL VALUES (50,'DEVELOPER','SEOUL');

--40번 부서 DNAME 을 FACTORY

UPDATE DEPT_TCL
SET DNAME = 'FACTORY'
WHERE DEPTNO = 40;

--부서 DNAME RESEARCH인 부서 삭제
DELETE FROM DEPT_TCL
WHERE DNAME = 'RESEARCH';

--트랜젝션 취소 (ROLLBACK)
SAVEPOINT point1;
-- 부서 DNAME RESEARCH인 부서 삭제
DELETE FROM DEPT_TCL WHERE DNAME = 'RESEARCH';
SELECT * FROM DEPT_TCL;

-- 트랜젝션 취소 (ROLLBACK)
ROLLBACK TO SAVEPOINT point1;
-- 세미콜론 없이 작성
SELECT * FROM DEPT_TCL;
SELECT * FROM DEPT;

--하나의 트랙젝션 단위 :
--TCL 을 실행할때 기존 트랜젝션 끝남

--2) 트랜잭션을 영원히 반영하는 COMMIT
-- : COMMIT 하시만 ROLLBACK 불가!

SELECT * FROM DEPT_TCL;
COMMIT; --구분선 (TCL)
ROLLBACK;
SELECT * FROM DEPT_TCL;

INSERT INTO DEPT_TCL VALUES (60,'NETWORK','BUSAN');
COMMIT;--TCL(구분선)
UPDATE DEPT_TCL SET LOC = 'SEOUL' WHERE DEPTNO = 30;
DELETE FROM DEPT_TCL WHERE DEPTNO = 60;
COMMIT; --구분선(TCL)

ROLLBACK ;
SELECT * FROM DEPT_TCL;

-- 만약 COMMIT 이 되면 더이상 ROLLBACK 할 수가 없음!

--Q1. 은행 계좌 문제(2개)
--TABLE  ACCOUNT_A
-- 소유자 이름(NAME,VARCHAR(10))
--계좌번호(ACCOUNT,VARCHAR(20))
--잔액(BALANCE,VARCHAR(20))

--TABLE ACCOUNT_B
-- 소유자 이름(NAME)
--계좌번호(ACCOUNT)
--잔액(BALANCE)

--CREATE TABLE 테이블 이름 {
-- 열 이름 자료형 ,
-- 열 이름 자료형 ,
--
-- }

--ACCOUNT_A (200), ACCOUNT_B(0) 각각 데이터를 입력
-- A -> B 계좌 200 만원 이체 어느 포인트에서 커밑 해야하는지

CREATE TABLE ACCOUNT_A
(
    NAME    VARCHAR(10),
    ACCOUNT VARCHAR(20),
    BALANCE NUMBER(30)
);

CREATE TABLE ACCOUNT_B
(
    NAME    VARCHAR(10),
    ACCOUNT VARCHAR(20),
    BALANCE NUMBER(30)
);
DROP TABLE ACCOUNT_A;
DROP TABLE ACCOUNT_B;


INSERT INTO ACCOUNT_A
VALUES ('홍길동',94290200246438,2000000); --테이블 A 에 데이터 삽입
COMMIT
INSERT INTO ACCOUNT_B
VALUES ('홍길순',942902023238,0); ----테이블 B 에 데이터 삽입
COMMIT   --데이터 확정
 SAVEPOINT S1; -- 세이브 포인트 지정

SELECT * FROM ACCOUNT_A;
SELECT * FROM ACCOUNT_B;
--1. A가 이체하려고 하는 금액을 잘못 입력했을떄(100만원)
UPDATE ACCOUNT_A  SET  BALANCE = 1000000;--이거랑
UPDATE ACCOUNT_B SET BALANCE = 1000000; --이걸  되돌리고 싶을떄
ROLLBACK TO S1; --세이브 포인트로 복귀 근데 이식에서는 그냥 ROLLBACK 해도됨 어차피 첫번쨰로 실수한식이라 커밋해도 처음으로 돌아감

--2. A -> B 정상적으로 이체되었을떄

UPDATE ACCOUNT_A  SET  BALANCE = 0; --이거랑
UPDATE ACCOUNT_B SET BALANCE = 2000000; --이건 첫 입력상태로 돌아간 상태에서 200으로 업뎃이 된 상태
COMMIT --데이터 확정  : 세이브 포인트 S1은 날라감! (1)(열로옴 ㅋ 이미 데이터 확장이 됨)
ROLLBACK  --여기서 롤백해도 위에 롤백으로 날아감 (1)

/*
1)2) 는 같이 수행!(트랜젝션으로 묶어야함!)
-> ALL or Nothing
-> 트랜젝션 제어 명령어 :TCL
(Transaction Control Language)
-> 트랜젝션 상태
1) 정상수행 하거나
2) 취소되거나

트랙제션의 특징 (ACID)
1) 원자성 (Atomicity)
: 트랜젝션을 이루는 DML 코드를 하나의 원자로 보겠다!
: ALL or Nothing

2)일관성 (Consistency)
: 트랜잭션 실행되기 전 오류가 없는 DB =>
    트랜잭션 실행 후 오류가 없는 DB

3)격리성 (Isolation)
: 트랜젝션 실행 도중에 다른 트랜젝션 영향을 받아 결과가 잘못되면 안된다!

4) 지속성 (Durability)
: 트랙제션이 성공적으로 수행되면 해당 트랜젝션이
갱신한 DB 내용은 영구적으로 저장

*/

--[세션 (session)]
--: 데이터 베이스가 연결이 되고 연결이 끝나기 전까지 전체 기간
--ex) 웹 로그인 ~ 로그아웃 까지의 기간

--: 세션은 여러개의 트랜젝션을 포함

CREATE TABLE SESSION_TEST as SELECT * FROM DEPT;

SELECT * FROM SESSION_TEST;

INSERT INTO SESSION_TEST
VALUES (50,'DEVELOPER','SEOUL');
COMMIT

UPDATE SESSION_TEST SET LOC = 'BUSAN' WHERE DEPTNO =50;
--여기서 커밋 안하면 다른 세션에서는 SESSION_TEST 의 50번형이 잠김 !



--데이터 베이스는 여러 곳 동시 접근 (세션 여러개 )
--COMMIT, ROLLBACk(트랜잭션 완료) 이 되지 않으면 다른 세션에서
-- 데이터 변경 사항을 알 수 없음 !
-- 다른 세션에서는 변경과 무관한 원래 데이터를 보여줌
-- (읽기 일관성,read consistency) => 세션

--특정 세션에서 조작중인 데이터는 잠기게 됨 (LOCk)
--: 트랜젝션이 완료되기 전까지 다른 세션에서 조작할수 없는 상태
--: 데이터를 다른 세션이 조작할 수 없도록 보류하는것

--[LOCK 종류]
--:1).ROW LEVEL LOCK (행 레벨 락)
--:WHERE을 통해 특정 행만 영향을 주면 특정 행 데이터만 LOCK
--:2).TABLE LEVEL LOCK (테이블 레벨 락)
--: WHERE 절이없는 조작어인 경우 전체 테이블에 대해 LOCK




--HANG(행) : A세션에서 조작 완료까지 기다리는 상태 (현상 )
--세션 A,B
--A: UPDATE ~~~~~
--B: UPDATE ~~~~~(B는 HANG)
--A: COMMIT
--B: UPDATE 실행 (DATA에 LOCK 풀림)



