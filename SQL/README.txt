Each file contains the queries currently necessary for this stage in development.

////////////IMPORTANT////////////////////////////////////////////////////////////
In the queries, things denoted with a [bracket] must be replaced
with variables from the program. They are not part of the sql query.
Please remember that string variables require "quotes" around them in SQL. 
/////////////////////////////////////////////////////////////////////////////////

Credit_CardsDao.xml : 

The query to get all credit cards information associated with an account. Will return several rows. 

	Parameters: The Account_ID;
	Results: All rows containing that Account_ID

Login_AccountsDao.xml :
 
The query to get a security question and answer for a given username and password.
When a user types in a username and password, pass the system this query. The two numbers could be randomly decided to get a random security question!
If it gives an answer, that username and password is correct and you now have a question and answer for them. If it returns nothing, then the username and password where not found in the database.

	Parameters: [A number 1-3], [the same number], [The username given by user], [The password given by user]
	Results: A security question and its answer if the user exists, nothing if the given user info is incorrect.

Card_AccountsDao.xml :

The query to get all Card_Accounts in the database for display.
	
	Parameters: None
	Results: Every row in the Card_Accounts table. (For display, so the user can pick one to see its associated credit cards)
