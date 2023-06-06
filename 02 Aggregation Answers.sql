use hr;

--- 01. Display the maximum, minimum and average salary and commission earned.
select min(salary),max(salary),avg(salary),avg(commission_pct) from employees;

--- 02.Display the department number, total salary payout and total commission payout for each department. 
select department_id, sum(salary),sum(commission_pct) from employees group by department_id ;  

--- 03. Display the department number and number of employees in each department.
select department_id,count(*) as Emp_by_dept from employees group by department_id;

--- 04. Display the department number and total salary of employees in each department
select department_id,sum(salary) from employees group by department_id;

--- 05. Display the employee's name who doesn't earn a commission. Order the result set without using the column name
select concat(first_name,' ',last_name) as Emp_name from employees where commission_pct is null order by 1;

--- 06. Display the employees name, department id and commission. If an Employee doesn't earn the commission, then display as 'No commission. Name the columns appropriately
select  concat(first_name,' ',last_name) as Emp_name,department_id,
case
	when commission_pct >0 then commission_pct
    else 'No commission'
end as Commission_pct
from employees;

--- 07.Display the employees name, salary and commission multiplied by 2. If an Employee 
--- doesnt earn the commission, then display as No commission. Name the columns appropriately
select  concat(first_name,' ',last_name) as Emp_name,salary, 
case
	when commission_pct >0 then commission_pct*2
    else 'No commission'
end as Commission_pct
from employees;

--- 08.Display the employees name, department id who have the first name same as another employee in the same department. 
select e.first_name,e.last_name,e.department_id from employees e join employees s where e.first_name=s.first_name;

--- 09.Display the sum of salaries of the employees working under each Manager. 
SELECT Manager_ID, COUNT(employee_id),sum(salary) FROM employees GROUP BY manager_id;

--- 10.Select the Managers name, the count of employees working under and the department ID of the manager.
select concat(e.first_name,' ',e.last_name) as Manager_name,count(e.employee_id) as emp_count,d.department_id from employees e join departments d on (d.manager_id=e.employee_id);

--- 11.Select the employee name, department id, and the salary. Group the result with the manager name and the employee last name should have second letter 'a!'. 
select  concat(first_name,' ',last_name) as Emp_name,department_id,salary from employees where last_name like '_a%' group by manager_id ;

--- 12.Display the average of sum of the salaries and group the result with the department id. Order the result with the department id.
select department_id, sum(salary) from employees group by department_id order by 1;

--- 13.Select the maximum salary of each department along with the department id
select d.department_id,d.department_name,max(e.salary) as max_salary from employees e join departments d group by d.department_id;

--- 14.Display the commission, if not null display 10% of salary, if null display a default value 1
select commission_pct,
case 
	when commission_pct>0 then salary*0.1
    else 1
end as cm_salary    
from employees;