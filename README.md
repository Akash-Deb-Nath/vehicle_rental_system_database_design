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

| Column       | Description            |
| ------------ | ---------------------- |
| user_id (PK) | Unique user identifier |
| name         | User name              |
| email        | User email             |
| role         | ADMIN or CUSTOMER      |

### Vehicles Table

| Column               | Description                      |
| -------------------- | -------------------------------- |
| vehicle_id (PK)      | Unique vehicle identifier        |
| vehicle_name         | Vehicle name                     |
| type                 | Car / Bike / Truck               |
| model                | Model year                       |
| registration_number  | Unique registration              |
| rental_price_per_day | Rental cost per day              |
| availability_status  | Available / Rented / Maintenance |

### Bookings Table

| Column          | Description                                 |
| --------------- | ------------------------------------------- |
| booking_id (PK) | Unique booking identifier                   |
| user_id (FK)    | References Users                            |
| vehicle_id (FK) | References Vehicles                         |
| start_date      | Rental start date                           |
| end_date        | Rental end date                             |
| booking_status  | Pending / Confirmed / Completed / Cancelled |
| total_cost      | Total rental cost                           |

---

## 🧠 ERD

The ERD was designed using **Lucidchart** and includes:

- Primary Keys (PK)
- Foreign Keys (FK)
- Crow’s foot notation
- Relationship cardinalities

🔗 **ERD Link:** https://shorturl.at/Z8snL

---

## 📂 queries.sql — Explanation of Queries

The `queries.sql` file contains all required SQL queries used in this project.

## Explanation

---

---

Query 1: JOIN Requirement
Objective: Retrieve booking information along with Customer name and Vehicle name

---

- Uses INNER JOIN to combine 'bookings', 'users', and 'vehicles' tables.
- Returns only bookings that have valid corresponding users and vehicles.
- Displays booking ID, customer name, vehicle name, start and end dates, and status.
- Useful for generating comprehensive booking reports.

# Query

```sql
SELECT
b.booking_id,
u.name AS customer_name,
v.name AS vehicle_name,
b.start_date,
b.end_date,
b.status
FROM
bookings AS b
INNER JOIN users AS u ON b.user_id = u.user_id
INNER JOIN vehicles AS v ON b.vehicle_id = v.vehicle_id;
```

---

Query 2: EXISTS Requirement
Objective: Find all vehicles that have never been booked

---

- Uses NOT EXISTS to identify vehicles with no associated bookings.
- Returns complete details of vehicles that have never been rented.
- Helps in detecting underutilized vehicles that might need promotion or maintenance.

# Query

```sql
SELECT *
FROM
vehicles v
WHERE
NOT EXISTS (
SELECT 1
FROM bookings b
WHERE b.vehicle_id = v.vehicle_id
);
```

---

Query 3: WHERE Requirement
Objective: Retrieve all available vehicles of a specific type (e.g., cars)

---

- Defines a parameterized SQL function to retrieve vehicles by type.
- Filters only vehicles that are currently available.
- Function can be reused for any vehicle type (e.g., car, bike, van).
- Simplifies queries and improves code maintainability.

# Query

```sql
CREATE FUNCTION retrieve_by_type(vehicle_type varchar(15))
RETURNS TABLE (
vehicle_id int,
name varchar(50),
type varchar(15),
model int,
registration_number text,
rental_price int,
status varchar(15)
)
LANGUAGE sql AS $$
SELECT *
FROM vehicles
WHERE type = vehicle_type
AND status = 'available';

$$
;

-- Example call for 'car'

SELECT *
FROM retrieve_by_type('car');
```

---

Query 4: GROUP BY and HAVING Requirement
Objective: Count total bookings for each vehicle and display only vehicles with more than 2 bookings

---

- Uses GROUP BY to aggregate bookings for each vehicle.
- HAVING filters only those vehicles with more than 2 bookings.
- Helps identify popular vehicles and analyze rental trends.
- Useful for business decisions such as fleet expansion or marketing.

# Query

```sql
SELECT
    v.name AS vehicle_name,
    COUNT(b.booking_id) AS total_bookings
FROM
    bookings AS b
    INNER JOIN vehicles AS v ON b.vehicle_id = v.vehicle_id
GROUP BY
    b.vehicle_id,
    v.name
HAVING
    COUNT(b.booking_id) > 2;
```

---

### ✅ Conclusion

This project successfully implements a Vehicle Rental System using relational database concepts.
It follows proper normalization, relationship mapping, and real-world SQL operations.

$$
$$
