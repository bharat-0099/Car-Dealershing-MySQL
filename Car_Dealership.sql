create database Car_Dealership; -- To Create new Database named Car Dealership
-- To Use the Created Database 
use Car_Dealership;

-- Creating Customer Table
CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15),
    address VARCHAR(255),
    preferred_contact_method ENUM('Email', 'Phone', 'SMS')
);

-- Inserting Values to Customer Table
INSERT INTO Customers (first_name, last_name, email, phone, address, preferred_contact_method) VALUES
('John', 'Doe', 'johndoe@example.com', '123-456-7890', '123 Maple St, Springfield, IL', 'Email'),
('Jane', 'Smith', 'janesmith@example.com', '987-654-3210', '456 Oak St, Springfield, IL', 'Phone'),
('Alice', 'Johnson', 'alicejohnson@example.com', '555-123-4567', '789 Pine St, Springfield, IL', 'SMS'),
('Michael', 'Williams', 'michaelw@example.com', '789-267-987', '101 Birch St, Springfield, IL', 'Email'),
('Emily', 'Brown', 'emilybrown@example.com', '222-333-4444', '202 Cedar St, Springfield, IL', 'Phone'),
('David', 'Jones', 'davidjones@example.com', '333-444-5555', '303 Willow St, Springfield, IL', 'SMS'),
('Sarah', 'Miller', 'sarahm@example.com', '989-087-5643', '404 Elm St, Springfield, IL', 'Email'),
('Robert', 'Taylor', 'robertt@example.com', '444-555-6666', '505 Cherry St, Springfield, IL', 'Phone'),
('Jessica', 'Anderson', 'jessicaa@example.com', '666-777-8888', '606 Poplar St, Springfield, IL', 'SMS'),
('Daniel', 'Thomas', 'danielt@example.com', '890-876-1467', '707 Ash St, Springfield, IL', 'Email');

-- Displaying Values from Customer Table

Select * From Customers;

-- Creating Vehicles Table
CREATE TABLE Vehicles (
    vehicle_id INT AUTO_INCREMENT PRIMARY KEY,
    make VARCHAR(50) NOT NULL,
    model VARCHAR(50) NOT NULL,
    year YEAR NOT NULL,
    color VARCHAR(30),
    mileage INT,
    price DECIMAL(10, 2) NOT NULL,
    status ENUM('Available', 'Sold', 'Reserved') DEFAULT 'Available');
    
    -- Inserting Values to Vehicles table
INSERT INTO Vehicles (make, model, year, color, mileage, price, status) VALUES
('Toyota', 'Camry', 2018, 'Silver', 45000, 17999.99, 'Available'),
('Honda', 'Civic', 2020, 'Blue', 32000, 21999.99, 'Sold'),
('Ford', 'Mustang', 2021, 'Red', 15000, 28999.99, 'Reserved'),
('Chevrolet', 'Malibu', 2019, 'Black', 28000, 18999.99, 'Available'),
('Nissan', 'Altima', 2017, 'White', 62000, 15999.99, 'Sold'),
('Hyundai', 'Elantra', 2022, 'Gray', 10000, 24999.99, 'Available'),
('BMW', '3 Series', 2020, 'Black', 30000, 35999.99, 'Reserved'),
('Mercedes', 'C-Class', 2019, 'Silver', 41000, 33999.99, 'Available'),
('Audi', 'A4', 2018, 'Blue', 50000, 29999.99, 'Sold'),
('Tesla', 'Model 3', 2022, 'White', 5000, 45999.99, 'Available');

-- Displaying Values for Vehicles table

Select * from Vehicles;

-- Creating Sales Representation table
CREATE TABLE Sales_Reps (
    sales_rep_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15),
    commission_rate DECIMAL(5, 2) NOT NULL CHECK (commission_rate >= 0 AND commission_rate <= 100)
);

-- Inserting Values to Sales Reprentation Table
INSERT INTO Sales_Reps (first_name, last_name, email, phone, commission_rate) VALUES
('Sarah', 'Johnson', 'sjohnson@example.com', '123-456-7890', 7.5),
('Michael', 'Williams', 'mwilliams@example.com', '234-567-8901', 8.0),
('Laura', 'Smith', 'lsmith@example.com', '345-678-9012', 6.0),
('David', 'Brown', 'dbrown@example.com', '456-789-0123', 5.5),
('Emily', 'Davis', 'edavis@example.com', '567-890-1234', 7.0),
('James', 'Wilson', 'jwilson@example.com', '678-901-2345', 6.5),
('Sophia', 'Martinez', 'smartinez@example.com', '789-012-3456', 7.2),
('Daniel', 'Garcia', 'dgarcia@example.com', '890-123-4567', 8.5),
('Olivia', 'Lee', 'olee@example.com', '901-234-5678', 6.8),
('Benjamin', 'Taylor', 'btaylor@example.com', '012-345-6789', 7.3);

-- Displaying Values from Sales Represenation table
Select * from Sales_Reps;

-- Creating Sales Table

CREATE TABLE Sales (
    sale_id INT AUTO_INCREMENT PRIMARY KEY,
    vehicle_id INT NOT NULL,
    customer_id INT NOT NULL,
    sale_date DATE NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    sales_rep_id INT ,
    FOREIGN KEY (vehicle_id) REFERENCES Vehicles(vehicle_id) ON DELETE CASCADE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) ON DELETE CASCADE,
    FOREIGN KEY (sales_rep_id) REFERENCES Sales_Reps(sales_rep_id) ON DELETE SET NULL
);
-- Inserting Values to Sales Values
INSERT INTO Sales (vehicle_id, customer_id, sale_date, price, sales_rep_id) VALUES
(1, 1, '2024-01-15', 17999.99, 2),
(2, 3, '2024-02-20', 21999.99, 4),
(5, 4, '2024-03-05', 15999.99, 5),
(7, 2, '2024-04-10', 35999.99, 3),
(9, 1, '2024-05-25', 29999.99, 6),
(3, 2, '2024-06-15', 28999.99, 1),
(8, 5, '2024-07-20', 33999.99, 7),
(6, 6, '2024-08-30', 24999.99, 8),
(4, 8, '2024-09-10', 18999.99, 9),
(10, 7, '2024-10-05', 45999.99, 10);

