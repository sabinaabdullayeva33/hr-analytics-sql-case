-- HR Analytics Case Study: Database Schema & Dummy Data Setup


-- 1. DROP TABLES
DROP TABLE IF EXISTS Salary_History CASCADE;
DROP TABLE IF EXISTS Attendance CASCADE;
DROP TABLE IF EXISTS Employees CASCADE;
DROP TABLE IF EXISTS Departments CASCADE;

-- 2. CREATE TABLES
CREATE TABLE Departments (
    Department_ID INT PRIMARY KEY,
    Department_Name VARCHAR(100) NOT NULL,
    Manager_ID INT
);

CREATE TABLE Employees (
    Employee_ID INT,
    Full_Name VARCHAR(100) NOT NULL,
    Department_ID INT,
    Position VARCHAR(100),
    Hire_Date DATE NOT NULL,
    Termination_Date DATE,
    Salary NUMERIC(10, 2),
    Gender VARCHAR(10),
    Birth_Date DATE
);

CREATE TABLE Attendance (
    Attendance_ID INT PRIMARY KEY,
    Employee_ID INT,
    Work_Date DATE NOT NULL,
    Check_In TIME,
    Check_Out TIME,
    Status VARCHAR(20)
);

CREATE TABLE Salary_History (
    History_ID INT PRIMARY KEY,
    Employee_ID INT,
    Salary NUMERIC(10, 2) NOT NULL,
    Effective_Date DATE NOT NULL
);

-- 3. INSERT BASE DATA
INSERT INTO Departments VALUES 
(1, 'IT & Data', 101),
(2, 'Human Resources', 104),
(3, 'Finance', 106),
(4, 'Marketing', 109),
(5, 'Legal', NULL);

INSERT INTO Employees VALUES 
(101, 'Murad Qasımov', 1, 'Data Lead', '2022-03-01', NULL, 3800.00, 'Male', '1990-05-14'),
(102, 'Aysel Məmmədova', 1, 'Data Analyst', '2023-06-15', NULL, 2400.00, 'Female', '1995-11-20'),
(103, 'Kənan Əliyev', 1, 'BI Developer', '2025-02-01', NULL, 2100.00, 'Male', '1998-04-10'),
(104, 'Nərgiz Rzayeva', 2, 'HR Lead', '2021-08-10', NULL, 2900.00, 'Female', '1992-09-05'),
(105, 'Leyla Cəfərova', 2, 'Recruiter', '2024-01-20', NULL, 1600.00, 'Female', '1997-12-18'),
(106, 'Tural Həsənov', 3, 'Finance Lead', '2020-05-15', NULL, 3500.00, 'Male', '1989-07-22'),
(107, 'Fərid Nəbiyev', 3, 'Accountant', '2023-11-01', NULL, 1900.00, 'Male', '1996-03-30'),
(108, 'Günel İsmayılova', 4, 'Marketing Lead', '2023-01-10', NULL, 2700.00, 'Female', '1994-08-14'),
(109, 'Rauf Səfərov', 4, 'SMM Specialist', '2025-04-01', NULL, 1400.00, 'Male', '2000-10-25'),
(110, 'Elnur Vəliyev', 1, 'Data Analyst', '2024-01-15', '2026-03-31', 2200.00, 'Male', '1996-06-18'),
(111, 'Sevinc Quliyeva', 2, 'HR Specialist', '2023-04-01', '2026-05-15', 1700.00, 'Female', '1995-02-28'),
(101, 'Murad Qasımov (Duplikat)', 1, 'Data Lead', '2022-03-01', NULL, 3800.00, 'Male', '1990-05-14'),
(112, 'Orxan Babayev', 99, 'Security Specialist', '2024-05-10', NULL, 1800.00, 'Male', '1993-01-12'),
(113, 'Zaur Bağırov', 3, 'Junior Auditor', '2025-01-10', NULL, -800.00, 'Male', '1999-07-04'),
(114, 'Nigar Tağıyeva', 4, 'Designer', '2026-06-01', '2026-01-15', 1900.00, 'Female', '1997-09-11');

INSERT INTO Salary_History VALUES 
(1, 101, 3000.00, '2022-03-01'),
(2, 101, 3400.00, '2023-04-01'),
(3, 101, 3800.00, '2024-06-01'),
(4, 102, 1800.00, '2023-06-15'),
(5, 102, 2400.00, '2024-08-01'),
(6, 104, 2300.00, '2021-08-10'),
(7, 104, 2600.00, '2023-01-01'),
(8, 104, 2900.00, '2024-05-01');

INSERT INTO Attendance VALUES 
(1, 101, '2026-03-02', '08:55:00', '18:05:00', 'Present'),
(2, 102, '2026-03-02', '09:25:00', '18:10:00', 'Late'),
(3, 103, '2026-03-02', NULL, NULL, 'Absent'),
(4, 104, '2026-03-02', '08:50:00', '18:00:00', 'Present');
