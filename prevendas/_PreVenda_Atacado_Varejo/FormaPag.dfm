object FrmFormaPag: TFrmFormaPag
  Left = 453
  Top = 252
  BorderIcons = []
  Caption = 'Defini'#231#227'o da forma de pagamento'
  ClientHeight = 319
  ClientWidth = 661
  Color = clSkyBlue
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 1
    Top = 188
    Width = 89
    Height = 13
    Caption = 'Obs.: Max 3 linhas'
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 437
    Top = 48
    Width = 41
    Height = 13
    Caption = 'ESP'#201'CIE'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object Label3: TLabel
    Left = 461
    Top = 4
    Width = 77
    Height = 13
    Caption = 'Valor Pr'#233'-Venda'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 544
    Top = 4
    Width = 40
    Height = 13
    Caption = 'VOLUME'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object Label5: TLabel
    Left = 591
    Top = 4
    Width = 43
    Height = 13
    Caption = 'N'#218'MERO'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object Label6: TLabel
    Left = 386
    Top = 4
    Width = 40
    Height = 13
    Caption = 'Parcelas'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object BtnConfirmar: TBitBtn
    Left = 98
    Top = 281
    Width = 83
    Height = 38
    Hint = 'Confirmar forma de pagamento'
    Caption = 'F9 Confirmar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      0400000000000001000000000000000000001000000010000000000000000000
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
    Layout = blGlyphTop
    NumGlyphs = 2
    ParentFont = False
    ParentShowHint = False
    PopupMenu = PopupMenu1
    ShowHint = True
    Spacing = 1
    TabOrder = 10
    OnClick = BtnConfirmarClick
    OnKeyPress = BtnConfirmarKeyPress
  end
  object RadioGroup1: TRadioGroup
    Left = 2
    Top = 8
    Width = 356
    Height = 131
    Hint = 'Formas de pagamento'
    Caption = 'Forma de pagamento'
    Columns = 2
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemIndex = 0
    Items.Strings = (
      #192' Vista'
      'A Prazo'
      'Cart'#227'o a Vista'
      'Cart'#227'o Parcelado'
      'Cheque Pr'#233
      'Entrada + Prazo'
      'Entrada + Cartao'
      'Entrada + Cheque Pr'#233
      'Cheque a Vista'
      'Cart'#227'o D'#233'bito'
      'Dep'#243'sito / Transferencia / Pix'
      'Boleto Banc'#225'rio')
    ParentFont = False
    ParentShowHint = False
    PopupMenu = PopupMenu1
    ShowHint = True
    TabOrder = 0
    OnClick = RadioGroup1Click
  end
  object BtnCancelar: TBitBtn
    Left = 187
    Top = 281
    Width = 83
    Height = 38
    Hint = 'Retornar para a pr'#233'-venda'
    Caption = 'F10 &Cancelar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      0400000000000001000000000000000000001000000010000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
      3333333777333777FF3333993333339993333377FF3333377FF3399993333339
      993337777FF3333377F3393999333333993337F777FF333337FF993399933333
      399377F3777FF333377F993339993333399377F33777FF33377F993333999333
      399377F333777FF3377F993333399933399377F3333777FF377F993333339993
      399377FF3333777FF7733993333339993933373FF3333777F7F3399933333399
      99333773FF3333777733339993333339933333773FFFFFF77333333999999999
      3333333777333777333333333999993333333333377777333333}
    Layout = blGlyphTop
    NumGlyphs = 2
    ParentFont = False
    ParentShowHint = False
    PopupMenu = PopupMenu1
    ShowHint = True
    Spacing = 1
    TabOrder = 11
    OnClick = BtnCancelarClick
    OnKeyPress = BtnCancelarKeyPress
  end
  object Memo1: TMemo
    Left = 1
    Top = 202
    Width = 357
    Height = 77
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    PopupMenu = PopupMenu1
    TabOrder = 3
    OnEnter = Memo1Enter
    OnExit = Memo1Exit
    OnKeyPress = Memo1KeyPress
  end
  object CBXSelecionaProfissionais: TCheckBox
    Left = 0
    Top = 145
    Width = 153
    Height = 17
    Caption = 'Selecionar Profissional'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = CBXSelecionaProfissionaisClick
  end
  object CBXProfissional: TComboBox
    Left = 57
    Top = 161
    Width = 301
    Height = 21
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    Visible = False
    OnChange = CBXProfissionalChange
  end
  object EdtCdProfissional: TEdit
    Left = 1
    Top = 161
    Width = 51
    Height = 21
    Color = clInfoBk
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 12
    Visible = False
  end
  object edtEspecie: TEdit
    Left = 437
    Top = 63
    Width = 68
    Height = 21
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 15
    ParentFont = False
    TabOrder = 4
    Visible = False
  end
  object edtAcresCartao: TEdit
    Left = 461
    Top = 19
    Width = 68
    Height = 21
    TabStop = False
    Color = clInfoBk
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 15
    ParentFont = False
    ReadOnly = True
    TabOrder = 5
  end
  object edtVolume: TEdit
    Left = 544
    Top = 19
    Width = 68
    Height = 21
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    Visible = False
    OnKeyPress = edtVolumeKeyPress
  end
  object edtNumero: TEdit
    Left = 591
    Top = 19
    Width = 68
    Height = 21
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    Visible = False
    OnKeyPress = edtNumeroKeyPress
  end
  object edtParcelas: TEdit
    Left = 385
    Top = 19
    Width = 68
    Height = 21
    TabStop = False
    Color = clInfoBk
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 8
    Text = '1'
    OnExit = edtParcelasExit
    OnKeyPress = edtParcelasKeyPress
  end
  object gridParcelas: TStringGrid
    Left = 385
    Top = 45
    Width = 254
    Height = 270
    Hint = 
      'Dois cliques para selecionar a quantidade de parcelas para o car' +
      't'#227'o de cr'#233'dito.'
    Color = clInfoBk
    ColCount = 3
    DefaultRowHeight = 19
    FixedColor = clSilver
    FixedCols = 0
    RowCount = 13
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    GradientStartColor = clInfoBk
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 9
    OnDblClick = gridParcelasDblClick
    OnExit = gridParcelasExit
    OnKeyPress = gridParcelasKeyPress
    ColWidths = (
      64
      79
      82)
  end
  object chkbxEnviarCopiaEmail: TCheckBox
    Left = 183
    Top = 145
    Width = 153
    Height = 17
    Caption = 'Enviar c'#243'pia por email'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 13
    Visible = False
  end
  object pnlAguardaEnvioEmail: TPanel
    Left = 25
    Top = 6
    Width = 304
    Height = 141
    Caption = 'Enviando email. Por favor aguarde...'
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 14
    Visible = False
  end
  object ADOSPLiberacao1: TADOStoredProc
    Connection = DModulo.Conexao
    ProcedureName = 'SP_LIBERACAOVENDAS01;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@Codigo_Cliente'
        Attributes = [paNullable]
        DataType = ftString
        Size = 5
        Value = Null
      end>
    Left = 4
    Top = 240
  end
  object ADOSPLiberacao2: TADOStoredProc
    Connection = DModulo.Conexao
    ProcedureName = 'SP_LIBERACAOVENDAS02;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@DATA'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@CODIGO_CLIENTE'
        Attributes = [paNullable]
        DataType = ftString
        Size = 5
        Value = Null
      end>
    Left = 41
    Top = 240
  end
  object ADOSPLiberacao3: TADOStoredProc
    Connection = DModulo.Conexao
    ProcedureName = 'SP_LIBERACAOVENDAS03;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@CODIGO'
        Attributes = [paNullable]
        DataType = ftString
        Size = 5
        Value = Null
      end>
    Left = 76
    Top = 245
  end
  object ADOSPLiberacao4: TADOStoredProc
    Connection = DModulo.Conexao
    ProcedureName = 'SP_LIBERACAOVENDAS04;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@CODIGO'
        Attributes = [paNullable]
        DataType = ftString
        Size = 5
        Value = Null
      end>
    Left = 112
    Top = 245
  end
  object PopupMenu1: TPopupMenu
    Left = 209
    Top = 242
    object Consultadecrditodocliente1: TMenuItem
      Caption = 'Confimar venda'
      ShortCut = 120
      OnClick = Consultadecrditodocliente1Click
    end
    object Cancelar1: TMenuItem
      Caption = 'Cancelar'
      ShortCut = 121
      OnClick = Cancelar1Click
    end
  end
  object AdoQryProfissional: TADOQuery
    Connection = DModulo.Conexao
    Parameters = <>
    SQL.Strings = (
      
        'select P.nmPessoa,P.cdPessoa from pessoa P                      ' +
        '              '
      
        'inner join profissional PR on P.cdPessoa = PR.cdPessoa where P.d' +
        'sAtivo = '#39#39'S'#39#39' ')
    Left = 144
    Top = 240
  end
  object ADOQryProcura: TADOQuery
    Connection = DModulo.Conexao
    Parameters = <>
    Left = 176
    Top = 240
  end
end
