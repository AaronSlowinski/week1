-- kill other connections
SELECT pg_terminate_backend(pg_stat_activity.pid)
FROM pg_stat_activity
WHERE pg_stat_activity.datname = 'week1_workshop' AND pid <> pg_backend_pid();
-- (re)create the database
DROP DATABASE IF EXISTS week1_workshop;
CREATE DATABASE week1_workshop;
-- connect via psql
\c week1_workshop

-- database configuration
SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET default_tablespace = '';
SET default_with_oids = false;


---
--- CREATE tables
---

CREATE TABLE products (
    id SERIAL,
    name TEXT NOT NULL,
    discontinued BOOLEAN NOT NULL,
    supplier_id INT,
    category_id INT,
    PRIMARY KEY (id)
);


CREATE TABLE categories (
    id SERIAL,
    name TEXT UNIQUE NOT NULL,
    description TEXT,
    picture TEXT,
    PRIMARY KEY (id)
);

-- TODO create more tables here...

CREATE TABLE supplier (
    id SERIAL,
    name TEXT NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE customers (
    id SERIAL,
    company_name TEXT NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE employees (
    id SERIAL,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE orders (
    id SERIAL,
    date DATE,
    customer_id INT NOT NULL,
    employee_id INT,
    PRIMARY KEY (id)
);

CREATE TABLE orders_products(
    product_id INT NOT NULL,
    order_id INT NOT NULL,
    quantity INT NOT NULL,
    discount NUMERIC NOT NULL,
    PRIMARY KEY (product_id, order_id)
);

CREATE TABLE territory (
    id SERIAL NOT NULL,
    description TEXT NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE employee_territories(
    employee_id INT NOT NULL,
    territory_id INT NOT NULL,
    PRIMARY KEY (employee_id, territory_id)
);

CREATE TABLE offices (
    id INT NOT NULL,
    address_line TEXT NOT NULL,
    territory_id INT NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE us_states (
    id INT NOT NULL,
    name TEXT NOT NULL,
    abbreviation CHARACTER(2) NOT NULL,
    PRIMARY KEY (id)
);

---
--- Add foreign key constraints
---


ALTER TABLE orders
ADD CONSTRAINT fk_orders_customers
FOREIGN KEY (customer_id)
REFERENCES customers (id);

ALTER TABLE orders
ADD CONSTRAINT fk_orders_employees
FOREIGN KEY (employee_id)
REFERENCES employees (id);

ALTER TABLE products
ADD CONSTRAINT fk_products_supplier
FOREIGN KEY (supplier_id)
REFERENCES supplier (id);


ALTER TABLE products
ADD CONSTRAINT fk_products_categories
FOREIGN KEY (category_id)
REFERENCES categories (id);






-- PRODUCTS

ALTER TABLE products
ADD CONSTRAINT fk_products_categories 
FOREIGN KEY (category_id) 
REFERENCES categories (id);


-- TODO create more constraints here...
