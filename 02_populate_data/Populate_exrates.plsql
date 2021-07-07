Declare
  i Varchar2(3);
  j Varchar2(3);
  xLTimestamp Timestamp(3);
  Rate Number(20,10);
  Type Mp Is Table Of Number Index By Varchar2(3);
  Data1 Mp;
  Type Name_mp Is Table Of Varchar2(3) Index By Varchar2(3);
  Names Name_mp;
Begin
  Data1('840') := 1;
  Data1('826') := 1.26899;
  Data1('643') := 0.76387;
  Data1('978') := 1.13788;
  Data1('036') := 0.70034;

  --Data1('840') := 1;
  --Data1('826') := 1.24512;
  --Data1('643') := 0.76138;
  --Data1('978') := 1.12106;
  --Data1('036') := 0.69196;

  xLTimestamp := Systimestamp;
  Dbms_output.Put_line(xLTimestamp);

  i := Data1.First;
  While i Is Not Null Loop
    j := Data1.First;
    While j Is Not Null Loop
      Rate := Data1(i) / Data1(j);
      Insert Into Exrates (Fromcurrency, Tocurrency, Rate, LTimestamp)
      Values (
                Cast(i As Char(3)),
                Cast(j As Char(3)),
                Rate,
                xLTimestamp
             );
      j := Data1.Next(j);
    End Loop;
    i := Data1.Next(i);
    Commit;
  End Loop;
End;        
