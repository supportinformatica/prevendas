object FrmConsultaEscolas: TFrmConsultaEscolas
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consulta de Escolas e S'#233'ries'
  ClientHeight = 282
  ClientWidth = 345
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 167
    Top = 6
    Width = 24
    Height = 13
    Caption = 'Filtro'
  end
  object Label2: TLabel
    Left = 8
    Top = 6
    Width = 51
    Height = 13
    Caption = 'Filtrar por:'
  end
  object Label20: TLabel
    Left = 103
    Top = 6
    Width = 46
    Height = 13
    Caption = 'Exerc'#237'cio:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 48
    Width = 328
    Height = 225
    TabStop = False
    DataSource = DsConsulta
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid1DrawColumnCell
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'DsEscola'
        Title.Caption = 'Escola'
        Width = 180
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dsSerie'
        Title.Caption = 'S'#233'rie'
        Width = 119
        Visible = True
      end>
  end
  object EdtFiltro: TEdit
    Left = 167
    Top = 21
    Width = 169
    Height = 21
    TabOrder = 1
    OnChange = EdtFiltroChange
    OnKeyDown = EdtFiltroKeyDown
    OnKeyPress = EdtFiltroKeyPress
  end
  object CbxFiltro: TComboBox
    Left = 8
    Top = 21
    Width = 89
    Height = 21
    ItemIndex = 1
    TabOrder = 2
    TabStop = False
    Text = 'Escola'
    Items.Strings = (
      'Todos'
      'Escola')
  end
  object CbxAno: TComboBox
    Left = 103
    Top = 21
    Width = 58
    Height = 21
    ImeMode = imOpen
    TabOrder = 3
    TabStop = False
  end
  object AdoQryConsulta: TADOQuery
    Connection = DModulo.Conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select L.CdLista, Year(L.Ano) as Ano, E.DsEscola, S.dsSerie'
      'from ListaEscolar L inner join '
      'Escola E on E.CdEscola = L.CdEscola'
      'inner join SerieEscolar S on S.cdSerie = L.cdSerie'
      'order by 2 desc,3,4')
    Left = 104
    Top = 88
    object AdoQryConsultaCdLista: TIntegerField
      FieldName = 'CdLista'
    end
    object AdoQryConsultaAno: TIntegerField
      FieldName = 'Ano'
      ReadOnly = True
    end
    object AdoQryConsultaDsEscola: TStringField
      FieldName = 'DsEscola'
      Size = 60
    end
    object AdoQryConsultadsSerie: TStringField
      FieldName = 'dsSerie'
      Size = 50
    end
  end
  object DsConsulta: TDataSource
    DataSet = AdoQryConsulta
    Left = 200
    Top = 80
  end
  object AdoQryAno: TADOQuery
    Connection = DModulo.Conexao
    Parameters = <>
    SQL.Strings = (
      'select distinct year(ano) as ano'
      'from ListaEscolar with (nolock)'
      'order by 1')
    Left = 205
    Top = 157
  end
end
