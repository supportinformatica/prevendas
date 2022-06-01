object FormTresEtiquetasViva: TFormTresEtiquetasViva
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Escolha o modelo de etiqueta'
  ClientHeight = 198
  ClientWidth = 248
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object BtnGondolaGrande: TBitBtn
    Left = 18
    Top = 24
    Width = 214
    Height = 40
    Cursor = crHandPoint
    Caption = 'F1 - G'#244'ndola Grande'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ModalResult = 1
    ParentFont = False
    TabOrder = 0
    OnClick = BtnGondolaGrandeClick
  end
  object BtnGondolaPequena: TBitBtn
    Left = 18
    Top = 79
    Width = 214
    Height = 40
    Cursor = crHandPoint
    Caption = 'F2 - G'#244'ndola Pequena'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ModalResult = 3
    ParentFont = False
    TabOrder = 1
    OnClick = BtnGondolaPequenaClick
  end
  object Btn3Colunas: TBitBtn
    Left = 18
    Top = 134
    Width = 214
    Height = 40
    Cursor = crHandPoint
    Caption = 'F3 - 3 colunas'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ModalResult = 2
    ParentFont = False
    TabOrder = 2
    OnClick = Btn3ColunasClick
  end
  object PopupMenu1: TPopupMenu
    Left = 184
    Top = 88
    object Gndolagrande1: TMenuItem
      Caption = 'G'#244'ndola Grande'
      ShortCut = 112
      OnClick = Gndolagrande1Click
    end
    object _BtnGondolaPequena: TMenuItem
      Caption = 'G'#244'ndola Pequena'
      ShortCut = 113
      OnClick = _BtnGondolaPequenaClick
    end
    object btn: TMenuItem
      Caption = '3 Colunas'
      ShortCut = 114
      OnClick = btnClick
    end
  end
end