-- Displaying Values  from Sales Table
 Select * from Sales; 
 
 -- Creating Inventory Table
 CREATE TABLE Inventory (
    inventory_id INT AUTO_INCREMENT PRIMARY KEY,
    vehicle_id INT NOT NULL,
    quantity INT NOT NULL DEFAULT 1,
    location VARCHAR(100) NOT NULL,
    FOREIGN KEY (vehicle_id) REFERENCES Vehicles(vehicle_id) ON DELETE CASCADE
);

-- Inserting values to Inventory Table
INSERT INTO Inventory (vehicle_id, quantity, location) VALUES
(1, 3, 'Warehouse A'),
(2, 2, 'Warehouse B'),
(3, 1, 'Showroom'),
(4, 5, 'Warehouse A'),
(5, 4, 'Warehouse C'),
(6, 2, 'Showroom'),
(7, 3, 'Warehouse B'),
(8, 1, 'Warehouse A'),
(9, 2, 'Warehouse C'),
(10, 1, 'Showroom');

-- Displaying Values from Inventory Table
Select * from Inventory;

-- Creating Service Table
CREATE TABLE Service_Records (
    service_id INT AUTO_INCREMENT PRIMARY KEY,
    vehicle_id INT NOT NULL,
    service_date DATE NOT NULL,
    description TEXT,
    cost DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (vehicle_id) REFERENCES Vehicles(vehicle_id) ON DELETE CASCADE
);

-- Inserting values to Service Table
INSERT INTO Service_Records (vehicle_id, service_date, description, cost) VALUES
(1, '2024-01-10', 'Oil change and tire rotation', 150.00),
(2, '2024-02-15', 'Brake replacement', 300.00),
(3, '2024-03-20', 'Battery replacement', 200.00),
(4, '2024-04-25', 'Transmission fluid change', 350.00),
(5, '2024-05-30', 'Air filter replacement', 100.00),
(6, '2024-06-15', 'Spark plug replacement', 120.00),
(7, '2024-07-20', 'Coolant flush', 180.00),
(8, '2024-08-25', 'Suspension check', 220.00),
(9, '2024-09-30', 'AC maintenance', 250.00),
(10, '2024-10-05', 'Wheel alignment', 130.00);

-- Displaying values 
select * from Service_Records;

-- Creating Test Drivers Table
CREATE TABLE Test_Drives (
    test_drive_id INT AUTO_INCREMENT PRIMARY KEY,
    vehicle_id INT NOT NULL,
    customer_id INT NOT NULL,
    sales_rep_id INT,
    date DATE NOT NULL,
    status ENUM('Completed', 'Canceled', 'Scheduled') DEFAULT 'Scheduled',
    FOREIGN KEY (vehicle_id) REFERENCES Vehicles(vehicle_id) ON DELETE CASCADE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) ON DELETE CASCADE,
    FOREIGN KEY (sales_rep_id) REFERENCES Sales_Reps(sales_rep_id) ON DELETE SET NULL
);

-- Inserting Values to Test Drivers Table
INSERT INTO Test_Drives (vehicle_id, customer_id, sales_rep_id, date, status) VALUES
(1, 1, 2, '2024-01-12', 'Completed'),
(2, 3, 4, '2024-02-18', 'Canceled'),
(3, 4, 1, '2024-03-25', 'Scheduled'),
(4, 2, 3, '2024-04-15', 'Completed'),
(5, 5, 6, '2024-05-22', 'Scheduled'),
(6, 6, 5, '2024-06-18', 'Completed'),
(7, 2, 7, '2024-07-24', 'Canceled'),
(8, 3, 8, '2024-08-16', 'Scheduled'),
(9, 1, 9, '2024-09-21', 'Completed'),
(10, 4, 10, '2024-10-11', 'Scheduled');

-- Displaying Values from Test Drives Table

select * from Test_Drives;

-- Find All Available Vehicles Under $30,000
SELECT * FROM Vehicles WHERE price < 30000 AND status = 'Available';

-- Show All Sales Made by a Specific Sales Representative
SELECT s.sale_id, v.make, v.model, s.price, s.sale_date FROM Sales s
JOIN Vehicles v ON s.vehicle_id = v.vehicle_id
WHERE s.sales_rep_id = "[specific_sales_rep_id]";

-- Get a List of Test Drives Scheduled for a Specific Date
SELECT t.test_drive_id, c.first_name, c.last_name, v.make, v.model, t.date 
FROM Test_Drives t 
JOIN Customers c ON t.customer_id = c.customer_id 
JOIN Vehicles v ON t.vehicle_id = v.vehicle_id 
WHERE t.date = '2024-11-07' ;

-- Calculate the Total Commission Earned by Each Sales Represenatative
SELECT sr.sales_rep_id, sr.first_name, sr.last_name, SUM(s.price * sr.commission_rate / 100) AS total_commission
FROM Sales_Reps sr
JOIN Sales s ON sr.sales_rep_id = s.sales_rep_id
GROUP BY sr.sales_rep_id;










