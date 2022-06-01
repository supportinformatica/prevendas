object FrmInfo: TFrmInfo
  Left = 382
  Top = 527
  AlphaBlend = True
  AlphaBlendValue = 225
  BorderIcons = []
  BorderStyle = bsNone
  ClientHeight = 185
  ClientWidth = 217
  Color = 16776176
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = PopupMenu1
  Visible = True
  DesignSize = (
    217
    185)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 102
    Height = 16
    Caption = 'C'#243'digo do produto'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'Arial Narrow'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblCodigo: TLabel
    Left = 144
    Top = 8
    Width = 12
    Height = 16
    Caption = '<>'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Narrow'
    Font.Style = []
    ParentFont = False
  end
  object lblFaltam: TLabel
    Left = 144
    Top = 32
    Width = 12
    Height = 16
    Caption = '<>'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Narrow'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 32
    Width = 35
    Height = 16
    Caption = 'Faltam'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'Arial Narrow'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 56
    Width = 78
    Height = 16
    Caption = 'Qtd em reserva'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'Arial Narrow'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblQtd: TLabel
    Left = 144
    Top = 56
    Width = 12
    Height = 16
    Caption = '<>'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Narrow'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 8
    Top = 80
    Width = 155
    Height = 16
    Caption = 'Prevenda | Quantidade | Data '
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'Arial Narrow'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object mmInfo: TMemo
    Left = 8
    Top = 98
    Width = 201
    Height = 77
    Anchors = [akLeft, akBottom]
    BorderStyle = bsNone
    Color = 16776176
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Narrow'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 0
    WordWrap = False
  end
  object PopupMenu1: TPopupMenu
    Left = 173
    Top = 24
    object Cancelar1: TMenuItem
      Caption = 'Sair'
      ShortCut = 27
      OnClick = Cancelar1Click
    end
  end
end
