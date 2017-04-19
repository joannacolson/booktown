--1. Order

	--Find all subjects sorted by subject
SELECT * FROM subjects ORDER BY subject;
	--Find all subjects sorted by location
SELECT * FROM subjects ORDER BY location;

--2. Where

	--Find the book "Little Women"
SELECT * FROM books WHERE title = 'Little Women';
	--Find all books containing the word "Python"
SELECT * FROM books WHERE title LIKE '%Python%';
	--Find all subjects with the location "Main St" sort them by subject
SELECT * FROM subjects WHERE location = 'Main St' ORDER BY subject;


--3. Joins

	--Find all books about Computers and list ONLY the book titles
SELECT title FROM books JOIN subjects ON books.subject_id = subjects.id WHERE subject = 'Computers';

	--Find all books and display a result table with ONLY the following columns
		--Book title
		--Author's first name
		--Author's last name
		--Book subject
SELECT title, first_name, last_name, subject FROM books, authors, subjects WHERE subject_id = subjects.id AND author_id = authors.id;

	--Find all books that are listed in the stock table
		--Sort them by retail price (most expensive first)
		--Display ONLY: title and price
SELECT title, retail FROM books, stock, editions WHERE books.id = book_id AND editions.isbn = stock.isbn ORDER BY retail DESC;


	--Find the book "Dune" and display ONLY the following columns
		--Book title
		--ISBN number
		--Publisher name
		--Retail price
SELECT books.title, editions.isbn, publishers.name, stock.retail FROM books, stock, editions, publishers WHERE books.id = editions.book_id AND editions.isbn = stock.isbn AND editions.publisher_id = publishers.id AND title = 'Dune';

--Find all shipments sorted by ship date display a result table with ONLY the following columns:
	--Customer first name
	--Customer last name
	--ship date
	--book title
SELECT customers.first_name, customers.last_name, shipments.ship_date, books.title FROM shipments, customers, editions, books WHERE shipments.customer_id = customers.id AND shipments.isbn = editions.isbn AND editions.book_id = books.id;

--4. Grouping and Counting
	--Get the COUNT of all books
SELECT COUNT(*) FROM books;

	--Get the COUNT of all Locations
SELECT COUNT(DISTINCT(location)) FROM subjects;

	--Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
SELECT COUNT(location), location FROM subjects GROUP BY location HAVING COUNT(location) > 0 ORDER BY COUNT(location) DESC;

--List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)
SELECT books.id, books.title, COUNT(book_editions.book_id) AS book_editions_count
FROM books
LEFT OUTER JOIN
(SELECT book_id, edition FROM editions GROUP BY book_id, edition) AS book_editions
ON (books.id = book_editions.book_id)
GROUP BY books.id
ORDER BY title;

--YAY! You're done!!

