object frmAlterProdutoPosAdded: TfrmAlterProdutoPosAdded
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Atualizar dados do item'
  ClientHeight = 293
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
    Left = 30
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
    Left = 30
    Top = 38
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
    Left = 32
    Top = 90
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
    Left = 173
    Top = 38
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
    Left = 32
    Top = 146
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
    Left = 173
    Top = 146
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
    Left = 34
    Top = 204
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
    Left = 30
    Top = 57
    Width = 121
    Height = 21
    MaxLength = 6
    TabOrder = 0
  end
  object edtPrecoBruto: TEdit
    Left = 30
    Top = 109
    Width = 121
    Height = 21
    TabOrder = 2
    OnChange = edtPrecoBrutoChange
    OnKeyPress = edtPrecoBrutoKeyPress
  end
  object btnAtualizar: TButton
    Left = 173
    Top = 258
    Width = 75
    Height = 25
    Hint = 'Confirmar e sair.'
    Caption = 'Confirmar'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    OnClick = btnAtualizarClick
  end
  object btnReset: TButton
    Left = 78
    Top = 258
    Width = 75
    Height = 25
    Hint = 'Voltar ao valor antes da edi'#231#227'o.'
    Caption = 'Resetar'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    OnClick = btnResetClick
  end
  object edtQuantidade: TEdit
    Left = 171
    Top = 57
    Width = 121
    Height = 21
    TabOrder = 1
    OnChange = edtQuantidadeChange
    OnKeyPress = edtPrecoBrutoKeyPress
  end
  object edtDesconto: TEdit
    Left = 30
    Top = 165
    Width = 121
    Height = 21
    TabOrder = 3
    Text = '0,00'
    OnChange = edtDescontoChange
    OnKeyPress = edtDescontoKeyPress
  end
  object edtPrecoLiquido: TEdit
    Left = 171
    Top = 165
    Width = 121
    Height = 21
    Enabled = False
    ReadOnly = True
    TabOrder = 4
    OnKeyPress = edtPrecoLiquidoKeyPress
  end
  object edtSubtotal: TEdit
    Left = 32
    Top = 223
    Width = 121
    Height = 21
    Enabled = False
    ReadOnly = True
    TabOrder = 5
    OnKeyPress = edtPrecoBrutoKeyPress
  end
end
