-- This script creates two tables: Customers and Orders.

-- Customers table stores information about the customers.
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(255),
    ContactName VARCHAR(255),
    Address VARCHAR(255),
    City VARCHAR(255),
    PostalCode VARCHAR(10),
    Country VARCHAR(255)
);

-- Orders table stores information about the orders.
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    ShipAddress VARCHAR(255),
    ShipCity VARCHAR(255),
    ShipPostalCode VARCHAR(10),
    ShipCountry VARCHAR(255),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);


CREATE TABLE categories (
    id SERIAL,
    name TEXT NOT NULL UNIQUE,
    description TEXT,
    picture TEXT,
    PRIMARY KEY (id)
);
-- Add comments here

CREATE Table products (
    id SERIAL,
    name TEXT NOT NULL,
    DIscontinued BOOLEAN NOT NULL,
    category_id INT,
    PRIMARY KEY (id)
);

ALTER TABLE products
ADD CONSTRAINT fk_products_categories
FOREIGN KEY (category_id)
REFERENCES categories;
CREATE Table products (
    id SERIAL,
    name TEXT NOT NULL,
    DIscontinued BOOLEAN NOT NULL,
    category_id INT,
    PRIMARY KEY (id)
);

ALTER TABLE products
ADD CONSTRAINT fk_products_categories
FOREIGN KEY (category_id)
REFERENCES categories;
