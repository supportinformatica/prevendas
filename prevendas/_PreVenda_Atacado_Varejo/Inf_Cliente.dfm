object FrmInf_Cliente: TFrmInf_Cliente
  Left = 239
  Top = 469
  AlphaBlend = True
  AlphaBlendValue = 175
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  ClientHeight = 172
  ClientWidth = 310
  Color = 16776176
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poDefault
  OnClose = FormClose
  OnCreate = FormCreate
  OnMouseDown = FormMouseDown
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 34
    Height = 11
    Caption = 'Nome:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -9
    Font.Name = 'Small Fonts'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 32
    Width = 49
    Height = 11
    Caption = 'Endere'#231'o'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -9
    Font.Name = 'Small Fonts'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 32
    Top = 48
    Width = 24
    Height = 11
    Caption = 'Rua:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -9
    Font.Name = 'Small Fonts'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 32
    Top = 80
    Width = 44
    Height = 11
    Caption = 'N'#250'mero:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -9
    Font.Name = 'Small Fonts'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 32
    Top = 96
    Width = 36
    Height = 11
    Caption = 'Bairro:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -9
    Font.Name = 'Small Fonts'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 32
    Top = 112
    Width = 40
    Height = 11
    Caption = 'Estado:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -9
    Font.Name = 'Small Fonts'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label7: TLabel
    Left = 136
    Top = 112
    Width = 39
    Height = 11
    Caption = 'Cidade:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -9
    Font.Name = 'Small Fonts'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label8: TLabel
    Left = 8
    Top = 136
    Width = 49
    Height = 11
    Caption = 'Telefone:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -9
    Font.Name = 'Small Fonts'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblNome: TLabel
    Left = 48
    Top = 8
    Width = 46
    Height = 11
    Caption = 'LblNome'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'Small Fonts'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblRua: TLabel
    Left = 64
    Top = 48
    Width = 36
    Height = 11
    Caption = 'LblRua'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'Small Fonts'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblNumero: TLabel
    Left = 88
    Top = 80
    Width = 56
    Height = 11
    Caption = 'LblNumero'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'Small Fonts'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblBairro: TLabel
    Left = 88
    Top = 96
    Width = 48
    Height = 11
    Caption = 'LblBairro'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'Small Fonts'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblUF: TLabel
    Left = 80
    Top = 112
    Width = 30
    Height = 11
    Caption = 'LblUF'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'Small Fonts'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblCidade: TLabel
    Left = 184
    Top = 112
    Width = 51
    Height = 11
    Caption = 'LblCidade'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'Small Fonts'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblTelefone: TLabel
    Left = 72
    Top = 136
    Width = 28
    Height = 11
    Caption = '         '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'Small Fonts'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Lblcpl: TLabel
    Left = 32
    Top = 64
    Width = 75
    Height = 11
    Caption = 'Complemento:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -9
    Font.Name = 'Small Fonts'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblComplemento: TLabel
    Left = 112
    Top = 64
    Width = 87
    Height = 11
    Caption = 'LblComplemento'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'Small Fonts'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label9: TLabel
    Left = 160
    Top = 80
    Width = 27
    Height = 11
    Caption = 'CEP:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -9
    Font.Name = 'Small Fonts'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblCEP: TLabel
    Left = 192
    Top = 80
    Width = 39
    Height = 11
    Caption = 'LblCEP'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'Small Fonts'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label10: TLabel
    Left = 8
    Top = 152
    Width = 32
    Height = 11
    Caption = 'Email:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -9
    Font.Name = 'Small Fonts'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblEmail: TLabel
    Left = 48
    Top = 152
    Width = 44
    Height = 11
    Caption = 'LblEmail'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'Small Fonts'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblcdPessoa: TLabel
    Left = 232
    Top = 8
    Width = 61
    Height = 13
    Caption = 'LblcdPessoa'
    Visible = False
  end
end
