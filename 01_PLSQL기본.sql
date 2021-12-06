
/*
# PL/SQL �̶�
- ����Ŭ���� �����ϴ� SQL ���α׷��� ����̴�.
- �Ϲ����� ���α׷��ְ��� ���̰� ������, ����Ŭ ���ο��� ������ ó���� ���ؼ�
 ������ �� �� �ִ� ���������� �ڵ� �ۼ� ����̴�.
- �������� �������� ��� ������ �ϰ�ó���ϱ� ���� �뵵�� ����Ѵ�.
*/

SET SERVEROUTPUT ON; -- ��¹� Ȱ��ȭ

DECLARE -- ������ �����ϴ� ����(�����).
    emp_num NUMBER; -- ���� ����.
BEGIN -- �ڵ带 �����ϴ� ���� ����(�����).
    emp_num := 10; -- ���Կ����� :=
    dbms_output.put_line(emp_num); -- ��¹�
    dbms_output.put_line('hello pl/sql!!!');
END; -- PL/SQL�� ������ ����(����).

-- ������
-- �Ϲ� SQL���� ��� �������� ����� �����ϰ�,
-- **�� ������ �ǹ��Ѵ�.
DECLARE
    A NUMBER := 2**2*3**2;
BEGIN
    DBMS_OUTPUT.PUT_LINE('a = ' || TO_CHAR(A));
END;

/*
- DML��
DDL���� ����� �Ұ����ϰ�, �Ϲ����� SQL���� SELECT ���� ����ϴµ�,
Ư���� ���� SELECT�� �Ʒ��� SELECT�� �Ʒ��� INTO���� ��뿡 ������ �Ҵ��� �� �ִ�.
*/

DECLARE
    v_emp_name VARCHAR2(50); -- ����� ���� (���ڿ� ������ ���������� �ʿ�)
    v_dep_name VARCHAR2(50); -- �μ��� ����
BEGIN
    SELECT
        e.first_name,
        d.department_name
    INTO
        v_emp_name, v_dep_name -- ������ ������ �ǹ�
    FROM employees e
    LEFT OUTER JOIN departments d
    ON e.department_id = d.department_id
    WHERE employee_id = 100;
    
    DBMS_OUTPUT.PUT_LINE(v_emp_name || '-' || v_dep_name);
END;

-- �ش� ���̺�� ���� Ÿ���� �÷� ������ �����Ϸ���
-- ���̺��.�÷���%TYPE�� ��������ν� Ÿ���� ������ Ȯ���ϴ� ���ŷο��� ������ �� �ִ�.
DECLARE
    v_emp_name employees.first_name%TYPE; 
    v_dep_name departments.department_name%TYPE; 
BEGIN
    SELECT
        e.first_name,
        d.department_name
    INTO
        v_emp_name, v_dep_name -- ������ ������ �ǹ�
    FROM employees e
    LEFT OUTER JOIN departments d
    ON e.department_id = d.department_id
    WHERE employee_id = 100;
    
    DBMS_OUTPUT.PUT_LINE(v_emp_name || '-' || v_dep_name);
END;
    
    
    
    