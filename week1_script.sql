-- This table stores information about customers.
CREATE TABLE customers (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(100),
    address VARCHAR(200)
);

-- This table stores information about orders placed by customers.
CREATE TABLE orders (
    id INT PRIMARY KEY,
    customer_id INT,
    product VARCHAR(50),
    quantity INT,
    price DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

-- This query selects all customers from the customers table.
SELECT * FROM customers;

-- This query selects all orders placed by customers from the orders table.
SELECT * FROM orders;

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
