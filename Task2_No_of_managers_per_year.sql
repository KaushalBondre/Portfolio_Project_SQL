/* Skills Used: Case Statement, Distinct Statment, cross join, inner join */

/* Number of male and female managers in different departments for each year, starting from 1990 */

SELECT 
    d.dept_name,
    e.gender,
    dm.emp_no,
    dm.from_date,
    dm.to_date,
    ee.calendar_year,
    CASE
        WHEN
            YEAR(dm.from_date) <= ee.calendar_year
                AND YEAR(dm.to_date) >= ee.calendar_year
        THEN
            1
        ELSE 0
    END AS active
FROM
    (SELECT DISTINCT
        YEAR(hire_date) AS calendar_year
    FROM
        t_employees) ee
        CROSS JOIN
    t_dept_manager dm
        JOIN
    t_departments d ON dm.dept_no = d.dept_no
        JOIN
    t_employees e ON e.emp_no = dm.emp_no
ORDER BY dm.emp_no , ee.calendar_year;