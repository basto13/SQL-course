CREATE TABLE orders
(Id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
employee_id varchar(10),
amount DECIMAL,
order_status VARCHAR(10)
);

TRUNCATE TABLE orders;
ALTER TABLE orders
MODIFY COLUMN amount DECIMAL(6,2);
INSERT INTO orders (employee_id, amount, order_status) VALUES ('e03', 15.00, 'OPEN');
INSERT INTO orders (employee_id, amount, order_status) VALUES ('e01', 25.50, 'OPEN');
INSERT INTO orders (employee_id, amount, order_status) VALUES ('e05', 100.70, 'CLOSED');
INSERT INTO orders (employee_id, amount, order_status) VALUES ('e02', 22.18, 'OPEN');
INSERT INTO orders (employee_id, amount, order_status) VALUES ('e04', 9.50, 'CANCELLED');
SELECT * FROM orders;

SELECT Id AS "Order number", employee_id AS "Employee id", amount AS "Amount",
CASE
WHEN order_status = 'OPEN' THEN 'Order is in open state'
WHEN order_status = 'CLOSED' THEN 'Order is closed'
WHEN order_status = 'CANCELLED' THEN 'Order is cancelled'
ELSE 'Undefined'
END AS "full_order_status"
FROM sem_2_home.orders;