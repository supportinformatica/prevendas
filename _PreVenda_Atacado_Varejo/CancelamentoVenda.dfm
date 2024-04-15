object FrmCancelamentoVenda: TFrmCancelamentoVenda
  Left = 445
  Top = 300
  AutoSize = True
  BorderIcons = []
  ClientHeight = 107
  ClientWidth = 317
  Color = clSkyBlue
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
    Left = 184
    Top = 43
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
  object Copyright: TLabel
    Left = 0
    Top = 10
    Width = 317
    Height = 21
    Alignment = taCenter
    AutoSize = False
    Caption = ' Desconto acima do permitido'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'Comic Sans MS'
    Font.Style = [fsBold]
    ParentFont = False
    PopupMenu = PopupMenu
    Transparent = True
    IsControl = True
  end
  object Label2: TLabel
    Left = 6
    Top = 43
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
    Left = 193
    Top = 91
    Width = 122
    Height = 13
    Caption = 'Pressione ESC para sair   '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Shape1: TShape
    Left = 0
    Top = 0
    Width = 5
    Height = 107
    Visible = False
  end
  object EdtSenha: TEdit
    Tag = 1
    Left = 184
    Top = 57
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
    Left = 6
    Top = 57
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
    Top = 34
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
    Top = 34
  end
  object tmr1: TTimer
    Interval = 8000
    OnTimer = tmr1Timer
    Left = 273
    Top = 7
  end
end
