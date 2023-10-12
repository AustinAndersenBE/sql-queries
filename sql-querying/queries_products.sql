-- Add a product with the name of “chair”, price of 44.00, and can_be_returned of false
INSERT INTO products (name, price, can_be_returned) VALUES ('chair', 44.00, false);

-- Add a product with the name of “stool”, price of 25.99, and can_be_returned of true
INSERT INTO products (name, price, can_be_returned) VALUES ('stool', 25.99, true);

-- Add a product to the table with the name of “table”, price of 124.00, and can_be_returned of false
INSERT INTO products (name, price, can_be_returned) VALUES ('table', 124.00, false);

-- Display all of the rows and columns in the table.
SELECT * FROM products;

-- Display all of the names of the products in the table.
SELECT name FROM products;

-- Add a new product - make up whatever you would like!
INSERT INTO products (name, price, can_be_returned) VALUES ('ladder', 235.00, true);

-- Display only the products that can be returned.
SELECT * FROM products WHERE can_be_returned = true;

-- Display only the products that have a price less than 44.00.
SELECT * FROM products WHERE price < 44.00;

-- Display only the products that have a price between 22.50 and 99.99.
SELECT * FROM products WHERE price BETWEEN 22.50 AND 99.99;

-- Update the data base to reflect a 20 dollar off for everything
UPDATE products SET price = price - 20.00;

-- remove everything that costs less than 25 dollars
DELETE FROM products WHERE price < 25.00;

-- Update the remaining products price by 20 dollars
UPDATE products SET price = price + 20.00;

--Make everything returnable
UPDATE products SET can_be_returned = true;
