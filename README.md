# 🌾 Agriculture Marketplace Application

## 📌 Overview
The Agriculture Marketplace Application is a dynamic web-based project that connects farmers and buyers. Farmers can add and manage their agricultural products, and buyers can view available products.

This project is developed using **JSP, Servlets, MySQL, and Apache Tomcat**, focusing on CRUD operations and database integration.

---

## 🚀 Features
- 👨‍🌾 Farmer registration and login  
- 🛒 Add and manage agricultural products  
- 📦 View product listings  
- ✏️ Update product details  
- ❌ Delete products  
- 🔐 Admin functionality  
- 🗄️ MySQL database integration  
- 🌐 Dynamic web pages using JSP  
- ⚙️ Backend logic using Servlets  

---

## 🛠️ Technologies Used
- Frontend: HTML, CSS, JSP  
- Backend: Java Servlets  
- Database: MySQL  
- Server: Apache Tomcat  
- Connectivity: JDBC  
- Language: Java  

---

## 📁 Project Structure
------

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
----------

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


## ⚙️ How to Run the Project

1. Install Apache Tomcat Server  
2. Install MySQL Server  
3. Import project into Eclipse / IntelliJ IDEA  
4. Add mysql-connector.jar inside WEB-INF/lib  
5. Import SQL file into MySQL database  
6. Configure DB username & password in JDBC code  
7. Deploy project on Tomcat server  
8. Run in browser:  

http://localhost:8080/AgricultureMarketPlace-Application/

---

## 🧠 Learning Outcomes

- JSP page development  
- Servlet handling (request & response)  
- JDBC database connectivity  
- CRUD operations  
- Web application deployment  
- MVC structure understanding  

---

## 📌 Future Improvements

1. Add payment gateway 💳  
2. Improve UI using Bootstrap 🎨  
3. Add search and filter system 🔍  
4. Role-based authentication 🔐  
5. Cloud deployment ☁️  

---

## 👨‍💻 Author

Indhu
