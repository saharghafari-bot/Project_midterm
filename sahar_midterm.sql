PRAGMA foreign_keys = 0;

CREATE TABLE sqlitestudio_temp_table AS SELECT *
                                          FROM cafe_sale;

DROP TABLE cafe_sale;

CREATE TABLE cafe_sale (
    [Transaction ID]   TEXT    PRIMARY KEY,
    Items_Sold         TEXT    NOT NULL,
    Quantity           INTEGER NOT NULL,
    Price_Per_Unit     INTEGER NOT NULL,
    Total_spent        INTEGER NOT NULL,
    Payment_Method     TEXT,
    Payment_Location   TEXT,
    Transaction_date2  TEXT,
    Transaction_Month  TEXT,
    [Transaction _day] TEXT
);

INSERT INTO cafe_sale (
                          [Transaction ID],
                          Items_Sold,
                          Quantity,
                          Price_Per_Unit,
                          Total_spent,
                          Payment_Method,
                          Payment_Location,
                          Transaction_date2,
                          Transaction_Month,
                          [Transaction _day]
                      )
                      SELECT "Transaction ID",
                             Items_Sold,
                             Quantity,
                             Price_Per_Unit,
                             Total_spent,
                             Payment_Method,
                             Payment_Location,
                             Transaction_date2,
                             Transaction_Month,
                             "Transaction _day"
                        FROM sqlitestudio_temp_table;

DROP TABLE sqlitestudio_temp_table;

PRAGMA foreign_keys = 1;
INSERT INTO cafe_sale (
                          [Transaction ID
],
                          [Items_Sold
],
                          [Quantity
],
                          [Price Per Unit
],
                          [Total_spent
],
                          [Payment_Method
],
                          [Payment_Location
],
                          [Transaction_date2
],
                          [Transaction_Month
],
                          [Transaction _day
]
                      )
                      SELECT "Transaction ID
",
                             "Items_Sold
",
                             "Quantity
",
                             "Price Per Unit
",
                             "Total_spent
",
                             "Payment_Method
",
                             "Payment_Location
",
                             "Transaction_date2
",
                             "Transaction_Month
",
                             "Transaction _day
"
                        FROM sqlitestudio_temp_table;

DROP TABLE sqlitestudio_temp_table;

PRAGMA foreign_keys = 1;

--Write queries to verify row counts match your original dataset
SELECT COUNT(*) AS Total_Rows
FROM cafe_sale;



 -- Business question1 
 
 --which cafe item have the highest customer demand
 
 SELECT
    Items_Sold,
    SUM(Quantity) AS Total_Quantity_sold
FROM cafe_sale
GROUP BY Items_Sold
ORDER BY Total_Quantity_sold DESC;
-- -- Business question2
 

-- Which cafe item generates the highest revenue
SELECT
    Items_Sold,
    SUM(Total_spent) AS Total_profit

FROM cafe_sale
GROUP BY Items_sold
ORDER BY Total_profit DESC;

---- Business question3
 


--•	Which payment method is used most frequently?
 

 
SELECT
    Payment_Method,
    COUNT(*) AS Number_of_Transactions
FROM cafe_sale
GROUP BY Payment_Method
ORDER BY Number_of_Transactions DESC;