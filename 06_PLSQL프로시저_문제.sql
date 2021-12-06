/*
���ν����� guguProc
�������� ���޹޾� �ش� �ܼ��� ����ϴ� procedure�� �����ϼ���.
*/

CREATE PROCEDURE guguProc (
    p_dan IN NUMBER
)
IS
BEGIN
    DBMS_OUTPUT.PUT_LINE(p_dan || '��');
    FOR i IN 1..9
    LOOP
        DBMS_OUTPUT.PUT_LINE(p_dan || ' x ' || i || ' = ' || p_dan * i);
    END LOOP;
END;

EXEC guguProc(14);



/*
���ν����� - new_emp_proc
employees ���̺��� ���� ���̺� emps�� �����մϴ�.
employee_id, last_name, email, hire_date, job_id�� �Է¹޾�
�����ϸ� �̸�, �̸���, �Ի���, ������ update, 
���ٸ� insert�ϴ� merge���� �ۼ��ϼ���
*/
SELECT * FROM emps;

CREATE OR REPLACE PROCEDURE new_emp_proc(
    p_empoyee_id IN emps.employee_id%TYPE,
    p_last_name IN emps.last_name%TYPE,
    p_email IN emps.email%TYPE,
    p_hire_date IN emps.hire_date%TYPE,
    p_job_id IN emps.job_id%TYPE
)
IS

BEGIN
    MERGE INTO emps a
    USING (SELECT p_employee_id AS employee_id FROM dual) b
    ON (a.employee_id = b.employee_id)
    WHEN MATCHED THEN
        UPDATE SET
            a.last_name = p_last_name,
            a.email = p_email,
            a.hire_date = p_hire_date,
            a.job_id = p_job_id            
    WHEN NOT MATCHED THEN
        INSERT (a.employee_id, a.last_name, a.email, a.hire_date, a.job_id)
        VALUES (p_employee_id, p_last_name, p_email, p_hire_date, p_job_id);
END;

EXEC new_emp_proc(100, 'lee', 'abc', sysdate, 'test2');

SELECT * FROM emps;