object frmLucroVenda: TfrmLucroVenda
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Lucro na venda'
  ClientHeight = 378
  ClientWidth = 569
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label4: TLabel
    Left = 8
    Top = 1
    Width = 176
    Height = 13
    Caption = 'Lista de itens lan'#231'ados na pr'#233'-venda'
  end
  object SgDados: TStringGrid
    Left = 8
    Top = 16
    Width = 553
    Height = 297
    Color = clInfoBk
    ColCount = 6
    FixedCols = 0
    RowCount = 2
    TabOrder = 0
    ColWidths = (
      56
      209
      71
      74
      49
      46)
  end
  object btnSair: TBitBtn
    Left = 469
    Top = 348
    Width = 96
    Height = 25
    Caption = 'Sair'
    TabOrder = 1
    OnClick = btnSairClick
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 316
    Width = 455
    Height = 59
    Caption = 'Totais'
    TabOrder = 2
    object Label1: TLabel
      Left = 16
      Top = 14
      Width = 24
      Height = 13
      Caption = 'Valor'
    end
    object Label2: TLabel
      Left = 169
      Top = 14
      Width = 28
      Height = 13
      Caption = 'Custo'
    end
    object Label3: TLabel
      Left = 321
      Top = 14
      Width = 42
      Height = 13
      Caption = 'Lucro R$'
    end
    object edtvlValor: TEdit
      Left = 16
      Top = 29
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 0
    end
    object edtvlCusto: TEdit
      Left = 168
      Top = 29
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 1
    end
    object edtvlLucro: TEdit
      Left = 320
      Top = 29
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 2
    end
  end
  object ADOQuery1: TADOQuery
    Connection = DModulo.Conexao
    Parameters = <>
    Left = 472
    Top = 256
  end
end
