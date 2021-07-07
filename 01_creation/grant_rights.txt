-- From 'sys' user to 'student'

Create User student Identified By student; --login & password

Grant Create Session To student;

Create Tablespace Student_tbs
  Datafile 'student_tbs.dbf'
  Size 100M
  Autoextend On;

Alter User student Qouta Unlimited On Student_tbs;

Grant Create Table To student;

Alter User student Default Tablespace Student_tbs;

Grant Create Sequence To student;