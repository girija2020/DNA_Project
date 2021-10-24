CREATE SCHEMA restaurant_chain;

USE restaurant_chain;

CREATE TABLE restaurant(Location_of_Restaurant varchar(20) PRIMARY KEY, Name_of_Restaurant varchar(20) NOT NULL, number_of_tables int, pre_booking int, on_spot_reservation int, advertising int, salaries int, furniture int, raw_materials int);

CREATE TABLE food_items(item_number int PRIMARY KEY, Descript varchar(100), rating int, price float);

CREATE TABLE employee(employee_id int PRIMARY KEY, profession varchar(20) FOREIGN KEY, restaurant_location varchar(20) FOREIGN KEY, Employee_name varchar(20), Restaurant_name varchar(20), PF_amount float, Month_of_joining int, Year_of_joining int, Date_of_joining int);

CREATE TABLE Ordered_items(Order_id int FOREIGN KEY, Ordered_item_number int FOREIGN KEY, Number_of_Items int);

CREATE TABLE Orders(Order_number int PRIMARY KEY, Order_time timestamp, Order_status char,Order_amouni int, Order_type char, restaurant_location varchar(20) FOREIGN KEY, Customer_ID int FOREIGN KEY);

CREATE TABLE Profession(Profession varchar(20) PRIMARY KEY, Salary int, Employee_Working_Hours int, PF_Percentage int);

CREATE TABLE Customer(Phone_number int PRIMARY KEY, user_name varchar(20), Email varchar(30) UNIQUE, Order_number int FOREGN KEY, Amount_Recieved bool, Name varchar(20));

CREATE TABLE Online_delivery(Delivery_id varchar(20) PRIMARY KEY, Location varchar(20) FOREIGN KEY, Order_number int FOREIGN KEY, Customer_id int FOREIGN KEY);

CREATE TABLE Educational_Qualification(Employee_id int FOREIGN KEY PRIMARY kEY, Educational_qualification varchar(20) PRIMARY KEY);
CREATE TABLE Tables(location varchar(20) PRIMARY KEY,Table_no int PRIMARY KEY,number_of_seats int,Cost_Of_Table int);

CREATE TABLE delivery_apps(Delivery_Id int PRIMARY KEY,Name_of_DeliveryApp VARCHAR(20));


CREATE TABLE menu(location varchar(20) PRIMARY KEY, menu varchar(20) PRIMARY KEY);


CREATE TABLE tablesbooked(phone_num int PRIMARY KEY FOREIGN KEY, table_num int PRIMARY KEY);
CREATE TABLE ingredients(item_num int PRIMARY KEY FOREIGN KEY, ingredient varchar(30) PRIMARY KEY);

