object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 449
  ClientWidth = 691
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 24
    Top = 144
    Width = 545
    Height = 233
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DataSource1: TDataSource
    DataSet = ADOTable1
    Left = 168
    Top = 40
  end
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Users\Nana\Docum' +
      'ents\School H.S.S\I.T\Nana Agyemang-Duah\Phase 3\Application\db.' +
      'mdb;Persist Security Info=False'
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 72
    Top = 16
  end
  object ADOTable1: TADOTable
    Connection = ADOConnection1
    Left = 112
    Top = 24
  end
end
