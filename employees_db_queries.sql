# SELECT statement illustration
SELECT 
    dept_no
FROM
    departments;
    
SELECT 
    *
FROM
    departments;

# WHERE statement illustration

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Elvis';
    
# Logical AND operator illustration

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Kellie' AND gender = 'F';
    
# Logical OR operator illustration

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Kellie'
        OR first_name = 'Aruna';
        
# Operator Precedence illustration

SELECT 
    *
FROM
    employees
WHERE
    gender = 'F'
        AND (first_name = 'Kellie'
        OR first_name = 'Aruna');
        
# IN and NOT IN operator illustration

SELECT 
    *
FROM
    employees
WHERE
    first_name IN ('Denis' , 'Elvis');

# NOT IN operator Illustration

SELECT 
    *
FROM
    employees
WHERE
    first_name NOT IN ('John' , 'Mark', 'Jacob');
    
# LIKE and NOT LIKE Operator

SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('Mark%');
    
SELECT 
    *
FROM
    employees
WHERE
    hire_date LIKE ('%2000%');
    

SELECT 
    *
FROM
    employees
WHERE
    emp_no LIKE ('1000_');
    
    
# Wildcard character illustration

SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('%Jack%');
    

SELECT 
    *
FROM
    employees
WHERE
    first_name NOT LIKE ('%Jack%');
    

# BETWEEN .....AND Illustration
SELECT 
    *
FROM
    salaries;
    
SELECT 
    *
FROM
    salaries
WHERE
    salary BETWEEN 66000 AND 70000;
    

SELECT 
    *
FROM
    salaries
WHERE
    emp_no NOT BETWEEN 10004 AND 10012;
    

select * from departments;

SELECT 
    dept_name
FROM
    departments
WHERE
    dept_no BETWEEN 'd003' AND 'd006';


# IS NOT NULL illustartion

SELECT 
    dept_name
FROM
    departments
WHERE
    dept_no IS NOT NULL;
    
# Other comparison operator illustration
select * from employees;
# Retrieve a list with data about all female employees who were hired in the year 2000 or after.
SELECT 
    *
FROM
    employees
WHERE
    gender = 'F'
        AND (hire_date >= '2000-01-01');

select * from salaries;

SELECT 
    *
FROM
    salaries
WHERE
    salary > 150000;


# SELECT DISTINCT illustration

SELECT DISTINCT
    hire_date
FROM
    employees;
    
 # Agggregate function COUNT()    
 # How many annual contracts with a value higher than or equal to $100,000 have been registered in the salaries table?   
SELECT 
    COUNT(*)
FROM
    salaries
WHERE
    salary >= 100000;


# How many managers do we have in the “employees” database? Use the star symbol (*) in your code to solve this exercise.

select * from dept_manager;

SELECT 
    COUNT(*)
FROM
    dept_manager;
    
    
USE employees;

# ORDER BY Illustration
SELECT 
    *
FROM
    employees
ORDER by hire_date DESC;

# Using Aliases and Group by Illustration

SELECT 
    *
FROM
    salaries;

SELECT 
    salary, COUNT(salary) AS emps_with_same_salary
FROM
    salaries
WHERE
    salary > 80000
GROUP BY salary
ORDER BY salary;

# Having clause illustration

SELECT 
    emp_no, AVG(salary) AS average_salary
FROM
    salaries
GROUP BY emp_no
HAVING AVG(salary) > 120000
ORDER BY emp_no;


-- comparison
SELECT
    *, AVG(salary)
FROM
    salaries
WHERE
    salary > 120000
GROUP BY emp_no
ORDER BY emp_no;

# USing WHERE And HAVING Together
SELECT 
    *
FROM
    dept_emp;
-- 
SELECT 
    emp_no, COUNT(emp_no) AS number_of_emp
FROM
    dept_emp
WHERE
    from_date > '2000-01-01'
GROUP BY emp_no
HAVING COUNT(emp_no) > 1
ORDER BY emp_no;

--

SELECT

    emp_no

FROM

    dept_emp

WHERE

    from_date > '2000-01-01'

GROUP BY emp_no

