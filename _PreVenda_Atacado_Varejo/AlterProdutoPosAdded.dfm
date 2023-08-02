object frmAlterProdutoPosAdded: TfrmAlterProdutoPosAdded
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Atualizar dados do item'
  ClientHeight = 199
  ClientWidth = 304
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblProduto: TLabel
    Left = 24
    Top = 8
    Width = 262
    Height = 19
    AutoSize = False
    Caption = '<Descricao>'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 24
    Top = 50
    Width = 46
    Height = 16
    Caption = 'Unidade'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 200
    Top = 106
    Width = 32
    Height = 16
    Caption = 'Pre'#231'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 23
    Top = 106
    Width = 65
    Height = 16
    Caption = 'Quantidade'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object edtUnidade: TEdit
    Left = 24
    Top = 72
    Width = 121
    Height = 21
    MaxLength = 6
    TabOrder = 0
  end
  object edtPreco: TEdit
    Left = 165
    Top = 128
    Width = 121
    Height = 21
    TabOrder = 2
    OnKeyPress = edtPrecoKeyPress
  end
  object btnAtualizar: TButton
    Left = 214
    Top = 166
    Width = 75
    Height = 25
    Caption = 'Atualizar'
    TabOrder = 3
    OnClick = btnAtualizarClick
  end
  object btnReset: TButton
    Left = 133
    Top = 166
    Width = 75
    Height = 25
    Caption = 'Resetar'
    TabOrder = 4
    OnClick = btnResetClick
  end
  object edtQuantidade: TEdit
    Left = 23
    Top = 128
    Width = 121
    Height = 21
    TabOrder = 1
    OnKeyPress = edtPrecoKeyPress
  end
end
