
-- Deliverable 1: The Number of Retiring Employees by Title

SELECT e.emp_no,
        e.first_name,
        e.last_name,
        ti.title,
        ti.from_date,
        ti.to_date
INTO retirement_titles
FROM employees AS e
INNER JOIN titles AS ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

-- Removing duplicates from retirement_titles
SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

SELECT * FROM unique_titles;

-- Count the number of retiring employees by title
-- DROP TABLE retiring_titles;

SELECT COUNT(ut.emp_no), ut.title
INTO retiring_titles_unsorted
FROM unique_titles AS ut
GROUP BY ut.title;

SELECT * FROM retiring_titles_unsorted;

SELECT retu.count, retu.title
INTO retiring_titles
FROM retiring_titles_unsorted AS retu
ORDER BY retu.count DESC;

SELECT * FROM retiring_titles

-- Deliverable 2: The Employees Eligible for the Mentorship Program
SELECT e.emp_no,
        e.first_name,
        e.last_name,
        e.birth_date,
        de.from_date,
        de.to_date,
        ti.title
INTO mentor_eli
FROM employees AS e
INNER JOIN dept_emp AS de
    ON (e.emp_no = de.emp_no)
INNER JOIN titles AS ti
    ON (e.emp_no = ti.emp_no)
WHERE (de.to_date = '9999-01-01')
AND (e.birth_date BETWEEN '01-01-1965' AND '12-31-1965');

SELECT * FROM mentor_eli;

SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name,
birth_date, from_date, to_date, title
INTO mentorship_eligibility
FROM mentor_eli
ORDER BY emp_no, to_date DESC;

SELECT * FROM mentorship_eligibility;







