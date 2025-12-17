use library;
Select * from book_authors;
select * from book_copies;
select * from book_loans;
select * from books; 
select * from borrower;
select * from library_branch;
select * from publishers;

# To count no.of books a particular library branch contains.
select lb.library_branch_branch_id,lb.library_branch_BranchName,count(bc.book_copies_No_Of_Copies) from
library_branch lb
join
book_copies bc on lb.library_branch_branch_id = bc.book_copies_branch_id
group by lb.library_branch_branch_id; 

# To check the book name that ends with letter 'G' & second letter to be 't' in authors name.
select * from books
where book_title like '%g';

select * from book_authors
where book_author_name like '_t%'; 

# To count how many borrowers have borrowed the books from library from 2018-02-01 to 2018-02-28
SELECT Br.borrower_card_number,
   COUNT(Bl.Book_loans_card_no) AS loan_count
FROM 
    book_loans Bl
JOIN 
    borrower Br 
    ON Bl.Book_loans_card_no = Br.borrower_card_number
WHERE 
    Bl.Book_loans_date_out BETWEEN '2018-02-01' AND '2018-02-28'
GROUP BY 
    Br.borrower_card_number;

# Number of books a particular author has written. 
select ba.book_author_id as book_author_id, ba.book_author_name ,
count(distinct b.book_id) as books_written from
book_authors ba
join
books b on ba.book_authors_book_id = b.book_id
join
book_copies bc on b.book_id = bc.book_copies_book_id
group by book_author_id, ba.book_author_name;
 
/* to check how many books every library contains in total and what all book is there in all
the library and how many no of copies. */   
# To check how many books every library contains. 
select lb.library_branch_branch_id,lb.library_branch_branchname,
count(bc.book_copies_no_of_copies) as total_copies from 
library_branch lb
join
book_copies bc on lb.library_branch_branch_id = bc.book_copies_Branch_id
join
books b on bc.book_copies_Book_id = b.book_id
group by lb.library_branch_branch_id;
 
#what all book is there in all the library and how many no of copies.  
select lb.library_branch_branch_id,lb.library_branch_branchname,b.book_title,
bc.book_copies_no_of_copies as total_copies from 
library_branch lb
join
book_copies bc on lb.library_branch_branch_id = bc.book_copies_Branch_id
join
books b on bc.book_copies_Book_id = b.book_id;

# To know which publisher is publishing more books and which is publishing least or no no.of books.
select p.publisher_id,p.Publisher_Name,
coalesce(count(distinct b.book_id),0) as Total_Books,
coalesce(sum(bc.book_copies_No_Of_Copies),0) as Total_Book_Copies from
publishers p 
left join
books b on p.Publisher_Name = b.Book_Publisher_Name
left join 
book_copies bc on b.book_id = bc.book_copies_Book_id 
group by p.publisher_id,p.publisher_name;
 
     
 




