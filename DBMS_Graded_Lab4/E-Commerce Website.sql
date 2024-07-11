Create database ECommerce_DBMS;
Use ECommerce_DBMS;

-- Create supplier table

CREATE TABLE suppiler(
Supp_ID int primary key,
Supp_Name varchar(50) NOT NULL,
Supp_City varchar(50) NOT NULL,
Supp_Phone varchar(50) NOT NULL
);

-- Create Customer Table

CREATE TABLE customer(
Cus_ID int primary key,
Cus_Name varchar(20) NOT NULL,
Cus_Phone varchar(10) NOT NULL,
Cus_City varchar(30) NOT NULL,
Cus_Gender char
);

-- Create Category table

CREATE TABLE Category(
CAT_ID int Primary key,
CAT_Name varchar(20) NOT NULL
);

-- Create product Tables

CREATE TABLE Product(
Pro_ID int primary key,
Pro_Name varchar(20) NOT NULL default "Dummy",
Pro_DESC varchar(60),
CAT_ID int, 
foreign key(CAT_ID) references Category(CAT_ID)
);

-- create supplier_pricing table

CREATE TABLE Supplier_Pricing(
Pricing_ID int primary key,
Pro_ID int,
foreign key(Pro_ID) references Product(Pro_ID),
Supp_ID int,
foreign key(Supp_ID) references suppiler(Supp_ID),
Supp_price int default 0
);

-- Create order Table

CREATE TABLE Orders(
Ord_ID int primary key,
Ord_Amount int NOT NULL,
Ord_Date DATE NOT NULL,
Cus_ID int,
Pricing_ID int,
foreign key(Cus_ID) references customer(Cus_ID),
foreign key(Pricing_ID) references Supplier_Pricing(Pricing_ID)
);

-- Create table Rating

CREATE TABLE Rating(
Rat_ID int primary key,
Ord_ID int,
foreign key(Ord_ID) references Orders(Ord_ID),
Rating_Stars int NOT NULL
);

-- Insert data into Supplier table

INSERT INTO suppiler (Supp_ID, Supp_Name, Supp_City, Supp_Phone)
VALUES
(1, 'Rajesh Retails', 'Delhi', '1234567890'),
(2, 'Appario Ltd.', 'Mumbai', '2589631470'),
(3, 'Knome products', 'Bangalore', '9785462315'),
(4, 'Bansal Retails', 'Kochi', '8975463285'),
(5, 'Mittal Ltd.', 'Lucknow', '7898456532');

select * from suppiler;

-- Insert data into customer table

INSERT INTO customer(Cus_ID , Cus_Name, Cus_Phone, Cus_City , Cus_Gender)
VALUES
(1, 'AKASH', 9999999999, 'DELHI', 'M'),
(2, 'AMAN', 9785463215, 'NOIDA', 'M'),
(3, 'NEHA', 9999999999, 'MUMBAI', 'F'),
(4, 'MEGHA', 9994562399, 'KOLKATA', 'F'),
(5, 'PULKIT', 7895999999, 'LUCKNOW', 'M');

Select * FROM customer;

-- Insert data into Category table

INSERT INTO Category(CAT_ID, CAT_Name)
VALUES
(1, 'BOOKS'),
(2, 'GAMES'),
(3, 'GROCERIES'),
(4, 'ELECTRONICS'),
(5, 'CLOTHES');

Select * FROM Category;

-- Insert data into Product Table

INSERT INTO Product(Pro_ID, Pro_Name, Pro_DESC, CAT_ID)
VALUES
(1, 'GTA V', 'Windows 7 and above with i5 processor and 8GB RAM', 2),
(2, 'TSHIRT', 'SIZE-L with Black, Blue and White variations', 5),
(3, 'ROG LAPTOP', 'Windows 10 with 15inch screen, i7 processor, 1TB SSD', 4),
(4, 'OATS', 'Highly Nutritious from Nestle', 3),
(5, 'HARRY POTTER', 'Best Collection of all time by J.K Rowling', 1),
(6, 'MILK', '1L Toned MIlk', 3),
(7, 'Boat Earphones', '1.5Meter long Dolby Atmos', 4),
(8, 'Jeans', 'Stretchable Denim Jeans with various sizes and color', 5),
(9, 'Project IGI', 'compatible with windows 7 and above', 2),
(10, 'Hoodie', 'Black GUCCI for 13 yrs and above', 5),
(11, 'Rich Dad Poor Dad', 'Written by RObert Kiyosaki', 1),
(12, 'Train Your Brain', 'By Shireen Stephen', 1);

Select * From Product;

-- Insert data into supplier_pricing table

INSERT INTO Supplier_Pricing (Pricing_ID, Pro_ID, Supp_ID, Supp_price)
VALUES
    (1, 1, 2, 1500),
    (2, 3, 5, 30000),
    (3, 5, 1, 3000),
    (4, 2, 3, 2500),
    (5, 4, 1, 1000),
    (6, 12, 2, 780),
    (7, 12, 4, 789),
    (8, 3, 1, 31000),
    (9, 1, 5, 1450),
    (10, 4, 2, 999),
    (11, 7, 3, 549),
    (12, 7, 4, 529),
    (13, 6, 2, 105),
    (14, 6, 1, 99),
    (15, 2, 5, 2999),
    (16, 5, 2, 2999);
    
Select * from Supplier_Pricing;

