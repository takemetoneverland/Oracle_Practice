
-- �� ��ȯ�Լ� TO_CHAR, TO_NUMBER, TO_DATE

-- ��¥�� ���ڷ� TO_CHAR(��, ����)
SELECT TO_CHAR(sysdate) FROM dual;
SELECT TO_CHAR(sysdate, 'YYYY-MM-DD HH:MI:SS') FROM dual;
SELECT TO_CHAR(sysdate, 'YY-MM-DD PM HH:MI:ss') FROM dual;
SELECT TO_CHAR(sysdate, 'YYYY-MM-DD HH24:MI:SS') FROM dual;

-- ����ϰ� ���� ���ڸ� ""�� ���� �����Ѵ�.
SELECT first_name, TO_CHAR(hire_date, 'YYYY"��" MM"��" DD"��"')
FROM employees;

-- ���ڸ� ���ڷ� TO_CHAR(��, ����)
SELECT TO_CHAR(20000, '99999') FROM dual;
-- �־��� �ڸ����� ���ڸ� ��� ǥ���� �� ��� ��� #���� ǥ��ȴ�.
SELECT TO_CHAR(20000, '9999') FROM dual;
SELECT TO_CHAR(20000.21, '99999.9') FROM dual; -- �Ҽ��� �ڸ��� ���� ����.
SELECT TO_CHAR(20000, '99,999') FROM dual;

SELECT TO_CHAR(salary, '$999,999') AS salary
FROM employees;

SELECT TO_CHAR(salary, 'L099,999') AS salary
FROM employees;

