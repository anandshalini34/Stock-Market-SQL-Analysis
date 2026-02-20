-- Display all records from the stocks table.
SELECT * FROM STOCKS;

-- Retrieve only the Date, Open, and Close columns.
SELECT DATE , OPEN , CLOSE
 FROM STOCKS;
 
 -- Fetch the latest 10 trading records ordered by date.
SELECT * 
FROM STOCKS
ORDER BY DATE DESC
LIMIT 10;

-- Retrieve all records where the closing price is greater than the opening price.
SELECT *
FROM STOCKS
WHERE CLOSE > OPEN;

-- Retrieve all records for the year 2023.
SELECT * 
FROM STOCKS 
WHERE YEAR(Date) = 2023;

-- Calculate the average closing price across all records.
SELECT AVG(CLOSE) FROM STOCKS;

-- Retrieve tickers whose average closing price is greater than 150.
SELECT TICKER , AVG(CLOSE)
FROM STOCKS
GROUP BY TICKER
HAVING AVG(CLOSE) >150;

-- Calculate the monthly average closing price.
SELECT EXTRACT(MONTH FROM DATE) AS MONTH , AVG(CLOSE) AS MONTHLY AVG PRICE
FROM STOCKS
GROUP BY EXTRACT(MONTH FROM DATE);

-- Calculate the yearly total trading volume.
SELECT EXTRACT(YEAR FROM DATE) AS YEAR , SUM(VOLUME) AS YEARLY TRADING VOLUME
FROM STOCKS
GROUP BY EXTRACT(YEAR FROM DATE);

-- Identify the month with the highest average closing price.
SELECT MONTH(Date) AS month, AVG(Close) AS avg_close
FROM stocks
GROUP BY  MONTH(Date)
ORDER BY avg_close DESC
LIMIT 1;

-- Retrieve the top 5 trading days with the highest closing price
SELECT Date, Close
FROM stocks
ORDER BY Close DESC
LIMIT 5;

-- Identify the most volatile trading days based on (High − Low)
SELECT Date, (High - Low) AS price_range
FROM stocks
ORDER BY price_range DESC
LIMIT 5;

-- Records where daily price range > overall average range
SELECT *
FROM stocks
WHERE (High - Low) > (SELECT AVG(High - Low)FROM stocks);

-- Calculate total profit for the stock (Close − Open)
SELECT SUM(Close - Open) AS total_profit
FROM stocks
WHERE Close > Open;

-- Top 5 most profitable trading days
SELECT Date, (Close - Open) AS profit
FROM stocks
WHERE Close > Open
ORDER BY profit DESC
LIMIT 5;

-- Find the worst 5 trading days based on loss..
SELECT Date, (Open - Close) AS loss
FROM stocks
WHERE Open > Close
ORDER BY loss DESC
LIMIT 5;

-- Most stable month (lowest price fluctuation)
SELECT MONTH(Date) AS month, AVG(High - Low) AS avg_fluctuation
FROM stocks
GROUP BY  MONTH(Date)
ORDER BY avg_fluctuation ASC
LIMIT 1;
