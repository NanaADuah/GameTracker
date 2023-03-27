program GameScoreTracker;

uses
  Forms,
  frmBegin in 'frmBegin.pas' {BeginForm},
  INT in 'INT.pas',
  Game_DataModule in 'Game_DataModule.pas' {dmGames: TDataModule},
  frmSign_Up in 'frmSign_Up.pas' {frmSignUp},
  frmLogin in 'frmLogin.pas' {Login},
  Unit1 in 'Unit1.pas' {Form1},
  frmMainForm in 'frmMainForm.pas' {MainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TBeginForm, BeginForm);
  Application.CreateForm(TdmGames, dmGames);
  Application.CreateForm(TfrmSignUp, frmSignUp);
  Application.CreateForm(TLogin, Login);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
