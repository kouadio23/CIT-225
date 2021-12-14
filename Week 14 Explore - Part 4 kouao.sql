# 1. Write a query to find the first name, last name, address of all staff who fname is 'Gallo.

use blood_donation_database;
Select fname, lname, phone_number
from staff
where fname = 'Gallo';

# 2.  Write a query to find the first name, last name, address of all donor who blood_group is "O" and lname is Dalo.
select fname, lname, blood_group
from donor
where blood_group = 'O' and lname = 'Dalo';


# 3. Write a query to SELECT the last_name from the donor, patient, and staff tables. Use a compound query to EXCLUDE duplicate values.
  select lname 
  from donor
  union
  select lname
  from patient
  union
  select lname
  from staff;
  
  # 4. Use a compound query to find the first and last names of all donor and patient whose last name starts with k. 
  -- Do not use joins in this query.  
  SELECT * FROM
  (select fname, lname
  from donor
  union 
  select fname, lname
  from patient) lnames
  where lname LIKE 'K%';
  
# 5. Sort the results from the previous query by the last_name column.

  SELECT * FROM
  (select fname, lname
  from donor
  union 
  select fname, lname
  from patient) lnames
  where lname LIKE 'K%'
  order by fname;
  
  -- update
  UPDATE x # x is table name
  SET y = b # y is column to change, b is new value
  WHERE z; # z is where clause
  
  UPDATE staff
  SET fname = 'Jaren'
  WHERE id = 1;
  
  -- delete
  DELETE FROM x # x is table name
  WHERE y; # y is where clause
  
  DELETE FROM blood_bank
  WHERE Donor_id = (SELECT id
					FROM donor
					WHERE fname = "Fulgence" AND lname = "Dalo");
  
  
  
