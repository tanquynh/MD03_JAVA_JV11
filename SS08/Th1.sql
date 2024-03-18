CREATE DATABASE LibraryManagement;

USE LibraryManagement;

-- Tạo bảng Category
CREATE TABLE Category (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Status TINYINT DEFAULT 1 CHECK (Status IN (0,1))
);

-- Tạo bảng Author
CREATE TABLE Author (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL UNIQUE,
    TotalBook INT DEFAULT 0
);

-- Tạo bảng Book
CREATE TABLE Book (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(150) NOT NULL,
    Status TINYINT DEFAULT 1 CHECK (Status IN (0,1)),
    Price FLOAT NOT NULL CHECK (Price >= 100000),
    CreatedDate DATE DEFAULT current_timestamp(),
    CategoryId INT NOT NULL,
    FOREIGN KEY(CategoryId) REFERENCES Category(Id),
    AuthorId INT NOT NULL,
    FOREIGN KEY(AuthorId) REFERENCES Author(Id)
);

-- Tạo bảng Customer
CREATE TABLE Customer (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(150) NOT NULL,
    Email VARCHAR(150) NOT NULL UNIQUE CHECK (Email LIKE '%@gmail.com' OR Email LIKE '%@facebook.com' OR Email LIKE '%@bachkhoa-aptech.edu.vn'),
    Phone VARCHAR(50) NOT NULL UNIQUE,
    Address VARCHAR(255),
    CreatedDate DATE DEFAULT CURRENT_TIMESTAMP CHECK (CreatedDate >= CURRENT_TIMESTAMP),
    Gender TINYINT NOT NULL CHECK (Gender IN (0,1,2)),
    BirthDay DATE NOT NULL
);

-- Tạo bảng Ticket
CREATE TABLE Ticket (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    CustomerId INT NOT NULL,
    FOREIGN KEY(CustomerId) REFERENCES Customer(Id),
    Status TINYINT DEFAULT 1 CHECK (Status IN (0,1,2,3)),
    TicketDate DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Tạo bảng TicketDetail
CREATE TABLE TicketDetail (
    TicketId INT NOT NULL,
    BookId INT NOT NULL,
    Quantity INT NOT NULL CHECK (Quantity > 0),
    DeposiPrice FLOAT NOT NULL,
    RentCost FLOAT NOT NULL,
    PRIMARY KEY (TicketId, BookId),
    FOREIGN KEY (TicketId) REFERENCES Ticket(Id),
    FOREIGN KEY (BookId) REFERENCES Book(Id)
);
