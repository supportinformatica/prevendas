inherited FrmRelListaRestante: TFrmRelListaRestante
  Caption = 'FrmRelListaRestante'
  Visible = False
  ExplicitWidth = 742
  ExplicitHeight = 536
  PixelsPerInch = 96
  TextHeight = 13
  inherited QRMdRel: TQuickRep
    Left = 64
    Top = 48
    Functions.DATA = (
      '0'
      '0'
      #39#39)
    Page.Values = (
      100.000000000000000000
      2794.000000000000000000
      100.000000000000000000
      2159.000000000000000000
      100.000000000000000000
      100.000000000000000000
      0.000000000000000000)
    ExplicitLeft = 64
    ExplicitTop = 48
    inherited QRB1: TQRBand
      Height = 92
      Size.Values = (
        243.416666666666700000
        1957.916666666667000000)
      ExplicitHeight = 92
      inherited QRLblEmpresa: TQRLabel
        Width = 115
        Size.Values = (
          55.562500000000000000
          2.645833333333333000
          2.645833333333333000
          304.270833333333300000)
        Font.Height = -13
        FontSize = 10
        ExplicitWidth = 115
      end
      inherited QRSysData1: TQRSysData
        Left = 668
        Width = 46
        Size.Values = (
          50.270833333333330000
          1767.416666666667000000
          2.645833333333333000
          121.708333333333300000)
        Font.Height = -13
        FontSize = 10
        ExplicitLeft = 668
        ExplicitWidth = 46
      end
      inherited QRLblPrograma: TQRLabel
        Width = 93
        Size.Values = (
          52.916666666666670000
          0.000000000000000000
          55.562500000000000000
          246.062500000000000000)
        Font.Height = -13
        FontSize = 10
        ExplicitWidth = 93
      end
      inherited QRLblTitulo: TQRLabel
        Left = 105
        Width = 72
        Size.Values = (
          52.916666666666670000
          277.812500000000000000
          55.562500000000000000
          190.500000000000000000)
        Font.Height = -13
        FontSize = 10
        ExplicitLeft = 105
        ExplicitWidth = 72
      end
      inherited QRSysData2: TQRSysData
        Left = 645
        Width = 68
        Size.Values = (
          50.270833333333330000
          1706.562500000000000000
          55.562500000000000000
          179.916666666666700000)
        Font.Height = -13
        FontSize = 10
        ExplicitLeft = 645
        ExplicitWidth = 68
      end
      inherited QRShape1: TQRShape
        Top = 70
        Height = 1
        Size.Values = (
          2.645833333333333000
          0.000000000000000000
          185.208333333333300000
          1949.979166666667000000)
        ExplicitTop = 70
        ExplicitHeight = 1
      end
      inherited QRLblPagina: TQRLabel
        Left = 636
        Width = 45
        Size.Values = (
          50.270833333333330000
          1682.750000000000000000
          2.645833333333333000
          119.062500000000000000)
        Font.Height = -13
        FontSize = 10
        ExplicitLeft = 636
        ExplicitWidth = 45
      end
      object QRLabel1: TQRLabel
        Left = 49
        Top = 72
        Width = 53
        Height = 17
        Size.Values = (
          44.979166666666670000
          129.645833333333300000
          190.500000000000000000
          140.229166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Produto'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel8: TQRLabel
        Left = 3
        Top = 72
        Width = 44
        Height = 17
        Size.Values = (
          44.979166666666670000
          7.937500000000000000
          190.500000000000000000
          116.416666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'C'#243'digo'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel12: TQRLabel
        Left = 105
        Top = 45
        Width = 155
        Height = 20
        Size.Values = (
          52.916666666666670000
          277.812500000000000000
          119.062500000000000000
          410.104166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Per'#237'odo das Prevendas:'
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
        FontSize = 10
      end
      object QrlPeriodo: TQRLabel
        Left = 266
        Top = 45
        Width = 148
        Height = 20
        Size.Values = (
          52.916666666666670000
          703.791666666666700000
          119.062500000000000000
          391.583333333333300000)
        XLColumn = 0
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
        FontSize = 10
      end
    end
    object QRGroup1: TQRGroup
      Left = 38
      Top = 130
      Width = 740
      Height = 43
      Frame.DrawTop = True
      Frame.DrawBottom = True
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        113.770833333333300000
        1957.916666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'ADOQryRelDados.cdProduto'
      FooterBand = QRBand2
      Master = QRMdRel
      ReprintOnNewPage = False
      object QRDBText1: TQRDBText
        Left = 49
        Top = 3
        Width = 394
        Height = 17
        Size.Values = (
          44.979166666666670000
          129.645833333333300000
          7.937500000000000000
          1042.458333333333000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = ADOQryRelDados
        DataField = 'nmProduto'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText9: TQRDBText
        Left = 3
        Top = 3
        Width = 43
        Height = 17
        Size.Values = (
          44.979166666666670000
          7.937500000000000000
          7.937500000000000000
          113.770833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = ADOQryRelDados
        DataField = 'cdProduto'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRLabel2: TQRLabel
        Left = 655
        Top = 22
        Width = 78
        Height = 17
        Size.Values = (
          44.979166666666670000
          1733.020833333333000000
          58.208333333333330000
          206.375000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Qtd Prevenda'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel6: TQRLabel
        Left = 211
        Top = 24
        Width = 40
        Height = 17
        Size.Values = (
          44.979166666666670000
          558.270833333333300000
          63.500000000000000000
          105.833333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Cliente'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel7: TQRLabel
        Left = 49
        Top = 24
        Width = 54
        Height = 17
        Size.Values = (
          44.979166666666670000
          129.645833333333300000
          63.500000000000000000
          142.875000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Prevenda'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel9: TQRLabel
        Left = 117
        Top = 24
        Width = 27
        Height = 17
        Size.Values = (
          44.979166666666670000
          309.562500000000000000
          63.500000000000000000
          71.437500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Data'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel13: TQRLabel
        Left = 447
        Top = 22
        Width = 43
        Height = 17
        Size.Values = (
          44.979166666666670000
          1182.687500000000000000
          58.208333333333330000
          113.770833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Apelido'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel14: TQRLabel
        Left = 535
        Top = 22
        Width = 57
        Height = 17
        Size.Values = (
          44.979166666666670000
          1415.520833333333000000
          58.208333333333330000
          150.812500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Telefones'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
    end
    object QRBand1: TQRBand
      Left = 38
      Top = 173
      Width = 740
      Height = 20
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        52.916666666666670000
        1957.916666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
      object QRDBText2: TQRDBText
        Left = 211
        Top = 2
        Width = 232
        Height = 17
        Size.Values = (
          44.979166666666670000
          558.270833333333300000
          5.291666666666667000
          613.833333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = ADOQryRelDados
        DataField = 'nmPessoa'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText3: TQRDBText
        Left = 661
        Top = 2
        Width = 72
        Height = 17
        Size.Values = (
          44.979166666666670000
          1748.895833333333000000
          5.291666666666667000
          190.500000000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = ADOQryRelDados
        DataField = 'qtdPrevenda'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText7: TQRDBText
        Left = 49
        Top = 2
        Width = 60
        Height = 17
        Size.Values = (
          44.979166666666670000
          129.645833333333300000
          5.291666666666667000
          158.750000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = ADOQryRelDados
        DataField = 'nrOrcamento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText8: TQRDBText
        Left = 117
        Top = 2
        Width = 90
        Height = 17
        Size.Values = (
          44.979166666666670000
          309.562500000000000000
          5.291666666666667000
          238.125000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = ADOQryRelDados
        DataField = 'dtEmissao'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText10: TQRDBText
        Left = 447
        Top = 2
        Width = 86
        Height = 17
        Size.Values = (
          44.979166666666670000
          1182.687500000000000000
          5.291666666666667000
          227.541666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = ADOQryRelDados
        DataField = 'Apelido'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText11: TQRDBText
        Left = 535
        Top = 2
        Width = 114
        Height = 17
        Size.Values = (
          44.979166666666670000
          1415.520833333333000000
          5.291666666666667000
          301.625000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = ADOQryRelDados
        DataField = 'tels'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
    end
    object QRBand2: TQRBand
      Left = 38
      Top = 193
      Width = 740
      Height = 35
      Frame.DrawTop = True
      Frame.DrawBottom = True
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        92.604166666666670000
        1957.916666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object QRLabel10: TQRLabel
        Left = 335
        Top = 5
        Width = 107
        Height = 27
        Size.Values = (
          71.437500000000000000
          886.354166666666700000
          13.229166666666670000
          283.104166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 'Qtd solicitada no Pedido de Compra:'
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
        FontSize = 8
      end
      object QRLabel4: TQRLabel
        Left = 547
        Top = 5
        Width = 123
        Height = 27
        Size.Values = (
          71.437500000000000000
          1447.270833333333000000
          13.229166666666670000
          325.437500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 'Qtd que chegou dos Pedidos de Compras:'
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
        FontSize = 8
      end
      object QRDBText5: TQRDBText
        Left = 452
        Top = 16
        Width = 50
        Height = 17
        Size.Values = (
          44.979166666666670000
          1195.916666666667000000
          42.333333333333330000
          132.291666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = ADOQryRelDados
        DataField = 'qtdPedComp'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText4: TQRDBText
        Left = 683
        Top = 15
        Width = 50
        Height = 17
        Size.Values = (
          44.979166666666670000
          1807.104166666667000000
          39.687500000000000000
          132.291666666666700000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = ADOQryRelDados
        DataField = 'nrQtdChegada'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
    end
    object QRBand3: TQRBand
      Left = 38
      Top = 228
      Width = 740
      Height = 34
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        89.958333333333330000
        1957.916666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbSummary
    end
  end
  inherited ADOQryRelDados: TADOQuery
    Connection = nil
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=supportdatasql;Persist Security Inf' +
      'o=True;User ID=sa;Initial Catalog=CDP;Data Source=DESENV04\MSSQL' +
      'SERVER2008'
    CursorType = ctStatic
    SQL.Strings = (
      
        'select Ip.nrLancto as NumeroPedComp,I.nrOrcamento, O.dtEmissao, ' +
        'IP.cdProduto,'
      
        'P.nmProduto,PE.cdPessoa, PE.nmPessoa, dbo.TELEFONES(PE.cdPessoa)' +
        ' as tels, '
      'PF.dsNaturalidade,PJ.nmContato,'
      'case when (PE.Existir = '#39'F'#39') then PF.dsNaturalidade'
      '     when (PE.Existir = '#39'J'#39') then PJ.nmContato'
      'End as Apelido,'
      'sum(I.nrQtd) as qtdPrevenda,           '
      
        'IP.nrQtd as qtdPedComp, Ip.nrQtdChegada,                        ' +
        '             '
      
        'sum(IP.nrQtd - Ip.nrQtdChegada) as faltaChegar                  ' +
        '             '
      
        'from Itepedcomp IP left join IteOrcamento I on IP.cdProduto = I.' +
        'cdProduto    '
      
        'left join Orcamento O on I.nrOrcamento = O.nrOrcamento          ' +
        '             '
      
        'inner join Produto P on IP.cdProduto = P.cdProduto              ' +
        '             '
      
        'left join Pessoa PE on O.cdCliente = PE.cdPessoa                ' +
        '             '
      'left join P_Fisica PF on PF.cdPessoa = PE.cdPessoa'
      'left join P_Juridica PJ on PJ.cdPessoa = Pe.cdPessoa'
      
        'where (IP.nrQtd - IP.nrQtdChegada) > 0 and O.dsImpresso <> '#39'S'#39'  ' +
        '          '
      '--and O.dtEmissao between '#39#39' and '#39#39
      'group by Ip.nrLancto, IP.cdProduto, P.nmProduto, I.nrOrcamento,'
      'O.dtEmissao, PE.cdPessoa, PE.nmPessoa,IP.nrQtd, Ip.nrQtdChegada,'
      'PE.Existir,PF.dsNaturalidade,PE.Existir,PJ.nmContato')
    Left = 96
    Top = 8
    object ADOQryRelDadosNumeroPedComp: TIntegerField
      FieldName = 'NumeroPedComp'
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
    object ADOQryRelDadosqtdPrevenda: TFloatField
      FieldName = 'qtdPrevenda'
      ReadOnly = True
    end
    object ADOQryRelDadosqtdPedComp: TFloatField
      FieldName = 'qtdPedComp'
    end
    object ADOQryRelDadosnrQtdChegada: TFloatField
      FieldName = 'nrQtdChegada'
    end
    object ADOQryRelDadosfaltaChegar: TFloatField
      FieldName = 'faltaChegar'
      ReadOnly = True
    end
    object ADOQryRelDadosnrOrcamento: TIntegerField
      FieldName = 'nrOrcamento'
    end
    object ADOQryRelDadosdtEmissao: TDateTimeField
      FieldName = 'dtEmissao'
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
  end
  object QRPDFFilter1: TQRPDFFilter
    CompressionOn = False
    TextEncoding = AnsiEncoding
    Codepage = '1252'
    Left = 400
    Top = 16
  end
  object QRExcelFilter1: TQRExcelFilter
    TextEncoding = DefaultEncoding
    UseXLColumns = False
    Left = 464
    Top = 16
  end
  object QRRTFFilter1: TQRRTFFilter
    TextEncoding = DefaultEncoding
    Left = 336
    Top = 16
  end
end
