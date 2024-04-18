object FrmCancelamentoVenda: TFrmCancelamentoVenda
  Left = 445
  Top = 300
  AutoSize = True
  BorderIcons = []
  ClientHeight = 112
  ClientWidth = 316
  Color = 15638785
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 183
    Top = 27
    Width = 107
    Height = 13
    Caption = 'Entre com a senha'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    PopupMenu = PopupMenu
  end
  object Label2: TLabel
    Left = 9
    Top = 27
    Width = 44
    Height = 13
    Caption = 'Usu'#225'rio'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 171
    Top = 92
    Width = 145
    Height = 13
    Alignment = taRightJustify
    Caption = 'Pressione ESC para sair  '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Shape1: TShape
    Left = 0
    Top = 0
    Width = 6
    Height = 112
    Brush.Color = 15638785
    Pen.Color = 15638785
  end
  object EdtSenha: TEdit
    Tag = 1
    Left = 183
    Top = 42
    Width = 124
    Height = 28
    Hint = 'Digite a senha e press. ENTER, ou press. ESC para retornar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MaxLength = 8
    ParentFont = False
    ParentShowHint = False
    PasswordChar = '*'
    PopupMenu = PopupMenu
    ShowHint = True
    TabOrder = 0
    OnKeyPress = EdtSenhaKeyPress
  end
  object edtUsuario: TComboBox
    Left = 9
    Top = 42
    Width = 135
    Height = 28
    BevelInner = bvNone
    BevelOuter = bvNone
    CharCase = ecUpperCase
    DragCursor = crHandPoint
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnKeyPress = EdtUsuarioKeyPress
  end
  object PopupMenu: TPopupMenu
    Left = 44
    Top = 19
    object F1Ajuda1: TMenuItem
      Caption = 'Ajuda...'
      Hint = 'Arquivo de Help'
      ShortCut = 112
      OnClick = F1Ajuda1Click
    end
  end
  object ADOQuery1: TADOQuery
    Connection = DModulo.Conexao
    Parameters = <>
    Left = 89
    Top = 19
  end
  object tmr1: TTimer
    Interval = 8000
    OnTimer = tmr1Timer
    Left = 273
    Top = 7
  end
end
