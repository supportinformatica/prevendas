object frmRelOrcamentos: TfrmRelOrcamentos
  Left = 609
  Top = 154
  Caption = 'frmRelOrcamentos'
  ClientHeight = 669
  ClientWidth = 860
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDefault
  PrintScale = poNone
  Scaled = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object QRMdRel: TRLReport
    Left = 40
    Top = 40
    Width = 794
    Height = 1123
    Background.AutoSize = False
    DataSource = DS
    DefaultFilter = Qualidade_Dos
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
      Height = 181
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
        Left = 134
        Top = 30
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
        Left = 448
        Top = 25
        Width = 115
        Height = 25
        Alignment = taRightJustify
        Caption = 'Pr'#233'-Venda'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object QRLblPrograma: TRLLabel
        Left = 134
        Top = 44
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
        Left = 0
        Top = 86
        Width = 716
        Height = 1
      end
      object RLDraw2: TRLDraw
        Left = 0
        Top = 164
        Width = 718
        Height = 1
      end
      object QRLabel10: TRLLabel
        Left = 0
        Top = 88
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
        Left = 0
        Top = 104
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
        Left = 0
        Top = 150
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
        Left = 41
        Top = 88
        Width = 278
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
        Left = 51
        Top = 104
        Width = 268
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
        Left = 320
        Top = 119
        Width = 26
        Height = 13
        Caption = 'CEP:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object QRLabel14: TRLLabel
        Left = 497
        Top = 104
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
        Left = 344
        Top = 119
        Width = 77
        Height = 13
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object QrlBairro: TRLLabel
        Left = 535
        Top = 104
        Width = 177
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
        Left = 497
        Top = 88
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
        Left = 320
        Top = 104
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
        Left = 546
        Top = 88
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
        Left = 358
        Top = 104
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
        Top = 88
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
        Top = 150
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
        Left = 560
        Top = 150
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
        Left = 611
        Top = 119
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
        Left = 0
        Top = 165
        Width = 41
        Height = 14
        Caption = 'C'#243'digo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object QRLabel6: TRLLabel
        Left = 110
        Top = 165
        Width = 66
        Height = 14
        Caption = 'Ref Interna'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object QRLabel12: TRLLabel
        Left = 436
        Top = 165
        Width = 26
        Height = 14
        Caption = 'Und'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object QRLabel7: TRLLabel
        Left = 472
        Top = 165
        Width = 45
        Height = 14
        Caption = 'Quantd'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object QRLabel8: TRLLabel
        Left = 527
        Top = 165
        Width = 59
        Height = 14
        Caption = 'Vl Unitario'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object QRLabel9: TRLLabel
        Left = 683
        Top = 165
        Width = 32
        Height = 14
        Caption = 'Total'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object QreValidade: TRLDBText
        Left = 659
        Top = 119
        Width = 53
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
      object QREVendedor: TRLDBText
        Left = 208
        Top = 150
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
        Left = 62
        Top = 149
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
        AfterPrint = QREOrcamentoAfterPrint
      end
      object RLLabel1: TRLLabel
        Left = 42
        Top = 165
        Width = 61
        Height = 14
        Caption = 'Refer'#234'ncia'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel2: TRLLabel
        Left = 589
        Top = 165
        Width = 59
        Height = 14
        Caption = 'Vl c/ Desc'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object QrlCPF: TRLLabel
        Left = 0
        Top = 135
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
        Left = 150
        Top = 135
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
        Left = 423
        Top = 119
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
        Left = 134
        Top = 4
        Width = 145
        Height = 24
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel4: TRLLabel
        Left = 0
        Top = 119
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
        Left = 74
        Top = 119
        Width = 245
        Height = 13
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object rlApelido: TRLLabel
        Left = 320
        Top = 88
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
        Left = 377
        Top = 165
        Width = 54
        Height = 14
        Alignment = taRightJustify
        Caption = 'Prateleira'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object QrlUf2: TRLLabel
        Left = 444
        Top = 119
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
        Left = 664
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
        Left = 696
        Top = 1
        Width = 18
        Height = 12
        Alignment = taRightJustify
        AutoSize = False
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
        Left = 687
        Top = 13
        Width = 27
        Height = 12
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        Info = itNow
        ParentFont = False
        Text = ''
      end
      object QrlDtHR: TRLLabel
        Left = 661
        Top = 150
        Width = 51
        Height = 13
        Alignment = taRightJustify
        Caption = 'Data hora'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object QreRota2: TRLLabel
        Left = 528
        Top = 119
        Width = 30
        Height = 13
        Caption = 'Rota:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object QreRota: TRLLabel
        Left = 497
        Top = 119
        Width = 30
        Height = 13
        Caption = 'Rota:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object qrImage: TRLImage
        Left = 12
        Top = 8
        Width = 110
        Height = 72
        Stretch = True
      end
      object QrlTel: TRLLabel
        Left = 134
        Top = 58
        Width = 21
        Height = 13
        Caption = 'Tel:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object QrlEmail: TRLLabel
        Left = 134
        Top = 72
        Width = 31
        Height = 13
        Caption = 'Email:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel24: TRLLabel
        Left = 181
        Top = 165
        Width = 55
        Height = 14
        Caption = 'Descri'#231#227'o'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object qrlInstragran: TRLLabel
        Left = 330
        Top = 58
        Width = 381
        Height = 13
        Alignment = taRightJustify
        Caption = 'Siga-nos nas REDES SOCIAIS: instagram.com/hipermoveisnordeste'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Visible = False
      end
      object qrlfacebook: TRLLabel
        Left = 520
        Top = 72
        Width = 191
        Height = 13
        Alignment = taRightJustify
        Caption = 'facebook.com/hipermoveisoficial'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Visible = False
      end
      object RLBarcode: TRLBarcode
        Left = 604
        Top = 26
        Width = 110
        Height = 24
        Margins.LeftMargin = 1.000000000000000000
        Margins.RightMargin = 1.000000000000000000
        Alignment = taRightJustify
        BarcodeType = bcCode128B
        Caption = '000000'
      end
      object QRLblPrevisao: TRLLabel
        Left = 605
        Top = 135
        Width = 107
        Height = 13
        Alignment = taRightJustify
        Caption = 'Previs'#227'o de Entrega: '
      end
    end
    object RLBand3: TRLBand
      Left = 38
      Top = 385
      Width = 718
      Height = 130
      BandType = btSummary
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = False
      AfterPrint = RLBand3AfterPrint
      BeforePrint = RLBand3BeforePrint
      object QrlSub: TRLLabel
        Left = 1
        Top = 1
        Width = 75
        Height = 14
        Caption = 'SubTotal R$:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object QRLblEmpresa2: TRLLabel
        Left = 335
        Top = 91
        Width = 178
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
        Left = 369
        Top = 1
        Width = 78
        Height = 14
        Caption = 'Desconto R$:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object QRL2: TRLLabel
        Left = 572
        Top = 1
        Width = 60
        Height = 14
        Caption = 'Total R$:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object QRLabel18: TRLLabel
        Left = 524
        Top = 91
        Width = 193
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
        Left = 1
        Top = 44
        Width = 715
        Height = 13
        Alignment = taCenter
        AutoSize = False
        DataField = 'dsMenPromocional'
        DataSource = DSConfig
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Text = ''
      end
      object RLLabel3: TRLLabel
        Left = 185
        Top = 2
        Width = 76
        Height = 14
        Caption = 'Desconto %:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
      end
      object RlblFormaPgto: TRLLabel
        Left = 2
        Top = 29
        Width = 88
        Height = 14
        Caption = '                     '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel21: TRLLabel
        Left = 341
        Top = 112
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
        Left = 1
        Top = 58
        Width = 31
        Height = 14
        Caption = 'OBS: '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLMemo1: TRLMemo
        Left = 33
        Top = 58
        Width = 301
        Height = 68
        Alignment = taJustify
        AutoSize = False
        Behavior = [beSiteExpander]
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Transparent = False
      end
      object lblSubTotal: TRLLabel
        Left = 77
        Top = 1
        Width = 29
        Height = 14
        Caption = '0,00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblPorcDesconto: TRLLabel
        Left = 264
        Top = 2
        Width = 29
        Height = 14
        Caption = '0,00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        BeforePrint = lblPorcDescontoBeforePrint
      end
      object lblValorDesconto: TRLLabel
        Left = 452
        Top = 1
        Width = 29
        Height = 14
        Caption = '0,00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        BeforePrint = lblValorDescontoBeforePrint
      end
      object lblTotal: TRLLabel
        Left = 684
        Top = 1
        Width = 32
        Height = 14
        Alignment = taRightJustify
        Caption = '0,00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel25: TRLLabel
        Left = 572
        Top = 15
        Width = 60
        Height = 14
        Caption = 'Frete R$:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel26: TRLLabel
        Left = 538
        Top = 29
        Width = 94
        Height = 14
        Caption = 'Valor total R$:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblFrete: TRLLabel
        Left = 684
        Top = 15
        Width = 32
        Height = 14
        Alignment = taRightJustify
        Caption = '0,00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblValorTotal: TRLLabel
        Left = 684
        Top = 29
        Width = 32
        Height = 14
        Alignment = taRightJustify
        Caption = '0,00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object rrlPesoBruto: TRLLabel
        Left = 1
        Top = 15
        Width = 68
        Height = 14
        Caption = 'Peso Bruto:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
    end
    object RLBPAF: TRLBand
      Left = 38
      Top = 219
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
        Left = 0
        Top = 115
        Width = 41
        Height = 14
        Caption = 'C'#243'digo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel10: TRLLabel
        Left = 42
        Top = 115
        Width = 61
        Height = 14
        Caption = 'Refer'#234'ncia'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel11: TRLLabel
        Left = 110
        Top = 115
        Width = 66
        Height = 14
        Caption = 'Ref Interna'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object RLLabel13: TRLLabel
        Left = 352
        Top = 115
        Width = 82
        Height = 14
        Alignment = taRightJustify
        Caption = 'Prateleira'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel14: TRLLabel
        Left = 436
        Top = 115
        Width = 26
        Height = 14
        Caption = 'Und'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel17: TRLLabel
        Left = 472
        Top = 115
        Width = 45
        Height = 14
        Alignment = taRightJustify
        Caption = 'Quantd'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel18: TRLLabel
        Left = 527
        Top = 115
        Width = 59
        Height = 14
        Caption = 'Vl Unitario'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel19: TRLLabel
        Left = 589
        Top = 115
        Width = 59
        Height = 14
        Caption = 'Vl c/ Desc'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel20: TRLLabel
        Left = 683
        Top = 115
        Width = 32
        Height = 14
        Caption = 'Total'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
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
      object RLLabel23: TRLLabel
        Left = 178
        Top = 115
        Width = 55
        Height = 14
        Caption = 'Descri'#231#227'o'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
    end
    object rlgrp1: TRLGroup
      Left = 38
      Top = 351
      Width = 718
      Height = 34
      DataFields = 'dsAmbiente'
      object RLBand4: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 16
        BandType = btHeader
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = True
        Borders.DrawRight = False
        Borders.DrawBottom = False
        object RLDBText7: TRLDBText
          Left = 4
          Top = 0
          Width = 71
          Height = 15
          DataField = 'dsAmbiente'
          DataSource = DS
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Text = ''
        end
      end
      object RLBand2: TRLBand
        Left = 0
        Top = 16
        Width = 718
        Height = 18
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        Color = cl3DLight
        ParentColor = False
        Transparent = False
        AfterPrint = RLBand2AfterPrint
        BeforePrint = RLBand2BeforePrint
        object Image1: TImage
          Left = 354
          Top = 1
          Width = 83
          Height = 50
          Stretch = True
          Visible = False
        end
        object RLLblUnitario: TRLLabel
          Left = 527
          Top = 0
          Width = 59
          Height = 17
          Alignment = taRightJustify
          AutoSize = False
          Caption = '                         '
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = False
        end
        object RLLblDesconto: TRLLabel
          Left = 589
          Top = 0
          Width = 59
          Height = 17
          Alignment = taRightJustify
          AutoSize = False
          Caption = '                         '
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = False
        end
        object RLLblTotal: TRLLabel
          Left = 652
          Top = 0
          Width = 63
          Height = 17
          Alignment = taRightJustify
          AutoSize = False
          Caption = '                         '
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = False
        end
        object QRECodigo: TRLDBText
          Left = 0
          Top = 0
          Width = 37
          Height = 13
          AutoSize = False
          DataField = 'cdProduto'
          DataSource = DS
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Text = ''
          Transparent = False
        end
        object QREDescricao: TRLDBText
          Left = 181
          Top = -1
          Width = 190
          Height = 13
          AutoSize = False
          DataField = 'nmProduto'
          DataSource = DS
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Text = ''
          Transparent = False
        end
        object QREPreco: TRLDBResult
          Left = 623
          Top = 0
          Width = 5
          Height = 5
          Alignment = taRightJustify
          AutoSize = False
          DataFormula = '(vlPreco-((vlPreco*nrDesconto)/100))'
          DataSource = DS
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Text = ''
          BeforePrint = QREPrecoBeforePrint
        end
        object QREQtd: TRLDBResult
          Left = 428
          Top = 0
          Width = 89
          Height = 11
          Alignment = taRightJustify
          DataFormula = 'NrQtd * 1'
          DataSource = DS
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Text = ''
          Transparent = False
          BeforePrint = QREQtdBeforePrint
        end
        object QRETotal: TRLDBText
          Left = 699
          Top = 0
          Width = 5
          Height = 5
          Alignment = taRightJustify
          AutoSize = False
          DataFormula = 'NrQtd*(vlPreco-((vlPreco*nrDesconto)/100))'
          DataSource = DS
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Text = ''
          BeforePrint = QRETotalBeforePrint
        end
        object QreUnidade: TRLDBText
          Left = 434
          Top = 0
          Width = 29
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'dsUnidade'
          DataSource = DS
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Text = ''
          Transparent = False
        end
        object RLDBResult3: TRLDBResult
          Left = 564
          Top = 0
          Width = 5
          Height = 5
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'vlDesconto'
          DataSource = DS
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Text = ''
          BeforePrint = RLDBResult3BeforePrint
        end
        object RLDBText1: TRLDBText
          Left = 42
          Top = 0
          Width = 90
          Height = 11
          AutoSize = False
          DataField = 'dsReferencia'
          DataSource = DS
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Text = ''
          Transparent = False
        end
        object RLDBText2: TRLDBText
          Left = 369
          Top = 0
          Width = 65
          Height = 13
          AutoSize = False
          DataField = 'dsPrateleira'
          DataSource = DS
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Text = ''
          Transparent = False
        end
        object RLDBText6: TRLDBText
          Left = 109
          Top = 0
          Width = 66
          Height = 12
          AutoSize = False
          DataField = 'cdCodigoDIC'
          DataSource = DS
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Text = ''
          Transparent = False
          Visible = False
        end
        object RlDescricao: TRLLabel
          Left = 178
          Top = 0
          Width = 212
          Height = 13
          AutoSize = False
          Caption = '                         '
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = False
          Visible = False
        end
        object RLLinhaProduto: TRLDraw
          Left = 0
          Top = 15
          Width = 718
          Height = 1
          Pen.Style = psDot
          Transparent = False
          Visible = False
        end
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
    Left = 152
    Top = 8
  end
  object ADOQryConfig: TADOQuery
    Connection = DModulo.Conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'Select dsObsPrevenda as dsMenPromocional,nmEmpresa,dsPrazoOrcame' +
        'nto,dsEndereco,'
      '           dsCgc,dsInscricao,dsCidade, dsTelefone as telefone,'
      'dsEmail as email'
      'From Configuracao'
      '')
    Left = 96
    Top = 8
    object ADOQryConfigdsMenPromocional: TStringField
      FieldName = 'dsMenPromocional'
      Size = 150
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
    object ADOQryConfigtelefone: TStringField
      FieldName = 'telefone'
    end
    object ADOQryConfigemail: TStringField
      FieldName = 'email'
      Size = 40
    end
  end
  object DS: TDataSource
    DataSet = ADOSPRelDados
    Left = 216
    Top = 8
  end
  object DSConfig: TDataSource
    DataSet = ADOQryConfig
    Left = 280
    Top = 8
  end
  object RLExpressionParser1: TRLExpressionParser
    Left = 584
    Top = 8
  end
  object ADOSPRelDados: TADOStoredProc
    Connection = DModulo.Conexao
    CommandTimeout = 60
    ProcedureName = 'SUP_Imp_Pedido_Prevenda;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
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
      end
      item
        Name = '@ORDEM'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 504
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
    Left = 736
    Top = 8
  end
  object Qualidade_Dos: TRLDraftFilter
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
    Left = 426
    Top = 9
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
    Left = 800
    Top = 8
  end
  object adoQryCabecalho: TADOQuery
    Connection = DModulo.Conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select logomarca, nmEmpresa, '
      'dsendereco as endereco,'
      'dsTelefone as telefone,'
      'dsEmail as email,'
      'dsCGC as CNPJ,'
      'nrGarantiaPecas, '
      'nrGarantiaServicos'
      'from configuracao')
    Left = 39
    Top = 9
  end
  object RLPDFFilter1: TRLPDFFilter
    DocumentInfo.Creator = 
      'FortesReport Community Edition v4.0 \251 Copyright '#169' 1999-2016 F' +
      'ortes Inform'#225'tica'
    FileName = 'teste.pdf'
    DisplayName = 'Documento PDF'
    Left = 368
    Top = 8
  end
end
