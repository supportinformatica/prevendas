object frmAlterProdutoPosAdded: TfrmAlterProdutoPosAdded
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Atualizar dados do item'
  ClientHeight = 336
  ClientWidth = 332
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
    Left = 26
    Top = 106
    Width = 80
    Height = 16
    Caption = 'Pre'#231'o Unit'#225'rio'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 167
    Top = 50
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
  object Label4: TLabel
    Left = 26
    Top = 165
    Width = 74
    Height = 16
    Caption = 'Desconto(%)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 167
    Top = 165
    Width = 111
    Height = 16
    Caption = 'Pre'#231'o Unit'#225'rio Final'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 28
    Top = 229
    Width = 47
    Height = 16
    Caption = 'Subtotal'
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
  object edtPrecoBruto: TEdit
    Left = 24
    Top = 128
    Width = 121
    Height = 21
    TabOrder = 2
    OnChange = edtPrecoBrutoChange
    OnKeyPress = edtPrecoBrutoKeyPress
  end
  object btnAtualizar: TButton
    Left = 189
    Top = 303
    Width = 75
    Height = 25
    Caption = 'Atualizar'
    TabOrder = 6
    OnClick = btnAtualizarClick
  end
  object btnReset: TButton
    Left = 84
    Top = 303
    Width = 75
    Height = 25
    Caption = 'Resetar'
    TabOrder = 7
    OnClick = btnResetClick
  end
  object edtQuantidade: TEdit
    Left = 165
    Top = 72
    Width = 121
    Height = 21
    TabOrder = 1
    OnChange = edtQuantidadeChange
    OnKeyPress = edtPrecoBrutoKeyPress
  end
  object edtDesconto: TEdit
    Left = 24
    Top = 187
    Width = 121
    Height = 21
    TabOrder = 3
    Text = '0,00'
    OnChange = edtDescontoChange
    OnKeyPress = edtDescontoKeyPress
  end
  object edtPrecoLiquido: TEdit
    Left = 165
    Top = 187
    Width = 121
    Height = 21
    Enabled = False
    ReadOnly = True
    TabOrder = 4
    OnKeyPress = edtPrecoLiquidoKeyPress
  end
  object edtSubtotal: TEdit
    Left = 26
    Top = 251
    Width = 121
    Height = 21
    Enabled = False
    ReadOnly = True
    TabOrder = 5
    OnKeyPress = edtPrecoBrutoKeyPress
  end
end