-- Insert data into order table
INSERT INTO Orders (Ord_ID, Ord_Amount, Ord_Date, Cus_ID, Pricing_ID)
VALUES
    (101, 1500, '2021-10-06', 2, 1),
    (102, 1000, '2021-10-12', 3, 5),
    (103, 30000, '2021-09-16', 5, 2),
    (104, 1500, '2021-10-05', 1, 1),
    (105, 3000, '2021-08-16', 4, 3),
    (106, 1450, '2021-08-18', 1, 9),
    (107, 789, '2021-09-01', 3, 7),
    (108, 780, '2021-09-07', 5, 6),
    (109, 3000, '2021-09-10', 5, 3),
    (110, 2500, '2021-09-10', 2, 4),
    (111, 1000, '2021-09-15', 4, 5),
    (112, 789, '2021-09-16', 4, 7),
    (113, 31000, '2021-09-16', 1, 8),
    (114, 1000, '2021-09-16', 3, 5),
    (115, 3000, '2021-09-16', 5, 3),
    (116, 99, '2021-09-17', 2, 14);

Select * from Orders;

-- Insert data into rating table
INSERT INTO Rating (Rat_ID, Ord_ID, Rating_Stars)
VALUES
    (1, 101, 4),
    (2, 102, 3),
    (3, 103, 1),
    (4, 104, 2),
    (5, 105, 4),
    (6, 106, 3),
    (7, 107, 4),
    (8, 108, 4),
    (9, 109, 3),
    (10, 110, 5),
    (11, 111, 3),
    (12, 112, 4),
    (13, 113, 2),
    (14, 114, 1),
    (15, 115, 1),
    (16, 116, 0);
    
Select * from Rating;

/** Display the total number of customers based on 
 gender who have placed individual orders of worth at least Rs.3000.
**/
SELECT c.CUS_GENDER, COUNT(DISTINCT c.CUS_ID) AS TotalCustomers
FROM customer c
JOIN orders o ON c.CUS_ID = o.CUS_ID
WHERE o.ORD_AMOUNT >= 3000
GROUP BY c.CUS_GENDER;

/**
5) Display all the orders along with product name ordered by a customer having Customer_Id=2
*/

SELECT o.Ord_ID, p.PRO_NAME, o.Ord_Amount, o.Ord_Date
FROM orders o
JOIN supplier_pricing sp ON o.PRICING_ID = sp.PRICING_ID
JOIN product p ON sp.PRO_ID = p.PRO_ID
WHERE o.CUS_ID = 2;

/**
6) Display the Supplier details who can supply more than one product.
*/

SELECT s.*
FROM suppiler s
JOIN Supplier_Pricing sp ON s.Supp_ID = sp.Supp_ID
GROUP BY s.Supp_ID
HAVING COUNT(DISTINCT sp.Pro_ID) > 1;

/**
7) Find the least expensive product from each category and 
print the table with category id, name, product name and price of the product
*/

Select c.CAT_ID, c.CAT_Name, t1.Pro_Name, MIN(t1.minPrice) from Category c
inner join
(
	select Prd.CAT_ID, Prd.Pro_Name, t2.* from Product Prd
	inner join(
			Select sp.Pro_ID, min(sp.Supp_price) as minPrice from Supplier_Pricing sp 
			group by sp.Pro_ID
			) as t2 on Prd.Pro_ID = t2.Pro_ID
) as t1 on t1.CAT_ID= c.CAT_ID
Group by c.CAT_ID, t1.Pro_Name;

-- 7)	Display the Id and Name of the Product ordered after “2021-10-05”.

DESC PRODUCT;
DESC ORDERS;
DESC SUPPLIER_PRICING;

Select p.Pro_id, p.Pro_Name from orders ord 
inner join SUPPLIER_PRICING sp on sp.Pricing_ID = ord.Pricing_ID
inner join Product p on p.Pro_ID = sp.Pro_ID
where ord.ord_date>'2021-10-05';

-- 8)	Display customer name and gender whose names start or end with character 'A'.

SELECT Cus_Name, Cus_Gender
FROM customer
WHERE Cus_Name LIKE 'A%' OR Cus_Name LIKE '%A'
ORDER BY Cus_Name;

/**
--9)Create a stored procedure to display supplier id, name, rating and Type_of_Service. 
For Type_of_Service, If rating =5, print “Excellent Service”,If rating >4 print “Good Service”,
 If rating >2 print “Average Service” else print “Poor Service”.
 **/
 
 DELIMITER //

CREATE PROCEDURE GetSupplierServiceType()
BEGIN
    SELECT s.Supp_ID, s.Supp_Name, r.Rating_Stars,
        CASE
            WHEN r.Rating_Stars = 5 THEN 'Excellent Service'
            WHEN r.Rating_Stars > 4 THEN 'Good Service'
            WHEN r.Rating_Stars > 2 THEN 'Average Service'
            ELSE 'Poor Service'
        END AS Type_of_Service
    FROM suppiler s
    JOIN (
        SELECT sp.Supp_ID, AVG(rt.Rating_Stars) AS Rating_Stars
        FROM Supplier_Pricing sp
        JOIN Orders o ON sp.PRICING_ID = o.PRICING_ID
        JOIN Rating rt ON o.Ord_ID = rt.Ord_ID
        GROUP BY sp.Supp_ID
    ) AS r ON s.Supp_ID = r.Supp_ID;
END //

DELIMITER ;
CALL GetSupplierServiceType();