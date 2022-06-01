object FormDesconto: TFormDesconto
  Left = 179
  Top = 244
  BorderIcons = []
  Caption = 'Valor para resgate'
  ClientHeight = 155
  ClientWidth = 244
  Color = 16776176
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 46
    Top = 46
    Width = 152
    Height = 13
    Caption = 'Digite o valor para resgate'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 106
    Top = 135
    Width = 133
    Height = 13
    Caption = 'Pressione ESC para retornar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 58
    Top = 63
    Width = 126
    Height = 32
    Hint = 'Digite o valor do total para calculo do desconto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    Text = '0,00'
    OnExit = Edit1Exit
    OnKeyPress = Edit1KeyPress
  end
  object Editor: TRichEdit
    Left = 3
    Top = 20
    Width = 94
    Height = 13
    Hint = 'Visualiza'#231#227'o dos items selecionados'
    BorderStyle = bsNone
    Color = clInfoBk
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -29
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Lines.Strings = (
      'ARQ'
      'UIV'
      'O '
      'TEXT'
      'O')
    ParentFont = False
    ParentShowHint = False
    PlainText = True
    ScrollBars = ssBoth
    ShowHint = True
    TabOrder = 1
    Visible = False
    Zoom = 100
  end
end
