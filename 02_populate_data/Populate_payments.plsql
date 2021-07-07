Declare
  i Integer;
  From_time Char(10);
  To_time Char(10);
  cLTimestamp Date;
  Cursor cSerno Is Select Serno From Customers Order By Dbms_random.Random;
  Cursor cCurrency Is Select Numcode From Currencies Order By Dbms_random.Random;
  xSerno Number(10);
  xCurrency Char(3);
  xAmount Number(20,10);

Begin
  For Loop_counter In 1..100 Loop
    To_time := To_char(Sysdate, 'J');
    From_time := To_char(Date '2017-12-31', 'J');

    cLTimestamp := To_date(Trunc(Dbms_random.Value(Form_time, To_time)), 'J');
    Dbms_output.Put_line(cLTimestamp);

    Open cSerno;
    Fetch cSerno Into xSerno;
    Dbms_output.Put_line(xSerno);
    Close cSerno;

    Open cCurrency;
    Fetch cCurrency Into xCurrency;
    Dbms_output.Put_line(xCurrency);
    Close cCurrency;

    xAmount := Dbms_random.Value(0, 100000);
    Insert Into Payments(Serno, LTimestamp, Customerserno, Currency, Amount, Base_amount)
    Values (
             Payments_seq.Nextval,
             cLTimestamp,
             xSerno,
             xCurrency,
             xAmount,
             Null
           );
  End Loop;
  Commit;
End;