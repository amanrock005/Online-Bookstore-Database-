
declare
 type book_cursor is ref cursor;
 v_book_cursor book_cursor;
 v_book_record books%rowtype;
begin
 open v_book_cursor for
  select * from books where stock_quantity > 10;
  
 loop 
  fetch v_book_cursor 
  into v_book_record;
  
  exit when v_book_cursor%notfound;
  dbms_output.put_line('book title: '||v_book_record.title|| v_book_record.price);
 end loop;
 
 close v_book_cursor;
end;
/

create materialized view mv_book_sales
build immediate
refresh force on demand
as 
select
 b.book_id,
 b.title,
 sum(od.quantity) as total_quantity_sold,
 sum(od.subtotal)
from books b
join orderdetails od on b.book_id = od.book_id
group by b.book_id, b.title;
