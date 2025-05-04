-- DROP DATABASE proctored_exam;
-- Create Database
CREATE DATABASE IF NOT EXISTS proctored_exam;

USE proctored_exam;

-- Table: users
CREATE TABLE
    users (
        user_id VARCHAR(10) PRIMARY KEY,
        name VARCHAR(100),
        email VARCHAR(100) UNIQUE,
        password_hash VARCHAR(255),
        role_id VARCHAR(10),
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        created_by VARCHAR(10),
        updated_at TIMESTAMP NULL DEFAULT NULL,
        updated_by VARCHAR(10),
        status BOOLEAN DEFAULT TRUE
    );

-- Table: students
CREATE TABLE
    students (
        student_id VARCHAR(10) PRIMARY KEY,
        name VARCHAR(100),
        email VARCHAR(100) UNIQUE,
        password_hash VARCHAR(255),
        department VARCHAR(10),
        batch VARCHAR(10),
        year_of_studying VARCHAR(10),
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        created_by VARCHAR(10),
        updated_at TIMESTAMP NULL DEFAULT NULL,
        updated_by VARCHAR(10),
        status BOOLEAN DEFAULT TRUE
    );

-- Table: topics
CREATE TABLE
    topics (
        topic_id VARCHAR(10) PRIMARY KEY,
        topic_name VARCHAR(100) UNIQUE,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        created_by VARCHAR(10),
        updated_at TIMESTAMP NULL DEFAULT NULL,
        updated_by VARCHAR(10),
        status BOOLEAN DEFAULT TRUE
    );

-- Table: questions
CREATE TABLE
    questions (
        question_id VARCHAR(10) PRIMARY KEY,
        topic_id VARCHAR(10),
        question_text TEXT,
        option_a TEXT,
        option_b TEXT,
        option_c TEXT,
        option_d TEXT,
        correct_option ENUM ('A', 'B', 'C', 'D'),
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        created_by VARCHAR(10),
        updated_at TIMESTAMP NULL DEFAULT NULL,
        updated_by VARCHAR(10),
        FOREIGN KEY (topic_id) REFERENCES topics (topic_id),
        FOREIGN KEY (created_by) REFERENCES users (user_id)
    );

-- Table: exams
CREATE TABLE
    exams (
        exam_id VARCHAR(10) PRIMARY KEY,
        title VARCHAR(150),
        duration_minutes INT,
        is_proctored BOOLEAN DEFAULT TRUE,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        created_by VARCHAR(10),
        updated_at TIMESTAMP NULL DEFAULT NULL,
        updated_by VARCHAR(10),
        FOREIGN KEY (created_by) REFERENCES users (user_id)
    );