HAVING COUNT(from_date) > 1

ORDER BY emp_no;

# Limit clause Illustration 

SELECT 
    *
FROM
    dept_emp
LIMIT 100;

# INSERT Statement illustration

SELECT 
    *
FROM
    employees
ORDER BY emp_no DESC
LIMIT 10;

insert into employees
(
emp_no, 
birth_date, 
first_name, 
last_name,
gender, 
hire_date
) 
values
(
999903, 
'1993-09-11',
 'Jonathan', 
 'Creek', 
 'M', 
 '1999-01-01'
 );
 
 SELECT 
    *
FROM
    titles
    order by emp_no desc
    limit 10;
 
 insert into titles
 (
  emp_no,
  title,
  from_date
  )
  values
  (999903,
  'Senior Engineer', 
  '1997-01-01'
  );
 
 # INSERT Illustration 2
 SELECT 
    *
FROM
    dept_emp
    ORDER BY emp_no desc;
    
INSERT INTO dept_emp 
VALUES
(
999903,
'd005', 
'1997-01-01', 
'9999-01-01'
);


# INSERT INTO SELECT statement
select * from departments;

INSERT INTO departments
VALUES
( 
'd010', 
'Business Analysis'
);

# UPDATE statement
/* UPDATE employees SET emp_no = 999901, first_name = 'Smith' WHERE last_name = 'John' (Example)*/

select * from departments;

UPDATE departments
SET dept_name = 'Data Analysis'
WHERE dept_no = 'd010';

# COMMIT and ROLLBACK Illustration
# When you wnat to do any changes in your dataset, always commit the status of your database before peforming the chnages in case you made a mistake

USE employees;

COMMIT;

# Delete a record from the employee table and see. 

DELETE FROM employees 
WHERE
    emp_no = 999903;
    
# To undo the delete operation you performed, use ROLLBACK statement!

rollback;

# DELETE statement Illustration
select * from departments;

DELETE FROM departments 
WHERE
    dept_no = 'd010';
    

# AGGREGATE FUNCTION Illustration

# How many departments are there in the “employees” database? Use the ‘dept_emp’ table to answer the question.

select * from dept_emp;

SELECT 
    COUNT(DISTINCT dept_no)
FROM
    dept_emp;
    
# SUM() function Illustration 
SELECT 
    *
FROM
    salaries;
    
# What is the total amount of money spent on salaries for all contracts starting after the 1st of January 1997?

SELECT 
    SUM(salary)
FROM
    salaries
WHERE
    from_date > '1997-01-01';
    

# MAX() & MIN() function Illustration
SELECT 
    *
FROM
    employees;
    
# 1. Which is the lowest employee number in the database?
SELECT 
    MIN(emp_no)
FROM
    employees;

# 2. Which is the highest employee number in the database?
SELECT 
    MAX(emp_no)
FROM
    employees;
    
# AVG() function Illustration

# What is the average annual salary paid to employees who started after the 1st of January 1997?

SELECT 
    AVG(salary) AS average_salary
FROM
    salaries
WHERE
    from_date > '1997-01-01';
    
# ROUND() function Illustartion

# Round the average amount of money spent on salaries for all contracts that started after the 1st of January 1997 to a precision of cents.
SELECT 
    ROUND(AVG(salary),2) AS average_salary
FROM
    salaries
WHERE
    from_date > '1997-01-01';
    
# COALESCE() function Illustration

SELECT

    dept_no,

    dept_name,

    COALESCE(dept_no, dept_name) AS dept_info

FROM

    departments_dup

ORDER BY dept_no ASC;

# COALESCE() and IFNULL() functions Illustration

SELECT

    IFNULL(dept_no, 'N/A') as dept_no,

    IFNULL(dept_name,

            'Department name not provided') AS dept_name,

    COALESCE(dept_no, dept_name) AS dept_info

FROM

    departments_dup

ORDER BY dept_no ASC;


-- ***********************************************************************

use employees;

Select * from departments;
-- Creatind departments duplicate table from departments table.
CREATE TABLE dept_duplicate (
    dept_no CHAR(4),
    dept_name VARCHAR(40)
) SELECT * FROM
    departments;
    
