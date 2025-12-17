create database Library;
use Library;
CREATE TABLE Publishers(publisher_id int primary key,
    Publisher_Name VARCHAR(55) NOT NULL UNIQUE,
		Publisher_Address VARCHAR(100) NOT NULL,
		Publisher_Phonenumber VARCHAR(20)
	);
 
CREATE INDEX indx_publisher_name ON Publishers(Publisher_Name);

	CREATE TABLE Books(
	Book_id INT PRIMARY KEY NOT NULL, 
	Book_Title VARCHAR(100) NOT NULL,
	Book_Publisher_Name VARCHAR(100) ,
	FOREIGN KEY(Book_Publisher_Name) REFERENCES Publishers(Publisher_Name) 
	ON UPDATE CASCADE
	ON DELETE CASCADE
	); 
    
CREATE TABLE library_branch(
	library_branch_Branch_id INT PRIMARY KEY ,
	library_branch_BranchName VARCHAR(100) ,
	library_branch_BranchAddress VARCHAR(200) NOT NULL
	);
    
CREATE TABLE Borrower(
		borrower_Card_Number INT PRIMARY KEY,
		Borrower_Name VARCHAR(55) NOT NULL,
		Borrower_Address VARCHAR(100) NOT NULL,
		Borrower_Phone_number VARCHAR(15) default(+91)
	);
    
CREATE TABLE Book_loans(
	Book_Loans_id INT  ,
	Book_loans_Book_id INT,
	Book_loans_Branch_id INT  , 
	Book_loans_Card_No INT  ,
	Book_loans_Date_Out date not null,
	Book_loans_Due_Date date not null,
	primary key(Book_Loans_id,Book_loans_Book_id,Book_loans_Branch_id,Book_loans_Card_No),
	foreign key(Book_loans_Book_id) references Books(Book_id),
	foreign key(Book_loans_Branch_id) references library_branch(library_branch_Branch_id),
	foreign key(Book_loans_Card_No) references Borrower(borrower_Card_Number)
	on delete cascade
    on update cascade
    );
    
CREATE TABLE Book_copies (
	S_no INT PRIMARY KEY,
	book_copies_Book_id INT,
	book_copies_Branch_id INT ,
	book_copies_No_Of_Copies INT ,
	foreign key(book_copies_Book_id) references Books(Book_id),
	foreign key(book_copies_Branch_id) references library_branch(library_branch_Branch_id)
	on update cascade
	on delete cascade
	);
    
CREATE TABLE Book_Authors (
		Book_Author_id INT ,
		Book_Authors_Book_id INT ,
		Book_Author_Name VARCHAR(50) not null,
        primary key (Book_Author_id,Book_Authors_Book_id),
        foreign key(Book_Authors_Book_Id) references Books(Book_id)
        on delete cascade
        on update cascade
	);
    
insert into Publishers(publisher_id,publisher_name,publisher_Address,publisher_phonenumber)
    values
    (1, 'Penguin Random House India', '1 Nehru Place, New Delhi, Delhi', '+91-1234567890'),
    (2, 'HarperCollins India', '10 Connaught Place, New Delhi, Delhi', '+91-2345678901'),
    (3, 'Rupa Publications India', '20 Lajpat Nagar, New Delhi, Delhi', '+91-3456789012'),
    (4, 'SAGE Publications India', '30 Vasant Vihar, New Delhi, Delhi', '+91-4567890123'),
    (5, 'Oxford University Press India', '40 Daryaganj, New Delhi, Delhi', '+91-5678901234'),
    (6, 'Bloomsbury Publishing India', '50 Okhla, New Delhi, Delhi', '+91-6789012345'),
    (7, 'Westland Publications India', '60 Rajouri Garden, New Delhi, Delhi', '+91-7890123456'),
    (8, 'Pustak Mahal Publications India', '70 Paharganj, New Delhi, Delhi', '+91-8901234567'),
    (9, 'Hachette India', '80 Saket, New Delhi, Delhi', '+91-9012345678'),
    (10, 'Aleph Book Company', '90 Vasant Kunj, New Delhi, Delhi', '+91-9876543210');
    
INSERT INTO Books (Book_id, Book_Title, Book_Publisher_Name)
VALUES
(1, 'The Sorcerer''s Stone', 'Penguin Random House India'),
(2, 'The Chamber of Secrets', 'Penguin Random House India'),
(3, 'The Prisoner of Azkaban', 'Penguin Random House India'),
(4, 'The Goblet of Fire', 'Penguin Random House India'),
(5, 'The Order of the Phoenix', 'Penguin Random House India'),
(6, 'The Half-Blood Prince', 'Penguin Random House India'),
(7, 'The Deathly Hallows', 'Penguin Random House India'),
(8, 'The Dark Knight', 'Bloomsbury Publishing India'),
(9, 'The Man of Steel', 'Bloomsbury Publishing India'),
(10, 'The Amazing Spider-Man', 'Rupa Publications India'),
(11, 'The Avengers Assemble', 'Rupa Publications India'),
(12, 'The Vampire Diaries: The Awakening', 'Penguin Random House India'),
(13, 'The Vampire Diaries: The Struggle', 'Penguin Random House India'),
(14, 'The Vampire Diaries: The Fury', 'Penguin Random House India'),
(15, 'The Vampire Diaries: Dark Reunion', 'Penguin Random House India'),
(16, 'The Lord of the Rings: The Fellowship of the Ring', 'Bloomsbury Publishing India'),
(17, 'The Lord of the Rings: The Two Towers', 'Bloomsbury Publishing India'),
(18, 'The Lord of the Rings: The Return of the King', 'Bloomsbury Publishing India'),
(19, 'The Hobbit', 'Rupa Publications India'),
(20, 'The Silmarillion', 'Rupa Publications India');

