Create Table Currencies (
  Numcode Char(3) Not Null,
  Alphacode Varchar2(3) Not Null,
  Name Varchar2(30)
)
Tablespace Student_tbs;


Create Table Exrates (
  Fromcurrency Char(3) Not Null,
  Tocurrency Char(3) Not Null,
  LTimestamp Timestamp(3) Not Null
)
Tablespace Student_tbs;


Create Table Customers (
  Serno Number(10) Not Null,
  Id Varchar2(20) Not Null,
  Firstname Varchar2(30),
  Lastname Varchar2(30)
)
Tablespace Student_tbs;


Create Table Payments (
  Serno Number(10) Not Null,
  LTimestamp Timestamp(2) Not Null,
  Customerserno Number(10) Not Null,
  Currency Char(3) Not Null,
  Amount Number(20,10) Not Null,
  Base_amount Number(20,10)
)
Tablespace Student_tbs;


Create Table Coupons (
  Customerid Varchar2(20) Not Null,
  Issued Date Not Null,
  Amount Number(20,10) Not Null
)
Tablespace Student_tbs;


