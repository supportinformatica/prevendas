object frmRelOrcamentosAmbiente: TfrmRelOrcamentosAmbiente
  Left = 0
  Top = 0
  Caption = 'frmRelOrcamentosAmbiente'
  ClientHeight = 411
  ClientWidth = 802
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object RLReport1: TRLReport
    Left = 8
    Top = 8
    Width = 794
    Height = 1123
    DataSource = DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ExpressionParser = RLExpressionParser1
    object RLBand5: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 174
      BandType = btTitle
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object QrlCnpj: TRLLabel
        Left = 6
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
        Left = 533
        Top = 30
        Width = 179
        Height = 25
        Caption = '** Pr'#233'-Venda **'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object QRLblPrograma: TRLLabel
        Left = 6
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
        Top = 57
        Width = 716
        Height = 1
      end
      object RLDraw2: TRLDraw
        Left = 0
        Top = 141
        Width = 718
        Height = 1
      end
      object QRLabel10: TRLLabel
        Left = 3
        Top = 64
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
        Top = 80
        Width = 41
        Height = 13
        Caption = 'Endere:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object QRLabel1: TRLLabel
        Left = 3
        Top = 126
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
        Left = 45
        Top = 64
        Width = 261
        Height = 13
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Layout = tlBottom
        ParentFont = False
      end
      object QrlEndereco: TRLLabel
        Left = 45
        Top = 80
        Width = 262
        Height = 13
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        Layout = tlBottom
        ParentFont = False
      end
      object QRLabel16: TRLLabel
        Left = 463
        Top = 96
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
        Left = 308
        Top = 80
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
        Top = 96
        Width = 87
        Height = 13
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Layout = tlBottom
        ParentFont = False
      end
      object QrlBairro: TRLLabel
        Left = 344
        Top = 80
        Width = 117
        Height = 13
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Layout = tlBottom
        ParentFont = False
      end
      object Qrl: TRLLabel
        Left = 463
        Top = 64
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
        Left = 463
        Top = 80
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
        Top = 64
        Width = 99
        Height = 13
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Layout = tlBottom
        ParentFont = False
      end
      object QrlCidade: TRLLabel
        Left = 510
        Top = 80
        Width = 136
        Height = 13
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Layout = tlBottom
        ParentFont = False
      end
      object QrlReimpressao: TRLLabel
        Left = 648
        Top = 64
        Width = 64
        Height = 13
        Caption = 'Reimpress'#227'o'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Layout = tlBottom
        ParentFont = False
        Visible = False
      end
      object QRLabel3: TRLLabel
        Left = 150
        Top = 126
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
        Left = 463
        Top = 126
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
        Top = 108
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
        Top = 159
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
        Left = 125
        Top = 159
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
      object QRLabel12: TRLLabel
        Left = 442
        Top = 159
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
        Left = 495
        Top = 159
        Width = 25
        Height = 14
        Caption = 'Qtd'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object QRLabel8: TRLLabel
        Left = 527
        Top = 159
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
        Top = 159
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
        Left = 649
        Top = 108
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
        Layout = tlBottom
        ParentFont = False
        Text = ''
      end
      object QRSysData2: TRLSystemInfo
        Left = 658
        Top = 126
        Width = 47
        Height = 13
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Info = itHour
        Layout = tlBottom
        ParentFont = False
        Text = ''
        Visible = False
      end
      object QREVendedor: TRLDBText
        Left = 208
        Top = 126
        Width = 218
        Height = 13
        AutoSize = False
        DataField = 'nmPessoa'
        DataSource = DataSource1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Layout = tlBottom
        ParentFont = False
        Text = ''
      end
      object QREOrcamento: TRLDBText
        Left = 65
        Top = 126
        Width = 83
        Height = 15
        AutoSize = False
        DataField = 'nrOrcamento'
        DataSource = DataSource1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Text = ''
      end
      object RLLabel1: TRLLabel
        Left = 44
        Top = 158
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
        Left = 600
        Top = 158
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
        Left = 3
        Top = 111
        Width = 55
        Height = 13
        Caption = 'CPF/CNPJ:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Layout = tlBottom
        ParentFont = False
      end
      object QrlRG: TRLLabel
        Left = 308
        Top = 110
        Width = 45
        Height = 13
        Caption = 'RG/Insc:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Layout = tlBottom
        ParentFont = False
      end
      object QrlUf: TRLLabel
        Left = 463
        Top = 110
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
        Left = 1
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
        Left = 3
        Top = 95
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
        Top = 95
        Width = 230
        Height = 13
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Layout = tlBottom
        ParentFont = False
      end
      object s: TRLLabel
        Left = 646
        Top = 94
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
        Left = 309
        Top = 64
        Width = 155
        Height = 13
        AutoSize = False
        Caption = ' '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Layout = tlBottom
        ParentFont = False
      end
      object RLLabel5: TRLLabel
        Left = 377
        Top = 159
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
        Left = 510
        Top = 110
        Width = 16
        Height = 13
        Caption = 'UF'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Layout = tlBottom
        ParentFont = False
      end
      object QRLblPagina: TRLLabel
        Left = 645
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
        Left = 680
        Top = 1
        Width = 32
        Height = 12
        Alignment = taRightJustify
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
        Left = 685
        Top = 12
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
      object QreEmissao: TRLDBText
        Left = 624
        Top = 126
        Width = 41
        Height = 13
        AutoSize = False
        DataField = 'hrHora'
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
        Top = 126
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
      object RLLabel23: TRLLabel
        Left = 2
        Top = 142
        Width = 66
        Height = 16
        Caption = 'Ambiente'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object RLBand1: TRLBand
      Left = 38
      Top = 252
      Width = 718
      Height = 104
      BandType = btSummary
      object RLDBResult4: TRLDBResult
        Left = 465
        Top = 1
        Width = 81
        Height = 13
        AutoSize = False
        DataFormula = '(((NrQtd*vlPreco) * nrDesconto) / 100)'
        DataSource = DataSource1
        DisplayMask = '#,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        Info = riSum
        ParentFont = False
        Text = ''
      end
      object QrlSub: TRLLabel
        Left = 24
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
        Left = 327
        Top = 62
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
      object QRLblPrevisao: TRLLabel
        Left = 327
        Top = 32
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
        Width = 54
        Height = 14
        Caption = 'Total R$:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object QRLabel18: TRLLabel
        Left = 540
        Top = 62
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
        DataSource = DSConfig
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
        DataSource = DataSource1
        DisplayMask = '#,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        Info = riSum
        ParentFont = False
        Text = ''
      end
      object RLDBResult1: TRLDBResult
        Left = 98
        Top = 1
        Width = 131
        Height = 14
        DataFormula = 'NrQtd*vlPreco'
        DataSource = DataSource1
        DisplayMask = '#,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
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
        Width = 116
        Height = 14
        DataField = 'nrDesconto'
        DataSource = DataSource1
        DisplayMask = '0.00%'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLLabel3: TRLLabel
        Left = 200
        Top = 1
        Width = 76
        Height = 14
        Caption = 'Desconto %:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object RlblFormaPgto: TRLLabel
        Left = 4
        Top = 16
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
      object RLLabel21: TRLLabel
        Left = 331
        Top = 80
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
        Left = 4
        Top = 31
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
        Left = 39
        Top = 31
        Width = 282
        Height = 71
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
    end
    object RLGroup1: TRLGroup
      Left = 38
      Top = 212
      Width = 718
      Height = 40
      AllowedBands = [btDetail]
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      DataFields = 'cdAmbiente'
      ForceMinBands = True
      AfterPrint = RLGroup1AfterPrint
      BeforePrint = RLGroup1BeforePrint
      object RLBand3: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 20
        Computable = False
      end
      object RLBand2: TRLBand
        Left = 0
        Top = 20
        Width = 718
        Height = 20
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        BeforePrint = RLBand2BeforePrint
        object QRETotal: TRLDBText
          Left = 664
          Top = 3
          Width = 50
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          DataFormula = 'NrQtd*(vlPreco-((vlPreco*nrDesconto)/100))'
          DataSource = DataSource1
          DisplayMask = '#,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object QRECodigo: TRLDBText
          Left = 3
          Top = 3
          Width = 52
          Height = 13
          DataField = 'cdProduto'
          DataSource = DataSource1
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object QREDescricao: TRLDBText
          Left = 125
          Top = 3
          Width = 252
          Height = 13
          AutoSize = False
          DataField = 'nmProduto'
          DataSource = DataSource1
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object QreUnidade: TRLDBText
          Left = 435
          Top = 3
          Width = 33
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'dsUnidade'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object QREPreco: TRLDBResult
          Left = 426
          Top = 3
          Width = 233
          Height = 13
          Alignment = taRightJustify
          DataFormula = '(vlPreco-((vlPreco*nrDesconto)/100))'
          DataSource = DataSource1
          DisplayMask = '#,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object QREQtd: TRLDBResult
          Left = 470
          Top = 3
          Width = 52
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'NrQtd'
          DataSource = DataSource1
          DisplayMask = '#,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLDBText1: TRLDBText
          Left = 53
          Top = 3
          Width = 66
          Height = 13
          DataField = 'dsReferencia'
          DataSource = DataSource1
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLDBResult3: TRLDBResult
          Left = 523
          Top = 3
          Width = 63
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'vlDesconto'
          DataSource = DataSource1
          DisplayMask = '#,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RlDescricao: TRLLabel
          Left = 125
          Top = 4
          Width = 217
          Height = 12
          AutoSize = False
          Caption = '                         '
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Visible = False
        end
        object RLDBText2: TRLDBText
          Left = 330
          Top = 4
          Width = 101
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'dsPrateleira'
          DataSource = DataSource1
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
      end
      object RLDBText3: TRLDBText
        Left = 3
        Top = 0
        Width = 81
        Height = 16
        DataField = 'dsAmbiente'
        DataSource = DataSource1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
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
    Left = 384
    Top = 8
  end
  object ADOQryConfig: TADOQuery
    Connection = DModulo.Conexao
    Parameters = <>
    SQL.Strings = (
      'Select dsObsPrevenda as dsMenPromocional,nmEmpresa,'
      'dsPrazoOrcamento,dsEndereco,'
      '           dsCgc,dsInscricao,dsCidade'
      'From Configuracao'
      '')
    Left = 482
    Top = 58
    object ADOQryConfigdsMenPromocional: TStringField
      FieldName = 'dsMenPromocional'
      Size = 40
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
  object DSConfig: TDataSource
    DataSet = ADOQryConfig
    Left = 616
    Top = 10
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
    Left = 296
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
    Left = 474
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
    Left = 568
    Top = 10
  end
  object AdoQryConsulta: TADOQuery
    Connection = DModulo.Conexao
    CursorType = ctStatic
    Parameters = <>
    Left = 128
    Top = 8
    object AdoQryConsultanmPessoa: TStringField
      FieldName = 'nmPessoa'
      Size = 40
    end
    object AdoQryConsultanmProduto: TStringField
      FieldName = 'nmProduto'
      Size = 40
    end
    object AdoQryConsultadsProdutoNota: TStringField
      FieldName = 'dsProdutoNota'
      Size = 40
    end
    object AdoQryConsultadsReferencia: TStringField
      FieldName = 'dsReferencia'
      Size = 15
    end
    object AdoQryConsultacdPessoa: TIntegerField
      FieldName = 'cdPessoa'
    end
    object AdoQryConsultanrOrcamento: TIntegerField
      FieldName = 'nrOrcamento'
    end
    object AdoQryConsultacdCliente: TIntegerField
      FieldName = 'cdCliente'
    end
    object AdoQryConsultacdProduto: TIntegerField
      FieldName = 'cdProduto'
      KeyFields = 'cdProduto'
      ReadOnly = True
    end
    object AdoQryConsultadtEmissao: TDateTimeField
      FieldName = 'dtEmissao'
    end
    object AdoQryConsultaNrQtd: TFloatField
      FieldName = 'NrQtd'
    end
    object AdoQryConsultavlPreco: TBCDField
      FieldName = 'vlPreco'
      Precision = 19
    end
    object AdoQryConsultanrDesconto: TFloatField
      FieldName = 'nrDesconto'
    end
    object AdoQryConsultadsUnidade: TStringField
      FieldName = 'dsUnidade'
      Size = 3
    end
    object AdoQryConsultadsPrateleira: TStringField
      FieldName = 'dsPrateleira'
    end
    object AdoQryConsultacdAmbiente: TIntegerField
      FieldName = 'cdAmbiente'
    end
    object AdoQryConsultadsAmbiente: TStringField
      FieldName = 'dsAmbiente'
      Size = 30
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery2
    Left = 32
    Top = 8
  end
  object ADOQuery2: TADOQuery
    Connection = DModulo.Conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT P.nmPessoa,T.nmProduto,T.dsProdutoNota,T.dsReferencia,O.c' +
        'dPessoa,'
      
        'O.nrOrcamento,O.cdCliente,I.cdProduto,O.dtEmissao,I.NrQtd,I.vlPr' +
        'eco,'
      
        'O.nrDesconto,T.dsUnidade,T.dsPrateleira, I.cdAmbiente, A.dsAmbie' +
        'nte'
      
        'FROM Orcamento O WITH (nolock),Pessoa P WITH (nolock),Produto T ' +
        'WITH (nolock),IteOrcamento I WITH (nolock),'
      '     Ambiente A'
      
        'WHERE P.cdPessoa = O.cdPessoa And T.cdProduto = I.cdProduto And ' +
        '                            '
      
        'O.cdPessoa = P.cdPessoa And I.dsSituacao = '#39#39' And A.cdAmbiente =' +
        '* I.cdAmbiente                '
      'and O.nrOrcamento = I.nrOrcamento And O.nrOrcamento = 26415'
      
        'group by I.cdAmbiente, P.nmPessoa,T.nmProduto,T.dsProdutoNota,T.' +
        'dsReferencia,O.cdPessoa,'
      
        'O.nrOrcamento,O.cdCliente,I.cdProduto,O.dtEmissao,I.NrQtd,I.vlPr' +
        'eco,'
      'O.nrDesconto,T.dsUnidade,T.dsPrateleira, A.dsAmbiente'
      'order by T.dsPrateleira   ')
    Left = 224
    Top = 11
    object ADOQuery2nmPessoa: TStringField
      FieldName = 'nmPessoa'
      Size = 40
    end
    object ADOQuery2nmProduto: TStringField
      FieldName = 'nmProduto'
      Size = 40
    end
    object ADOQuery2dsProdutoNota: TStringField
      FieldName = 'dsProdutoNota'
      Size = 40
    end
    object ADOQuery2dsReferencia: TStringField
      FieldName = 'dsReferencia'
      Size = 15
    end
    object ADOQuery2cdPessoa: TIntegerField
      FieldName = 'cdPessoa'
    end
    object ADOQuery2nrOrcamento: TIntegerField
      FieldName = 'nrOrcamento'
    end
    object ADOQuery2cdCliente: TIntegerField
      FieldName = 'cdCliente'
    end
    object ADOQuery2cdProduto: TIntegerField
      FieldName = 'cdProduto'
    end
    object ADOQuery2dtEmissao: TDateTimeField
      FieldName = 'dtEmissao'
    end
    object ADOQuery2NrQtd: TFloatField
      FieldName = 'NrQtd'
    end
    object ADOQuery2vlPreco: TBCDField
      FieldName = 'vlPreco'
      Precision = 19
    end
    object ADOQuery2nrDesconto: TFloatField
      FieldName = 'nrDesconto'
    end
    object ADOQuery2dsUnidade: TStringField
      FieldName = 'dsUnidade'
      Size = 3
    end
    object ADOQuery2dsPrateleira: TStringField
      FieldName = 'dsPrateleira'
    end
    object ADOQuery2cdAmbiente: TIntegerField
      FieldName = 'cdAmbiente'
    end
    object ADOQuery2dsAmbiente: TStringField
      FieldName = 'dsAmbiente'
      Size = 30
    end
  end
  object RLExpressionParser1: TRLExpressionParser
    Left = 16
    Top = 56
  end
end
