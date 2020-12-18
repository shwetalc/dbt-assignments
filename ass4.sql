/*Joins, Union, Subquery,Sequence

************joins*****************
1. select dept_name and emp_name where dept_id is same.
2. select all from both tables where dept_id is same.
3. select dept_id and sum of salary group it by dept_id.
4. select dept_name and emp_name apply right outer join and left outer join.
5. select emp_name with their respective manager names.
6. select epm_name with their respective department names.
*************union****************
	Emp1			Emp2
emp_no     emp_name	emp_no     emp_name
---------------------   ------------------------
1		A		1		A
2		B		2		B
3		C		4		D
				5		E

1.	select same data from both table.

************subQuery*************
1. select employee having  same salary as 'Arun'.
2. select employee belonging to same dept as 'jack'.
3. select name of employee havin lowest salary.
4. update salary =15000 of employees belonging to same dept as 'Max'.
*/


create database whitewalker2;
use whitewalker2;
create table Department
(
	dept_id int not null,
    dept_name varchar(50) not null,
    primary key(dept_id)
);
create table employee
(
	empid int not null ,
    emp_name varchar(50) not null,
    dept_id int not null,
    salary double,
    manager char(50),
	constraint employee_fk foreign key(dept_id) references department(dept_id)
);
alter table employee
add man_name varchar(50);
insert into department values(1,'finance');
insert into department values(2,'training');
insert into department values(3,'marketing');

insert into employee values(1,'arun',1,8000, 4);
insert into employee values(2,'kiran',1,7000,1);
insert into employee values(3,'scot',1,3000,1);
insert into employee values(4,'max',2,9000,null);
insert into employee values(5,'jack',2,8000,4);
insert into employee values(6,'king',3,6000,1);
update employee 
set man_name="suman sing"
where dept_id=1;
update employee 
set man_name="parab"
where dept_id=2;
update employee 
set man_name="dhanaji"
where dept_id=3;
select department.dept_name ,employee.emp_name
from department
inner join employee
on department.dept_id=employee.dept_id;

select *
from department
inner join employee
on department.dept_id=employee.dept_id;
-- select dept_id and sum of salary group it by dept_id.
select department.dept_id, sum(employee.salary) as "employee salary"
from department
inner join employee
on department.dept_id=employee.dept_id
group by dept_id;
-- select dept_name and emp_name apply right outer join and left outer join.
select dept_name, emp_name 
from department 
left join employee
on department.dept_id=employee.dept_id;

select dept_name, emp_name 
from department 
right join employee
on department.dept_id=employee.dept_id;

-- select emp_name with their respective manager names.
select emp_name,man_name 
from department 
join employee
on department.dept_id=employee.dept_id;

-- select epm_name with their respective department names.
select emp_name,dept_name
from department
join employee
on department.dept_id=employee.dept_id;
-- select employee having  same salary as 'Arun'.
select  * from employee where salary=(select salary from employee where emp_name='arun');
-- select employee belonging to same dept as 'jack'
select * from employee where dept_id=(select dept_id from employee where emp_name='jack');
-- select name of employee havin lowest salary.
select * from employee where salary=(select min(salary) from employee);
-- update salary =15000 of employees belonging to same dept as 'Max'.
update employee 
set salary=15000
where dept_id=(select dept_id from (select dept_id from employee where emp_name='max')a)and emp_name!='max';
select * from department cross join employee;
create table emp1(emp_no int,emp_name varchar(50));
create table emp2(emp_no int,emp_name varchar(50));
insert into emp1 values(1,'A');
insert into emp1 values(2,'B');
insert into emp1 values(3,'C');
insert into emp2 values(1,'A');
insert into emp2 values(2,'B');
insert into emp2 values(4,'D');
insert into emp2 values(5,'E');

(select * from emp1)
union
(select * from emp2);
