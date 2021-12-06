/*
AFTER Ʈ���� - INSERT, UPDATE, DELETE �۾� ���Ŀ� �����ϴ� Ʈ���Ÿ� �ǹ��Ѵ�.
BEFORE Ʈ���� - INSERT, UPDATE, DELETE �۾� ������ �����ϴ� Ʈ���Ÿ� �ǹ��Ѵ�.
INSTEAD OF Ʈ���� - INSERT, UPDATE, DELETE �۾� ������ �߻��ϴ� Ʈ�����ε�,
                    VIEW���� ������ �� �ִ�.
                    
:OLD = ���� �� ���� �� (INSERT: �Է� �� �ڷ�, UPDATE: ���� �� �ڷ�, DELETE: ������ ��)
:NEW = ���� �� ���� �� (INSERT: �Է� �� �ڷ�, UPDATE: ���� �� �ڷ�)

���̺� UPDATE�� DELETE�� �õ��ϸ� ���� �Ǵ� ������ �����͸�
������ ���̺� ������ ���� �������� Ʈ���Ÿ� ����� �� �ִ�.
*/

CREATE TABLE tbl_user(
    id VARCHAR2(20) PRIMARY KEY,
    name VARCHAR2(20),
    address VARCHAR2(30)
);

CREATE TABLE tbl_user_backup(
    id VARCHAR2(20),
    name VARCHAR2(20),
    address VARCHAR2(30),
    update_date DATE DEFAULT sysdate, --���� �ð�
    m_type VARCHAR2(10), -- ���� Ÿ��
    m_user VARCHAR2(20) -- ������ �����
);

-- AFTER Ʈ����
CREATE OR REPLACE TRIGGER trg_user_backup
    AFTER UPDATE OR DELETE
    ON tbl_user
    FOR EACH ROW
DECLARE -- ����� ������ �����ϴ� ��
    v_type VARCHAR2(10);
BEGIN
    IF UPDATING THEN -- UPDATING�� �ý��� ��ü���� ���¿� ���� ������ �����ϴ� ��Ʈ�� ����.
        v_type := '����';
    ELSIF DELETING THEN 
        v_type := '����';
    END IF;
    
    -- ���� ���� ���� (:OLD�� ���̺� DELETE, UPDATE�� ����Ǳ� �� ���� ������. �� ���� �� ������)
    INSERT INTO tbl_user_backup
    VALUES (:OLD.id, :OLD.name, :OLD.address, sysdate, v_type, USER());
    
END;

-- Ȯ��
INSERT INTO tbl_user VALUES('test01', 'admin', '����');
INSERT INTO tbl_user VALUES('test02', 'admin', '���');
INSERT INTO tbl_user VALUES('test03', 'admin', '�λ�');

SELECT * FROM tbl_user;
SELECT * FROM tbl_user_backup;

UPDATE tbl_user SET address='��õ' WHERE id='test01';

-- BEFORE Ʈ����
CREATE OR REPLACE TRIGGER trg_user_insert
    BEFORE INSERT
    ON tbl_user
    FOR EACH ROW
BEGIN
    :NEW.name := SUBSTR(:NEW.name, 1, 1) || '**';
END;

INSERT INTO tbl_user VALUES('test04', 'ȫ�浿', '�뱸');

SELECT * FROM tbl_user;

/*
- Ʈ������ Ȱ��
INSERT -> �ֹ����̺� -> �ֹ����̺� INSERT Ʈ���� ���� (��ǰ ���̺� update)
*/

-- �ֹ� �����丮
CREATE TABLE order_history (
    history_no NUMBER(5) PRIMARY KEY,
    order_no NUMBER(5),
    product_no NUMBER(5),
    total NUMBER(10),
    price NUMBER(10)
);

-- ��ǰ
CREATE TABLE product (
    product_no NUMBER(5) PRIMARY KEY,
    product_name VARCHAR2(20),
    total NUMBER(5),
    price NUMBER(5)
);

CREATE SEQUENCE order_history_seq NOCACHE;
CREATE SEQUENCE product_seq NOCACHE;

INSERT INTO product VALUES(product_seq.NEXTVAL, '����', 100, 10000);
INSERT INTO product VALUES(product_seq.NEXTVAL, 'ġŲ', 100, 15000);
INSERT INTO product VALUES(product_seq.NEXTVAL, '�ܹ���', 100, 5000);

-- �ֹ� �����丮�� �����Ͱ� ������ ����.
CREATE OR REPLACE TRIGGER trg_order_history
    AFTER INSERT
    ON order_history
    FOR EACH ROW
DECLARE
    v_total NUMBER;
    v_product_no NUMBER;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Ʈ���� ����!');
    SELECT :NEW.total
    INTO v_total
    FROM dual;
    
    v_product_no := :NEW.product_no;
    
    UPDATE product SET total = total - v_total
    WHERE product_no = v_product_no;
    
END;

INSERT INTO order_history VALUES(order_history_seq.NEXTVAL, 200, 1, 5, 50000);
INSERT INTO order_history VALUES(order_history_seq.NEXTVAL, 200, 2, 1, 15000);
INSERT INTO order_history VALUES(order_history_seq.NEXTVAL, 200, 3, 10, 50000);


SELECT * FROM order_history;
SELECT * FROM product;



