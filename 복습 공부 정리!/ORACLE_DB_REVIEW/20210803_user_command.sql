/*    1) 사용자 관리
 - 사용자 (user)
   : DB에 접속해서 데이터를 관리하는 계정

   -사용자 관리
   :업무 역할이나 보안을 고려해서 사용자를 나눔
    2) 스키마 (schema)
    : 데이터 간에 구조, 제약조건,관계를 정의한 범위

    -사용자는 데이터 사용/관리를 위해 DB 접속
    -스키마는 DB에 접속한 사용자와 연결된 객체

   EX) 사용자
   : SCOTT
     스키마
   :SCOTT 만든뷰 , 테이블, 제약조건,인덱스,스퀀스,동의어 등
   : SCOTT이 생성한 객체
*/

    --사용자 생성
   /*
    형식 )
    CREATE USER 사용자 이름 (필수)
    IDENTIFIED BY 패스워드 (필수)
    DEFAULT TABLESPACE 테이블 스페이스 이름 (선택)
    TEMPORARY TABLESPACE (임시)테이블 스페이스 (그룹) 이름 (선택)
    QUOTA 테이블 스페이스 크기 ON 테이블 스페이스 이름 (선택)
    PASSWORD EXPIRE (만료되다) (*SQLPLUS 접속마다 새로운 비밀번호 설정 요청)
    ACCOUNT [LOCK/UNLOCK] (선택, 기본값 UNLOCK);



    테이블 스페이스
    : 오라클 서버가 데이터를 저장하는 구조
    : 각 개체(user) 마다 테이블 스페이스를 지정할 수 있음

    oracle - ...oradata/[SID]/
    oracle xe - ...oracle/xe/oradata/XE/

    만약에 지정하지 않으면 시스템 테이블스페이스 - 시스템이 단편화됨
    각 사용자가 소유한 데이터와 객체를
    저장할 저장 공간을 별도로 만들어주는 것이 좋음

    SQLPLUS =>
    SYSTEM/oracle
    create user ~~
    identified by ~~;


   */

  CREATE USER HANGYOUL
IDENTIFIED BY 1234; --user 생성

SELECT * FROM ALL_USERS;

--만들어진 계정에 SESSION 만들 수 있는 권한 넘겨주기
--SQLPLUS 접속
--docker exec -it oracle sqlplus 입력(DOCKER 통해서 SQLPLUS 접속) //왜우자 쫌 ㅋ
--system/oracle 입력(계정 들어감)
--grant create session to ____(유저이름);
--exit

 --현재 내 한결 계정에서 바꾸려고 하면 안됨 DBA 권한을 가진 계정으로 들어가서 해야함
 ALTER USER HANGYOUL
 IDENTIFIED BY '12345678';

--걍 터미널 들어가서 sqlplus system 들어가서 내 계정 비번 정해주장

--DBA 권한을 다른 계정에 부여 --system 들어가서 해야함
--grant DBA to ___(유저이름);

--사용자 삭제
DROP USER HANGYOUL;

--사용자로 접속해서 만들어논 객체 (테이블,뷰,시퀀스,인덱스...)
--를 같이 삭제하고 싶을떄는
DROP USER HANGYOUL CASCADE ;

--2) 권한 관리
--:사용자에 따라서 데이터 사용하거나 관리할 수 있는 보안 장치 -> 권한
--:접속 사용자에 따라 접근할 수 있는 데이터 영역과 권한을 지정
--:A.시스템 권한 (system privilege)
--:B.객체 권환 (object privilege)

--A. 시스템 권한 (system privilege)
--: 사용자 생성,정보 수정/삭제, 데이터 베이스 접근
--: 시스템 권한 분류
--: USER : CREATE/ALTER/DROP USER
--: SESSION: CREATE/ALTER SESSION
--: TABLE : CREATE TABLE * 이건 자신의 테이블 생성하는 권한
--          CREATE/ALTER/DROP/INSERT/UPDATE/DELETE/SELECT
--          ANY TABLE
--          *자신이 아니고 임의의 소유 테이블 생성/수정/삭제/삽입/수정/삭제/조회 권한
--: INDEX :
--: VIEW
-- : SEQUENCE
-- : SYNONYM

--* 시스템 권한
--grant [시스템 권한] to [사용자 이름]
--[WITH ADMIN OPTION];
--SYSTEM: GRANT CREATE SESSION TO HANGYOUL WITH ADMIN OPTION;
--hangyoul :can  grant create session to otheruser.
--SYSTEM >> hangyoul >> otherusers
--중간에 hangyoul 계정이 사라져도 other user 권한은 살아있음!

CREATE USER HANGYOUL
IDENTIFIED BY 1234;

GRANT RESOURCE , CREATE SESSION, CREATE TABLE TO HANGYOUL;
--RESOURCE : 권한을 하나로 묶어주는 권한
--GRANT RESOURCE 가 없으면 "테이블 스페이스 USER 권한이 없습니다!"

--시스템 권한 취소
REVOKE RESOURCE,CREATE SESSION,CREATE TABLE FROM HANGYOUL;

--사용자에게 부여된 모든 시스템의 롤 권한
SELECT * FROM DBA_ROLE_PRIVS WHERE GRANTEE = 'HANGYOUL';

--타 사용자에게 부여된 모든 객체의 권한
SELECT * FROM DBA_TAB_PRIVS WHERE GRANTEE = 'SYSTEM';