select * from dept_duplicate;


-- ***********************************************************************

-- START OF SQL JOINS CODE

insert into dept_duplicate
(
dept_name
) 
values
(
"Public Relation"
);

-- DELETE REcord relate to dept no 2
commit; 

DELETE FROM dept_duplicate 
WHERE
    dept_no = 'd002';
    
INSERT INTO dept_duplicate(dept_no) VALUES ('d010'), ('d011');

-- Create and fill in the ‘dept_manager_dup’ table, using the following code:



DROP TABLE IF EXISTS dept_manager_dup;

CREATE TABLE dept_manager_dup (

  emp_no int(11) NOT NULL,

  dept_no char(4) NULL,

  from_date date NOT NULL,

  to_date date NULL

  );

 

INSERT INTO dept_manager_dup

select * from dept_manager;

 

INSERT INTO dept_manager_dup (emp_no, from_date)

VALUES                (999904, '2017-01-01'),

                                (999905, '2017-01-01'),

                               (999906, '2017-01-01'),

                               (999907, '2017-01-01');

 

DELETE FROM dept_manager_dup

WHERE

    dept_no = 'd001';

INSERT INTO departments_dup (dept_name)

VALUES                ('Public Relations');

 

DELETE FROM dept_duplicate

WHERE

    dept_no = 'd002';

# INNER JOIN Illustration

SELECT 
    *
FROM
    dept_duplicate
ORDER BY dept_no;


SELECT 
    *
FROM
    dept_manager_dup
ORDER BY dept_no;

-- Performing the INNER JOIN
SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        INNER JOIN
    dept_duplicate d ON m.dept_no = d.dept_no
    order by m.dept_no;

# INNER JOIN Exercises

# Extract a list containing information about all managers’ employee number, first and last name, department number, and hire date. 

select * from dept_manager;

select * from employees;

SELECT 
    m.emp_no, m.dept_no, e.first_name, e.last_name, e.hire_date
FROM
    dept_manager m
        INNER JOIN
    employees e ON m.emp_no = e.emp_no
ORDER BY emp_no;


-- Another code for example above

SELECT

    e.emp_no,

    e.first_name,

    e.last_name,

    dm.dept_no,

    e.hire_date

FROM

    employees e

        JOIN

    dept_manager dm ON e.emp_no = dm.emp_no;
    
# LEFT JOIN Illustration

/* Join the 'employees' and the 'dept_manager' tables to return a subset of all the employees 
whose last name is Markovitch. See if the output contains a manager with that name.   */

SELECT 
    e.emp_no, e.first_name, e.last_name, m.dept_no, m.from_date
FROM
    employees e
        LEFT JOIN
    dept_manager m ON e.emp_no = m.emp_no
WHERE
    last_name = 'Markovitch'
ORDER BY dept_no DESC, emp_no;

# OLD syntax of JOIN using WHERE clause

/* Extract a list containing information about all managers’ 
employee number, first and last name, department number, and hire date.
 Use the old type of join syntax to obtain the result.*/
 
 SELECT 
    e.emp_no, e.first_name, e.last_name, m.dept_no, e.hire_date
FROM
    employees e,
    dept_manager m
WHERE
    e.emp_no = m.emp_no;
    
# FOR RECOONFIGURE PURPOSE

set @@global.sql_mode := replace(@@global.sql_mode, 'ONLY_FULL_GROUP_BY', '');


# JOIN and WHERE Used Together - exercise

/* Select the first and last name, the hire date, and the job title of 
all employees whose first name is “Margareta” and have the last name “Markovitch”.*/

SELECT 
    e.first_name, e.last_name, e.hire_date, t.title
FROM
    employees e
        JOIN
    titles t ON e.emp_no = t.emp_no
WHERE
    first_name = 'Margareta'
        AND last_name = 'Markovitch'
        ORDER BY e.emp_no;
        
# CROSS JOIN - exercise 1
select * from departments;
/* Use a CROSS JOIN to return a list with all possible combinations
 between managers from the dept_manager table and department number 9. */
 
 SELECT 
    dm.*, d.*
