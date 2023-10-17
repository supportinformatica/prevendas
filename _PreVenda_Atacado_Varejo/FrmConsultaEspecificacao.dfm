object FrmEspecificacao: TFrmEspecificacao
  Left = 364
  Top = 319
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 
    '                                                       <<<<<    ' +
    'Consulta especifica'#231#227'o     >>>>>'
  ClientHeight = 384
  ClientWidth = 622
  Color = clSkyBlue
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = PopupMenu1
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel2: TBevel
    Left = 0
    Top = 0
    Width = 622
    Height = 384
    Hint = 'Consulta especifica'#231#227'o'
    Align = alClient
    ExplicitLeft = -1
  end
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 622
    Height = 384
    Hint = 'Consulta especifica'#231#227'o'
    Align = alClient
    ExplicitLeft = -1
  end
  object Label57: TLabel
    Left = 405
    Top = 1
    Width = 175
    Height = 13
    Caption = 'Clique na Imagem para Ampliar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label58: TLabel
    Left = 4
    Top = 1
    Width = 125
    Height = 13
    Caption = 'Especifica'#231#245'es gerais'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label64: TLabel
    Left = 8
    Top = 240
    Width = 59
    Height = 16
    Caption = 'Produto:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblProduto: TLabel
    Left = 190
    Top = 240
    Width = 59
    Height = 16
    Caption = 'Produto:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblReferencia: TLabel
    Left = 8
    Top = 272
    Width = 112
    Height = 16
    Caption = 'Ref. de F'#225'brica:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label59: TLabel
    Left = 8
    Top = 288
    Width = 127
    Height = 16
    Caption = 'C'#243'digo de Barras:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label62: TLabel
    Left = 8
    Top = 304
    Width = 79
    Height = 16
    Caption = 'Fabricante:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblFab: TLabel
    Left = 133
    Top = 304
    Width = 286
    Height = 16
    AutoSize = False
    Caption = 'Produto:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblCdBarras: TLabel
    Left = 133
    Top = 288
    Width = 59
    Height = 16
    Caption = 'Produto:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblRefer: TLabel
    Left = 133
    Top = 272
    Width = 59
    Height = 16
    Caption = 'Produto:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblCod: TLabel
    Left = 133
    Top = 240
    Width = 49
    Height = 16
    AutoSize = False
    Caption = 'Produto:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label10: TLabel
    Left = 439
    Top = 363
    Width = 148
    Height = 15
    Caption = 'Pressione "ESC" para sair'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label69: TLabel
    Left = 4
    Top = 187
    Width = 172
    Height = 13
    Caption = 'C'#243'digos adicionais do produto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 441
    Top = 288
    Width = 108
    Height = 16
    Caption = 'Pre'#231'o Atacado:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblAtacado: TLabel
    Left = 581
    Top = 288
    Width = 29
    Height = 16
    Alignment = taRightJustify
    Caption = '0,00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 441
    Top = 272
    Width = 96
    Height = 16
    Caption = 'Pre'#231'o Varejo:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblVarejo: TLabel
    Left = 581
    Top = 272
    Width = 29
    Height = 16
    Alignment = taRightJustify
    Caption = '0,00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Image1: TImage
    Left = 405
    Top = 15
    Width = 212
    Height = 169
    Hint = 'Clique para ampliar ou reduzir.'
    Center = True
    ParentShowHint = False
    PopupMenu = PopupMenu1
    ShowHint = True
    Stretch = True
    OnClick = Image1Click
    OnMouseDown = Image1MouseDown
  end
  object Label2: TLabel
    Left = 88
    Top = 364
    Width = 144
    Height = 15
    Caption = 'Ampliar Imagem   Ctrl + A'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 262
    Top = 364
    Width = 151
    Height = 15
    Caption = 'Tamanho Original  Ctrl + V'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 8
    Top = 322
    Width = 38
    Height = 16
    Caption = 'NCM:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblClFiscal: TLabel
    Left = 133
    Top = 324
    Width = 49
    Height = 13
    Caption = 'Produto:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 441
    Top = 256
    Width = 82
    Height = 16
    Caption = 'Custo Final:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblAquisicao: TLabel
    Left = 581
    Top = 256
    Width = 29
    Height = 16
    Alignment = taRightJustify
    Caption = '0,00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label60: TLabel
    Left = 8
    Top = 256
    Width = 84
    Height = 16
    Caption = 'Ref. Interna:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblRefInterna: TLabel
    Left = 133
    Top = 256
    Width = 76
    Height = 16
    Caption = 'Ref Interna'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label7: TLabel
    Left = 441
    Top = 304
    Width = 75
    Height = 16
    Caption = 'Qtd Fiscal:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblQtdFiscal: TLabel
    Left = 581
    Top = 304
    Width = 29
    Height = 16
    Alignment = taRightJustify
    Caption = '0,00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Memo1: TMemo
    Left = 3
    Top = 15
    Width = 398
    Height = 168
    Color = clInfoBk
    PopupMenu = PopupMenu1
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 0
    OnKeyPress = Memo1KeyPress
  end
  object btnNext: TBitBtn
    Left = 43
    Top = 352
    Width = 33
    Height = 25
    Cursor = crHandPoint
    Hint = 'Pr'#243'ximo'
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333333333333333333333333333333333333333333333
      3333333333333333333333333333333333333333333FF3333333333333003333
      3333333333773FF3333333333309003333333333337F773FF333333333099900
      33333FFFFF7F33773FF30000000999990033777777733333773F099999999999
      99007FFFFFFF33333F7700000009999900337777777F333F7733333333099900
      33333333337F3F77333333333309003333333333337F77333333333333003333
      3333333333773333333333333333333333333333333333333333333333333333
      3333333333333333333333333333333333333333333333333333}
    NumGlyphs = 2
    ParentShowHint = False
    PopupMenu = PopupMenu1
    ShowHint = True
    TabOrder = 1
    OnClick = btnNextClick
  end
  object btnPrior: TBitBtn
    Left = 8
    Top = 352
    Width = 33
    Height = 25
    Cursor = crHandPoint
    Hint = 'Anterior'
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333333333333333333333333333333333333333333333
      3333333333333FF3333333333333003333333333333F77F33333333333009033
      333333333F7737F333333333009990333333333F773337FFFFFF330099999000
      00003F773333377777770099999999999990773FF33333FFFFF7330099999000
      000033773FF33777777733330099903333333333773FF7F33333333333009033
      33333333337737F3333333333333003333333333333377333333333333333333
      3333333333333333333333333333333333333333333333333333333333333333
      3333333333333333333333333333333333333333333333333333}
    NumGlyphs = 2
    ParentShowHint = False
    PopupMenu = PopupMenu1
    ShowHint = True
    TabOrder = 2
    OnClick = btnPriorClick
  end
  object SgCodigos: TStringGrid
    Left = 4
    Top = 201
    Width = 611
    Height = 38
    Hint = 'C'#243'digos adicionais do produto'
    BiDiMode = bdLeftToRight
    Color = clInfoBk
    ColCount = 7
    DefaultColWidth = 30
    DefaultRowHeight = 16
    FixedCols = 0
    RowCount = 2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goTabs]
    ParentBiDiMode = False
    ParentFont = False
    ParentShowHint = False
    PopupMenu = PopupMenu1
    ShowHint = True
    TabOrder = 3
    ColWidths = (
      70
      75
      88
      89
      100
      85
      76)
  end
  object BtnMdProximo: TBitBtn
    Left = 331
    Top = 234
    Width = 0
    Height = 30
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
    ShowHint = True
    Spacing = 1
    TabOrder = 4
    OnClick = BtnMdProximoClick
  end
  object BtnMdAnterior: TBitBtn
    Left = 331
    Top = 266
    Width = 0
    Height = 30
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
    ShowHint = True
    Spacing = 1
    TabOrder = 5
    OnClick = BtnMdAnteriorClick
  end
  object PopupMenu1: TPopupMenu
    Left = 480
    Top = 96
    object Ampliar1: TMenuItem
      Caption = '&Ampliar'
      ShortCut = 16449
      OnClick = Ampliar1Click
    end
    object Voltar1: TMenuItem
      Caption = '&Voltar'
      ShortCut = 16470
      OnClick = Voltar1Click
    end
  end
end
