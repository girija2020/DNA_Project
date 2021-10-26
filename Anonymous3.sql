DROP SCHEMA IF EXISTS restaurant_chain;
CREATE SCHEMA restaurant_chain;

USE restaurant_chain;

CREATE TABLE restaurant(Location_of_Restaurant varchar(20) PRIMARY KEY,
                        Name_of_Restaurant varchar(20) NOT NULL,
                        number_of_tables int NOT NULL,
                        pre_booking int NOT NULL,
                        on_spot_reservation int NOT NULL,
                        advertising int NOT NULL,
                        salaries int NOT NULL,
                        furniture int NOT NULL,
                        raw_materials int NOT NULL
                       );

CREATE TABLE food_items(item_number int PRIMARY KEY,
                        Descript varchar(100),
                        rating int,
                        price float NOT NULL
                       );

CREATE TABLE employee(employee_id int PRIMARY KEY,
                      profession varchar(20) REFERENCES Profession.Profession,
                      restaurant_location varchar(20) REFERENCES restaurant.Location_of_Restaurant,
                      Employee_name varchar(20) NOT NULL,
                      Restaurant_name varchar(20) NOT NULL,
                      PF_amount float,
                      Month_of_joining int,
                      Year_of_joining int,
                      Date_of_joining int
                     );

CREATE TABLE Ordered_items(Order_id int REFERENCES Orders.Order_number,
                           Ordered_item_number int REFERENCES food_items.item_number,
                           CONSTRAINT pk_Order_item PRIMARY KEY(Order_id, Ordered_item_number),
                           Number_of_Items int
                          );

CREATE TABLE Orders(Order_number int PRIMARY KEY,
                    Order_time timestamp,
                    Order_status char NOT NULL,
                    Order_amount int NOT NULL,
                    Order_type char NOT NULL,
                    restaurant_location varchar(20) REFERENCES restaurant.Location_of_Restaurant,
                    Customer_ID int REFERENCES Customer.Phone_number
                   );

CREATE TABLE Profession(Profession varchar(20) PRIMARY KEY,
                        Salary int NOT NULL,
                        Employee_Working_Hours int NOT NULL,
                        PF_Percentage int
                       );

CREATE TABLE Customer(Phone_number int PRIMARY KEY,
                      user_name varchar(20),
                      Email varchar(30) UNIQUE,
                      Amount_Recieved bool,
                      Name varchar(20),
                      Order_number int REFERENCES Orders.Order_number
                     );

CREATE TABLE Online_delivery(Delivery_id varchar(20) PRIMARY KEY,
                             Location varchar(20) REFERENCES restaurant.Location_of_Restaurant,
                             Order_number int REFERENCES Orders.Order_number,
                             Customer_Id int REFERENCES Customer.Phone_number
                            );

CREATE TABLE Educational_Qualification(Employee_id int REFERENCES employee.employee_id,
                                       Educational_qualification varchar(20) NOT NULL,
                                       PRIMARY KEY(Employee_id, Educational_qualification)
                                      );
CREATE TABLE Tables(location varchar(20) REFERENCES restaurant.Location_of_Restaurant,
                    Table_no int NOT NULL,
                    number_of_seats int NOT NULL,
                    Cost_Of_Table int NOT NULL,
                    CONSTRAINT pk_table PRIMARY KEY(location, Table_no)
                   );

CREATE TABLE delivery_apps(Delivery_Id int PRIMARY KEY,
                           Name_of_DeliveryApp VARCHAR(20) NOT NULL
                          );


CREATE TABLE item(location varchar(20),
                  item_num int NOT NULL, 
                  CONSTRAINT PK_menu PRIMARY KEY (location,item_num)
                 );


CREATE TABLE tablesbooked(phone_num int REFERENCES Customer.Phone_number NOT NULL,
                          table_num int NOT NULL,
                          CONSTRAINT PK_tablesbooked PRIMARY KEY (phone_num,table_num)
                         );
CREATE TABLE ingredients(item_num int REFERENCES food_items.item_number NOT NULL,
                         ingredient varchar(30) NOT NULL,
                         CONSTRAINT PK_ingredients PRIMARY KEY (item_num,ingredient)
                        );

