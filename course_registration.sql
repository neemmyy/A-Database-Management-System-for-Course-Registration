-- My Final Project: Course Registration System
-- Database schema, sample data, and test queries

-- Create a new database for the project
CREATE DATABASE CourseRegistrationDB;
USE CourseRegistrationDB;

------------------------------------------------------
-- Table: Departments
------------------------------------------------------
CREATE TABLE Departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE
);

------------------------------------------------------
-- Table: Students
------------------------------------------------------
CREATE TABLE Students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    department_id INT,
    email VARCHAR(100) UNIQUE,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

------------------------------------------------------
-- Table: Semesters
------------------------------------------------------
CREATE TABLE Semesters (
    semester_id INT AUTO_INCREMENT PRIMARY KEY,
    semester_name VARCHAR(50) NOT NULL UNIQUE
);

------------------------------------------------------
-- Table: Courses
------------------------------------------------------
CREATE TABLE Courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_code VARCHAR(20) NOT NULL UNIQUE,
    course_name VARCHAR(100) NOT NULL,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

------------------------------------------------------
-- Table: Registrations (Many-to-Many: Students <-> Courses with Semesters)
------------------------------------------------------
CREATE TABLE Registrations (
    registration_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    semester_id INT NOT NULL,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id),
    FOREIGN KEY (semester_id) REFERENCES Semesters(semester_id)
);

------------------------------------------------------
-- Insert sample data
------------------------------------------------------

-- Departments
INSERT INTO Departments (department_name)
VALUES
('Computer Science'),
('Mechanical Engineering'),
('Business Administration'),
('Electrical Engineering');

-- Semesters
INSERT INTO Semesters (semester_name)
VALUES
('First Semester'),
('Second Semester');

-- Students (Yoruba ~60%, Hausa ~20%, Igbo ~20%)
INSERT INTO Students (first_name, last_name, department_id, email)
VALUES
('Tunde', 'Adebayo', 1, 'tunde.adebayo@example.com'),
('Sade', 'Ogunleye', 1, 'sade.ogunleye@example.com'),
('Bola', 'Akintola', 2, 'bola.akintola@example.com'),
('Musa', 'Abubakar', 3, 'musa.abubakar@example.com'),
('Aisha', 'Bello', 4, 'aisha.bello@example.com'),
('Chinedu', 'Okafor', 1, 'chinedu.okafor@example.com'),
('Ngozi', 'Eze', 2, 'ngozi.eze@example.com');

-- Courses
INSERT INTO Courses (course_code, course_name, department_id)
VALUES
('CSC101', 'Introduction to Programming', 1),
('CSC201', 'Data Structures', 1),
('MEC101', 'Thermodynamics', 2),
('BUS101', 'Principles of Management', 3),
('EEE101', 'Circuit Analysis', 4);

-- Registrations
INSERT INTO Registrations (student_id, course_id, semester_id)
VALUES
(1, 1, 1), -- Tunde -> CSC101, First Semester
(2, 1, 1), -- Sade -> CSC101, First Semester
(2, 2, 2), -- Sade -> CSC201, Second Semester
(4, 4, 1), -- Musa -> BUS101, First Semester
(5, 5, 1), -- Aisha -> EEE101, First Semester
(6, 2, 2), -- Chinedu -> CSC201, Second Semester
(7, 3, 1); -- Ngozi -> MEC101, First Semester

------------------------------------------------------
-- Useful Queries for Demonstration
------------------------------------------------------

-- Q1: List all students with their departments
SELECT s.first_name, s.last_name, d.department_name
FROM Students s
JOIN Departments d ON s.department_id = d.department_id;

-- Q2: Show all courses offered by each department
SELECT c.course_code, c.course_name, d.department_name
FROM Courses c
JOIN Departments d ON c.department_id = d.department_id;

-- Q3: Display students and the courses they registered for (with semester)
SELECT s.first_name, s.last_name, c.course_name, sem.semester_name
FROM Registrations r
JOIN Students s ON r.student_id = s.student_id
JOIN Courses c ON r.course_id = c.course_id
JOIN Semesters sem ON r.semester_id = sem.semester_id;

-- Q4: Count how many students are registered in each department
SELECT d.department_name, COUNT(s.student_id) AS total_students
FROM Students s
JOIN Departments d ON s.department_id = d.department_id
GROUP BY d.department_name;
