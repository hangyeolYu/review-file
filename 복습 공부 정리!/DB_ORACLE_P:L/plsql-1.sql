-- PL/SQL: SQL�����δ� ������ ����� �۾��� �����ϱ� ���ؼ� ����Ŭ���� ������ ���
-- EX) ���ǹ�, �ݺ���, �������� ...
-- : DB �۾��� �����ϴ� ��ɾ� + ���� ��ɾ�
-- : ��� ������ �ۼ�
-- �� ��� (block): PL/SQL ���α׷��� �⺻ ����

/*
����)

DECLARE (���� ����)
[�����];
BEGIN
[��ɾ�];
EXCEPTION (���� ����)
[���� ó��];
END;

*/

-- ȭ�鿡 ���ڿ� ��� (SERVEROUTPUT ON���� ����)
-- : DB ������ ����ų� �������� �� �ٽ� ��������� ��
SET SERVEROUTPUT ON; 
BEGIN
    DBMS_OUTPUT.PUT_LINE('HI ORACLE PL/SQL!');
END;
/
-- /: �ۼ��� ������! 
-- ����: CTRL + ENTER, F9

-- ������ ���
-- 1) ���� (variable)
-- : ������ �����ϴ� ���� (���� �̸� + �ڷ���)
-- : DECLARE (�����)�� �ۼ�
-- ����) ���� �̸� �ڷ��� := ��

DECLARE -- �����
    SCOTT_NUM NUMBER(4) := 1234; -- ���� �������ڸ��� ������ �ʱ�ȭ
    SCOTT_BIRTHDAY DATE; -- ������ ����
BEGIN -- �����
    SCOTT_BIRTHDAY := SYSDATE; -- ����ο��� ������ ����
    DBMS_OUTPUT.PUT_LINE('ID: ' || SCOTT_NUM);
    DBMS_OUTPUT.PUT_LINE('BIRTHDAY: ' || SCOTT_BIRTHDAY);
END;
/

-- Q1. �� ���� �����ϴ� ������ ����� �ش� �� ���ϴ� ��¹� �ۼ�
DECLARE
    NUM_1 NUMBER(5) := 10;
    NUM_2 NUMBER(5) := 20;
BEGIN
    DBMS_OUTPUT.PUT_LINE(NUM_1 + NUM_2);
END;
/
-- Q2. ������ �����ϴ� ����, ��ȭ�� �����ϴ� ������ ����� �� ������ ��¹� �ۼ�
DECLARE
    MY_MUSIC VARCHAR(20) := '��ȣ��';
    MY_MOVIE VARCHAR(50) := '���� ������ ���ϴ�';
BEGIN
    DBMS_OUTPUT.PUT_LINE(MY_MUSIC);
    DBMS_OUTPUT.PUT_LINE(MY_MOVIE);
END;
/

-- 2) ��� (Constant)
-- : ������ �ʴ� �� (���α׷��� ����� ������ ������ ����)
-- ����) ���� �̸� CONSTANT �ڷ��� := ��;

DECLARE
    PI CONSTANT NUMBER(5, 2) := 3.14;
    RADIUS NUMBER(5) := 5;
BEGIN
    -- ���� ���̸� ���ؼ� ���
    DBMS_OUTPUT.PUT_LINE('AREA: ' || PI * RADIUS * RADIUS);
    -- ���� �ѷ��� ���ؼ� ���
    DBMS_OUTPUT.PUT_LINE('PERI: ' || PI * RADIUS * 2);
END;
/

-- 3) ������ �⺻�� ����
-- : DEFAULT Ű���� ���
-- ����) ���� �̸� �ڷ��� DEFAULT ����Ʈ ��;

DECLARE
    SCOTT_ID NUMBER(2) DEFAULT 1;
BEGIN
    DBMS_OUTPUT.PUT_LINE(SCOTT_ID);
END;
/

/*
�⺻�� ���� ���� ? 
���࿡ �ƹ��� ���� ���� ���� ��� (NULL ��) ��� ������ ���� �� ���� => ����
*/

-- 4) ������ NOT NULL ����
-- : Ư�� ������ NULL���� ���� ���� ����
-- : NOT NULL Ű���带 ����ϴ� ������ �ݵ�� ���� ����� ���ÿ� ������ �ʱ�ȭ! (DECLARE �κп���)
-- ����) ���� �̸� �ڷ��� NOT NULL := ��;

DECLARE
    SCOTT_NAME VARCHAR(20) NOT NULL := ''; -- ����
    /*
    '' (�� ���ڿ�), NULL, ������ �Է���ü�� ���ϴ� �� => NULL
    */
BEGIN
    DBMS_OUTPUT.PUT_LINE(SCOTT_NAME);
