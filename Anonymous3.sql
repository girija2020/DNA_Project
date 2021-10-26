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


CREATE TABLE menu(location varchar(20),
                  item_num int NOT NULL, 
                  CONSTRAINT PK_menu PRIMARY KEY (location,item_num)
                 );


CREATE TABLE tablesbooked(phone_num int REFERENCES Customer.Phone_number,
                          table_num int NOT NULL,
                          CONSTRAINT PK_tablesbooked PRIMARY KEY (phone_num,table_num)
                         );
CREATE TABLE ingredients(item_num int REFERENCES food_items.item_number,
                         ingredient varchar(30) NOT NULL,
                         CONSTRAINT PK_ingredients PRIMARY KEY (item_num,ingredient)
                        );
                        
LOCK TABLES restaurant WRITE;

INSERT INTO restaurant VALUES ("Hyderabad", "BlueStar", 100, 10000, 900000, 10000, 100000, 50000, 10000);
INSERT INTO restaurant VALUES ("Mumbai", "CoffeeShop", 110, 11000, 910000, 11000, 110000, 51000, 11000);
INSERT INTO restaurant VALUES ("Delhi", "GrandInn", 120, 12000, 920000, 12000, 120000, 50000, 12000);
INSERT INTO restaurant VALUES ("Chennai", "BlueStar", 130, 13000, 930000, 13000, 130000, 53000, 13000);

UNLOCK TABLES;

LOCK TABLES food_items WRITE;

INSERT INTO food_items VALUES (1, "Biryani", 3, 150.15);
INSERT INTO food_items VALUES (2, "Kheema Masala", 2, 160);
INSERT INTO food_items VALUES (3, "Mushroom Pasta", 3, 100);
INSERT INTO food_items VALUES (4, "Vegetable Salad", 5, 1000);
INSERT INTO food_items VALUES (5, "Pigeon Curry", 0, 10);
INSERT INTO food_items VALUES (6, "My head", 5, 100000);

UNLOCK TABLES;

LOCK TABLES employee WRITE;

INSERT INTO employee VALUES (1, "Manager", "Hyderabad", "Gokul", "BlueStar", 12000, 12, 12, 12);
INSERT INTO employee VALUES (2, "Manager", "Hyderabad", "Srija", "BlueStar", 12000, 1, 01, 23);
INSERT INTO employee VALUES (3, "Waiter", "Hyderabad", "Anamika", "BlueStar", 0, 1, 02, 1);
INSERT INTO employee VALUES (4, "Waiter", "Hyderabad", "Kalyan", "BlueStar", 0, 11, 21, 21);
INSERT INTO employee VALUES (5, "Waiter", "Hyderabad", "Anand", "BlueStar", 0, 10, 12, 12);
INSERT INTO employee VALUES (6, "Receptionist", "Hyderabad", "Idiot", "BlueStar", 1200, 1, 2, 2);
INSERT INTO employee VALUES (7, "Cleaner", "Hyderabad", "Ghost", "BlueStar", 0, 12, 12, 12);
INSERT INTO employee VALUES (8, "Cleaner", "Hyderabad", "Kanchana", "BlueStar", 0, 12, 12, 12);
INSERT INTO employee VALUES (9, "Chef", "Hyderabad", "Conjuring", "BlueStar", 12000, 12, 12, 12);
INSERT INTO employee VALUES (10, "Chef", "Hyderabad", "Anabelle", "BlueStar", 12000, 1, 12, 12);

