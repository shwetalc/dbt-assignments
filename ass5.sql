create database whitewalker3;
use whitewalker3;
/*MySQL Programs (Stored Procedure)
Create table EMP ( EMPNO numeric(4) not null, ENAME varchar(30) not null, JOB varchar(10), MGR numeric(4), HIREDATE date, SAL numeric(7,2), DEPTNO numeric(2) ); 
Insert into EMP (EMPNO ,ENAME, JOB, MGR, HIREDATE, SAL, DNO ) values(1000,  'Manish' , 'SALESMAN', 1003,  '2020-02-18', 600,  30) ;
Insert into EMP (EMPNO ,ENAME, JOB, MGR, HIREDATE, SAL, DNO ) values(1001,  'Manoj' , 'SALESMAN', 1003,  '2018-02-18', 600,  30) ;
Insert into EMP (EMPNO ,ENAME, JOB, MGR, HIREDATE, SAL, DNO ) values(1002 , 'Ashish', 'SALESMAN',1003 , '2013-02-18',  750,  30 );
Insert into EMP (EMPNO ,ENAME, JOB, MGR, HIREDATE, SAL, DNO ) values(1004,  'Rekha', 'ANALYST', 1006 , '2001-02-18', 3000,  10);
Insert into EMP (EMPNO ,ENAME, JOB, MGR, HIREDATE, SAL, DNO ) values(1005 , 'Sachin', 'ANALYST', 1006 ,  '2019-02-18', 3000, 10 );
Insert into EMP (EMPNO ,ENAME, JOB, MGR, HIREDATE, SAL, DNO ) values(1006,  'Pooja',  'MANAGER'  ,     null    , '2000-02-18' ,6000, 10 );

Create table dept (dno numeric(4) not null, dname varchar(10) not null,area varchar(30));
Insert into dept(dno,dname,area) values(10,'Store','Mumbai');
Insert into dept(dno,dname,area) values(20,'Purchase','Mumbai');
Insert into dept(dno,dname,area) values(30,'Store', 'Delhi');
Insert into dept(dno,dname,area) values(40,'Marketing','Pune');
Insert into dept(dno,dname,area) values(50,'Finance','Delhi');
Insert into dept(dno,dname,area) values(60,'Accounts','Mumbai');

1.	Write a Procedure that accepts values of two non-zero numbers using IN parameter and perform addition, subtraction, multiplication, division and print.
2.	Write a Procedure to print the string in REVERSE order. Take the input using IN parameter. (Ex .Database , o/p :esabatad)
3.	Write a Procedure to display top 5 employee based on highest salary and display employee number, employee name and salary.
4.	Write a Procedure to create table emp_test with e_id integer, e_name varchar(10), e_joining_date date as columns
5.	Write a Procedure to add a department row in the DEPT table with the following values for columns
deptno  vaue 60,Dname  value should be  ‘Education’, area value should be Pune. 
6.	Write a program that declares an integer variable called num, assigns a value to it and print, the value of the variable itself, its square, and its cube.
7.	Write a program that declares an integer variable assign a value to it and display it using OUT parameter.
8.	Write a program that demonstrates the usage of IN and OUT parameters.*/

create table emp(empno int(4) not null , ename varchar(30) not null,job varchar(10) ,mgr int(4), hiredate date, sal int(7), dno int(2));
insert into emp values(1000,  'Manish' , 'SALESMAN', 1003,  '2020-02-18', 600,  30);
insert into emp values(1001,  'Manoj' , 'SALESMAN', 1003,  '2018-02-18', 600,  30);
insert into emp values(1002 , 'Ashish', 'SALESMAN',1003 , '2013-02-18',  750,  30);
insert into emp values(1004,  'Rekha', 'ANALYST', 1006 , '2001-02-18', 3000,  10);
insert into emp values(1005 , 'Sachin', 'ANALYST', 1006 , '2019-02-18', 3000, 10);
insert into emp values(1006,  'Pooja',  'MANAGER', null , '2000-02-18' ,6000, 10);
select * from emp;
create table dept (dno int(4) not null, dname varchar(10) not null,area varchar(30));
Insert into dept(dno,dname,area) values(10,'Store','Mumbai');
Insert into dept(dno,dname,area) values(20,'Purchase','Mumbai');
Insert into dept(dno,dname,area) values(30,'Store', 'Delhi');
Insert into dept(dno,dname,area) values(40,'Marketing','Pune');
Insert into dept(dno,dname,area) values(50,'Finance','Delhi');
Insert into dept(dno,dname,area) values(60,'Accounts','Mumbai');
select * from dept;
-- Write a Procedure that accepts values of two non-zero numbers using IN parameter and perform addition, subtraction, multiplication, division and print
delimiter $$
create procedure proc1(in val1 int, in val2 int)
begin
declare addition, subtraction, multiplication  int ;
declare division float ;
set addition = val1 + val2;
set subtraction= val1- val2;
set multiplication= val1 * val2;
set division= val1/val2;
select  addition, subtraction, multiplication, division;
end $$
delimiter ;
call proc1(10,5);
call proc1(11,5);
-- Write a Procedure to print the string in REVERSE order. Take the input using IN parameter. (Ex .Database , o/p :esabatad)

delimiter %%
create procedure proc2(in str varchar(20))
begin
select reverse(str);
end %%
delimiter ;
call proc2('Naman');

-- Write a Procedure to display top 5 employee based on highest salary and display employee number, employee name and salary.
delimiter &&
create procedure proc3(in len int)
begin
select empno,ename,sal from emp order by sal desc limit len;
end &&
delimiter ;
call proc3(5);
 
-- Write a Procedure to create table emp_test with e_id integer, e_name varchar(10), e_joining_date date as columns
delimiter $$
create procedure proc4()
begin
create table emp_test(e_id int,e_name varchar(10),e_joining date);
end $$
delimiter ;
call proc4();
-- Write a Procedure to add a department row in the DEPT table with the following values for columns
-- deptno  vaue 60,Dname  value should be  ‘Education’, area value should be Pune. 
delimiter %%
create procedure proc5()
begin
insert into dept values(60 , 'Education' , 'Pune');
end %%
delimiter ;
call proc5();
-- Write a program that declares an integer variable called num, assigns a value to it and print, the value of the variable itself, its square, and its cube.
delimiter $$
create procedure proc6(in val int)
begin
declare num int default val;
select num;
select num*num;
select num*num*num;
end $$
delimiter ;
call proc6(7);
-- Write a program that declares an integer variable assign a value to it and display it using OUT parameter.
delimiter %%
create procedure proc7(out var int)
begin 
declare var1 int default 12;
set var=var1;
end %%
call proc7(@v);
select @v;
-- Write a program that demonstrates the usage of IN and OUT parameters.
delimiter $$
create procedure proc8(in e1 int,out len int)
begin
select length(ename) into len from emp where empno=e1;
end $$	
delimiter ;
call proc8(1000 , @a1);





delimiter $$
create procedure proce_out  (out var int )
begin 
declare x int default 10 ;
set var = x*x;
end $$

call proce_out(@va);
select @va ;
drop procedure proce_out;



delimiter $$
create procedure Proce_in_out (inout var int)
begin 
declare square int default 10 ;
set var = square;
end $$

call Proce_in_out(@v);
select @v;

 drop procedure proce_in_out;


