unit INT;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,DB,ADODB,SqlExpr,SqlTimSt,WideStrings,SqlConst, DBGrids,Character ,
  WinSock, jpeg, ActiveX,VarUtils, ObjectArray, ComObj,StdCtrls,DBTables;

function CreateUserDataBase(dbName: string): string;
function CreateUsername(Name,Surname:string): string;
//function CheckPasswordVadility(Password:string):boolean;
function GetValueTrat(const aValue: string):string;
function CheckNumberOrLetter(Password:string; EDTPASS:TEdit): boolean;
function CreateInitialTable(ADOQuery:TADOQuery;sName,sPassword:string;FormName:TForm): string;
function ChangeCases(EditText : TEdit):string;
function CreateFields(Table:TTable;DataSource:TDataSource): string;
function MatchPass(Table : TADOTable; const Username, Pass : string) : Boolean;


implementation

uses frmBegin, frmLogin, frmSign_Up, Game_DataModule;

//##############################################################################
function CreateFields(Table:TTable;DataSource:TDataSource): string;
begin

end;
//##############################################################################
function MatchPass(Table : TADOTable; const Username, Pass : string) : Boolean;
begin
  Result := False;
  Table.First;
  while not Table.Eof do
  begin
    if Table.FieldByName('iniUsername').AsString = Username then
    begin
      Result := Table.FieldByName('iniPassword').AsString = Pass;
      Exit;
    end;
    Table.Next;
  end;
    // Result := Table.Locate('Username;Password',VarArrayOf([Name, Pass]),[]);
end;
//##############################################################################
function ChangeCases(EditText : TEdit):string;
var
Text, Remaining : string;
TextLength : integer;
FirstText : Char;
begin
Result := '';
Text := EditText.Text;
FirstText := Upcase(EditText.Text[1]);
TextLength := Length(EditText.Text);
Remaining := {LowerCase}(Copy(Text,2,TextLength-1));
EditText.Text := FirstText+Remaining;
end;
//##############################################################################
function CreateInitialTable(ADOQuery:TADOQuery;sName,sPassword:string;FormName:TForm): string;
var
Name: string;
MainForm : TForm;
QString: string;
begin
Name := sName;
QString:= 'CREATE TABLE ' + Name + ' (ProcessCaleneder DateTime, IndivName text(30), Position text(30), Mobile text(20), Salary Currency, Notes text(255))';

with ADOQuery do
begin
Close;
ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=Users\'+sName+'.mdb;';
SQL.Clear;
SQL.Add(QString);
ExecSQL;
end;
end;
//##############################################################################
function CheckNumberOrLetter(Password:string; EDTPASS:TEdit): boolean;
var
i, LettersT, NumbersT, PSLength : integer;
c : char;
Input : string;
begin
i := 0;
LettersT := 0;
PSLength := 0;
NumbersT := 0;

PSLength := Length(Password);

for i := 1 to PSLength do
begin
  if Upcase(Password[i]) in ['A'..'Z'] then
  Inc(LettersT);
  if UpCase(Password[i]) in ['0'..'9'] then
  Inc(NumbersT);
end;

if not(LettersT >= 1) then
begin
Dialogs.MessageDlg('Your password should some contain letters',mtError,[mbRetry],0);
ShowMessage(IntToStr(letterst)+' '+inttostr(numberst));
EDTPASS.Color := 255{clRed};
Result := False;
end
else
if not (NumbersT>=1) then
begin
Dialogs.MessageDlg('Password should contain numbers'#13'Please choose another one',mtError,[mbRetry],0);
EDTPASS.Color := 255{clRed};
Result := false;
end
else
if not(LettersT<=1) and not(NumbersT>=1) then
begin
Dialogs.MessageDlg('Password should consist of at least 6 characters and should contain numbers and letters, please try again.',mtError,[mbRetry],0);
EDTPASS.Color := 255{clRed};
Result := false;
end
else
if not(LettersT=0) and not(NumbersT=0) then
begin

  Result := true;
end;

end;
//##############################################################################
function GetValueTrat(const aValue: string):string;
const
CHARS = ['0'..'9','a'..'z','A'..'Z'];
var
i : integer;
begin
Result := aValue;
for i := 1 to Length(Result) do
begin
  if not (IsLetterOrDigit(Result[i]))then
    ShowMessage('Error');
end;
end;
//##############################################################################
//##############################################################################
function CreateUsername(Name,Surname:string):string;
var
i, j : integer;
N3, S3 : string;
begin
Result := '';
N3 := Copy(Name,1,3);
i := Length(Surname);
j := i-3;
S3 := Copy(Surname,j,i);

Result := N3+S3+IntToStr(Random(9)+1);
end;
//##############################################################################
function CreateUserDataBase(dbName: string): string;
var
mdb : OleVariant;
Databname : STRING;
begin
Result := '';
databname := 'Users\'+dbName+'.mdb';
try
mdb := CreateOleObject('ADOX.Catalog');
mdb.Create('Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+databname+';');
mdb:= Null;
ShowMessage('Successful!');
except on e : Exception do
Result := 'Error, there was an error with a factor of the users account...'
end;
end;
//##############################################################################

end.
