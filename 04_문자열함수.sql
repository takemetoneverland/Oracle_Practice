-- lower(소문자), initcap(앞글자만 대문자), upper(대문자)

/*
dual이라는 테이블은 sys가 소유하는 오라클의 표준 테이블로서
오직 한 행에 한 컬럼만 담고 있는 dummy 테이블이다.
일시적인 산술 연산이나 날짜 연산 등을 위해 주로 사용된다.
모든 사용자가 접근할 수 있다.
*/

SELECT 'abcDEF', lower('abcDEF'), upper('abcDEF')
FROM dual;

SELECT last_name, lower(last_name), initcap(last_name),
upper(last_name) FROM employees;

SELECT last_name FROM employees
WHERE lower(last_name) = 'austin';

-- length(길이), instr(문자 찾기 없으면 0 나옴, 인덱스값)
SELECT 'abcdef' AS ex, LENGTH('abcdef'), INSTR('abcdef', 'z')
FROM dual;

SELECT first_name, LENGTH(first_name), INSTR(first_name, 'a')
FROM employees;

-- substr(문자열 자르기), concat(문자 연결) 1부터 시작
SELECT 'abcdef' AS ex,
SUBSTR('abcdef', 1, 4), CONCAT('abc', 'def')
FROM dual;

SELECT first_name, SUBSTR(first_name, 1, 3),
CONCAT(first_name, last_name)
FROM employees;

-- LPAD, RPAD (좌, 우측 지정문자열로 채우기)
SELECT LPAD('abc', 10, '*') FROM dual;
SELECT RPAD('abc', 10, '*') FROM dual;

-- LTRIM(), RTRIM(), TRIM()공백제거
-- L, RTRIM -> 좌/우측에 지정한 문자 제거
SELECT LTRIM('javascript_java', 'java') FROM dual;
SELECT RTRIM('javascript_java', 'java') FROM dual;
SELECT TRIM('   java     ') FROM dual;

-- REPLACE(문자열 치환)
SELECT REPLACE('my dream is a president', 'president', 'doctor')
FROM dual;

SELECT REPLACE('my dream is a president', ' ', '')
FROM dual;

SELECT REPLACE(REPLACE('my dream is a president', 'president', 'doctor'), ' ', '')
FROM dual;

SELECT REPLACE(CONCAT('hello ', 'world'),' ', '') FROM dual;

-- 연습 문제1. EMPLOYEES테이블에서 JOB_ID가 it_prog인 사원의 이름(first_name)과 급여(salary)를 출력
-- 조건 1) 비교하기 위한 값은 소문자로 입력해야 한다.(힌트: lower 이용)
-- 조건 2) 이름은 앞 3문자까지 출력하고 나머지는 *로 출력한다.
--         이 열의 열 별칭은 name이다.(힌트: rpad와 substr또는 substr 그리고 length 이용)
-- 조건 3) 급여는 전체 10자리로 출력하되 나머지 자리는 *로 출력한다.
--         이 열의 열 별칭은 salary이다.(힌트: lpad 이용)

SELECT
    RPAD(SUBSTR(first_name, 1, 3), LENGTH(first_name), '*') as name,
    LPAD(salary, 10, '*') as salary
FROM employees
WHERE LOWER(job_id) = 'it_prog';

-- 문제1
SELECT CONCAT(first_name, last_name) AS 이름,
REPLACE(hire_date, '/', '') AS 입사일자
FROM employees
ORDER BY 이름 ASC;

-- 문제2
SELECT
CONCAT('(02)', SUBSTR(phone_number, 4, LENGTH(phone_number))) AS 전화번호
FROM employees;
















