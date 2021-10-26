import subprocess as sp
import pymysql
import pymysql.cursors

def dispatch(ch):
    """
    Function that maps helper functions to option entered
    """

    if(ch==1): 
        Insertion()
    elif(ch==2):
        Updation()
    elif(ch==3):
        Deletion()
    elif(ch==4):
        Report()
    else:
        print("Error: Invalid Option")

# Global
while(1):
    tmp = sp.call('clear',shell=True)
    username = input("username: ")
    password = input("password: ")

    try:
        con = pymysql.connect(host='localhost',
                user=username,
                password=password,
                db='RESTAURANT_CHAIN',
                cursorclass=pymysql.cursors.DictCursor)
        tmp = sp.call('clear',shell=True)

        if(con.open):
            print("Connected")
        else:
            print("Failed to connect")
        tmp = input("Enter any key to CONTINUE>")

        with con:
            cur = con.cursor()
            while(1):
                tmp = sp.call('clear',shell=True)
                print("")
                print("======================Functions of RESTAURANT_CHAIN Database======================")
                print("")
                print("1. Insertion")
                print("2. Updation")
                print("3. Delete")
                print("4. Report")
                print("5. Logout")
                print("")
                ch = int(input("Enter choice> "))
                tmp = sp.call('clear',shell=True)
                if ch==5:
                    break
                else:
                    dispatch(ch)
                    tmp = input("Enter any key to CONTINUE>")


    except:
        tmp = sp.call('clear',shell=True)
        print("Connection Refused: Either username or password is incorrect or user doesn't have access to database")
        tmp = input("Enter any key to CONTINUE>")
        
        """Insert:
     -Insertion of a New customer(with order number,amount received as NULL).
        - Insertion of a New employee and his educational qualification.
       - Inserting a new order(it updates order num,amount received in customer relation)
       -Insertion of a New food item 
       -Inserting a new profession
       -Insertion of a New restaurant
       
    Delete:
             - delete data about a newly resigned employee
    Update:
              -modifying/incrementing salaries of the employees with time
              - updating the costs and ratings of each food item

    Selection:
        Retrieve complete data about employees in the cooking dept(cooks)

    projection:
        project restaurant location in employee relation.
    
    Aggregate:
        Find the average salary of an employee in the restaurant.

    Search:
        
    analysis:
        Number of  employees who had passed 12th standard in all the restaurants.
    """
