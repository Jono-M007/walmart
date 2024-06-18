-- Exploratory data analysis --

-- How many unique cities does the data have ?
SELECT DISTINCT(city)
FROM sales; 

-- In which city is each branch ?
SELECT DISTINCT (city), branch
FROM sales;

-- How many unquie product lines does that date have ?
SELECT DISTINCT(product_line)
FROM sales;

SELECT 
	COUNT(DISTINCT product_line)
FROM sales;

-- Most common payment method
SELECT
	payment_method , COUNT(payment_method)
FROM sales
GROUP by payment_method;

-- What is the most selling product line ?
SELECT
	product_line , COUNT(product_line) AS count_of_transactions
FROM sales
GROUP by product_line
ORDER BY COUNT(product_line) DESC;

-- Total revenue per month
SELECT
	month_name , SUM(total) AS total_revenue
FROM sales 
GROUP BY month_name;

-- What month had the largest COGS?
SELECT
	month_name , SUM(cogs)
FROM sales 
GROUP BY month_name;

-- What product line had the largest revenue ?
SELECT 
	product_line , SUM(total) as productline_revenue
FROM sales 
GROUP BY product_line
ORDER by productline_revenue DESC;

-- Revenue per city
SELECT 
	city , SUM(total) AS city_revenue
FROM sales
GROUP BY city
ORDER BY city_revenue DESC;

-- What product line had the largest VAT ?
SELECT
	product_line ,  AVG(VAT) as avg_vat
FROM sales
GROUP BY product_line
ORDER BY avg_vat DESC;

-- Which brand sold more porudcts than average product sold ?
SELECT 
	branch, SUM(quantity) AS qty
FROM sales
GROUP BY branch
HAVING SUM(quantity) > (SELECT AVG(quantity) FROM sales);

-- More common product line by gender
SELECT
	gender , product_line , COUNT(gender) AS total_cnt
FROM sales
GROUP BY gender , product_line
ORDER BY total_cnt DESC;

-- What is the average rating of each product line
SELECT 
	product_line , ROUND(AVG(rating),2) AS avg_rating
FROM sales
GROUP BY product_line
ORDER BY avg_rating DESC;

-- What is the number of sales made in each time of the day per weekday?
SELECT time_of_day , COUNT(*) AS total_sales
FROM sales
WHERE day_name = 'Monday' OR day_name= 'Tuesday' OR day_name='Wednesday' or day_name = 'Thursday' or day_name = 'Friday'
GROUP BY time_of_day
ORDER BY total_sales DESC;

-- Wich customer types bring in the most revenue ?
SELECT customer_type , SUM(total) as total_revenue
FROM sales
GROUP BY customer_type
ORDER BY total_revenue DESC;

-- Which city has the laregest VAT ?
SELECT city , AVG(VAT) AS avg_vat
FROM sales
GROUP BY city
ORDER BY avg_vat DESC;

-- Which customers pays the most VAT?
SELECT customer_type , AVG(VAT) AS avg_vat
FROM sales
GROUP BY customer_type
ORDER BY avg_vat DESC;

-- How many unique customer types does the data have ?
SELECT DISTINCT(customer_type)
FROM sales;

-- How many unique payment methods does the data have ?
SELECT DISTINCT(payment_method)
FROM sales;

-- What is the most common customer type
SELECT customer_type, COUNT(*) AS number_of_transactions
FROM sales
GROUP BY customer_type
ORDER BY number_of_transactions DESC;

-- What is the gender of most of the customers ?
SELECT gender , COUNT(*) AS number_of_transactions
FROM sales
GROUP BY gender
ORDER BY number_of_transactions DESC;

-- What is the gender distribution per branch ?
SELECT	branch , gender , COUNT(*) as number_of_transactions
FROM sales
GROUP BY branch , gender 
ORDER BY number_of_transactions;

-- What time of the day do customers give most ratings ?
SELECT time_of_day , COUNT(rating) AS number_of_ratings
FROM sales
GROUP BY time_of_day
ORDER BY number_of_ratings DESC;

-- Which day of the week has the best average ratings ?
SELECT day_name , AVG(rating) AS avg_rating
FROM sales
GROUP BY day_name
ORDER BY avg_rating DESC;