INSERT INTO library_branch(library_branch_Branch_id, library_branch_BranchName, library_branch_BranchAddress)
VALUES
(1, 'Delhi NCR Library', '1 Connaught Place, New Delhi, Delhi'),
(2, 'Noida Central Library', '10 Noida Sector 18, Noida, Uttar Pradesh'),
(3, 'Ghaziabad Public Library', '20 Raj Nagar, Ghaziabad, Uttar Pradesh'),
(4, 'Delhi City Library', '30 Chandni Chowk, Delhi, Delhi'),
(5, 'Faridabad Municipal Library', '40 Faridabad Sector 12, Faridabad, Haryana');

INSERT INTO Borrower (borrower_Card_Number, Borrower_Name, Borrower_Address, Borrower_Phone_number) 
VALUES 
(1, 'Rajesh Kumar', '123 ABC Street, Delhi', '+91846516351'), 
(2, 'Priya Patel', '456 XYZ Road, Noida', '+91751936254'), 
(3, 'Aryan Gupta', '789 PQR Avenue, Ghaziabad', '+91624785139'), 
(4, 'Anjali Sharma', '101 JKL Lane, Faridabad', '+91589621437'), 
(5, 'Rohit Singh', '202 MNO Circle, Delhi', '+91354687921'), 
(6, 'Nisha Mishra', '303 DEF Colony, Noida', '+91968512374'), 
(7, 'Akash Verma', '404 GHI Street, Ghaziabad', '+91874512369'), 
(8, 'Sneha Yadav', '505 STU Road, Delhi', '+91365214987'), 
(9, 'Sanjay Desai', '606 JKL Avenue, Noida', '+91987412365'), 
(10, 'Pooja Mehta', '707 MNO Lane, Ghaziabad', '+91521493678'), 
(11, 'Manoj Khanna', '808 XYZ Circle, Faridabad', '+91654123987'), 
(12, 'Deepika Jain', '909 PQR Street, Delhi', '+91785496321'), 
(13, 'Ravi Tiwari', '1011 ABC Road, Noida', '+91963258741'), 
(14, 'Neha Choudhary', '1112 DEF Lane, Ghaziabad', '+91741852963'), 
(15, 'Vikram Malhotra', '1213 GHI Circle, Delhi', '+91852147963');

INSERT INTO Book_loans (Book_Loans_id, Book_loans_Book_id, Book_loans_Branch_id, Book_loans_Card_No, Book_loans_Date_Out, Book_loans_Due_Date)
VALUES
(1, 20, 5, 1, '2018-01-01', '2018-02-02'),
(2, 18, 1, 6, '2018-01-02', '2018-02-03'),
(3, 1, 4, 3, '2018-01-03', '2018-02-04'),
(4, 13, 2, 8, '2018-01-04', '2018-02-05'),
(5, 11, 1, 5, '2018-01-05', '2018-02-06'),
(6, 10, 4, 2, '2018-01-06', '2018-02-07'),
(7, 20, 4, 14, '2018-01-07', '2018-02-08'),
(8, 11, 1, 4, '2018-01-08', '2018-02-09'),
(9, 2, 2, 9, '2018-01-09', '2018-02-10'),
(10, 3, 2, 11, '2018-01-10', '2018-02-11'),
(11, 5, 2, 12, '2018-01-11', '2018-02-12'),
(12, 4, 2, 10, '2018-01-12', '2018-02-13'),
(13, 7, 3, 13, '2018-01-13', '2018-02-14'),
(14, 6, 1, 7, '2018-01-14', '2018-02-15'),
(15, 17, 4, 15, '2018-01-15', '2018-02-16'),
(3, 18, 5, 3, '2018-01-18', '2018-02-18'),
(2, 19, 5, 2, '2018-01-20', '2018-02-20'),
(4, 9, 2, 4, '2018-01-23', '2018-02-23'),
(1, 1, 5, 1, '2018-01-28', '2018-02-28'),
(5, 3, 1, 5, '2018-02-05', '2018-03-06'),
(15, 16, 3, 15, '2018-02-06', '2018-03-07'),
(7, 11, 2, 7, '2018-02-07', '2018-03-08'),
(13, 2, 2, 13, '2018-02-08', '2018-03-09'),
(9, 12, 3, 9, '2018-02-09', '2018-03-10'),
(15, 4, 4, 15, '2018-02-10', '2018-03-11'),
(11, 7, 2, 11, '2018-02-11', '2018-03-12'),
(12, 20, 2, 12, '2018-03-12', '2018-04-13'),
(10, 6, 1, 10, '2018-03-13', '2018-04-14'),
(14, 18, 5, 14, '2018-03-14', '2018-04-15'),
(6, 12, 1, 6, '2018-03-15', '2018-04-16');

