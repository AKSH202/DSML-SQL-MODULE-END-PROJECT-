# DSML-SQL-MODULE-END-PROJECT-


1 You are going to build a project based on Library Management System. It keeps track all information about books in the library, their cost, status and total number of books available in the library. Create a database named library and create following TABLES in the database:

2 Branch
3 Employee
4 Customer
5 IssueStatus
6 ReturnStatus
7 Books Attributes for the tables:
8 Branch ∙ Branch_no - Set as PRIMARY KEY ∙ Manager_Id ∙ Branch_address ∙ Contact_no
9 Employee ∙ Emp_Id – Set as PRIMARY KEY ∙ Emp_name ∙ Position ∙ Salary ∙ Branch_no - Set as FOREIGN KEY and it should refer branch_no in EMPLOYEE table
10 Customer ∙ Customer_Id - Set as PRIMARY KEY ∙ Customer_name ∙ Customer_address ∙ Reg_date
11 IssueStatus ∙ Issue_Id - Set as PRIMARY KEY ∙ Issued_cust – Set as FOREIGN KEY and it refer customer_id in CUSTOMER table ∙ Issued_book_name ∙ Issue_date ∙ Isbn_book – Set as FOREIGN KEY and it should refer isbn in BOOKS table
12 ReturnStatus ∙ Return_Id - Set as PRIMARY KEY ∙ Return_cust ∙ Return_book_name ∙ Return_date ∙ Isbn_book2 - Set as FOREIGN KEY and it should refer isbn in BOOKS table
Books ∙ ISBN - Set as PRIMARY KEY ∙ Book_title ∙ Category ∙ Rental_Price ∙ Status [Give yes if book available and no if book not available] ∙ Author ∙ Publisher
13 Write the queries for the following:

14 Retrieve the book title, category, and rental price of all available books.
15 List the employee names and their respective salaries in descending order of salary.
16 Retrieve the book titles and the corresponding customers who have issued those books.
17 Display the total count of books in each category.
18 Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.
19 List the customer names who registered before 2022-01-01 and have not issued any books yet.
20 Display the branch numbers and the total count of employees in each branch.
21 Display the names of customers who have issued books in the month of June 2023.
22 Retrieve book_title from book table containing history.
23 Retrieve the branch numbers along with the count of employees for branches having more than 5 employees.
