object FormCredito: TFormCredito
  Left = 180
  Top = 218
  AutoSize = True
  BorderIcons = []
  Caption = 'Cr'#233'dito dos vendedores'
  ClientHeight = 340
  ClientWidth = 475
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  PopupMenu = PopupMenu1
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 164
    Top = 3
    Width = 46
    Height = 13
    Caption = 'Per'#237'odo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 164
    Top = 36
    Width = 10
    Height = 16
    Caption = 'a'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label36: TLabel
    Left = 313
    Top = 13
    Width = 60
    Height = 15
    Caption = 'Cr'#233'dito R$'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object Label37: TLabel
    Left = 316
    Top = 13
    Width = 54
    Height = 15
    Caption = 'D'#233'bito R$'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object LblSaldo: TLabel
    Left = 309
    Top = 39
    Width = 49
    Height = 15
    Caption = 'Saldo R$'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 166
    Top = 81
    Width = 55
    Height = 13
    Caption = 'Vendedor'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    PopupMenu = FrmPrincipalPreVenda.PopupMenu1
  end
  object Label4: TLabel
    Left = 324
    Top = 327
    Width = 149
    Height = 13
    Caption = 'Pressione "ESC" para sair'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object RgTipo: TRadioGroup
    Left = 0
    Top = 0
    Width = 137
    Height = 97
    Caption = 'Listar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ItemIndex = 0
    Items.Strings = (
      '&Todos'
      '&Cr'#233'ditos'
      '&D'#233'bitos')
    ParentFont = False
    PopupMenu = PopupMenu1
    TabOrder = 0
    OnClick = RgTipoClick
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 99
    Width = 475
    Height = 222
    Color = clInfoBk
    DataSource = ADODsConsulta
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    PopupMenu = PopupMenu1
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnKeyPress = DBGrid1KeyPress
  end
  object dtInicial: TDateTimePicker
    Left = 164
    Top = 16
    Width = 97
    Height = 21
    Date = 38280.000000000000000000
    Time = 0.713727604168525400
    PopupMenu = PopupMenu1
    TabOrder = 1
    OnChange = dtInicialChange
    OnKeyPress = dtInicialKeyPress
  end
  object dtFinal: TDateTimePicker
    Left = 164
    Top = 53
    Width = 97
    Height = 21
    Date = 38280.000000000000000000
    Time = 0.713727604168525400
    PopupMenu = PopupMenu1
    TabOrder = 2
    OnChange = dtFinalChange
    OnKeyPress = dtFinalKeyPress
  end
  object edtCredito: TEdit
    Left = 297
    Top = 7
    Width = 92
    Height = 27
    Hint = 'Saldo anterior'
    AutoSize = False
    Color = clInfoBk
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'Times New Roman'
    Font.Style = []
    MaxLength = 35
    ParentFont = False
    ParentShowHint = False
    PopupMenu = PopupMenu1
    ReadOnly = True
    ShowHint = True
    TabOrder = 4
    Text = '0,00'
    Visible = False
    OnKeyPress = edtCreditoKeyPress
  end
  object edtDebito: TEdit
    Left = 297
    Top = 7
    Width = 92
    Height = 27
    Hint = 'Saldo anterior'
    AutoSize = False
    Color = clInfoBk
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -19
    Font.Name = 'Times New Roman'
    Font.Style = []
    MaxLength = 35
    ParentFont = False
    ParentShowHint = False
    PopupMenu = PopupMenu1
    ReadOnly = True
    ShowHint = True
    TabOrder = 5
    Text = '0,00'
    Visible = False
    OnKeyPress = edtDebitoKeyPress
  end
  object EdtSaldo: TEdit
    Left = 368
    Top = 31
    Width = 92
    Height = 27
    Hint = 'Saldo atual'
    AutoSize = False
    Color = clInfoBk
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    PopupMenu = PopupMenu1
    ReadOnly = True
    TabOrder = 6
    Text = '0,00'
    OnKeyPress = EdtSaldoKeyPress
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
    Left = 353
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
    Left = 411
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
    Left = 440
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
    Left = 421
    Top = 160
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
    Left = 517
    Top = 112
  end
  object ADOQryProcura: TADOQuery
    Connection = DModulo.Conexao
    Parameters = <>
    Left = 323
    Top = 120
  end
  object PopupMenu1: TPopupMenu
    Left = 293
    Top = 120
    object Fechajanela1: TMenuItem
      Caption = 'Fecha janela'
      ShortCut = 27
      OnClick = Fechajanela1Click
    end
    object Usarcrdito1: TMenuItem
      Caption = 'Resgatar cr'#233'dito...'
      ShortCut = 16451
      OnClick = Usarcrdito1Click
    end
  end
end
