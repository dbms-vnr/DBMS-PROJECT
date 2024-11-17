-- Create the Admin table
CREATE TABLE Admin (
 Admin_id NUMBER(8) PRIMARY KEY,
 Admin_name VARCHAR2(15) NOT NULL,
 Admin_password VARCHAR2(16) NOT NULL
);
-- Create the Customer table
CREATE TABLE Customer (
 customer_id NUMBER(8) PRIMARY KEY,
 customer_firstname VARCHAR2(30) NOT NULL,
 customer_lastname VARCHAR2(30) NOT NULL,
 customer_password VARCHAR2(16) NOT NULL,
 customer_phoneno VARCHAR2(10) NOT NULL,
 customer_address VARCHAR2(50) NOT NULL,
 customer_email VARCHAR2(20) NOT NULL,
 Admin_id NUMBER(8),
 CONSTRAINT fk_Admin_id FOREIGN KEY (Admin_id) REFERENCES Admin(Admin_id)
);
-- Create the Restaurant table
CREATE TABLE Restaurant (
 Admin_id NUMBER(8),
 restaurant_id NUMBER(8) PRIMARY KEY,
 restaurant_name VARCHAR2(20) NOT NULL,
 restaurant_address VARCHAR2(50) NOT NULL,
 restaurant_password VARCHAR2(16) NOT NULL,
 restaurant_phoneno VARCHAR2(10) NOT NULL,
 CONSTRAINT fk_Restaurant_Admin_id FOREIGN KEY (Admin_id) REFERENCES
Admin(Admin_id)
);
-- Create the Category table
CREATE TABLE Category (
 category_id NUMBER(8) PRIMARY KEY,
 category_name VARCHAR2(15) NOT NULL,
 restaurant_id NUMBER(8),
 CONSTRAINT fk_Category_Restaurant FOREIGN KEY (restaurant_id) REFERENCES
Restaurant(restaurant_id)
);
-- Create the Menu_items table
CREATE TABLE Menu_items (
 item_code NUMBER(8) PRIMARY KEY,
 item_name VARCHAR2(20) NOT NULL,
 Price NUMBER(10,2) NOT NULL,
 category_id NUMBER(8),
 CONSTRAINT fk_MenuItems_Category FOREIGN KEY (category_id) REFERENCES
Category(category_id)
);
-- Create the Payment_details table
CREATE TABLE Payment_details (
 payment_id NUMBER(8) PRIMARY KEY,
 payment_mode VARCHAR2(15) NOT NULL,
 payment_timestamp TIMESTAMP NOT NULL
);
-- Create the Delivery_details table
CREATE TABLE Delivery_details (
 delivery_id NUMBER(8) PRIMARY KEY,
 delivery_address VARCHAR2(50) NOT NULL,
 delivery_status VARCHAR2(30) NOT NULL
);
-- Create the Order_details table
CREATE TABLE Order_details (
 Order_id NUMBER(8) PRIMARY KEY,
 Order_time TIMESTAMP NOT NULL,
 Order_amount NUMBER(10,2) NOT NULL,
 Order_status VARCHAR2(20) NOT NULL,
 customer_id NUMBER(8),
 delivery_id NUMBER(8),
 payment_id NUMBER(8),
 restaurant_id NUMBER(8),
 CONSTRAINT fk_OrderDetails_Customer FOREIGN KEY (customer_id) REFERENCES
Customer(customer_id),
 CONSTRAINT fk_OrderDetails_Delivery FOREIGN KEY (delivery_id) REFERENCES
Delivery_details(delivery_id),
 CONSTRAINT fk_OrderDetails_Payment FOREIGN KEY (payment_id) REFERENCES
Payment_details(payment_id),
 CONSTRAINT fk_OrderDetails_Restaurant FOREIGN KEY (restaurant_id) REFERENCES
Restaurant(restaurant_id)
);
-- Create the Orders table
CREATE TABLE Orders (
 quantity NUMBER(8) NOT NULL,
 Order_id NUMBER(8),
 item_code NUMBER(8),
 CONSTRAINT fk_Orders_OrderDetails FOREIGN KEY (Order_id) REFERENCES
Order_details(Order_id),
 CONSTRAINT fk_Orders_MenuItems FOREIGN KEY (item_code) REFERENCES
Menu_items(item_code)
);
-- Create the Rating table
CREATE TABLE Rating (
 ratings NUMBER(8) NOT NULL,
 customer_id NUMBER(8),
 restaurant_id NUMBER(8),
 CONSTRAINT fk_Rating_Customer FOREIGN KEY (customer_id) REFERENCES
Customer(customer_id),
 CONSTRAINT fk_Rating_Restaurant FOREIGN KEY (restaurant_id) REFERENCES
Restaurant(restaurant_id)
);
-- Example INSERT Statements for Admin, Customer, and Restaurant
INSERT INTO Admin VALUES (1, 'Admin Name', 'adminpass123');
INSERT INTO Customer VALUES (1, 'John', 'Doe', 'password123', '9876543210', '123 Street,
City', 'john.doe@example.com', 1);
INSERT INTO Restaurant VALUES (1, 101, 'Restaurant 1', '456 Avenue, City', 'restpass123',
'1234567890');