INSERT INTO employee VALUES (11, "Manager", "Mumbai", "Gokul", "CoffeeShop", 12000, 12, 12, 12);
INSERT INTO employee VALUES (12, "Manager", "Mumbai", "Srija", "CoffeeShop", 12000, 1, 01, 23);
INSERT INTO employee VALUES (13, "Waiter", "Mumbai", "Anamika", "CoffeeShop", 0, 1, 02, 1);
INSERT INTO employee VALUES (14, "Waiter", "Mumbai", "Kalyan", "CoffeeShop", 0, 11, 21, 21);
INSERT INTO employee VALUES (15, "Waiter", "Mumbai", "Anand", "CoffeeShop", 0, 10, 12, 12);
INSERT INTO employee VALUES (16, "Receptionist", "Mumbai", "Idiot", "CoffeeShop", 1200, 1, 2, 2);
INSERT INTO employee VALUES (17, "Cleaner", "Mumbai", "Ghost", "CoffeeShop", 0, 12, 12, 12);
INSERT INTO employee VALUES (18, "Cleaner", "Mumbai", "Kanchana", "CoffeeShop", 0, 12, 12, 12);
INSERT INTO employee VALUES (19, "Chef", "Mumbai", "Conjuring", "CoffeeShop", 12000, 12, 12, 12);
INSERT INTO employee VALUES (20, "Chef", "Mumbai", "Anabelle", "CoffeeShop", 12000, 1, 12, 12);

INSERT INTO employee VALUES (21, "Manager", "Delhi", "Gokul", "GrandInn", 12000, 12, 12, 12);
INSERT INTO employee VALUES (22, "Manager", "Delhi", "Srija", "GrandInn", 12000, 1, 01, 23);
INSERT INTO employee VALUES (23, "Waiter", "Delhi", "Anamika", "GrandInn", 0, 1, 02, 1);
INSERT INTO employee VALUES (24, "Waiter", "Delhi", "Kalyan", "GrandInn", 0, 11, 21, 21);
INSERT INTO employee VALUES (25, "Waiter", "Delhi", "Anand", "GrandInn", 0, 10, 12, 12);
INSERT INTO employee VALUES (26, "Receptionist", "Delhi", "Idiot", "GrandInn", 1200, 1, 2, 2);
INSERT INTO employee VALUES (27, "Cleaner", "Delhi", "Ghost", "GrandInn", 0, 12, 12, 12);
INSERT INTO employee VALUES (28, "Cleaner", "Delhi", "Kanchana", "GrandInn", 0, 12, 12, 12);
INSERT INTO employee VALUES (29, "Chef", "Delhi", "Conjuring", "GrandInn", 12000, 12, 12, 12);
INSERT INTO employee VALUES (30, "Chef", "Delhi", "Anabelle", "GrandInn", 12000, 1, 12, 12);

INSERT INTO employee VALUES (31, "Manager", "Hyderabad", "Gokul", "BlueStar", 12000, 12, 12, 12);
INSERT INTO employee VALUES (32, "Manager", "Hyderabad", "Srija", "BlueStar", 12000, 1, 01, 23);
INSERT INTO employee VALUES (33, "Waiter", "Hyderabad", "Anamika", "BlueStar", 0, 1, 02, 1);
INSERT INTO employee VALUES (34, "Waiter", "Hyderabad", "Kalyan", "BlueStar", 0, 11, 21, 21);
INSERT INTO employee VALUES (35, "Waiter", "Hyderabad", "Anand", "BlueStar", 0, 10, 12, 12);
INSERT INTO employee VALUES (36, "Receptionist", "Hyderabad", "Idiot", "BlueStar", 1200, 1, 2, 2);
INSERT INTO employee VALUES (37, "Cleaner", "Hyderabad", "Ghost", "BlueStar", 0, 12, 12, 12);
INSERT INTO employee VALUES (38, "Cleaner", "Hyderabad", "Kanchana", "BlueStar", 0, 12, 12, 12);
INSERT INTO employee VALUES (39, "Chef", "Hyderabad", "Conjuring", "BlueStar", 12000, 12, 12, 12);
INSERT INTO employee VALUES (40, "Chef", "Hyderabad", "Anabelle", "BlueStar", 12000, 1, 12, 12);

UNLOCK TABLES;

LOCK TABLES Customer;

INSERT INTO Customer VALUES (100, "Police", "police@gmail.com", TRUE, "Police", 1);
INSERT INTO Customer VALUES (108, "Ambulance", "ambulance@gmail.com", TRUE, "Ambulance", 2);
INSERT INTO Customer VALUES (104, "Fire", "fire@gmail.com", FALSE, "Fire", 3);
INSERT INTO Customer VALUES (110, "Postal", "postal@gmail.com", FALSE, "Postal", 4);

UNLOCK TABLES;

