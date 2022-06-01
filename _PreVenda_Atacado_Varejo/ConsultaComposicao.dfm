object frmConsultaComposicao: TfrmConsultaComposicao
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Reserva de itens compostos'
  ClientHeight = 468
  ClientWidth = 481
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblNome: TLabel
    Left = 8
    Top = 8
    Width = 113
    Height = 16
    Caption = 'Produto: BICICLETA'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblCodigo: TLabel
    Left = 8
    Top = 27
    Width = 83
    Height = 16
    Caption = 'C'#243'digo: 14556'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 51
    Width = 98
    Height = 13
    Caption = 'Itens da composi'#231#227'o'
  end
  object Label4: TLabel
    Left = 8
    Top = 250
    Width = 55
    Height = 13
    Caption = 'Pr'#233'-Vendas'
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 70
    Width = 464
    Height = 177
    DataSource = dsConsulta
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
  end
  object DBGrid2: TDBGrid
    Left = 8
    Top = 269
    Width = 464
    Height = 164
    DataSource = dsPreVendas
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object btnFechar: TButton
    Left = 378
    Top = 439
    Width = 94
    Height = 25
    Cancel = True
    Caption = 'ESC - Sair'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = btnFecharClick
  end
  object adoConsulta: TADOQuery
    Connection = DModulo.Conexao
    Parameters = <>
    Left = 272
    Top = 24
  end
  object adoPreVendas: TADOQuery
    Connection = DModulo.Conexao
    Parameters = <>
    Left = 328
    Top = 24
  end
  object dsConsulta: TDataSource
    DataSet = adoConsulta
    Left = 216
    Top = 16
  end
  object dsPreVendas: TDataSource
    DataSet = adoPreVendas
    Left = 168
    Top = 16
  end
end
