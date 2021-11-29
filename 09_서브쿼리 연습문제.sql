
-- 문제 1
SELECT * FROM employees
WHERE salary  > (SELECT AVG(salary) FROM employees);
                    
SELECT COUNT(*) FROM employees
WHERE salary  > (SELECT AVG(salary) FROM employees);
                    
SELECT * FROM employees
WHERE salary  > (SELECT AVG(salary) FROM employees
                 WHERE job_id = 'IT_PROG');
                    
-- 문제 2
SELECT * FROM employees
WHERE department_id = (SELECT department_id
                       FROM departments
                       WHERE manager_id = 100);
                         
-- 문제 3
SELECT * FROM employees
WHERE manager_id > (SELECT manager_id
                    FROM employees
                    WHERE first_name = 'Pat');

SELECT * FROM employees
WHERE manager_id IN
    (                    
    SELECT manager_id FROM employees
    WHERE first_name = 'James'
    );
    
-- 문제 4
SELECT * FROM
(
SELECT ROWNUM AS rn, first_name FROM    
    (
    SELECT * FROM employees
    ORDER BY first_name DESC
    )
)
WHERE rn > 40 AND rn <= 50;

-- 문제 5
SELECT * FROM
(
SELECT ROWNUM AS rn, employee_id, first_name, phone_number, hire_date FROM
    (
    SELECT * FROM employees
    ORDER BY hire_date ASC
    )
)
WHERE rn > 30 AND RN <= 40;

-- 문제 6
SELECT
    e.employee_id,
    (CONCAT(e.first_name, e.last_name)) AS name,
    d.department_id,
    d.department_name
FROM employees e LEFT JOIN departments d
ON e.department_id = d.department_id
ORDER BY employee_id ASC;

-- 문제 7
SELECT 
    e.employee_id,
    (CONCAT(e.first_name, e.last_name)) AS name,
    e.department_id,
    (
    SELECT department_name FROM departments d
    WHERE d.department_id = e.department_id
    ) AS department_name
FROM employees e
ORDER BY employee_id ASC;

-- 문제 8
SELECT 
    d.department_id,
    d.department_name,
    d.manager_id,
    lo.location_id,
    lo.street_address,
    lo.postal_code,
    lo.city
FROM departments d LEFT JOIN locations lo
ON d.location_id = lo.location_id
ORDER BY department_id ASC;

-- 문제 9
-- 스칼라 서브쿼리는 반드시 한 행, 한 컬럼만 리턴하는 서브쿼리이다.
SELECT
    d.department_id,
    d.department_name,
    d.manager_id,
    (
    SELECT        
        lo.street_address       
        FROM locations lo
        WHERE lo.location_id = d.location_id
    ) AS address,
    (
    SELECT        
        lo.postal_code       
        FROM locations lo
        WHERE lo.location_id = d.location_id
    ) AS postcode,
    (
    SELECT        
        lo.city       
        FROM locations lo
        WHERE lo.location_id = d.location_id
    ) AS city    
FROM departments d
ORDER BY department_id ASC;

-- 문제 10
SELECT
    lo.location_id,
    lo.street_address,
    lo.city,
    c.country_id,
    c.country_name
FROM locations lo LEFT JOIN countries c
ON lo.country_id = c.country_id;
ORDER BY c.country_name ASC;

-- 문제 11
SELECT
    lo.location_id,
    lo.street_address,
    lo.city,
    (
    SELECT country_id FROM countries c
    WHERE c.country_id = lo.country_id
    ) AS country_id,
    (
    SELECT country_name FROM countries c
    WHERE c.country_id = lo.country_id
    ) AS country_name
FROM locations lo
ORDER BY country_name ASC;

-- 문제 12
SELECT * FROM
    (
    SELECT ROWNUM as rn, a.* FROM
        (
        SELECT
            e.employee_id,
            e.first_name,
            e.phone_number,
            e.hire_date,
            d.department_id,
            d.department_name
        FROM employees e LEFT JOIN departments d
        ON d.department_id = e.department_id
        ORDER BY hire_date ASC
        ) a
    )
WHERE rn > 0 AND rn <= 10;

-- 문제 13

SELECT a.*,
       d.department_name FROM
    (
    SELECT last_name, job_id, department_id
    FROM employees
    WHERE job_id = 'SA_MAN'
    ) a
JOIN departments d
ON a.department_id = d.department_id;

-- 문제 14

SELECT
    d.department_id,
    d.department_name,
    d.manager_id,
    a.total
FROM departments d
JOIN
    (
    SELECT department_id, COUNT(*) AS total
    FROM employees
    GROUP BY department_id
    ) a
ON d.department_id = a.department_id
ORDER BY total DESC;

-- 문제 15
SELECT
    d.*,
    loc.street_address,
    loc.postal_code,
    NVL(a.result, 0) AS 부서별평균급여
FROM departments d
INNER JOIN locations loc
ON d.location_id = loc.location_id
LEFT OUTER JOIN (SELECT department_id, TRUNC(AVG(salary)) AS result
                 FROM employees
                 GROUP BY department_id) a
ON d.department_id = a.department_id;

-- 문제 16
SELECT *
    FROM
    (
    SELECT ROWNUM AS rn, tbl.*
        FROM
        (
        SELECT
            d.*,
            loc.street_address,
            loc.postal_code,
            NVL(a.result, 0) AS 부서별평균급여
        FROM departments d
        INNER JOIN locations loc
        ON d.location_id = loc.location_id
        LEFT OUTER JOIN (SELECT department_id, TRUNC(AVG(salary)) AS result
                         FROM employees
                         GROUP BY department_id) a
        ON d.department_id = a.department_id
        ) tbl
    )
WHERE rn > 10 AND rn <= 20;




















