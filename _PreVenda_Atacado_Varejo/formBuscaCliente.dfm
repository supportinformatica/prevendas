object frmBuscaCliente: TfrmBuscaCliente
  Left = 390
  Top = 439
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Buscar cliente'
  ClientHeight = 122
  ClientWidth = 493
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = popup
  Position = poMainFormCenter
  OnCreate = FormCreate
  DesignSize = (
    493
    122)
  PixelsPerInch = 96
  TextHeight = 13
  object Shape1: TShape
    Left = 127
    Top = 7
    Width = 362
    Height = 108
    Anchors = [akLeft, akTop, akRight, akBottom]
    Brush.Style = bsClear
    Pen.Color = clSilver
  end
  object lblTitulo: TLabel
    Left = 135
    Top = 20
    Width = 52
    Height = 13
    Caption = 'CNPJ/CPF'
  end
  object cbxBusca: TComboBox
    Left = 135
    Top = 62
    Width = 349
    Height = 21
    Anchors = [akLeft, akRight]
    TabOrder = 0
    OnKeyPress = cbxBuscaKeyPress
  end
  object rgBusca: TRadioGroup
    Left = 6
    Top = 1
    Width = 119
    Height = 114
    Anchors = [akLeft, akTop, akBottom]
    Caption = ' Buscar por: '
    ItemIndex = 0
    Items.Strings = (
      'CNPJ/CPF - F2'
      'Apelido - F3'
      'C'#243'digo - F4'
      'Raz'#227'o Social - F5')
    TabOrder = 1
    TabStop = True
    OnClick = rgBuscaClick
  end
  object qryBuscar: TADOQuery
    Connection = DModulo.Conexao
    Parameters = <>
    Left = 360
    Top = 8
  end
  object popup: TPopupMenu
    Left = 248
    Top = 8
    object PesquisarporCNPJCPF1: TMenuItem
      Caption = 'Pesquisar por CNPJ/CPF'
      ShortCut = 113
      OnClick = PesquisarporCNPJCPF1Click
    end
    object Pesquisarporapelido1: TMenuItem
      Caption = 'Pesquisar por apelido'
      ShortCut = 114
      OnClick = Pesquisarporapelido1Click
    end
    object PesquisarporCdigo1: TMenuItem
      Caption = 'Pesquisar por c'#243'digo'
      ShortCut = 115
      OnClick = PesquisarporCdigo1Click
    end
    object RazoSocial1: TMenuItem
      Caption = 'Pesquisar por Raz'#227'o Social'
      ShortCut = 116
      OnClick = RazoSocial1Click
    end
  end
end
