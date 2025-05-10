 # Database Management System

# MySQL Database Projects & FastAPI CRUD API

This project contains two MySQL database systems:

1. **Clinic Booking System** – A fully-featured relational database for managing clinics, appointments, and billing.
2. **Contact Book API** – A simple contact management API built with FastAPI and connected to a MySQL database.

---

## 📁 Project Structure

├── clinic_and_contact_book_schema.sql # SQL schema and data for both databases
├── python.py # FastAPI app (CRUD API for Contact Book)
├── README.md # Project overview and usage instructions


---

## 🔹 Clinic Booking System

A real-world relational database for managing clinics. It includes the following features:

### Tables:
- **Specializations** – List of medical specializations (e.g., Anesthesiology, Ophthalmology).
- **Doctors** – Doctors with contact info and their specialization.
- **Patients** – Patient details like name, gender, contact, and DOB.
- **Appointments** – Records of doctor-patient appointments.
- **Treatments** – List of treatments with associated costs.
- **Appointment_Treatments** – Many-to-many link between appointments and treatments.
- **Bills** – Billing records per appointment.

### Example Data:
- Doctors: Dr. Malete, Dr. Rea, Dr. Remo
- Patients: Atli Mok, Jane Roe, Mosa Motlana
- Treatments: X-Ray, Skin Biopsy, Eye Examination

---

## 🔸 Contact Book API (FastAPI + MySQL)

A CRUD (Create, Read, Update, Delete) API to manage contacts.

### Tables:
- **Categories** – Contact groups like Family, Friends, Work.
- **Contacts** – Stores name, phone, email, and linked category.

### API Endpoints:

| Method | Endpoint              | Description              |
|--------|-----------------------|--------------------------|
| POST   | `/contacts/`          | Add a new contact        |
| GET    | `/contacts/`          | List all contacts        |
| PUT    | `/contacts/{id}`      | Update a contact         |
| DELETE | `/contacts/{id}`      | Delete a contact         |