FROM
    dept_manager dm
        CROSS JOIN
    departments d
WHERE d.dept_no = 'd009'
order by d.dept_no;
 
 -- Another CODE 
 
 SELECT
    dm.*, d.*  
FROM  
    departments d  
        CROSS JOIN  
    dept_manager dm  
WHERE  
    d.dept_no = 'd009'  
ORDER BY d.dept_no;

# CROSS JOIN - exercise 2
/* Return a list with the first 10 employees with all the departments they can be assigned to.*/

SELECT
    e.*, d.*
FROM
    employees e
        CROSS JOIN
    departments d
WHERE
    e.emp_no < 10011
ORDER BY e.emp_no, d.dept_name;


# Join more than two tables in SQL - exercise

/* Select all managers’ first and last name, hire date, job title, start date, and department name.*/

SELECT
    e.first_name,
    e.last_name,
    e.hire_date,
    t.title,
    m.from_date,
    d.dept_name
FROM
    employees e
        JOIN
    dept_manager m ON e.emp_no = m.emp_no
        JOIN
    departments d ON m.dept_no = d.dept_no
        JOIN
    titles t ON e.emp_no = t.emp_no
WHERE t.title = 'Manager'
ORDER BY e.emp_no;

# Another Code for above question

SELECT

    e.first_name,

    e.last_name,

    e.hire_date,

    t.title,

    m.from_date,

    d.dept_name

FROM

    employees e

        JOIN

    dept_manager m ON e.emp_no = m.emp_no

        JOIN

    departments d ON m.dept_no = d.dept_no

        JOIN

    titles t ON e.emp_no = t.emp_no

            AND m.from_date = t.from_date

ORDER BY e.emp_no;

# How many male and how many female managers do we have in the ‘employees’ database?


SELECT 
    e.gender, COUNT(dm.emp_no) AS gender_count
FROM
    dept_manager dm
        JOIN
    employees e ON dm.emp_no = e.emp_no
GROUP BY e.gender;

# UNION and UNION ALL Illustration

DROP TABLE IF EXISTS employees_dup;

CREATE TABLE employees_dup (
  emp_no int(11),
  birth_date date,
  first_name varchar(14),
  last_name varchar(16),
  gender enum('M','F'),
  hire_date date
);

-- Insert data into the employees_dup table
INSERT INTO employees_dup 
select 
e.* 
from employees e
limit 20;

-- View the data
select * from employees_dup;

-- Insert Duplicate value into employee_dup

INSERT INTO employees_dup value(10001, '1953-09-02', 'Georgi', 'Facello', 'M', '1986-06-26');

select * from employees_dup;

-- UNION ALL code

SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    NULL AS dept_no,
    NULL AS from_date
FROM
    employees_dup e
WHERE
    e.emp_no = 10001 
UNION ALL SELECT 
    NULL AS emp_no,
    NULL AS first_name,
    NULL AS last_name,
    m.dept_no,
    m.from_date
FROM
    dept_manager m; 
    
    
-- UNION code

SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    NULL AS dept_no,
    NULL AS from_date
FROM
    employees_dup e
WHERE
    e.emp_no = 10001 
UNION SELECT 
    NULL AS emp_no,
    NULL AS first_name,
    NULL AS last_name,
    m.dept_no,
    m.from_date
FROM
    dept_manager m; 
    
    
-- UNION vs UNION ALL - solution

SELECT 
    *
FROM
    (SELECT 
        e.emp_no,
            e.first_name,
            e.last_name,
            NULL AS dept_no,
            NULL AS from_date
    FROM
        employees e
    WHERE
        last_name = 'Denis' UNION SELECT 
        NULL AS emp_no,
            NULL AS first_name,
            NULL AS last_name,
            dm.dept_no,
            dm.from_date
    FROM
        dept_manager dm) AS a
ORDER BY - a.emp_no DESC;

# SUBQUERIES Illustration

-- SELECT THE DEPARTMENT MANGER NAMES

SELECT 
    e.first_name, e.last_name
FROM
    employees e
WHERE
    e.emp_no IN (SELECT 
            dm.emp_no
        FROM
            dept_manager dm);
            
