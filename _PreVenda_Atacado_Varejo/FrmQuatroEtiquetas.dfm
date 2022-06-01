object FormQuatroEtiquetas: TFormQuatroEtiquetas
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Escolha o modelo de etiqueta'
  ClientHeight = 251
  ClientWidth = 250
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object btnUnicaGrande: TBitBtn
    Left = 18
    Top = 24
    Width = 214
    Height = 40
    Cursor = crHandPoint
    Caption = 'F1 - '#218'nica Grande'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ModalResult = 1
    ParentFont = False
    TabOrder = 0
    OnClick = btnUnicaGrandeClick
  end
  object BtnDuplaGrande: TBitBtn
    Left = 18
    Top = 79
    Width = 214
    Height = 40
    Cursor = crHandPoint
    Caption = 'F2 - Dupla Grande'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ModalResult = 3
    ParentFont = False
    TabOrder = 1
    OnClick = BtnDuplaGrandeClick
  end
  object BtnTriplaGrande: TBitBtn
    Left = 18
    Top = 134
    Width = 214
    Height = 40
    Cursor = crHandPoint
    Caption = 'F3 - Tripla Grande'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ModalResult = 2
    ParentFont = False
    TabOrder = 2
    OnClick = BtnTriplaGrandeClick
  end
  object btnTriplaPequena: TBitBtn
    Left = 18
    Top = 190
    Width = 214
    Height = 40
    Cursor = crHandPoint
    Caption = 'F4 - Tripla Pequena'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ModalResult = 5
    ParentFont = False
    TabOrder = 3
    OnClick = btnTriplaPequenaClick
  end
  object PopupMenu1: TPopupMenu
    Left = 184
    Top = 88
    object Gndolagrande1: TMenuItem
      Caption = #218'nica Grande'
      ShortCut = 112
      OnClick = Gndolagrande1Click
    end
    object _BtnGondolaPequena: TMenuItem
      Caption = 'Dupla Grande'
      ShortCut = 113
      OnClick = _BtnGondolaPequenaClick
    end
    object btn: TMenuItem
      Caption = 'Tripla Grande'
      ShortCut = 114
      OnClick = btnClick
    end
    object riplaPequena1: TMenuItem
      Caption = 'Tripla Pequena'
      ShortCut = 115
      OnClick = riplaPequena1Click
    end
  end
end
