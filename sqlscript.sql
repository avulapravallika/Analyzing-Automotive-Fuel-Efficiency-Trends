REM   Script: fashion
REM   myntra

select sysdate, 'Pravallika Avula' from dual;

CREATE TABLE Supplier ( 
    Supplier_ID INT, 
    Supplier_Name VARCHAR(255), 
    Address VARCHAR(255), 
    CONSTRAINT PK_Supplier_ID PRIMARY KEY (Supplier_ID), 
    CONSTRAINT CHK_Supplier_Name_NotNull CHECK (Supplier_Name IS NOT NULL) 
);

INSERT INTO Supplier (Supplier_ID, Supplier_Name, Address) VALUES (1, 'ABC Electronics', '123 Main St');

INSERT INTO Supplier (Supplier_ID, Supplier_Name, Address) VALUES (2, 'XYZ Tech', '456 Elm St');

INSERT INTO Supplier (Supplier_ID, Supplier_Name, Address) VALUES (3, 'LMN Gadgets', '789 Oak St');

Drop table Supplier;

SELECT * FROM Supplier;

Drop table Supplier;

select sysdate, 'Pravallika Avula' from dual;

CREATE TABLE Supplier ( 
    Supplier_ID INT, 
    Supplier_Name VARCHAR(255), 
    Address VARCHAR(255), 
    CONSTRAINT PK_Supplier_ID PRIMARY KEY (Supplier_ID), 
    CONSTRAINT CHK_Supplier_Name_NotNull CHECK (Supplier_Name IS NOT NULL) 
);

INSERT INTO Supplier (Supplier_ID, Supplier_Name, Address) VALUES (1, 'ABC Electronics', '123 Main St');

INSERT INTO Supplier (Supplier_ID, Supplier_Name, Address) VALUES (2, 'XYZ Tech', '456 Elm St');

INSERT INTO Supplier (Supplier_ID, Supplier_Name, Address) VALUES (3, 'LMN Gadgets', '789 Oak St');

SELECT * FROM Supplier;

select sysdate, 'Pravallika Avula' from dual;

CREATE TABLE Product ( 
    Product_ID INT, 
    Product_Name VARCHAR(255) NOT NULL, 
    Description VARCHAR(50), 
    Supplier_ID INT, 
    CONSTRAINT PK_Product_ID PRIMARY KEY (Product_ID), 
    CONSTRAINT UQ_Product_Name UNIQUE (Product_Name), 
    CONSTRAINT FK_Supplier_ID FOREIGN KEY (Supplier_ID) REFERENCES Supplier(Supplier_ID) 
);

INSERT INTO Product (Product_ID, Product_Name, Description, Supplier_ID) 
VALUES (1, 'Laptop', 'High-performance laptop', 1);

INSERT INTO Product (Product_ID, Product_Name, Description, Supplier_ID) 
VALUES (2, 'Tablet', 'Portable tablet device', 2);

INSERT INTO Product (Product_ID, Product_Name, Description, Supplier_ID) 
VALUES (3, 'Printer', 'Color inkjet printer', 3);

SELECT * FROM Product;

select sysdate, 'Pravallika Avula' from dual;

CREATE TABLE Customer ( 
    Customer_ID INT, 
    Customer_Name VARCHAR(255), 
    Email VARCHAR(50), 
    Phone NUMBER(10), 
    Address VARCHAR(255) 
    CONSTRAINT PK_Customer_ID PRIMARY KEY (Customer_ID), 
    CONSTRAINT UQ_Email UNIQUE (Email), 
    CONSTRAINT CHK_Name_NotNull CHECK (Customer_Name IS NOT NULL) 
);

INSERT INTO Customer (Customer_ID, Customer_Name, Email, Phone, Address) 
VALUES (1, 'John Doe', 'john.doe@gmail.com', 5715647283, '10390 willard way, Fairfax');

