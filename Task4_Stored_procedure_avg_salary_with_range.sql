/* Skills Used: Stored procedure, input parameters, aggregate function, round function, group by clause */

/* Average male and female salary per department within a user defined salary range */

drop procedure if exists average_salary;
delimiter $$
create procedure average_salary( in min_salary float, in max_salary float)
begin
SELECT 
    d.dept_name, e.gender, ROUND(AVG(s.salary), 2) AS avg_salary
FROM
    t_employees e
        JOIN
    t_salaries s ON e.emp_no = s.emp_no
        JOIN
    t_dept_emp de ON s.emp_no = de.emp_no
        JOIN
    t_departments d ON de.dept_no = d.dept_no
WHERE
    s.salary BETWEEN min_salary AND max_salary
GROUP BY d.dept_name , e.gender
ORDER BY d.dept_no;
end$$
delimiter ;  