INSERT INTO book_copies (S_no, book_copies_Book_id, book_copies_Branch_id, book_copies_No_Of_Copies)
VALUES
    (1, 1, 1, 3),
    (2, 2, 1, 4),
    (3, 3, 1, 5),
    (4, 4, 1, 4),
    (5, 5, 1, 3),
    (6, 6, 1, 2),
    (7, 7, 1, 3),
    (8, 8, 1, 4),
    (9, 9, 1, 5),
    (10, 10, 1, 3),
    (11, 11, 1, 4),
    (12, 12, 1, 2),
    (13, 13, 1, 3),
    (14, 14, 1, 5),
    (15, 15, 1, 4),
    (16, 16, 1, 2),
    (17, 17, 1, 4),
    (18, 18, 1, 5),
    (19, 19, 1, 3),
    (20, 20, 1, 4),
    (21, 1, 2, 4),
    (22, 2, 2, 3),
    (23, 3, 2, 5),
    (24, 4, 2, 3),
    (25, 5, 2, 4),
    (26, 6, 2, 2),
    (27, 7, 2, 3),
    (28, 8, 2, 4),
    (29, 9, 2, 5),
    (30, 10, 2, 3),
    (31, 11, 2, 4),
    (32, 12, 2, 2),
    (33, 13, 2, 3),
    (34, 14, 2, 5),
    (35, 15, 2, 3),
    (36, 16, 2, 4),
    (37, 17, 2, 2),
    (38, 18, 2, 5),
    (39, 19, 2, 4),
    (40, 20, 2, 3),
    (41, 1, 3, 5),
    (42, 2, 3, 4),
    (43, 3, 3, 3),
    (44, 4, 3, 4),
    (45, 5, 3, 2),
    (46, 6, 3, 5),
    (47, 7, 3, 3),
    (48, 8, 3, 4),
    (49, 9, 3, 5),
    (50, 10, 3, 3),
    (51, 11, 3, 2),
    (52, 12, 3, 4),
    (53, 13, 3, 5),
    (54, 14, 3, 3),
    (55, 15, 3, 4),
    (56, 16, 3, 5),
    (57, 17, 3, 4),
    (58, 18, 3, 3),
    (59, 19, 3, 2),
    (60, 20, 3, 4),
    (61, 1, 4, 2),
    (62, 2, 4, 5),
    (63, 3, 4, 3),
    (64, 4, 4, 4),
    (65, 5, 4, 5),
    (66, 6, 4, 3),
    (67, 7, 4, 2),
    (68, 8, 4, 4),
    (69, 9, 4, 5),
    (70, 10, 4, 3),
    (71, 11, 4, 5),
    (72, 12, 4, 4),
    (73, 13, 4, 3),
    (74, 14, 4, 2),
    (75, 15, 4, 4),
    (76, 16, 4, 3),
    (77, 17, 4, 5),
    (78, 18, 4, 4),
    (79, 19, 4, 3),
    (80, 20, 4, 2),
    (81, 1, 5, 3),
    (82, 2, 5, 4),
    (83, 3, 5, 5),
    (84, 4, 5, 3),
    (85, 5, 5, 2),
    (86, 6, 5, 4),
    (87, 7, 5, 3),
    (88, 8, 5, 5),
    (89, 9, 5, 4),
    (90, 10, 5, 3),
    (91, 11, 5, 2),
    (92, 12, 5, 4),
    (93, 13, 5, 5),
    (94, 14, 5, 4),
    (95, 15, 5, 3),
    (96, 16, 5, 5),
    (97, 17, 5, 4),
    (98, 18, 5, 3),
    (99, 19, 5, 2),
    (100, 20, 5, 4);
    
insert into Book_Authors(Book_Author_id,Book_Authors_Book_id,Book_Author_Name)
values
(1, 1, 'J.K. Rowling'),
(1, 2, 'J.K. Rowling'),
(1, 3, 'J.K. Rowling'),
(1, 4, 'J.K. Rowling'),
(1, 5, 'J.K. Rowling'),
(1, 6, 'J.K. Rowling'),
(1, 7, 'J.K. Rowling'),
(2, 8, 'Frank Miller'),
(3, 9, 'Jerry Siegel'),
(4, 10, 'Stan Lee'),
(4, 11, 'Stan Lee'),
(5, 12, 'L.J. Smith'),
(5, 13, 'L.J. Smith'),
(5, 14, 'L.J. Smith'),
(5, 15, 'L.J. Smith'),
(6, 16, 'J.R.R. Tolkien'),
(6, 17, 'J.R.R. Tolkien'),
(6, 18, 'J.R.R. Tolkien'),
(6, 19, 'J.R.R. Tolkien'),
(6, 20, 'J.R.R. Tolkien');    

    