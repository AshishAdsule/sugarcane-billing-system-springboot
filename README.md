# Sugarcane Billing System (SCBS)

## Project Overview

The **Sugarcane Billing System (SCBS)** is a web-based application developed using **Spring Boot, Spring Data JPA, JSP, and MySQL**.
It is designed to manage sugarcane procurement operations such as **cultivator management, cane registration, cane cut slips, weight slips, and reports**.

The system follows the **MVC architecture** using Spring Boot for backend development.

---

## Technologies Used

* Java
* Spring Boot
* Spring Data JPA
* JSP
* MySQL
* Maven
* HTML / CSS

---

## Project Architecture

The project follows the **MVC Architecture**:

Entity → Repository → Service → ServiceImpl → Controller → JSP

---

## Modules

### Master Modules

* Cane
* Cultivator
* Harvestor
* Transporter
* Vehicle
* Village
* Water

### Information Module

* Cane Registration

### Transaction Module

* Cane Cut Slip
* Weight Slip

### Report Module

* Cultivator Report
* Registration Report
* Cane Cut Report
* Weight Slip Report

---

## Features

* Manage cultivator and village data
* Register sugarcane details
* Generate cane cut slips
* Record weight slips
* Generate reports for management

---

## How to Run the Project

1. Clone the repository
2. Import the project in **Spring Tool Suite / IntelliJ / Eclipse**
3. Configure **MySQL database**
4. Update database credentials in `application.properties`
5. Run the Spring Boot application

---

## Author

Ashish Adsule
