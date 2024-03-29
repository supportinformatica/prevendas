object FrmListaPedidos: TFrmListaPedidos
  Left = 298
  Top = 219
  AutoSize = True
  BorderIcons = []
  Caption = 'Lista de pedidos dos vendedores externos a serem confirmados'
  ClientHeight = 448
  ClientWidth = 627
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 3
    Top = 4
    Width = 104
    Height = 13
    Caption = 'Emitidas entre -->'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 208
    Top = 3
    Width = 8
    Height = 16
    Caption = 'e'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblCliente: TLabel
    Left = 3
    Top = 39
    Width = 32
    Height = 13
    Caption = 'Cliente'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object LblListados: TLabel
    Left = 363
    Top = 5
    Width = 67
    Height = 13
    Caption = 'Listados--> '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblVendedor: TLabel
    Left = 3
    Top = 25
    Width = 46
    Height = 13
    Caption = 'Vendedor'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object DtInicial: TDateTimePicker
    Left = 110
    Top = 1
    Width = 89
    Height = 21
    Date = 36978.000000000000000000
    Time = 0.860729317100776800
    TabOrder = 0
    OnChange = DtInicialChange
  end
  object Dt_Final: TDateTimePicker
    Left = 225
    Top = 1
    Width = 89
    Height = 21
    Date = 36978.000000000000000000
    Time = 0.860729317100776800
    TabOrder = 1
    OnChange = Dt_FinalChange
  end
  object RadioGroup1: TRadioGroup
    Left = 501
    Top = 0
    Width = 113
    Height = 56
    Caption = 'Ordenar por'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ItemIndex = 0
    Items.Strings = (
      '&Lan'#231'amento'
      '&Data')
    ParentFont = False
    TabOrder = 2
    OnClick = RadioGroup1Click
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 54
    Width = 484
    Height = 172
    TabStop = False
    Color = clInfoBk
    DataSource = ADOdsConsulta
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 7
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
    OnDrawColumnCell = DBGrid1DrawColumnCell
    OnKeyDown = DBGrid1KeyDown
    OnKeyUp = DBGrid1KeyUp
  end
  object DBGrid2: TDBGrid
    Left = 0
    Top = 229
    Width = 627
    Height = 219
    TabStop = False
    Color = clInfoBk
    DataSource = DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 8
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'cdProduto'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dsReferencia'
        Title.Caption = 'Refer'#234'ncia'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nmProduto'
        Title.Caption = 'Descri'#231#227'o'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nrQtd'
        Title.Caption = 'Quantd'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'vlValor'
        Title.Caption = 'Valor'
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Total'
        Width = 68
        Visible = True
      end>
  end
  object BtnMdSair: TBitBtn
    Left = 503
    Top = 184
    Width = 113
    Height = 31
    Hint = 'Fecha este formul'#225'rio'
    Caption = '&Sair'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
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
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    OnClick = BtnMdSairClick
  end
  object BtnMdAnterior: TBitBtn
    Left = 503
    Top = 108
    Width = 113
    Height = 31
    Hint = 'Registro antrerior'
    Caption = 'An&terior'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Glyph.Data = {
      16020000424D160200000000000076000000280000001A0000001A0000000100
      040000000000A001000000000000000000001000000010000000000000000000
      BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
      7777777777777700000077777777777777777777777777000000777777777777
      7777777777777700000077777777777777777777777777000000777777777777
      7777777777777700000077777777777777777888877777000000777777777777
      7778888887777700000077777777777778888008877777000000777777777778
      8880000887777700000077777777788880000008877777000000777777778880
      0000000887777700000077777777800000000008877777000000777777700000
      0000000887777700000077777770000000000008877777000000777777777000
      0000000887777700000077777777777000000008877777000000777777777777
      7000000887777700000077777777777777700008877777000000777777777777
      7777700777777700000077777777777777777777777777000000777777777777
      7777777777777700000077777777777777777777777777000000777777777777
      7777777777777700000077777777777777777777777777000000777777777777
      7777777777777700000077777777777777777777777777000000}
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnClick = BtnMdAnteriorClick
  end
  object BtnMdProximo: TBitBtn
    Left = 503
    Top = 71
    Width = 113
    Height = 31
    Hint = 'Pr'#243'ximo registro'
    Caption = 'Pr'#243'&ximo'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Glyph.Data = {
      16020000424D160200000000000076000000280000001A0000001A0000000100
      040000000000A001000000000000000000001000000010000000000000000000
      BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
      7777777777777700000077777777777777777777777777000000777777777777
      7777777777777700000077777777777777777777777777000000777777777777
      7777777777777700000077777777877777777777777777000000777777778887
      7777777777777700000077777777088887777777777777000000777777770008
      8887777777777700000077777777000008888777777777000000777777770000
      0008887777777700000077777777000000000877777777000000777777770000
      0000000777777700000077777777000000000007777777000000777777770000
      0000077777777700000077777777000000077777777777000000777777770000
      0777777777777700000077777777000777777777777777000000777777770777
      7777777777777700000077777777777777777777777777000000777777777777
      7777777777777700000077777777777777777777777777000000777777777777
      7777777777777700000077777777777777777777777777000000777777777777
      7777777777777700000077777777777777777777777777000000}
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = BtnMdProximoClick
  end
  object BitBtn1: TBitBtn
    Left = 503
    Top = 146
    Width = 113
    Height = 31
    Hint = 'Seleciona o lan'#231'amento ao lado'
    Caption = 'Con&firmar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
      555555555555555555555555555555555555555555FF55555555555559055555
      55555555577FF5555555555599905555555555557777F5555555555599905555
      555555557777FF5555555559999905555555555777777F555555559999990555
      5555557777777FF5555557990599905555555777757777F55555790555599055
      55557775555777FF5555555555599905555555555557777F5555555555559905
      555555555555777FF5555555555559905555555555555777FF55555555555579
      05555555555555777FF5555555555557905555555555555777FF555555555555
      5990555555555555577755555555555555555555555555555555}
    NumGlyphs = 2
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    OnClick = BitBtn1Click
  end
  object ADOLancto: TADOQuery
    Connection = DModulo.Conexao
    CursorType = ctStatic
    CommandTimeout = 120
    Parameters = <>
    SQL.Strings = (
      
        'Select nrOrcamento as Lancto,dtEmissao as Emissao,dtRetorno     ' +
        '      '
      
        'as Retorno,vlValor as Valor,nrDesconto as Desconto,cdVendedor as' +
        ' Vendedor,'
      'cdPessoa as Cliente From OrcamentoR  ')
    Left = 168
    Top = 73
    object ADOLanctoLancto: TIntegerField
      FieldName = 'Lancto'
    end
    object ADOLanctoEmissao: TDateTimeField
      FieldName = 'Emissao'
    end
    object ADOLanctoRetorno: TDateTimeField
      FieldName = 'Retorno'
    end
    object ADOLanctoValor: TFloatField
      FieldName = 'Valor'
    end
    object ADOLanctoDesconto: TFloatField
      FieldName = 'Desconto'
    end
    object ADOLanctoVendedor: TIntegerField
      FieldName = 'Vendedor'
    end
    object ADOLanctoCliente: TIntegerField
      FieldName = 'Cliente'
    end
  end
  object ADOdsConsulta: TDataSource
    DataSet = ADOLancto
    Left = 197
    Top = 73
  end
  object DataSource1: TDataSource
    DataSet = ADOItens
    Left = 261
    Top = 109
  end
  object ADOItens: TADOQuery
    Connection = DModulo.Conexao
    CursorType = ctStatic
    CommandTimeout = 120
    Parameters = <>
    SQL.Strings = (
      
        'Select I.cdProduto,P.dsReferencia,P.nmProduto,I.nrQtd,I.vlValor,' +
        '(I.nrQtd * I.vlValor) as Total'
      'From iteOrcamentoR I INNER JOIN Produto P'
      'On I.cdProduto = P.cdProduto INNER JOIN OrcamentoR O'
      'ON O.nrOrcamento = I.nrOrcamento and O.cdPessoa = I.cdPessoa')
    Left = 232
    Top = 109
    object ADOItenscdProduto: TIntegerField
      FieldName = 'cdProduto'
    end
    object ADOItensdsReferencia: TStringField
      FieldName = 'dsReferencia'
      Size = 15
    end
    object ADOItensnmProduto: TStringField
      FieldName = 'nmProduto'
      Size = 40
    end
    object ADOItensnrQtd: TFloatField
      FieldName = 'nrQtd'
    end
    object ADOItensvlValor: TFloatField
      FieldName = 'vlValor'
    end
    object ADOItensTotal: TFloatField
      FieldName = 'Total'
      ReadOnly = True
    end
  end
end
