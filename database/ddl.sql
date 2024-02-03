---------------------------------------------------------------------------------------
-- Create `admins` table
---------------------------------------------------------------------------------------

DROP TABLE IF EXISTS admins CASCADE;

CREATE TABLE admins (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    avatar VARCHAR(255) NOT NULL DEFAULT 'https://i.imgur.com/57GqXFP.png',
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Seed with primary admins
INSERT INTO admins (username, email, first_name, last_name, password) VALUES
('ezzat', 'ezzat@aldiaa.com', 'Ahmed', 'Ezzat', '$2b$10$pgGUA1nJLkNH8y9pKzB1IOijvpqgfmiVKZl9S8N506JHByA4tIw7.'),
('fatma', 'fatma@aldiaa.com', 'Fatma AlZahraa', 'Diaa', '$2b$10$jKi4jT81QmhpBU1.XBkzRekwzwagz3zRNeeqndLqn8Ve/4SI/i9Q.'),
('laila', 'laila@aldiaa.com', 'Laila', 'Diaa', '$2b$10$dO1VbMvAcU6DdDEA5LvWW.Lzyp0dHCOreI0dpxKXLNYFTQBXqaO4m');


-- SELECT * FROM admins;

---------------------------------------------------------------------------------------
-- Create `students` table
---------------------------------------------------------------------------------------

DROP TABLE IF EXISTS students;

CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    phone VARCHAR(20),
    year INT,
    section CHAR(1),
    attendance_frequency VARCHAR(20) CHECK (attendance_frequency IN ('weekly', 'biweekly')), -- 'weekly' or 'biweekly'
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

---------------------------------------------------------------------------------------
-- Create `clinics` table
---------------------------------------------------------------------------------------

DROP TABLE IF EXISTS clinics;

CREATE TABLE clinics (
    id SERIAL PRIMARY KEY,
    clinic_name VARCHAR(255),
    dentist_name VARCHAR(255),
    address TEXT,
    phone VARCHAR(20),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

---------------------------------------------------------------------------------------
-- Create `student_orders` table
---------------------------------------------------------------------------------------

DROP TABLE IF EXISTS student_orders;

CREATE TABLE student_orders (
    id SERIAL PRIMARY KEY,
    student_id INT REFERENCES students(id),
    order_name VARCHAR(255),
    order_type VARCHAR(50),
    order_date DATE,
    shelf VARCHAR(100),
    delivery_date DATE,
    payment_amount DECIMAL(10, 2),
    deposit DECIMAL(10, 2),
    order_status VARCHAR(50),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

---------------------------------------------------------------------------------------
-- Create `clinic_orders` table
---------------------------------------------------------------------------------------

DROP TABLE IF EXISTS clinic_orders;

CREATE TABLE clinic_orders (
    id SERIAL PRIMARY KEY,
    clinic_id INT REFERENCES clinics(id),
    order_name VARCHAR(255),
    order_type VARCHAR(50),
    order_date DATE,
    shelf VARCHAR(100),
    delivery_date DATE,
    payment_amount DECIMAL(10, 2),
    deposit DECIMAL(10, 2),
    order_status VARCHAR(50),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

---------------------------------------------------------------------------------------
-- Create `triggers` to update `updated_at` column
---------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION update_modified_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

---------------------------------------------------------------------------------------
-- Create `triggers` for each table
---------------------------------------------------------------------------------------

CREATE TRIGGER update_students_modtime
BEFORE UPDATE ON students
FOR EACH ROW
EXECUTE FUNCTION update_modified_column();

CREATE TRIGGER update_clinics_modtime
BEFORE UPDATE ON clinics
FOR EACH ROW
EXECUTE FUNCTION update_modified_column();

CREATE TRIGGER update_student_orders_modtime
BEFORE UPDATE ON student_orders
FOR EACH ROW
EXECUTE FUNCTION update_modified_column();

CREATE TRIGGER update_clinic_orders_modtime
BEFORE UPDATE ON clinic_orders
FOR EACH ROW
EXECUTE FUNCTION update_modified_column();

---------------------------------------------------------------------------------------