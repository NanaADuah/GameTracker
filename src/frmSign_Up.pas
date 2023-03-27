////////////////////////////////////////
//                                    //
//        Nana Agyemang-Duah          //
//                                    //
////////////////////////////////////////

{ All global functions and procedure are stored in /Phase 3/Application/INI.pas}

unit frmSign_Up;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, StdCtrls, jpeg, ADODB,DB, DBTables;

type
  TfrmSignUp = class(TForm)
    Image1: TImage;
    Panel1: TPanel;
    edtName: TEdit;
    lblName: TLabel;
    edtSurname: TEdit;
    lblSurname: TLabel;
    Bevel1: TBevel;
    lblPassord: TLabel;
    edtPassword: TEdit;
    SpeedButton1: TSpeedButton;
    bmbCreateAccount: TBitBtn;
    Bevel2: TBevel;
    Button1: TButton;
    procedure SpeedButton1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SpeedButton1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure bmbCreateAccountClick(Sender: TObject);
    procedure edtPasswordChange(Sender: TObject);
    procedure edtSurnameChange(Sender: TObject);
    procedure edtNameChange(Sender: TObject);
    procedure edtPasswordClick(Sender: TObject);
    procedure edtNameClick(Sender: TObject);
    procedure edtSurnameClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure edtNameExit(Sender: TObject);
    procedure edtSurnameExit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
  sName,sConfirmUsername, sSurname, sPassword : string;
   PassW : Boolean;
   sUsername : string;
    { Private declarations }
  public
    { Public declarations }
  end;
const
MAXNUM = 15;
var
  frmSignUp: TfrmSignUp;

implementation

uses INT, frmBegin;

{$R *.dfm}

procedure TfrmSignUp.bmbCreateAccountClick(Sender: TObject);
Var
i : integer;
C : char;

begin
sName := edtName.Text;
sSurname := edtSurname.Text;
sPassword := edtPassword.Text;

if edtName.Text='' then //Prevent the user from leaving the edit blank
begin
MessageDlg('Please enter your name',mtError,[mbRetry,mbCancel],0);
edtName.SetFocus;
edtName.Color := 255{clRed};
end
else
if edtSurname.Text = '' then  //Prevent the user from leaving the edit blank
begin
Dialogs.MessageDlg('Please enter your surname',mtError,[mbRetry,mbCancel],0);
edtSurname.Color := 255{clRed};
edtSurname.SetFocus;
end
else
if edtPassword.Text='' then
begin
Dialogs.MessageDlg('Please enter a password',mtError,[mbRetry],0);
edtPassword.Color := 255{clRed};
end
else
if Length(sPassword)<6 then
begin
Dialogs.MessageDlg('Minimum password length is 6'#13'Please try again',mtError,[mbRetry],0)
end
else
begin
if CheckNumberOrLetter(sPassword,edtPassword)=true then
begin
if FileExists('Users/'+sUsername+'.mdb') = false then
begin
 sUsername := CreateUsername(sName,sSurname);
end
else
if FileExists('Users/'+sUsername+'.mdb') then
begin
CreateUsername(sName,sSurname);
end;
case MessageDlg('Successful, your suggested username is: "'+sUsername+'"'#13+'Would you like to change it?',mtConfirmation,[mbYes,mbNo],0) of
mrYes : begin
sConfirmUsername := InputBox('Username','Please enter your preferred username',sUsername);
if FileExists('Users/'+sUsername+'.mdb') then
begin
repeat
Dialogs.MessageDlg('Preferred username is taken, please choose another one',mtWarning,[mbRetry],0);
until
FileExists('Users/'+sUsername+'.mdb')= false;
end
else
begin
  try
  begin
  CreateUserDataBase(sUsername);
    MessageDlg('Account has successfully been created!',mtConfirmation,[mbOk],0);
  end;
  except
  MessageDlg('An error occurred',mtError,[mbOk],0);
  end;
end;

end;
mrNo : begin
sUsername := sUsername;
 try
  begin
  CreateUserDataBase(sUsername);
    MessageDlg('Account has successfully been created!',mtConfirmation,[mbOk],0)
  end;
  except
  MessageDlg('An error occurred',mtError,[mbOk],0);
 end;
end;
end;
end;
end;
end;
{------------------------------------------------------------------------------}
procedure TfrmSignUp.Button1Click(Sender: TObject);
begin
BeginForm.Show;
frmSignUp.Hide;
end;

procedure TfrmSignUp.edtNameChange(Sender: TObject);
begin
edtName.Color := clWhite{16777215};
end;

procedure TfrmSignUp.edtNameClick(Sender: TObject);
begin
edtName.Color := clWhite{16777215};
end;

procedure TfrmSignUp.edtNameExit(Sender: TObject);
begin
ChangeCases(edtName)

end;

procedure TfrmSignUp.edtPasswordChange(Sender: TObject);
begin
edtPassword.Color := clWhite{16777215};
end;

procedure TfrmSignUp.edtPasswordClick(Sender: TObject);
begin
edtPassword.Color := clWhite{16777215};
end;

procedure TfrmSignUp.edtSurnameChange(Sender: TObject);
begin
edtSurname.Color := clWhite{16777215};
end;

procedure TfrmSignUp.edtSurnameClick(Sender: TObject);
begin
edtSurname.Color := clWhite{16777215};
end;

procedure TfrmSignUp.edtSurnameExit(Sender: TObject);
begin
ChangeCases(edtSurname);
end;

procedure TfrmSignUp.SpeedButton1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
edtPassword.PasswordChar := #0;
end;

procedure TfrmSignUp.SpeedButton1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
edtPassword.PasswordChar := '*'
end;

procedure TfrmSignUp.Timer1Timer(Sender: TObject);
begin
ChangeCases(edtName);
end;

end.
