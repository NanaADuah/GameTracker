unit frmLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, StdCtrls, jpeg, ADODB, DB;

type
  TLogin = class(TForm)
    Image1: TImage;
    Panel1: TPanel;
    Label1: TLabel;
    edtUsername: TEdit;
    Bevel1: TBevel;
    Label2: TLabel;
    edtPassword: TEdit;
    SpeedButton1: TSpeedButton;
    BitBtn1: TBitBtn;
    Bevel2: TBevel;
    Button1: TButton;
    lblForgotPassword: TLabel;
    procedure SpeedButton1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SpeedButton1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure lblForgotPasswordMouseLeave(Sender: TObject);
    procedure lblForgotPasswordMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    { Private declarations }
    sUsername, sPassword : string;
    ADOCG : TADOConnection;
    ADOTBL : TADOTable;
    ADOSRC : TDataSource;
  public
    { Public declarations }
  end;

var
  Login: TLogin;

implementation

uses INT, Game_DataModule, frmBegin, frmMainForm;

{$R *.dfm}

procedure TLogin.BitBtn1Click(Sender: TObject);
begin
sUsername := edtUsername.Text;
sPassword := edtPassword.Text;

if MatchPass(Game_DataModule.dmGames.tblGames,sUsername,sPassword) then
begin
edtUsername.Clear;
edtPassword.Clear;

sPassword := '';
sUsername := '';


 Login.Hide;
 MainForm.Show;
 ADOCG.Connected := false;

end
else
begin
lblForgotPassword.Visible := true;
  MessageDlg('Please check username or password and try again',mtError,[mbRetry],0);
end;

end;

procedure TLogin.Button1Click(Sender: TObject);
begin
Login.Hide;
BeginForm.Show;
end;

procedure TLogin.FormActivate(Sender: TObject);
var

DirSt : string;
begin
DirSt := GetCurrentDir;
ADOCG := Game_DataModule.dmGames.conGames;
ADOTBL := Game_DataModule.dmGames.tblGames;
ADOSRC := Game_DataModule.dmGames.dsrGames;


ADOCG.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+(DirSt)+'\Users\UserACC.mdb;Persist Security Info=False';

ADOTBL.Connection := ADOCG;
ADOCG.LoginPrompt := False;
ADOTBL.TableName := 'ACHolder';


ADOCG.Connected := true;
ADOTBL.Active := true;
ADOCG.Connected := true;
end;

procedure TLogin.lblForgotPasswordMouseLeave(Sender: TObject);
begin
lblForgotPassword.Font.Style := [];
end;

procedure TLogin.lblForgotPasswordMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
lblForgotPassword.Font.Style := [fsUnderline];
end;

procedure TLogin.SpeedButton1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
edtPassword.PasswordChar := #0;
end;

procedure TLogin.SpeedButton1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
edtPassword.PasswordChar := '*';
end;

end.
