use sd 
select * from Employee
insert into Employee (SSN, First, Last)
values(3, 'Abdallah','Nasser')

update Employee
set Bdate  = '7/21/2003' 
where SSN = 3

select * from Employee

create table emp(
eid  int primary key, 
SSN int, 
Bdate date default getdate(),
gender varchar(1) default 'M',
first varchar(20)
)

alter table emp alter column gender varchar(2)

alter table emp add age int

select * from emp

alter table emp drop column first

select * from emp
