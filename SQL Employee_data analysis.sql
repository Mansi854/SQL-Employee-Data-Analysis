create database Employee_dataset;
use Employee_dataset;
SELECT * FROM Employee_data;

--This query fetches average tenure of employees in the company.
   SELECT AVG(years_at_company) 
   AS avg_tenure FROM employee_data;

--This query fetches the average employee satisfaction department wise.
  SELECT department, 
  AVG(job_satisfaction) AS Satisfaction_count 
  FROM employee_data 
  GROUP BY department;

--This query fetches the average job satisfaction of employees who have been with the company for over 5 years.
  SELECT AVG(job_satisfaction) 
  AS Satisfaction_count 
  FROM employee_data 
  WHERE years_at_company>5;

--This query fetches the average monthly income by job role and department.
  SELECT job_role, department, 
  AVG(monthly_income) AS Avg_income 
  FROM employee_data 
  GROUP BY job_role, 
  department 
  ORDER BY department, job_role ASC;

--This query fetches the average number of training hours completed by employees across different departments.
  SELECT department, 
  AVG(training_hours) 
  AS Avg_hours 
  FROM employee_data 
  GROUP BY department;

--This query fetches the number of employees who have completed 5 years in the company.
  SELECT COUNT(employee_id) 
  AS Emp_Tenure 
  FROM employee_data 
  WHERE years_at_company>=5;

--This query fetches the number of employees have not attended any training in their tenure.
  SELECT COUNT(employee_id) 
  AS Training_data 
  FROM employee_data 
  WHERE Training_Hours IS NULL;

--This query fetches the the average monthly income for both male and female employees.
  SELECT gender, 
  AVG(monthly_income) 
  AS avg_monthly_income
  FROM employee_data
  GROUP BY gender;

--This query shows the distribution of employees based on gender, job role, and department.
  SELECT gender,job_role, department, 
  COUNT(employee_id) AS Emp_count 
  FROM employee_data 
  GROUP BY gender, job_role, department
  ORDER BY gender, job_role ASC;

--This query shows the number of employees whose age varies between 18 to 50.
  SELECT COUNT(*) AS Emp_age 
  FROM employee_data 
  WHERE age BETWEEN 18 AND 50;

--This query shows the highest and lowest salary paid to employees.
  SELECT MAX(monthly_income) 
  AS High_salary, 
  MIN(monthly_income) 
  AS Low_salary 
  FROM employee_data;

--This query shows the 2nd highest salary of employee along with job role and department.
  SELECT MAX(monthly_income) 
  FROM employee_data 
  WHERE monthly_income <
  (SELECT MAX(monthly_income) FROM employee_data);

--This query fetches the data of employees who live the furthest from office location
  SELECT * FROM employee_data 
  WHERE distance_from_home =
  (SELECT MAX(distance_from_home) FROM employee_data);

--This query updates the salary of employees who have completed 10 years in the company.
  UPDATE employee_data 
  SET monthly_income=monthly_income*1.10 
  WHERE years_at_company=10;

--This query fetches the total salary paid to employees department wise.
  SELECT department, SUM(monthly_income)
  AS Total_salary
  FROM employee_data
  GROUP BY department
  ORDER BY department ASC;

--This query counts the number of employees who have worked overtime.
  SELECT COUNT(employee_id)
  AS Overtime_data
  FROM employee_data
  WHERE overtime='Yes';

--This query shows the number of employees promoted in the last year.
  SELECT COUNT(employee_id)
  AS Promotion_data
  FROM employee_data
  WHERE years_since_last_promotion <= 1;

--This query shows the number of employees who have the lowest rating in work environment satisfaction and job satisfaction.
  SELECT COUNT(employee_id)
  AS Data
  FROM employee_data
  WHERE work_environment_satisfaction =1
  and job_satisfaction =1;

--This query puts a trigger if somebody tries to add details in the dataset.
--It can help in data validation.
  CREATE TRIGGER NO_DATA
  ON 
  employee_data
  AFTER INSERT
  AS
  BEGIN
  PRINT 'DATA CANNOT BE ADDED'
  ROLLBACK TRANSACTION;
  END;


  

  