INSERT INTO Customer (Customer_ID, Customer_Name, Email, Phone, Address) 
VALUES (2, 'Jane Smith', 'jane.smith@yahoo.com', 5462783746, '1925 14th St NW B, Washington, DC');

INSERT INTO Customer (Customer_ID, Customer_Name, Email, Phone, Address) 
VALUES (3, 'Alice Johnson', 'alice.johnson@gmail.com', 5663783987, '4401 Wilson Blvd, Arlington, VA');

SELECT * FROM Customer;

select sysdate, 'Pravallika Avula' from dual;

CREATE TABLE Customer ( 
    Customer_ID INT, 
    Customer_Name VARCHAR(255), 
    Email VARCHAR(50), 
    Phone NUMBER(10), 
    Address VARCHAR(255), 
    CONSTRAINT PK_Customer_ID PRIMARY KEY (Customer_ID), 
    CONSTRAINT UQ_Email UNIQUE (Email), 
    CONSTRAINT CHK_Name_NotNull CHECK (Customer_Name IS NOT NULL) 
);

INSERT INTO Customer (Customer_ID, Customer_Name, Email, Phone, Address) 
VALUES (1, 'John Doe', 'john.doe@gmail.com', 5715647283, '10390 willard way, Fairfax');

INSERT INTO Customer (Customer_ID, Customer_Name, Email, Phone, Address) 
VALUES (2, 'Jane Smith', 'jane.smith@yahoo.com', 5462783746, '1925 14th St NW B, Washington, DC');

INSERT INTO Customer (Customer_ID, Customer_Name, Email, Phone, Address) 
VALUES (3, 'Alice Johnson', 'alice.johnson@gmail.com', 5663783987, '4401 Wilson Blvd, Arlington, VA');

SELECT * FROM Customer;

select sysdate, 'Pravallika Avula' from dual;

CREATE TABLE Location ( 
    Location_ID INT, 
    Location_Name VARCHAR(255), 
    Address VARCHAR(255), 
    CONSTRAINT PK_Location_ID PRIMARY KEY (Location_ID), 
    CONSTRAINT CHK_Loc_Name_NotNull CHECK (Location_Name IS NOT NULL) 
);

INSERT INTO Location (Location_ID, Location_Name, Address) VALUES (101, 'Office Mango', '22945 E Piney Grove Rd, Georgetown, DE 19947');

INSERT INTO Location (Location_ID, Location_Name, Address) VALUES (102, 'Warehouse Apple', '2155 Creve Coeur Mill Rd, St. Louis, MO 63146');

INSERT INTO Location (Location_ID, Location_Name, Address) VALUES (103, 'Store Cherry', 'San Jose, CA 95129');

SELECT * FROM Location;

select sysdate, 'Pravallika Avula' from dual;

CREATE TABLE Employee ( 
    Employee_ID INT, 
    Employee_Name VARCHAR(255), 
    Age INT, 
    Salary DECIMAL(10, 2), 
    Phone_Number VARCHAR(20), 
    Location_ID INT, 
    CONSTRAINT PK_Employee_ID PRIMARY KEY (Employee_ID), 
    CONSTRAINT CHK_Emp_Name_NotNull CHECK (Employee_Name IS NOT NULL), 
    CONSTRAINT CHK_Loc_ID_NotNull CHECK (Location_ID IS NOT NULL), 
    CONSTRAINT FK_Location_ID FOREIGN KEY (Location_ID) REFERENCES Location(Location_ID) 
);

INSERT INTO Employee (Employee_ID, Employee_Name, Age, Salary, Phone_Number, Location_ID) 
VALUES (1, 'Parker minds', 30, 50000.00, '567-345-5576', 1), 
       (2, ' Henrey Moore', 35, 55000.00, '567-768-2390', 2), 
       (3, 'Michael Johnson', 28, 48000.00, '571-985-0093', 3);

SELECT * FROM Employee;

select sysdate, 'Pravallika Avula' from dual;

