object FrmDataProduzidoValidade: TFrmDataProduzidoValidade
  Left = 0
  Top = 0
  Caption = 'FrmDataProduzidoValidade'
  ClientHeight = 261
  ClientWidth = 341
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object LblDateProduzido: TLabel
    Left = 40
    Top = 26
    Width = 101
    Height = 16
    Caption = 'Data de Produ'#231#227'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object LblDateValidade: TLabel
    Left = 40
    Top = 106
    Width = 97
    Height = 16
    Caption = 'Data de Validade'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object DtProduzido: TDateTimePicker
    Left = 40
    Top = 48
    Width = 265
    Height = 41
    Date = 44911.000000000000000000
    Time = 0.668770717595180000
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object DtValidade: TDateTimePicker
    Left = 40
    Top = 128
    Width = 265
    Height = 41
    Date = 44911.000000000000000000
    Time = 0.668770717595180000
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object BtnConfirmar: TButton
    Left = 40
    Top = 192
    Width = 265
    Height = 41
    Caption = 'CONFIRMAR'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = BtnConfirmarClick
  end
end
