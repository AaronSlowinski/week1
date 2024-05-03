CREATE TABLE categories (
    id SERIAL,
    name TEXT NOT NULL UNIQUE,
    description TEXT,
    picture TEXT,
    PRIMARY KEY (id)
);

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