CREATE TABLE Employee ( 
    Employee_ID INT, 
    Employee_Name VARCHAR(255), 
    Age INT, 
    Salary DECIMAL(10, 2), 
    Phone_Number VARCHAR(20), 
    Location_ID INT, 
    CONSTRAINT PK_Employee_ID PRIMARY KEY (Employee_ID), 
    CONSTRAINT CHK_Emp_Name_NotNull CHECK (Employee_Name IS NOT NULL), 
    CONSTRAINT CHK_Loc_ID_NotNull CHECK (Location_ID IS NOT NULL), 
    CONSTRAINT FK_Location_ID FOREIGN KEY (Location_ID) REFERENCES Location(Location_ID) 
);

INSERT INTO Employee (Employee_ID, Employee_Name, Age, Salary, Phone_Number, Location_ID) 
VALUES (1, 'Parker minds', 30, 50000.00, '567-345-5576', 1), 
INSERT INTO Employee (Employee_ID, Employee_Name, Age, Salary, Phone_Number, Location_ID) 
VALUES (2, ' Henrey Moore', 35, 55000.00, '567-768-2390', 2), 
INSERT INTO Employee (Employee_ID, Employee_Name, Age, Salary, Phone_Number, Location_ID) 
VALUES (3, 'Michael Johnson', 28, 48000.00, '571-985-0093', 3);

SELECT * FROM Employee;

select sysdate, 'Pravallika Avula' from dual;

CREATE TABLE Employee ( 
    Employee_ID INT, 
    Employee_Name VARCHAR(255), 
    Age INT, 
    Salary DECIMAL(10, 2), 
    Phone_Number VARCHAR(20), 
    Location_ID INT, 
    CONSTRAINT PK_Employee_ID PRIMARY KEY (Employee_ID), 
    CONSTRAINT CHK_Emp_Name_NotNull CHECK (Employee_Name IS NOT NULL), 
    CONSTRAINT CHK_Loc_ID_NotNull CHECK (Location_ID IS NOT NULL), 
    CONSTRAINT FK_Location_ID FOREIGN KEY (Location_ID) REFERENCES Location(Location_ID) 
);

INSERT INTO Employee (Employee_ID, Employee_Name, Age, Salary, Phone_Number, Location_ID) 
VALUES (1, 'Parker minds', 30, 50000.00, '567-345-5576', 101);

INSERT INTO Employee (Employee_ID, Employee_Name, Age, Salary, Phone_Number, Location_ID) 
VALUES (2, ' Henrey Moore', 35, 55000.00, '567-768-2390', 102);

INSERT INTO Employee (Employee_ID, Employee_Name, Age, Salary, Phone_Number, Location_ID) 
VALUES (3, 'Michael Johnson', 28, 48000.00, '571-985-0093', 103);

SELECT * FROM Employee;

drop table Employee;

select sysdate, 'Pravallika Avula' from dual;

CREATE TABLE Employee ( 
    Employee_ID INT, 
    Employee_Name VARCHAR(255), 
    Age INT, 
    Salary DECIMAL(10, 2), 
    Phone_Number VARCHAR(20), 
    Location_ID INT, 
    CONSTRAINT PK_Employee_ID PRIMARY KEY (Employee_ID), 
    CONSTRAINT CHK_Emp_Name_NotNull CHECK (Employee_Name IS NOT NULL), 
    CONSTRAINT CHK_Loc_ID_NotNull CHECK (Location_ID IS NOT NULL), 
    CONSTRAINT FK_Location_ID FOREIGN KEY (Location_ID) REFERENCES Location(Location_ID) 
);

INSERT INTO Employee (Employee_ID, Employee_Name, Age, Salary, Phone_Number, Location_ID) 
VALUES (1, 'Parker minds', 30, 50000.00, '567-345-5576', 101);

