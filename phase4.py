import subprocess as sp
import pymysql
import pymysql.cursors

def Report():
     """
    Function to evaluate and analyse the given Database
    """
     print("1. Search all the employees whose last name is ‘Gupta’")
     print("2. Retrieve complete data about employees in the cooking dept")
     print("3. Exit")
     val = int(input("Choose the query you want to execute> "))
     

def Deletion():
    try:
        print("")
        print("________________________________________Deleting data of a resigned Employee ________________________________________")
        print("")

        print("Employee TABLE")
        print("")
        query="SELECT * FROM Employee"
        print("")
        cur.execute(query)
        result=cur.fetchall()
        print(result)

        print("educational_qualification TABLE")
        print("")
        query="SELECT * FROM educational_qualification"
        print("")
        cur.execute(query)
        result=cur.fetchall()
        print(result)


        print("")
        vid1 = int(input("Please Enter Employee_Id to be deleted: "))
        print("")

        query = "DELETE FROM Employee WHERE (Employee_Id = '%d')" %(vid1)
        cur.execute(query)
        con.commit()

        query = "DELETE FROM educational_qualification WHERE (Employee_Id = '%d')" %(vid1)
        cur.execute(query)
        con.commit()

        print("")
        print("________________________________________Successfully Deleted ________________________________________")
        print("")

        print("Employee TABLE")
        print("")
        query="SELECT * FROM Employee"
        print("")
        cur.execute(query)
        result=cur.fetchall()
        print(result)

        print("EDUCATIONAL QUALIFICATION TABLE")
        print("")
        query="SELECT * FROM educational_qualification"
        print("")
        cur.execute(query)
        result=cur.fetchall()
        print(result)
        

    except Exception as e:
        con.rollback()
        print("Failed to update in database")
        print("************",e)
    

def Updation():
      """
      Function to update queries mentioned in SRS Document
      """
      print("1. updating the costs and ratings of each food item")
      print("2. Updating the Salary of the Profession Table")
      print("3. Exit")
      val = int(input("Choose the query you want to execute> "))

      if val == 3:
        return

      elif val == 1:
        try:
            print("-------------------UPDATING STARTS------------------------")
            print("")
            print("food_items TABLE")
            print("")
            query="SELECT * FROM food_items"
            print("")
            cur.execute(query)
            result=cur.fetchall()
            print(result)

            print("")
            pid = int(input("Please enter the item number of food_item whose data needs to be updated: "))
            query = "SELECT * FROM food_items WHERE (item_number = '%d')" %(pid)
            cur.execute(query)
            result = cur.fetchall() 

            print("")
            inp1 = float(input("Please enter updated Price: "))
            inp2 = int(input("Please enter updated rating: "))
            
            
            query = "UPDATE food_items SET Rating = '%d' WHERE item_number = '%d'" %(inp2 , pid)
            cur.execute(query)
            con.commit()

            query = "UPDATE food_items SET Price = '%f' WHERE item_number = '%d'" %(inp1 , pid)
            cur.execute(query)
            con.commit() 
            
            print("==============================================UPDATED==============================================")

            print("food_items TABLE")
            print("")
            query="SELECT * FROM food_items"
            print("")
            cur.execute(query)
            result=cur.fetchall()
            print(result)

        except Exception as e:
            con.rollback()
            print("Failed to update in database")
            print("************",e)

    # +++++++++++++++++++++++++++++++++++++++++++++
      elif val == 2:
        try:
            print("-------------------UPDATING STARTS------------------------")
            print("")
            print("Profession TABLE")
            print("")
            query="SELECT * FROM Profession"
            print("")
            cur.execute(query)
            result=cur.fetchall()
            print(result)

            print("")
            pid = str(input("Please enter the profession of Profession Table whose data needs to be updated: "))
            query = "SELECT * FROM Profession WHERE (profession = '%s')" %(pid)
            cur.execute(query)
            result = cur.fetchall() 

            print("")
            inp1 = int(input("Please enter updated Salary: "))
            
            
            query = "UPDATE Profession SET Salary = '%d' WHERE profession = '%s'" %(inp1 , pid)
            cur.execute(query)
            con.commit()
            
            print("==============================================UPDATED==============================================")

            print("Profession TABLE")
            print("")
            query="SELECT * FROM Profession"
            print("")
            cur.execute(query)
            result=cur.fetchall()
            print(result)

        except Exception as e:
            con.rollback()
            print("Failed to update in database")
            print("************",e)
    # +++++++++++++++++++++++++++++++++++++++++++++
    
      else:
            print("")
            print("INVALID")

def Insertion():
    print("Insertion")
    return

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
    #port = 3306;

    try:
        con = pymysql.connect(host='localhost',
                port=30306,
                user=username,
                password=password,
                db='restaurant_chain',
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
                print("======================Functions of Cricket Database======================")
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
