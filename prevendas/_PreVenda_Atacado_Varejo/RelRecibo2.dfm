object FrmRel_Recibo2: TFrmRel_Recibo2
  Left = 203
  Top = 115
  Width = 821
  Height = 574
  Caption = 'FrmRel_Recibo2'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object QrMdRel: TRLReport
    Left = 6
    Top = 4
    Width = 794
    Height = 529
    DataSource = DS
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Margins.LeftMargin = 7.000000000000000000
    Margins.TopMargin = 7.000000000000000000
    Margins.RightMargin = 7.000000000000000000
    Margins.BottomMargin = 6.000000000000000000
    PageSetup.PaperSize = fpCustom
    PageSetup.PaperWidth = 210.000000000000000000
    PageSetup.PaperHeight = 140.000000000000000000
    Title = 'dffdg'
    object RLBand1: TRLBand
      Left = 26
      Top = 26
      Width = 742
      Height = 232
      AutoSize = True
      BandType = btTitle
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object QRLblCGC: TRLLabel
        Left = 157
        Top = 33
        Width = 59
        Height = 14
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object QRLblEndereco: TRLLabel
        Left = 157
        Top = 48
        Width = 87
        Height = 14
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object RLLabel1: TRLLabel
        Left = 527
        Top = 20
        Width = 33
        Height = 24
        Caption = 'R$'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
      end
      object QRLblValor: TRLLabel
        Left = 564
        Top = 20
        Width = 119
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object RLLabel3: TRLLabel
        Left = 296
        Top = 67
        Width = 99
        Height = 29
        Caption = 'RECIBO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -24
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object QRLblNr: TRLLabel
        Left = 560
        Top = 67
        Width = 126
        Height = 29
        Caption = '                 '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -24
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object RLDraw1: TRLDraw
        Left = 8
        Top = 99
        Width = 730
        Height = 54
      end
      object RLLabel2: TRLLabel
        Left = 15
        Top = 105
        Width = 112
        Height = 16
        Caption = 'Valor por Extenso:'
        Transparent = False
      end
      object QREExtenso: TRLMemo
        Left = 131
        Top = 105
        Width = 597
        Height = 43
        AutoSize = False
        Transparent = False
      end
      object RLLabel4: TRLLabel
        Left = 71
        Top = 215
        Width = 75
        Height = 16
        Caption = 'Lan'#231'amento'
        Transparent = False
      end
      object RLLabel5: TRLLabel
        Left = 239
        Top = 215
        Width = 70
        Height = 16
        Caption = 'Documento'
        Transparent = False
      end
      object RLLabel6: TRLLabel
        Left = 399
        Top = 215
        Width = 34
        Height = 16
        Caption = 'Valor'
        Transparent = False
      end
      object RLDraw2: TRLDraw
        Left = 8
        Top = 156
        Width = 730
        Height = 53
      end
      object QRLblEmpresa: TRLLabel
        Left = 157
        Top = 8
        Width = 194
        Height = 24
        Caption = 'Nome da Empresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
      end
      object RLImage1: TRLImage
        Left = 8
        Top = 5
        Width = 143
        Height = 72
        Center = True
        Scaled = True
      end
      object RLLabel8: TRLLabel
        Left = 469
        Top = 215
        Width = 55
        Height = 16
        Caption = 'Emiss'#227'o'
        Transparent = False
      end
      object RLLabel7: TRLLabel
        Left = 559
        Top = 215
        Width = 73
        Height = 16
        Caption = 'Vencimento'
        Transparent = False
      end
      object QRETexto: TRLMemo
        Left = 15
        Top = 163
        Width = 711
        Height = 37
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
      end
    end
    object RLBand2: TRLBand
      Left = 26
      Top = 258
      Width = 742
      Height = 16
      AutoSize = True
      Borders.Width = 0
      Borders.Color = clWhite
      Borders.Style = bsClear
      IntegralHeight = False
      Transparent = False
      object QreDescricao: TRLDBText
        Left = 72
        Top = 1
        Width = 81
        Height = 15
        AutoSize = False
        DataField = 'dsLancamento'
        DataSource = DS
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object RLDBText1: TRLDBText
        Left = 241
        Top = 1
        Width = 81
        Height = 15
        AutoSize = False
        DataField = 'dsDocumento'
        DataSource = DS
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object RLDBText2: TRLDBText
        Left = 354
        Top = -1
        Width = 81
        Height = 15
        Alignment = taRightJustify
        AutoSize = False
        DataField = 'vlPagamento'
        DataSource = DS
        DisplayMask = '#,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object rlPago: TRLDBText
        Left = 445
        Top = -1
        Width = 81
        Height = 15
        Alignment = taRightJustify
        AutoSize = False
        DataField = 'dtEmissao_Doc'
        DataSource = DS
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object rlVencimento: TRLDBText
        Left = 551
        Top = 1
        Width = 81
        Height = 15
        Alignment = taRightJustify
        AutoSize = False
        DataField = 'dtVencimento_Doc'
        DataSource = DS
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
    end
    object RLBand3: TRLBand
      Left = 26
      Top = 274
      Width = 742
      Height = 127
      BandType = btSummary
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = False
      Transparent = False
      object QRLblAssinante: TRLLabel
        Left = 400
        Top = 36
        Width = 297
        Height = 16
        Transparent = False
      end
      object QRLblCGCAssinante: TRLLabel
        Left = 400
        Top = 52
        Width = 297
        Height = 16
        Transparent = False
      end
      object QRLblEndAssinante: TRLLabel
        Left = 400
        Top = 69
        Width = 297
        Height = 18
        Transparent = False
        Visible = False
      end
      object RLDraw3: TRLDraw
        Left = 394
        Top = 32
        Width = 301
        Height = 1
        Transparent = False
      end
      object QrlRestante: TRLLabel
        Left = 11
        Top = 32
        Width = 56
        Height = 16
        Caption = 'Restante'
      end
      object QRLabel13: TRLLabel
        Left = 16
        Top = 67
        Width = 68
        Height = 16
        Caption = 'Aracaju-Se'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
      end
      object QRlblData: TRLLabel
        Left = 16
        Top = 88
        Width = 63
        Height = 16
        Transparent = False
      end
      object RLLabel12: TRLLabel
        Left = 223
        Top = 104
        Width = 251
        Height = 16
        Caption = '## DOCUMENTO SEM VALOR FISCAL##'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object QRLBLObs: TRLLabel
        Left = 11
        Top = 16
        Width = 52
        Height = 16
        Caption = '            '
      end
      object RlRestanteParcial: TRLLabel
        Left = 11
        Top = 50
        Width = 52
        Height = 16
        Caption = '            '
      end
    end
  end
  object ADOQryConfig: TADOQuery
    Connection = DModulo.Conexao
    Parameters = <>
    SQL.Strings = (
      'Select dsMenPromocional,nmEmpresa,dsPrazoOrcamento,dsEndereco,'
      'dsCgc,dsInscricao,dsCidade,dsUf From Configuracao')
    Left = 24
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
    object ADOQryConfigdsUf: TStringField
      FieldName = 'dsUf'
      Size = 2
    end
  end
  object DS: TDataSource
    DataSet = ADOQryRelDados
    Left = 56
  end
  object RLExpressionParser1: TRLExpressionParser
    Left = 88
  end
  object ADOQryRelDados: TADOQuery
    Connection = DModulo.Conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT I.dsLancamento,I.dsDocumento,I.vlPagamento,'
      'I.dtEmissao_Doc,I.dtVencimento_Doc             '
      'FROM Recibo R INNER JOIN IteRecibo I ON R.nrRecibo = I.nrRecibo ')
    Left = 120
    object ADOQryRelDadosdsLancamento: TStringField
      FieldName = 'dsLancamento'
      Size = 10
    end
    object ADOQryRelDadosdsDocumento: TStringField
      FieldName = 'dsDocumento'
      Size = 14
    end
    object ADOQryRelDadosvlPagamento: TBCDField
      FieldName = 'vlPagamento'
      currency = True
      Precision = 19
    end
    object ADOQryRelDadosdtEmissao_Doc: TDateTimeField
      FieldName = 'dtEmissao_Doc'
    end
    object ADOQryRelDadosdtVencimento_Doc: TDateTimeField
      FieldName = 'dtVencimento_Doc'
    end
  end
end
