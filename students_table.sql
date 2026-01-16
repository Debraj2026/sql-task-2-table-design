-- Create database (optional)
CREATE DATABASE IF NOT EXISTS internship_db;
USE internship_db;

-- Create students table with proper data types and constraints
CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    roll_no VARCHAR(20) NOT NULL UNIQUE,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    date_of_birth DATE NOT NULL,
    gender CHAR(1) CHECK (gender IN ('M', 'F', 'O')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert valid data
INSERT INTO students
(roll_no, first_name, last_name, email, date_of_birth, gender)
VALUES
('RN101', 'Debraj', 'Das', 'debraj@gmail.com', '2003-12-18', 'M');

-- Try inserting invalid data (Duplicate roll_no - should fail)
INSERT INTO students
(roll_no, first_name, date_of_birth, gender)
VALUES
('RN101', 'Rahul', '2002-01-01', 'M');

-- Alter table: Add new column
ALTER TABLE students
ADD phone_number VARCHAR(15) UNIQUE;

-- Rename column
ALTER TABLE students
RENAME COLUMN phone_number TO mobile_number;

-- Drop a column (use carefully)
ALTER TABLE students
DROP COLUMN last_name;