--사용자에게 부여된 모든 시스템의 권한
SELECT *FROM DBA_SYS_PRIVS WHERE GRANTEE = 'HANGYOUL';

/*   객체 권한 (object privilege)
     :특정 사용자가 생성한 객체 (테이블/뷰/시퀀스...)과 관련된 권한
     ex) scott 계정에서 만든 테이블을
     hangyoul 에게 select 이 가능하도록 만듬

     TABLE: ALTER/DELETE/INDEX(테이블 인덱스 생성 권한 )/INSERT/SElECT/UPDATE/REFERENCES --외래키 참조 권한
     VIEW: DELETE/INSERT/SELECT/UPDATE/REFERENCES--외래키 참조 권한
     SEQUENCE:ALTER/SELECT (CURRVAL(마지막으로 생성한 데이터),NEXTVAL 사용권한 )

     객체 권한 부여
     GRANT [객체 권한/ALL PRIVILEGES]
     on[객체 이름]
     TO[사용자 이름]
     [WITH GRANT OPTION(선택)];이 권한을 줄수 있는 능력 줄지말지 결졍


 */
 */


*/
CREATE TABLE PRIV_TEST(
    COL1 VARCHAR(20),
    COL2 VARCHAR(20)
);
DROP USER HANGYOUL;
CREATE USER HANGYOUL
IDENTIFIED BY 1234;


--롤 권한 (RESOUPCE) 곧 배움 ㅋ
GRANT RESOURCE,CREATE SESSION,CREATE TABLE TO HANGYOUL;

--시스템 권한(CREATE SESSION,CREATE TABLE )을 먼저 줘야 객체 권한이 사용가능함!

--객체 권한 (SELECT)
GRANT SELECT ON PRIV_TEST TO HANGYOUL;
GRANT INSERT ON PRIV_TEST TO HANGYOUL;
GRANT UPDATE ON PRIV_TEST TO HANGYOUL;
--한번에 주기~!
GRANT SELECT,INSERT,UPDATE ON PRIV_TEST TO HANGYOUL;
--스콧 -> 내 계정

--내가 만든 계정에서
--Q1. 데이터를 2개정도 INSERT
--Q2. 데이터를 UPDATE

INSERT INTO SCOTT.PRIV_TEST
 VALUES ('데이터','입력은');

INSERT INTO SCOTT.PRIV_TEST
VALUES ('꽤나','어렵네여');

SELECT * FROM SCOTT.PRIV_TEST;

UPDATE SCOTT.PRIV_TEST
SET COL1 = 'oracle DB'
WHERE COL1 = '꽤나';

SELECT * FROM SCOTT.PRIV_TEST;

--객체 권한 취소
REVOKE SELECT,INSERT,UPDATE on PRIV_TEST FROM HANGYOUL;
--SQLPLUS
--SELECT * FROM SCOTT.RPIV_TEST
--"TABLE OR VIEW DOES NOT EXIST"

/*       3) 롤 (role,역할) 관리
 :새로운 사용자의 권한 관리 일일이 부여해 줘야함 (부울편)
 :롤 (role): 여러 개의 권한을 묶어놓은 그룹
 : 롤 역할에 따라 한버에 부여하고 해제할 수 있음 >> 관리하기 편함

  : 오라클 DB에서는
  A.오라클이 정의한 룰
  -CONNECT (기본 부여): CREATE SESSION /TABLE/SEQUENCE..(오라클 10에서 사라짐!)
  -RESOURCE (기본 부여 ): 사용자 테이블 + 다른객체 (인덱스,시퀀스 ...)까지 생성할수 있는 시스템 권한
  CREATE TABLE/SEQUENCE..

  * 뷰,동의어 생성하고 싶으면 따로 권한을 줘야함
  CREATE VIEW/SYNONYM

   -DBA
   DB를 관리하는 시스템 권한을 대부분 가지고 있음

   B. 사용자가 정의한 롤
   :사용자가 필요에 의해 필요한 권한을 묶어 놓을 수도 있음
   1.CREATE ROLE 문으로 롤 생성
   2. GRANT 명령어를 통해 롤에 권한을 포함시킴
   3.GRANT 먕량어로 해당 롤을 특정 사용자에게 부여
   4.REVOKE 명렁어로 롤  취소

*/
--사용자 롤 생성
CREATE ROLE HANGYOULROLE;

--생성할 권한을 부여
GRANT CONNECT,RESOURCE,CREATE VIEW,CREATE SYNONYM TO HANGYOULROLE;
--롤을 사용자 HANGYOUL 에게 부여
GRANT HANGYOULROLE TO HANGYOUL;

--롤을 사용자에게 주면서 동시에 다른사람에게도 줄수 있음!
GRANT HANGYOULROLE TO HANGYOUL WITH ADMIN OPTION ;

SELECT * FROM DBA_ROLE_PRIVS WHERE GRANTEE = 'HANGYOUL'; --role 로 묶은 권한
SELECT * FROM DBA_SYS_PRIVS WHERE GRANTEE = 'HANGYOUL';--시스템 권한
SELECT * FROM DBA_TAB_PRIVS WHERE GRANTEE = 'HANGYOUL'; --객체 권한

--부여한 롤 취소
REVOKE HANGYOULROLE FROM HANGYOUL;

--롤 삭제
DROP ROLE HANGYOULROLE;

--권한 모두 부여
GRANT ALL PRIVILEGES TO HANGYOUL;