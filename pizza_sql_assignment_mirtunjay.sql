create Database Pizza_SQl_Project ;

use pizza_sql_project ;


/* What is the Total Revenue ? */
select sum(Price) AS Total_Revenue 
from pizzas ;

/*  what is the Average of Order Value ? */
 select (sum(Price) / count(DISTINCT pizza_id )) AS AVG_Order_Value
 from pizzas ;
 
 /* What is the Total Sold  PIzza ? */
 Select sum(quantity ) AS  Total_pizza_sold  
 FROM order_details ;


/* Get the most common ingredients used in pizzas*/
SELECT COUNT(DISTINCT ï»¿Pizza_type_id) AS Unique_Pizza_Types
FROM pizza_types;
 
 /*Price distribution of pizzas across different sizes:*/
SELECT Size, MIN(Price) AS Min_Price, MAX(Price) AS Max_Price, AVG(Price) AS Avg_Price
FROM pizzas
GROUP BY Size;

/* Get the highest and lowest priced pizzas*/
SELECT pizza_id, Price 
FROM pizzas
ORDER BY Price DESC
LIMIT 3;  -- Highest price

SELECT pizza_id, Price 
FROM pizzas
ORDER BY Price ASC
LIMIT 3;  -- Lowest price

/*Average price per pizza category*/
SELECT pt.Category, AVG(p.Price) AS Avg_Price
FROM pizzas p
JOIN pizza_types pt ON p.Pizza_type_id = pt.ï»¿Pizza_type_id
GROUP BY pt.category;

/*Find pizza types that are only available in specific sizes*/
SELECT Pizza_type_id, COUNT(DISTINCT Size) AS Unique_Sizes
FROM pizzas
GROUP BY Pizza_type_id
HAVING Unique_Sizes = 1;


/*Are certain categories of pizzas more expensive on average?*/

SELECT Category, AVG(Price) AS Avg_Price
FROM pizzas p
JOIN pizza_types pt ON p.Pizza_type_id = pt.ï»¿Pizza_type_id
GROUP BY Category
ORDER BY Avg_Price DESC;

/*Most expensive pizza category on average:*/
SELECT pt.Category, AVG(p.Price) AS Avg_Price
FROM pizzas p
JOIN pizza_types pt ON p.Pizza_type_id = pt.ï»¿Pizza_type_id
GROUP BY pt.Category
ORDER BY Avg_Price DESC
LIMIT 3;
