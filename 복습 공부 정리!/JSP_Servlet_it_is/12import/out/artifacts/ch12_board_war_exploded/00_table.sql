DROP SEQUENCE talBoard_SEQ;

CREATE SEQUENCE talBoard_SEQ -- �Խù�ȣ�� ���� ������ ����
INCREMENT BY 1 
START WITH 1
MINVALUE 1
MAXVALUE 999
NOCYCLE;

DROP TABLE tblBoard;
CREATE TABLE tblBoard(
	NUM NUMBER(20), -- �Խù�ȣ 
	NAME VARCHAR(50), -- �Խ��� �̸�
	SUBJECT VARCHAR(50), -- ����
	CONTENT VARCHAR(200), -- ���� ����
	POS NUMBER(10), -- �Խù��� ������� ��ġ �� ���� (ȭ�鿡 ������� �ѷ��ִ� ����)
	REF NUMBER(10) , -- �亯 ���� ��� �Ҽӵ� �θ� ���� ����Ű�� ��ȣ
	DEPTH NUMBER(10), -- �亯 ���� ��� �亯�� ���̸� ����
	REGDATE DATE, -- �ۼ��� ��¥ ����
	PASS VARCHAR(15), -- �ۼ����� �н����� ����
	IP   VARCHAR(15), -- ������ �� �ۼ����� IP�ּ� ����
	COUNT NUMBER(10), -- �Խù��� ��ȸ�� ����
	FILENAME VARCHAR(30), -- ���ε�� ���� �̸� ����
	FILESIZE NUMBER(20), -- ���ε�� ���� ũ�� ����
	PRIMARY KEY(NUM)
);

commit

select * from tblBoard;