# Extract the information about all department managers who were hired between the 1st of January 1990 and the 1st of January 1995.

SELECT 
    dm.*
FROM
    dept_manager dm
WHERE
    dm.emp_no IN (SELECT 
            e.emp_no
        FROM
            employees e
        WHERE
            hire_date BETWEEN '1990-01-01' AND '1995-01-01');
            

-- ANOTHER CODE

SELECT
    *
FROM
    dept_manager
WHERE
    emp_no IN (SELECT
            emp_no
        FROM
            employees
        WHERE
            hire_date BETWEEN '1990-01-01' AND '1995-01-01');
            
# EXISTS clause Illustration

SELECT 
    e.last_name
FROM
    employees e
WHERE
    EXISTS( SELECT 
            *
        FROM
            dept_manager dm
        WHERE
            dm.emp_no = e.emp_no)
ORDER BY emp_no;

# Select the entire information for all employees whose job title is “Assistant Engineer”. 

SELECT 
    *
FROM
    employees e
WHERE
    EXISTS( SELECT 
            *
        FROM
            titles t
        WHERE
            t.emp_no = e.emp_no
                AND title = 'Assistant Engineer')
ORDER BY emp_no;

# SQL SUBQUERIES NESTED IN SELECT & FROM

SELECT 
    A.*
FROM
    (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110022) AS manager_Id
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no <= 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS A 
UNION SELECT 
    B.*
FROM
    (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110039) AS manager_Id
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no > 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no
    LIMIT 20) AS B;
    
    
# EXERCISES 

DROP table if exists emp_manager;

CREATE TABLE emp_manager
( 
emp_no int(11) not null,
dept_no char(4),
manager_no int(11) not null
 );
 
 -- INSERT INTO emp_manager 
 INSERT INTO emp_manager
SELECT 
    u.*
FROM
    (SELECT 
        a.*
    FROM
        (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110022) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no <= 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS a UNION SELECT 
        b.*
    FROM
        (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110039) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no > 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no
    LIMIT 20) AS b UNION SELECT 
        c.*
    FROM
        (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110039) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no = 110022
    GROUP BY e.emp_no) AS c UNION SELECT 
        d.*
    FROM
        (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110022) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no = 110039
    GROUP BY e.emp_no) AS d) as u;
    
    select * from emp_manager;
    
# SELF JOIN

SELECT DISTINCT
    e1.*
FROM
    emp_manager e1
        JOIN
    emp_manager e2 ON e1.emp_no = e2.manager_no;
    
    
-- Another approach

SELECT DISTINCT
    e1.*
FROM
    emp_manager e1
        JOIN
    emp_manager e2 ON e1.emp_no = e2.manager_no
WHERE
    e2.emp_no IN (SELECT 
            manager_no
        FROM
            emp_manager); 

    
# VIEWS IN SQL

# Create a view that will extract the average salary of all managers registered in the database. Round this value to the nearest cent.

CREATE OR REPLACE VIEW v_manager_avg_salary AS
    SELECT 
        ROUND(AVG(salary), 2)
    FROM
        salaries s
            JOIN
        dept_manager m ON s.emp_no = m.emp_no;



-- ************************************************************************************************
        
# STORE ROUTINES: These are SQL statement that can be stored on the Database server. 

DROP PROCEDURE if exists select_employees;

DELIMITER $$
CREATE PROCEDURE select_employees()
BEGIN
SELECT * FROM employees limit 1000;
END $$
DELIMITER ;

# To run the procedure

call employees.select_employees();



# Create a procedure that will provide the average salary of all employees.


drop procedure if exists avg_salary;

DELIMITER $$
CREATE PROCEDURE avg_salary()
begin
	select avg(salary) as average_salary from salaries;
end $$
delimiter ;

-- Call the created procedure
CALL avg_salary();

use employees;

select * from salaries;

# STORED PROCEDURE WITH IN PARAMETER
DROP PROCEDURE IF EXISTS emp_salary;

