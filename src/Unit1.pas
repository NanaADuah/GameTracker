unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ADODB, DB,DBGrids, DBTables;

type
  TForm1 = class(TForm)
    procedure TaxAmountCalc(DataSet: TDataset);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    TaxAmount: TFloatField;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.TaxAmountCalc(DataSet: TDataset);
begin
Dataset['TaxAmount'] := Dataset['ItemsTotal'] * (Dataset['TaxRate'] / 100);
end;

procedure TForm1.FormCreate(Sender: TObject);
var
MyTable: TTable;
MyDataSource:
TDataSource;
MyGrid: TDBGrid;
begin
(*{ Create the TTable component -- the underlying database table is created later. }
MyTable := TTable.Create(Self);
with MyTable do
  begin
{ Specify an underlying database and table. Note: Test.DB doesn't exist yet. }
//DatabaseName := 'DBDemos.mdb';
TableName := 'Test.DB';
{ Assign TaxAmountCalc as the event handler to use when the OnCalcFields event fires for MyTable. }
OnCalcFields := TaxAmountCalc;
{ Create and add field definitions to the TTable's FieldDefs array, then create a TField using the field definition information. }

with FieldDefs do
  begin
  Add('ItemsTotal', ftCurrency, 0, false);
  FieldDefs[0].CreateField(MyTable);
  Add('TaxRate', ftFloat, 0, false);
  FieldDefs[1].CreateField(MyTable);
  TFloatField(Fields[1]).DisplayFormat := '##.0%';
  { Create a calculated TField, assign properties, and add to MyTable's field definitions array. }
  TaxAmount := TFloatField.Create(MyTable);

  with TaxAmount do
    begin
    FieldName := 'TaxAmount';
    Calculated := True;
    Currency := True;
    DataSet := MyTable;
    Name := MyTable.Name + FieldName;
    MyTable.FieldDefs.Add(Name, ftFloat, 0, false);
  end;
  end;
  { Create the new database table using MyTable as a basis. }
  MyTable.CreateTable;
  end;
  { Create a TDataSource component and assign to MyTable. }
  MyDataSource := TDataSource.Create(Self);
  MyDataSource.DataSet := MyTable;
  { Create a data aware grid, display on the form, and assign MyDataSource to access MyTable's data. }

  MyGrid := TDBGrid.Create(Self);

  with MyGrid do
  begin
  Parent := Self;
  Align := alClient;

  DataSource := MyDataSource;
  end;

  { Start your engines! }
  MyTable.Active := True;
  Caption := 'New table ' + MyTable.TableName;   }*)
end;

end.
