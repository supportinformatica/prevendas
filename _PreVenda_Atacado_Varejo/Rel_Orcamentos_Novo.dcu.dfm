object frmRel_Orcamento_Novo: TfrmRel_Orcamento_Novo
  Left = 0
  Top = 0
  Caption = 'frmRel_Orcamento_Novo'
  ClientHeight = 874
  ClientWidth = 987
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 14
  object QuickRep1: TQuickRep
    Left = 8
    Top = 0
    Width = 816
    Height = 1056
    ShowingPreview = False
    DataSet = ADOqryreldados
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
    PrinterSettings.MemoryLimit = 1000000
    PrinterSettings.PrintQuality = 0
    PrinterSettings.Collate = 0
    PrinterSettings.ColorOption = 0
    PrintIfEmpty = True
    SnapToGrid = True
    Units = MM
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsMaximized
    PreviewWidth = 500
    PreviewHeight = 500
    PrevInitialZoom = qrZoomToWidth
    PreviewDefaultSaveType = stPDF
    PreviewLeft = 0
    PreviewTop = 0
    object QRBand1: TQRBand
      Left = 38
      Top = 38
      Width = 740
      Height = 444
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        1174.750000000000000000
        1957.916666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbTitle
      object QRLabel19: TQRLabel
        Left = 10
        Top = 421
        Width = 31
        Height = 20
        Size.Values = (
          52.916666666666670000
          26.458333333333330000
          1113.895833333333000000
          82.020833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Itens'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel1: TQRLabel
        Left = 330
        Top = 40
        Width = 93
        Height = 26
        Size.Values = (
          68.791666666666670000
          873.125000000000000000
          105.833333333333300000
          246.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Or'#231'amento'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 14
      end
      object QRPShape1: TQRPShape
        Left = 10
        Top = 80
        Width = 721
        Height = 97
        Size.Values = (
          256.645833333333300000
          26.458333333333330000
          211.666666666666700000
          1907.645833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrpsRectangle
        VertAdjust = 0
        FixBottomPosition = False
        StretchHeightWithBand = False
      end
      object QRLabel8: TQRLabel
        Left = 10
        Top = 180
        Width = 186
        Height = 26
        Size.Values = (
          68.791666666666670000
          26.458333333333330000
          476.250000000000000000
          492.125000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Identifica'#231#227'o do destinat'#225'rio:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel9: TQRLabel
        Left = 10
        Top = 200
        Width = 39
        Height = 20
        Size.Values = (
          52.916666666666670000
          26.458333333333330000
          529.166666666666700000
          103.187500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Nome:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel10: TQRLabel
        Left = 10
        Top = 224
        Width = 60
        Height = 20
        Size.Values = (
          52.916666666666670000
          26.458333333333330000
          592.666666666666700000
          158.750000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Endere'#231'o:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel11: TQRLabel
        Left = 10
        Top = 247
        Width = 34
        Height = 17
        Size.Values = (
          44.979166666666670000
          26.458333333333330000
          653.520833333333300000
          89.958333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fone:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel12: TQRLabel
        Left = 170
        Top = 247
        Width = 38
        Height = 17
        Enabled = False
        Size.Values = (
          44.979166666666670000
          449.791666666666700000
          653.520833333333300000
          100.541666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Email:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRShape1: TQRShape
        Left = 10
        Top = 272
        Width = 721
        Height = 9
        Size.Values = (
          23.812500000000000000
          26.458333333333330000
          719.666666666666700000
          1907.645833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel13: TQRLabel
        Left = 10
        Top = 280
        Width = 148
        Height = 17
        Size.Values = (
          44.979166666666670000
          26.458333333333330000
          740.833333333333300000
          391.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Dados do atendimento:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel14: TQRLabel
        Left = 10
        Top = 302
        Width = 105
        Height = 17
        Size.Values = (
          44.979166666666670000
          26.458333333333330000
          799.041666666666700000
          277.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'N'#176' do Or'#231'amento:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel15: TQRLabel
        Left = 170
        Top = 302
        Width = 32
        Height = 17
        Size.Values = (
          44.979166666666670000
          449.791666666666700000
          799.041666666666700000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Data:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel16: TQRLabel
        Left = 298
        Top = 302
        Width = 78
        Height = 17
        Size.Values = (
          44.979166666666670000
          788.458333333333300000
          799.041666666666700000
          206.375000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Respons'#225'vel:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRShape2: TQRShape
        Left = 10
        Top = 328
        Width = 721
        Height = 9
        Size.Values = (
          23.812500000000000000
          26.458333333333330000
          867.833333333333300000
          1907.645833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel17: TQRLabel
        Left = 10
        Top = 337
        Width = 80
        Height = 17
        Size.Values = (
          44.979166666666670000
          26.458333333333330000
          891.645833333333300000
          211.666666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Observa'#231#227'o:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRShape3: TQRShape
        Left = 10
        Top = 408
        Width = 721
        Height = 9
        Size.Values = (
          23.812500000000000000
          26.458333333333330000
          1079.500000000000000000
          1907.645833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRExpr1: TQRExpr
        Left = 58
        Top = 200
        Width = 140
        Height = 17
        Size.Values = (
          44.979166666666670000
          153.458333333333300000
          529.166666666666700000
          370.416666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        ResetAfterPrint = False
        Transparent = False
        Expression = 'ADOqryreldados.Cliente'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRExpr2: TQRExpr
        Left = 78
        Top = 224
        Width = 155
        Height = 17
        Size.Values = (
          44.979166666666670000
          206.375000000000000000
          592.666666666666700000
          410.104166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        ResetAfterPrint = False
        Transparent = False
        Expression = 'ADOqryreldados.Endereco'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRExpr3: TQRExpr
        Left = 54
        Top = 247
        Width = 110
        Height = 17
        Size.Values = (
          44.979166666666670000
          142.875000000000000000
          653.520833333333300000
          291.041666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        ResetAfterPrint = False
        Transparent = False
        Expression = 'ADOqryreldados.Telefone'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRExpr4: TQRExpr
        Left = 216
        Top = 247
        Width = 133
        Height = 17
        Enabled = False
        Size.Values = (
          44.979166666666670000
          571.500000000000000000
          653.520833333333300000
          351.895833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        ResetAfterPrint = False
        Transparent = False
        Expression = 'ADOqryreldados.Email'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRExpr5: TQRExpr
        Left = 120
        Top = 302
        Width = 44
        Height = 17
        Size.Values = (
          44.979166666666670000
          317.500000000000000000
          799.041666666666700000
          116.416666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        ResetAfterPrint = False
        Transparent = False
        Expression = 'ADOqryreldados.nrOrcamento'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRExpr6: TQRExpr
        Left = 208
        Top = 302
        Width = 84
        Height = 17
        Size.Values = (
          44.979166666666670000
          550.333333333333300000
          799.041666666666700000
          222.250000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        ResetAfterPrint = False
        Transparent = False
        Expression = 'ADOqryreldados.Data'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRExpr7: TQRExpr
        Left = 384
        Top = 302
        Width = 173
        Height = 17
        Size.Values = (
          44.979166666666670000
          1016.000000000000000000
          799.041666666666700000
          457.729166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        ResetAfterPrint = False
        Transparent = False
        Expression = 'ADOqryreldados.Responsavel'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRExpr19: TQRExpr
        Left = 162
        Top = 99
        Width = 170
        Height = 17
        Size.Values = (
          44.979166666666670000
          428.625000000000000000
          261.937500000000000000
          449.791666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        ResetAfterPrint = False
        Transparent = False
        Expression = 'ADOqryreldados.ConfigNome'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRExpr20: TQRExpr
        Left = 162
        Top = 120
        Width = 181
        Height = 17
        Size.Values = (
          44.979166666666670000
          428.625000000000000000
          317.500000000000000000
          478.895833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        ResetAfterPrint = False
        Transparent = False
        Expression = 'ADOqryreldados.ConfEndereco'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRExpr21: TQRExpr
        Left = 162
        Top = 142
        Width = 163
        Height = 17
        Size.Values = (
          44.979166666666670000
          428.625000000000000000
          375.708333333333300000
          431.270833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        ResetAfterPrint = False
        Transparent = False
        Expression = 'ADOqryreldados.ConfigCEP'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRExpr22: TQRExpr
        Left = 162
        Top = 164
        Width = 246
        Height = 17
        Enabled = False
        Size.Values = (
          44.979166666666670000
          428.625000000000000000
          433.916666666666700000
          650.875000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        ResetAfterPrint = False
        Transparent = False
        Expression = #39'Email:'#39' + '#39' '#39' +ADOqryreldados.ConfigEmail'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRExpr23: TQRExpr
        Left = 470
        Top = 99
        Width = 250
        Height = 17
        Size.Values = (
          44.979166666666670000
          1243.541666666667000000
          261.937500000000000000
          661.458333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        ResetAfterPrint = False
        Transparent = False
        Expression = #39'CNPJ:'#39' + '#39' '#39' + ADOqryreldados.ConfigCNPJ'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRExpr24: TQRExpr
        Left = 512
        Top = 120
        Width = 208
        Height = 17
        Size.Values = (
          44.979166666666670000
          1354.666666666667000000
          317.500000000000000000
          550.333333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        ResetAfterPrint = False
        Transparent = False
        Expression = #39'IE:'#39' + '#39' '#39' + ADOqryreldados.ConfigIE'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRMemo1: TQRMemo
        Left = 10
        Top = 358
        Width = 721
        Height = 47
        Size.Values = (
          124.354166666666700000
          26.458333333333330000
          947.208333333333300000
          1907.645833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
    end
    object QRBand2: TQRBand
      Left = 38
      Top = 505
      Width = 740
      Height = 21
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        55.562500000000000000
        1957.916666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
      object QRShape10: TQRShape
        Left = 58
        Top = -5
        Width = 1
        Height = 47
        Size.Values = (
          124.354166666666700000
          153.458333333333300000
          -13.229166666666670000
          2.645833333333333000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape11: TQRShape
        Left = 10
        Top = -5
        Width = 1
        Height = 47
        Size.Values = (
          124.354166666666700000
          26.458333333333330000
          -13.229166666666670000
          2.645833333333333000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape12: TQRShape
        Left = 330
        Top = -5
        Width = 1
        Height = 47
        Size.Values = (
          124.354166666666700000
          873.125000000000000000
          -13.229166666666670000
          2.645833333333333000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape13: TQRShape
        Left = 445
        Top = -5
        Width = 1
        Height = 47
        Size.Values = (
          124.354166666666700000
          1177.395833333333000000
          -13.229166666666670000
          2.645833333333333000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape14: TQRShape
        Left = 506
        Top = -5
        Width = 1
        Height = 47
        Size.Values = (
          124.354166666666700000
          1338.791666666667000000
          -13.229166666666670000
          2.645833333333333000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape15: TQRShape
        Left = 575
        Top = -5
        Width = 1
        Height = 47
        Size.Values = (
          124.354166666666700000
          1521.354166666667000000
          -13.229166666666670000
          2.645833333333333000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape16: TQRShape
        Left = 730
        Top = -5
        Width = 1
        Height = 47
        Size.Values = (
          124.354166666666700000
          1931.458333333333000000
          -13.229166666666670000
          2.645833333333333000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape17: TQRShape
        Left = 10
        Top = 20
        Width = 721
        Height = 1
        Size.Values = (
          2.645833333333333000
          26.458333333333330000
          52.916666666666670000
          1907.645833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRExpr8: TQRExpr
        Left = 70
        Top = 2
        Width = 255
        Height = 17
        Size.Values = (
          44.979166666666670000
          185.208333333333300000
          5.291666666666667000
          674.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        Expression = 'ADOqryreldados.nmproduto'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRExpr9: TQRExpr
        Left = 336
        Top = 2
        Width = 103
        Height = 17
        Size.Values = (
          44.979166666666670000
          889.000000000000000000
          5.291666666666667000
          272.520833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        Expression = 'ADOqryreldados.RefFab'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRExpr10: TQRExpr
        Left = 450
        Top = 2
        Width = 52
        Height = 17
        Size.Values = (
          44.979166666666670000
          1190.625000000000000000
          5.291666666666667000
          137.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        Expression = 'ADOqryreldados.Qtd'
        Mask = '0.00'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRExpr11: TQRExpr
        Left = 518
        Top = 2
        Width = 52
        Height = 17
        Size.Values = (
          44.979166666666670000
          1370.541666666667000000
          5.291666666666667000
          137.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        Expression = 'ADOqryreldados.VlUnit'
        Mask = '0.00'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRExpr12: TQRExpr
        Left = 674
        Top = 2
        Width = 52
        Height = 17
        Size.Values = (
          44.979166666666670000
          1783.291666666667000000
          5.291666666666667000
          137.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        Expression = 'ADOqryreldados.ItemTotal'
        Mask = '0.00'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRExpr18: TQRExpr
        Left = 15
        Top = 2
        Width = 38
        Height = 17
        Size.Values = (
          44.979166666666670000
          39.687500000000000000
          5.291666666666667000
          100.541666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        Expression = 'ADOqryreldados.cdProduto'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRShape19: TQRShape
        Left = 649
        Top = -5
        Width = 1
        Height = 47
        Size.Values = (
          124.354166666666700000
          1717.145833333333000000
          -13.229166666666670000
          2.645833333333333000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRExpr26: TQRExpr
        Left = 593
        Top = 2
        Width = 52
        Height = 17
        Size.Values = (
          44.979166666666670000
          1568.979166666667000000
          5.291666666666667000
          137.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        Expression = 'ADOqryreldados.VlBruto'
        Mask = '0.00'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
    end
    object QRBand3: TQRBand
      Left = 38
      Top = 526
      Width = 740
      Height = 139
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        367.770833333333300000
        1957.916666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbSummary
      object QRLabel32: TQRLabel
        Left = 10
        Top = 24
        Width = 100
        Height = 17
        Size.Values = (
          44.979166666666670000
          26.458333333333330000
          63.500000000000000000
          264.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'N'#250'mero de itens:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel33: TQRLabel
        Left = 10
        Top = 43
        Width = 100
        Height = 17
        Size.Values = (
          44.979166666666670000
          26.458333333333330000
          113.770833333333300000
          264.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Quantidade total:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel34: TQRLabel
        Left = 586
        Top = 24
        Width = 57
        Height = 17
        Size.Values = (
          44.979166666666670000
          1550.458333333333000000
          63.500000000000000000
          150.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Sub-total:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel35: TQRLabel
        Left = 586
        Top = 43
        Width = 60
        Height = 17
        Size.Values = (
          44.979166666666670000
          1550.458333333333000000
          113.770833333333300000
          158.750000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Desconto:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel36: TQRLabel
        Left = 598
        Top = 62
        Width = 45
        Height = 25
        Size.Values = (
          66.145833333333330000
          1582.208333333333000000
          164.041666666666700000
          119.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Total:'
        Color = cl3DLight
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object QRExpr13: TQRExpr
        Left = 118
        Top = 24
        Width = 52
        Height = 17
        Size.Values = (
          44.979166666666670000
          312.208333333333300000
          63.500000000000000000
          137.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        ResetAfterPrint = False
        Transparent = False
        Expression = 'ADOqryreldados.NrTotalItens'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRExpr14: TQRExpr
        Left = 118
        Top = 43
        Width = 52
        Height = 17
        Size.Values = (
          44.979166666666670000
          312.208333333333300000
          113.770833333333300000
          137.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        ResetAfterPrint = False
        Transparent = False
        Expression = 'ADOqryreldados.QtdTotalItens'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRExpr15: TQRExpr
        Left = 649
        Top = 24
        Width = 81
        Height = 17
        Size.Values = (
          44.979166666666670000
          1717.145833333333000000
          63.500000000000000000
          214.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        ResetAfterPrint = False
        Transparent = False
        Expression = 'ADOqryreldados.SubTotal'
        Mask = '0.00'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRExpr16: TQRExpr
        Left = 649
        Top = 43
        Width = 81
        Height = 17
        Size.Values = (
          44.979166666666670000
          1717.145833333333000000
          113.770833333333300000
          214.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        ResetAfterPrint = False
        Transparent = False
        Expression = 'ADOqryreldados.Desconto'
        Mask = '0.00'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRExpr17: TQRExpr
        Left = 640
        Top = 62
        Width = 91
        Height = 25
        Size.Values = (
          66.145833333333330000
          1693.333333333333000000
          164.041666666666700000
          240.770833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = cl3DLight
        ResetAfterPrint = False
        Transparent = False
        Expression = 'ADOqryreldados.Total'
        Mask = '0.00'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel2: TQRLabel
        Left = 10
        Top = 71
        Width = 62
        Height = 17
        Size.Values = (
          44.979166666666670000
          26.458333333333330000
          187.854166666666700000
          164.041666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = '**Validade:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRExpr25: TQRExpr
        Left = 78
        Top = 71
        Width = 52
        Height = 16
        Size.Values = (
          42.333333333333330000
          206.375000000000000000
          187.854166666666700000
          137.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        Expression = 'ADOqryreldados.Validade'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 9
      end
      object QRLabel4: TQRLabel
        Left = 10
        Top = 110
        Width = 124
        Height = 17
        Size.Values = (
          44.979166666666670000
          26.458333333333330000
          291.041666666666700000
          328.083333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Forma de Pagamento:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object qrlblPag: TQRLabel
        Left = 140
        Top = 110
        Width = 37
        Height = 17
        Size.Values = (
          44.979166666666670000
          370.416666666666700000
          291.041666666666700000
          97.895833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = '            '
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
    end
    object QRBand4: TQRBand
      Left = 38
      Top = 482
      Width = 740
      Height = 23
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        60.854166666666670000
        1957.916666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbColumnHeader
      object QRShape4: TQRShape
        Left = 10
        Top = 0
        Width = 721
        Height = 23
        Size.Values = (
          60.854166666666670000
          26.458333333333330000
          0.000000000000000000
          1907.645833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Brush.Color = cl3DLight
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel21: TQRLabel
        Left = 70
        Top = 4
        Width = 51
        Height = 17
        Size.Values = (
          44.979166666666670000
          185.208333333333300000
          10.583333333333330000
          134.937500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Produto'
        Color = cl3DLight
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel22: TQRLabel
        Left = 353
        Top = 4
        Width = 58
        Height = 17
        Size.Values = (
          44.979166666666670000
          933.979166666666700000
          10.583333333333330000
          153.458333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Ref. Fab.'
        Color = cl3DLight
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel23: TQRLabel
        Left = 458
        Top = 4
        Width = 35
        Height = 17
        Size.Values = (
          44.979166666666670000
          1211.791666666667000000
          10.583333333333330000
          92.604166666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Qtde.'
        Color = cl3DLight
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel24: TQRLabel
        Left = 517
        Top = 4
        Width = 47
        Height = 17
        Size.Values = (
          44.979166666666670000
          1367.895833333333000000
          10.583333333333330000
          124.354166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Vlr. liq.'
        Color = cl3DLight
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel25: TQRLabel
        Left = 672
        Top = 4
        Width = 33
        Height = 17
        Size.Values = (
          44.979166666666670000
          1778.000000000000000000
          10.583333333333330000
          87.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Total'
        Color = cl3DLight
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRShape5: TQRShape
        Left = 58
        Top = 0
        Width = 1
        Height = 35
        Size.Values = (
          92.604166666666670000
          153.458333333333300000
          0.000000000000000000
          2.645833333333333000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape6: TQRShape
        Left = 330
        Top = 0
        Width = 1
        Height = 35
        Size.Values = (
          92.604166666666670000
          873.125000000000000000
          0.000000000000000000
          2.645833333333333000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape7: TQRShape
        Left = 445
        Top = 0
        Width = 1
        Height = 35
        Size.Values = (
          92.604166666666670000
          1177.395833333333000000
          0.000000000000000000
          2.645833333333333000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape8: TQRShape
        Left = 506
        Top = 0
        Width = 1
        Height = 35
        Size.Values = (
          92.604166666666670000
          1338.791666666667000000
          0.000000000000000000
          2.645833333333333000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape9: TQRShape
        Left = 575
        Top = 1
        Width = 1
        Height = 35
        Size.Values = (
          92.604166666666670000
          1521.354166666667000000
          2.645833333333333000
          2.645833333333333000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRLabel20: TQRLabel
        Left = 22
        Top = 4
        Width = 26
        Height = 17
        Size.Values = (
          44.979166666666670000
          58.208333333333330000
          10.583333333333330000
          68.791666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'C'#243'd'
        Color = cl3DLight
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel3: TQRLabel
        Left = 583
        Top = 4
        Width = 60
        Height = 17
        Size.Values = (
          44.979166666666670000
          1542.520833333333000000
          10.583333333333330000
          158.750000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Vlr. bruto'
        Color = cl3DLight
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRShape18: TQRShape
        Left = 649
        Top = 1
        Width = 1
        Height = 35
        Size.Values = (
          92.604166666666670000
          1717.145833333333000000
          2.645833333333333000
          2.645833333333333000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsVertLine
        VertAdjust = 0
      end
    end
  end
  object ADOqryreldados: TADOQuery
    Connection = DModulo.Conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      ''
      ''
      
        'SELECT Config.dsRazaoSocial ConfigNome, Config.dsCGC ConfigCNPJ,' +
        ' Config.dsLogradouro + '#39', '#39' + Config.dsNumero + '#39' - Bairro '#39' + C' +
        'onfig.dsBairro ConfEndereco,'
      
        #39'CEP '#39'+Config.dsCEP + '#39' - '#39' + Config.dsCidade + '#39' - '#39' + Config.d' +
        'sUf + '#39' - FONE '#39' + Config.dsTelefone  ConfigCEP, Config.dsEmail ' +
        'ConfigEmail, Config.dsInscricao ConfigIE,'
      'O.nrOrcamento, PE.nmPessoa Cliente,'
      
        'E.nmLogradouro + '#39', '#39' + E.nrNumero + '#39' - Bairro '#39' + E.dsBairro  ' +
        '+ '#39' - CEP '#39' + E.dsCEP + '#39' - '#39' + E.dsCidade + '#39' - '#39' + E.dsUF AS E' +
        'ndereco ,  '
      
        'TEL.NMTELEFONE Telefone, ISNULL(pe.dsEmailNfe,pe.dsEmail) Email,' +
        ' O.dtEmissao Data, func.nmPessoa Responsavel,'
      
        'MO.dsMemo Observacao, I.cdIteLcto NrItem, PROD.nmproduto, PROD.d' +
        'sReferencia RefFab, I.nrQtd Qtd, I.vlPreco VlUnit,'
      
        '(I.nrQtd * I.vlPreco) ItemTotal, COUNT(*) OVER (PARTITION BY O.n' +
        'rOrcamento) NrTotalItens, SUM(I.nrQtd) OVER (PARTITION BY O.nrOr' +
        'camento) QtdTotalItens,'
      
        'CAST(SUM(I.nrQtd * I.vlDesconto) OVER (PARTITION BY O.nrOrcament' +
        'o)AS DECIMAL(15,2)) SubTotal,'
      
        'CAST(SUM(I.nrQtd * I.vlDesconto) OVER (PARTITION BY O.nrOrcament' +
        'o)AS DECIMAL(15,2)) - O.vlvalor AS Desconto,'
      'O.vlvalor Total'
      'FROM Configuracao Config, ORCAMENTO O'
      'INNER JOIN PESSOA FUNC'
      'ON FUNC.CDPESSOA = O.cdPessoa  '
      'INNER JOIN IteOrcamento I'
      'ON I.nrOrcamento = O.nrOrcamento'
      'INNER JOIN PRODUTO PROD'
      'ON PROD.cdProduto = I.cdProduto             '
      'INNER JOIN PESSOA PE'
      'ON PE.CDPESSOA = O.CDCLIENTE'
      'INNER JOIN ENDERECO E'
      'ON E.cdPessoa = PE.cdPessoa'
      
        'LEFT JOIN (SELECT MAX(nmTelefone) NMTELEFONE, cdPessoa FROM Tele' +
        'fone GROUP BY cdPessoa) TEL'
      'ON TEL.cdPessoa = PE.cdPessoa'
      'LEFT JOIN MEMOORCAMENTO MO'
      'ON MO.nrOrcamento = O.nrOrcamento'
      'WHERE O.nrOrcamento = 146334'
      'ORDER BY I.cdIteLcto'
      '')
    Left = 630
    Top = 302
    object ADOqryreldadosConfigNome: TStringField
      FieldName = 'ConfigNome'
      Size = 55
    end
    object ADOqryreldadosConfigCNPJ: TStringField
      FieldName = 'ConfigCNPJ'
    end
    object ADOqryreldadosConfEndereco: TStringField
      FieldName = 'ConfEndereco'
      ReadOnly = True
      Size = 71
    end
    object ADOqryreldadosConfigCEP: TStringField
      FieldName = 'ConfigCEP'
      ReadOnly = True
      Size = 68
    end
    object ADOqryreldadosConfigEmail: TStringField
      FieldName = 'ConfigEmail'
      Size = 40
    end
    object ADOqryreldadosConfigIE: TStringField
      FieldName = 'ConfigIE'
      Size = 18
    end
    object ADOqryreldadosnrOrcamento: TIntegerField
      FieldName = 'nrOrcamento'
    end
    object ADOqryreldadosCliente: TStringField
      FieldName = 'Cliente'
      Size = 40
    end
    object ADOqryreldadosEndereco: TStringField
      FieldName = 'Endereco'
      ReadOnly = True
      Size = 230
    end
    object ADOqryreldadosTelefone: TStringField
      FieldName = 'Telefone'
      ReadOnly = True
      Size = 15
    end
    object ADOqryreldadosEmail: TStringField
      FieldName = 'Email'
      ReadOnly = True
      Size = 60
    end
    object ADOqryreldadosData: TDateTimeField
      FieldName = 'Data'
    end
    object ADOqryreldadosResponsavel: TStringField
      FieldName = 'Responsavel'
      Size = 40
    end
    object ADOqryreldadosObservacao: TMemoField
      FieldName = 'Observacao'
      BlobType = ftMemo
    end
    object ADOqryreldadosnmproduto: TStringField
      FieldName = 'nmproduto'
      Size = 40
    end
    object ADOqryreldadosRefFab: TStringField
      FieldName = 'RefFab'
      Size = 15
    end
    object ADOqryreldadosQtd: TFloatField
      FieldName = 'Qtd'
    end
    object ADOqryreldadosVlUnit: TFloatField
      FieldName = 'VlUnit'
    end
    object ADOqryreldadosItemTotal: TFloatField
      FieldName = 'ItemTotal'
      ReadOnly = True
    end
    object ADOqryreldadosNrTotalItens: TIntegerField
      FieldName = 'NrTotalItens'
      ReadOnly = True
    end
    object ADOqryreldadosQtdTotalItens: TFloatField
      FieldName = 'QtdTotalItens'
      ReadOnly = True
    end
    object ADOqryreldadosSubTotal: TBCDField
      FieldName = 'SubTotal'
      ReadOnly = True
      Precision = 15
      Size = 2
    end
    object ADOqryreldadosDesconto: TFMTBCDField
      FieldName = 'Desconto'
      ReadOnly = True
      Precision = 20
      Size = 4
    end
    object ADOqryreldadosTotal: TBCDField
      FieldName = 'Total'
      Precision = 19
    end
    object ADOqryreldadosValidade: TStringField
      FieldName = 'Validade'
      Size = 10
    end
    object ADOqryreldadosVlBruto: TFloatField
      FieldName = 'VlBruto'
    end
    object ADOqryreldadoscdProduto: TIntegerField
      FieldName = 'cdProduto'
    end
    object ADOqryreldadosdsServico: TStringField
      FieldName = 'dsServico'
      Size = 60
    end
    object ADOqryreldadoscdCodigoDIC: TStringField
      FieldName = 'cdCodigoDIC'
    end
    object ADOqryreldadosnmEmpresa: TStringField
      FieldName = 'nmEmpresa'
      Size = 40
    end
  end
end