DELIMITER $$
CREATE PROCEDURE emp_salary(IN p_emp_no INTEGER)
BEGIN
	SELECT e.first_name, e.last_name, s.salary, s.from_date, s.to_date
	from 
    employees e
    join
    salaries s on e.emp_no = s.emp_no 
    where e.emp_no = p_emp_no;
END $$
DELIMITER ;


# STORED PROCEEDURE FOR AGGREGATE FUNCTION
DROP PROCEDURE IF EXISTS emp_Average_salary;

DELIMITER $$
CREATE PROCEDURE emp_Average_salary(IN p_emp_no INTEGER)
BEGIN
	SELECT e.first_name, e.last_name, ROUND(AVG(s.salary),2) AS Average_sal
	from 
    employees e
    join
    salaries s on e.emp_no = s.emp_no 
    where e.emp_no = p_emp_no;
END $$
DELIMITER ;

-- CALL IT
call emp_Average_salary(11300);


# STORED PROCEDURE WITH AN OUTPUT PARAMETER

DROP PROCEDURE IF EXISTS avg_salary;

DELIMITER $$
CREATE PROCEDURE avg_salary(IN p_emp_no INTEGER, OUT p_avg_salary DECIMAL(10,2))
BEGIN
	SELECT AVG(salary) INTO p_avg_salary 
    FROM employees e 
    JOIN 
    salaries s ON e.emp_no = s.emp_no 
    WHERE e.emp_no = p_emp_no;
END $$
DELIMITER ;

# Create a procedure called ‘emp_info’ that uses as parameters the first and the last name of an individual, and returns their employee number.

DROP PROCEDURE IF EXISTS emp_info;
DELIMITER $$
CREATE PROCEDURE emp_info(IN p_f_name VARCHAR(255), IN p_l_name VARCHAR(255), OUT p_emp_no INTEGER)
BEGIN
	SELECT e.emp_no INTO p_emp_no
    FROM employees e
    WHERE e.first_name = p_f_name AND e.last_name = p_l_name;
END $$
DELIMITER ;

-- CALL the created procedure

select * from employees;

-- Another code
DELIMITER $$
CREATE PROCEDURE emp_info(in p_first_name varchar(255), in p_last_name varchar(255), out p_emp_no integer)
BEGIN
                SELECT
                                e.emp_no
                INTO p_emp_no FROM
                                employees e
                WHERE
                                e.first_name = p_first_name

                                                AND e.last_name = p_last_name;
END$$

DELIMITER ;


# VARIABLE CREATION IN MYSQL

# Create a variable, called ‘v_emp_no’, where you will store the output of the procedure you created in the last exercise.

# Call the same procedure, inserting the values ‘Aruna’ and ‘Journel’ as a first and last name respectively.

SET @v_emp_no = 0;
CALL employees.emp_info('Aruna', 'Journel', @v_emp_no);
SELECT @v_emp_no;


# USER-DEFINED FUNCTIONS Illustration

DROP FUNCTION if exists f_emp_avg_salary;

DELIMITER $$
CREATE FUNCTION f_emp_avg_salary(p_emp_no INTEGER) RETURNs DECIMAL(10,2)
NO SQL
BEGIN
DECLARE v_avg_salary DECIMAL(10,2);
SELECT 
    AVG(salary)
INTO v_avg_salary FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    e.emp_no = p_emp_no;
RETURN v_avg_salary;
END$$
DELIMITER ;

# Call back the function

SELECT f_emp_avg_salary(11300);

select * from employees;

# USE DEFINED FUNCTION EXERCISE 

/* Create a function called ‘emp_info’ that takes for parameters the first and last name of an employee, 
and returns the salary from the newest contract of that employee. */

DROP FUNCTION IF EXISTS emp_info;

DELIMITER $$
CREATE FUNCTION emp_info(p_first_name varchar(255), p_last_name varchar(255)) RETURNS decimal(10,2)

DETERMINISTIC NO SQL READS SQL DATA
BEGIN
	DECLARE v_max_from_date date;
    DECLARE v_salary decimal(10,2);
SELECT 
    MAX(from_date)
INTO v_max_from_date FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    e.first_name = p_first_name
        AND e.last_name = p_last_name;
        
SELECT 
    s.salary
