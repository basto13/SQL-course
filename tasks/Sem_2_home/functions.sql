SELECT Id AS 'Sale Id', order_date AS 'order date', count_product AS 'count product',
IF (count_product < 100, 'Small order',
	IF (count_product BETWEEN 100 AND 300, 'Medium order',
		IF (count_product > 300, 'Big order', 'undefined'))
	) AS 'Order type'
    FROM sem_2_home.sales;