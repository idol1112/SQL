--서브쿼리 SQL 문제

--문제1.평균 급여보다 적은 급여을 받는 직원은 몇명인지 구하시오.
--(56건)
SELECT  COUNT(salary)
FROM    employees
where   (select avg(salary)
         from   employees
        ) > salary;
        
--문제2.평균급여 이상, 최대급여 이하의 월급을 받는 사원의 
--직원번호(employee_id), 이름(first_name), 급여(salary),
--평균급여, 최대급여를 급여의 오름차순으로 정렬하여 출력하세요 
--(51건)
SELECT  employee_id,
        first_name,
        salary
FROM    employees
where   salary >= (select   avg(salary)
                   from     employees
                   )
and     salary <= (select   max(salary)
                   from     employees
                   )
order by salary asc;

--문제3.직원중 Steven(first_name) king(last_name)이 소속된 부서(departments)가 있는 곳의 주소를 알아보려고 한다.
--도시아이디(location_id), 거리명(street_address), 우편번호(postal_code), 도시명(city),
--주(state_province), 나라아이디(country_id) 를 출력하세요
--(1건)
SELECT  d.location_id, l.street_address,
        l.postal_code, l.city,
        l.state_province, l.country_id
        
FROM    employees e, departments d, locations l
where   e.department_id = d.department_id
and     d.location_id = l.location_id
and     e.first_name like 'Steven'
and     e.last_name like 'King';

--문제4.job_id 가 'ST_MAN' 인 직원의 급여보다 작은 직원의 사번,이름,급여를 급여의 내림차순으로 출력하세요  -ANY연산자 사용
--(74건)
SELECT  employee_id,
        first_name,
        salary
FROM    employees
where   salary < any  (select   max(salary)
                       from     employees
                       where    job_id like 'ST_MAN'
                       );
        
--문제5.각 부서별로 최고의 급여를 받는 사원의 직원번호(employee_id),
--이름(first_name)과 급여(salary) 부서번호(department_id)를 조회하세요 
--단 조회결과는 급여의 내림차순으로 정렬되어 나타나야 합니다. 
--조건절비교, 테이블조인 2가지 방법으로 작성하세요
--(11건)

--조건절비교
SELECT  employee_id,
        first_name,
        salary,
        department_id
FROM    employees

where   (department_id, salary) in (select department_id, max(Salary)
                                    from   employees
                                    group by department_id)
order by salary desc;

--테이블조인
SELECT  e.employee_id,
        e.first_name,
        e.salary,
        e.department_id
FROM    employees e, (select  department_id, max(salary) salary
                      from    employees
                      group by department_id) m

where   e.department_id = m.department_id
and     e.salary = m.salary
order by e.salary desc;

--문제6.각 업무(job) 별로 연봉(salary)의 총합을 구하고자 합니다. 
--연봉 총합이 가장 높은 업무부터 업무명(job_title)과 연봉 총합을 조회하시오 
--(19건)

SELECT
        j.job_title,
        e.salary
        
FROM    jobs j, (SELECT    job_id, sum(salary)salary
                   FROM    employees
                   group by job_id) e
where   j.job_id = e.job_id;

--문제7.자신의 부서 평균 급여보다 연봉(salary)이 많은 직원의 직원번호(employee_id),
--이름(first_name)과 급여(salary)을 조회하세요 
--(38건)
SELECT  e.employee_id, e.first_name, e.salary
FROM    employees e, (select department_id, avg(salary)salary
                        from employees
                        group by department_id)a
where   e.department_id = a.department_id
and     e.salary > a.salary;

--문제8.직원 입사일이 11번째에서 15번째의 직원의 사번, 이름, 급여, 입사일을 입사일 순서로 출력하세요
select rn,
       employee_id, first_name,
       salary, hire_date
from(select rownum rn,
            employee_id, first_name,
            salary, hire_date
     from(SELECT  employee_id, first_name,
                salary, hire_date
         FROM    employees
         order by hire_date asc)
    )
where rn >= 11
and   rn <= 15;