-- Cross join Code
select dname, fname 
from employee, Departments

-- Display the Department id, name and id and the name of its manager.

use Company_SD
select dnum, dname, fname 
from departments
inner join Employee
on Departments.MGRSSN = Employee.SSN

-- Display the name of the departments and the name of the projects under its control.

select dname, pname 
from departments
inner join project 
on Departments.Dnum = Project.Dnum

--Display the full data about all the dependence associated with the name of the employee they depend on him/her.

select employee.Fname + ' ' + Employee.Lname as 'Full Name',Dependent.* from Dependent
 inner join Employee
 on Dependent.ESSN = Employee.SSN

-- Display the Id, name and location of the projects in Cairo or Alex city.

 select Pnumber, Pname, Plocation
 from Project
 where Plocation like '%Cairo%' or Plocation like '%Alex%'

-- Display the Projects full data of the projects with a name starts with "a" letter.

 select * from Project where Pname like 'a%'

 -- display all the employees in department 30 whose salary from 1000 to 2000 LE monthly

 select * from Employee where Dno = 30 and Salary between 1000 and 2000

 -- Retrieve the names of all employees in department 10 who works more than or equal10 hours per week on "AL Rabwah" project.
 
 select * from Employee
 inner join Works_for
 on ESSn = SSN
 inner join Project
 on pno = Pnumber
 where dno = 10 
 and Hours = 10 
 and Pname = 'AL Rabwah'

 -- Self Join -> Find the names of the employees who directly supervised with Kamel Mohamed.

 select e1.Fname +' ' + e1.Lname 'Employee Name' , e1.SSN, e1.Superssn,
 e2.Fname +' ' + e2.Lname 'Supervisor Name'  , e2.SSN, e2.Superssn
 from Employee e1
 inner join Employee e2
 on e1.Superssn = e2.SSN
 where e2.Fname +' ' + e2.Lname = 'Kamel Mohamed'


-- Retrieve the names of all employees and the names of the projects they are working on, sorted by the project name.

select Fname + ' ' + Lname as 'Full Name',Pname from Employee
inner join Works_for 
on ESSn = SSN
inner join Project
on pno = Pnumber
order by Pname

-- For each project located in Cairo City , find the project number, the controlling department name ,the department manager last name ,address and birthdate.

select Project.Pnumber,Departments.Dname,Employee.Fname +' ' +
Employee.Lname as 'Manager Name',Employee.Address,
Employee.Bdate
from Project
inner join Departments 
on Project.Dnum = Departments.Dnum
inner join Employee 
on MGRSSN = Employee.SSN
where city = 'Cairo'

-- Display All Data of the mangers

select * from Employee
inner join Departments
on Departments.MGRSSN = Employee.ssn


-- Display All Employees data and the data of their dependents even if they have no dependents

select * from Employee
full outer join dependent 
on Dependent.ESSN = SSN

-- Insert your personal data to the employee table as a
-- new employee in department number 30, SSN = 102672, Superssn = 112233, salary=3000
insert into Employee(Dno, SSN,Superssn,Salary) 
values(30,102672,112233,3000)

/*Insert another employee with personal 
data your friend as new employee in department 
number 30, SSN = 102660, but don’t enter any value 
for salary or manager number to him.*/
insert into Employee(Dno,SSN)
values(30,102660)

update Employee 
set Salary +=0.2*Salary

select * from Employee
