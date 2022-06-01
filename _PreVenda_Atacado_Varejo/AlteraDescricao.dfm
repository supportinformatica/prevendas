object FrmDescricao: TFrmDescricao
  Left = 195
  Top = 349
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Confirmar descri'#231#227'o'
  ClientHeight = 157
  ClientWidth = 502
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  PopupMenu = pm1
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  DesignSize = (
    502
    157)
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 292
    Top = 123
    Width = 94
    Height = 31
    Cursor = crHandPoint
    Anchors = [akRight, akBottom]
    Caption = 'F2 &Confirmar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    PopupMenu = pm1
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 391
    Top = 123
    Width = 94
    Height = 31
    Cursor = crHandPoint
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'F4 Cancelar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = Button2Click
  end
  object Panel1: TPanel
    Left = 0
    Top = 1
    Width = 500
    Height = 45
    PopupMenu = pm1
    TabOrder = 2
    object Label1: TLabel
      Left = 5
      Top = 4
      Width = 123
      Height = 13
      Caption = 'Descri'#231#227'o do produto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object EdtDescricao: TEdit
      Left = 5
      Top = 20
      Width = 480
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 60
      PopupMenu = pm1
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 46
    Width = 500
    Height = 75
    PopupMenu = pm1
    TabOrder = 3
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 313
      Height = 69
      Caption = ' Dados da sa'#237'da  '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object Label2: TLabel
        Left = 101
        Top = 20
        Width = 40
        Height = 13
        Caption = 'Unidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label51: TLabel
        Left = 8
        Top = 20
        Width = 55
        Height = 13
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label52: TLabel
        Left = 210
        Top = 20
        Width = 93
        Height = 13
        Caption = 'Fator de Convers'#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object btnDiv: TSpeedButton
        Left = 192
        Top = 46
        Width = 14
        Height = 14
        GroupIndex = 1
        Caption = #247
        Margin = 0
        OnClick = btnDivClick
      end
      object btnMult: TSpeedButton
        Left = 192
        Top = 33
        Width = 14
        Height = 14
        GroupIndex = 1
        Down = True
        Caption = #215
        Margin = 0
        OnClick = btnMultClick
      end
      object EdtUnidade: TEdit
        Left = 101
        Top = 36
        Width = 88
        Height = 21
        MaxLength = 3
        PopupMenu = pm1
        TabOrder = 1
      end
      object EdtQtd: TEdit
        Left = 8
        Top = 36
        Width = 88
        Height = 21
        ParentShowHint = False
        PopupMenu = pm1
        ShowHint = True
        TabOrder = 0
        Text = '0,00'
        OnExit = EdtFatorExit
      end
      object EdtFator: TEdit
        Left = 210
        Top = 36
        Width = 95
        Height = 21
        ParentShowHint = False
        PopupMenu = pm1
        ShowHint = True
        TabOrder = 2
        Text = '0,00'
        OnExit = EdtFatorExit
      end
    end
    object GroupBox2: TGroupBox
      Left = 321
      Top = 1
      Width = 169
      Height = 69
      Caption = ' Dados do cadastro '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object Label3: TLabel
        Left = 5
        Top = 20
        Width = 79
        Height = 13
        Caption = 'Qtd Sa'#237'da Estoq'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 95
        Top = 20
        Width = 40
        Height = 13
        Caption = 'Unidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object EdtQtdSai: TEdit
        Left = 6
        Top = 36
        Width = 84
        Height = 21
        TabStop = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 10
        ParentFont = False
        ParentShowHint = False
        PopupMenu = pm1
        ShowHint = True
        TabOrder = 0
        Text = '0,000'
        OnExit = EdtQtdSaiExit
      end
      object EdtUndCad: TEdit
        Left = 95
        Top = 36
        Width = 69
        Height = 21
        TabStop = False
        Color = clInfoBk
        MaxLength = 3
        PopupMenu = pm1
        ReadOnly = True
        TabOrder = 1
      end
    end
  end
  object pm1: TPopupMenu
    Left = 184
    object Confirmar1: TMenuItem
      Caption = 'Confirmar'
      ShortCut = 113
      OnClick = Confirmar1Click
    end
    object Cancelar1: TMenuItem
      Caption = 'Cancelar'
      ShortCut = 115
      OnClick = Cancelar1Click
    end
  end
end
