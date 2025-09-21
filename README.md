# A-Database-Management-System-for-Course-Registration
A system used to manage course registration for students
# 🎓 Course Registration System Database  
🎯 *A Final Project on Database Normalization and Design*  

👤 **Author: Odeku Oluwafunmilayo**  
📌 Database Final Project (Week 8 Assignment)  

## 📖 Project Overview
This project implements a **Course Registration System** using MySQL.  
It was designed to demonstrate principles of **database design, normalization, and relational integrity**.  
The system manages **students, courses, departments, registrations, and semesters** in a well-structured relational database.

## 🛠️ Features
- **Students Table** – stores student details.  
- **Departments Table** – organizes students and courses by academic department.  
- **Courses Table** – defines courses offered by departments.  
- **Semesters Table** – manages academic terms (e.g., 1st Semester, 2nd Semester).  
- **Registrations Table** – records which students registered for which courses in a given semester.  
- Implements **1NF, 2NF, and 3NF** to ensure efficiency and eliminate redundancy.  
- Enforces **PRIMARY KEY, FOREIGN KEY, UNIQUE, and NOT NULL constraints**.  

## 📂 Files Included
- **final_project.sql** → contains the SQL script for creating the database schema.  
- **README.md** → project documentation.  

## 🚀 How to Run
1. Open **MySQL Workbench**.  
2. Connect to your database server.  
3. Copy the contents of **final_project.sql** into a new SQL tab.  
4. Run the script to create the database and tables.  
5. Use:  
   ```sql
   USE course_registration;
