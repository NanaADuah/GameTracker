unit frmBegin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, jpeg;

type
  TBeginForm = class(TForm)
    btnSignUp: TButton;
    btnLogin: TButton;
    Image1: TImage;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    pnlPlay: TPanel;
    Timer1: TTimer;
    Timer2: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure btnSignUpClick(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BeginForm: TBeginForm;

implementation

uses INT, frmSign_Up, frmLogin, Game_DataModule, Unit1, Unit2, frmMainForm;

{$R *.dfm}

procedure TBeginForm.Button1Click(Sender: TObject);
begin
CreateUserDataBase(InputBox('','',''))
end;

procedure TBeginForm.btnSignUpClick(Sender: TObject);
begin
BeginForm.Hide;
frmSignUp.Show;
end;

procedure TBeginForm.btnLoginClick(Sender: TObject);
begin
BeginForm.Hide;
Login.Show;
end;

procedure TBeginForm.Button5Click(Sender: TObject);
begin
form2.Show;
end;

procedure TBeginForm.Timer1Timer(Sender: TObject);
begin
pnlPlay.Left := pnlPlay.Left+10;
if pnlPlay.left >= 477 then

begin
Timer2.Enabled := true ;
if
Timer2.Enabled = true then timer1.Enabled := false;
  //
end;


end;

procedure TBeginForm.Timer2Timer(Sender: TObject);
begin
pnlPlay.Left := pnlPlay.Left-10;
if pnlPlay.left <= 0 then
Timer1.Enabled := true;
if
Timer1.Enabled = true then timer2.Enabled := false;

end;

end.
