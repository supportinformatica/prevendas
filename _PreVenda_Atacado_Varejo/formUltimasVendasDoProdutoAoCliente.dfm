object frmUltimasVendasDoProdutoAoCliente: TfrmUltimasVendasDoProdutoAoCliente
  Left = 0
  Top = 0
  Caption = #218'ltimas vendas do produto ao cliente'
  ClientHeight = 314
  ClientWidth = 490
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyUp = FormKeyUp
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 40
    Top = 58
    Width = 312
    Height = 29
    Caption = #218'ltimas vendas do produto'
    Font.Charset = ANSI_CHARSET
    Font.Color = 6710886
    Font.Height = -24
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblProduto: TLabel
    Left = 40
    Top = 34
    Width = 57
    Height = 16
    Caption = 'Produto:'
    Font.Charset = ANSI_CHARSET
    Font.Color = 6710886
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblCliente: TLabel
    Left = 40
    Top = 18
    Width = 61
    Height = 16
    Caption = 'Cliente .: '
    Font.Charset = ANSI_CHARSET
    Font.Color = 6710886
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object gridLista: TStringGrid
    Left = 40
    Top = 96
    Width = 411
    Height = 153
    ColCount = 4
    FixedCols = 0
    RowCount = 6
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 6710886
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    ParentFont = False
    TabOrder = 0
    ColWidths = (
      85
      85
      115
      119)
  end
  object btnSair: TBitBtn
    Left = 366
    Top = 270
    Width = 85
    Height = 35
    Caption = 'Sai&r'
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
    TabOrder = 1
    OnClick = btnSairClick
  end
end
