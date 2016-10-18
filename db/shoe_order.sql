DROP TABLE shoe_orders;

CREATE TABLE shoe_orders (
id SERIAL4 PRIMARY KEY,
full_name VARCHAR(255),
address VARCHAR(255),
quantity INT4,
size INT4
);
