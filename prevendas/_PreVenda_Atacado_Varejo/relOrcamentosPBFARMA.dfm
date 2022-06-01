object frmRelOrcamentosPB: TfrmRelOrcamentosPB
  Left = 364
  Top = 250
  Caption = 'frmRelOrcamentosPB'
  ClientHeight = 616
  ClientWidth = 826
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
  object QRMdRel: TRLReport
    Left = 8
    Top = -86
    Width = 794
    Height = 1123
    Background.AutoSize = False
    DataSource = DS
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    PageSetup.PaperSize = fpCustom
    PageSetup.PaperWidth = 210.000000000000000000
    PageSetup.PaperHeight = 297.000000000000000000
    PrintDialog = False
    ExpressionParser = RLExpressionParser1
    object RLBand1: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 257
      BandType = btTitle
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      object QrlCnpj: TRLLabel
        Left = 142
        Top = 61
        Width = 39
        Height = 13
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object QRLblTitulo: TRLLabel
        Left = 277
        Top = 109
        Width = 164
        Height = 23
        Caption = '** Pr'#233'-Venda **'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object QRLblPrograma: TRLLabel
        Left = 142
        Top = 48
        Width = 107
        Height = 13
        Caption = 'endere'#231'o da empresa'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object RLDraw1: TRLDraw
        Left = 3
        Top = 99
        Width = 718
        Height = 1
      end
      object RLDraw2: TRLDraw
        Left = 0
        Top = 240
        Width = 718
        Height = 1
      end
      object QRLabel10: TRLLabel
        Left = 3
        Top = 163
        Width = 40
        Height = 13
        Caption = 'Cliente:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object QRLabel13: TRLLabel
        Left = 3
        Top = 179
        Width = 52
        Height = 13
        Caption = 'Endere'#231'o:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object QRLabel1: TRLLabel
        Left = 3
        Top = 225
        Width = 60
        Height = 13
        Caption = 'Or'#231'amento:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object QrlCliente: TRLLabel
        Left = 56
        Top = 163
        Width = 224
        Height = 13
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object QrlEndereco: TRLLabel
        Left = 56
        Top = 179
        Width = 231
        Height = 13
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object QRLabel16: TRLLabel
        Left = 459
        Top = 195
        Width = 26
        Height = 13
        Caption = 'Cep:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object QRLabel14: TRLLabel
        Left = 301
        Top = 179
        Width = 35
        Height = 13
        Caption = 'Bairro:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object QrlCep: TRLLabel
        Left = 510
        Top = 195
        Width = 87
        Height = 13
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object QrlBairro: TRLLabel
        Left = 341
        Top = 179
        Width = 111
        Height = 13
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Qrl: TRLLabel
        Left = 459
        Top = 163
        Width = 49
        Height = 13
        Caption = 'Telefone:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object QRLabel15: TRLLabel
        Left = 459
        Top = 179
        Width = 40
        Height = 13
        Caption = 'Cidade:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object QrlTelefone: TRLLabel
        Left = 510
        Top = 163
        Width = 99
        Height = 13
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object QrlCidade: TRLLabel
        Left = 510
        Top = 179
        Width = 136
        Height = 13
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object QrlReimpressao: TRLLabel
        Left = 648
        Top = 163
        Width = 64
        Height = 13
        Caption = 'Reimpress'#227'o'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object QRLabel3: TRLLabel
        Left = 150
        Top = 225
        Width = 53
        Height = 13
        Caption = 'Vendedor:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object QRLabel2: TRLLabel
        Left = 459
        Top = 225
        Width = 45
        Height = 13
        Caption = 'Emiss'#227'o:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object QRLabel11: TRLLabel
        Left = 600
        Top = 207
        Width = 47
        Height = 13
        Caption = 'Validade:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object QRLabel4: TRLLabel
        Left = 2
        Top = 242
        Width = 36
        Height = 13
        Caption = 'C'#243'digo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object QRLabel6: TRLLabel
        Left = 55
        Top = 242
        Width = 49
        Height = 13
        Caption = 'Descri'#231#227'o'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object QRLabel12: TRLLabel
        Left = 444
        Top = 242
        Width = 22
        Height = 13
        Caption = 'Und'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object QRLabel7: TRLLabel
        Left = 576
        Top = 242
        Width = 21
        Height = 13
        Caption = 'Qtd'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object QRLabel8: TRLLabel
        Left = 274
        Top = 242
        Width = 32
        Height = 13
        Caption = 'Marca'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object QRLabel9: TRLLabel
        Left = 689
        Top = 242
        Width = 27
        Height = 13
        Caption = 'Total'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object QreValidade: TRLDBText
        Left = 650
        Top = 207
        Width = 63
        Height = 13
        AutoSize = False
        DataField = 'dsPrazoOrcamento'
        DataSource = DSConfig
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object QRSysData2: TRLSystemInfo
        Left = 658
        Top = 225
        Width = 47
        Height = 13
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Info = itHour
        ParentFont = False
        Text = ''
        Visible = False
      end
      object QREVendedor: TRLDBText
        Left = 208
        Top = 225
        Width = 218
        Height = 13
        AutoSize = False
        DataField = 'nmPessoa'
        DataSource = DS
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object QREOrcamento: TRLDBText
        Left = 65
        Top = 225
        Width = 83
        Height = 15
        AutoSize = False
        DataField = 'nrOrcamento'
        DataSource = DS
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Text = ''
      end
      object RLLabel1: TRLLabel
        Left = 494
        Top = 241
        Width = 43
        Height = 13
        Caption = 'Validade'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel2: TRLLabel
        Left = 608
        Top = 241
        Width = 51
        Height = 13
        Caption = 'Vl Unit'#225'rio'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object QrlCPF: TRLLabel
        Left = 3
        Top = 210
        Width = 55
        Height = 13
        Caption = 'CPF/CNPJ:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object QrlRG: TRLLabel
        Left = 301
        Top = 209
        Width = 45
        Height = 13
        Caption = 'RG/Insc:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object QrlUf: TRLLabel
        Left = 459
        Top = 209
        Width = 20
        Height = 13
        Caption = 'UF:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object QRLblEmpresa: TRLLabel
        Left = 139
        Top = 25
        Width = 146
        Height = 23
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel4: TRLLabel
        Left = 3
        Top = 194
        Width = 72
        Height = 13
        Caption = 'Complemento:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object QrlComp: TRLLabel
        Left = 77
        Top = 194
        Width = 220
        Height = 13
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object s: TRLLabel
        Left = 648
        Top = 193
        Width = 66
        Height = 14
        Caption = '                     '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object rlApelido: TRLLabel
        Left = 302
        Top = 163
        Width = 155
        Height = 13
        AutoSize = False
        Caption = ' '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel5: TRLLabel
        Left = 381
        Top = 242
        Width = 49
        Height = 13
        Alignment = taRightJustify
        Caption = 'Prateleira'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object QrlUf2: TRLLabel
        Left = 510
        Top = 209
        Width = 16
        Height = 13
        Caption = 'UF'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object QRLblPagina: TRLLabel
        Left = 633
        Top = 1
        Width = 34
        Height = 12
        Caption = 'P'#225'gina:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLSystemInfo1: TRLSystemInfo
        Left = 669
        Top = 1
        Width = 63
        Height = 12
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        Info = itPageNumber
        ParentFont = False
        Text = ''
      end
      object RLSystemInfo2: TRLSystemInfo
        Left = 633
        Top = 13
        Width = 27
        Height = 12
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        Info = itNow
        ParentFont = False
        Text = ''
      end
      object QreEmissao: TRLDBText
        Left = 624
        Top = 225
        Width = 41
        Height = 13
        AutoSize = False
        DataField = 'hrHora'
        DataSource = DS
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Text = ''
        Visible = False
      end
      object QrlDtHR: TRLLabel
        Left = 510
        Top = 225
        Width = 51
        Height = 13
        Caption = 'Data hora'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object LogoMarca: TRLImage
        Left = 3
        Top = 23
        Width = 130
        Height = 66
        Stretch = True
      end
      object RLDraw12: TRLDraw
        Left = 0
        Top = 147
        Width = 718
        Height = 1
      end
      object qrLblTelefone: TRLLabel
        Left = 142
        Top = 74
        Width = 68
        Height = 13
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
    end
    object RLBand2: TRLBand
      Left = 38
      Top = 427
      Width = 718
      Height = 10
      object QRECodigo: TRLDBText
        Left = 2
        Top = 0
        Width = 37
        Height = 10
        DataField = 'cdProduto'
        DataSource = DS
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object QREDescricao: TRLDBText
        Left = 58
        Top = 0
        Width = 252
        Height = 10
        AutoSize = False
        DataField = 'nmProduto'
        DataSource = DS
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object QreUnidade: TRLDBText
        Left = 433
        Top = 0
        Width = 33
        Height = 10
        Alignment = taRightJustify
        AutoSize = False
        DataField = 'dsUnidade'
        DataSource = DS
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object QREQtd: TRLDBResult
        Left = 539
        Top = 0
        Width = 58
        Height = 10
        Alignment = taRightJustify
        AutoSize = False
        DataField = 'NrQtd'
        DataSource = DS
        DisplayMask = '#,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLDBText1: TRLDBText
        Left = 274
        Top = 0
        Width = 49
        Height = 10
        DataField = 'nmfabricante'
        DataSource = DS
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLDBResult3: TRLDBResult
        Left = 468
        Top = 0
        Width = 69
        Height = 10
        Alignment = taRightJustify
        AutoSize = False
        ComputeNulls = False
        DataField = 'validade'
        DataSource = DS
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ResetAfterPrint = True
        Text = ''
      end
      object RlDescricao: TRLLabel
        Left = 55
        Top = 0
        Width = 217
        Height = 10
        AutoSize = False
        Caption = '                         '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object RLDBText2: TRLDBText
        Left = 343
        Top = 0
        Width = 87
        Height = 10
        Alignment = taRightJustify
        AutoSize = False
        DataField = 'dsPrateleira'
        DataSource = DS
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object QREPreco: TRLDBResult
        Left = 599
        Top = 0
        Width = 60
        Height = 10
        Alignment = taRightJustify
        AutoSize = False
        DataFormula = 'vlPreco-(vlPreco*nrDesconto/100)'
        DataSource = DS
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object QRETotal: TRLDBText
        Left = 660
        Top = 0
        Width = 56
        Height = 10
        Alignment = taRightJustify
        AutoSize = False
        DataFormula = 'NrQtd*(vlPreco-((vlPreco*nrDesconto)/100))'
        DataSource = DS
        DisplayMask = '#,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
    end
    object RLBand3: TRLBand
      Left = 38
      Top = 437
      Width = 718
      Height = 228
      BandType = btSummary
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = False
      object RLDBResult4: TRLDBResult
        Left = 465
        Top = 1
        Width = 81
        Height = 13
        AutoSize = False
        DataFormula = '(((NrQtd*vlPreco) * nrDesconto) / 100)'
        DataSource = DS
        DisplayMask = '#,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Info = riSum
        ParentFont = False
        Text = ''
      end
      object QrlSub: TRLLabel
        Left = 24
        Top = 1
        Width = 65
        Height = 13
        Caption = 'SubTotal R$:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object QRLblEmpresa2: TRLLabel
        Left = 337
        Top = 194
        Width = 174
        Height = 15
        Alignment = taCenter
        AutoSize = False
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = True
        Borders.DrawRight = False
        Borders.DrawBottom = False
        Caption = 'Empresa'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object QRLD: TRLLabel
        Left = 384
        Top = 1
        Width = 68
        Height = 13
        Caption = 'Desconto R$:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object QRLblPrevisao: TRLLabel
        Left = 337
        Top = 164
        Width = 106
        Height = 14
        Caption = 'Previs'#227'o de Entrega: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object QRL2: TRLLabel
        Left = 584
        Top = 1
        Width = 47
        Height = 13
        Caption = 'Total R$:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object QRLabel18: TRLLabel
        Left = 550
        Top = 194
        Width = 164
        Height = 15
        Alignment = taCenter
        AutoSize = False
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = True
        Borders.DrawRight = False
        Borders.DrawBottom = False
        Caption = 'Cliente'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object QRExpr3: TRLDBText
        Left = 585
        Top = 17
        Width = 124
        Height = 16
        Alignment = taRightJustify
        DataField = 'dsMenPromocional'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Text = ''
      end
      object RLDBResult2: TRLDBResult
        Left = 640
        Top = 1
        Width = 71
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        DataFormula = '(NrQtd*vlPreco)-((NrQtd*vlPreco)*nrDesconto/100)'
        DataSource = DS
        DisplayMask = '#,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Info = riSum
        ParentFont = False
        Text = ''
      end
      object RLDBResult1: TRLDBResult
        Left = 98
        Top = 1
        Width = 112
        Height = 13
        DataFormula = 'NrQtd*vlPreco'
        DataSource = DS
        DisplayMask = '#,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Holder = RLDBResult1
        Info = riSum
        ParentFont = False
        Text = ''
      end
      object QREDesconto: TRLDBResult
        Left = 278
        Top = 1
        Width = 99
        Height = 13
        DataField = 'nrDesconto'
        DataSource = DS
        DisplayMask = '0.00%'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLLabel3: TRLLabel
        Left = 200
        Top = 1
        Width = 66
        Height = 13
        Caption = 'Desconto %:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object RlblFormaPgto: TRLLabel
        Left = 3
        Top = 72
        Width = 66
        Height = 13
        Caption = '                     '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel21: TRLLabel
        Left = 341
        Top = 212
        Width = 369
        Height = 13
        Caption = 
          '**Documento sem valor fiscal, '#233' vedada a autentica'#231#227'o deste docu' +
          'mento**'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel22: TRLLabel
        Left = 27
        Top = 193
        Width = 31
        Height = 14
        Caption = 'OBS: '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object RLMemo1: TRLMemo
        Left = 4
        Top = 85
        Width = 282
        Height = 71
        Alignment = taJustify
        AutoSize = False
        Behavior = [beSiteExpander]
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
      end
    end
    object RLBPAF: TRLBand
      Left = 38
      Top = 295
      Width = 718
      Height = 132
      BandType = btTitle
      Borders.Sides = sdCustom
      Borders.DrawLeft = True
      Borders.DrawTop = True
      Borders.DrawRight = True
      Borders.DrawBottom = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      object RLLabel6: TRLLabel
        Left = 224
        Top = 2
        Width = 176
        Height = 13
        Caption = 'DOCUMENTO AUXILIAR DE VENDA -'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object RLDBText3: TRLDBText
        Left = 97
        Top = 96
        Width = 83
        Height = 15
        AutoSize = False
        DataField = 'nrOrcamento'
        DataSource = DS
        DisplayMask = '0000000000000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object QRLblTitulo2: TRLLabel
        Left = 408
        Top = 2
        Width = 29
        Height = 13
        Caption = 'T'#237'tulo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel8: TRLLabel
        Left = 40
        Top = 17
        Width = 637
        Height = 13
        Caption = 
          'N'#195'O '#201' DOCUMENTO FISCAL - N'#195'O '#201' V'#193'LIDO COMO RECIBO E COMO GARANTI' +
          'A DE MERCADORIA - N'#195'O COMPROVA PAGAMENTO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel9: TRLLabel
        Left = 254
        Top = 32
        Width = 206
        Height = 13
        Alignment = taCenter
        Caption = 'Identifica'#231#227'o do estabelecimento emitente'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object LblDenoEmitente: TRLLabel
        Left = 1
        Top = 49
        Width = 71
        Height = 13
        Caption = 'Denomina'#231#227'o:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object RlblCNPJ_Emit: TRLLabel
        Left = 503
        Top = 49
        Width = 32
        Height = 13
        Caption = 'CNPJ:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel12: TRLLabel
        Left = 286
        Top = 64
        Width = 142
        Height = 13
        Alignment = taCenter
        Caption = 'Identifica'#231#227'o do Destinat'#225'rio'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object RLDraw3: TRLDraw
        Left = 0
        Top = 31
        Width = 718
        Height = 1
      end
      object RLDraw4: TRLDraw
        Left = 0
        Top = 63
        Width = 718
        Height = 1
      end
      object RLDraw5: TRLDraw
        Left = 0
        Top = 94
        Width = 718
        Height = 1
      end
      object LblDenoDest: TRLLabel
        Left = 1
        Top = 80
        Width = 34
        Height = 13
        Caption = 'Nome:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object RLLCNPJ_Dest: TRLLabel
        Left = 503
        Top = 80
        Width = 55
        Height = 13
        Caption = 'CNPJ/CPF:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel15: TRLLabel
        Left = 1
        Top = 97
        Width = 91
        Height = 13
        Caption = 'N'#176' do Documento:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object RLDraw6: TRLDraw
        Left = 501
        Top = 46
        Width = 1
        Height = 18
      end
      object RLDraw7: TRLDraw
        Left = 0
        Top = 45
        Width = 718
        Height = 1
      end
      object RLDraw8: TRLDraw
        Left = 501
        Top = 77
        Width = 1
        Height = 18
      end
      object RLDraw9: TRLDraw
        Left = 0
        Top = 77
        Width = 718
        Height = 1
      end
      object RLDraw11: TRLDraw
        Left = 358
        Top = 95
        Width = 1
        Height = 18
      end
      object RLLabel16: TRLLabel
        Left = 361
        Top = 97
        Width = 120
        Height = 13
        Caption = 'N'#176' do Documento Fiscal:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel7: TRLLabel
        Left = 2
        Top = 115
        Width = 36
        Height = 13
        Caption = 'C'#243'digo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel10: TRLLabel
        Left = 494
        Top = 115
        Width = 43
        Height = 13
        Caption = 'Validade'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel11: TRLLabel
        Left = 55
        Top = 115
        Width = 49
        Height = 13
        Caption = 'Descri'#231#227'o'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel13: TRLLabel
        Left = 381
        Top = 115
        Width = 49
        Height = 13
        Alignment = taRightJustify
        Caption = 'Prateleira'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel14: TRLLabel
        Left = 444
        Top = 115
        Width = 22
        Height = 13
        Caption = 'Und'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel17: TRLLabel
        Left = 576
        Top = 115
        Width = 21
        Height = 13
        Caption = 'Qtd'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel18: TRLLabel
        Left = 274
        Top = 115
        Width = 32
        Height = 13
        Caption = 'Marca'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel19: TRLLabel
        Left = 608
        Top = 115
        Width = 51
        Height = 13
        Caption = 'Vl Unit'#225'rio'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel20: TRLLabel
        Left = 689
        Top = 115
        Width = 27
        Height = 13
        Caption = 'Total'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object RLDraw10: TRLDraw
        Left = 0
        Top = 113
        Width = 718
        Height = 1
      end
      object RLDBText4: TRLDBText
        Left = 75
        Top = 49
        Width = 58
        Height = 13
        DataField = 'nmEmpresa'
        DataSource = DSConfig
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLDBText5: TRLDBText
        Left = 539
        Top = 49
        Width = 32
        Height = 13
        DataField = 'dsCgc'
        DataSource = DSConfig
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
    end
  end
  object ADOQryCliente: TADOQuery
    Connection = DModulo.Conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select P.nmPessoa,E.dsUf,E.nmLogradouro,E.dsBairro,E.dsCidade,'
      'E.dsCep,T.nmTelefone '
      'From Pessoa P,Endereco E,Telefone T '
      'Where P.cdPessoa = E.cdPessoa and P.cdPessoa = T.cdPessoa '
      'Order By P.nmPessoa')
    Left = 168
  end
  object ADOQryConfig: TADOQuery
    Connection = DModulo.Conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'Select '#9'dsLogradouro, dsNumero, dsBairro, dsCidade, dsEstado, ds' +
        'CEP, dsCgc, dsInscricao, '
      
        #9'dsTelefone, dsMenPromocional, nmEmpresa, dsPrazoOrcamento, logo' +
        'Marca'
      'From Configuracao'
      '')
    Left = 120
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
    object ADOQryConfiglogoMarca: TBlobField
      FieldName = 'logoMarca'
    end
    object ADOQryConfigdsLogradouro: TStringField
      FieldName = 'dsLogradouro'
      Size = 34
    end
    object ADOQryConfigdsNumero: TStringField
      FieldName = 'dsNumero'
      Size = 5
    end
    object ADOQryConfigdsBairro: TStringField
      FieldName = 'dsBairro'
    end
    object ADOQryConfigdsEstado: TStringField
      FieldName = 'dsEstado'
      Size = 2
    end
    object ADOQryConfigdsCEP: TStringField
      FieldName = 'dsCEP'
      EditMask = '99999-999;0;'
      Size = 8
    end
    object ADOQryConfigdsTelefone: TStringField
      FieldName = 'dsTelefone'
    end
  end
  object DS: TDataSource
    DataSet = ADOQryRelDados
    Left = 32
    Top = 72
  end
  object DSConfig: TDataSource
    DataSet = ADOQryConfig
    Left = 272
  end
  object ADOSPRelDados: TADOStoredProc
    Connection = DModulo.Conexao
    ProcedureName = 'SUP_Imp_Pedido_Prevenda;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@DSLANCAMENTO'
        Attributes = [paNullable]
        DataType = ftString
        Size = 10
        Value = Null
      end
      item
        Name = '@CODIGO'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@FLAG'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 376
  end
  object ADOQuery1: TADOQuery
    Connection = DModulo.Conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select P.nmPessoa,E.dsUf,E.nmLogradouro,E.dsBairro,E.dsCidade,'
      'E.dsCep,T.nmTelefone '
      'From Pessoa P,Endereco E,Telefone T '
      'Where P.cdPessoa = E.cdPessoa and P.cdPessoa = T.cdPessoa '
      'Order By P.nmPessoa')
    Left = 232
    Top = 8
  end
  object DOS: TRLDraftFilter
    Commands.Strings = (
      'CR=13'
      'LF=10'
      'BS=8'
      'FF=12'
      'Reset=27,'#39'@'#39',27,'#39'x0'#39
      'MicroOn=27,'#39'A'#39',#'
      'MicroOff=27,'#39'2'#39
      'Space=32'
      'CPP10=27,'#39'P'#39',18'
      'CPP12=27,'#39'M'#39',18'
      'CPP17=27,'#39'P'#39',15'
      'CPP20=27,'#39'M'#39',15'
      'ExpandOn=27,'#39'W'#39',1'
      'ExpandOff=27,'#39'W'#39',0'
      'BoldOn=27,'#39'G'#39
      'BoldOff=27,'#39'H'#39
      'ItalicOn=27,'#39'4'#39
      'ItalicOff=27,'#39'5'#39
      'UnderlineOn=27,'#39'-1'#39
      'UnderlineOff=27,'#39'-0'#39
      'RAW=27,'#39'L'#39',#l,#h')
    PrinterFamily = fmCustom
    DisplayName = 'QUALIDADE_DOS'
    Left = 418
    Top = 1
  end
  object AdoQryOrcamento: TADOQuery
    Connection = DModulo.Conexao
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'nrOrcamento'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select hrHora from Orcamento where nrOrcamento = :nrOrcamento')
    Left = 464
    Top = 8
  end
  object ADOQryRelDados: TADOQuery
    Connection = DModulo.Conexao
    Parameters = <
      item
        Name = 'DSLANCAMENTO'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT P.nmPessoa,'
      #9'T.nmProduto,'
      #9'T.cdpessoa_1 cdFabricante,'
      #9'PFAB.nmPessoa nmFabricante,'
      #9'IL.validade validade,'
      #9'T.dsReferencia,'
      #9'O.cdPessoa,'
      #9'I.nrLote,'
      #9'O.nrOrcamento,'
      #9'O.cdCliente,'
      #9'I.cdProduto,'
      #9'I.vlDesconto,'
      #9'O.dtEmissao,'
      #9'I.NrQtd,'
      #9'I.vlPreco,'
      #9'O.nrDesconto,    '
      #9'T.dsUnidade,'
      #9'T.dsPrateleira,'
      #9'I.dsMetragem '
      'FROM Orcamento O WITH (NOLOCK) '
      #9'inner join Pessoa P WITH (NOLOCK)'
      #9#9'on O.cdPessoa = P.cdPessoa '
      #9'inner join IteOrcamento I WITH (NOLOCK) '
      #9#9'on O.nrOrcamento = I.nrOrcamento '
      #9'inner join Produto T WITH (NOLOCK)'
      #9#9'on T.cdProduto = I.cdProduto '
      #9'left join pessoa PFAB WITH (NOLOCK)'
      #9#9'on T.cdpessoa_1 = PFAB.cdpessoa'
      #9'left join itelote IL WITH (NOLOCK)'
      #9#9'on T.cdproduto = IL.cdproduto'
      #9#9'and I.cdpessoa = IL.cdFabricante'
      #9#9'and I.nrLote = IL.nrLote'
      'WHERE I.dsSituacao = '#39#39' '#9' '
      #9'and O.nrOrcamento = :DSLANCAMENTO'
      'order by T.dsPrateleira ')
    Left = 32
    Top = 18
    object ADOQryRelDadosnmPessoa: TStringField
      FieldName = 'nmPessoa'
      Size = 40
    end
    object ADOQryRelDadosnmProduto: TStringField
      FieldName = 'nmProduto'
      Size = 40
    end
    object ADOQryRelDadoscdFabricante: TIntegerField
      FieldName = 'cdFabricante'
    end
    object ADOQryRelDadosnmFabricante: TStringField
      FieldName = 'nmFabricante'
      Size = 40
    end
    object ADOQryRelDadosvalidade: TDateTimeField
      FieldName = 'validade'
    end
    object ADOQryRelDadosdsReferencia: TStringField
      FieldName = 'dsReferencia'
      Size = 15
    end
    object ADOQryRelDadoscdPessoa: TIntegerField
      FieldName = 'cdPessoa'
    end
    object ADOQryRelDadosnrLote: TStringField
      FieldName = 'nrLote'
      Size = 15
    end
    object ADOQryRelDadosnrOrcamento: TIntegerField
      FieldName = 'nrOrcamento'
    end
    object ADOQryRelDadoscdCliente: TIntegerField
      FieldName = 'cdCliente'
    end
    object ADOQryRelDadoscdProduto: TIntegerField
      FieldName = 'cdProduto'
    end
    object ADOQryRelDadosvlDesconto: TFloatField
      FieldName = 'vlDesconto'
    end
    object ADOQryRelDadosdtEmissao: TDateTimeField
      FieldName = 'dtEmissao'
    end
    object ADOQryRelDadosNrQtd: TFloatField
      FieldName = 'NrQtd'
    end
    object ADOQryRelDadosvlPreco: TBCDField
      FieldName = 'vlPreco'
      Precision = 19
    end
    object ADOQryRelDadosnrDesconto: TFloatField
      FieldName = 'nrDesconto'
    end
    object ADOQryRelDadosdsUnidade: TStringField
      FieldName = 'dsUnidade'
      Size = 3
    end
    object ADOQryRelDadosdsPrateleira: TStringField
      FieldName = 'dsPrateleira'
    end
    object ADOQryRelDadosdsMetragem: TStringField
      FieldName = 'dsMetragem'
      Size = 10
    end
  end
  object RLExpressionParser1: TRLExpressionParser
    Left = 312
    Top = 10
  end
  object RLPDFFilter1: TRLPDFFilter
    DisplayName = 'Documento PDF'
    Left = 544
    Top = 8
  end
  object RLXLSFilter1: TRLXLSFilter
    DisplayName = 'Planilha Excel'
    Left = 608
    Top = 8
  end
end
