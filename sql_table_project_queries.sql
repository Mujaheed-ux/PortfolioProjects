USE employees_mod;

SELECT * FROM t_employees;

SELECT * FROM t_dept_emp;

SELECT * FROM t_departments;

SELECT * FROM t_dept_manager;

SELECT * FROM t_salaries;


# Tableau + SQL PROJECT 
# TASK 1
/* Create a visualization that provides a breakdown between the male 
and female employees working in the company each year, starting from 1990. */

# Extracting the data based on the above business question.

SELECT 
	YEAR(de.from_date) AS Calender_year,
    e.gender,
    COUNT(de.emp_no) AS number_employees
FROM
    t_employees e
        JOIN
    t_dept_emp de ON e.emp_no = de.emp_no
GROUP BY e.gender , Calender_year
HAVING Calender_year >= 1990;


# TASK 2
/* Compare the number of male managers to the number of
 female managers from different departments for each year, starting from 1990.
 */
 
SELECT 
    d.dept_name,
    ee.gender,
    dm.emp_no,
    dm.from_date,
    dm.to_date,
    e.calendar_year,
    CASE
        WHEN
            YEAR(dm.to_date) >= e.calendar_year
                AND YEAR(dm.from_date) <= e.calendar_year
        THEN
            1
        ELSE 0
    END AS active
FROM
    (SELECT 
        YEAR(hire_date) AS calendar_year
    FROM
        t_employees
    GROUP BY calendar_year) e
        CROSS JOIN
    t_dept_manager dm
        JOIN
    t_departments d ON dm.dept_no = d.dept_no
        JOIN
    t_employees ee ON dm.emp_no = ee.emp_no
ORDER BY dm.emp_no , calendar_year;


# TASK 3

/* Compare the average salary of female versus male employees in the entire
 company until year 2002, and add a filter allowing you to see that per each department.*/

SELECT 
    e.gender,
    d.dept_name,
    ROUND(AVG(s.salary), 2) AS Salary,
    YEAR(s.from_date) AS Calender_year
FROM
    t_salaries s
        JOIN
    t_employees e ON s.emp_no = e.emp_no
        JOIN
    t_dept_emp de ON e.emp_no = de.emp_no
        JOIN
    t_departments d ON d.dept_no = de.dept_no
GROUP BY d.dept_no , e.gender , Calender_year
HAVING Calender_year <= 2002
ORDER BY d.dept_no;



# TASK 4

/* Create an SQL stored procedure that will allow you to obtain the average male and female salary 
per department within a certain salary range. Let this range be defined by two values the user can 
insert when calling the procedure. Finally, visualize the obtained result-set in Tableau as a double bar chart. */

DROP PROCEDURE IF EXISTS filter_salary;

DELIMITER $$
CREATE PROCEDURE filter_salary (IN p_min_salary FLOAT, IN p_max_salary FLOAT)
BEGIN
SELECT 
    e.gender, d.dept_name, AVG(s.salary) as avg_salary
FROM
    t_salaries s
        JOIN
    t_employees e ON s.emp_no = e.emp_no
        JOIN
    t_dept_emp de ON de.emp_no = e.emp_no
        JOIN
    t_departments d ON d.dept_no = de.dept_no
    WHERE s.salary BETWEEN p_min_salary AND p_max_salary
GROUP BY d.dept_no, e.gender;
END$$
DELIMITER ;


CALL filter_salary(50000, 90000);