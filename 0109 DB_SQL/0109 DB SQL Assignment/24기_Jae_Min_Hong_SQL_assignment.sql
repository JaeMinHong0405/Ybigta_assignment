CREATE TABLE w3schools.first_question (
	SELECT c.CustomerID, 
			c.CustomerName,
			round(sum(od.Quantity*p.Price),2) AS customer_purchase
	FROM w3schools.Products AS p
		JOIN w3schools.OrderDetails AS od
		ON od.ProductID = p.ProductID
		JOIN w3schools.Orders AS o
		ON o.OrderID = od.OrderID
		JOIN w3Schools.Customers AS c
		ON c.CustomerID = o.CustomerID
	GROUP BY 1,2
	ORDER BY 1
);

SELECT * FROM w3schools.first_question;

DROP TABLE IF EXISTS w3schools.second_question;

CREATE TABLE w3schools.second_question (
	SELECT c.CategoryName,
			sum(od.Quantity) AS order_quantity,
            round(sum(od.Quantity * p.Price),2) AS order_purchase
	FROM w3schools.Products AS p
		JOIN w3schools.Categories AS c
        ON c.CategoryID = p.CategoryID
        JOIN w3schools.OrderDetails AS od
        ON od.ProductID = p.ProductID
    GROUP BY 1
    HAVING order_quantity >= 2000
    ORDER BY 2 DESC
);

SELECT * FROM w3schools.second_question;

DROP TABLE IF EXISTS w3schools.third_question;

CREATE TABLE w3schools.third_question (
	SELECT * FROM w3schools.second_question
	WHERE order_purchase > (
		SELECT round(sum(od.Quantity * p.Price),2) AS order_purchase
		FROM w3schools.Products AS p
			JOIN w3schools.Categories AS c
			ON c.CategoryID = p.CategoryID
			JOIN w3schools.OrderDetails AS od
			ON od.ProductID = p.ProductID
		WHERE c.CategoryName = 'Seafood'
		GROUP BY c.CategoryName 
	)
    ORDER BY order_quantity DESC
);

SELECT * FROM w3schools.third_question;





