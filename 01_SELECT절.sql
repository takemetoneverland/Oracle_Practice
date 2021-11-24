
-- ����Ŭ�� �ּ��̴�.

/*
���� �ּ��̴�.
*/

SELECT * FROM employees; -- employees ��� ���̺��� ��� column�� �� ��ȸ

SELECT employee_id, first_name, last_name
FROM employees;

SELECT email, phone_number, hire_date
FROM employees;

-- �÷��� ��ȸ�ϴ� ��ġ���� * / + - ������ �����ϴ�.
SELECT employee_id, first_name, last_name, salary,
salary+salary*0.1 FROM employees;

-- NULL ���� Ȯ��
SELECT department_id, commission_pct
FROM employees;

-- allias(�÷����� �̸��� �����ؼ� ��ȸ�Ѵ�.)
SELECT first_name as �̸�, last_name as ��,
salary as �޿� FROM employees;

-- ����Ŭ�� Ȭ����ǥ�� ���ڸ� ǥ���ϰ�, ���ڿ� �ȿ� Ȭ����ǥ��
-- ǥ���ϰ� �ʹٸ� ''�� �ι� �������� ���� �ȴ�.
-- || -> ������
SELECT first_name || ' ' || last_name || '''s salary is $' || salary
as �޿����� FROM employees;

-- distinct (�ߺ� ���� ����)
SELECT department_id FROM employees;
SELECT DISTINCT department_id FROM employees;

-- ROWNUM, ROWID
-- (**�ο��: ������ ���ؼ� ��ȯ�Ǵ� �� ��ȣ�� ���)
-- (�ο���̵�: �����ͺ��̽����� ���� �ּҰ��� ��ȯ)
SELECT ROWNUM, ROWID, employee_id
FROM employees;






