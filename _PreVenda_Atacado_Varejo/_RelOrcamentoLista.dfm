object frmRelOrcamentoLista: TfrmRelOrcamentoLista
  Left = 0
  Top = 0
  Caption = 'Or'#231'amento de Lista'
  ClientHeight = 509
  ClientWidth = 832
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object QuickRep1: TQuickRep
    Left = 0
    Top = -8
    Width = 816
    Height = 1056
    DataSet = ADOQryRelDados
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE')
    Functions.DATA = (
      '0'
      '0'
      #39#39)
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 1
    Page.Orientation = poPortrait
    Page.PaperSize = Letter
    Page.Continuous = False
    Page.Values = (
      100.000000000000000000
      2794.000000000000000000
      100.000000000000000000
      2159.000000000000000000
      100.000000000000000000
      100.000000000000000000
      0.000000000000000000)
    PrinterSettings.Copies = 1
    PrinterSettings.OutputBin = Auto
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.UseStandardprinter = False
    PrinterSettings.UseCustomBinCode = False
    PrinterSettings.CustomBinCode = 0
    PrinterSettings.ExtendedDuplex = 0
    PrinterSettings.UseCustomPaperCode = False
    PrinterSettings.CustomPaperCode = 0
    PrinterSettings.PrintMetaFile = False
    PrinterSettings.PrintQuality = 0
    PrinterSettings.Collate = 0
    PrinterSettings.ColorOption = 0
    PrintIfEmpty = True
    SnapToGrid = True
    Units = MM
    Zoom = 100
    PrevFormStyle = fsStayOnTop
    PreviewInitialState = wsMaximized
    PrevInitialZoom = qrZoomToWidth
    PreviewDefaultSaveType = stQRP
    PreviewLeft = 0
    PreviewTop = 0
    object QRBand2: TQRBand
      Left = 38
      Top = 38
      Width = 740
      Height = 99
      Frame.DrawBottom = True
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        261.937500000000000000
        1957.916666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbTitle
      object QRLabel1: TQRLabel
        Left = 8
        Top = 79
        Width = 63
        Height = 17
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          209.020833333333300000
          166.687500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Descri'#231#227'o'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel2: TQRLabel
        Left = 368
        Top = 79
        Width = 23
        Height = 17
        Size.Values = (
          44.979166666666670000
          973.666666666666700000
          209.020833333333300000
          60.854166666666670000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Qtd'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel3: TQRLabel
        Left = 464
        Top = 79
        Width = 38
        Height = 17
        Size.Values = (
          44.979166666666670000
          1227.666666666667000000
          209.020833333333300000
          100.541666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Pre'#231'o'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel4: TQRLabel
        Left = 552
        Top = 79
        Width = 33
        Height = 17
        Size.Values = (
          44.979166666666670000
          1460.500000000000000000
          209.020833333333300000
          87.312500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Total'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRShape2: TQRShape
        Left = 0
        Top = 74
        Width = 740
        Height = 1
        Size.Values = (
          2.645833333333333000
          0.000000000000000000
          195.791666666666700000
          1957.916666666667000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLblTitulo: TQRLabel
        Left = 528
        Top = 46
        Width = 181
        Height = 26
        Size.Values = (
          68.791666666666670000
          1397.000000000000000000
          121.708333333333300000
          478.895833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = '** Or'#231'amento **'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 16
      end
      object QrlEndereco: TQRLabel
        Left = 3
        Top = 55
        Width = 105
        Height = 15
        Size.Values = (
          39.687500000000000000
          7.937500000000000000
          145.520833333333300000
          277.812500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'endere'#231'o da empresa'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QrlCnpj: TQRLabel
        Left = 3
        Top = 42
        Width = 55
        Height = 14
        Size.Values = (
          37.041666666666670000
          7.937500000000000000
          111.125000000000000000
          145.520833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = '                  '
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLblEmpresa: TQRLabel
        Left = 1
        Top = 13
        Width = 197
        Height = 30
        Size.Values = (
          79.375000000000000000
          2.645833333333333000
          34.395833333333330000
          521.229166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Nome da Empresa'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -24
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 18
      end
    end
    object QRBand3: TQRBand
      Left = 38
      Top = 137
      Width = 740
      Height = 26
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        68.791666666666670000
        1957.916666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
      object QRExpr1: TQRExpr
        Left = 8
        Top = 4
        Width = 173
        Height = 17
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          10.583333333333330000
          457.729166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        ResetAfterPrint = False
        Transparent = False
        Expression = 'ADOQryRelDados.nmProduto'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRExpr2: TQRExpr
        Left = 368
        Top = 4
        Width = 128
        Height = 17
        Size.Values = (
          44.979166666666670000
          973.666666666666700000
          10.583333333333330000
          338.666666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        ResetAfterPrint = False
        Transparent = False
        Expression = 'ADOQryRelDados.qtd'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRExpr3: TQRExpr
        Left = 464
        Top = 4
        Width = 152
        Height = 17
        Size.Values = (
          44.979166666666670000
          1227.666666666667000000
          10.583333333333330000
          402.166666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        ResetAfterPrint = False
        Transparent = False
        Expression = 'ADOQryRelDados.vlPreco'
        Mask = '0.00'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRExpr4: TQRExpr
        Left = 552
        Top = 4
        Width = 138
        Height = 17
        Size.Values = (
          44.979166666666670000
          1460.500000000000000000
          10.583333333333330000
          365.125000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        ResetAfterPrint = False
        Transparent = False
        Expression = 'ADOQryRelDados.Total'
        Mask = '0.00'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
    end
    object QRBand1: TQRBand
      Left = 38
      Top = 163
      Width = 740
      Height = 54
      Frame.DrawTop = True
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        142.875000000000000000
        1957.916666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbSummary
      object QRExpr5: TQRExpr
        Left = 595
        Top = 6
        Width = 184
        Height = 17
        Size.Values = (
          44.979166666666670000
          1574.270833333333000000
          15.875000000000000000
          486.833333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        Expression = 'SUM(ADOQryRelDados.Total)'
        Mask = '0.00'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel5: TQRLabel
        Left = 552
        Top = 6
        Width = 37
        Height = 17
        Size.Values = (
          44.979166666666670000
          1460.500000000000000000
          15.875000000000000000
          97.895833333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Total:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
    end
  end
  object ADOQryRelDados: TADOQuery
    Connection = DModulo.Conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'Select I.CdObjeto,I.dsObjeto,I.qtd,P.nmProduto,i.qtd * P.vlPreco' +
        ' as Total,P.cdProduto,P.dsPrateleira,P.cdFabricante,P.dsReferenc' +
        'ia,P.vlPreco, P.nrQtdReal, '
      
        'P.dsUnidade from ItensLista I with(nolock) inner Join Produto P ' +
        'with(nolock) on I.cdObjeto = P.cdproduto                        ' +
        '                          ')
    Left = 320
    Top = 48
    object ADOQryRelDadosCdObjeto: TIntegerField
      FieldName = 'CdObjeto'
    end
    object ADOQryRelDadosdsObjeto: TStringField
      FieldName = 'dsObjeto'
      Size = 50
    end
    object ADOQryRelDadosqtd: TIntegerField
      FieldName = 'qtd'
    end
    object ADOQryRelDadosnmProduto: TStringField
      FieldName = 'nmProduto'
      Size = 40
    end
    object ADOQryRelDadosTotal: TBCDField
      FieldName = 'Total'
      ReadOnly = True
      DisplayFormat = '0.00'
      Precision = 19
    end
    object ADOQryRelDadoscdProduto: TIntegerField
      FieldName = 'cdProduto'
    end
    object ADOQryRelDadosdsPrateleira: TStringField
      FieldName = 'dsPrateleira'
    end
    object ADOQryRelDadoscdFabricante: TStringField
      FieldName = 'cdFabricante'
      Size = 15
    end
    object ADOQryRelDadosdsReferencia: TStringField
      FieldName = 'dsReferencia'
      Size = 15
    end
    object ADOQryRelDadosvlPreco: TBCDField
      FieldName = 'vlPreco'
      DisplayFormat = '0.00'
      Precision = 19
    end
    object ADOQryRelDadosnrQtdReal: TFloatField
      FieldName = 'nrQtdReal'
    end
    object ADOQryRelDadosdsUnidade: TStringField
      FieldName = 'dsUnidade'
      Size = 4
    end
  end
  object ADOQryConfig: TADOQuery
    Connection = DModulo.Conexao
    Parameters = <>
    SQL.Strings = (
      'Select dsMenPromocional,nmEmpresa,dsPrazoOrcamento,dsEndereco,'
      '           dsCgc,dsInscricao,dsCidade'
      'From Configuracao'
      '')
    Left = 400
    Top = 56
    object ADOQryConfigdsMenPromocional: TStringField
      FieldName = 'dsMenPromocional'
      Size = 50
    end
    object ADOQryConfignmEmpresa: TStringField
      FieldName = 'nmEmpresa'
      Size = 40
    end
    object ADOQryConfigdsPrazoOrcamento: TStringField
      FieldName = 'dsPrazoOrcamento'
      Size = 10
    end
    object ADOQryConfigdsEndereco: TStringField
      FieldName = 'dsEndereco'
      Size = 65
    end
    object ADOQryConfigdsCgc: TStringField
      FieldName = 'dsCgc'
    end
    object ADOQryConfigdsInscricao: TStringField
      FieldName = 'dsInscricao'
      Size = 18
    end
    object ADOQryConfigdsCidade: TStringField
      FieldName = 'dsCidade'
    end
  end
end
