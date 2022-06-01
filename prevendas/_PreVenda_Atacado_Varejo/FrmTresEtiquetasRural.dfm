object FormTresEtiquetasRural: TFormTresEtiquetasRural
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Escolha o modelo de etiqueta'
  ClientHeight = 193
  ClientWidth = 249
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = PopupMenu1
  PixelsPerInch = 96
  TextHeight = 13
  object btn1: TBitBtn
    Left = 18
    Top = 24
    Width = 214
    Height = 40
    Cursor = crHandPoint
    Caption = 'F1 - Grande Duplo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ModalResult = 1
    ParentFont = False
    TabOrder = 0
    OnClick = btn1Click
  end
  object btn2: TBitBtn
    Left = 18
    Top = 79
    Width = 214
    Height = 40
    Cursor = crHandPoint
    Caption = 'F2 - Grande Triplo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ModalResult = 3
    ParentFont = False
    TabOrder = 1
    OnClick = btn2Click
  end
  object btn3: TBitBtn
    Left = 18
    Top = 134
    Width = 214
    Height = 40
    Cursor = crHandPoint
    Caption = 'F3 - Pequeno Triplo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ModalResult = 2
    ParentFont = False
    TabOrder = 2
    OnClick = btn3Click
  end
  object PopupMenu1: TPopupMenu
    Left = 184
    Top = 88
    object Gndolagrande1: TMenuItem
      Caption = 'F1 - Grande Duplo'
      ShortCut = 112
      OnClick = Gndolagrande1Click
    end
    object _BtnGondolaPequena: TMenuItem
      Caption = 'F2 - Grande Triplo'
      ShortCut = 113
      OnClick = _BtnGondolaPequenaClick
    end
    object btn: TMenuItem
      Caption = 'F3 - Pequeno Triplo'
      ShortCut = 114
      OnClick = btnClick
    end
  end
end
