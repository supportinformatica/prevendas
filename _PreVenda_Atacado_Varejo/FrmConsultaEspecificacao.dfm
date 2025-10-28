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
    ExplicitTop = -1
  end
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 622
    Height = 384
    Hint = 'Consulta especifica'#231#227'o'
    Align = alClient
    ExplicitLeft = 1
  end
  object Label57: TLabel
    Left = 405
    Top = 1
    Width = 173
    Height = 13
    Caption = 'Clique na imagem para ampliar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
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
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label64: TLabel
    Left = 8
    Top = 240
    Width = 49
    Height = 13
    Caption = 'Produto:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblProduto: TLabel
    Left = 167
    Top = 240
    Width = 49
    Height = 13
    Caption = 'Produto:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblReferencia: TLabel
    Left = 8
    Top = 272
    Width = 90
    Height = 13
    Caption = 'Ref. de f'#225'brica:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label59: TLabel
    Left = 8
    Top = 288
    Width = 101
    Height = 13
    Caption = 'C'#243'digo de barras:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label62: TLabel
    Left = 8
    Top = 304
    Width = 65
    Height = 13
    Caption = 'Fabricante:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblFab: TLabel
    Left = 110
    Top = 304
    Width = 286
    Height = 16
    AutoSize = False
    Caption = 'Produto:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblCdBarras: TLabel
    Left = 110
    Top = 288
    Width = 49
    Height = 13
    Caption = 'Produto:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblRefer: TLabel
    Left = 110
    Top = 272
    Width = 49
    Height = 13
    Caption = 'Produto:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblCod: TLabel
    Left = 110
    Top = 240
    Width = 49
    Height = 16
    AutoSize = False
    Caption = 'Produto:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label10: TLabel
    Left = 441
    Top = 365
    Width = 137
    Height = 13
    Caption = 'Pressione ESC para sair'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
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
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 463
    Top = 272
    Width = 88
    Height = 13
    Caption = 'Pre'#231'o atacado:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblAtacado: TLabel
    Left = 586
    Top = 272
    Width = 29
    Height = 16
    Alignment = taRightJustify
    Caption = '0,00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 463
    Top = 256
    Width = 77
    Height = 13
    Caption = 'Pre'#231'o varejo:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblVarejo: TLabel
    Left = 586
    Top = 256
    Width = 29
    Height = 16
    Alignment = taRightJustify
    Caption = '0,00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
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
    Left = 77
    Top = 366
    Width = 126
    Height = 13
    Caption = 'Ampliar imagem Ctrl+A'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 249
    Top = 366
    Width = 136
    Height = 13
    Caption = 'Tamanho original Ctrl+V'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 8
    Top = 322
    Width = 32
    Height = 13
    Caption = 'NCM:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblClFiscal: TLabel
    Left = 110
    Top = 324
    Width = 346
    Height = 13
    AutoSize = False
    Caption = 'Produto:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 463
    Top = 240
    Width = 65
    Height = 13
    Caption = 'Custo final:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblAquisicao: TLabel
    Left = 586
    Top = 240
    Width = 29
    Height = 16
    Alignment = taRightJustify
    Caption = '0,00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label60: TLabel
    Left = 8
    Top = 256
    Width = 72
    Height = 13
    Caption = 'Ref. interna:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblRefInterna: TLabel
    Left = 110
    Top = 256
    Width = 65
    Height = 13
    Caption = 'Ref Interna'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label7: TLabel
    Left = 463
    Top = 288
    Width = 63
    Height = 13
    Caption = 'Qtd. fiscal:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblQtdFiscal: TLabel
    Left = 586
    Top = 288
    Width = 29
    Height = 16
    Alignment = taRightJustify
    Caption = '0,00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label8: TLabel
    Left = 463
    Top = 304
    Width = 82
    Height = 13
    Caption = 'Pre'#231'o m'#237'nimo:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label9: TLabel
    Left = 463
    Top = 322
    Width = 83
    Height = 13
    Caption = 'Pre'#231'o m'#225'ximo:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblMinimo: TLabel
    Left = 586
    Top = 304
    Width = 29
    Height = 16
    Alignment = taRightJustify
    Caption = '0,00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblMaximo: TLabel
    Left = 586
    Top = 320
    Width = 29
    Height = 16
    Alignment = taRightJustify
    Caption = '0,00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
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
    Left = 577
    Top = 339
    Width = 38
    Height = 25
    Cursor = crHandPoint
    Hint = 'Pr'#243'ximo produto'
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFAB552CE2C5B6FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA9532AAE
      5C32DCB9A7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFA9532AB86735AD582ECA9479FBF7F5FFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA9532AC9
      814BBF7546AC582DCD9A80F8F2EEFFFFFFFFFFFFFFFFFFFFFFFFD9C8C4DECBC5
      E2CDC6E5CFC7E7D1C8E8D2C9A9532ACA824DCF8C58CE8B59AC582DC28261FBF6
      F4FFFFFFFFFFFFFFFFFF6923128D3F20994926A4512BAB5830B05F35B5663ACD
      8753C57944CC8754D09060B56437CB9273FFFFFFFFFFFFFFFFFF6A2312C2733C
      B66939BF7240C37743C67C49CA844FCA834EC47742C87F4ACC8652D29566BC70
      42B76D46FEFCFBFFFFFF6A2312C2733C88371B9C4522A64F28AF5A2DBC6B36C2
      743EC57944C87F4ACC8752CD8853D29364BE7346B36235F9F2ED6A2412C2733C
      88371B9D4523A65028AF5A2DBC6B36C2743EC57944C87F4ACC8752D1905CD192
      60CF8D5EB86A3EB86B3E6B2412C2733C984826A8542DB05E33B7683AC37742C7
      7D48C57944C87F4AC9824CD19262D59B72BB6F40B86B41EBD6CB6B2412C2733C
      C37640C67A44C87F4ACB8550CB844FCD8753C57944C67C46CD8A58C78050B666
      39BF7C59FFFFFFFFFFFF6B24127D2F188C3A1D984221A04824A54E27AA542ACD
      8753CB8450D39566C57E4EB05C31C68968FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFAA542AC77D48CF8C58BB6C3BB15F34E8D0C4FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAA542ACB
      8957B96736B2643CF3E7E1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFAA542AAD592EB9714DF3E8E2FFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAE5C34BC
      7755EFDFD8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    ParentShowHint = False
    PopupMenu = PopupMenu1
    ShowHint = True
    TabOrder = 1
    OnClick = btnNextClick
  end
  object btnPrior: TBitBtn
    Left = 528
    Top = 339
    Width = 38
    Height = 25
    Cursor = crHandPoint
    Hint = 'Produto anterior'
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFDFD8BC7755AE5C34FFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3E8E2B9
      714DAD592EAA542AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFF3E7E1B2643CB96736CB8957AA542AFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE8D0C4B15F34BB6C3BCF
      8C58C77D48AA542AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFC68968B05C31C57E4ED39566CB8450CD8753AA542AA54E27A048249842
      218C3A1D7D2F186B2412FFFFFFFFFFFFBF7C59B66639C78050CD8A58C67C46C5
      7944CD8753CB844FCB8550C87F4AC67A44C37640C2733C6B2412EBD6CBB86B41
      BB6F40D59B72D19262C9824CC87F4AC57944C77D48C37742B7683AB05E33A854
      2D984826C2733C6B2412B86B3EB86A3ECF8D5ED19260D1905CCC8752C87F4AC5
      7944C2743EBC6B36AF5A2DA650289D452388371BC2733C6A2412F9F2EDB36235
      BE7346D29364CD8853CC8752C87F4AC57944C2743EBC6B36AF5A2DA64F289C45
      2288371BC2733C6A2312FFFFFFFEFCFBB76D46BC7042D29566CC8652C87F4AC4
      7742CA834ECA844FC67C49C37743BF7240B66939C2733C6A2312FFFFFFFFFFFF
      FFFFFFCB9273B56437D09060CC8754C57944CD8753B5663AB05F35AB5830A451
      2B9949268D3F20692312FFFFFFFFFFFFFFFFFFFBF6F4C28261AC582DCE8B59CF
      8C58CA824DA9532AE8D2C9E7D1C8E5CFC7E2CDC6DECBC5D9C8C4FFFFFFFFFFFF
      FFFFFFFFFFFFF8F2EECD9A80AC582DBF7546C9814BA9532AFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF7F5CA9479AD
      582EB86735A9532AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCB9A7AE5C32A9532AFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFE2C5B6AB552CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
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