INSERT INTO Employee (Employee_ID, Employee_Name, Age, Salary, Phone_Number, Location_ID) 
VALUES (2, ' Henrey Moore', 35, 55000.00, '567-768-2390', 102);

INSERT INTO Employee (Employee_ID, Employee_Name, Age, Salary, Phone_Number, Location_ID) 
VALUES (3, 'Michael Johnson', 28, 48000.00, '571-985-0093', 103);

SELECT * FROM Employee;

select sysdate, 'Pravallika Avula' from dual;

CREATE TABLE Product_Preference ( 
    Product_Preference_ID INT, 
    Customer_ID INT, 
    Product_ID INT, 
    CONSTRAINT PK_Product_Preference_ID PRIMARY KEY (Product_Preference_ID), 
    CONSTRAINT CHK_Product_Preference_ID_NotNull CHECK (Product_Preference_ID IS NOT NULL), 
    CONSTRAINT CHK_Customer_ID_NotNull CHECK (Customer_ID IS NOT NULL), 
    CONSTRAINT CHK_Product_ID_NotNull CHECK (Product_ID IS NOT NULL), 
    CONSTRAINT FK_Prod_Customer_ID FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID), 
    CONSTRAINT FK_Prod_Product_ID FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID) 
    );

INSERT INTO Product_Preference (Product_Preference_ID, Customer_ID, Product_ID) VALUES (1001, 1, 1);

INSERT INTO Product_Preference (Product_Preference_ID, Customer_ID, Product_ID) VALUES (1002, 2, 2);

INSERT INTO Product_Preference (Product_Preference_ID, Customer_ID, Product_ID) VALUES (1003, 3, 3);

SELECT * FROM Product_Preference;

select sysdate, 'Pravallika Avula' from dual;

CREATE TABLE Clothing_Product ( 
    Product_ID INT, 
    Product_Size VARCHAR(10), 
    Color VARCHAR(50), 
    Material VARCHAR(50), 
    Style VARCHAR(50), 
    Clothing_Product_ID INT PRIMARY KEY, 
    CONSTRAINT CHK_Product_Size_NotNull CHECK (Product_Size IS NOT NULL), 
    CONSTRAINT FK_Product_ID FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID) 
);

INSERT INTO Clothing_Product (Product_ID, Product_Size, Color, Material, Style, Clothing_Product_ID) 
VALUES (1, 'M', 'Blue', 'Cotton', 'Casual', 11);

INSERT INTO Clothing_Product (Product_ID, Product_Size, Color, Material, Style, Clothing_Product_ID) 
VALUES (2, 'L', 'Black', 'Denim', 'Formal', 12);

INSERT INTO Clothing_Product (Product_ID, Product_Size, Color, Material, Style, Clothing_Product_ID) 
VALUES (3, 'S', 'Red', 'Silk', 'Elegant', 13);

SELECT * FROM Product_Preference;

select sysdate, 'Pravallika Avula' from dual;

CREATE TABLE Jewelry_Product ( 
    Product_ID INT, 
    Metal_Type VARCHAR(10), 
    Gemstone VARCHAR(50), 
    Carat_Weight VARCHAR(50), 
    Certification VARCHAR(50), 
    Jewelry_Product_ID INT PRIMARY KEY, 
    CONSTRAINT CHK_Certification_NotNull CHECK (Certification IS NOT NULL), 
    CONSTRAINT FK_Jewelry_Product_ID FOREIGN KEY (Jewelry_Product_ID) REFERENCES Product(Product_ID) 
);

INSERT INTO Jewelry_Product (Product_ID, Metal_Type, Gemstone, Carat_Weight, Certification, Jewelry_Product_ID) 
VALUES (1, 'Gold', 'Diamond', '0.5', 'GIA', 101), 
INSERT INTO Jewelry_Product (Product_ID, Metal_Type, Gemstone, Carat_Weight, Certification, Jewelry_Product_ID) 
VALUES (2, 'Silver', 'Sapphire', '0.8', 'IGI', 102), 
INSERT INTO Jewelry_Product (Product_ID, Metal_Type, Gemstone, Carat_Weight, Certification, Jewelry_Product_ID) 
VALUES (3, 'Platinum', 'Emerald', '0.7', 'AGS', 103);

