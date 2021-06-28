--문제1.
SELECT  e.employee_id "부서ID", e.first_name "이름",
        e.last_name "성", d.department_name "부서명"
FROM    employees e, departments d
where   e.department_id = d.department_id
order by d.department_name asc, e.employee_id desc;

--문제2.
SELECT  e.employee_id "부서ID", e.first_name "이름",
        e.salary "급여", d.department_name "부서명",
        j.job_title "현재업무"  
FROM    employees e, jobs j, departments d
where   e.job_id = j.job_id
and     e.department_id = d.department_id
order by e.employee_id asc;

--문제2-1.
SELECT  e.employee_id "부서ID", e.first_name "이름",
        e.salary "급여", d.department_name "부서명",
        j.job_title "현재업무" 
FROM    employees e, jobs j, departments d
where   e.job_id = j.job_id
and     e.department_id = d.department_id(+)
order by e.employee_id asc;

--문제3.
SELECT  l.location_id "도시ID", l.city "도시명",
        d.department_name "부서명"
FROM    departments d, locations l
where   d.location_id = l.location_id
order by l.location_id asc;

--문제3.1
SELECT  l.location_id "지역ID", l.city "도시명",
        d.department_name "부서명"
FROM    departments d, locations l
where   d.location_id(+) = l.location_id
order by l.location_id asc;

--문제4.
SELECT  r.region_name "지역", c.country_name "나라"
FROM    regions r, countries c
where   r.region_id = c.region_id
order by r.region_name asc, c.country_name desc;

--문제5.
SELECT  e.employee_id "사번", e.first_name "이름",
        e.hire_date "채용일", h.first_name "매니저이름",
        h.hire_date "매니저입사일"
FROM    employees e, employees h
where   e.manager_id = h.employee_id
and     e.hire_date < h.hire_date;

--문제6.
SELECT  c.country_name "나라", c.country_id "나라ID",
        l.city "도시", l.location_id"도시ID",
        d.department_name "부서명", d.department_id "부서ID"
FROM    departments d, locations l, countries c
where   d.location_id = l.location_id
and     l.country_id = c.country_id
order by c.country_name asc;

--문제7.
SELECT  em.employee_id "사번",
        em.first_name || em.last_name "이름",
        em.job_id "업무ID",
        jh.start_date "시작일",
        jh.end_date "종료일"
FROM    employees em, job_history jh
where   em.employee_id = jh.employee_id
and     jh.job_id = 'AC_ACCOUNT';

--문제8.
SELECT  e.department_id "부서번호", d.department_name "부서이름",
        e.first_name "매니저이름", l.city "도시",
        c.country_name "나라", r.region_name "지역"
FROM    employees e, departments d, locations l, countries c, regions r
where   e.department_id = d.department_id
and     d.location_id = l.location_id
and     l.country_id = c.country_id
and     c.region_id = r.region_id
and     d.manager_id is not null
and     d.manager_id = e.employee_id
order by e.department_id asc;

--문제9.
SELECT  e.employee_id "사번",
        e.first_name "사원이름",
        d.department_name "부서명",
        a.first_name "매니저이름"
FROM    departments d, employees e, employees a
where   e.department_id = d.department_id(+)
and     e.manager_id = a.employee_id
order by e.first_name asc;