END;
/

DECLARE
    SCOTT_NAME VARCHAR(20) NOT NULL DEFAULT ' '; -- �ƹ��� ���� ���� ���� ��� ' ' ���ڷ� �ʱ�ȭ
    /*
    '' (�� ���ڿ�), NULL, ������ �Է���ü�� ���ϴ� �� => NULL
    */
BEGIN
    DBMS_OUTPUT.PUT_LINE(SCOTT_NAME);
END;
/

/* �����̸� ����
1) ���� ��� ������ �����̸��� �ߺ��� ���� ����
2) ��ҹ��� ���� X (ABC = abc)
*/

-- ������ �ڷ��� (������Ÿ��, datatype)
-- 1) ��Į���� (scalar type): ����Ŭ���� �⺻���� ������ �ڷ���
-- : ���ο� ���� �� �ִ� ���� �ϳ�
-- EX) ���� (NUMBER), ���ڿ� (CHAR (���� ����), VARCHAR, VARCHAR2 (���� ����)), ��¥ (DATE)
--     ���� (BOOLEAN) (PL/SQL���� ����, true, false, NULL)

-- 2) ������ (reference type)
-- : � ���̺��� ��/�� �����ϴ� �ڷ���
-- a. �� ���� (���� �̸� ���̺��̸�.���̸�%TYPE): ������ ���̺� ���� ������ �ڷ���(ũ��) (�ϳ��� ��)
-- b. �� ����: (���� �̸� ���̺�%ROWTYPE): ������ ���̺��� �ϳ��� �� ���� �ڷ��� (�ϳ��� ��)

-- a. �� ����
DECLARE
    DEPTNO2 DEPT.DEPTNO%TYPE := 50;
    EMPNO2 EMP.EMPNO%TYPE := 7000;
    SAL2 EMP.SAL%TYPE := 5000;
    COMM2 EMP.COMM%TYPE := NULL;
    HIREDATE2 EMP.HIREDATE%TYPE := TO_DATE('2001/1/1', 'YYYY/MM/DD');
BEGIN
    DBMS_OUTPUT.PUT_LINE('DEPTNO2: ' || DEPTNO2);
    DBMS_OUTPUT.PUT_LINE('EMPNO2: ' || EMPNO2);
    DBMS_OUTPUT.PUT_LINE('SAL2: ' || SAL2);
    DBMS_OUTPUT.PUT_LINE('COMM2: ' || COMM2);
    DBMS_OUTPUT.PUT_LINE('HIREDATE2: ' || HIREDATE2);
END;
/
-- EMP ���̺��� EMPNO�� �����ϴ� EMPNO2 (������ ����)
-- EMP ���̺��� SAL, COMM�� �����ϴ� SAL2, COMM2 (������ ����)
-- EMP ���̺��� HIREDATE�� �����ϴ� HIREDATE2 (������ ����)

-- b. �� ���� (��ü ���̺� ������ �� ������ ��)
DECLARE
    DEPT2 DEPT%ROWTYPE;
BEGIN
    SELECT * INTO DEPT2
    FROM DEPT
    WHERE DEPTNO = 20;
    
    DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || DEPT2.DEPTNO);
    DBMS_OUTPUT.PUT_LINE('DNAME : ' || DEPT2.DNAME);
    DBMS_OUTPUT.PUT_LINE('LOC : ' || DEPT2.LOC);
END;
/
-- Q1. EMP ���̺��� �����ϴ� EMP2 (��� �ٹ� �μ� 'ACCOUNTING')

-- ���� �߻�!
-- SELECT ~~ �� ������� 3��
DECLARE
    EMP2 EMP%ROWTYPE; -- EMP ���̺��� �� ����
    -- ������ �������� ������� �ϳ��� �� (ROWTYPE)�̰ų� �ϳ��� �� (TYPE)�� ���� �� ����
BEGIN
    SELECT E.* INTO EMP2 -- EMP2�� ������ �ִ� ���� ����/�ڷ����� SELECT���� ��� ���� ����/�ڷ��� ���ƾ� ��!
    FROM EMP E JOIN DEPT D ON (E.DEPTNO = D.DEPTNO)
--    WHERE E.DEPTNO = (SELECT DEPTNO FROM DEPT WHERE DNAME = 'ACCOUNTING')
    WHERE D.DNAME = 'ACCOUNTING'
    AND E.SAL >= 5000;
    
    DBMS_OUTPUT.PUT_LINE('EMP2_ENAME: ' || EMP2.ENAME);
    DBMS_OUTPUT.PUT_LINE('EMP2_EMPNO: ' || EMP2.EMPNO);
END;
/