INTO v_salary FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    e.first_name = p_first_name
        AND e.last_name = p_last_name
        AND s.from_date = v_max_from_date;
                RETURN v_salary;
END$$
DELIMITER ;

SELECT EMP_INFO('Aruna', 'Journel');


# MySQl TRIGGERS

/* Create a trigger that checks if the hire date of an employee is higher than the current date.
 If true, set this date to be the current date. Format the output appropriately (YY-MM-DD). */
 
 DELIMITER $$

CREATE TRIGGER trig_hire_date  

BEFORE INSERT ON employees

FOR EACH ROW  

BEGIN  

                IF NEW.hire_date > date_format(sysdate(), '%Y-%m-%d') THEN     

                                SET NEW.hire_date = date_format(sysdate(), '%Y-%m-%d');     

                END IF;  

END $$  

DELIMITER ;  

   

INSERT employees VALUES ('999904', '1970-01-31', 'John', 'Johnson', 'M', '2025-01-01');  

SELECT  

    *  

FROM  

    employees

ORDER BY emp_no DESC;

# INDEX CREATION

CREATE INDEX i_hired_date ON employees(hire_date);

# To Drop the Index
Alter table employees
drop index i_hired_date;


/* Select all records from the ‘salaries’ table of people whose salary is higher than $89,000 per annum.

Then, create an index on the ‘salary’ column of that table, and check if it has sped up the search of the same SELECT statement. */

SELECT 
    *
FROM
    salaries
WHERE
    salary > 89000;
    
CREATE INDEX i_salary ON salaries(salary);

select * from dept_manager;

/* Similar to the exercises done in the lecture, obtain a result set containing the employee number, first name,
 and last name of all employees with a number higher than 109990. Create a fourth column in the query, indicating whether 
this employee is also a manager, according to the data provided in the dept_manager table, or a regular employe*/
    
    
SELECT
    e.emp_no,
    e.first_name,
    e.last_name,
    CASE
        WHEN dm.emp_no IS NOT NULL THEN 'Manager'
        ELSE 'Employee'
    END AS is_manager
FROM
    employees e
        LEFT JOIN
    dept_manager dm ON dm.emp_no = e.emp_no
WHERE
    e.emp_no > 109990;
    
/*Extract a dataset containing the following information about 
the managers: employee number, first name, and last name. Add two columns at the end – one showing the 
difference between the maximum and minimum salary of that employee, and another one saying whether 
this salary raise was higher than $30,000 or NOT.*/


SELECT 
    dm.emp_no,
    e.first_name,
    e.last_name,
    MAX(s.salary) - MIN(s.salary) AS salary_difference,
    CASE
        WHEN MAX(s.salary) - MIN(s.salary) > 30000 THEN 'Salary was raised by more then $30,000'
        ELSE 'Salary was NOT raised by more then $30,000'
    END AS salary_raise
FROM
    dept_manager dm
        JOIN
    employees e ON e.emp_no = dm.emp_no
        JOIN
    salaries s ON s.emp_no = dm.emp_no
GROUP BY s.emp_no;

   

SELECT 
    dm.emp_no,
    e.first_name,
    e.last_name,
    MAX(s.salary) - MIN(s.salary) AS salary_difference,
    IF(MAX(s.salary) - MIN(s.salary) > 30000,
        'Salary was raised by more then $30,000',
        'Salary was NOT raised by more then $30,000') AS salary_increase
FROM
    dept_manager dm
        JOIN
    employees e ON e.emp_no = dm.emp_no
        JOIN
    salaries s ON s.emp_no = dm.emp_no
GROUP BY s.emp_no;


/* Extract the employee number, first name, and last name of the first 100 employees, and add a fourth column, called “current_employee” 
saying “Is still employed” if the employee is still working in the company, or “Not an employee anymore” if they aren’t.*/

SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    CASE
        WHEN MAX(de.to_date) > SYSDATE() THEN 'Is still employed'
        ELSE 'Not an employee anymore'
    END AS current_employee
FROM
    employees e
        JOIN
    dept_emp de ON de.emp_no = e.emp_no
GROUP BY de.emp_no
LIMIT 100;
    