SELECT * FROM Jewelry_Product;

INSERT INTO Jewelry_Product (Product_ID, Metal_Type, Gemstone, Carat_Weight, Certification, Jewelry_Product_ID) 
VALUES (1, 'Gold', 'Diamond', '0.5', 'GIA', 101);

INSERT INTO Jewelry_Product (Product_ID, Metal_Type, Gemstone, Carat_Weight, Certification, Jewelry_Product_ID) 
VALUES (2, 'Silver', 'Sapphire', '0.8', 'IGI', 102);

INSERT INTO Jewelry_Product (Product_ID, Metal_Type, Gemstone, Carat_Weight, Certification, Jewelry_Product_ID) 
VALUES (3, 'Platinum', 'Emerald', '0.7', 'AGS', 103);

SELECT * FROM Jewelry_Product;

drop table Jewelry_Product;

select sysdate, 'Pravallika Avula' from dual;

CREATE TABLE Jewelry_Product ( 
    Product_ID INT, 
    Metal_Type VARCHAR(10), 
    Gemstone VARCHAR(50), 
    Carat_Weight VARCHAR(50), 
    Certification VARCHAR(50), 
    Jewelry_Product_ID INT PRIMARY KEY, 
    CONSTRAINT CHK_Certification_NotNull CHECK (Certification IS NOT NULL), 
    CONSTRAINT FK_Jewelry_Product_ID FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID) 
);

INSERT INTO Jewelry_Product (Product_ID, Metal_Type, Gemstone, Carat_Weight, Certification, Jewelry_Product_ID) 
VALUES (1, 'Gold', 'Diamond', '0.5', 'GIA', 101);

INSERT INTO Jewelry_Product (Product_ID, Metal_Type, Gemstone, Carat_Weight, Certification, Jewelry_Product_ID) 
VALUES (2, 'Silver', 'Sapphire', '0.8', 'IGI', 102);

INSERT INTO Jewelry_Product (Product_ID, Metal_Type, Gemstone, Carat_Weight, Certification, Jewelry_Product_ID) 
VALUES (3, 'Platinum', 'Emerald', '0.7', 'AGS', 103);

SELECT * FROM Jewelry_Product;

select sysdate, 'Pravallika Avula' from dual;

CREATE TABLE Footwear_Product ( 
    Product_ID INT, 
    Shoe_Size VARCHAR(10), 
    Gender VARCHAR(50), 
    Footwear_Type VARCHAR(50), 
    Sole_Material VARCHAR(50), 
    Footwear_Product_ID INT PRIMARY KEY, 
    CONSTRAINT CHK_Shoe_Size_NotNull CHECK (Shoe_Size IS NOT NULL), 
    CONSTRAINT CHK_Gender_Char CHECK (Gender IN ('M', 'F', 'U')), 
    CONSTRAINT FK_Footwear_Product_ID FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID) 
);

INSERT INTO Footwear_Product (Product_ID, Shoe_Size, Gender, Footwear_Type, Sole_Material, Footwear_Product_ID) 
VALUES (1, 'M', 'M', 'Sports Shoes', 'Rubber', 1011);

INSERT INTO Footwear_Product (Product_ID, Shoe_Size, Gender, Footwear_Type, Sole_Material, Footwear_Product_ID) 
VALUES (2, 'F', 'F', 'Sneakers', 'EVA', 1012);

INSERT INTO Footwear_Product (Product_ID, Shoe_Size, Gender, Footwear_Type, Sole_Material, Footwear_Product_ID) 
VALUES (3, 'U', 'U', 'Casual Shoes', 'Leather', 1013);

SELECT * FROM Footwear_Product;

