-- Create the database
CREATE DATABASE Clinic_Booking_System;

-- Use the database
USE Clinic_Booking_System;

-- Specializations
CREATE TABLE Specializations (
    specialization_id INT PRIMARY KEY AUTO_INCREMENT,
    specialization_name VARCHAR(100) NOT NULL UNIQUE
);

INSERT INTO specializations (specialization_id, specialization_name) 
VALUES (1, 'General Surgery'), 
	   (2, 'Anesthesiology'), 
       (3, 'Ophthalmology');

-- Doctors
CREATE TABLE Doctors (
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    doctor_name VARCHAR(300) NOT NULL,
    doctor_phone VARCHAR(20),
    doctor_email VARCHAR(255) NOT NULL UNIQUE,
    specialization_id INT NOT NULL,
    FOREIGN KEY (specialization_id) REFERENCES specializations(specialization_id)
);

INSERT INTO Doctors(doctor_id, doctor_name, doctor_phone, doctor_email, specialization_id)
VALUES (1, "Dr.Malete", "0713087712", "malete@gmail.com", 2),
       (2, "Dr.Rea", "0737984440", "rea@gmail.com", 3),
       (3, "Dr.Remo", "0721233279", "remo@gmail.com", 1);
        
-- Patients
CREATE TABLE Patients (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_name VARCHAR(100) NOT NULL,
    patient_date_of_birth DATE,
    patient_gender ENUM('Male', 'Female', 'Other'),
    patient_email VARCHAR(100) UNIQUE,
    patient_phone VARCHAR(15)
);

INSERT INTO Patients (patient_id, patient_name, patient_date_of_birth, patient_gender, patient_email, patient_phone) 
VALUES (1, "Atli Mok", "2023-03-25", "Male", "Atli@gmail.com", "0793914901"),
       (2, "Jane Roe", "1980-05-15", "Female", "jane@gmail.com", "0765432109"),
       (3, "Mosa Motlana", "2002-09-09", "Male", "mosa@gmail.com", "0691239022");
       
-- Appointments
CREATE TABLE Appointments (
    appointment_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    appointment_date DATETIME NOT NULL,
    appointment_status ENUM('Scheduled', 'Completed', 'Cancelled') DEFAULT 'Scheduled',
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

INSERT INTO Appointments (appointment_id, patient_id, doctor_id, appointment_date, appointment_status) 
VALUES (1, 1, 1, "2025-05-04 10:00:00", "Scheduled"),
       (2, 2, 2, "2025-05-04 11:00:00", "Cancelled"),
       (3, 3, 3,  "2025-02-23 09:30:00", "Completed");

-- Treatments
CREATE TABLE Treatments (
    treatment_id INT PRIMARY KEY AUTO_INCREMENT,
    treatment_name VARCHAR(100) NOT NULL,
    treatment_cost DECIMAL(10,2) NOT NULL
);

INSERT INTO Treatments (treatment_id, treatment_name, treatment_cost) 
VALUES (1, "X-Ray", 100.00),
       (2, "Skin Biopsy", 200.00),
       (3, "Eye Examination", 500.00);

-- Appointment-Treatment
CREATE TABLE Appointment_treatments (
    appointment_id INT,
    treatment_id INT,
    PRIMARY KEY (appointment_id, treatment_id),
    FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id),
    FOREIGN KEY (treatment_id) REFERENCES Treatments(treatment_id)
);

INSERT INTO Appointment_treatments (appointment_id, treatment_id) 
VALUES (1, 1),
       (2, 2),
       (3, 3);

-- Bills
CREATE TABLE Bills (
    bill_id INT PRIMARY KEY AUTO_INCREMENT,
    appointment_id INT UNIQUE NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,
    bill_status ENUM('Paid', 'Unpaid') DEFAULT 'Unpaid',
    FOREIGN KEY (appointment_id) REFERENCES appointments(appointment_id)
);

INSERT INTO Bills (bill_id, appointment_id, total_amount, bill_status) 
VALUES (1, 1, 150.00, "Paid"),
       (2, 2, 200.00, "Unpaid"),
       (3, 3, 400.00, "Unpaid"); 


-- Create the database for the contact book
CREATE DATABASE contact_book;

-- Use contact book
USE contact_book;

-- Categories
CREATE TABLE categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(50) NOT NULL UNIQUE
);

INSERT INTO categories ( category_id,  category_name)
VALUES (1, 'Family'),
       (2, 'Friends'),
       (3, 'Work');

-- Contacts
CREATE TABLE contacts (
    contact_id INT PRIMARY KEY AUTO_INCREMENT,
    contact_name VARCHAR(100) NOT NULL,
    contact_email VARCHAR(100) UNIQUE,
    contact_phone VARCHAR(15),
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

INSERT INTO contacts (contact_id, contact_name, contact_email, contact_phone, category_id) 
VALUES (1, 'David Miller', 'david@example.com', '1112223333', 1),
       (2, 'Emma Brown', 'emma.brown@example.com', '2223334444', 2),
       (3, 'Franklin Green', 'frank@example.com', '3334445555', 3);