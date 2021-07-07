-- Primary Keys

Alter Table Currencies
Add Constraint Pk_Currencies Primary Key (Numcode);

Alter Table Exrates
Add Constraint Pk_Exrates Primary Key (Tocurrency, Fromcurrency, LTimestamp);

Alter Table Customers
Add Constraint Pk_Customers Primary Key (Serno);

Alter Table Payments
Add Constraint Pk_Payments Primary Key (Serno);


-- Unique

Alter Table Customers
Add Constraint U_Customers Unique (Id);


-- Foreign Keys

Alter Table Exrates
Add Constraint Fk_Exrate1
  Foreign Key (Tocurrency)
  References Currencies(Numcode);

Alter Table Exrates
Add Constraint Fk_Exrate2
  Foreign Key (Fromcurrency)
  References Currencies(Numcode);

Alter Table Payments
Add Constraint Fk_Payments1
  Foreign Key (Currency)
  References Currencies(Numcode);

Alter Table Payments
Add Constraint Fk_Payments2
  Foreign Key (Customerserno)
  References Customers(Serno);

Alter Table Coupons
Add Constraint Fk_Coupons
  Foreign Key (Customerid)
  References Customers(Id);