-- 3) ������ (composite type), LOB (large object) ��
-- : ���� ���� �� ������ �����͸� �����ϱ� ���� ����ڰ� ������ �ڷ���
-- EX) �÷��� (collection), ���ڵ� (record) (���� �н�)

-- a. �÷��� (collection): �ڷ��� TABLE (�� ���� �ڷ����� �����͸� ���� �� ����, = ���̺��� �� ����)
-- b. ���ڵ� (record): ���̺��� �� (���ڵ�) (�ڷ����� ���� �� �ϼ��� ����, = ���̺��� �� ����)

-- ���ǹ�/�ݺ���
-- : ���ǹ�: IF��, CASE��
-- 1) IF�� 
-- IF-THEN: ������ ���̸� ����
-- IF-THEN-ELSE: ���� ��/���������� ���� ���๮ �޶���
-- IF-THEN-ELSIF: ������ ���� �� ������ �� ����
-- �ڹ�: ELSE IF
-- PL/SQL: ELSIF
-- ���̽�: ELIF

-- IF-THEN
-- IF ���ǹ� THEN
-- ������ ��ɾ�;
-- END IF;

-- Ȧ�� �Ǻ� ���α׷�
DECLARE
    TEST_NUM NUMBER(2) := 25;
BEGIN
    IF MOD(TEST_NUM, 2) = 1 THEN
        DBMS_OUTPUT.PUT_LINE('ODD NUMBER');
    END IF;
END;
/

SELECT * FROM EMP;
-- EMP ���̺� �� ���� EMP3 (EMPNO 7902�� �� ����)
-- EMP3.ENAME �ȿ� E�� ���� 'E�� �ֽ��ϴ�!' ���ڿ� ���

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
-- �̸��� 'E'�� ������ 'E IS IN NAME'
-- �̸��� 'A'�� ������ 'A IS IN NAME'
-- �̸��� 'M'�� ������ 'M IS IN NAME'
-- �ƹ��͵� ������ 'NOTHING'

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

-- EMPNO�� 7902�� ����� �����ϴ� EMP4�� ������ ���� ����
-- SAL >= 5000�̻� �� ���, ���� 15%
-- SAL >= 4000�̻� �� ���, ���� 10%
-- SAL >= 3000�̻� �� ���, ���� 8%
-- ������ SAL�� ���ؼ��� ���� 5% �ű�ٰ� ����
-- �����ؾ��ϴ� ������ ��� ���

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

-- CASE ���ǹ�
-- : IF���� ���� �� �ܼ�ȭ��Ų ����
-- 1) �ܼ� CASE��: �� ���� �� ��� (= �� ����)
-- CASE �� ����
--  WHEN ��1 THEN
--      ��ɾ�;
--  WHEN ��2 THEN
--      ��ɾ�;
--  WHEN ��3 THEN
--      ��ɾ�;
--  ...
--  ELSE
--      ��ɾ�;
-- END CASE;

-- Q1. EMPNO�� 7654�� ����� ������ ���� EMP5�� 
-- �Ի�⵵�� 1980, 1981, 1982���� Ȯ���ϴ� ���ǽ� �ۼ�


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



-- 2) �˻� CASE��: ���ǽ� (IF���� ���� ����)
-- CASE 
--  WHEN ���ǽ�1 THEN
--      ��ɾ�;
--  WHEN ���ǽ�2 THEN
--      ��ɾ�;
--  WHEN ���ǽ�3 THEN
--      ��ɾ�;
--  ...
--  ELSE
--      ��ɾ�;
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

-- SQL: DECODE(), CASE -- ���� �˻�
-- PL/SQL: CASE ~ WHEN, IF -- ���� �˻� + ���� �˻� ����� ���� ������ �۾�

-- �ݺ���
-- A. �⺻ LOOP: ���� �ݺ��� + (EXIT, EXIT-WHEN)
-- B. WHILE LOOP: ���ǽ��� ����� ���� �ݺ�
-- C. FOR LOOP: �ݺ� Ƚ���� �����ؼ� �ݺ�
-- D. Cursor FOR LOOP (���� ���� ����)

-- �ݺ��� ���� �ߴܽ�Ű�ų� Ư�� �ݺ� �ֱ� �ǳʶ�
-- EXIT: �ݺ� ����
-- EXIT-WHEN: �ݺ� ���� ���ǽ� �����ϰ� ���ǽ��� ���̸� �ݺ� ����
-- CONTINUE: �ݺ� �ֱ� �ǳʶ�
-- CONTINUE-WHEN: ���ǽ��� ���̸� �ݺ� �ֱ⸦ �ǳʶ�


