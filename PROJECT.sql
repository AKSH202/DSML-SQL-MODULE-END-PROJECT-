-- Create Data base--

CREATE DATABASE library;
USE library;

-- Create Branch table--

CREATE TABLE Branch(
Branch_no VARCHAR(10) PRIMARY KEY,
Manager_id VARCHAR(10), 
Branch_address VARCHAR(30),
Contact_no VARCHAR (15));

-- Create Employee Table--

CREATE TABLE Employee(
Emp_id VARCHAR(10) PRIMARY KEY,
Emp_name VARCHAR(30),
Position VARCHAR(30),
Salary INT,
Branch_no VARCHAR(10),
FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no));

 -- Create Customer table--

CREATE TABLE Customer(
Customer_Id VARCHAR(10) PRIMARY KEY,
Customer_name VARCHAR(30),
Customer_address VARCHAR(30),
Reg_date DATE);

-- Create Books table--

CREATE TABLE Books(
ISBN VARCHAR(25) PRIMARY KEY,
Book_title VARCHAR(50),
Category VARCHAR(30),
Rental_Price DECIMAL(10,2),
Status VARCHAR(3),
Author VARCHAR(30),
Publisher VARCHAR(30));

-- Create IssueStatus table--

CREATE TABLE IssueStatus(
Issue_Id VARCHAR(10) PRIMARY KEY,
Issued_cust VARCHAR(30),
Issued_book_name VARCHAR(50),
Issue_date DATE,
Isbn_book VARCHAR(25),
FOREIGN KEY (Issued_cust) REFERENCES customer(Customer_id),
FOREIGN KEY (Isbn_book) REFERENCES books(ISBN));

-- Create ReturnStatus table--

CREATE TABLE ReturnStatus(
Return_id VARCHAR(10) PRIMARY KEY,
Return_cust VARCHAR(30),
Return_book_name VARCHAR(50),
Return_date DATE,
isbn_book2 VARCHAR(25),
FOREIGN KEY (isbn_book2) REFERENCES books(ISBN));

-- Insert Values into Branch table--

INSERT INTO Branch
VALUES
('A1', 'Z5', '839 ULKD', '+919000700000'),
('A2', 'Z6', '226 KDSND', '+918585858585'),
('A3', 'Z7', '208 PLML', '+917894561230'),
('A4', 'Z8', '404 MPZH', '+912345678910'),
('A5', 'Z9', '604 MLPRA', '+913698471529');
SELECT * FROM Branch;

-- Insert Values into Employee table--

INSERT INTO Employee
VALUES 
('E1', 'XXXXX', 'CRE', 10000,'A1'),
('E2', 'YYYYY', 'ABM', 20000,'A2'),
('E3', 'AAAAA', 'BM', 30000,'A5'),
('E4', 'ZXCVB', 'AM', 45000,'A1'),
('E5', 'MLKJI', 'CM', 50000,'A5'),
('E6', 'IJKLM', 'LIB RM', 60000,'A1'),
('E7', 'JIHGF', 'LIB ZM', 75000,'A4'),
('E8', 'FGHIJ', 'LIM SH', 80000,'A1'),
('E9', 'EDCBE', 'LIB HR', 85000,'A4'),
('E10', 'ABCDE', 'LIB HR MNGR', 100000,'A1'),
('E11', 'HRRRR', 'LIB HR HEAD', 150000,'A1');

SELECT * FROM Employee;

-- Insert Values into Customer table--

INSERT INTO Customer
VALUES
('C50', 'HUHUH', '24 PTA', '2007-02-17'),
('C51', 'KLKLK', '36 KRD', '2015-07-12'),
('C52', 'SHIHI', '69 POP', '2008-09-08'),
('C54', 'MLMKM', '86 JKJ', '2023-08-09'),
('C55', 'SAASA', '100 KLM','2024-05-06');
SELECT * FROM customer;

-- Insert values into Books table--

INSERT INTO books
VALUES
('007-007', 'KMKMMKMKM', 'SCIENCE', 350, 'yes', 'ssssss', 'shshshs PUBLISHERS'),
('008-008', 'PSPSPSPSL', 'CRIME THRILLER', 859, 'yes', 'PAKALAM', 'ASASSA PUBLISHERS'),
('009-009', 'SLKLKLKLL', 'HISTORY', 369, 'NO',  'ZSWZSWZZ', 'EDEDE Publishing '),
('226-226', 'QABARXXXX', 'DRAMA', 400, 'no', 'K R Meera', 'ESDEDED Books'),
('335-335', 'KLKLKLKLK', 'MORAL STORY', 850, 'yes', 'ASASSSSSA', 'WSEWSS Books');
SELECT * FROM books;

-- Insert Values into IsssueStatus table--

INSERT INTO IssueStatus 
VALUES
('ISUE S1', 'C50', 'KLKLKLKLK', '2007-03-17', '335-335'),
('ISUE S2', 'C54', 'SLKLKLKLL', '2023-09-08', '009-009'),
('ISUE S3', 'C55', 'KMKMMKMKM', '2023-06-03', '007-007'),
('ISUE S4', 'C51', 'QABARXXXX', '2024-06-05', '226-226');
SELECT * FROM IssueStatus;

-- Insert Values into ReturnStatus table--

INSERT INTO ReturnStatus VALUES
('RTRN1', 'RC50', 'KLKLKLKLK', '2024-03-11', '335-335'),
('RTRN2', 'RC55', 'KMKMMKMKM', '2023-09-11', '007-007'),
('RTRN3', 'RC51', 'QABARXXXX', '2022-06-11', '226-226');
SELECT * FROM returnstatus;

-- 1. Retrieve the book title, category, and rental price of all available books.

SELECT book_title, category, rental_price FROM Books 
WHERE  Status = 'Yes';

-- 2. List the employee names and their respective salaries in descending order of salary.

SELECT Emp_name, Salary FROM Employee 
ORDER BY Salary DESC;

-- 3. Retrieve the book titles and the corresponding customers who have issued those books.

SELECT Books.Book_title, Customer.Customer_name
FROM IssueStatus 
JOIN Books ON IssueStatus.Isbn_book=Books.ISBN
JOIN Customer ON IssueStatus.Issued_cust=Customer.Customer_Id;

-- 4. Display the total count of books in each category.

SELECT category, COUNT(Book_title) FROM Books 
GROUP BY category;

-- 5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.

SELECT Emp_name, Position FROM Employee 
WHERE Salary > 50000;

-- 6. List the customer names who registered before 2022-01-01 and have not issued any books yet.

SELECT Customer_name FROM Customer 
WHERE Reg_date<'2022-01-01' AND Customer_Id NOT IN (SELECT Issued_cust FROM IssueStatus);

-- 7. Display the branch numbers and the total count of employees in each branch.

SELECT Branch_no, COUNT(Emp_Id) FROM Employee
GROUP BY Branch_no;


-- 8. Display the names of customers who have issued books in the month of June 2023.

SELECT customer.Customer_name FROM customer INNER JOIN issuestatus ON 
customer.Customer_Id = issuestatus.Issued_cust WHERE issuestatus.Issue_date >= '2023-06-01' AND 
issuestatus.Issue_date <= '2023-06-30';

-- 9. Retrieve book_title from book table containing 'history'.

SELECT book_title FROM Books 
WHERE Category = 'History';

-- 10.Retrieve the branch numbers along with the count of employees for branches having more than 5 employees.

SELECT Branch_no , COUNT(Emp_Id) AS Emp_count FROM Employee
GROUP BY  Branch_no  HAVING (Emp_count) > 5;

