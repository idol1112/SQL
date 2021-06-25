--문제1.
SELECT  count(manager_id) "haveMngCnt"
FROM    employees;

--문제2.
SELECT  max(salary) "최고임금",
        min(salary) "최저임금",
        max(salary) - min(salary) "최고임금 - 최저임금"
FROM    employees;

--문제3.
SELECT  to_char(max(hire_date),  'YYYY"년" MM"월" DD"일"')
FROM    employees;


--문제4.
SELECT  department_id,
        trunc(avg(salary)) "평균임금",
        max(salary) "최고임금",
        min(Salary) "최저임금"
FROM    employees
group by department_id
order by department_id desc;

--문제5.
SELECT  job_id,
        round(avg(salary),0) "평균임금",
        max(salary) "최고임금",
        min(Salary) "최저임금"
FROM    employees
group by job_id
order by min(Salary) desc,
         avg(salary) asc;
         
--문제6.
SELECT  to_char(min(hire_date),'YYYY-MM-DD DAY')
FROM    employees;

--문제7.
SELECT  department_id,
        round(avg(salary),0) "평균임금",
        min(Salary) "최저임금",
        round(avg(salary),0) - min(Salary) "평균임금 - 최저임금"
FROM    employees
group by department_id
having  round(avg(salary),0) - min(Salary) < 2000
order by round(avg(salary),0) - min(Salary) desc;

--문제8.
SELECT  job_title "업무명",
        max_salary - min_salary "최고임금 - 최저임금"
FROM    jobs
group by job_title, max_salary - min_salary
order by max_salary - min_salary desc;

--문제9.
SELECT  manager_id,
        round(avg(salary),0) "평균임금",
        max(salary) "최고임금",
        min(Salary) "최저임금"
        
FROM    employees
group by manager_id
having  round(avg(salary),0) >= 5000
order by round(avg(salary),0) desc;

--문제10.
SELECT  first_name,
        hire_date,
        case when hire_date <= '02/12/31' then '창립멤버'
             when hire_date <= '03/12/31' then '03년입사'
             when hire_date <= '04/12/31' then '04년입사'
             else '상장이후입사'
        end  "optDate"
FROM    employees
order by hire_date asc;
