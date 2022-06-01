object FrmPrincipalPreVenda: TFrmPrincipalPreVenda
  Left = 100
  Top = 100
  Anchors = []
  Caption = 'Pr'#233' Venda 2.0    <<<  Support Inform'#225'tica  79  3302-5707  >>>'
  ClientHeight = 640
  ClientWidth = 827
  Color = clBtnFace
  Constraints.MinHeight = 600
  Constraints.MinWidth = 800
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIForm
  OldCreateOrder = False
  PopupMenu = PopupMenu1
  Position = poScreenCenter
  ShowHint = True
  Visible = True
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    827
    640)
  PixelsPerInch = 96
  TextHeight = 13
  object Shape1: TShape
    Left = 748
    Top = 289
    Width = 79
    Height = 40
    Anchors = [akTop, akRight]
    Brush.Color = 14540253
    Pen.Style = psClear
    ExplicitLeft = 713
  end
  object Shape6: TShape
    Left = 748
    Top = 217
    Width = 79
    Height = 18
    Anchors = [akTop, akRight]
    Brush.Color = 10066329
    Pen.Style = psClear
    Shape = stRoundRect
    ExplicitLeft = 728
  end
  object Shape5: TShape
    Left = 748
    Top = 233
    Width = 79
    Height = 24
    Anchors = [akTop, akRight]
    Brush.Color = 14540253
    Pen.Style = psClear
    ExplicitLeft = 728
  end
  object Shape4: TShape
    Left = 748
    Top = 263
    Width = 79
    Height = 28
    Anchors = [akTop, akRight]
    Brush.Color = 10066329
    Pen.Style = psClear
    Shape = stRoundRect
    ExplicitLeft = 713
  end
  object Shape2: TShape
    Left = 748
    Top = 169
    Width = 79
    Height = 18
    Anchors = [akTop, akRight]
    Brush.Color = 10066329
    Pen.Style = psClear
    Shape = stRoundRect
    ExplicitLeft = 728
  end
  object Label28: TLabel
    Left = 313
    Top = 1
    Width = 70
    Height = 13
    Caption = 'Lan'#231'amento'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    PopupMenu = PopupMenu1
  end
  object Label29: TLabel
    Left = 393
    Top = 1
    Width = 54
    Height = 13
    Caption = 'Vendedor'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    PopupMenu = PopupMenu1
  end
  object Label30: TLabel
    Left = 254
    Top = 37
    Width = 89
    Height = 13
    Caption = 'Cliente | c'#243'digo'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    PopupMenu = PopupMenu1
  end
  object Label32: TLabel
    Left = 170
    Top = 37
    Width = 27
    Height = 13
    Caption = 'Data'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    PopupMenu = PopupMenu1
  end
  object Label2: TLabel
    Left = 14
    Top = 596
    Width = 91
    Height = 18
    Anchors = [akLeft, akBottom]
    Caption = 'Desconto %'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ExplicitTop = 526
  end
  object Label3: TLabel
    Left = 155
    Top = 596
    Width = 38
    Height = 18
    Anchors = [akLeft, akBottom]
    Caption = 'Total'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ExplicitTop = 526
  end
  object Label4: TLabel
    Left = 588
    Top = 596
    Width = 63
    Height = 18
    Anchors = [akLeft, akBottom]
    Caption = 'Subtotal'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label9: TLabel
    Left = 602
    Top = 37
    Width = 52
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'Endere'#231'o'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    PopupMenu = PopupMenu1
    ExplicitLeft = 582
  end
  object Label10: TLabel
    Left = 599
    Top = 0
    Width = 67
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'Observa'#231#227'o'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    PopupMenu = PopupMenu1
    ExplicitLeft = 579
  end
  object SpeedButton1: TSpeedButton
    Left = 579
    Top = 50
    Width = 21
    Height = 22
    Hint = 'Localiza cliente por CNPJ ou CPF'
    Anchors = [akTop, akRight]
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      04000000000080000000CE0E0000C40E00001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
      7777777777777777777700000777770000070F000777770F00070F000777770F
      0007000000070000000700F000000F00000700F000700F00000700F000700F00
      00077000000000000077770F00070F0007777700000700000777777000777000
      77777770F07770F0777777700077700077777777777777777777}
    OnClick = SpeedButton1Click
    ExplicitLeft = 559
  end
  object Label12: TLabel
    Left = 748
    Top = 263
    Width = 79
    Height = 25
    Hint = 'Pedido de Compra'
    Alignment = taCenter
    Anchors = [akTop, akRight]
    AutoSize = False
    Caption = 'Pedido de Compra'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    Transparent = True
    WordWrap = True
    ExplicitLeft = 713
  end
  object Label16: TLabel
    Left = 748
    Top = 217
    Width = 79
    Height = 16
    Hint = 'Quantidade do item selecionado que est'#225' em outras pr'#233'-vendas'
    Alignment = taCenter
    Anchors = [akTop, akRight]
    AutoSize = False
    Caption = 'RESERVA'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    Transparent = True
    ExplicitLeft = 713
  end
  object Label7: TLabel
    Left = 560
    Top = 0
    Width = 38
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'C'#243'digo'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    PopupMenu = PopupMenu1
    ExplicitLeft = 540
  end
  object Label18: TLabel
    Left = 362
    Top = 37
    Width = 47
    Height = 13
    Caption = 'A Vista %:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object LblVista: TLabel
    Left = 422
    Top = 37
    Width = 21
    Height = 13
    Caption = '0,00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object Label19: TLabel
    Left = 447
    Top = 37
    Width = 51
    Height = 13
    Caption = 'A Prazo %:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object LblPrazo: TLabel
    Left = 510
    Top = 37
    Width = 21
    Height = 13
    Caption = '0,00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object Label20: TLabel
    Left = 429
    Top = 596
    Width = 113
    Height = 18
    Anchors = [akLeft, akBottom]
    Caption = 'Quant. de itens'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Shape3: TShape
    Left = 748
    Top = 185
    Width = 79
    Height = 24
    Anchors = [akTop, akRight]
    Brush.Color = 14540253
    Pen.Style = psClear
    ExplicitLeft = 728
  end
  object Label14: TLabel
    Left = 748
    Top = 169
    Width = 79
    Height = 16
    Alignment = taCenter
    Anchors = [akTop, akRight]
    AutoSize = False
    Caption = 'GARANTIA'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    Transparent = True
    ExplicitLeft = 713
  end
  object Label8: TLabel
    Left = 169
    Top = 1
    Width = 43
    Height = 13
    Caption = 'Usu'#225'rio'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    PopupMenu = PopupMenu1
  end
  object Shape7: TShape
    Left = 748
    Top = 353
    Width = 79
    Height = 24
    Anchors = [akTop, akRight]
    Brush.Color = 14540253
    Pen.Style = psClear
    Visible = False
    ExplicitLeft = 713
  end
  object Shape8: TShape
    Left = 748
    Top = 337
    Width = 79
    Height = 18
    Anchors = [akTop, akRight]
    Brush.Color = 10066329
    Pen.Style = psClear
    Shape = stRoundRect
    Visible = False
    ExplicitLeft = 713
  end
  object Label17: TLabel
    Left = 748
    Top = 337
    Width = 79
    Height = 16
    Hint = 'Quantidade do item selecionado que est'#225' em outras pr'#233'-vendas'
    Alignment = taCenter
    Anchors = [akTop, akRight]
    AutoSize = False
    Caption = 'DISPON'#205'VEL'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    Transparent = True
    Visible = False
    ExplicitLeft = 713
  end
  object BtnMdAnterior: TBitBtn
    Left = 707
    Top = 239
    Width = 2
    Height = 42
    Hint = 'Registro antrerior'
    Caption = 'An&terior'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -12
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
    PopupMenu = PopupMenu1
    ShowHint = True
    Spacing = 1
    TabOrder = 23
    OnClick = BtnMdAnteriorClick
  end
  object GroupBox1: TGroupBox
    Left = 170
    Top = 76
    Width = 652
    Height = 93
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 10
    DesignSize = (
      652
      93)
    object LblMdConsulta: TLabel
      Left = 6
      Top = 26
      Width = 115
      Height = 13
      Caption = 'Texto para pesquisa'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      PopupMenu = PopupMenu1
    end
    object LblListados: TLabel
      Left = 6
      Top = 68
      Width = 69
      Height = 13
      Caption = 'Listados--> '
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label1: TLabel
      Left = 428
      Top = 26
      Width = 65
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Quantidade'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      PopupMenu = PopupMenu1
      ExplicitLeft = 401
    end
    object Label5: TLabel
      Left = 571
      Top = 26
      Width = 32
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Pre'#231'o'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      PopupMenu = PopupMenu1
      ExplicitLeft = 544
    end
    object Label6: TLabel
      Left = 498
      Top = 26
      Width = 53
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Desc (%)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      PopupMenu = PopupMenu1
      ExplicitLeft = 471
    end
    object LblEspecificacao: TLabel
      Left = 457
      Top = 9
      Width = 188
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = 'Localizar especifica'#231#227'o contendo:'
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = 12032512
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      PopupMenu = PopupMenu1
      Visible = False
      ExplicitLeft = 422
    end
    object Label21: TLabel
      Left = 186
      Top = 26
      Width = 28
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'CFOP'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      PopupMenu = PopupMenu1
      ExplicitLeft = 159
    end
    object Label22: TLabel
      Left = 237
      Top = 26
      Width = 25
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Lote'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
      ExplicitLeft = 210
    end
    object Label23: TLabel
      Left = 314
      Top = 26
      Width = 110
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = 'Quant. dispon'#237'vel: 0'
      Font.Charset = ANSI_CHARSET
      Font.Color = 12032512
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
      ExplicitLeft = 287
    end
    object LblAmbiente: TLabel
      Left = 237
      Top = 27
      Width = 55
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Ambiente'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
      ExplicitLeft = 210
    end
    object EdtQtd: TEdit
      Left = 428
      Top = 41
      Width = 68
      Height = 21
      Hint = 'Quantidade de venda do produto'
      Anchors = [akTop, akRight]
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      ParentShowHint = False
      PopupMenu = PopupMenu1
      ShowHint = True
      TabOrder = 5
      Text = '0,00'
      OnExit = EdtQtdExit
      OnKeyPress = EdtQtdKeyPress
    end
    object EdtConsulta: TEdit
      Left = 6
      Top = 41
      Width = 178
      Height = 21
      Hint = 
        'Digite aqui o texto para filtro ou tecle CTRL + E para consulta ' +
        'do produto'
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 35
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnChange = EdtConsultaChange
      OnKeyDown = EdtConsultaKeyDown
      OnKeyPress = EdtConsultaKeyPress
    end
    object CheckBox1: TCheckBox
      Left = 6
      Top = 7
      Width = 168
      Height = 17
      TabStop = False
      Caption = 'So&mente produtos ativos'
      Checked = True
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = 12032512
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      State = cbChecked
      TabOrder = 0
      OnClick = CheckBox1Click
      OnEnter = CheckBox1Enter
    end
    object EdtPreco: TEdit
      Left = 571
      Top = 41
      Width = 76
      Height = 21
      Hint = 'Pre'#231'o do produto'
      Anchors = [akTop, akRight]
      Color = clInfoBk
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      ParentShowHint = False
      PopupMenu = PopupMenu1
      ShowHint = True
      TabOrder = 7
      Text = '0,000'
      OnEnter = EdtPrecoEnter
      OnExit = EdtPrecoExit
      OnKeyPress = EdtPrecoKeyPress
    end
    object CbPrevisao: TCheckBox
      Left = 428
      Top = 66
      Width = 126
      Height = 17
      Hint = 'Imprimir prazo de entrega?'
      Anchors = [akTop, akRight]
      Caption = 'Prazo de &entrega?'
      Checked = True
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = 12032512
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      State = cbChecked
      TabOrder = 8
    end
    object EdtDescUnit: TEdit
      Left = 498
      Top = 41
      Width = 71
      Height = 21
      Hint = 'Quantidade de venda do produto'
      Anchors = [akTop, akRight]
      Color = clInfoBk
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      ParentShowHint = False
      PopupMenu = PopupMenu1
      ShowHint = True
      TabOrder = 6
      Text = '0,00'
      OnExit = EdtDescUnitExit
      OnKeyPress = EdtDescUnitKeyPress
    end
    object EdtCFOP: TEdit
      Left = 186
      Top = 41
      Width = 50
      Height = 21
      Hint = 'Quantidade de venda do produto'
      Anchors = [akTop, akRight]
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 4
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnExit = EdtCFOPExit
      OnKeyPress = EdtCFOPKeyPress
    end
    object CbLote: TComboBox
      Left = 237
      Top = 41
      Width = 188
      Height = 21
      Hint = 'N'#186' lote - Validade - Qtd - Fabricante'
      Style = csDropDownList
      Anchors = [akTop, akRight]
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      Visible = False
      OnChange = CbLoteChange
    end
    object CbxAmbiente: TComboBox
      Left = 237
      Top = 49
      Width = 188
      Height = 21
      Hint = 'Descri'#231#227'o do produto'
      Style = csDropDownList
      Anchors = [akTop, akRight]
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      Visible = False
      OnChange = CbxAmbienteChange
    end
    object EdtCdAmbiente: TEdit
      Left = 288
      Top = 45
      Width = 40
      Height = 21
      TabOrder = 9
      Visible = False
    end
    object chkOcultarProdutosSemEstoque: TCheckBox
      Left = 182
      Top = 7
      Width = 190
      Height = 17
      TabStop = False
      Caption = 'Ocultar produtos sem estoque'
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = 12032512
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 10
      OnClick = chkOcultarProdutosSemEstoqueClick
    end
  end
  object EdtLancto: TEdit
    Left = 313
    Top = 15
    Width = 78
    Height = 21
    Hint = 'N'#250'mero do or'#231'amento'
    Color = clInfoBk
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ImeMode = imOpen
    MaxLength = 10
    ParentFont = False
    ParentShowHint = False
    PopupMenu = PopupMenu1
    ShowHint = True
    TabOrder = 1
    OnEnter = EdtLanctoEnter
    OnExit = EdtLanctoExit
    OnKeyPress = EdtLanctoKeyPress
  end
  object EdtCdCliente: TEdit
    Left = 538
    Top = 51
    Width = 39
    Height = 21
    Anchors = [akTop, akRight]
    Color = clInfoBk
    Enabled = False
    PopupMenu = PopupMenu1
    TabOrder = 8
    Visible = False
  end
  object DtLancto: TDateTimePicker
    Left = 170
    Top = 51
    Width = 83
    Height = 21
    Hint = 'Previsao de entrega dos produtos deste or'#231'amento'
    Date = 36227.365221493100000000
    Time = 36227.365221493100000000
    Color = clInfoBk
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    PopupMenu = PopupMenu1
    ShowHint = True
    TabOrder = 9
  end
  object BtnAprazo: TBitBtn
    Left = 748
    Top = 465
    Width = 77
    Height = 43
    Hint = 'Desconto'
    Anchors = [akRight, akBottom]
    Caption = 'F11 &Desconto'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -9
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFF0A0A0AFFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0F0F0F0A0B0BFF
      FFFFFFFFFF000000000000FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFF101010FFFFFFFFFFFF030303000000FFFFFFFFFF
      FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF16161611
      1111FFFFFF080808040404FFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF171717FFFFFFFFFFFF080809040505FFFF
      FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF373636303030FFFFFFFFFFFF1D
      1D1D181717FFFFFFFFFFFF090909060606FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      4646463F3F3FFFFFFF313131FFFFFFFFFFFF1F1E1FFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F4E4F474747FFFFFFFFFFFF323232FF
      FFFF2625251F1F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      5857574F4F4FFFFFFFFFFFFF3B3A3AFFFFFFFFFFFF262727FFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF595958505151FFFFFF424343FF
      FFFFFFFFFF2E2E2E272728FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF5A5A5A525252FFFFFFFFFFFFFFFFFFFFFFFF2F2F2FFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    Layout = blGlyphTop
    ParentFont = False
    ParentShowHint = False
    PopupMenu = PopupMenu1
    ShowHint = True
    Spacing = 1
    TabOrder = 17
    OnClick = BtnAprazoClick
    OnKeyPress = BtnAprazoKeyPress
  end
  object BtnConfirmar: TBitBtn
    Left = 748
    Top = 509
    Width = 77
    Height = 43
    Hint = 'Confirmar Pr'#233'-Venda'
    Anchors = [akRight, akBottom]
    Caption = 'Confirmar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -9
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
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
    TabOrder = 16
    OnClick = BtnConfirmarClick
    OnKeyPress = BtnConfirmarKeyPress
  end
  object BtnCancelar: TBitBtn
    Left = 748
    Top = 553
    Width = 77
    Height = 43
    Hint = 'Cancelamento da Pr'#233'-venda'
    Anchors = [akRight, akBottom]
    Caption = 'ESC Cancelar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -9
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
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
    TabOrder = 18
    OnClick = BtnCancelarClick
    OnKeyPress = BtnCancelarKeyPress
  end
  object BtnSair: TBitBtn
    Left = 748
    Top = 597
    Width = 77
    Height = 43
    Hint = 'Saida'
    Anchors = [akRight, akBottom]
    BiDiMode = bdLeftToRight
    Caption = 'Sai&r'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -9
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Glyph.Data = {
      A2070000424DA207000000000000360000002800000019000000190000000100
      1800000000006C070000CE0E0000C40E00000000000000000000FFFFFFFFFFFF
      FFFFFFE0FFE0E0FFE0E0FFE0E0FFE0FFFFFFE0FFE0E0FFE0FFFFFF000000FFFF
      80FFFF80000000FFFFFFFFFFFFFFFFFFE0FFE0E0FFE0FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFF00FFFFFFFFFFFFFFFFFFE0FFE0FFFFFFE0FFE0E0FFE0E0FFE0E0FF
      E0FFFFFFE0FFE0000000FFFF80FFFF80808000000000E0FFE0FFFFFFFFFFFFFF
      FFFFE0FFE0E0FFE0FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFE0FFE0E0FFE0E0FF
      E0E0FFE0000000E0FFE0E0FFE0E0FFE0000000000000FFFF80FFFF8080800080
      8000000000E0FFE0E0FFE0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
      FFFFFFFFFFFFFFFFFFFFE0FFE0E0FFE0E0FFE0E0FFE0FFFF80E0FFE0E0FFE000
      0000FFFF80FFFF80808000808000808000000000808000E0FFE0E0FFE0FFFFFF
      FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFE0FFE0E0FFE0E0FFE0000000E0FFE0E0
      FFE0E0FFE0E0FFE0808000000000FFFF80FFFF80808000808000808000808000
      000000808000000000E0FFE0FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF00000000
      0000000000E0FFE0E0FFE0E0FFE0E0FFE0E0FFE0808000000000FFFF80FFFF80
      808000808000808000808000808000000000000000000000FFFFFFFFFFFFFFFF
      FF00FFFFFFFFFFFFFFFFFF000000000000E0FFE0E0FFE0000000FFFF80808000
      E0FFE0000000FFFF80FFFF80808000808000808000808000808000000000A0C0
      A0E0FFE0FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFF000000000000000000
      FFFFFFE0FFE0E0FFE0808000808000000000FFFF80FFFF808080008080008080
      00808000808000000000A0C0A0E0FFE0FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
      FFFFFF000000000000808080808080808080808080808080808080000000FFFF
      80FFFF80808000000000000000808000808000000000A0C0A0E0FFE0FFFFFFFF
      FFFFFFFFFF00FFFFFFFFFFFFFFFFFF000000000000D0FFFFD0FFFFD0FFFFD0FF
      FFD0FFFFD0FFFF000000FFFF80FFFF80000000A0C0A000000080800080800000
      0000A0C0A0E0FFE0FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFF0000000000
      00D0FFFFD0FFFFD0FFFFD0FFFFD0FFFFD0FFFF000000FFFF80FFFF8000000080
      8000000000808000808000000000A0C0A0E0FFE0FFFFFFFFFFFFFFFFFF00FFFF
      FFFFFFFFFFFFFF000000000000D0FFFFD0FFFFD0FFFFD0FFFFD0FFFFD0FFFF00
      0000FFFF80FFFF80808000000000000000808000808000000000A0C0A0E0FFE0
      FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFF000000000000D0FFFFD0FFFFD0
      FFFFD0FFFFD0FFFFD0FFFF000000FFFF80FFFF80808000808000808000808000
      808000000000A0C0A0E0FFE0FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFF00
      0000000000D0FFFFD0FFFFD0FFFFD0FFFFD0FFFFD0FFFF000000FFFF80FFFF80
      808000808000808000808000808000000000A0C0A0E0FFE0FFFFFFFFFFFFFFFF
      FF00FFFFFFFFFFFFFFFFFF000000000000D0FFFFD0FFFFD0FFFFD0FFFFD0FFFF
      D0FFFF000000FFFF80FFFF80808000808000808000808000808000000000A0C0
      A0E0FFE0FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFF000000000000D0FFFF
      D0FFFFD0FFFFD0FFFFD0FFFFD0FFFF000000FFFF80FFFF808080008080008080
      00808000808000000000A0C0A0E0FFE0FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
      FFFFFF000000000000D0FFFFD0FFFFD0FFFFD0FFFFD0FFFFD0FFFF000000FFFF
      80FFFF80808000808000808000808000808000000000A0C0A0E0FFE0FFFFFFFF
      FFFFFFFFFF00FFFFFFFFFFFFFFFFFF000000000000D0FFFFD0FFFFD0FFFFD0FF
      FFD0FFFFD0FFFFD0FFFF000000FFFF80FFFF8080800080800080800080800000
      0000A0C0A0E0FFE0FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFF0000000000
      00D0FFFFD0FFFFD0FFFFD0FFFFD0FFFFD0FFFFD0FFFFD0FFFF000000FFFF80FF
      FF80808000808000808000000000A0C0A0E0FFE0FFFFFFFFFFFFFFFFFF00FFFF
      FFFFFFFFFFFFFF000000000000D0FFFFD0FFFFD0FFFFD0FFFFD0FFFFD0FFFFD0
      FFFFD0FFFFD0FFFF000000FFFF80FFFF80808000808000000000A0C0A0E0FFE0
      FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFF000000000000D0FFFFD0FFFFD0
      FFFFD0FFFFD0FFFFD0FFFFD0FFFFD0FFFFD0FFFFD0FFFF000000FFFF80FFFF80
      808000000000A0C0A0E0FFE0FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFF00
      0000000000D0FFFFD0FFFFD0FFFFD0FFFFD0FFFFD0FFFFD0FFFFD0FFFFD0FFFF
      D0FFFFD0FFFF000000FFFF80FFFF80000000A0C0A0FFFFFFFFFFFFFFFFFFFFFF
      FF00FFFFFFFFFFFFFFFFFF000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A0C0
      A0FFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFF000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000A0C0A0FFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFF00}
    Layout = blGlyphTop
    ModalResult = 4
    ParentBiDiMode = False
    ParentFont = False
    ParentShowHint = False
    PopupMenu = PopupMenu1
    ShowHint = True
    Spacing = 1
    TabOrder = 19
    OnClick = BtnSairClick
    OnKeyPress = BtnSairKeyPress
  end
  object EdtTotal: TEdit
    Left = 588
    Top = 614
    Width = 154
    Height = 26
    Hint = 'Valor Total dos Produtos'
    Anchors = [akLeft, akBottom]
    Color = clInfoBk
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 15
    Text = '0,00'
  end
  object EdtDesconto: TEdit
    Left = 14
    Top = 614
    Width = 96
    Height = 26
    Hint = 'Entre aqui com a porcentagem de desconto deste or'#231'amento'
    Anchors = [akLeft, akBottom]
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 9
    ParentFont = False
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 13
    Text = '0,00000'
    OnExit = EdtDescontoExit
    OnKeyPress = EdtDescontoKeyPress
  end
  object EdtSubTotal: TEdit
    Left = 155
    Top = 614
    Width = 149
    Height = 26
    Hint = 'Valor a Faturar'
    Anchors = [akLeft, akBottom]
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 14
    Text = '0,00'
    OnExit = EdtSubTotalExit
    OnKeyPress = EdtSubTotalKeyPress
  end
  object EdtOperador: TEdit
    Left = 577
    Top = 200
    Width = 54
    Height = 21
    Enabled = False
    PopupMenu = PopupMenu1
    ReadOnly = True
    TabOrder = 20
    Visible = False
  end
  object EdtCdNome: TEdit
    Left = 560
    Top = 15
    Width = 38
    Height = 21
    Anchors = [akTop, akRight]
    Color = clInfoBk
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 5
    ParentFont = False
    PopupMenu = PopupMenu1
    TabOrder = 5
    OnChange = EdtCdNomeChange
    OnExit = EdtCdNomeExit
  end
  object RadioGroup1: TRadioGroup
    Left = 3
    Top = 56
    Width = 164
    Height = 112
    Caption = 'Pesquisar por'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemIndex = 1
    Items.Strings = (
      'C'#243'digo - Ctrl + F4'
      'Descri'#231#227'o - F4'
      'Ref F'#225'brica - F5'
      'Ref Interna - F6'
      'C'#243'digo de Barras  - F7'
      'Especific/Aplica'#231' - Crtl + F1'
      'C'#243'digo Adicional - Crtl + G')
    ParentFont = False
    PopupMenu = PopupMenu1
    TabOrder = 11
    OnClick = RadioGroup1Click
  end
  object CmbConsulta: TComboBox
    Left = 613
    Top = 24
    Width = 42
    Height = 19
    Hint = 'Gostaria de filtrar por'
    Style = csOwnerDrawFixed
    Anchors = [akTop, akRight]
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemHeight = 13
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 21
    Visible = False
  end
  object DBGrid1: TDBGrid
    Left = 1
    Top = 166
    Width = 741
    Height = 223
    Hint = 'Resultado da pesquisa'
    Anchors = [akLeft, akTop, akRight, akBottom]
    Color = clInfoBk
    DataSource = DsConsulta
    FixedColor = 14540253
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ParentShowHint = False
    PopupMenu = PopupMenu1
    ShowHint = True
    TabOrder = 12
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWhite
    TitleFont.Height = -13
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
    OnColumnMoved = DBGrid1ColumnMoved
    OnDrawColumnCell = DBGrid1DrawColumnCell
    OnDblClick = DBGrid1DblClick
    OnKeyPress = DBGrid1KeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'C'#211'DIGO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        PickList.Strings = (
          '')
        Title.Caption = 'C'#243'digo'
        Title.Color = clBtnFace
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 49
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'C'#211'DIGO_BARRAS'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Caption = 'C'#243'd. Barras'
        Title.Color = clBtnFace
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 97
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UNIDADE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Caption = 'Und'
        Title.Color = clBtnFace
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 28
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REFER'#202'NCIA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Caption = 'Refer'#234'ncia'
        Title.Color = clBtnFace
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRI'#199#195'O'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Caption = 'Descri'#231#227'o'
        Title.Color = clBtnFace
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 245
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRECO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Caption = 'Pre'#231'o'
        Title.Color = clBtnFace
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Caption = 'Promo'#231#227'o'
        Title.Color = clBtnFace
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESTOQUE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = 'Estoque'
        Title.Color = clBtnFace
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FABRICANTE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Caption = 'Fabricante'
        Title.Color = clBtnFace
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 182
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRATELEIRA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Caption = 'Prateleira'
        Title.Color = clBtnFace
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CDCODIGODIC'
        Title.Caption = 'Ref. Interna'
        Title.Color = clBtnFace
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 102
        Visible = True
      end>
  end
  object BtnMdPrimeiro: TBitBtn
    Left = 712
    Top = 155
    Width = 0
    Height = 42
    Hint = 'Primeiro registro'
    Caption = '&Primeiro'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Glyph.Data = {
      16020000424D160200000000000076000000280000001A0000001A0000000100
      040000000000A001000000000000000000001000000010000000000000000000
      BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
      7777777777777700000077777777777777777777777777000000777777777777
      7777777777777700000077777777777777777777777777000000777777777777
      7777777777777700000077777777777777777778888777000000777777778877
      7777788888877700000077777770087777788880088777000000777777700877
      7888800008877700000077777770087888800000088777000000777777700888
      8000000008877700000077777770088000000000088777000000777777700000
      0000000008877700000077777770000000000000088777000000777777700870
      0000000008877700000077777770087770000000088777000000777777700877
      7770000008877700000077777770087777777000088777000000777777700777
      7777777007777700000077777777777777777777777777000000777777777777
      7777777777777700000077777777777777777777777777000000777777777777
      7777777777777700000077777777777777777777777777000000777777777777
      7777777777777700000077777777777777777777777777000000}
    ParentFont = False
    ParentShowHint = False
    PopupMenu = PopupMenu1
    ShowHint = True
    Spacing = 1
    TabOrder = 22
    OnClick = BtnMdPrimeiroClick
  end
  object BtnMdProximo: TBitBtn
    Left = 712
    Top = 197
    Width = 0
    Height = 42
    Hint = 'Pr'#243'ximo registro'
    Caption = 'Pr'#243'&ximo'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -12
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
    PopupMenu = PopupMenu1
    ShowHint = True
    Spacing = 1
    TabOrder = 24
    OnClick = BtnMdProximoClick
  end
  object BtnMdUltimo: TBitBtn
    Left = 712
    Top = 281
    Width = 0
    Height = 42
    Hint = #218'ltimo registro'
    Caption = #218'ti&mo'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Glyph.Data = {
      16020000424D160200000000000076000000280000001A0000001A0000000100
      040000000000A001000000000000000000001000000010000000000000000000
      BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
      7777777777777700000077777777777777777777777777000000777777777777
      7777777777777700000077777777777777777777777777000000777777777777
      7777777777777700000077777877777777777777777777000000777778887777
      7777788777777700000077777088887777770087777777000000777770008888
      7777008777777700000077777000008888770087777777000000777770000000
      8887008777777700000077777000000000870087777777000000777770000000
      0000008777777700000077777000000000000087777777000000777770000000
      0077008777777700000077777000000077770087777777000000777770000077
      7777008777777700000077777000777777770087777777000000777770777777
      7777007777777700000077777777777777777777777777000000777777777777
      7777777777777700000077777777777777777777777777000000777777777777
      7777777777777700000077777777777777777777777777000000777777777777
      7777777777777700000077777777777777777777777777000000}
    ParentFont = False
    ParentShowHint = False
    PopupMenu = PopupMenu1
    ShowHint = True
    Spacing = 1
    TabOrder = 25
    OnClick = BtnMdUltimoClick
  end
  object RgOpcoes: TRadioGroup
    Left = 0
    Top = 1
    Width = 164
    Height = 58
    Hint = 'O que deseja fazer?'
    Caption = 'Op'#231#245'es'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemIndex = 0
    Items.Strings = (
      'Pr'#233' Venda - F1'
      'Alterar - F2'
      'Or'#231'amento - F3')
    ParentFont = False
    TabOrder = 0
    OnClick = RgOpcoesClick
  end
  object EdtEndereco: TEdit
    Left = 602
    Top = 51
    Width = 221
    Height = 21
    Hint = 'Endere'#231'o do clietne'
    Anchors = [akTop, akRight]
    Color = clInfoBk
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 26
  end
  object EdtApelido: TEdit
    Left = 598
    Top = 15
    Width = 225
    Height = 21
    Hint = 'Endere'#231'o do clietne'
    Anchors = [akTop, akRight]
    Color = clInfoBk
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
  end
  object SgDados: TStringGrid
    Left = 4
    Top = 417
    Width = 741
    Height = 175
    Hint = 'Itens da pr'#233' venda'
    Anchors = [akLeft, akRight, akBottom]
    Color = clInfoBk
    ColCount = 18
    DefaultRowHeight = 20
    FixedCols = 0
    RowCount = 2
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [goFixedVertLine, goFixedHorzLine, goRangeSelect, goEditing]
    ParentFont = False
    PopupMenu = PopupMenu1
    TabOrder = 27
    OnClick = SgDadosClick
    OnDblClick = SgDadosDblClick
    OnDrawCell = SgDadosDrawCell
    OnExit = SgDadosExit
    OnGetEditText = SgDadosGetEditText
    OnKeyPress = SgDadosKeyPress
    OnKeyUp = SgDadosKeyUp
    OnSelectCell = SgDadosSelectCell
    OnSetEditText = SgDadosSetEditText
    ColWidths = (
      66
      303
      91
      93
      79
      100
      91
      91
      79
      64
      64
      64
      64
      64
      64
      64
      64
      64)
    RowHeights = (
      20
      20)
  end
  object Editor: TRichEdit
    Left = 197
    Top = 199
    Width = 183
    Height = 72
    Hint = 'Visualiza'#231#227'o dos items selecionados'
    BorderStyle = bsNone
    Color = clInfoBk
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    PlainText = True
    PopupMenu = PopupMenu1
    ScrollBars = ssBoth
    ShowHint = True
    TabOrder = 28
    Visible = False
    Zoom = 100
  end
  object ListBox1: TListBox
    Left = 372
    Top = 384
    Width = 296
    Height = 85
    Hint = 
      'N'#186' dos cupons para impress'#227'o da nota fiscal (selecione no m'#225'ximo' +
      ' 10 cupons)'
    BevelKind = bkTile
    BorderStyle = bsNone
    Color = clInfoBk
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -5
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemHeight = 13
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 29
    Visible = False
  end
  object edtQtdItens: TEdit
    Left = 429
    Top = 614
    Width = 113
    Height = 26
    Hint = 'Valor Total dos Produtos'
    Anchors = [akLeft, akBottom]
    Color = clInfoBk
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 30
    Text = '0'
  end
  object btnMensagem: TBitBtn
    Left = 5
    Top = 432
    Width = 23
    Height = 22
    Anchors = [akLeft, akBottom]
    Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      200000000000000400000000000000000000000000000000000000000000543C
      4190593035E055383ED855383ED555393ED5513E45D54E4048D554393FD55538
      3ED555383ED554383ED5514049D65F2E30E1731209C00000000000BDEBCD00BF
      EEFF00C4F7FF00C6F8FF00C6F9FF00D1FFFF00D7FFFF00CCFEFF00D3FFFF00C7
      FCFF00C6F8FF00C5F8FF00CEFFFF00D5FFFF613031FF7118122000BEE8E100CB
      F7FF01DFFFFF00D9FFFF00E0FFFF00E9FFFF111920FFAB2F3FFF35D0EEFF00E8
      FFFF00D9FFFF00E4FFFF03E7FFFF00E7FFFF5B3639EF0000000000CBF25F02C6
      ECFF0CE5FFFF00D7FFFF00DEFFFF00E8FFFF070000FF3D0000FF1CAAC2FF00F0
      FFFF00F8FFFF02F9FFFF05FDFFFF12AECEFF78020061FFFFFF000000000000C3
      E8FF0EDFFCFF07E4FFFF00D9FFFF00ECFFFF00D3E7FF00B7C4FF00EDFFFF00F5
      FFFF00F9FFFF12FEFFFF00F9FFFF50484EF500000000FFFFFF000000000000D3
      F36103CEECFF0EEDFFFF00DFFFFF00EAFFFF06D6F3FF1B92ADFF00FAFFFF00F4
      FFFF0DF4FFFF06FFFFFF10B7D3FF7D00005EFFFFFF00FFFFFF00FFFFFF000000
      000000CBE8FA0AE3F8FF05EBFFFF00FCFFFF19A0A9FF3D3B49FF13B7BEFF02F2
      FAFF10FEFFFF00FCFFFF50474BF600000000FFFFFF00FFFFFF00FFFFFF000000
      000000D6EF6602D2EAFF0AF4FFFF00FFFFFF247782FF721422FF3F6670FF06FB
      FFFF05FFFFFF0EBDD5FF80000066FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000D2E9FF0CF6FFFF00FFFFFF1F3D45FF6A000FFF445363FF12FF
      FFFF00FFFFFF514A4EFB00000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000DCF06C04EBFBFF06FFFFFF130000FF550004FF4E3B49FF03FF
      FFFF0ECEDEFF7700006C00000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000E5F2FF09FFFFFF080000FF3A0003FF4C4F5AFF00FF
      FFFF4C565AFF00000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000ECF68303F7FFFF06DBDEFF01AFB2FF09FFFFFF07E4
      EAFF7601008700000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000E3EAFF09FFFFFF1DFFFFFF00FFFFFF4661
      61FF85000002FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000EDF08C14F3F5FF2DFFFFFF02E9ECFF7801
      008C00000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000FFFF0200FCFDFF00FFFFFF4C59589F0000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0002FFFF1007FFFF3000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
    TabOrder = 32
    Visible = False
    OnClick = btnMensagemClick
  end
  object CbxCliente: TComboBox
    Left = 254
    Top = 51
    Width = 325
    Height = 21
    Hint = 'Nome do cliente para esta pr'#233'-venda'
    AutoDropDown = True
    Anchors = [akLeft, akTop, akRight]
    CharCase = ecUpperCase
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ImeMode = imOpen
    MaxLength = 40
    ParentFont = False
    ParentShowHint = False
    PopupMenu = PopupMenu1
    ShowHint = True
    TabOrder = 7
    OnChange = CbxClienteChange
    OnEnter = CbxClienteEnter
    OnExit = CbxClienteExit
    OnKeyPress = CbxClienteKeyPress
  end
  object CbxNome: TComboBox
    Left = 393
    Top = 15
    Width = 167
    Height = 21
    Hint = 'Funcion'#225'rio respons'#225'vel por este or'#231'amento'
    Style = csSimple
    Anchors = [akLeft, akTop, akRight]
    CharCase = ecUpperCase
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ImeMode = imOpen
    ParentFont = False
    ParentShowHint = False
    PopupMenu = PopupMenu1
    ShowHint = True
    TabOrder = 4
    OnChange = CbxNomeChange
    OnKeyPress = CbxNomeKeyPress
  end
  object edtValorBruto: TEdit
    Left = 211
    Top = 590
    Width = 80
    Height = 26
    Hint = 'Valor a Faturar'
    Anchors = [akLeft, akBottom]
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 31
    Text = '0,00'
    Visible = False
    OnExit = EdtSubTotalExit
    OnKeyPress = EdtSubTotalKeyPress
  end
  object Panel1: TPanel
    Left = 2
    Top = 393
    Width = 740
    Height = 18
    Anchors = [akLeft, akRight, akBottom]
    BevelOuter = bvNone
    TabOrder = 33
    object lblMensagem: TLabel
      Left = 16
      Top = 2
      Width = 62
      Height = 13
      Caption = 'lblMensagem'
    end
  end
  object edtcdLista: TEdit
    Left = 666
    Top = 8
    Width = 121
    Height = 21
    TabOrder = 34
    Visible = False
  end
  object cbxUsuario: TComboBox
    Left = 270
    Top = 328
    Width = 90
    Height = 21
    BevelInner = bvNone
    BevelOuter = bvNone
    CharCase = ecUpperCase
    DragCursor = crHandPoint
    MaxLength = 10
    TabOrder = 2
    Visible = False
    OnChange = cbxUsuarioChange
    OnExit = cbxUsuarioExit
  end
  object EdtUsuario: TEdit
    Tag = 1
    Left = 366
    Top = 328
    Width = 52
    Height = 21
    Hint = 'Digite a senha e press. ENTER, ou press. ESC para retornar'
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ImeMode = imOpen
    MaxLength = 6
    ParentFont = False
    ParentShowHint = False
    PasswordChar = '#'
    ShowHint = True
    TabOrder = 3
    Visible = False
    OnChange = EdtUsuarioChange
    OnExit = EdtUsuarioExit
    OnKeyPress = EdtUsuarioKeyPress
  end
  object edtLogin: TEdit
    Left = 170
    Top = 15
    Width = 90
    Height = 21
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 35
  end
  object btnLogoff: TBitBtn
    Left = 266
    Top = 15
    Width = 35
    Height = 21
    Hint = 'Clique aqui para trocar de usu'#225'rio'
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      1800000000000003000000000000000000000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FF000000000000000000000000000000FF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000000000C6C6C6C6
      C6C6C6C6C6C6C6C6C6C6C6000000000000FF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FF000000848484848484C6C6C6848484000000848484C6C6C68484848484
      84000000FF00FFFF00FFFF00FFFF00FF000000C6C6C6C6C6C6C6C6C6C6C6C684
      8484000000848484C6C6C6C6C6C6C6C6C6C6C6C6000000FF00FFFF00FFFF00FF
      000000848484848484848484C6C6C6C6C6C6000000C6C6C6C6C6C68484848484
      84848484000000FF00FFFF00FFFF00FF000000C6C6C6C6C6C6C6C6C6C6C6C600
      0000000000000000C6C6C6C6C6C6C6C6C6C6C6C6000000FF00FFFF00FFFF00FF
      0000008484848484848484848484840000000000000000008484848484848484
      84848484000000FF00FFFF00FFFF00FF000000C6C6C6C6C6C6C6C6C6C6C6C6C6
      C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6000000FF00FFFF00FFFF00FF
      FF00FF0000000000000000000000000000000000000000000000000000000000
      00000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000C6C6C6000000FF
      00FFFF00FFFF00FF000000C6C6C6000000FF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FF000000C6C6C6000000FF00FFFF00FFFF00FF000000C6C6C60000
      00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000C6C6C6000000FF
      00FFFF00FFFF00FF000000C6C6C6000000FF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FF848484848484C6C6C6000000000000000000C6C6C68484848484
      84FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000C6C6C6C6
      C6C6C6C6C6C6C6C6C6C6C6000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FF000000000000000000000000000000FF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    TabOrder = 36
    OnClick = btnLogoffClick
  end
  object Memo1: TMemo
    Left = 416
    Top = 188
    Width = 185
    Height = 89
    TabOrder = 37
    Visible = False
  end
  object Label11: TEdit
    Left = 753
    Top = 308
    Width = 69
    Height = 21
    TabStop = False
    Alignment = taRightJustify
    Anchors = [akTop, akRight]
    BorderStyle = bsNone
    Color = 14540253
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 38
    Text = '0,00'
  end
  object LblReserva: TEdit
    Left = 753
    Top = 235
    Width = 69
    Height = 21
    TabStop = False
    Alignment = taRightJustify
    Anchors = [akTop, akRight]
    BorderStyle = bsNone
    Color = 14540253
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 39
    Text = '0,00'
  end
  object Label15: TEdit
    Left = 753
    Top = 187
    Width = 69
    Height = 21
    TabStop = False
    Alignment = taRightJustify
    Anchors = [akTop, akRight]
    BorderStyle = bsNone
    Color = 14540253
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 40
    Text = '0,00'
  end
  object Label13: TEdit
    Left = 753
    Top = 291
    Width = 69
    Height = 21
    TabStop = False
    Alignment = taRightJustify
    Anchors = [akTop, akRight]
    BorderStyle = bsNone
    Color = 14540253
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ReadOnly = True
    ShowHint = False
    TabOrder = 41
  end
  object edtDisponivel: TEdit
    Left = 753
    Top = 355
    Width = 69
    Height = 21
    TabStop = False
    Alignment = taRightJustify
    Anchors = [akTop, akRight]
    BorderStyle = bsNone
    Color = 14540253
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 42
    Text = '0,00'
    Visible = False
  end
  object SBF5: TBitBtn
    Left = 748
    Top = 421
    Width = 77
    Height = 43
    Hint = 'Atualizar os produtos'
    Anchors = [akRight, akBottom]
    Caption = 'Atualizar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -9
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      04000000000080000000CE0E0000C40E00001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
      7777777777777777777777777744447777777777444444447777777444777744
      4777777447777774477777447777777744777744777777774477774477777777
      4477774477777777447777744777747447777774477774444777777777777444
      7777777777777444477777777777777777777777777777777777}
    Layout = blGlyphTop
    ParentFont = False
    ParentShowHint = False
    PopupMenu = PopupMenu1
    ShowHint = True
    Spacing = 1
    TabOrder = 43
    OnClick = SBF5Click
    OnKeyPress = BtnAprazoKeyPress
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object TTimer
    Interval = 200
  end
  object DsConsulta: TDataSource
    DataSet = ADOSPConsulta
    Left = 550
    Top = 422
  end
  object PopupMenu1: TPopupMenu
    Left = 25
    Top = 232
    object elaPrincipal1: TMenuItem
      Caption = 'Tela Principal'
      object Help1: TMenuItem
        Caption = 'Pr'#233'-Venda'
        ShortCut = 112
        OnClick = Help1Click
      end
      object Alterar1: TMenuItem
        Caption = 'Alterar'
        ShortCut = 113
        OnClick = Alterar1Click
      end
      object Oramento1: TMenuItem
        Caption = 'Or'#231'amento'
        ShortCut = 114
        OnClick = Oramento1Click
      end
      object HiperCard1: TMenuItem
        Caption = 'Consultar por Descri'#231#227'o'
        ShortCut = 115
        OnClick = HiperCard1Click
      end
      object VisaNet1: TMenuItem
        Caption = 'Consultar por Refer'#234'ncia de F'#225'brica'
        ShortCut = 116
        OnClick = VisaNet1Click
      end
      object AmericanExpress1: TMenuItem
        Caption = 'Consultar por Refer'#234'ncia Interna'
        ShortCut = 117
        OnClick = AmericanExpress1Click
      end
      object CdigoAdicional1: TMenuItem
        Caption = 'Consultar por C'#243'digo de Barras'
        ShortCut = 118
        OnClick = CdigoAdicional1Click
      end
      object Produtossimilares1: TMenuItem
        Caption = 'Consultar Produtos similares'
        ShortCut = 119
        OnClick = Produtossimilares1Click
      end
      object Alteraquantidade1: TMenuItem
        Caption = 'Confirmar'
        ShortCut = 120
        OnClick = Alteraquantidade1Click
      end
      object Registraperdadevemdaporestoqueinsuficiente1: TMenuItem
        Caption = 'Registra perda de venda por estoque insuficiente'
        ShortCut = 121
        OnClick = Registraperdadevemdaporestoqueinsuficiente1Click
      end
      object Desconto1: TMenuItem
        Caption = 'Desconto'
        ShortCut = 122
        OnClick = Desconto1Click
      end
      object ConsultaEspecificacao1: TMenuItem
        Caption = 'ConsultaEspecificacao'
        ShortCut = 123
        OnClick = ConsultaEspecificacao1Click
      end
      object Excluiritens1: TMenuItem
        Caption = 'Excluir itens'
        ShortCut = 16430
        OnClick = Excluiritens1Click
      end
      object Limpatextoparapesquisa1: TMenuItem
        Caption = 'Limpa texto para pesquisa'
        ShortCut = 32776
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object ransferncia1: TMenuItem
        Caption = 'Transfer'#234'ncia'
        ShortCut = 16468
        OnClick = ransferncia1Click
      end
      object Visualizarapelidodocliente1: TMenuItem
        Caption = 'Visualizar Apelido do Cliente'
        ShortCut = 16449
        OnClick = Visualizarapelidodocliente1Click
      end
      object Cancelar1: TMenuItem
        Caption = 'Cancelar'
      end
      object Logoff1: TMenuItem
        Caption = 'Logoff'
        ShortCut = 8219
        OnClick = Logoff1Click
      end
    end
    object Consultas1: TMenuItem
      Caption = 'Consultas'
      object MiCadastroAmbientes: TMenuItem
        Caption = 'Cadastro de Ambientes'
        Visible = False
        OnClick = MiCadastroAmbientesClick
      end
      object ConsultaProduto1: TMenuItem
        Caption = 'Consultar Produto'
        ShortCut = 16453
        OnClick = ConsultaProduto1Click
      end
      object Banese1: TMenuItem
        Caption = 'Consultar por C'#243'digo'
        ShortCut = 16499
        OnClick = Banese1Click
      end
      object ConsultarporCdigoAdicional1: TMenuItem
        Caption = 'Consultar por C'#243'digo Adicional'
        ShortCut = 16455
        OnClick = ConsultarporCdigoAdicional1Click
      end
      object Especificao1: TMenuItem
        Caption = 'Consultar por Especifica'#231#227'o / Aplica'#231#227'o'
        ShortCut = 16496
        OnClick = Especificao1Click
      end
      object Alterarpreodoproduto1: TMenuItem
        Caption = 'Alterar pre'#231'o do produto'
        ShortCut = 16497
        OnClick = Alterarpreodoproduto1Click
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object ConsultarListas1: TMenuItem
        Caption = 'Consultar Listas'
        ShortCut = 16460
        Visible = False
        OnClick = ConsultarListas1Click
      end
      object Consultapedidodecompra1: TMenuItem
        Caption = 'Consultar pedido de compra'
        ShortCut = 16504
        OnClick = Consultapedidodecompra1Click
      end
      object Consultadecrditodocliente1: TMenuItem
        Caption = 'Consulta de cr'#233'dito do cliente'
        ShortCut = 16506
        OnClick = Consultadecrditodocliente1Click
      end
      object ConsultarCrdito1: TMenuItem
        Caption = 'Consultar Cr'#233'dito Vendedores...'
        ShortCut = 16451
        OnClick = ConsultarCrdito1Click
      end
      object Consultarprvendas1: TMenuItem
        Caption = 'Consultar pr'#233'-vendas'
        ShortCut = 16465
        OnClick = Consultarprvendas1Click
      end
      object Relatriodecontagem1: TMenuItem
        Caption = 'Relat'#243'rio de contagem'
        ShortCut = 16502
        Visible = False
        OnClick = Relatriodecontagem1Click
      end
    end
    object Escola1: TMenuItem
      Caption = 'Escola'
      object CadastrodeEscola1: TMenuItem
        Caption = 'Cadastro de Escola'
        ShortCut = 16467
        OnClick = CadastrodeEscola1Click
      end
      object CadastrodeSrie1: TMenuItem
        Caption = 'Cadastro de S'#233'rie '
        ShortCut = 16452
        OnClick = CadastrodeSrie1Click
      end
      object CadastrodeLista1: TMenuItem
        Caption = 'Cadastro de Lista'
        ShortCut = 16454
        OnClick = CadastrodeLista1Click
      end
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Imprimiretiquetas1: TMenuItem
      Caption = 'Imprimir etiquetas...'
      ShortCut = 16500
      OnClick = Imprimiretiquetas1Click
    end
    object Imprimir1: TMenuItem
      Caption = 'Imprimir requisi'#231#227'o de material'
      ShortCut = 16503
      OnClick = Imprimir1Click
    end
    object Declaraodedevoluodecliente1: TMenuItem
      Caption = 'Declara'#231#227'o de devolu'#231#227'o de cliente'
      ShortCut = 16498
      OnClick = Declaraodedevoluodecliente1Click
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object Cadastrodeclientes1: TMenuItem
      Caption = 'Cadastro de clientes'
      ShortCut = 16505
      OnClick = Cadastrodeclientes1Click
    end
    object Cancelaraprvenda1: TMenuItem
      Caption = 'Consultar vendas'
      ShortCut = 16507
      OnClick = Cancelaraprvenda1Click
    end
    object Importarvendasexternas1: TMenuItem
      Caption = 'Importar vendas externas...'
      ShortCut = 16450
      OnClick = Importarvendasexternas1Click
    end
    object SimplesRemessa1: TMenuItem
      Caption = 'Simples Remessa'
      ShortCut = 16466
      Visible = False
    end
    object Voltarparaotemaoriginal1: TMenuItem
      Caption = 'Voltar para o tema original'
      ShortCut = 16501
      Visible = False
      OnClick = Voltarparaotemaoriginal1Click
    end
    object DesbloquearPrVenda1: TMenuItem
      Caption = 'Desbloquear Pr'#233' Venda / OS para uso no caixa'
      ShortCut = 16464
      OnClick = DesbloquearPrVenda1Click
    end
    object miProdutosVendidosJunto: TMenuItem
      Caption = 'Produtos vendidos junto...'
      ShortCut = 16458
      OnClick = miProdutosVendidosJuntoClick
    end
    object miÚltimasVendasDoProdutoAoCliente: TMenuItem
      Caption = #218'ltimas vendas deste produto ao cliente...'
      ShortCut = 16469
      OnClick = miÚltimasVendasDoProdutoAoClienteClick
    end
    object ro1: TMenuItem
      Caption = 'Trocar de Usu'#225'rio'
      ShortCut = 16472
      OnClick = ro1Click
    end
    object Conferncia1: TMenuItem
      Caption = 'Confer'#234'ncia'
      ShortCut = 16471
      OnClick = Conferncia1Click
    end
  end
  object ADOSPConsulta: TADOStoredProc
    Connection = DModulo.Conexao
    CursorType = ctStatic
    CommandTimeout = 60
    ProcedureName = 'SUP_ListaProdutosPrevenda;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@OPCAO'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
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
        Name = '@DSATIVO'
        Attributes = [paNullable]
        DataType = ftString
        Size = 1
        Value = Null
      end
      item
        Name = '@PESQUISA'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = '@DESCONTO'
        Attributes = [paNullable]
        DataType = ftBCD
        NumericScale = 5
        Precision = 10
        Value = Null
      end
      item
        Name = '@PESQUISA2'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = '@OCULTARPRODUTOSEMESTOQUE'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@BUSCAPARCIAL'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end>
    Left = 351
    Top = 462
    object ADOSPConsultaCDIGO: TIntegerField
      FieldName = 'C'#211'DIGO'
    end
    object ADOSPConsultaCDIGO_BARRAS: TStringField
      FieldName = 'C'#211'DIGO_BARRAS'
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
    object ADOSPConsultaPRECO: TFloatField
      FieldName = 'PRECO'
    end
    object ADOSPConsultaVALOR: TFloatField
      FieldName = 'VALOR'
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
      Size = 10
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
    object ADOSPConsultaDSPROMOCAO: TStringField
      FieldName = 'DSPROMOCAO'
      Size = 1
    end
    object ADOSPConsultadsAtivo: TStringField
      FieldName = 'dsAtivo'
      FixedChar = True
      Size = 10
    end
    object ADOSPConsultadsCFOPD: TStringField
      FieldName = 'dsCFOPD'
      Size = 4
    end
    object ADOSPConsultadsCFOPF: TStringField
      FieldName = 'dsCFOPF'
      Size = 4
    end
    object ADOSPConsultadspromocaoatacado: TStringField
      FieldName = 'dspromocaoatacado'
      Size = 1
    end
    object ADOSPConsultadspromocaovarejo: TStringField
      FieldName = 'dspromocaovarejo'
      Size = 1
    end
    object ADOSPConsultanrqtdpromocao: TFloatField
      FieldName = 'nrqtdpromocao'
    end
  end
  object ADOQryProcura: TADOQuery
    Connection = DModulo.Conexao
    Parameters = <>
    Left = 232
    Top = 424
  end
  object ADOQryEspecificacao: TADOQuery
    Connection = DModulo.Conexao
    Parameters = <>
    Left = 286
    Top = 432
  end
  object ADOQryProduto: TADOQuery
    Connection = DModulo.Conexao
    Parameters = <>
    Left = 268
    Top = 384
  end
  object ADOQryNome: TADOQuery
    Connection = DModulo.Conexao
    Parameters = <>
    Left = 306
    Top = 360
  end
  object ADOQryCliente: TADOQuery
    Connection = DModulo.Conexao
    Parameters = <>
    Left = 336
    Top = 384
  end
  object ADOQryUltimo: TADOQuery
    Connection = DModulo.Conexao
    Parameters = <>
    Left = 399
    Top = 384
  end
  object ADOQrySalvar: TADOQuery
    Connection = DModulo.Conexao
    Parameters = <>
    Left = 431
    Top = 384
  end
  object AdoQrySimilar: TADOQuery
    Connection = DModulo.Conexao
    Parameters = <>
    Left = 464
    Top = 384
  end
  object ADOSPQryCliente: TADOStoredProc
    Connection = DModulo.Conexao
    CommandTimeout = 999
    ProcedureName = 'SP_MONTACOMBO_CLIENTE;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@OPCAO'
        Attributes = [paNullable]
        DataType = ftString
        Size = 1
        Value = Null
      end>
    Left = 443
    Top = 422
  end
  object AdoQryLocaliza: TADOQuery
    Connection = DModulo.Conexao
    Parameters = <>
    Left = 496
    Top = 384
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
    Left = 459
    Top = 453
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
    Left = 489
    Top = 453
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
    Left = 579
    Top = 424
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
    Left = 550
    Top = 454
  end
  object ADOSP_PEDIDO_GARANTIA: TADOStoredProc
    Connection = DModulo.Conexao
    CursorType = ctStatic
    ProcedureName = 'SP_PEDIDO_GARANTIA;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@OPCAO'
        Attributes = [paNullable]
        DataType = ftString
        Size = 1
        Value = Null
      end
      item
        Name = '@CODIGO'
        Attributes = [paNullable]
        DataType = ftString
        Size = 5
        Value = Null
      end>
    Left = 520
    Top = 454
    object IntegerField1: TIntegerField
      FieldName = 'C'#243'digo'
    end
    object StringField1: TStringField
      FieldName = 'C'#243'digo_Barras'
      Size = 60
    end
    object StringField2: TStringField
      FieldName = 'Refer'#234'ncia'
      Size = 60
    end
    object StringField3: TStringField
      FieldName = 'Descri'#231#227'o'
      Size = 60
    end
    object StringField4: TStringField
      FieldName = 'Fabricante'
      Size = 60
    end
    object StringField5: TStringField
      FieldName = 'Prateleira'
      Size = 60
    end
    object StringField6: TStringField
      FieldName = 'Unidade'
      Size = 60
    end
    object StringField7: TStringField
      FieldName = 'Embalagem'
      Size = 60
    end
    object StringField8: TStringField
      FieldName = 'Grupo'
      Size = 60
    end
    object FloatField1: TFloatField
      FieldName = 'Valor'
    end
    object FloatField2: TFloatField
      DisplayLabel = 'Dispon'#237'vel'
      FieldName = 'Pedido'
    end
    object FloatField3: TFloatField
      FieldName = 'Peso'
    end
    object FloatField4: TFloatField
      FieldName = 'Estoque'
      DisplayFormat = '#0.000'
    end
  end
  object ADOQuery1: TADOQuery
    Connection = DModulo.Conexao
    Parameters = <>
    Left = 192
    Top = 392
  end
  object TTimer
    Interval = 200
  end
  object Timer1: TTimer
    Left = 48
    Top = 426
  end
  object ADOQryUltimoCodigo: TADOQuery
    Connection = DModulo.ADODeposito
    Parameters = <>
    Left = 144
    Top = 352
  end
  object DsDeposito: TDataSource
    DataSet = ADOQryUltimoCodigo
    Left = 100
    Top = 364
  end
  object ADOVarejo: TADOQuery
    Connection = DModulo.Conexao
    Parameters = <
      item
        Name = 'cdproduto'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select vlAtacado from produto where cdproduto = :cdproduto')
    Left = 579
    Top = 454
  end
  object ADOQryProcura1: TADOQuery
    Connection = DModulo.Conexao
    Parameters = <>
    Left = 144
    Top = 424
  end
  object adoEntrada: TADOQuery
    Connection = DModulo.Conexao
    Parameters = <>
    Left = 616
    Top = 424
  end
  object Timer2: TTimer
    Interval = 1
    OnTimer = Timer2Timer
    Left = 400
    Top = 416
  end
  object AdoAmbiente: TADOQuery
    Connection = DModulo.Conexao
    Parameters = <>
    SQL.Strings = (
      'select dsAmbiente, cdAmbiente from Ambiente '
      'union'
      'select '#39#39' as dsAmbiente, null as cdAmbiente from ambiente'
      'order by 1')
    Left = 536
    Top = 384
  end
end
