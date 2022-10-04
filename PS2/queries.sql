USE bookbusiness;

-- NOTE: I listed the authors editors as I believe thats what matters 
-- when i was asked say authors per book.
-- to get a number count, simply do count(*)


-- 7.1. Books per author.
-- Author 1 has 2 books, Author 2 has 1 book, Author 3 has 2 books
/*
SELECT  b.Book_ID , b.Title, CONCAT(a.Author_fName,' ' , a.Author_lName) AS author_name, a.Author_ID
FROM Book b
LEFT JOIN BooktoAuthor ab ON b.Book_ID = ab.Book_ID
LEFT JOIN Author a ON ab.Author_ID = a.Author_ID
WHERE a.Author_ID = '1'
*/

-- 7.2. Authors per book.
-- book 1 has 2 authors, book 2 has 2 authors, book 31 has only 1
/*
SELECT  b.Book_ID , b.Title, CONCAT(a.Author_fName,' ' , a.Author_lName) AS author_name, a.Author_ID
FROM Book b
LEFT JOIN BooktoAuthor ab ON b.Book_ID = ab.Book_ID
LEFT JOIN Author a ON ab.Author_ID = a.Author_ID
WHERE b.Book_ID = '1' 
*/

-- 7.3. Author royalties on a book.
-- given I didnt have a entity called book_sales or a column that does that calculation, i used the mapping table to get total number of books sold (via order)
/*
SELECT  b.Book_ID , b.Title, CONCAT(a.Author_fName,' ' , a.Author_lName) AS author_name, COUNT(bo.Book_ID = '1')*b.royalties*b.Price as total_royalty_for_the_book
FROM BooktoOrder bo
LEFT JOIN Book b ON b.Book_ID = bo.Book_ID
LEFT JOIN BooktoAuthor ab ON bo.Book_ID = ab.Book_ID
LEFT JOIN Author a ON ab.Author_ID = a.Author_ID
WHERE bo.Book_ID = '1' AND a.Author_ID = '1'
*/

-- 7.4. Book royalties per author.
/*
SELECT  b.Book_ID , b.Title, CONCAT(a.Author_fName,' ' , a.Author_lName) AS author_name, b.royalties*b.Price as total_royalty_for_the_book
FROM Book b
LEFT JOIN BooktoAuthor ab ON b.Book_ID = ab.Book_ID
LEFT JOIN Author a ON ab.Author_ID = a.Author_ID
WHERE  a.Author_ID = '1'
*/


-- 7.5. Books in a genre.
-- YA has 2 books, comedy has 1 book
/*
SELECT  b.Book_ID, b.Title, b.ISBN
FROM Book b
WHERE b.genre = 'YA' 
*/

-- 7.6. Books published by a publisher.
-- Publisher ID 1 has 2 books, ID 4 has 1 book
/*
SELECT  b.Book_ID, b.Title, b.ISBN
FROM Book b
INNER JOIN Publisher p ON b.Publisher_ID = p.Publisher_ID
WHERE p.Publisher_ID = '1' 
*/
 
-- 7.7. Editors per book.
-- book 1 has 2 editors, book 2 has 1 editor, book 31 has 2 editors
/*
SELECT  b.Book_ID , b.Title, CONCAT(e.Editor_fName,' ' , e.Editor_lName) AS editor_name, e.Editor_ID
FROM Book b
LEFT JOIN BooktoEditor be ON b.Book_ID = be.Book_ID
LEFT JOIN Editor e ON be.Editor_ID = e.Editor_ID
WHERE b.Book_ID = '31'
*/

-- 7.8. Books per editor.
-- editor 1 has 2 books, editor 2 has 1 book, editor 3 has 2 books.
/*
SELECT  b.Book_ID , b.Title, CONCAT(e.Editor_fName,' ' , e.Editor_lName) AS editor_name, e.Editor_ID
FROM Book b
LEFT JOIN BooktoEditor be ON b.Book_ID = be.Book_ID
LEFT JOIN Editor e ON be.Editor_ID = e.Editor_ID
WHERE e.Editor_ID = '3'
*/

-- 7.9. Books in an order.
/*
SELECT  o.Order_ID , o.Order_Date, CONCAT(o.Order_fName,' ' , o.Order_lName) AS receipiant_name, b.Title as Book_Title
FROM Orders o
LEFT JOIN BooktoOrder bo ON o.Order_ID = bo.Order_ID
LEFT JOIN Book b ON bo.Book_ID = b.Book_ID
WHERE o.Order_ID = '2'
*/

-- 7.10. Orders for a book.
/*
SELECT  o.Order_ID , o.Order_Date, CONCAT(o.Order_fName,' ' , o.Order_lName) AS receipiant_name, b.Book_ID
FROM Orders o
LEFT JOIN BooktoOrder bo ON o.Order_ID = bo.Order_ID
LEFT JOIN Book b ON bo.Book_ID = b.Book_ID
WHERE b.Book_ID = '2'
*/

-- 7.11. Customer orders.
-- customer 1 has one order, 2 and 3 both have 2 orders
/*
SELECT  o.Order_ID, o.Customer_Account, o.Order_Date
FROM Orders o
INNER JOIN Customer c ON o.Customer_Account = c.Customer_Account
WHERE o.Customer_Account = '2' 
*/

-- 7.12. Orders per customer.
-- customer 1 has one order, 2 and 3 both have 2 orders
/*
SELECT  COUNT(*)
FROM Orders o
INNER JOIN Customer c ON o.Customer_Account = c.Customer_Account
WHERE o.Customer_Account = '2' 
*/


