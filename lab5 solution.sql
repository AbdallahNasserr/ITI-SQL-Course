select * from Employee
select top(3) * from Employee
order by NEWID()

select * from [LAPTOP-25K9EGUS\SQLEXPRESS].company_sd.dbo.employee

use Company_SD
select  * from employee

update Employee
set Salary = 
	case 
	when Salary >2000 then Salary+500
	else Salary +250
	end 

select * from Employee


select CONVERT(varchar(20),getdate(),1)
select CONVERT(varchar(20),getdate(),2)
select CONVERT(varchar(20),getdate(),3)
/*Notes:
Restore ITI and adventureworks2012 DBs to Server
*/

--Use ITI DB
use ITI
select * from student
where st_age is not null

-- Get all instructors Names without repetition
select Ins_Name from Instructor

--Display student with the following Format (use isNull function)
/*
Student ID Student Full Name Department name
*/
select St_Id, St_Fname+' ' + St_Lname as 'Full Name' , Dept_Name from Student
inner join Department
on Department.Dept_Id = Student.Dept_Id


/*
Display instructor Name and Department Name 

Note: display all the instructors if they are attached to a department or not
*/

select * from Instructor i
left join Department d 
on i.Dept_Id = d.Dept_Id

/*Display student full name and the name of the course he is taking
For only courses which have a grade  
*/
select St_Fname+' ' + St_Lname as 'Full Name' ,Crs_Name from student
inner join Stud_Course
on Stud_Course.St_Id = Student.St_Id
inner join Course
on Stud_Course.Crs_Id = Course.Crs_Id
where grade is not null

--Display number of courses for each topic name

select Top_Name,count(crs_id) as 'Number of Courses' from topic
inner join Course
on Topic.Top_Id = Course.Top_Id
group by Top_Name 

--Display max and min salary for instructors
select max(salary),min(salary) from instructor

--Display instructors who have salaries less than the average salary of all instructors.
select * from Instructor
where Salary < (select avg(salary) from Instructor)

--Display the Department name that contains the instructor who receives the minimum salary.
select Dept_Name,min(salary) from Instructor
inner join Department
on Instructor.Dept_Id = Department.Dept_Id
group by Dept_Name

--Select max two salaries in instructor table. 
select top(2) with ties *, rank()over(order by salary desc) as'Max two salaries' from Instructor
order by Salary desc

--Select Average Salary for instructors 
select avg(salary) from Instructor

-- Select Student first name and the data of his supervisor 
select St_Fname,Dept_Manager from Student
inner join Department
on Student.Dept_Id = Department.Dept_Id

-- Write a query to select the highest two salaries in Each Department for instructors who have salaries. “using one of Ranking Functions”
select * from (
select *, rank() over(partition by dept_id order by salary desc ) as 'top_salaries' from Instructor) as top_ins
where  top_salaries <=2
order by Dept_Id

-- Write a query to select a random  student from each department.  “using one of Ranking Functions”

select top(1) * from Student
order by newid()
