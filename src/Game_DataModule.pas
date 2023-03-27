unit Game_DataModule;

interface

uses
  SysUtils, Classes, DB, ADODB, WideStrings, SqlExpr;

type
  TdmGames = class(TDataModule)
    tblGames: TADOTable;
    conGames: TADOConnection;
    dsrGames: TDataSource;
    SQLConnection1: TSQLConnection;
    ADOQuery1: TADOQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmGames: TdmGames;

implementation

uses INT;

{$R *.dfm}

end.