-- A. �⺻ �ݺ���
-- �ݺ��� 5�� ���� ���� �ۼ� (0, 1, 2, 3, 4)
DECLARE
    LOOP_NUM NUMBER(5) := 0;
BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE('CURRENT NUM : ' || LOOP_NUM);
        LOOP_NUM := LOOP_NUM + 1;
        EXIT WHEN LOOP_NUM = 5;
    END LOOP;
END;
/

DECLARE
    LOOP_NUM NUMBER(5) := 0;
BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE('CURRENT NUM : ' || LOOP_NUM);
        LOOP_NUM := LOOP_NUM + 1;
        EXIT WHEN LOOP_NUM > 4;
    END LOOP;
END;
/

DECLARE
    LOOP_NUM NUMBER(5) := 0;
BEGIN
    LOOP 
        IF (LOOP_NUM > 4) THEN
            EXIT; -- �ٷ� ���� (+ ���ǽ�)
        END IF;
        DBMS_OUTPUT.PUT_LINE('CURRENT NUM : ' || LOOP_NUM);
        LOOP_NUM := LOOP_NUM + 1;
    END LOOP;
END;
/

DECLARE
    LOOP_NUM NUMBER(5) := 0;
BEGIN
    LOOP 
        DBMS_OUTPUT.PUT_LINE('CURRENT NUM : ' || LOOP_NUM);
        LOOP_NUM := LOOP_NUM + 1;
        IF (LOOP_NUM > 4) THEN
            EXIT; -- �ٷ� ���� (+ ���ǽ�)
        END IF;
    END LOOP;
END;
/

DECLARE
    LOOP_NUM NUMBER(5) := 0;
BEGIN
    LOOP 
        DBMS_OUTPUT.PUT_LINE('CURRENT NUM : ' || LOOP_NUM);
        IF (LOOP_NUM > 4) THEN
            EXIT; -- �ٷ� ���� (+ ���ǽ�)
        END IF;
        
        LOOP_NUM := LOOP_NUM + 1;
    END LOOP;
END;
/

-- B. WHILE LOOP
-- : ������ ���� ���� �ݺ�
/*
����)
WHILE ���ǽ� LOOP
    �ݺ� ����
END LOOP;
*/

DECLARE
    LOOP_NUM NUMBER(5) := 0;
BEGIN
    WHILE LOOP_NUM < 5 LOOP
        DBMS_OUTPUT.PUT_LINE('CURRENT NUM : ' || LOOP_NUM);
        LOOP_NUM := LOOP_NUM + 1;
    END LOOP;
END;
/

-- C. FOR LOOP
-- : �ݺ��� Ƚ�� ����

/*
����)
FOR i IN ���۰� .. ���ᰪ LOOP
    �ݺ� ����
END LOOP;

-- ���۰����� 1�� ���� (**)�Ͽ� ���ᰪ�� �̸��� ����
-- �ݴ�� ���� ������ REVERSE

* i: ī���� (counter), �ݺ��� �������� ��� (DECLARE ����ο� �������� �ʰ� FOR LOOP ������ ����)

*/

DECLARE
--    LOOP_NUM NUMBER(5) := 0;
BEGIN
    FOR i IN 0..4 LOOP
        DBMS_OUTPUT.PUT_LINE('CURRENT NUM : ' || i);
--        LOOP_NUM := LOOP_NUM + 1;
    END LOOP;
END;
/

DECLARE
--    LOOP_NUM NUMBER(5) := 0;
BEGIN
    FOR i IN REVERSE 0..4 LOOP
        DBMS_OUTPUT.PUT_LINE('CURRENT NUM : ' || i);
--        LOOP_NUM := LOOP_NUM + 1;
    END LOOP;
END;
/

-- �����Ű�ų� �ǳʶ� �� �ִ� ����
-- A. EXIT
-- B. EXIT-WHEN
-- C. CONTINUE
-- D. CONTINUE-WHEN

-- CONTINUE, CONTINUE-WHEN
-- CONTINUE: ���� �ݺ��ϰ� �ִ� �ֱ⸦ �����ϰ� ��ݺ� (���� ������ �ǳʶ�)
-- CONTINUE-WHEN: Ư�� ���ǽ��� ������ �� ���� �ݺ��ϰ� �ִ� �ֱ⸦ �����ϰ� ��ݺ� (���� ������ �ǳʶ�)

DECLARE
--    LOOP_NUM NUMBER(5) := 0;
BEGIN
    FOR i IN 0..4 LOOP
        CONTINUE WHEN MOD(i, 2) = 1; -- Ȧ���� �ǳʶ�
        DBMS_OUTPUT.PUT_LINE('CURRENT NUM : ' || i);
--        LOOP_NUM := LOOP_NUM + 1;
    END LOOP;
END;
/
