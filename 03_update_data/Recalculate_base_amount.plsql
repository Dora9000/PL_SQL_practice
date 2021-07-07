Declare
  Cursor cPayments Is Select * From Payments;
  cPayment Payments%Rowtype;
  xAmount Payments.Amount%Type;
  cRate Number(20,10);
  Type Rate_row Is Record (
                            Fromcurrency Char(3);
                            Tocurrency Char(3);
                            Rate Number(20,10)
                          );
  Type Rates_mp Is Table Of Rate_row Index By Pls_integer;
  Rates_table Rates_mp;
  Type Rates_mp2 Is Table Of Number(20,10) Index By Varchar2(6);
  Rates_table2 Rates_mp2;

Begin
  Select Fromcurrency, Tocurrency, Rate
  Bulk Collect Into Rates_table
  From Exrates E
  Where LTimestamp = (
    Select Max(LTimestamp)
    From Exrates EE
    Where E.FromCurrency=EE.FromCurrency And E.Tocurrency=EE.Tocurrency
    );

  For i In 1..Rates_table.Count Loop
    Rates_table2(Rates_table(i).Fromcurrency || Rates_table(i).Tocurrency) := Rates_table(i).Rate;
  End Loop;

  For cPayment In cPayments Loop
    xAmount := cPayment.Amount * Rates_table2(cPayment.Currency || '978');
    Update Payments
    Set Base_amount = xAmount
    Where Serno = cPayment.Serno;
    Commit;
  End Loop;
End;