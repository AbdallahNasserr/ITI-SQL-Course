use Company_SD
-- Display (Using Union Function)

select * from Employee e
full outer join Dependent d
on SSN = ESSN
where e.Sex = 'F' and d.Sex = 'F'
union all
select * from Employee e
full outer join Dependent d
on SSN = ESSN
where e.Sex = 'M' and d.Sex = 'M'

-- For each project, list the project name and the total hours per week (for all employees) spent on that project.
select Pname,Hours,Fname+' '+Lname as 'Full Name' from Project
inner join Works_for 
on Pno =  Pnumber
inner join Employee
on ESSn = SSN

-- Display the data of the department which has the smallest employee ID over all employees' ID.
select * from Departments 
where Dnum = (select min(dno) from Employee)

select Departments.Dname,avg(salary),min(salary), max(salary) from Departments
inner join Employee
on dnum = Dno
group by Departments.Dname

select Lname from Departments
inner join Employee
on MGRSSN = SSN
where MGRSSN not in (select Dependent.ESSN from Dependent)

select Dnum, Dname,count(ssn),avg(salary) from Employee
inner join Departments
on Dnum = Dno
group by dnum, dname 
having avg(salary) > (select avg(salary) from Employee)

select Fname+' ' + Lname as 'Full Name', Pname from Employee
inner join Works_for
on Employee.SSN =  Works_for.ESSn
inner join Project 
on Project.Pnumber = Works_for.Pno
order by Dno asc, Lname, Fname

select salary from Employee
where Salary in (select top(2) Salary from Employee order by Salary desc )

select * from Employee
inner join Dependent
on Dependent.ESSN  = Employee.SSN
where Dependent_name like CONCAT('%',Fname,'%')


update Employee
set employee.Salary +=(0.3*Salary)
from Employee
inner join Works_for
on SSN = Works_for.ESSn
inner join Project 
on Project.Pnumber = pno
where Pname = 'Al Rabwah'

select * from Employee
where exists(select ESSN from Dependent where ESSN= SSN)


insert into Departments(Dname,Dnum,MGRSSN,[MGRStart Date])
values('DEPT IT', 100,112233,'1-11-2006')

select * from Employee
select * from Departments

update Employee set dno = 100 
where ssn = 968574

delete from Employee where ssn = 223344
