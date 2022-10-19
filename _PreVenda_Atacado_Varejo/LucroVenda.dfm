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
    Top = 343
    Width = 96
    Height = 25
    Caption = 'Sair'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      1800000000000003000000000000000000000000000000000000FFFFFF140EAE
      1711B8100BA1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF100B
      A11711B8140EAEFFFFFF1F1AB52522E92723F11F1BD1130EA6FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFF130EA61F1BD12723F12522E91F1AB53D3AC84648F6
      2425F12A2BF32121D4140FADFFFFFFFFFFFFFFFFFFFFFFFF140FAD2121D42A2B
      F32425F14648F63D3AC8221CB66262E1444BF3262DEF2C33F22326D71812B3FF
      FFFFFFFFFF1812B32326D72C33F2262DEF474DF46262E1221CB6FFFFFF241DBB
      6566E34853F32934EF2F3BF2262BD91A13BA1A13BA262BD92F3BF22834EF4752
      F35F61DF241DBAFFFFFFFFFFFFFFFFFF2621C2656AE54756F32C3DF03041F12B
      36E42B36E43041F12D3DF04A59F35D5FE02119BFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFF2721C66267E64356F23044F03448F23448F23044EF4255F26166E5221A
      C4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2C23CC4551E9354DF136
      4CEF364CEF354DF04251EA2B23CDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF1D14CE3240E63C54F23850F0384FF03B54F23445E91D15CEFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F17D4313EE43E58F13953F045
      5EF2455FF23A53F03E57F0303AE31F15D3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      2018D93542E7425FF33D59F1556EF3737FF2737EF2566EF33D59F1425EF3313A
      E41F16D9FFFFFFFFFFFFFFFFFF2018DE3744E94663F2405DF15C77F36E76EF30
      28DF2E25DF7078F05D77F4405DF14562F2333DE82117DDFFFFFF221BE23947EC
      4A69F34462F25F7AF3686EF0271FE2FFFFFFFFFFFF2C23E2717AF1607BF44362
      F24A69F33846EB2019E24144EC5372F44464F26481F46E76F2271EE6FFFFFFFF
      FFFFFFFFFFFFFFFF2D25E7747CF26480F44564F25270F33D41EB4441ED7B8FF5
      7A94F6737BF32D24EAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2D24EA737C
      F37A93F67A8FF64441EDFFFFFF4845F05A59F22D24EDFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF2D24ED5959F24844F0FFFFFF}
    ParentFont = False
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
