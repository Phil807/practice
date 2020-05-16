-- SQL Function and Procedures. Should I use Python UDF's instead?

-- Example 1.

create function f_sql_greater (float, float)
  returns float
stable
as $$
  select case when $1 > $2 then $1
    else $2
  end
$$ language sql;



-- Function that returns a single value
create or replace function max_price() 
	returns real 
	volatile
as 
$$
	select 
		max(main_amount)
	from
		rsl.stf_adyen
$$ 
language sql;

-- To call the function
select max_price();