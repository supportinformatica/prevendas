object FrmContagem: TFrmContagem
  Left = 233
  Top = 178
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rio de contagem'
  ClientHeight = 370
  ClientWidth = 588
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 12
    Top = 10
    Width = 135
    Height = 19
    Caption = 'Filtrar Somente --->'
    Font.Charset = ANSI_CHARSET
    Font.Color = clMaroon
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 9
    Top = 168
    Width = 149
    Height = 13
    Caption = 'Configura'#231#227'o do Relat'#243'rio'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object CheckBox10: TCheckBox
    Left = 3
    Top = 223
    Width = 145
    Height = 17
    Hint = 'Imrpie o pre'#231'o de venda'
    Caption = 'Imprimir Pre'#231'o de venda'
    Checked = True
    State = cbChecked
    TabOrder = 0
  end
  object CheckBox11: TCheckBox
    Left = 3
    Top = 188
    Width = 161
    Height = 17
    Hint = 'Imprimir somente os produtos ativos'
    Caption = 'Imprimir Somente os ativos'
    Checked = True
    ParentShowHint = False
    ShowHint = True
    State = cbChecked
    TabOrder = 1
  end
  object CheckListBox1: TCheckListBox
    Left = 170
    Top = 6
    Width = 323
    Height = 356
    Hint = 
      'Clique no retangulo para marcar marcar ou desmarcar o grupo para' +
      ' montar lista'
    Color = clInfoBk
    Font.Charset = ANSI_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemHeight = 13
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = CheckListBox1Click
  end
  object RadioGroup2: TRadioGroup
    Left = 9
    Top = 33
    Width = 151
    Height = 130
    Caption = 'Agrupar por:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ItemIndex = 0
    Items.Strings = (
      'Grupo'
      'Fabricante'
      'Todos os produtos'
      'Prateleira')
    ParentFont = False
    TabOrder = 3
    OnClick = RadioGroup2Click
  end
  object CheckBox12: TCheckBox
    Left = 3
    Top = 240
    Width = 100
    Height = 17
    Hint = 'Imprime o estoque'
    Caption = 'Imprimir Estoque'
    Checked = True
    State = cbChecked
    TabOrder = 4
  end
  object CheckBox14: TCheckBox
    Left = 3
    Top = 258
    Width = 128
    Height = 17
    Hint = 'Imprime o estoque'
    Caption = 'Imprimir Codigo Barras'
    Checked = True
    State = cbChecked
    TabOrder = 5
  end
  object CheckBox15: TCheckBox
    Left = 3
    Top = 275
    Width = 155
    Height = 17
    Hint = 'Imprime o estoque'
    Caption = 'Imprimir Nome do Fabricantes'
    Checked = True
    State = cbChecked
    TabOrder = 6
  end
  object RadioGroup5: TRadioGroup
    Left = 8
    Top = 303
    Width = 151
    Height = 59
    Caption = 'Ordenar por:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ItemIndex = 0
    Items.Strings = (
      'C'#243'digo'
      'Descri'#231#227'o')
    ParentFont = False
    TabOrder = 7
  end
  object BtnLista: TBitBtn
    Left = 501
    Top = 55
    Width = 77
    Height = 61
    Hint = 'Monta lista de produtos com as quantidades'
    Caption = '&Monta Lista'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      04000000000080000000120B0000120B00001000000010000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
      DADA00000000000000000FF0FEF4FEF4FEF00FF0EFE4EFE4EFE00FF044444444
      44400FF0EFE4EFE4EFE00000FEF4FEF4FEF00FF04444444444400FF0FEF4FEF4
      FEF00FF0EFE4EFE4EFE000000000000000000FF0FFFFF0FFFFF00FF0FFFFF0FF
      FFF00000000000000000DADADADADADADADAADADADADADADADAD}
    Layout = blGlyphTop
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
    OnClick = BtnListaClick
  end
  object BtnMdImprimir: TBitBtn
    Left = 502
    Top = 151
    Width = 76
    Height = 60
    Hint = 'Impress'#227'o de relat'#243'rio'
    Caption = '&Imprimir'
    Font.Charset = ANSI_CHARSET
    Font.Color = clHotLight
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      0400000000000001000000000000000000001000000010000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
      0003377777777777777308888888888888807F33333333333337088888888888
      88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
      8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
      8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
      03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
      03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
      33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
      33333337FFFF7733333333300000033333333337777773333333}
    Layout = blGlyphTop
    NumGlyphs = 2
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 9
    OnClick = BtnMdImprimirClick
  end
  object BtnMdSair: TBitBtn
    Left = 502
    Top = 248
    Width = 76
    Height = 60
    Hint = 'Fecha este formul'#225'rio'
    Caption = 'Sai&r'
    Font.Charset = ANSI_CHARSET
    Font.Color = clHotLight
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
    Layout = blGlyphTop
    NumGlyphs = 2
    ParentFont = False
    TabOrder = 10
    OnClick = BtnMdSairClick
  end
  object CheckBox1: TCheckBox
    Left = 3
    Top = 205
    Width = 161
    Height = 17
    Hint = 'Imprimir somente os produtos ativos'
    Caption = 'Imprimir Somente os negativos'
    Checked = True
    ParentShowHint = False
    ShowHint = True
    State = cbChecked
    TabOrder = 11
  end
  object ADOQryGrupo: TADOQuery
    Connection = DModulo.Conexao
    Parameters = <>
    SQL.Strings = (
      'Select cdProduto as Codigo, vlPreco as Preco'
      'From Produto'
      '')
    Left = 524
    Top = 6
  end
end
