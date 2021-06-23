/*from�� select��*/
--��� �÷� ��ȸ�ϱ�
select *
from employees;

select * 
from departments;

--���ϴ� �÷��� ��ȸ�ϱ�
select employee_id, first_name, last_name
from employees;

--����)
select first_name, phone_number, hire_date, salary
from employees;

select first_name, 
       last_name, 
       phone_number, 
       email, 
       hire_date
from employees;

--����� �� �÷��� ���� ����ϱ�
select  employee_id empNo,
        first_name "f-name",
        salary "�� ��"
from employees;

--����)
select  first_name �̸�,
        phone_number ��ȭ��ȣ,
        hire_date �Ի���,
        salary �޿�
from employees;

select  employee_id as �����ȣ,
        first_name as �̸�,
        last_name as ��,
        salary as �޿�,
        phone_number as ��ȭ��ȣ,
        email as �̸���,
        hire_date as �Ի���
from employees;

--���� ������(Concatenation)�� �÷��� ���̱�
select  first_name,
        last_name
from employees;

select  first_name || last_name
from employees;

select  first_name || ' ' ||last_name
from employees;

select  first_name || ' hire date is ' || hire_date  "�Ի���"
from employees;

--��� ������ ����ϱ�
select  first_name,
        salary
from employees;

select  first_name,
        salary,
        salary*12
from employees;

select  first_name,
        salary,
        salary*12,
        (salary+300)*12
from employees;

--����)
select job_id*12
from employees;


--����)
select  first_name || '-' || last_name "����",
        salary "�޿�",
        salary*12 "����",
        salary*12+5000 "����2",
        phone_number "��ȭ��ȣ"
from employees;


/*where��*/
--�񱳿����� 
select first_name
from employees
where department_id = 10;

--����
select first_name, salary
from employees
where salary >= 15000;

select  first_name,
        hire_date
from employees
where hire_date >= '07/01/01';

select salary
from employees
where first_name = 'Lex';

--������ 2���̻� �϶� �Ѳ����� ��ȸ�ϱ�
select  first_name,
        salary
from employees
where salary >= 14000 
and salary <= 17000;

--����
select  first_name,
        salary
from employees
where salary <= 14000
or salary >= 17000;


select  first_name,
        hire_date
from employees
where hire_date >= '04/01/01'
and hire_date <= '05/12/31';

--BETWEEN �����ڷ� Ư������ �� ����ϱ�
select  first_name,
        salary
from employees
where salary between 14000 and 17000;

--IN �����ڷ� ���� ������ �˻��ϱ�
select first_name, last_name, salary
from employees
where first_name in ('Neena', 'Lex', 'John');

select first_name, last_name, salary
from employees
where first_name = 'Neena'
or first_name = 'Lex'
or first_name = 'John';

--����
select  first_name,
        salary
from employees
where salary = 2100
or salary = 3100
or salary = 4100
or salary = 5100;

select  first_name,
        salary
from employees
where salary in (2100, 3100, 4100, 5100);

--Like �����ڷ� ����Ѱ͵� ��� ã��
select first_name, last_name, salary
from employees
where first_name like 'L%';

--����)
select first_name, salary
from employees
where first_name like '%am%';

select first_name, salary
from employees
where first_name like '_a%';

select first_name
from employees
where first_name like '___a%';

select first_name
from employees
where first_name like '__a_';