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
    Layout = blGlyphTop
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
    Layout = blGlyphTop
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
