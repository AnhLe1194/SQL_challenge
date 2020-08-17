drop table titles;
drop table departments;
drop table dept_emp;
drop table dept_manager;
drop table employees;
drop table salaries;

CREATE TABLE titles (
    title_id varchar   NOT NULL,
    title VARCHAR   NOT NULL,
    PRIMARY KEY (
        title_id
     )
);

CREATE TABLE employees (
    emp_no INTEGER   NOT NULL,
    emp_title_id VARCHAR   NOT NULL,
    birth_date date   NOT NULL,
    first_name VARCHAR   NOT NULL,
    last_name VARCHAR   NOT NULL,
    sex varchar   NOT NULL,
    hire_date date   NOT NULL,
    FOREIGN KEY (emp_title_id) REFERENCES titles(title_id),
    PRIMARY KEY (
        emp_no
     )
);

CREATE TABLE departments (
    dept_no Varchar   NOT NULL,
    dept_name VARCHAR   NOT NULL,
    PRIMARY KEY (
        dept_no
     )
);

CREATE TABLE dept_manager (
    dept_no Varchar NOT NULL,
    emp_no INTEGER NOT NULL,
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    PRIMARY KEY (
        dept_no, emp_no
     )
);

CREATE TABLE dept_emp (
    emp_no INTEGER   NOT NULL,
    dept_no Varchar   NOT NULL,
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    PRIMARY KEY (
        emp_no,dept_no
     )
);

CREATE TABLE salaries (
    emp_no INTEGER NOT NULL,
    salary INTEGER NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    PRIMARY KEY (
        emp_no
     )
);

select * from salaries;

select e.emp_no, e.last_name, e.first_name, e.sex, s.salary 
from employees e
join salaries s
on(e.emp_no = s.emp_no);

--select * from dept_manager;

SELECT first_name, last_name, hire_date 
FROM employees WHERE hire_date BETWEEN '1986-01-01' AND '1987-01-01';

--List the manager of each department with the following information: 
--department number, department name, the manager's employee number, 
--last name, first name.

select d.dept_no, count(d.emp_no) as "Number of employees" 
from dept_manager d
group by dept_no
join departments de
on(d.dept_no = de.dept_no);

SELECT de.dept_no, de.dept_name, count
  FROM dept_manager d LEFT JOIN departments de
    ON d.dept_no = de.dept_no;
 
select * from departments;

select count(*)
from dept_manager d
	join departments de
		on d.dept_no = de.dept_no

SELECT departments.dept_no, departments.dept_name, 
dept_manager.emp_no, employees.last_name, employees.first_name
FROM departments
JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no
JOIN employees
ON dept_manager.emp_no = employees.emp_no;

--List the department of each employee with the following information: employee number, 
--last name, first name, and department name.

Select employees.emp_no, employees.last_name, employees.first_name, 
departments.dept_name
from employees 
join dept_emp
on employees.emp_no = dept_emp.emp_no
join departments
on dept_emp.dept_no = departments.dept_no;

--List first name, last name, and sex for employees whose first name is "Hercules" 
--and last names begin with "B."

select first_name, last_name, sex 
from employees
where first_name = 'Hercules'
and last_name like 'B%';

--List all employees in the Sales department, including their employee number, 
--last name, first name, and department name.

Select employees.emp_no, employees.last_name, employees.first_name, 
departments.dept_name
from employees
join dept_emp
on employees.emp_no = dept_emp.emp_no
join departments
on dept_emp.dept_no = departments.dept_no
where departments.dept_name = 'Sales';

--List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.

Select employees.emp_no, employees.last_name, employees.first_name, 
departments.dept_name
from employees
join dept_emp
on employees.emp_no = dept_emp.emp_no
join departments
on dept_emp.dept_no = departments.dept_no
where departments.dept_name = 'Sales'
or departments.dept_name = 'Development';

--In descending order, list the frequency count of employee last names, 
--i.e., how many employees share each last name.

Select last_name, count(*) from employees
group by last_name
order by 2 desc;



