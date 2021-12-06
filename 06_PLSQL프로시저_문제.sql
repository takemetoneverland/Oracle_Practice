/*
프로시저명 guguProc
구구단을 전달받아 해당 단수를 출력하는 procedure을 생성하세요.
*/

CREATE PROCEDURE guguProc (
    p_dan IN NUMBER
)
IS
BEGIN
    DBMS_OUTPUT.PUT_LINE(p_dan || '단');
    FOR i IN 1..9
    LOOP
        DBMS_OUTPUT.PUT_LINE(p_dan || ' x ' || i || ' = ' || p_dan * i);
    END LOOP;
END;

EXEC guguProc(14);



/*
프로시저명 - new_emp_proc
employees 테이블의 복사 테이블 emps를 생성합니다.
employee_id, last_name, email, hire_date, job_id를 입력받아
존재하면 이름, 이메일, 입사일, 직업을 update, 
없다면 insert하는 merge문을 작성하세요
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