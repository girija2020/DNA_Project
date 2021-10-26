CREATE SCHEMA restaurant_chain;

USE restaurant_chain;

CREATE TABLE restaurant(Location_of_Restaurant varchar(20) PRIMARY KEY, Name_of_Restaurant varchar(20) NOT NULL, number_of_tables int, pre_booking int, on_spot_reservation int, advertising int, salaries int, furniture int, raw_materials int);

CREATE TABLE food_items(item_number int PRIMARY KEY, Descript varchar(100), rating int, price float);

CREATE TABLE employee(employee_id int PRIMARY KEY, profession varchar(20) REFERENCES Profession.Profession, restaurant_location varchar(20) REFERENCES restaurant.Location_of_Restaurant, Employee_name varchar(20), Restaurant_name varchar(20), PF_amount float, Month_of_joining int, Year_of_joining int, Date_of_joining int);

CREATE TABLE Ordered_items(Order_id int REFERENCES Orders.Order_number, Ordered_item_number int REFERENCES food_items.item_number,CONSTRAINT pk_Order_item PRIMARY KEY(Order_id, Ordered_item_number),  Number_of_Items int);

CREATE TABLE Orders(Order_number int PRIMARY KEY, Order_time timestamp, Order_status char,Order_amouni int, Order_type char, restaurant_location varchar(20) REFERENCES restaurant.Location_of_Restaurant, Customer_ID int REFERENCES Customer.Phone_number);

CREATE TABLE Profession(Profession varchar(20) PRIMARY KEY, Salary int, Employee_Working_Hours int, PF_Percentage int);

CREATE TABLE Customer(Phone_number int PRIMARY KEY, user_name varchar(20), Email varchar(30) UNIQUE, Amount_Recieved bool, Name varchar(20));

CREATE TABLE Online_delivery(Delivery_id varchar(20) PRIMARY KEY, Location varchar(20) REFERENCES restaurant.Location_of_Restaurant, Order_number int REFERENCES Orders.Order_number, Customer_Id int REFERENCES Customer.Phone_number);

CREATE TABLE Educational_Qualification(Employee_id int REFERENCES employee.employee_id, Educational_qualification varchar(20), PRIMARY KEY(Employee_id, Educational_qualification));
CREATE TABLE Tables(location varchar(20) REFERENCES restaurant.Location_of_Restaurant, Table_no int,number_of_seats int,Cost_Of_Table int, CONSTRAINT pk_table PRIMARY KEY(location, Table_no));

CREATE TABLE delivery_apps(Delivery_Id int PRIMARY KEY,Name_of_DeliveryApp VARCHAR(20));


CREATE TABLE menu(location varchar(20) , item_num varchar(20) ,CONSTRAINT PK_menu PRIMARY KEY (location,item_num));


CREATE TABLE tablesbooked(phone_num int REFERENCES Customer.Phone_number, table_num int ,CONSTRAINT PK_tablesbooked PRIMARY KEY (phone_num,table_num));
CREATE TABLE ingredients(item_num int REFERENCES food_items.item_number, ingredient varchar(30) ,CONSTRAINT PK_ingredients PRIMARY KEY (item_num,ingredient));

