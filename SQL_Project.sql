use data_new1;

-- show all the rows and columns in the table.                                                            1
select * from employee_details;

-- change the table name to employee_details1.                                                            2
alter table employee_details rename to Employee_details1;

-- change the table name back to Employee_details.                                                        3
alter table employee_details1 rename to Employee_details;

-- show only employee name and job title.                                                                 4
select EmployeeName, JobTitle from employee_details;

-- show unique job titles from the table.                                                                 5
select distinct JobTitle from employee_details;

-- show the number of employees in the table.                                                             6
select count(*) from employee_details;

-- show the job title and overtime pay fpr all employees with overtime pay
-- greater than 500000.                                                                                   7
select JobTitle, OvertimePay from employee_details 
where OvertimePay > 50000;

-- show the average basepay for all the employees.                                                        8
select avg(BasePay) from employee_details;

-- show the top 10 highest paid employees.                                                                9
select EmployeeName, TotalPay from employee_details order by TotalPay
desc limit 10;

-- show the average of base pay, overtime pay, other pay of each employee.                               10
select EmployeeName, (BasePay + OvertimePay + OtherPay)/3 as avg_of_bp_ovpay_otpay from employee_details;

-- show all the employees who have the word "Manager" in the job Title.                                  11
select EmployeeName, JobTitle from employee_details
where JobTitle like '%Manager%';

-- show all the employees with the job title not equal to "Manager".                                     12
select EmployeeName, JobTitle from employee_details
where JobTitle != 'Manager';

-- show all the employees with base pay less than 50000
-- or total pay greater than 100000.                                                                     13
select * from employee_details where BasePay < 500000
or TotalPay > 100000;

-- delete column notes from the table.                                                                   14
alter table employee_details drop column Notes;
select * from employee_details;

-- delete name James from the table.                                                                     15
delete from employee_details where EmployeeName = 'James';

-- add name Victor to the table.                                                                         16
insert into employee_details (Id, EmployeeName, JobTitle)
values (1009, 'Victor', 'Senior Manager');
select * from employee_details;

-- update the base pay of all the employees with job title containing
-- "Manager" by increasing it by 10%.                                                                   17
update employee_details set BasePay = Basepay * 1.1
where JobTitle like '%Manager%';

SELECT * FROM employee_details;


alter table other_details
add constraint fk_other_details_employee_details
foreign key(Id)
references employee_details(Id);

-- Joins
-- show all the rows and coulmns from both the tables in a single table.                              18
select * from employee_details join other_details
on employee_details.Id = other_details.Id;

-- show all the employees with job titles who travel frequently.                                      19
select EmployeeName, JobTitle, BusinessTravel from employee_details
join other_details on employee_details.Id= other_details.Id
where BusinessTravel = 'Travel_Frequently';

-- show all the employees with the job titles by grouping them by business travel.                    20
select EmployeeName, JobTitle, BusinessTravel from employee_details
join other_details on employee_details.Id = other_details.Id
group by BusinessTravel;

-- show top 20 employees with their educational field along with their total pay from highest.       21
select EmployeeName, EducationField, TotalPay from employee_details
join other_details on employee_details.Id = other_details.Id
order by TotalPay desc limit 20;

-- show all the employees who are married.                                                           22
select EmployeeName, MaritalStatus from employee_details
join other_details on employee_details.Id = other_details.Id
where MaritalStatus = 'Married';

-- show top 30 employees who travel frequently with the job title amd performance rating.            23
select EmployeeName, BusinessTravel, PerformanceRating from employee_details
join other_details on employee_details.Id = other_details.Id
limit 30;


-- show top 50 employees who are married and whos salary is more than 50000
-- and who travel frequently.                                                                         24
select EmployeeName, MaritalStatus, TotalPay, BusinessTravel from employee_details
join other_details on employee_details.Id = other_details.Id
where TotalPay > 50000 and MaritalStatus= 'Married' and BusinessTravel = 'Travel_Frequently' 
limit 50;

-- show the job title total pay, business travel, education field, marital status,
-- percentage salary hike, performance reating, years at company of david sullivan.                  25
select EmployeeName, JobTitle, TotalPay, BusinessTravel, EducationField, MaritalStatus,
PercentSalaryHike, PerformanceRating, YearsAtCompany from employee_details
join other_details on employee_details.Id= other_details.Id
where EmployeeName = 'david sullivan';


-- show job title, business travel, department, education field of an employee
-- who has highest totalpay.                                                                          26
select EmployeeName, JobTitle, BusinessTravel, Department,
EducationField, max(TotalPay) as TotalPay from employee_details join other_details
 on employee_details.Id = other_details.Id;
 
 -- show all the employees whos education field is life sciences and dept is research & devpt.        27
 select EmployeeName, EducationField, Department from employee_details
 join other_details on employee_details.Id = other_details.Id
 where EducationField = 'Life Sciences' and Department = 'Research & Develpment';
