-- Create Library Management System Database
CREATE DATABASE LibraryDB;
USE LibraryDB;

-- 1. Table for Books
CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(150) NOT NULL,
    isbn VARCHAR(50) UNIQUE NOT NULL,
    publisher VARCHAR(150),
    published_year INT,
    category VARCHAR(100),
    total_copies INT DEFAULT 1,
    available_copies INT DEFAULT 1
);

-- 2. Table for Users (Students/Members)
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(150) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_field VARCHAR(20),
    membership_date DATE DEFAULT (CURRENT_DATE),
    status ENUM('Active', 'Suspended') DEFAULT 'Active'
);

-- 3. Table for Book Issue and Return Transactions
CREATE TABLE Transactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT,
    user_id INT,
    issue_date DATE DEFAULT (CURRENT_DATE),
    due_date DATE NOT NULL,
    return_date DATE NULL,
    fine_amount DECIMAL(10,2) DEFAULT 0.00,
    FOREIGN KEY (book_id) REFERENCES Books(book_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
);

-- 4. Table for System Admins / Librarians
CREATE TABLE Staff (
    staff_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    role ENUM('Librarian', 'Admin') DEFAULT 'Librarian'
);
