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
/*For each department, retrieve the department name and the maximum, minimum and average salary of its employees.
*/
select Departments.Dname,avg(salary),min(salary), max(salary) from Departments
inner join Employee
on dnum = Dno
group by Departments.Dname

/*List the last name of all managers who have no dependents.
*/
select Lname from Departments
inner join Employee
on MGRSSN = SSN
where MGRSSN not in (select Dependent.ESSN from Dependent)

/*For each department-- if its average salary is less than the average salary of all employees-- display its number, name and number of its employees.
*/
select Dnum, Dname,count(ssn),avg(salary) from Employee
inner join Departments
on Dnum = Dno
group by dnum, dname 
having avg(salary) > (select avg(salary) from Employee)


/*Retrieve a list of employees and the projects they are working on ordered by department and within each department, ordered alphabetically by last name, first name.
*/
select Fname+' ' + Lname as 'Full Name', Pname from Employee
inner join Works_for
on Employee.SSN =  Works_for.ESSn
inner join Project 
on Project.Pnumber = Works_for.Pno
order by Dno asc, Lname, Fname

/*Try to get the max 2 salaries using subquery
*/
select salary from Employee
where Salary in (select top(2) Salary from Employee order by Salary desc )

/*Get the full name of employees that is similar to any dependent name
*/
select * from Employee
inner join Dependent
on Dependent.ESSN  = Employee.SSN
where Dependent_name like CONCAT('%',Fname,'%')

/*Try to update all salaries of employees who work in Project ‘Al Rabwah’ by 30% 
*/
update Employee
set employee.Salary +=(0.3*Salary)
from Employee
inner join Works_for
on SSN = Works_for.ESSn
inner join Project 
on Project.Pnumber = pno
where Pname = 'Al Rabwah'

/*Display the employee number and name if at least one of them have dependents (use exists keyword) self-study.
*/
select * from Employee
where exists(select ESSN from Dependent where ESSN= SSN)

/*In the department table insert new department called "DEPT IT" , with id 100, employee with SSN = 112233 as a manager for this department. The start date for this manager is '1-11-2006'*/
insert into Departments(Dname,Dnum,MGRSSN,[MGRStart Date])
values('DEPT IT', 100,112233,'1-11-2006')


select * from Employee
select * from Departments

update Employee set dno = 100 
where ssn = 968574

delete from Employee where ssn = 223344
