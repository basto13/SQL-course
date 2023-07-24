CREATE DATABASE sem_2_home;
USE sem_2_home;
CREATE TABLE sales
(Id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
order_date DATE,
count_product INT);

INSERT INTO sales (order_date, count_product) VALUES ('2022-01-01', 156);
INSERT INTO sales (order_date, count_product) VALUES ('2022-01-02', 180);
INSERT INTO sales (order_date, count_product) VALUES ('2022-01-03', 21);
INSERT INTO sales (order_date, count_product) VALUES ('2022-01-04', 124);
INSERT INTO sales (order_date, count_product) VALUES ('2022-01-05', 341);
SELECT * FROM sales;

