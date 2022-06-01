inherited RelContagemEstoque: TRelContagemEstoque
  Left = 44
  Top = 126
  Width = 866
  Height = 461
  Caption = 'RelContagemEstoque'
  FormStyle = fsNormal
  OldCreateOrder = True
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited QRMdRel: TQuickRep
    Left = 14
    DataSet = ADOQryRelDados
    Functions.DATA = (
      '0'
      '0'
      #39#39)
    Page.Values = (
      150.000000000000000000
      2794.000000000000000000
      100.000000000000000000
      2159.000000000000000000
      70.000000000000000000
      20.000000000000000000
      0.000000000000000000)
    inherited QRB1: TQRBand
      Left = 26
      Width = 782
      Height = 61
      Frame.DrawBottom = True
      Size.Values = (
        161.395833333333300000
        2069.041666666667000000)
      inherited QRLblEmpresa: TQRLabel
        Size.Values = (
          55.562500000000000000
          2.645833333333333000
          2.645833333333333000
          391.583333333333400000)
        FontSize = 12
      end
      inherited QRLblPrograma: TQRLabel [1]
        Size.Values = (
          52.916666666666660000
          0.000000000000000000
          55.562500000000000000
          277.812500000000000000)
        FontSize = 11
      end
      inherited QRLblTitulo: TQRLabel [2]
        Width = 285
        Size.Values = (
          52.916666666666660000
          298.979166666666700000
          55.562500000000000000
          754.062500000000000000)
        Caption = 'Relat'#243'rio de Contagem de Estoque'
        FontSize = 12
      end
      inherited QRSysData2: TQRSysData [3]
        Size.Values = (
          50.270833333333330000
          1727.729166666667000000
          55.562500000000000000
          222.250000000000000000)
        Alignment = taRightJustify
        FontSize = 12
      end
      inherited QRShape1: TQRShape [4]
        Width = 777
        Height = 1
        Size.Values = (
          2.645833333333333000
          0.000000000000000000
          108.479166666666700000
          2055.812500000000000000)
      end
      inherited QRLblPagina: TQRLabel [5]
        Size.Values = (
          50.270833333333330000
          1725.083333333334000000
          2.645833333333333000
          145.520833333333300000)
        FontSize = 12
      end
      object QRLabel1: TQRLabel [6]
        Left = 2
        Top = 42
        Width = 20
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          5.291666666666667000
          111.125000000000000000
          52.916666666666660000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Cod'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel5: TQRLabel [7]
        Left = 110
        Top = 42
        Width = 53
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          291.041666666666700000
          111.125000000000000000
          140.229166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Refer'#234'ncia'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel2: TQRLabel [8]
        Left = 197
        Top = 42
        Width = 47
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          521.229166666666700000
          111.125000000000000000
          124.354166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Descri'#231#227'o'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel3: TQRLabel [9]
        Left = 501
        Top = 42
        Width = 20
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1325.562500000000000000
          111.125000000000000000
          52.916666666666660000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Und'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QrlValor: TQRLabel [10]
        Left = 681
        Top = 42
        Width = 25
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1801.812500000000000000
          111.125000000000000000
          66.145833333333340000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Total'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel7: TQRLabel [11]
        Left = 591
        Top = 42
        Width = 31
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1563.687500000000000000
          111.125000000000000000
          82.020833333333340000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Depos'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel4: TQRLabel [12]
        Left = 35
        Top = 42
        Width = 68
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          92.604166666666680000
          111.125000000000000000
          179.916666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Codigo Barras'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel9: TQRLabel [13]
        Left = 538
        Top = 42
        Width = 32
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1423.458333333333000000
          111.125000000000000000
          84.666666666666680000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Balc'#227'o'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel10: TQRLabel [14]
        Left = 420
        Top = 42
        Width = 47
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1111.250000000000000000
          111.125000000000000000
          124.354166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Prateleira'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel11: TQRLabel [15]
        Left = 713
        Top = 42
        Width = 50
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1886.479166666667000000
          111.125000000000000000
          132.291666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Contagem'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      inherited QRSysData1: TQRSysData [16]
        Size.Values = (
          50.270833333333330000
          1788.583333333333000000
          2.645833333333333000
          153.458333333333300000)
        Alignment = taRightJustify
        FontSize = 12
      end
      object QRLabel12: TQRLabel
        Left = 638
        Top = 42
        Width = 15
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1688.041666666667000000
          111.125000000000000000
          39.687500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'OS'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
    object QRGroup2: TQRGroup
      Left = 26
      Top = 99
      Width = 782
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Courier'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        50.270833333333330000
        2069.041666666667000000)
      Expression = 'ADOQryRelDados.nmGrupo'
      Master = QRMdRel
      ReprintOnNewPage = False
      object QREcdGrupo: TQRExpr
        Left = 2
        Top = 1
        Width = 173
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          5.291666666666667000
          2.645833333333333000
          457.729166666666600000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = True
        WordWrap = True
        Expression = 'ADOQryRelDados.nmGrupo'
        FontSize = 10
      end
    end
    object QRBand2: TQRBand
      Left = 26
      Top = 137
      Width = 782
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        50.270833333333330000
        2069.041666666667000000)
      BandType = rbSummary
      object QRLabel6: TQRLabel
        Left = 2
        Top = 2
        Width = 65
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          5.291666666666667000
          5.291666666666667000
          171.979166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Listados ->'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRExpr5: TQRExpr
        Left = 89
        Top = 2
        Width = 38
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          235.479166666666700000
          5.291666666666667000
          100.541666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 'COUNT'
        FontSize = 8
      end
    end
    object QRBand1: TQRBand
      Left = 26
      Top = 118
      Width = 782
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = QRBand1BeforePrint
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Courier'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        50.270833333333330000
        2069.041666666667000000)
      BandType = rbDetail
      object QRExpr4: TQRExpr
        Left = 0
        Top = 3
        Width = 34
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          0.000000000000000000
          7.937500000000000000
          89.958333333333340000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 'AdoQryRelDados.cdProduto'
        FontSize = 7
      end
      object QRExpr1: TQRExpr
        Left = 197
        Top = 3
        Width = 218
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          34.395833333333340000
          521.229166666666800000
          7.937500000000000000
          576.791666666666800000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 'AdoQryRelDados.NmProduto'
        FontSize = 7
      end
      object QRExpr2: TQRExpr
        Left = 503
        Top = 3
        Width = 20
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          1330.854166666667000000
          7.937500000000000000
          52.916666666666660000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 'ADOQryRelDados.dsUnidade'
        FontSize = 7
      end
      object QRExpr6: TQRExpr
        Left = 111
        Top = 3
        Width = 83
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          293.687500000000000000
          7.937500000000000000
          219.604166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 'AdoQryRelDados.dsReferencia'
        FontSize = 7
      end
      object QRExpr7: TQRExpr
        Left = 35
        Top = 3
        Width = 70
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          92.604166666666680000
          7.937500000000000000
          185.208333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 'AdoQryRelDados.cdFabricante'
        FontSize = 7
      end
      object QRLabel8: TQRLabel
        Left = 721
        Top = 3
        Width = 40
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          1907.645833333333000000
          7.937500000000000000
          105.833333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '[           ]'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object QRExpr10: TQRExpr
        Left = 418
        Top = 3
        Width = 79
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          1105.958333333333000000
          7.937500000000000000
          209.020833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 'ADOQryRelDados.dsPrateleira'
        FontSize = 7
      end
      object LblOs: TQRLabel
        Left = 638
        Top = 3
        Width = 15
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          1688.041666666667000000
          7.937500000000000000
          39.687500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'OS'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object LblDep: TQRLabel
        Left = 604
        Top = 3
        Width = 15
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          1598.083333333333000000
          7.937500000000000000
          39.687500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'OS'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object LblBalcao: TQRLabel
        Left = 552
        Top = 3
        Width = 15
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          1460.500000000000000000
          7.937500000000000000
          39.687500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'OS'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object QRExpr3: TQRExpr
        Left = 672
        Top = 3
        Width = 35
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          1778.000000000000000000
          7.937500000000000000
          92.604166666666680000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 'AdoQryRelDados.nrQtdReal'
        Mask = '0.00'
        FontSize = 7
      end
    end
  end
  inherited ADOQryConfig: TADOQuery
    Left = 136
    Top = 8
  end
  inherited ADOQryRelDados: TADOQuery
    CursorType = ctStatic
    SQL.Strings = (
      
        'Select Distinct P.cdProduto,P.cdFabricante,P.dsReferencia,P.NmPr' +
        'oduto,'
      'G.nmGrupo,P.dsEmbalagem,P.dsUnidade,P.dsPrateleira,'
      'P.nrQtdReal,P.nrQtdMInima,S.nmPessoa,P.vlPreco as Preco'
      'FROM Grupo G INNER JOIN (Produto P INNER JOIN Pessoa S ON '
      'P.cdPessoa_1 = S.cdPessoa) ON G.cdgrupo = P.cdgrupo ')
    Left = 88
    Top = 8
    object ADOQryRelDadoscdProduto: TIntegerField
      FieldName = 'cdProduto'
    end
    object ADOQryRelDadoscdFabricante: TStringField
      FieldName = 'cdFabricante'
      Size = 15
    end
    object ADOQryRelDadosdsReferencia: TStringField
      FieldName = 'dsReferencia'
      Size = 15
    end
    object ADOQryRelDadosNmProduto: TStringField
      FieldName = 'NmProduto'
      Size = 40
    end
    object ADOQryRelDadosnmGrupo: TStringField
      FieldName = 'nmGrupo'
    end
    object ADOQryRelDadosdsEmbalagem: TStringField
      FieldName = 'dsEmbalagem'
      Size = 15
    end
    object ADOQryRelDadosdsUnidade: TStringField
      FieldName = 'dsUnidade'
      Size = 3
    end
    object ADOQryRelDadosnrQtdReal: TFloatField
      FieldName = 'nrQtdReal'
    end
    object ADOQryRelDadosnrQtdMInima: TFloatField
      FieldName = 'nrQtdMInima'
    end
    object ADOQryRelDadosnmPessoa: TStringField
      FieldName = 'nmPessoa'
      Size = 40
    end
    object ADOQryRelDadosPreco: TBCDField
      FieldName = 'Preco'
      Precision = 19
    end
    object ADOQryRelDadosdsPrateleira: TStringField
      FieldName = 'dsPrateleira'
      Size = 10
    end
  end
  object ADOQuery1: TADOQuery
    Connection = DModulo.Conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'Select Distinct P.cdProduto,P.cdFabricante,P.dsReferencia,P.NmPr' +
        'oduto,'
      'G.nmGrupo,P.dsEmbalagem,P.dsUnidade,P.dsPrateleira,'
      'P.nrQtdReal,P.nrQtdMInima,S.nmPessoa,P.vlPreco as Preco'
      'FROM Grupo G INNER JOIN (Produto P INNER JOIN Pessoa S ON '
      'P.cdPessoa_1 = S.cdPessoa) ON G.cdgrupo = P.cdgrupo ')
    Left = 192
    Top = 8
  end
  object ADOQryUltimoCodigo: TADOQuery
    Connection = DModulo.ADODeposito
    Parameters = <>
    Left = 256
    Top = 16
  end
end
