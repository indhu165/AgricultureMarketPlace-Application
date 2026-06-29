# AgricultureMarketPlace-Application
Java web application using JSP, Servlets, MySQL
Agriculture Marketplace Application
📌 Project Overview

The Agriculture Marketplace Application is a web-based system that connects farmers and buyers directly.
Farmers can add and manage their agricultural products, and buyers can view available products.

This project is developed using JSP, Servlets, MySQL, and Apache Tomcat.

🚀 Features
👨‍🌾 Farmer registration and login
🛒 Product listing and viewing
📦 Add / update / delete products
🔐 Admin management system
🗄️ MySQL database integration
🌐 Dynamic web pages using JSP
⚙️ Backend logic using Servlets
🛠️ Technologies Used
Frontend: HTML, CSS, JSP
Backend: Java Servlets
Database: MySQL
Server: Apache Tomcat
Connectivity: JDBC
Language: Java
📁 Project Structure
AgricultureMarketPlace-Application
│
├── JSP Files/
│   ├── login.jsp
│   ├── register.jsp
│   ├── home.jsp
│   ├── addproduct.jsp
│   ├── viewproducts.jsp
│
├── tables/
│   ├── database.sql
│
├── WEB-INF/
│   ├── src/
│   │    └── servlets/
│   │         ├── LoginServlet.java
│   │         ├── RegisterServlet.java
│   │         ├── ProductServlet.java
│   │
│   ├── lib/
│   │    └── mysql-connector.jar
│   │
│   ├── classes/
│   │
│   ├── web.xml
🗄️ Database Setup
CREATE DATABASE agriculture;

USE agriculture;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    password VARCHAR(100)
);

CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    farmer_name VARCHAR(100),
    product_name VARCHAR(100),
    price DECIMAL(10,2),
    quantity INT
);
⚙️ How to Run the Project
Install Apache Tomcat Server
Install MySQL Server
Import project into Eclipse / IntelliJ IDEA
Add mysql-connector.jar inside WEB-INF/lib
Import SQL file into MySQL database
Configure DB username & password in JDBC code
Deploy project on Tomcat server
Run in browser:
http://localhost:8080/AgricultureMarketPlace-Application/
🧠 Learning Outcomes
JSP page development
Servlet handling (request & response)
JDBC database connectivity
CRUD operations
Web application deployment
MVC structure understanding
📌 Future Improvements
Add payment gateway 💳
Improve UI using Bootstrap 🎨
Add search and filter system 🔍
Role-based authentication 🔐
Cloud deployment ☁️
👨‍💻 Author

Indhu (Chinnu)

🎯 Note

This project is built for learning Java Web Development (JSP + Servlets + MySQL + Tomcat).
