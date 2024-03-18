-- Tạo database
DROP DATABASE LibraryManagement;
CREATE DATABASE LibraryManagement;

-- Sử dụng database
USE LibraryManagement;

-- Bảng Category
CREATE TABLE Category (
                          Id INT AUTO_INCREMENT PRIMARY KEY,
                          Name VARCHAR(100) NOT NULL,
                          Status TINYINT DEFAULT 1 CHECK (Status IN (0, 1))
);

-- Bảng Author
CREATE TABLE Author (
                        Id INT AUTO_INCREMENT PRIMARY KEY,
                        Name VARCHAR(100) NOT NULL UNIQUE,
                        TotalBook INT DEFAULT 0
);

-- Bảng Book
-- Bảng Book
-- Bảng Book
CREATE TABLE Book (
                      Id INT AUTO_INCREMENT PRIMARY KEY,
                      Name VARCHAR(150) NOT NULL,
                      Status TINYINT DEFAULT 1 CHECK (Status IN (0, 1)),
                      Price FLOAT NOT NULL CHECK (Price >= 100000),
                      CreatedDate DATETIME DEFAULT CURRENT_TIMESTAMP,
                      CategoryId INT NOT NULL,
                      AuthorId INT NOT NULL,
                      FOREIGN KEY (CategoryId) REFERENCES Category(Id),
                      FOREIGN KEY (AuthorId) REFERENCES Author(Id)
);

-- Bảng Customer
CREATE TABLE Customer (
                          Id INT AUTO_INCREMENT PRIMARY KEY,
                          Name VARCHAR(150) NOT NULL,
                          Email VARCHAR(150) NOT NULL UNIQUE,
                          Phone VARCHAR(50) NOT NULL UNIQUE,
                          Address VARCHAR(255),
                          CreatedDate DATETIME DEFAULT CURRENT_TIMESTAMP,
                          Gender TINYINT NOT NULL CHECK (Gender IN (0, 1, 2)),
                          BirthDay DATE NOT NULL
);

-- Bảng Ticket
CREATE TABLE Ticket (
                        Id INT AUTO_INCREMENT PRIMARY KEY,
                        CustomerId INT NOT NULL,
                        Status TINYINT DEFAULT 1 CHECK (Status IN (0, 1, 2, 3)),
                        TicketDate DATETIME DEFAULT CURRENT_TIMESTAMP,
                        FOREIGN KEY (CustomerId) REFERENCES Customer(Id)
);

-- Bảng TicketDetail
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

-- Yêu cầu dữ liệu mẫu

-- Thêm dữ liệu vào bảng Category
INSERT INTO Category (Name, Status) VALUES
                                        ('Fiction', 1),
                                        ('Science', 1),
                                        ('History', 1),
                                        ('Biography', 1),
                                        ('Self-Help', 1);

-- Thêm dữ liệu vào bảng Author
INSERT INTO Author (Name, TotalBook) VALUES
                                         ('Author 1', 0),
                                         ('Author 2', 0),
                                         ('Author 3', 0),
                                         ('Author 4', 0),
                                         ('Author 5', 0);

-- Thêm dữ liệu vào bảng Book
INSERT INTO Book (Name, Status, Price, CreatedDate, CategoryId, AuthorId) VALUES
                  ('Book 1', 1, 150000, CURDATE(), 1, 1),
                  ('Book 2', 1, 200000, CURDATE(), 2, 2),
                  ('Book 3', 1, 180000, CURDATE(), 1, 3),
                  ('Book 4', 1, 120000, CURDATE(), 3, 4),
                  ('Book 5', 1, 250000, CURDATE(), 2, 5),
                  ('Book 6', 1, 190000, CURDATE(), 4, 1),
                  ('Book 7', 1, 220000, CURDATE(), 3, 2),
                  ('Book 8', 1, 170000, CURDATE(), 1, 3),
                  ('Book 9', 1, 240000, CURDATE(), 5, 4),
                  ('Book 10', 1, 130000, CURDATE(), 4, 5),
                  ('Book 11', 1, 260000, CURDATE(), 2, 1),
                  ('Book 12', 1, 210000, CURDATE(), 3, 2),
                  ('Book 13', 1, 160000, CURDATE(), 1, 3),
                  ('Book 14', 1, 230000, CURDATE(), 5, 4),
                  ('Book 15', 1, 140000, CURDATE(), 4, 5);

-- Thêm dữ liệuTrong hệ thống quản lý mượn sách online, có thể sử dụng cấu trúc CSDL dưới đây:


