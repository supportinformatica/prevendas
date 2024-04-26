object Consulta_prevenca: TConsulta_prevenca
  Left = 265
  Top = 240
  BorderIcons = [biHelp]
  Caption = 'Consulta de pr'#233' vendas e or'#231'amentos'
  ClientHeight = 436
  ClientWidth = 710
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    710
    436)
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 582
    Top = 423
    Width = 123
    Height = 13
    Anchors = [akRight, akBottom]
    Caption = 'Pressione "ESC" para sair'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 4
    Top = 231
    Width = 29
    Height = 13
    Caption = 'Itens'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object GroupBox2: TGroupBox
    Left = 311
    Top = 0
    Width = 394
    Height = 95
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Filtrar por'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object LblMdConsulta: TLabel
      Left = 253
      Top = 98
      Width = 40
      Height = 13
      Caption = 'Cliente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object Label4: TLabel
      Left = 5
      Top = 76
      Width = 108
      Height = 13
      Caption = 'Itens da pr'#233'-venda'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 364
      Top = 50
      Width = 40
      Height = 13
      Caption = 'C'#243'digo'
      Visible = False
    end
    object EdtConsulta: TEdit
      Left = 5
      Top = 45
      Width = 354
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 35
      ParentFont = False
      TabOrder = 2
      Text = '%'
      OnChange = EdtConsultaChange
      OnKeyDown = EdtConsultaKeyDown
      OnKeyPress = EdtConsultaKeyPress
    end
    object rbCliente: TRadioButton
      Left = 5
      Top = 24
      Width = 68
      Height = 17
      Caption = 'Cliente'
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = rbClienteClick
      OnKeyDown = rbClienteKeyDown
    end
    object rbProduto: TRadioButton
      Left = 77
      Top = 24
      Width = 68
      Height = 17
      Caption = 'Produto'
      TabOrder = 1
      TabStop = True
      OnClick = rbProdutoClick
      OnKeyDown = rbProdutoKeyDown
    end
    object edtCodigo: TEdit
      Left = 289
      Top = 45
      Width = 70
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 35
      ParentFont = False
      TabOrder = 3
      Visible = False
      OnChange = edtCodigoChange
      OnKeyDown = edtCodigoKeyDown
      OnKeyPress = edtCodigoKeyPress
    end
    object rbVendedor: TRadioButton
      Left = 157
      Top = 24
      Width = 76
      Height = 17
      Caption = 'Vendedor'
      TabOrder = 4
      TabStop = True
      OnClick = rbVendedorClick
      OnKeyDown = rbVendedorKeyDown
    end
    object cbxVendedor: TComboBox
      Left = 5
      Top = 45
      Width = 354
      Height = 24
      Style = csDropDownList
      BiDiMode = bdLeftToRight
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 5
      Visible = False
      OnChange = cbxVendedorChange
      OnClick = cbxVendedorClick
      OnKeyDown = cbxVendedorKeyDown
      OnKeyPress = cbxVendedorKeyPress
    end
    object rbReferencia: TRadioButton
      Left = 253
      Top = 24
      Width = 84
      Height = 17
      Caption = 'Refer'#234'ncia'
      TabOrder = 6
      TabStop = True
      OnClick = rbReferenciaClick
      OnKeyDown = rbReferenciaKeyDown
    end
  end
  object GroupBox1: TGroupBox
    Left = 179
    Top = 0
    Width = 125
    Height = 95
    Caption = 'Per'#237'odo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object Label1: TLabel
      Left = -2
      Top = 102
      Width = 115
      Height = 13
      Caption = 'Filtrar Lancto do dia'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object LblEnvelope: TLabel
      Left = 94
      Top = 48
      Width = 71
      Height = 13
      Caption = 'LblEnvelope'
      Transparent = True
      Visible = False
    end
    object Label6: TLabel
      Left = 48
      Top = 43
      Width = 8
      Height = 13
      Caption = 'a'
    end
    object DtIni: TDateTimePicker
      Left = 4
      Top = 22
      Width = 114
      Height = 21
      Date = 38280.000000000000000000
      Time = 0.713727604168525400
      TabOrder = 0
      OnChange = DtIniChange
      OnKeyDown = DtIniKeyDown
    end
    object DtFim: TDateTimePicker
      Left = 4
      Top = 61
      Width = 114
      Height = 21
      Date = 38280.000000000000000000
      Time = 0.713727604168525400
      TabOrder = 1
      OnChange = DtIniChange
      OnKeyDown = DtFimKeyDown
    end
  end
  object RgTipo: TRadioGroup
    Left = 1
    Top = 0
    Width = 171
    Height = 95
    Caption = 'Listar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ItemIndex = 0
    Items.Strings = (
      'Pr'#233' &vendas n'#227'o lan'#231'adas'
      '&Pr'#233' vendas j'#225' lan'#231'adas'
      '&Or'#231'amentos'
      'Exibir to&dos')
    ParentFont = False
    TabOrder = 0
    OnClick = RgTipoClick
  end
  object DBGrid1: TDBGrid
    Left = 2
    Top = 99
    Width = 703
    Height = 128
    TabStop = False
    Anchors = [akLeft, akTop, akRight]
    Color = clInfoBk
    DataSource = ADODsConsulta
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
    OnDblClick = DBGrid1DblClick
    OnKeyDown = DBGrid1KeyDown
    OnKeyPress = DBGrid1KeyPress
    OnKeyUp = DBGrid1KeyUp
  end
  object SgDados: TStringGrid
    Left = 2
    Top = 246
    Width = 703
    Height = 176
    Hint = 'Itens da pr'#233' venda'
    TabStop = False
    Anchors = [akLeft, akTop, akRight, akBottom]
    Color = clInfoBk
    ColCount = 3
    DefaultRowHeight = 20
    FixedCols = 0
    RowCount = 1000
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [goFixedVertLine, goFixedHorzLine, goRangeSelect, goColSizing, goRowSelect]
    ParentFont = False
    TabOrder = 4
    OnKeyDown = SgDadosKeyDown
    ColWidths = (
      367
      103
      82)
    RowHeights = (
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20
      20)
  end
  object ADOQryConsulta: TADOQuery
    Connection = DModulo.Conexao
    CursorType = ctStatic
    Parameters = <>
    Left = 382
    Top = 120
  end
  object ADODsConsulta: TDataSource
    DataSet = ADOQryConsulta
    Left = 350
    Top = 120
  end
  object ADOQryCupon: TADOQuery
    Connection = DModulo.Conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'Select O.nrOrcamento as Lan'#231'amento,O.dtEmissao as Data,O.vlValor' +
        ' as Valor,'
      'P.nmPessoa as Cliente '
      'From Orcamento as O,Pessoa as P '
      'Where P.cdPessoa = O.cdCliente'
      '')
    Left = 414
    Top = 120
  end
  object ADOQrySalvar: TADOQuery
    Connection = DModulo.Conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'Select O.nrOrcamento as Lan'#231'amento,O.dtEmissao as Data,O.vlValor' +
        ' as Valor,'
      'P.nmPessoa as Cliente '
      'From Orcamento as O,Pessoa as P '
      'Where P.cdPessoa = O.cdCliente'
      '')
    Left = 456
    Top = 120
  end
  object AdoQryQtd: TADOQuery
    Connection = DModulo.Conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'Select O.nrOrcamento as Lan'#231'amento,O.dtEmissao as Data,O.vlValor' +
        ' as Valor,'
      'P.nmPessoa as Cliente '
      'From Orcamento as O,Pessoa as P '
      'Where P.cdPessoa = O.cdCliente'
      '')
    Left = 485
    Top = 120
  end
  object AdoQryGrupo: TADOQuery
    Connection = DModulo.Conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'Select O.nrOrcamento as Lan'#231'amento,O.dtEmissao as Data,O.vlValor' +
        ' as Valor,'
      'P.nmPessoa as Cliente '
      'From Orcamento as O,Pessoa as P '
      'Where P.cdPessoa = O.cdCliente'
      '')
    Left = 493
    Top = 80
  end
  object ADOQryProcura: TADOQuery
    Connection = DModulo.Conexao
    Parameters = <>
    Left = 412
    Top = 80
  end
end
