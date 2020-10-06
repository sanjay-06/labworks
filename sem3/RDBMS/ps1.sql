use 19pw28;

# QN 1
CREATE TABLE IF NOT EXISTS employee
(
    Name         VARCHAR(15),
    Designation  VARCHAR(15),
    Dept         VARCHAR(15),
    Salary       INT(11),
    Phone_number BIGINT(10)
);


# QN 2
ALTER TABLE employee
    ADD COLUMN ID INT NOT NULL FIRST;

# QN 3
ALTER TABLE employee
    ADD COLUMN City      VARCHAR(15) AFTER Salary,
    ADD COLUMN Last_name VARCHAR(5) AFTER Name;

# QN 4
ALTER TABLE employee
    CHANGE COLUMN Last_name Last_name VARCHAR(20);

# QN 5
ALTER TABLE employee
    ADD COLUMN Date_of_joining DATE;

# QN 6
ALTER TABLE employee
    CHANGE COLUMN ID EID INT NOT NULL;

# QN 7
ALTER TABLE employee
    MODIFY COLUMN City VARCHAR(15) NOT NULL;

# QN 8
ALTER TABLE employee
    DROP COLUMN Last_name;

# QN 9
CREATE TABLE dup_employee AS (SELECT *
                              FROM employee);

# QN 10
ALTER TABLE employee RENAME TO employee_data;

# QN 11
DROP TABLE dup_employee;

# QN 12
DESC employee_data;

# QN 13
INSERT INTO employee_data(EID, Name, Designation, Dept, Salary, City, Phone_number, Date_of_joining)
VALUES (101, 'Smith', 'Manager', 'Accounts', 20000, 'Chennai', 9290249125, '1980-12-27'),
       (407, 'Allen', 'Clerk', 'Accounts', 5000, 'Coimbatore', 9945533992, '1981-06-09'),
       (678, 'Scott', 'Lecturer', 'ECE', 30000, 'Trichy', 9965542211, '1980-05-01');

# QN 14
TRUNCATE TABLE employee_data;

# QN 15
ALTER TABLE employee_data
    MODIFY COLUMN EID INT NOT NULL UNIQUE;

# QN 16
INSERT INTO employee_data(EID, Name, Designation, Dept, Salary, City, Phone_number, Date_of_joining)
VALUES (101, 'Smith', 'Manager', 'Accounts', 20000, 'Chennai', 9290249125, '1980-12-27'),
       (407, 'Allen', 'Clerk', 'Accounts', 5000, 'Coimbatore', 9945533992, '1981-06-09'),
       (678, 'Scott', 'Lecturer', 'ECE', 30000, 'Trichy', 9965542211, '1980-05-01'),
       (747, 'Jones', 'Professor', 'Maths', 35000, 'Coimbatore', 9946673321, '1999-11-12'),
       (690, 'Adams', 'Professor', 'EEE', 50000, 'Vellore', 9866544332, '1979-05-25'),
       (579, 'Miller', 'Lecturer', 'ECE', 25000, 'Chennai', 9955778890, '1999-12-24'),
       (671, 'Ram', 'Asst. professor', 'EEE', 48000, 'Chennai', 9877466335, '1980-10-09'),
       (745, 'Allex', 'Senior lecturer', 'ECE', 46000, 'Trichy', 9942266788, '1999-08-19'),
       (742, 'Arjun', 'Professor', 'EEE', 48000, 'Coimbatore', 9977886765, '1999-12-06'),
       (749, 'Robert', 'Lecturer', 'EEE', 30000, 'Coimbatore', 9866778855, '2005-01-17'),
       (845, 'Smyth', 'Clerk', 'Accounts', 9000, 'Salem', 9900007722, '1973-12-31');

# QN 17
CREATE TABLE CBE_employees AS (SELECT *
                               FROM employee_data
                               WHERE employee_data.City = 'Coimbatore');

# QN 18
CREATE TABLE Subset_employees AS (SELECT EID, Name, Designation, Phone_number
                                  FROM employee_data);

# QN 19
ALTER TABLE employee_data
    ADD CONSTRAINT Dept_check CHECK (Dept IN ('Accounts', 'ECE', 'EEE', 'Maths'));

# QN 20
ALTER TABLE employee_data
    ADD CONSTRAINT Sal_check CHECK (Salary >= 5000 AND Salary <= 50000);

# QN 21
ALTER TABLE employee_data
    MODIFY COLUMN Phone_number BIGINT(10) NOT NULL UNIQUE;

SHOW CREATE TABLE employee_data;
