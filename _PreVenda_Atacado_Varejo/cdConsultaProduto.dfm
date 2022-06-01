object FrmConsultaProduto: TFrmConsultaProduto
  Left = 255
  Top = 187
  Hint = 'Consulta de produtos'
  AutoSize = True
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSizeToolWin
  Caption = 'Consulta Produto'
  ClientHeight = 241
  ClientWidth = 433
  Color = 16767692
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = PopupMenu1
  Position = poScreenCenter
  ShowHint = True
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 433
    Height = 241
    Align = alClient
  end
  object Label2: TLabel
    Left = 9
    Top = 20
    Width = 82
    Height = 16
    Caption = 'Cd Barras..:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 9
    Top = 39
    Width = 81
    Height = 16
    Caption = 'Refer'#234'ncia:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 9
    Top = 2
    Width = 79
    Height = 16
    Caption = 'Produto.....:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 9
    Top = 60
    Width = 79
    Height = 16
    Caption = 'Fabricante:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Pedido: TLabel
    Left = 9
    Top = 192
    Width = 63
    Height = 16
    Caption = 'Pedido..:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Estoque: TLabel
    Left = 9
    Top = 212
    Width = 62
    Height = 16
    Caption = 'Estoque:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblCodigo: TLabel
    Left = 89
    Top = 2
    Width = 51
    Height = 16
    Caption = 'C'#243'digo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblBarras: TLabel
    Left = 91
    Top = 20
    Width = 83
    Height = 16
    Caption = 'Cod_Barras'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblReferencia: TLabel
    Left = 91
    Top = 39
    Width = 77
    Height = 16
    Caption = 'Referencia'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblDescricao: TLabel
    Left = 143
    Top = 2
    Width = 72
    Height = 16
    Caption = 'Descri'#231#227'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblFabricante: TLabel
    Left = 91
    Top = 60
    Width = 75
    Height = 16
    Caption = 'Fabricante'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblEstoque: TLabel
    Left = 104
    Top = 192
    Width = 29
    Height = 16
    Alignment = taRightJustify
    Caption = '0,00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblControle: TLabel
    Left = 104
    Top = 212
    Width = 29
    Height = 16
    Alignment = taRightJustify
    Caption = '0,00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label9: TLabel
    Left = 277
    Top = 212
    Width = 148
    Height = 15
    Caption = 'Pressione "ESC" para sair'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object PnlTotal: TPanel
    Left = 4
    Top = 82
    Width = 425
    Height = 106
    TabOrder = 0
    object Label10: TLabel
      Left = 9
      Top = 10
      Width = 148
      Height = 16
      Caption = 'Pre'#231'o Compra...........:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LblCompra: TLabel
      Left = 181
      Top = 10
      Width = 29
      Height = 16
      Alignment = taRightJustify
      Caption = '0,00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label20: TLabel
      Left = 9
      Top = 33
      Width = 145
      Height = 16
      Caption = 'Custo Aquisi'#231#227'o.......:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblAquisicao: TLabel
      Left = 181
      Top = 33
      Width = 29
      Height = 16
      Hint = 'Cliente'
      Alignment = taRightJustify
      Caption = '0,00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object Label13: TLabel
      Left = 9
      Top = 77
      Width = 155
      Height = 16
      AutoSize = False
      Caption = 'Custo Final Atacado:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
    end
    object LblCustoFinalVarejo: TLabel
      Left = 181
      Top = 56
      Width = 29
      Height = 16
      Hint = 'Cliente'
      Alignment = taRightJustify
      Caption = '0,00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object LblCustoFinalAtacao: TLabel
      Left = 181
      Top = 78
      Width = 29
      Height = 16
      Hint = 'Cliente'
      Alignment = taRightJustify
      Caption = '0,00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object Label14: TLabel
      Left = 9
      Top = 55
      Width = 144
      Height = 16
      AutoSize = False
      Caption = 'Custo Final Varejo...:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
    end
    object Label6: TLabel
      Left = 216
      Top = 55
      Width = 112
      Height = 16
      Caption = 'Pre'#231'o Varejo....:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LblValor: TLabel
      Left = 340
      Top = 55
      Width = 29
      Height = 16
      Caption = '0,00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 216
      Top = 77
      Width = 108
      Height = 16
      Caption = 'Pre'#231'o Atacado:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblValorAtacado: TLabel
      Left = 340
      Top = 77
      Width = 29
      Height = 16
      Caption = '0,00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 280
    Top = 19
    object Essc1: TMenuItem
      Caption = 'Esc'
    end
  end
end
