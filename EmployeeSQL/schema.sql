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