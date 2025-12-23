# 🚗 Vehicle Rental System  
## Database Design & SQL Queries

---

## 📌 Overview & Objectives

The **Vehicle Rental System** is a database-driven application designed to manage vehicle rentals efficiently.  
It allows users to book vehicles for a specific time period while ensuring proper tracking of users, vehicles, and bookings.

This project demonstrates:
- Relational database design using ERD
- One-to-Many, Many-to-One, and logical One-to-One relationships
- SQL queries for real-world rental operations

---

## 🧩 Entities & Relationships

### Entities
- **Users** – Stores customer and admin information
- **Vehicles** – Stores rental vehicle details
- **Bookings** – Stores booking and rental history

### Relationships
- **One-to-Many:** One User can create multiple Bookings  
- **Many-to-One:** Many Bookings can reference one Vehicle  
- **Logical One-to-One:** Each Booking connects exactly one User and one Vehicle  

---

## 🗂️ Database Schema Summary

### Users Table
| Column | Description |
|------|------------|
| user_id (PK) | Unique user identifier |
| name | User name |
| email | User email |
| role | ADMIN or CUSTOMER |

### Vehicles Table
| Column | Description |
|------|------------|
| vehicle_id (PK) | Unique vehicle identifier |
| vehicle_name | Vehicle name |
| type | Car / Bike / Truck |
| model | Model year |
| registration_number | Unique registration |
| rental_price_per_day | Rental cost per day |
| availability_status | Available / Rented / Maintenance |

### Bookings Table
| Column | Description |
|------|------------|
| booking_id (PK) | Unique booking identifier |
| user_id (FK) | References Users |
| vehicle_id (FK) | References Vehicles |
| start_date | Rental start date |
| end_date | Rental end date |
| booking_status | Pending / Confirmed / Completed / Cancelled |
| total_cost | Total rental cost |

---

## 🧠 ERD

The ERD was designed using **Lucidchart** and includes:
- Primary Keys (PK)
- Foreign Keys (FK)
- Crow’s foot notation
- Relationship cardinalities

🔗 **ERD Link:** *(Paste your Lucidchart public link here)*

---

## 📂 queries.sql — Explanation of Queries

The `queries.sql` file contains all required SQL queries used in this project, including:

- Creating tables with primary and foreign key constraints
- Inserting sample data into Users, Vehicles, and Bookings tables
- Retrieving booking details using JOIN operations
- Updating booking and vehicle status
- Calculating total rental cost based on booking duration

Each query in the file represents a real-world operation of a Vehicle Rental System.

---

### ✅ Conclusion

This project successfully implements a Vehicle Rental System using relational database concepts.
It follows proper normalization, relationship mapping, and real-world SQL operations.