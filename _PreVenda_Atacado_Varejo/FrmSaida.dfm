object FrmRelSaida: TFrmRelSaida
  Left = 402
  Top = 211
  BorderIcons = [biSystemMenu]
  Caption = 'Relat'#243'rio de Sa'#237'das Anal'#237'tico'
  ClientHeight = 454
  ClientWidth = 594
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label5: TLabel
    Left = 323
    Top = 73
    Width = 196
    Height = 13
    Caption = 'Localizar especifica'#231#227'o contendo:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    PopupMenu = PopupMenu1
    Visible = False
  end
  object LblMdConsulta: TLabel
    Left = 322
    Top = 74
    Width = 117
    Height = 13
    Caption = 'Texto para Pesquisa'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    PopupMenu = PopupMenu1
  end
  object LblListados: TLabel
    Left = 322
    Top = 134
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
  object Label1: TLabel
    Left = 25
    Top = 425
    Width = 51
    Height = 19
    Caption = 'Per'#237'odo'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 220
    Top = 425
    Width = 10
    Height = 19
    Caption = #224
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblEspecificacao: TLabel
    Left = 336
    Top = 38
    Width = 196
    Height = 13
    Caption = 'Localizar especifica'#231#227'o contendo:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    PopupMenu = PopupMenu1
    Visible = False
  end
  object Label4: TLabel
    Left = 460
    Top = 436
    Width = 123
    Height = 13
    Caption = 'Pressione "ESC" para sair'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label30: TLabel
    Left = 82
    Top = 377
    Width = 40
    Height = 13
    Caption = 'Cliente'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    PopupMenu = PopupMenu1
  end
  object Label8: TLabel
    Left = 25
    Top = 377
    Width = 40
    Height = 13
    Caption = 'C'#243'digo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    PopupMenu = PopupMenu1
  end
  object Label6: TLabel
    Left = 25
    Top = 336
    Width = 40
    Height = 13
    Caption = 'C'#243'digo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    PopupMenu = PopupMenu1
  end
  object Label9: TLabel
    Left = 82
    Top = 336
    Width = 55
    Height = 13
    Caption = 'Vendedor'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    PopupMenu = PopupMenu1
  end
  object Label3: TPanel
    Left = 0
    Top = 0
    Width = 594
    Height = 69
    BevelInner = bvRaised
    BevelWidth = 3
    Caption = 'Relat'#243'rio de Sa'#237'das Anal'#237'tico'
    Color = clNavy
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    object Shape2: TShape
      Left = 6
      Top = 6
      Width = 582
      Height = 57
      Align = alClient
      Brush.Color = clNavy
      ExplicitLeft = 12
      ExplicitTop = 12
    end
    object Label7: TLabel
      Left = 171
      Top = 22
      Width = 268
      Height = 24
      Caption = 'Relat'#243'rio de Sa'#237'das Anal'#237'tico'
    end
  end
  object RadioGroup1: TRadioGroup
    Left = 0
    Top = 69
    Width = 317
    Height = 78
    Caption = 'Pesquisar por'
    Columns = 2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ItemIndex = 0
    Items.Strings = (
      'Ctrl + F4 C'#243'digo'
      'F4 Descri'#231#227'o'
      'F5 Ref Interna'
      'F6 Ref F'#225'brica'
      'F7 Cod Adicional'
      'Descri'#231#227'o Contendo'
      'Todos Produtos')
    ParentFont = False
    PopupMenu = PopupMenu1
    TabOrder = 7
    OnClick = RadioGroup1Click
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 149
    Width = 594
    Height = 182
    Hint = 'Resultado da pesquisa'
    Color = clInfoBk
    DataSource = DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ParentShowHint = False
    PopupMenu = PopupMenu1
    ShowHint = True
    TabOrder = 8
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'C'#211'DIGO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        PickList.Strings = (
          '')
        Title.Caption = 'C'#243'digo'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 51
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UNIDADE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Title.Caption = 'Unidade'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 52
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REFER'#202'NCIA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Title.Caption = 'Ref Fabrica'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CDCODIGODIC'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Title.Caption = 'Ref Interna'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRI'#199#195'O'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Title.Caption = 'Descri'#231#227'o'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 229
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Title.Caption = 'Pre'#231'o'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 59
        Visible = True
      end>
  end
  object EdtConsulta: TEdit
    Left = 322
    Top = 89
    Width = 270
    Height = 21
    Hint = 
      'Digite aqui o texto para filtro ou tecle CTRL + E para consulta ' +
      'do produto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MaxLength = 35
    ParentFont = False
    ParentShowHint = False
    PopupMenu = PopupMenu1
    ShowHint = True
    TabOrder = 0
    OnChange = EdtConsultaChange
    OnKeyDown = EdtConsultaKeyDown
    OnKeyPress = EdtConsultaKeyPress
  end
  object CheckBox1: TCheckBox
    Left = 322
    Top = 115
    Width = 192
    Height = 17
    Caption = 'Listar so&mente produtos ativos'
    Checked = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    State = cbChecked
    TabOrder = 9
  end
  object DTinicial: TDateTimePicker
    Left = 82
    Top = 421
    Width = 132
    Height = 24
    Date = 36316.000000000000000000
    Time = 0.606682164354424500
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnKeyPress = DTinicialKeyPress
  end
  object DTfinal: TDateTimePicker
    Left = 235
    Top = 421
    Width = 132
    Height = 24
    Date = 36316.000000000000000000
    Time = 0.606682303237903400
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnKeyPress = DTinicialKeyPress
  end
  object BitBtn2: TBitBtn
    Left = 488
    Top = 396
    Width = 95
    Height = 38
    Caption = 'Sai&r'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      0400000000000001000000000000000000001000000010000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
      03333377777777777F333301111111110333337F333333337F33330111111111
      0333337F333333337F333301111111110333337F333333337F33330111111111
      0333337F333333337F333301111111110333337F333333337F33330111111111
      0333337F3333333F7F333301111111B10333337F333333737F33330111111111
      0333337F333333337F333301111111110333337F33FFFFF37F3333011EEEEE11
      0333337F377777F37F3333011EEEEE110333337F37FFF7F37F3333011EEEEE11
      0333337F377777337F333301111111110333337F333333337F33330111111111
      0333337FFFFFFFFF7F3333000000000003333377777777777333}
    NumGlyphs = 2
    ParentFont = False
    TabOrder = 10
    OnClick = BitBtn2Click
    OnKeyPress = DTinicialKeyPress
  end
  object BitBtn1: TBitBtn
    Left = 488
    Top = 344
    Width = 95
    Height = 38
    Caption = '&Imprimir'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000C40E0000C40E00000000000000000000FFFFFF5D534A
      44392E483D32483D32483D32483D32483D32483D32483D32483D32483D32483D
      3244392E5D534AFFFFFFFFFFFF6F665EE6DDD48F837893877C93877C93877C93
      877C93877C93877C93877C93877C8F8378E6DDD46F665EFFFFFF7D746A696058
      F8F2EB53483D594E43594E43594E43594E43594E43594E43594E43594E435348
      3DF8F2EB6960587D746A7D746AC8BCB1C0B5AAC5BDB4C9C3BACAC4BBCAC4BBCA
      C4BBCAC4BBCAC4BBCAC4BBC9C3BAC5BDB4C0B5AAC8BCB17D746A82776ED5CDC3
      F7F7F9E3AC75902300932800932800932800932800932800932800902300E3AC
      75F7F7F9D5CDC382776E867B71E3DEDCF5A12DDB7100DE7800DF7900DF7900DF
      7900DF7900DF7900DF7900DE7800DB7100F5A12DE3DEDC867B718B8175F0EFF0
      FF9400FF9700FF9700FF9700FF9700FF9700FF9700FF9700FF9700FF9700FF97
      00FF9400F0EFF08B817591857BF8F8FBFF9300FFEBA8FFE9A3FFE9A3FFE9A3FF
      E9A3FFE9A3FFE9A3FFE9A3FFE9A3FFEBA8FF9300F8F8FB91857B91857BF8F8FB
      FF9900555152382D25382D25382D25382D25382D25382D25382D25382D255551
      52FF9900F8F8FB91857BFFFFFFA39D9AFF9B007C7774FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF7C7774FF9B00A39D9AFFFFFFFFFFFFFFFFFF
      FFFFFF7F7975FFFFFFF8F5F1F9F5F2F9F5F2F9F5F2F9F6F2F9F6F3FFFFFF7E79
      75FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF887E73FFFFFFFAF8F6FAF8F6FA
      F8F6FAF9F7FEFDFCF2EEEAD5CFC99E9287FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFF8E8277FFFFFFFCFBFAFCFBFAFCFBFAFFFFFEBE9E9D625A51675E569488
      7DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF92877BFFFFFFFEFEFDFEFEFDFE
      FEFDFFFFFFC88F8FFFFFFFFFFFFFAB9F94FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFF988C80FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCB9192FFFFFFAB9F94FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA194889D90839C8F829C8F829C
      8F829C90839E9387AB9F94FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    ParentFont = False
    TabOrder = 5
    OnClick = BitBtn1Click
    OnKeyPress = DTinicialKeyPress
  end
  object CbxCliente: TComboBox
    Left = 82
    Top = 391
    Width = 285
    Height = 21
    Hint = 'Nome do cliente para esta pr'#233'-venda'
    AutoDropDown = True
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ImeMode = imOpen
    ParentFont = False
    ParentShowHint = False
    PopupMenu = PopupMenu1
    ShowHint = True
    TabOrder = 2
    OnChange = CbxClienteChange
  end
  object EdtCdCliente: TEdit
    Left = 25
    Top = 391
    Width = 53
    Height = 21
    PopupMenu = PopupMenu1
    TabOrder = 1
    OnExit = EdtCdClienteExit
    OnKeyPress = EdtCdClienteKeyPress
  end
  object edtcdVendedor: TEdit
    Left = 25
    Top = 350
    Width = 53
    Height = 21
    Enabled = False
    PopupMenu = PopupMenu1
    TabOrder = 11
    OnExit = EdtCdClienteExit
    OnKeyPress = EdtCdClienteKeyPress
  end
  object edtnmVendedor: TEdit
    Left = 82
    Top = 350
    Width = 285
    Height = 21
    Enabled = False
    PopupMenu = PopupMenu1
    TabOrder = 12
    OnExit = EdtCdClienteExit
    OnKeyPress = EdtCdClienteKeyPress
  end
  object PopupMenu1: TPopupMenu
    Left = 49
    Top = 254
    object Help1: TMenuItem
      Caption = 'Pr'#233'-Venda'
      ShortCut = 112
    end
    object Banese1: TMenuItem
      Caption = 'Alterar'
      ShortCut = 113
    end
    object HiperCard1: TMenuItem
      Caption = 'Or'#231'amento'
      ShortCut = 114
    end
    object Cdigo1: TMenuItem
      Caption = 'C'#243'digo'
      ShortCut = 16499
      OnClick = Cdigo1Click
    end
    object RedeCard1: TMenuItem
      Caption = 'Descri'#231#227'o'
      ShortCut = 115
      OnClick = RedeCard1Click
    end
    object VisaNet1: TMenuItem
      Caption = 'Ref Interna'
      ShortCut = 116
      OnClick = VisaNet1Click
    end
    object AmericanExpress1: TMenuItem
      Caption = 'Ref Interna'
      ShortCut = 117
      OnClick = AmericanExpress1Click
    end
    object DescrioContendo1: TMenuItem
      Caption = 'Cod Adicional'
      ShortCut = 118
      OnClick = DescrioContendo1Click
    end
    object Produtossimilares1: TMenuItem
      Caption = 'Produtos similares'
      ShortCut = 119
    end
    object ConsultaClientepeloCPFouCNPJ1: TMenuItem
      Caption = 'Confimar'
      ShortCut = 120
    end
    object Registraperdadevemdaporestoqueinsuficiente1: TMenuItem
      Caption = 'Registra perda de venda por estoque insuficiente'
      ShortCut = 121
    end
    object Desconto1: TMenuItem
      Caption = 'Desconto'
      ShortCut = 122
    end
    object ConsultaEspecificacao1: TMenuItem
      Caption = 'ConsultaEspecificacao'
      ShortCut = 123
    end
    object Excluiritens1: TMenuItem
      Caption = 'Excluir itens'
      ShortCut = 46
    end
    object Limpatextoparapesquisa1: TMenuItem
      Caption = 'Limpa texto para pesquisa'
      ShortCut = 32776
    end
    object ConsultaProduto1: TMenuItem
      Caption = 'ConsultaProduto'
      ShortCut = 16453
    end
    object Alterarpreodoproduto1: TMenuItem
      Caption = 'Alterar pre'#231'o do produto'
      ShortCut = 16497
    end
    object Cadastrodeclientes1: TMenuItem
      Caption = 'Cadastro de clientes'
      ShortCut = 16505
    end
    object Consultadecrditodocliente1: TMenuItem
      Caption = 'Consulta de cr'#233'dito do cliente'
      ShortCut = 16506
    end
    object Consultavendas1: TMenuItem
      Caption = 'Consulta vendas...'
      ShortCut = 16507
    end
  end
  object ADOSPConsulta: TADOStoredProc
    Connection = DModulo.Conexao
    CursorType = ctStatic
    CommandTimeout = 99
    ProcedureName = 'SP_CON_ESTOQUE_RILDON;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@DSATIVO'
        Attributes = [paNullable]
        DataType = ftString
        Size = 40
        Value = Null
      end
      item
        Name = '@ATACADOVAREJO'
        Attributes = [paNullable]
        DataType = ftString
        Size = 1
        Value = Null
      end
      item
        Name = '@OPCAO'
        Attributes = [paNullable]
        DataType = ftString
        Size = 40
        Value = Null
      end
      item
        Name = '@CDPRODUTO'
        Attributes = [paNullable]
        DataType = ftString
        Size = 40
        Value = Null
      end
      item
        Name = '@NMPRODUTO'
        Attributes = [paNullable]
        DataType = ftString
        Size = 40
        Value = Null
      end
      item
        Name = '@DSREFERENCIA'
        Attributes = [paNullable]
        DataType = ftString
        Size = 40
        Value = Null
      end
      item
        Name = '@NMGRUPO'
        Attributes = [paNullable]
        DataType = ftString
        Size = 40
        Value = Null
      end
      item
        Name = '@NMPRODUTO2'
        Attributes = [paNullable]
        DataType = ftString
        Size = 40
        Value = Null
      end
      item
        Name = '@C_BARRAS'
        Attributes = [paNullable]
        DataType = ftString
        Size = 40
        Value = Null
      end
      item
        Name = '@CDCODIGODIC'
        Attributes = [paNullable]
        DataType = ftString
        Size = 20
        Value = Null
      end>
    Left = 80
    Top = 254
    object ADOSPConsultaCDIGO: TIntegerField
      FieldName = 'C'#211'DIGO'
    end
    object ADOSPConsultaCDIGO_BARRAS: TStringField
      FieldName = 'C'#211'DIGO_BARRAS'
      Size = 15
    end
    object ADOSPConsultaREFERNCIA: TStringField
      FieldName = 'REFER'#202'NCIA'
      Size = 15
    end
    object ADOSPConsultaDESCRIO: TStringField
      FieldName = 'DESCRI'#199#195'O'
      Size = 40
    end
    object ADOSPConsultaFABRICANTE: TStringField
      FieldName = 'FABRICANTE'
      Size = 40
    end
    object ADOSPConsultaVALOR: TBCDField
      FieldName = 'VALOR'
      Precision = 19
    end
    object ADOSPConsultaCDCODIGODIC: TStringField
      FieldName = 'CDCODIGODIC'
    end
    object ADOSPConsultaPRATELEIRA: TStringField
      FieldName = 'PRATELEIRA'
      Size = 10
    end
    object ADOSPConsultaESTOQUE: TFloatField
      FieldName = 'ESTOQUE'
    end
    object ADOSPConsultaPEDIDO: TFloatField
      FieldName = 'PEDIDO'
    end
    object ADOSPConsultaUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 3
    end
    object ADOSPConsultaEMBALAGEM: TStringField
      FieldName = 'EMBALAGEM'
      Size = 15
    end
    object ADOSPConsultaPESO: TFloatField
      FieldName = 'PESO'
    end
    object ADOSPConsultaGRUPO: TStringField
      FieldName = 'GRUPO'
    end
    object ADOSPConsultaFORNECEDOR: TIntegerField
      FieldName = 'FORNECEDOR'
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOSPConsulta
    Left = 136
    Top = 208
  end
  object ADOQryCliente: TADOQuery
    Connection = DModulo.Conexao
    Parameters = <>
    Left = 536
    Top = 129
  end
end
