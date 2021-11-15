SELECT emp_no, first_name, last_name
FROM employees;

SELECT title, from_date, to_date
FROM titles;

SELECT employees.emp_no,
     employees.first_name,
     employees.last_name,
     titles.title,
	 titles.from_date,
	 titles.to_date
INTO retirement_titles
FROM employees
INNER JOIN titles
ON employees.emp_no = titles.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;

-- Use Distinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (employees.emp_no) employees.emp_no,
     employees.first_name,
     employees.last_name,
     titles.title,
	 titles.from_date,
	 titles.to_date
INTO unique_titles
FROM employees
INNER JOIN titles
ON employees.emp_no = titles.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;
SELECT * FROM unique_titles;

SELECT COUNT(title), title 
INTO retiring_titles
FROM unique_titles
GROUP BY unique_titles.title
ORDER BY COUNT(title) DESC; 

SELECT emp_no, first_name, last_name, birth_date
FROM employees;

SELECT from_date, to_date
FROM dept_emp;

SELECT title
FROM titles;

SELECT DISTINCT ON (employees.emp_no)
     employees.emp_no,
	 employees.first_name,
     employees.last_name,
	 employees.birth_date,
	 dept_emp.from_date,
	 dept_emp.to_date,
     titles.title
INTO mentorship_eligibilty
FROM employees
INNER JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
INNER JOIN titles
ON employees.emp_no = titles.emp_no
WHERE (dept_emp.to_date = '9999-01-01' AND birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY emp_no;