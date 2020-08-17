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

--select * from salaries;

--List the following details of each employee: employee number, last name, 
--first name, sex, and salary.
select e.emp_no, e.last_name, e.first_name, e.sex, s.salary 
from employees e
join salaries s
on(e.emp_no = s.emp_no);

--List first name, last name, and hire date for employees who were hired in 1986.

SELECT first_name, last_name, hire_date
   FROM employees
   WHERE 'hire_date' like '1986%';
   
--List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name.

Select dept

--List the department of each employee with the following information: employee number, 
--last name, first name, and department name.



--List first name, last name, and sex for employees whose first name 
--is "Hercules" and last names begin with "B."

SELECT hire_date from employees
where 'hire_date' like '';

select hire_date from employees;

