object FrmCFOP: TFrmCFOP
  Left = 294
  Top = 199
  AutoSize = True
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Consulta de CFOP'
  ClientHeight = 298
  ClientWidth = 736
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 736
    Height = 298
  end
  object LblMdConsulta: TLabel
    Left = 221
    Top = 7
    Width = 117
    Height = 13
    Caption = 'Texto para Pesquisa'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblListados: TLabel
    Left = 221
    Top = 51
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
  object DBGrid1: TDBGrid
    Left = 1
    Top = 67
    Width = 734
    Height = 193
    Hint = 'Resultado da pesquisa'
    Color = clInfoBk
    DataSource = DsConsulta
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ParentFont = False
    ParentShowHint = False
    PopupMenu = PopupMenu1
    ShowHint = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'cdCFOP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        PickList.Strings = (
          '')
        Title.Caption = 'CFOP'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 37
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cdSubCFOP'
        Title.Caption = 'Sub'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 24
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dsCFOP_Sai_na_Nota'
        Title.Caption = 'Natureza da Opera'#231#227'o'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 247
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dsCFOP'
        Title.Caption = 'Descri'#231#227'o do CFOP'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 389
        Visible = True
      end>
  end
  object RadioGroup1: TRadioGroup
    Left = 1
    Top = 1
    Width = 213
    Height = 66
    Caption = 'Pesquisar por'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ItemIndex = 0
    Items.Strings = (
      'F2 CFOP'
      'F3 Natureza da Opera'#231#227'o'
      'F4 Descri'#231#227'o do CFOP')
    ParentFont = False
    PopupMenu = PopupMenu1
    TabOrder = 0
    OnClick = RadioGroup1Click
  end
  object BtnMdPrimeiro: TBitBtn
    Left = 27
    Top = 263
    Width = 86
    Height = 31
    Hint = 'Primeiro registro'
    Caption = '&Primeiro'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    PopupMenu = PopupMenu1
    ShowHint = True
    TabOrder = 3
    OnClick = BtnMdPrimeiroClick
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
  end
  object BtnMdAnterior: TBitBtn
    Left = 330
    Top = 263
    Width = 86
    Height = 31
    Hint = 'Registro antrerior'
    Caption = 'An&terior'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    PopupMenu = PopupMenu1
    ShowHint = True
    TabOrder = 4
    OnClick = BtnMdAnteriorClick
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
  end
  object BtnMdProximo: TBitBtn
    Left = 168
    Top = 263
    Width = 86
    Height = 31
    Hint = 'Pr'#243'ximo registro'
    Caption = 'Pr'#243'&ximo'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    PopupMenu = PopupMenu1
    ShowHint = True
    TabOrder = 5
    OnClick = BtnMdProximoClick
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
  end
  object BtnMdUltimo: TBitBtn
    Left = 482
    Top = 263
    Width = 86
    Height = 31
    Hint = #218'ltimo registro'
    Caption = #218'ti&mo'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    PopupMenu = PopupMenu1
    ShowHint = True
    TabOrder = 6
    OnClick = BtnMdUltimoClick
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
  end
  object BtnMdSair: TBitBtn
    Left = 623
    Top = 263
    Width = 87
    Height = 31
    Hint = 'Fecha este formul'#225'rio'
    Caption = 'Sai&r'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    PopupMenu = PopupMenu1
    TabOrder = 7
    OnClick = BtnMdSairClick
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
  end
  object EdtConsulta: TEdit
    Left = 221
    Top = 22
    Width = 483
    Height = 28
    Hint = 'Digite aqui o texto para filtro'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MaxLength = 35
    ParentFont = False
    ParentShowHint = False
    PopupMenu = PopupMenu1
    ShowHint = True
    TabOrder = 1
    OnChange = EdtConsultaChange
    OnKeyDown = EdtConsultaKeyDown
    OnKeyPress = EdtConsultaKeyPress
  end
  object DsConsulta: TDataSource
    DataSet = ADOQryConsulta
    Left = 252
    Top = 188
  end
  object PopupMenu1: TPopupMenu
    Left = 288
    Top = 184
    object Banese1: TMenuItem
      Caption = 'CFOP'
      ShortCut = 113
      OnClick = Banese1Click
    end
    object HiperCard1: TMenuItem
      Caption = 'Natureza da Opera'#231#227'o'
      ShortCut = 114
      OnClick = HiperCard1Click
    end
    object RedeCard1: TMenuItem
      Caption = 'Descri'#231#227'o do CFOP'
      ShortCut = 115
      OnClick = RedeCard1Click
    end
    object Limpatextoparapesquisa1: TMenuItem
      Caption = 'Limpa texto para pesquisa'
      ShortCut = 32776
      OnClick = Limpatextoparapesquisa1Click
    end
  end
  object ADOQryConsulta: TADOQuery
    Connection = DModulo.Conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select cdCFOP,cdSubCFOP,dsCFOP,dsCFOP_Sai_na_Nota,'
      'CFP_flGeraDebitoCredito_ICMS From CFOP'
      '')
    Left = 328
    Top = 184
    object ADOQryConsultacdCFOP: TStringField
      FieldName = 'cdCFOP'
      Size = 4
    end
    object ADOQryConsultacdSubCFOP: TStringField
      FieldName = 'cdSubCFOP'
      Size = 2
    end
    object ADOQryConsultadsCFOP: TStringField
      FieldName = 'dsCFOP'
      Size = 120
    end
    object ADOQryConsultadsCFOP_Sai_na_Nota: TStringField
      FieldName = 'dsCFOP_Sai_na_Nota'
      Size = 30
    end
    object ADOQryConsultaCFP_flGeraDebitoCredito_ICMS: TStringField
      FieldName = 'CFP_flGeraDebitoCredito_ICMS'
      Size = 1
    end
  end
  object ADOQryAux: TADOQuery
    Connection = DModulo.Conexao
    Parameters = <>
    Left = 368
    Top = 184
  end
end
