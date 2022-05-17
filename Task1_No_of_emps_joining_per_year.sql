/* Skills Used: Inner Join, aggregate function, group by clause */ 

/* Number of male and female employees joining each year since 1990 */
/* Assumption: No employee has left atleast until 2002 */ 

SELECT 
    YEAR(d.from_date) AS calendar_year,
    e.gender,
    COUNT(e.emp_no) AS number_of_employees
FROM
    t_employees e
        JOIN
    t_dept_emp d ON e.emp_no = d.emp_no
GROUP BY calendar_year , e.gender
HAVING calendar_year >= '1990'
ORDER BY calendar_year;