object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object edtSolicitada: TLabeledEdit
    Left = 56
    Top = 80
    Width = 89
    Height = 21
    EditLabel.Width = 66
    EditLabel.Height = 13
    EditLabel.Caption = 'Qtd Solicitada'
    TabOrder = 0
    Text = '16,72'
  end
  object edtEmbalagem: TLabeledEdit
    Left = 253
    Top = 80
    Width = 89
    Height = 21
    EditLabel.Width = 75
    EditLabel.Height = 13
    EditLabel.Caption = 'Qtd Embalagem'
    TabOrder = 1
    Text = '2,20'
  end
  object edtqtdVenda: TLabeledEdit
    Left = 56
    Top = 198
    Width = 89
    Height = 21
    EditLabel.Width = 51
    EditLabel.Height = 13
    EditLabel.Caption = 'Qtd Venda'
    TabOrder = 2
    Text = '0,00'
  end
  object BitBtn1: TBitBtn
    Left = 56
    Top = 132
    Width = 75
    Height = 25
    Caption = 'Calcular'
    TabOrder = 3
    OnClick = BitBtn1Click
  end
  object LabeledEdit1: TLabeledEdit
    Left = 184
    Top = 80
    Width = 42
    Height = 21
    EditLabel.Width = 39
    EditLabel.Height = 13
    EditLabel.Caption = 'Unidade'
    TabOrder = 4
    Text = 'M2'
  end
  object edtCaixas: TLabeledEdit
    Left = 184
    Top = 198
    Width = 89
    Height = 21
    EditLabel.Width = 53
    EditLabel.Height = 13
    EditLabel.Caption = 'Qtd Caixas'
    TabOrder = 5
    Text = '0'
  end
end
