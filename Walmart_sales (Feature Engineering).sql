SELECT * FROM walmartsales.sales;

-- Feature Engineering--
-- create new column called time_of_day to view during which time of the day the sales occured
SELECT time,
	(CASE
		WHEN `time` BETWEEN "00:00:00" and "12:00:00" THEN "Morning"
        WHEN `time` BETWEEN "12:01:00" and "16:00:00" THEN "Afternoon"
        ELSE "Evening"
	END
    ) AS time_of_day
FROM sales;

ALTER TABLE sales ADD COLUMN time_of_day VARCHAR(20);

UPDATE sales
SET time_of_day = (
	CASE
		WHEN `time` BETWEEN "00:00:00" and "12:00:00" THEN "Morning"
        WHEN `time` BETWEEN "12:01:00" and "16:00:00" THEN "Afternoon"
        ELSE "Evening"
	END
);

-- create new column called day_name to view on which day the sales transction occurred
SELECT 
	date,
    DAYNAME(date)
FROM sales;

ALTER TABLE sales ADD COLUMN day_name VARCHAR(10);

UPDATE sales
SET day_name= DAYNAME(date);

-- create new column called month_name to extrace the month of year on which the sales transaction occured
SELECT 
	date,
    MONTHNAME(date) 
FROM sales;

ALTER TABLE sales ADD COLUMN month_name VARCHAR(10);
ALTER TABLE sales DROP COLUMN momth_name;

UPDATE sales
SET month_name =  MONTHNAME(date);

