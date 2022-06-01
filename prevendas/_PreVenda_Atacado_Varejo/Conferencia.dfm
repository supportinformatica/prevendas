object frmConferencia: TfrmConferencia
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Confer'#234'ncia'
  ClientHeight = 568
  ClientWidth = 762
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  PopupMenu = PopupMenu1
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 642
    Height = 554
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 13
      Width = 38
      Height = 13
      Caption = 'C'#243'digo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 24
      Top = 61
      Width = 59
      Height = 13
      Caption = 'Pr'#233'-Venda'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 24
      Top = 109
      Width = 64
      Height = 13
      Caption = 'C'#243'd. Barras'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 168
      Top = 13
      Width = 65
      Height = 13
      Caption = 'Funcion'#225'rio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object sgitens: TStringGrid
      Left = 24
      Top = 176
      Width = 593
      Height = 365
      TabStop = False
      ColCount = 3
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      TabOrder = 3
      OnDrawCell = sgitensDrawCell
      OnKeyDown = sgitensKeyDown
      OnKeyPress = sgitensKeyPress
      OnKeyUp = sgitensKeyUp
      ColWidths = (
        119
        326
        92)
      RowHeights = (
        24
        24)
    end
    object edtcdBarrasProduto: TEdit
      Left = 24
      Top = 128
      Width = 441
      Height = 21
      TabOrder = 2
      OnExit = edtcdBarrasProdutoExit
    end
    object edtPreVenda: TEdit
      Left = 24
      Top = 80
      Width = 121
      Height = 21
      TabOrder = 1
      OnExit = edtPreVendaExit
      OnKeyPress = edtPreVendaKeyPress
    end
    object edtcdFuncionario: TEdit
      Left = 24
      Top = 32
      Width = 121
      Height = 21
      Enabled = False
      TabOrder = 0
      OnExit = edtcdFuncionarioExit
    end
    object edtnmFuncionario: TEdit
      Left = 168
      Top = 32
      Width = 449
      Height = 21
      TabStop = False
      Enabled = False
      ReadOnly = True
      TabOrder = 4
    end
    object btnPesquisar: TBitBtn
      Left = 472
      Top = 128
      Width = 145
      Height = 22
      Caption = 'Conferido'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      TabStop = False
      OnClick = btnPesquisarClick
    end
  end
  object GroupBox2: TGroupBox
    Left = 656
    Top = 8
    Width = 99
    Height = 554
    TabOrder = 1
    object btnSalvar: TBitBtn
      Left = 3
      Top = 13
      Width = 93
      Height = 39
      Caption = 'F9 Salvar'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      TabStop = False
      OnClick = btnSalvarClick
    end
    object BitBtn2: TBitBtn
      Left = 3
      Top = 502
      Width = 93
      Height = 39
      Cancel = True
      Caption = 'ESC-Sair'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      TabStop = False
      OnClick = BitBtn2Click
    end
    object btnCancelar: TBitBtn
      Left = 3
      Top = 57
      Width = 93
      Height = 39
      Caption = 'Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      TabStop = False
      OnClick = btnCancelarClick
    end
  end
  object adoSalvar: TADOQuery
    Connection = DModulo.Conexao
    Parameters = <>
    Left = 456
    Top = 72
  end
  object adoItens: TADOQuery
    Connection = DModulo.Conexao
    Parameters = <>
    Left = 528
    Top = 80
  end
  object PopupMenu1: TPopupMenu
    Left = 424
    Top = 256
    object Salvar1: TMenuItem
      Caption = 'Salvar'
      Enabled = False
      ShortCut = 120
      OnClick = Salvar1Click
    end
  end
end
