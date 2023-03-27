unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, ADODB;

type
  TForm2 = class(TForm)
    DataSource1: TDataSource;
    ADOConnection1: TADOConnection;
    ADOTable1: TADOTable;
    DBGrid1: TDBGrid;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.FormCreate(Sender: TObject);
begin
ADOConnection1.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Users\Nana\Documents\School H.S.S\I.T\Nana Agyemang-Duah\Phase 3\Application\db.mdb;Persist Security Info=False';
ADOTable1.Connection := ADOConnection1;
ADOConnection1.LoginPrompt := False;
ADOTable1.TableName := 'Table1';
ADOConnection1.Connected := true;
ADOTable1.Active := true;
DBGrid1.DataSource := DataSource1;
end;

end.
