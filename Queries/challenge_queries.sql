--
-- Module 7 Challenge
-- 

-- Deliverable 1
-- Create retirement table with titles 
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	ti.title,
	ti.from_date,
	ti.to_date,
	s.salary
INTO emp_info_retire
FROM employees AS e
INNER JOIN titles AS ti
ON (e.emp_no = ti.emp_no)
INNER JOIN salaries AS s
ON (e.emp_no = s.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31');

-- Use partitioning to return only most recent title per employee
SELECT emp_no,
	first_name,
	last_name,
	title,
	from_date,
	to_date,
	salary
INTO emp_info_retire_clean
FROM
(SELECT emp_no,
	first_name,
	last_name,
	title,
	from_date,
	to_date,
	salary, ROW_NUMBER() OVER
 (PARTITION BY (emp_no)
 ORDER BY to_date DESC) rn
 FROM emp_info_retire
 ) tmp WHERE rn = 1
 ORDER BY emp_no;

-- Create new table to sort employees by title and count number retiring for each title
SELECT title,
COUNT (*)emp_no 
INTO emp_info_retire_clean_group
FROM emp_info_retire_clean
Group BY title;


-- Deliverable 2
-- Create Mentorship Eligibility Table
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	ti.title,
	ti.from_date,
	ti.to_date
INTO mentorship_eligibility
FROM employees AS e
INNER JOIN titles AS ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31');

-- Use partitioning to return only most recent employee info
SELECT emp_no,
	first_name,
	last_name,
	title,
	from_date,
	to_date
INTO mentorship_eligibility_clean
FROM
(SELECT emp_no,
	first_name,
	last_name,
	title,
	from_date,
	to_date, ROW_NUMBER() OVER
 (PARTITION BY (emp_no)
 ORDER BY to_date DESC) rn
 FROM mentorship_eligibility
 ) tmp WHERE rn = 1
 ORDER BY emp_no;
