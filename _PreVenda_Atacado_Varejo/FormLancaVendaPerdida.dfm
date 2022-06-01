object FrmLancaVendaPerdida: TFrmLancaVendaPerdida
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Registrar Venda Perdida'
  ClientHeight = 199
  ClientWidth = 349
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 27
    Top = 94
    Width = 56
    Height = 13
    Caption = 'Quantidade'
  end
  object Label4: TLabel
    Left = 89
    Top = 94
    Width = 57
    Height = 13
    Caption = 'Justificativa'
  end
  object EdtQtd: TEdit
    Left = 27
    Top = 110
    Width = 56
    Height = 21
    TabOrder = 1
    OnKeyPress = EdtQtdKeyPress
  end
  object BtnConfirmar: TBitBtn
    Left = 116
    Top = 158
    Width = 97
    Height = 28
    Hint = 'Confirmar Justificativa'
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
    NumGlyphs = 2
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    Spacing = 1
    TabOrder = 3
    OnClick = BtnConfirmarClick
  end
  object BtnCancelar: TBitBtn
    Left = 228
    Top = 158
    Width = 97
    Height = 28
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
    NumGlyphs = 2
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    Spacing = 1
    TabOrder = 4
    OnClick = BtnCancelarClick
  end
  object GroupBox1: TGroupBox
    Left = 16
    Top = 8
    Width = 321
    Height = 74
    Caption = 'Produto'
    TabOrder = 0
    object Label1: TLabel
      Left = 72
      Top = 23
      Width = 46
      Height = 13
      Caption = 'Descri'#231#227'o'
    end
    object Label3: TLabel
      Left = 11
      Top = 23
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object EdtProduto: TEdit
      Left = 72
      Top = 39
      Width = 237
      Height = 21
      Color = clInfoBk
      Enabled = False
      TabOrder = 1
    end
    object EdtCdProduto: TEdit
      Left = 11
      Top = 39
      Width = 55
      Height = 21
      Color = clInfoBk
      Enabled = False
      TabOrder = 0
    end
  end
  object EdtJustificativa: TEdit
    Left = 89
    Top = 110
    Width = 236
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 45
    TabOrder = 2
  end
end
