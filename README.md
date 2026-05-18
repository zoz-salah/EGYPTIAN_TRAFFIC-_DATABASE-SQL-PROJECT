# 🚦 Egyptian Traffic Database System

## 📌 Project Overview

The **Egyptian Traffic Database System** is a full SQL database project designed to simulate a real-world traffic management system used in Egypt. The system manages vehicles, owners, driving licenses, car licenses, traffic violations, and traffic officers.

This project was developed as a university database project by a team of **7 Computer Science students**. The main objective was to apply database concepts practically, including:

* ERD Design
* Database Mapping
* SQL Implementation
* Constraints
* Triggers
* Views
* Functions
* Simple & Complex Queries
* Subqueries
* Data Integrity

---

# 🎯 Project Objectives

The system aims to:

* Store and manage vehicle information.
* Manage vehicle owners and licenses.
* Track traffic violations.
* Store examination and expiration dates for vehicles.
* Manage traffic officers.
* Demonstrate advanced SQL concepts in a real-world scenario.

---

# 🏗️ Technologies Used

* SQL
* Oracle SQL / MySQL *(Edit depending on your DBMS)*
* ERD Modeling
* Relational Database Design
* GitHub

---

# 🧠 Database Concepts Implemented

This project includes implementation of:

## ✅ ERD (Entity Relationship Diagram)

* Entities
* Attributes
* Relationships
* Primary Keys
* Foreign Keys
* Cardinality

## ✅ Relational Mapping

* Mapping entities into relational tables.
* Handling relationships between tables.

## ✅ SQL Features

* DDL Commands
* DML Commands
* Constraints
* Views
* Triggers
* Functions
* Joins
* Aggregate Functions
* Subqueries
* Complex Queries

---

# 📂 Database Tables

## 1️⃣ Vehicle Table

Stores vehicle information.

### Includes:

* Vehicle ID
* Vehicle Model
* Vehicle Type
* Manufacturing Year
* Examination Date
* Expiration Date
* Owner ID

---

## 2️⃣ Owners Table

Stores owner information.

### Includes:

* Owner ID
* Full Name
* National ID
* Address
* Phone Number
* Date of Birth

---

## 3️⃣ Traffic Violations Table

Stores traffic violations committed by drivers.

### Examples:

* Speed Violations
* Seatbelt Violations
* Signal Violations
* Parking Violations

### Includes:

* Violation ID
* Vehicle ID
* Violation Type
* Fine Amount
* Violation Date
* Officer ID

---

## 4️⃣ Car Licenses Table

Stores car license information.

### Includes:

* License ID
* Vehicle ID
* Issue Date
* Expiration Date
* License Status

---

## 5️⃣ Owner Licenses Table

Stores driving license information for owners.

### Includes:

* Driving License ID
* Owner ID
* License Type
* Issue Date
* Expiration Date

---

## 6️⃣ Traffic Officer Table

Stores traffic officer information.

### Includes:

* Officer ID
* Officer Name
* Rank
* Department
* Phone Number

---

# 🔗 Relationships Between Tables

The project includes multiple relationship types:

| Relationship                 | Type        |
| ---------------------------- | ----------- |
| Owner → Vehicle              | One-to-Many |
| Vehicle → Traffic Violations | One-to-Many |
| Vehicle → Car License        | One-to-One  |
| Owner → Owner License        | One-to-One  |
| Traffic Officer → Violations | One-to-Many |

---

# 🔐 Constraints Used

The database uses several constraints to ensure data integrity:

* PRIMARY KEY
* FOREIGN KEY
* NOT NULL
* UNIQUE
* CHECK
* DEFAULT

---

# ⚡ Triggers

The project includes SQL triggers to automate operations and maintain consistency.

### Examples:

* Automatically checking license expiration.
* Preventing invalid inserts.
* Logging important updates.

---

# 👁️ Views

Views were created to simplify querying and improve readability.

### Examples:

* Active Licenses View
* Violations Summary View
* Vehicle Owner Details View

---

# 🧮 Functions

The project includes SQL functions for reusable database operations.

### Examples:

* Calculating total fines.
* Checking license validity.
* Returning violation counts.

---

# 🔍 Queries Implemented

## ✅ Simple Queries

Examples:

* Retrieve all vehicles.
* Retrieve all owners.
* Search by vehicle ID.

## ✅ Complex Queries

Examples:

* Nested Subqueries
* Aggregate Functions
* Multi-table Joins
* Grouping & Filtering

---

# 📊 ERD & Database Design

The project includes:

* Full ERD Diagram
* Relational Schema Mapping
* Table Relationships
* SQL Scripts
* Presentation Slides

---

# 👨‍💻 Team Members

This project was developed collaboratively by a team of **7 students**.

> 
<img width="480" height="272" alt="image" src="https://github.com/user-attachments/assets/cc5c3f03-b1ef-4860-a253-95359267b69f" />




---

# 🚀 How to Run the Project

1. Open your SQL environment.
2. Run the SQL schema file.
3. Create all tables.
4. Insert sample data.
5. Execute triggers, views, and functions.
6. Run queries for testing.

---

# 📁 Project Structure

```bash
📦 Egyptian-Traffic-Database-System
 ┣ 📂 SQL Scripts
 ┣ 📂 ERD
 ┣ 📂 Mapping
 ┣ 📂 Presentation
 ┣ 📂 Triggers
 ┗ 📜 README.md
```

---

# 🌟 Key Learning Outcomes

Through this project, we gained hands-on experience in:

* Database Design
* SQL Development
* Data Integrity
* Query Optimization
* Team Collaboration
* Real-world System Modeling

---

# 📌 Future Improvements

Possible future enhancements:

* Build a Frontend Interface
* Add Authentication System
* Connect with a Real Application
* Add Reports & Dashboards
* Improve Security & Performance

---

# 🙌 Conclusion

The Egyptian Traffic Database System demonstrates the practical implementation of database concepts using SQL and relational database design principles. The project simulates a real-world traffic management system and showcases both foundational and advanced database features.

---

# ⭐ GitHub

If you found this project useful, consider giving it a ⭐ on GitHub.
