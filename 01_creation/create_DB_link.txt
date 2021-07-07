-- Create DB_link to diff Database

Create Database Link MRakulORCL
  Connect To student Identified By student
  Using 'MRakul.ORCL';

Select * From Customers@MRakulORCL;

Create Synonym Customers_RMT For student.Customers@MRakulORCL;