
-- retrieve all books that are currently in stock

declare
 type book_title_array is table of books.title%type;
 type book_price_array is table of books.price%type;
 
 v_titles book_title_array;
 v_prices book_price_array;
begin
 select title,price
 bulk collect into v_titles, v_prices
 from books
 where stock_quantity > 0;
 
 for i in 1..v_title.count loop
  dbms_output.put_line('title'||v_title(i)||' '||v_prices(i));
 end loop;
end;
/

-- applying 10% discount to all books in the science fiction
declare
 type book_id_array is table of books.book_id%type;
 v_book_ids book_id_array;
begin
 select book_id
 bulk collect into v_book_ids
 from books
 where genre = 'Science Fiction';
 
 forall i in 1..v_book_ids.count
  update books
  set price = price*0.9
  where boook_id = v_book_ids(i);
 commit;
 
 dbms_output.put_line(v_book_ids.count||' book updaed with 10% discount ');
end;
/
