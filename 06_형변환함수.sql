
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

-- ���ڸ� ���ڷ� TO_NUMBER(��, ����)
SELECT '2000' + 2000 FROM dual; -- �ڵ� �� ��ȯ
SELECT TO_NUMBER('2000') + 2000 FROM dual; -- ����� �� ��ȯ
SELECT '$3300' + 2000 FROM dual; -- ����
SELECT TO_NUMBER('$3,300', '$9,999') + 2000 FROM dual;

-- ���ڸ� ��¥�� ��ȯ�ϴ� �Լ� TO_DATE(��, ����)
SELECT TO_DATE('2021-11-25') FROM dual; -- �⺻ ����
SELECT sysdate - TO_DATE('2021-03-25') FROM dual; -- ��¥�� ��ȯ�ؾ� ������ ����
SELECT TO_DATE('2020/12/25', 'YY/MM/DD') FROM dual;
-- �־��� ���ڿ��� ��� ��ȯ�ؾ� �Ѵ�.
SELECT TO_DATE('2021-03-31 12:23:50', 'YYYY-MM-DD HH:MI:SS') FROM dual;

-- xxxx�� xx�� xx�� ���ڿ� �������� ��ȯ�� ������.
-- ��ȸ �÷����� dateInfo�� �Ѵ�.
SELECT '20050102' FROM dual;
SELECT
    TO_CHAR(
        TO_DATE('20050102', 'YYYY/MM/DD'),
        'YYYY"��" MM"��" DD"��"'
    ) AS dateInfo
FROM dual;

-- NULL ���� �Լ� NVL(�÷�, ��ȯ�� Ÿ�ٰ�)
SELECT null FROM dual;
SELECT NVL(null, 0) FROM dual;

SELECT * FROM employees;
SELECT
    first_name,
    NVL(commission_pct, 0) AS comm_pct
FROM employees;

-- NULL ���� �Լ� NVL2(�÷�, null�� �ƴ� ��� ��, null�� ��� ��)
SELECT NVL2(50, '�ξƴ�', '��') FROM dual;
SELECT first_name, NVL2(commission_pct, 'true', 'false')
FROM employees;

SELECT
    first_name,
    commission_pct,
    NVL2(commission_pct, salary + (salary * commission_pct), salary) AS real_salary
FROM employees;

SELECT
    first_name,
    salary + (salary * commission_pct) AS "real salary"
FROM employees;  

-- DECODE(�÷� Ȥ�� ǥ����, �׸�1, ���1, �׸�2, ���2 ..... default)
SELECT
    DECODE('z', 'A', 'A�Դϴ�', 'B', 'B�Դϴ�', 'C', 'C�Դϴ�', '�𸣰ڴµ���')
FROM dual;

SELECT
    job_id,
    salary,
    DECODE(job_id, 'IT_PROG', salary*1.1, 'FI_MGR', salary*1.2, 'AD_VP', salary*1.3, salary)
    AS result
FROM employees;

-- CASE WHEN THEN END
SELECT
    first_name,
    job_id,
    salary,
    (CASE job_id
        WHEN 'IT_PROG' THEN salary * 1.1
        WHEN 'FI_MGR' THEN salary * 1.2
        WHEN 'FI_ACCOUNT' THEN salary * 1.3
        WHEN 'AD_VP' THEN salary * 1.4
        ELSE salary
    END) AS result
FROM employees;

-- ����1
SELECT
    employee_id AS �����ȣ,
    CONCAT(first_name, last_name) AS �����,
    hire_date AS �Ի�����,
    TRUNC((sysdate - hire_date) / 365) AS �ټӳ��
FROM employees
WHERE TRUNC((sysdate - hire_date) / 365) >= 15
ORDER BY �ټӳ�� DESC;

-- ����2
SELECT
    first_name,
    manager_id,
    DECODE(manager_id, '100', '���', '120', '����', '121', '�븮', '122', '����', '�ӿ�') AS ����
FROM employees
WHERE department_id = 50; 





















