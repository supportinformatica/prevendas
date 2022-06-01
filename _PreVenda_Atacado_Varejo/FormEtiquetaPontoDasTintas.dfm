object FrmEtiquetaPontoDasTintas: TFrmEtiquetaPontoDasTintas
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Impress'#227'o de Etiqueta'
  ClientHeight = 252
  ClientWidth = 392
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object BtnGrande: TBitBtn
    Left = 24
    Top = 49
    Width = 153
    Height = 81
    Caption = 'Grande'
    Default = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = BtnGrandeClick
  end
  object BtnPequeno: TBitBtn
    Left = 216
    Top = 49
    Width = 153
    Height = 81
    Caption = 'Pequeno'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = BtnPequenoClick
  end
  object BitBtn1: TBitBtn
    Left = 264
    Top = 203
    Width = 105
    Height = 32
    Caption = 'Sair'
    TabOrder = 3
    OnClick = BitBtn1Click
  end
  object BtnBoletoEmAnexo: TBitBtn
    Left = 264
    Top = 151
    Width = 105
    Height = 34
    Caption = 'Boleto Em Anexo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = BtnBoletoEmAnexoClick
  end
end
