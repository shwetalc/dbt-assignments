create database assignment3_dbms;
use assignment3_dbms;
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
create table authors
(
	auid int(5) primary key,
    aname varchar(30),
    email varchar(50),
    phone varchar(30),
	unique (email)
);
create table publishers
(
	pubid int(3) primary key,
    pname varchar(30),
    email varchar(50),
    phone varchar(30),
    unique (email)
);
insert into publishers values (1,'willey','info@wrox.com','7745001618');
insert into publishers values (2,'wrox','info@vsnl.com',null);
insert into publishers values (3,'tata mcgraw','feedback@tatamcgrawhill.com',8899764533);
insert into publishers values (4,'techmedia','books@techmedia.com',7768984563);

insert into authors values (101,'herbert schild','herbert@yahoo.com',null);
insert into authors values (102,'james goodwill','goodwill@hotmail.com',null);
insert into authors values (103,'david hunter','huter@hotmail.com',null);
insert into authors values (104,'stephen walther','walther@gmail.com',null);
insert into authors values (105,'kevin loney','loney@oracle.com',null);
insert into authors values (106,'ed. romans','romans@theserverside.com',null);

insert into department values(1,'finance');
insert into department values(2,'training');
insert into department values(3,'marketing');

insert into employee values(1,'arun',1,8000, 4);
insert into employee values(2,'kiran',1,7000,1);
insert into employee values(3,'scot',1,3000,1);
insert into employee values(4,'max',2,9000,null);
insert into employee values(5,'jack',2,8000,4);
insert into employee values(6,'king',3,6000,1);
commit;
rollback;
truncate employee;
show tables;
drop table employee;
drop table department;
select * from employee;
select * from department;

select * from authors order by aname asc;
select * from publishers order by pname desc;

select *,sum(salary) as "Employee salary"
from employee
group by dept_id;  

select dept_id,sum(salary) as "Employee Salary"
from employee
where salary > 3000
group by dept_id;

select dept_id,sum(salary) as "Employee Salary"
from employee
group by dept_id
having sum(salary)>6000;

select dept_id,sum(salary) as "Employee Salary"
from employee
group by dept_id
having sum(salary)<20000;