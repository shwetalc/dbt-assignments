create database whitewalker6;
use whitewalker6;
use whitewalker3;
create table Ord_master(
				 Ord_no	int ,
                 Cust_cd varchar(10),	
                 Status  varchar(10)
			);
insert into Ord_master values(  1 , 'C1' , 'P'); 
create table Ord_dtl(
				 Ord_no	int ,
                 Prod_cd  varchar(10),	
                 Qty int(10)
			);
            
insert into Ord_dtl values(  1  ,	'P1' ,	100); 
insert into Ord_dtl values(  1  ,	'P2' ,	200); 
create table Prod_master(
				 Prod_cd  varchar(10) ,
                 Prod_name  varchar(10),	
                 Qty_in_stock  int(10),
                 Booked_qty int(10)
			);
insert into Prod_master values( 'P1' ,	'Floppies' , 10000	, 1000);  
insert into Prod_master values( 'P2' ,	'Printers' , 5000  	, 600);
insert into Prod_master values( 'P3' ,	'Modems ' , 3000  	, 200);  

-- 1.
delimiter $$
create trigger trig1
before insert
on Ord_dtl
for each row
begin
insert into Prod_master(Booked_qty) values( 300 );
end $$
delimiter ;
insert into Ord_dtl values(  2  ,	'P3' ,	300);
select * from Ord_dtl;
select * from Prod_master;


-- 2. Write a Before Delete trigger on Ord_dtl. Anytime a row is deleted from Ord_dtl, the
-- Booked_qty in Prod_master should be decreased accordingly.
delimiter $$
create trigger trig2
before delete
on Ord_dtl
for each row
begin
update Prod_master set booked_qty=booked_qty-1;
end $$
delimiter ;
delete from Ord_dtl where Ord_dtl.Ord_no=1;

select * from Ord_dtl;
select * from Prod_master;

-- 3. write A trigger to update the total salary of a department in dept_sal  table  when an employee is added or removed from  emp table .
use whitewalker3;
alter table dept
add column dept_sal int;

update dept set DEPT_SAL = 12000 where dno=10;
update dept set DEPT_SAL = 22000 where dno=20;
delimiter %%
create trigger trig11
after delete 
on emp
for each row
begin 
UPDATE dept SET dept_sal=dept_sal - old.sal WHERE dno=OLD.dno;
end %%
delimiter ;

drop trigger trig11;
drop trigger trig12;

delimiter %%
create trigger trig12
after insert 
on emp
for each row
begin 
UPDATE dept SET dept_sal=dept_sal + new.SAL WHERE dno=new.dno;
end %%
delimiter ;

select * from emp;
insert into emp values(1014,  'Pojaa',  'AGeER', 1243 , '2000-02-18' ,6060, 10);
delete from emp where dno=10;

select * from dept;


