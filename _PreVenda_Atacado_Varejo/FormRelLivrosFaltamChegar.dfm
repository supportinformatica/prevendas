inherited FrmRelLivrosFaltamChegar: TFrmRelLivrosFaltamChegar
  Caption = 'FrmRelLivrosFaltamChegar'
  ClientWidth = 1315
  Visible = False
  ExplicitWidth = 1331
  PixelsPerInch = 96
  TextHeight = 13
  inherited QRMdRel: TQuickRep
    Top = 64
    Width = 979
    Height = 1267
    BeforePrint = QRMdRelBeforePrint
    DataSet = ADOQryRelDados
    Functions.DATA = (
      '0'
      '0'
      #39#39)
    Page.Values = (
      100.000000000000000000
      2794.000000000000000000
      100.000000000000000000
      2159.000000000000000000
      50.000000000000000000
      50.000000000000000000
      0.000000000000000000)
    Zoom = 120
    ExplicitTop = 64
    ExplicitWidth = 979
    ExplicitHeight = 1267
    inherited QRB1: TQRBand
      Left = 23
      Top = 45
      Width = 934
      Height = 104
      Size.Values = (
        229.305555555555600000
        2059.340277777778000000)
      ExplicitLeft = 23
      ExplicitTop = 45
      ExplicitWidth = 934
      ExplicitHeight = 104
      inherited QRLblEmpresa: TQRLabel
        Width = 138
        Height = 25
        Size.Values = (
          55.121527777777780000
          2.204861111111111000
          2.204861111111111000
          304.270833333333300000)
        FontSize = 10
        ExplicitWidth = 138
        ExplicitHeight = 25
      end
      inherited QRSysData1: TQRSysData
        Left = 847
        Width = 55
        Height = 23
        Size.Values = (
          50.711805555555560000
          1867.517361111111000000
          2.204861111111111000
          121.267361111111100000)
        Font.Height = -13
        FontSize = 10
        ExplicitLeft = 847
        ExplicitWidth = 55
        ExplicitHeight = 23
      end
      inherited QRLblPrograma: TQRLabel
        Top = 25
        Width = 112
        Height = 24
        Size.Values = (
          52.916666666666670000
          0.000000000000000000
          55.121527777777780000
          246.944444444444400000)
        FontSize = 10
        ExplicitTop = 25
        ExplicitWidth = 112
        ExplicitHeight = 24
      end
      inherited QRLblTitulo: TQRLabel
        Left = 126
        Top = 25
        Width = 194
        Height = 24
        Size.Values = (
          52.916666666666670000
          277.812500000000000000
          55.121527777777780000
          427.743055555555600000)
        Caption = 'Livros que faltam chegar'
        FontSize = 10
        ExplicitLeft = 126
        ExplicitTop = 25
        ExplicitWidth = 194
        ExplicitHeight = 24
      end
      inherited QRSysData2: TQRSysData
        Left = 714
        Top = 25
        Width = 82
        Height = 23
        Size.Values = (
          50.711805555555560000
          1574.270833333333000000
          55.121527777777780000
          180.798611111111100000)
        Font.Height = -13
        FontSize = 10
        ExplicitLeft = 714
        ExplicitTop = 25
        ExplicitWidth = 82
        ExplicitHeight = 23
      end
      inherited QRShape1: TQRShape
        Top = 80
        Width = 934
        Height = 1
        Size.Values = (
          2.204861111111111000
          0.000000000000000000
          176.388888888888900000
          2059.340277777778000000)
        ExplicitTop = 80
        ExplicitWidth = 934
        ExplicitHeight = 1
      end
      inherited QRLblPagina: TQRLabel
        Left = 763
        Width = 54
        Height = 23
        Size.Values = (
          50.711805555555560000
          1682.309027777778000000
          2.204861111111111000
          119.062500000000000000)
        Font.Height = -13
        FontSize = 10
        ExplicitLeft = 763
        ExplicitWidth = 54
        ExplicitHeight = 23
      end
      object QRLabel12: TQRLabel
        Left = 126
        Top = 54
        Width = 251
        Height = 24
        Size.Values = (
          52.916666666666670000
          277.812500000000000000
          119.062500000000000000
          553.420138888888900000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Per'#237'odo dos Pedidos de Compra:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QrlPeriodo: TQRLabel
        Left = 380
        Top = 54
        Width = 178
        Height = 24
        Size.Values = (
          52.916666666666670000
          837.847222222222200000
          119.062500000000000000
          392.465277777777800000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = '01/01/2015 a 06/01/2015'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel6: TQRLabel
        Left = 217
        Top = 83
        Width = 48
        Height = 17
        Size.Values = (
          37.482638888888890000
          478.454861111111100000
          183.003472222222200000
          105.833333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Cliente'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLabel7: TQRLabel
        Left = 47
        Top = 83
        Width = 66
        Height = 17
        Size.Values = (
          37.482638888888890000
          103.628472222222200000
          183.003472222222200000
          145.520833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Prevenda'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLabel9: TQRLabel
        Left = 118
        Top = 83
        Width = 34
        Height = 17
        Size.Values = (
          37.482638888888890000
          260.173611111111100000
          183.003472222222200000
          74.965277777777780000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Data'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLabel13: TQRLabel
        Left = 558
        Top = 84
        Width = 52
        Height = 17
        Size.Values = (
          37.482638888888890000
          1230.312500000000000000
          185.208333333333300000
          114.652777777777800000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Apelido'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLabel14: TQRLabel
        Left = 685
        Top = 84
        Width = 60
        Height = 17
        Size.Values = (
          37.482638888888890000
          1510.329861111111000000
          185.208333333333300000
          132.291666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Telefone'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLabel4: TQRLabel
        Left = 464
        Top = 83
        Width = 61
        Height = 17
        Size.Values = (
          37.482638888888890000
          1023.055555555556000000
          183.003472222222200000
          134.496527777777800000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Forra'#231#227'o'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLabel10: TQRLabel
        Left = 1
        Top = 83
        Width = 26
        Height = 17
        Size.Values = (
          37.482638888888890000
          2.204861111111111000
          183.003472222222200000
          57.326388888888890000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Seq'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLabel1: TQRLabel
        Left = 850
        Top = 84
        Width = 25
        Height = 17
        Size.Values = (
          37.482638888888890000
          1874.131944444444000000
          185.208333333333300000
          55.121527777777780000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Sol.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLabel2: TQRLabel
        Left = 893
        Top = 84
        Width = 38
        Height = 17
        Size.Values = (
          37.482638888888890000
          1968.940972222222000000
          185.208333333333300000
          83.784722222222220000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Cheg.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
    end
    object QRBand2: TQRBand
      Left = 23
      Top = 227
      Width = 934
      Height = 19
      AlignToBottom = False
      BeforePrint = QRBand2BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        41.892361111111110000
        2059.340277777778000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbSummary
      object QRLabel5: TQRLabel
        Left = 1
        Top = 3
        Width = 55
        Height = 14
        Size.Values = (
          30.868055555555560000
          2.204861111111111000
          6.614583333333333000
          121.267361111111100000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Listados ->'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 7
      end
      object QrlListados: TQRLabel
        Left = 61
        Top = 3
        Width = 7
        Height = 14
        Size.Values = (
          30.868055555555560000
          134.496527777777800000
          6.614583333333333000
          15.434027777777780000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = '0'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 7
      end
    end
    object QRSubDetail1: TQRSubDetail
      Left = 23
      Top = 208
      Width = 934
      Height = 19
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        41.892361111111110000
        2059.340277777778000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = QRMdRel
      DataSet = AdoQryPedidos
      PrintBefore = False
      PrintIfEmpty = True
      object QRDBText5: TQRDBText
        Left = 551
        Top = 1
        Width = 63
        Height = 16
        Size.Values = (
          35.277777777777780000
          1214.878472222222000000
          2.204861111111111000
          138.906250000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = AdoQryPedidos
        DataField = 'solicitado'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 7
      end
      object QRDBText4: TQRDBText
        Left = 628
        Top = 1
        Width = 60
        Height = 16
        Size.Values = (
          35.277777777777780000
          1384.652777777778000000
          2.204861111111111000
          132.291666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = AdoQryPedidos
        DataField = 'chegado'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 7
      end
      object QRDBText14: TQRDBText
        Left = 754
        Top = 1
        Width = 74
        Height = 16
        Size.Values = (
          35.277777777777780000
          1662.465277777778000000
          2.204861111111111000
          163.159722222222200000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = AdoQryPedidos
        DataField = 'dtchegada'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 7
      end
      object QRDBText13: TQRDBText
        Left = 701
        Top = 1
        Width = 48
        Height = 17
        Size.Values = (
          37.482638888888890000
          1545.607638888889000000
          2.204861111111111000
          105.833333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = AdoQryPedidos
        DataField = 'nrLancto'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 7
      end
    end
    object QRBand1: TQRBand
      Left = 23
      Top = 190
      Width = 934
      Height = 18
      AlignToBottom = False
      BeforePrint = QRBand1BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        39.687500000000000000
        2059.340277777778000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
      object QRDBText1: TQRDBText
        Left = 124
        Top = 1
        Width = 333
        Height = 16
        Size.Values = (
          35.277777777777780000
          273.402777777777800000
          2.204861111111111000
          734.218750000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = ADOQryRelDados
        DataField = 'nmProduto'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 7
      end
      object QRDBText9: TQRDBText
        Left = 82
        Top = 1
        Width = 41
        Height = 16
        Size.Values = (
          35.907738095238100000
          181.428571428571400000
          1.889880952380952000
          90.714285714285710000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = ADOQryRelDados
        DataField = 'cdProduto'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 7
      end
      object QRDBText3: TQRDBText
        Left = 464
        Top = 1
        Width = 72
        Height = 16
        Size.Values = (
          35.277777777777780000
          1023.055555555556000000
          2.204861111111111000
          158.750000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = ADOQryRelDados
        DataField = 'qtdPrevenda'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 7
      end
    end
    object QRGroup1: TQRGroup
      Left = 23
      Top = 149
      Width = 934
      Height = 41
      Frame.DrawTop = True
      Frame.DrawBottom = True
      AlignToBottom = False
      BeforePrint = QRGroup1BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        90.399305555555560000
        2059.340277777778000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'ADOQryRelDados.nrOrcamento'
      Master = QRMdRel
      ReprintOnNewPage = False
      object QRDBText2: TQRDBText
        Left = 227
        Top = 2
        Width = 222
        Height = 17
        Size.Values = (
          37.482638888888890000
          500.503472222222200000
          4.409722222222222000
          489.479166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = ADOQryRelDados
        DataField = 'nmPessoa'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 7
      end
      object QRDBText7: TQRDBText
        Left = 62
        Top = 2
        Width = 66
        Height = 17
        Size.Values = (
          37.482638888888890000
          136.701388888888900000
          4.409722222222222000
          145.520833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = ADOQryRelDados
        DataField = 'nrOrcamento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 7
      end
      object QRDBText8: TQRDBText
        Left = 130
        Top = 2
        Width = 95
        Height = 17
        Size.Values = (
          37.482638888888890000
          286.631944444444400000
          4.409722222222222000
          209.461805555555600000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = ADOQryRelDados
        DataField = 'dtEmissao'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 7
      end
      object QRDBText10: TQRDBText
        Left = 536
        Top = 2
        Width = 106
        Height = 17
        Size.Values = (
          37.482638888888890000
          1181.805555555556000000
          4.409722222222222000
          233.715277777777800000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = ADOQryRelDados
        DataField = 'Apelido'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 7
      end
      object QRDBText11: TQRDBText
        Left = 693
        Top = 2
        Width = 153
        Height = 17
        Size.Values = (
          37.482638888888890000
          1527.968750000000000000
          4.409722222222222000
          337.343750000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = ADOQryRelDados
        DataField = 'tels'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 7
      end
      object QRLblQtd: TQRLabel
        Left = 464
        Top = 22
        Width = 72
        Height = 17
        Size.Values = (
          37.482638888888890000
          1023.055555555556000000
          48.506944444444440000
          158.750000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Qtd Prevenda'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 7
      end
      object QRLblProduto: TQRLabel
        Left = 125
        Top = 21
        Width = 333
        Height = 16
        Size.Values = (
          35.277777777777780000
          275.607638888888900000
          46.302083333333330000
          734.218750000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Produto'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 7
      end
      object QRLlbCodigo: TQRLabel
        Left = 83
        Top = 22
        Width = 36
        Height = 17
        Size.Values = (
          37.482638888888890000
          183.003472222222200000
          48.506944444444440000
          79.375000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'C'#243'digo'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 7
      end
      object QRLblSolicitada: TQRLabel
        Left = 551
        Top = 21
        Width = 68
        Height = 16
        Size.Values = (
          35.277777777777780000
          1214.878472222222000000
          46.302083333333330000
          149.930555555555600000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 'Solicitada'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 7
      end
      object QRLblChegou: TQRLabel
        Left = 628
        Top = 21
        Width = 59
        Height = 16
        Size.Values = (
          35.277777777777780000
          1384.652777777778000000
          46.302083333333330000
          130.086805555555600000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 'Chegou'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 7
      end
      object QRDBText6: TQRDBText
        Left = 454
        Top = 2
        Width = 76
        Height = 17
        Size.Values = (
          37.482638888888890000
          1001.006944444444000000
          4.409722222222222000
          167.569444444444400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = ADOQryRelDados
        DataField = 'tipoForracao'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 7
      end
      object QRDBText12: TQRDBText
        Left = 1
        Top = 3
        Width = 60
        Height = 16
        Size.Values = (
          35.277777777777780000
          2.204861111111111000
          6.614583333333333000
          132.291666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = ADOQryRelDados
        DataField = 'nrOrcamentoDia'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 7
      end
      object QRLblPedido: TQRLabel
        Left = 701
        Top = 22
        Width = 35
        Height = 17
        Size.Values = (
          37.482638888888890000
          1545.607638888889000000
          48.506944444444440000
          77.170138888888890000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Pedido'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 7
      end
      object QRLblDataChegada: TQRLabel
        Left = 754
        Top = 22
        Width = 73
        Height = 17
        Size.Values = (
          37.482638888888890000
          1662.465277777778000000
          48.506944444444440000
          160.954861111111100000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Data Chegada'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 7
      end
      object QrlChegou: TQRLabel
        Left = 893
        Top = 2
        Width = 37
        Height = 17
        Size.Values = (
          37.482638888888890000
          1968.940972222222000000
          4.409722222222222000
          81.579861111111100000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = '0'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 7
      end
      object QrlSolicitou: TQRLabel
        Left = 858
        Top = 2
        Width = 25
        Height = 17
        Size.Values = (
          37.482638888888890000
          1891.770833333333000000
          4.409722222222222000
          55.121527777777780000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = '0'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 7
      end
      object QRDBText15: TQRDBText
        Left = 648
        Top = 3
        Width = 37
        Height = 16
        Size.Values = (
          35.277777777777780000
          1428.750000000000000000
          6.614583333333333000
          81.579861111111110000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = ADOQryRelDados
        DataField = 'Turno'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 7
      end
    end
  end
  inherited ADOQryConfig: TADOQuery
    Left = 216
  end
  inherited ADOQryRelDados: TADOQuery
    CursorType = ctStatic
    SQL.Strings = (
      
        'select DISTINCT O.nrOrcamento, O.dtemissao as dtEmissao, O.tipoF' +
        'orracao, P.cdProduto,'
      
        'P.nmProduto,PE.cdPessoa, PE.nmPessoa, dbo.TELEFONES(PE.cdPessoa)' +
        ' as tels,            '
      
        'case when (PE.Existir = '#39'F'#39') then PF.dsNaturalidade             ' +
        '                   '
      
        '   when (PE.Existir = '#39'J'#39') then PJ.nmContato End as Apelido,    ' +
        '                   '
      'case when O.cdTurno = 1 then '#39'M'#39' '
      '     when O.cdTurno = 2 then '#39'T'#39' '
      '     when O.cdTurno = 3 then '#39'N'#39' '
      '     else '#39#39' end as Turno,            '
      'O.nrOrcamentoDia,(I.nrQtd) as qtdPrevenda'
      
        'from Orcamento O inner join IteOrcamento I on O.nrOrcamento = I.' +
        'nrOrcamento'
      'inner join Pessoa PE on O.cdCliente = PE.cdPessoa'
      'INNER JOIN Produto P WITH(nolock) ON I.cdProduto = P.cdProduto'
      
        'INNER JOIN Pessoa Fornecedor WITH(nolock) ON P.cdPessoa = Fornec' +
        'edor.cdPessoa'
      
        'left join P_Fisica PF on PF.cdPessoa = PE.cdPessoa              ' +
        '                     '
      'left join P_Juridica PJ on PJ.cdPessoa = Pe.cdPessoa       ')
    Left = 144
    Top = 24
    object ADOQryRelDadosnrOrcamento: TIntegerField
      FieldName = 'nrOrcamento'
    end
    object ADOQryRelDadosdtEmissao: TDateTimeField
      FieldName = 'dtEmissao'
    end
    object ADOQryRelDadostipoForracao: TStringField
      FieldName = 'tipoForracao'
      Size = 50
    end
    object ADOQryRelDadoscdProduto: TIntegerField
      FieldName = 'cdProduto'
    end
    object ADOQryRelDadosnmProduto: TStringField
      FieldName = 'nmProduto'
      Size = 40
    end
    object ADOQryRelDadoscdPessoa: TIntegerField
      FieldName = 'cdPessoa'
    end
    object ADOQryRelDadosnmPessoa: TStringField
      FieldName = 'nmPessoa'
      Size = 40
    end
    object ADOQryRelDadostels: TStringField
      FieldName = 'tels'
      ReadOnly = True
      Size = 50
    end
    object ADOQryRelDadosApelido: TStringField
      FieldName = 'Apelido'
      ReadOnly = True
      Size = 35
    end
    object ADOQryRelDadosnrOrcamentoDia: TIntegerField
      FieldName = 'nrOrcamentoDia'
    end
    object ADOQryRelDadosqtdPrevenda: TFloatField
      FieldName = 'qtdPrevenda'
    end
  end
  inherited QRExcelFilter1: TQRExcelFilter
    Left = 864
    Top = 152
  end
  inherited QRPDFFilter1: TQRPDFFilter
    Left = 864
    Top = 96
  end
  inherited QRRTFFilter1: TQRRTFFilter
    Left = 864
    Top = 48
  end
  object AdoQryPedidos: TADOQuery
    Connection = DModulo.Conexao
    CursorType = ctStatic
    CommandTimeout = 60
    Parameters = <>
    SQL.Strings = (
      
        'Select P.nrLancto,L.solicitado, L.recebido as chegado,          ' +
        '  '
      'CASE WHEN I.recebido < I.nrQtd THEN '#39' '#39'                  '
      
        '     ELSE convert(nvarchar(MAX), P.dtchegada, 103) END AS dtcheg' +
        'ada'
      
        'from LivroPedido L inner join PedidoCompra P on L.nrLancto = P.n' +
        'rLancto                 '
      
        'inner join IteOrcamento I on I.nrOrcamento = L.nrOrcamento and I' +
        '.cdProduto = L.cdProduto'
      'where L.nrOrcamento = 451938 and L.cdProduto = 5810')
    Left = 280
    Top = 24
    object AdoQryPedidosnrLancto: TIntegerField
      FieldName = 'nrLancto'
    end
    object AdoQryPedidosdtchegada: TWideMemoField
      FieldName = 'dtchegada'
      ReadOnly = True
      BlobType = ftWideMemo
    end
    object AdoQryPedidossolicitado: TIntegerField
      FieldName = 'solicitado'
    end
    object AdoQryPedidoschegado: TIntegerField
      FieldName = 'chegado'
    end
  end
  object ADOQryResumo: TADOQuery
    Connection = DModulo.Conexao
    CursorType = ctStatic
    CommandTimeout = 60
    Parameters = <>
    SQL.Strings = (
      
        'Select P.nrLancto, I.nrQtd as solicitado, I.recebido as chegado,' +
        '            '
      'CASE WHEN I.recebido < I.nrQtd THEN '#39' '#39'                  '
      
        '     ELSE convert(nvarchar(MAX), P.dtchegada, 103) END AS dtcheg' +
        'ada'
      
        'from LivroPedido L inner join PedidoCompra P on L.nrLancto = P.n' +
        'rLancto                 '
      
        'inner join IteOrcamento I on I.nrOrcamento = L.nrOrcamento and I' +
        '.cdProduto = L.cdProduto'
      'where L.nrOrcamento = 451938 and L.cdProduto = 5810'
      '')
    Left = 368
    Top = 24
  end
end
