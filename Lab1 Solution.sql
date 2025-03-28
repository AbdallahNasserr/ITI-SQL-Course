 use Company_SD
 --Display all the employees Data.
 select * from Employee


 -- Display the employee First name, last name, Salary and Department number.

 select Fname, Lname, Salary, Dno from Employee

 -- Display all the projects names, locations and the department which is responsible about it.

 select Pname, Plocation,Dnum from Project

 --If you know that the company policy is to pay an annual commission for 
 --each employee with specific percent equals 10% of his/her annual salary 
 --.Display each employee full name and his annual commission in an ANNUAL COMM column (alias).

 select Fname + ' ' + Lname  as 'Full Name', Salary * 0.1 as 'ANNUAL COMM'
 from Employee

 -- Display the employees Id, name who earns more than 1000 LE monthly.
select SSN, Fname + ' '+ Lname as 'name' from employee where Salary >1000

-- Display the employees Id, name who earns more than 10000 LE annually.
select SSN, Fname + ' '+ Lname as 'name', salary * 12 'Annual Income' from employee 
where  salary * 12 > 10000


-- Display the names and salaries of the female employees 

select Fname + ' ' + Lname as 'Full Name' , salary from Employee
where Sex = 'F'


-- Display each department id, name which managed by a manager with id equals 968574.

select Dnum,dname from Departments
where MGRSSN = 968574

-- Dispaly the ids, names and locations of  the pojects which controled with department 10.

select Pnumber, Pname from Project
where Dnum = 10