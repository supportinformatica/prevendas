object frmRelDeclaracao: TfrmRelDeclaracao
  Left = -4
  Top = -4
  Caption = 'frmRelDeclaracao'
  ClientHeight = 709
  ClientWidth = 1016
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object RLReport1: TRLReport
    Left = 32
    Top = 16
    Width = 794
    Height = 529
    Margins.TopMargin = 5.000000000000000000
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    PageSetup.PaperSize = fpCustom
    PageSetup.PaperWidth = 210.000000000000000000
    PageSetup.PaperHeight = 140.000000000000000000
    object RLDBText1: TRLDBText
      Left = 189
      Top = 24
      Width = 362
      Height = 22
      Alignment = taCenter
      AutoSize = False
      DataField = 'nmEmpresa'
      DataSource = dsConfig
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Text = ''
    end
    object RLDBText2: TRLDBText
      Left = 285
      Top = 60
      Width = 65
      Height = 15
      AutoSize = False
      DataField = 'dsTelefone'
      DataSource = dsConfig
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Text = ''
    end
    object RLDBText3: TRLDBText
      Left = 113
      Top = 44
      Width = 567
      Height = 15
      Alignment = taCenter
      AutoSize = False
      DataField = 'dsEndereco'
      DataSource = dsConfig
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Text = ''
    end
    object RLDBText4: TRLDBText
      Left = 388
      Top = 60
      Width = 123
      Height = 15
      AutoSize = False
      DataField = 'dsFax'
      DataSource = dsConfig
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Text = ''
    end
    object RLLabel1: TRLLabel
      Left = 120
      Top = 142
      Width = 571
      Height = 16
      Caption = 
        'Declaro para dos devidos fins, a quem interessar possa, que esto' +
        'u devolvendo a(s) mercadorias(s)'
    end
    object RLLabel2: TRLLabel
      Left = 80
      Top = 160
      Width = 244
      Height = 16
      Caption = 'constante(s) na nota fiscal de venda s'#233'rie'
    end
    object RLLabel3: TRLLabel
      Left = 424
      Top = 160
      Width = 18
      Height = 16
      Caption = 'N'#176
    end
    object RLLabel4: TRLLabel
      Left = 544
      Top = 160
      Width = 18
      Height = 16
      Caption = 'de'
    end
    object RLLabel5: TRLLabel
      Left = 664
      Top = 160
      Width = 26
      Height = 16
      Caption = ',ou '
    end
    object RLLabel6: TRLLabel
      Left = 80
      Top = 180
      Width = 102
      Height = 16
      Caption = 'Cupom Fiscal N'#176
    end
    object RLLabel7: TRLLabel
      Left = 280
      Top = 179
      Width = 18
      Height = 16
      Caption = 'de'
    end
    object RLLabel8: TRLLabel
      Left = 400
      Top = 180
      Width = 74
      Height = 16
      Caption = ', do ECF N'#176
    end
    object RLLabel9: TRLLabel
      Left = 568
      Top = 180
      Width = 125
      Height = 16
      Caption = ', tendo em vista que:'
    end
    object RLLabel10: TRLLabel
      Left = 240
      Top = 257
      Width = 52
      Height = 16
      Caption = 'Aracaju,'
    end
    object RLLabel11: TRLLabel
      Left = 360
      Top = 257
      Width = 18
      Height = 16
      Caption = 'de'
    end
    object RLLabel12: TRLLabel
      Left = 480
      Top = 257
      Width = 18
      Height = 16
      Caption = 'de'
    end
    object RLLabel13: TRLLabel
      Left = 144
      Top = 473
      Width = 487
      Height = 16
      Caption = 
        'Declara'#231#227'o emitida em cumprimento ao Art. 62 se'#231#227'o VII subse'#231#227'o ' +
        'I do RICMS-SE'
    end
    object RLLabel14: TRLLabel
      Left = 96
      Top = 217
      Width = 28
      Height = 16
      Caption = '(    )'
    end
    object RLLabel15: TRLLabel
      Left = 240
      Top = 217
      Width = 28
      Height = 16
      Caption = '(    )'
    end
    object RLLabel16: TRLLabel
      Left = 368
      Top = 217
      Width = 28
      Height = 16
      Caption = '(    )'
    end
    object RLLabel17: TRLLabel
      Left = 544
      Top = 217
      Width = 28
      Height = 16
      Caption = '(    )'
    end
    object RLLabel18: TRLLabel
      Left = 128
      Top = 217
      Width = 40
      Height = 16
      Caption = 'Troca'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object RLLabel19: TRLLabel
      Left = 272
      Top = 217
      Width = 59
      Height = 16
      Caption = 'Garantia'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object RLLabel20: TRLLabel
      Left = 400
      Top = 217
      Width = 120
      Height = 16
      Caption = 'Devolu'#231#227'o Parcial'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object RLLabel21: TRLLabel
      Left = 576
      Top = 217
      Width = 107
      Height = 16
      Caption = 'Devolu'#231#227'o Total'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object RLLabel22: TRLLabel
      Left = 104
      Top = 217
      Width = 11
      Height = 16
      Caption = 'X'
      Visible = False
    end
    object RLLabel23: TRLLabel
      Left = 248
      Top = 217
      Width = 11
      Height = 16
      Caption = 'X'
      Visible = False
    end
    object RLLabel24: TRLLabel
      Left = 376
      Top = 217
      Width = 11
      Height = 16
      Caption = 'X'
      Visible = False
    end
    object RLLabel25: TRLLabel
      Left = 552
      Top = 217
      Width = 11
      Height = 16
      Caption = 'X'
      Visible = False
    end
    object RLLabel26: TRLLabel
      Left = 144
      Top = 289
      Width = 106
      Height = 16
      Caption = 'Nome:...............:'
    end
    object RLLabel27: TRLLabel
      Left = 144
      Top = 313
      Width = 105
      Height = 16
      Caption = 'ENDERE'#199'O......:'
    end
    object RLLabel28: TRLLabel
      Left = 144
      Top = 337
      Width = 105
      Height = 16
      Caption = 'BAIRRO............:'
    end
    object RLLabel29: TRLLabel
      Left = 144
      Top = 361
      Width = 104
      Height = 16
      Caption = 'CIDADE............:'
    end
    object RLLabel30: TRLLabel
      Left = 144
      Top = 385
      Width = 104
      Height = 16
      Caption = 'FONE...............:'
    end
    object RLLabel31: TRLLabel
      Left = 144
      Top = 433
      Width = 102
      Height = 16
      Caption = 'ASSINATURA...:'
    end
    object RLLabel32: TRLLabel
      Left = 144
      Top = 409
      Width = 103
      Height = 16
      Caption = 'CPF/CNPJ........:'
    end
    object RLLabel33: TRLLabel
      Left = 424
      Top = 409
      Width = 27
      Height = 16
      Caption = 'RG:'
    end
    object RLLabel34: TRLLabel
      Left = 376
      Top = 385
      Width = 35
      Height = 16
      Caption = 'CEP:'
    end
    object RLDraw1: TRLDraw
      Left = 251
      Top = 306
      Width = 297
      Height = 1
    end
    object RLDraw2: TRLDraw
      Left = 250
      Top = 330
      Width = 297
      Height = 1
    end
    object RLDraw3: TRLDraw
      Left = 250
      Top = 352
      Width = 297
      Height = 1
    end
    object RLDraw4: TRLDraw
      Left = 249
      Top = 377
      Width = 297
      Height = 1
    end
    object RLDraw5: TRLDraw
      Left = 249
      Top = 401
      Width = 297
      Height = 1
    end
    object RLDraw6: TRLDraw
      Left = 248
      Top = 424
      Width = 297
      Height = 1
    end
    object RLDraw7: TRLDraw
      Left = 248
      Top = 448
      Width = 297
      Height = 1
    end
    object RLDraw8: TRLDraw
      Left = 185
      Top = 196
      Width = 91
      Height = 1
    end
    object RLDraw9: TRLDraw
      Left = 325
      Top = 176
      Width = 95
      Height = 1
    end
    object RLDraw10: TRLDraw
      Left = 447
      Top = 176
      Width = 92
      Height = 1
    end
    object RLDraw11: TRLDraw
      Left = 568
      Top = 176
      Width = 92
      Height = 1
    end
    object RLDraw12: TRLDraw
      Left = 301
      Top = 196
      Width = 91
      Height = 1
    end
    object RLDraw13: TRLDraw
      Left = 476
      Top = 196
      Width = 91
      Height = 1
    end
    object RlData2: TRLLabel
      Left = 304
      Top = 180
      Width = 94
      Height = 16
      AutoSize = False
    end
    object RlCupom: TRLLabel
      Left = 184
      Top = 180
      Width = 94
      Height = 16
      AutoSize = False
    end
    object RLECF: TRLLabel
      Left = 472
      Top = 180
      Width = 94
      Height = 16
      AutoSize = False
    end
    object RlSerie: TRLLabel
      Left = 325
      Top = 160
      Width = 96
      Height = 16
      AutoSize = False
    end
    object RLNota: TRLLabel
      Left = 446
      Top = 160
      Width = 96
      Height = 16
      AutoSize = False
    end
    object RlData1: TRLLabel
      Left = 566
      Top = 160
      Width = 96
      Height = 16
      AutoSize = False
    end
    object RLNome: TRLLabel
      Left = 251
      Top = 289
      Width = 298
      Height = 16
      AutoSize = False
    end
    object RLEndereco: TRLLabel
      Left = 251
      Top = 313
      Width = 298
      Height = 16
      AutoSize = False
    end
    object RlBairro: TRLLabel
      Left = 251
      Top = 337
      Width = 298
      Height = 16
      AutoSize = False
    end
    object RlCidade: TRLLabel
      Left = 251
      Top = 361
      Width = 298
      Height = 16
      AutoSize = False
    end
    object RlFone: TRLLabel
      Left = 251
      Top = 385
      Width = 124
      Height = 16
      AutoSize = False
    end
    object RLCEP: TRLLabel
      Left = 407
      Top = 381
      Width = 4
      Height = 16
    end
    object RlRG: TRLLabel
      Left = 447
      Top = 405
      Width = 4
      Height = 16
    end
    object RLCNPJ: TRLLabel
      Left = 251
      Top = 409
      Width = 174
      Height = 14
      AutoSize = False
    end
    object Rldia: TRLLabel
      Left = 295
      Top = 257
      Width = 64
      Height = 16
      AutoSize = False
    end
    object RlMes: TRLLabel
      Left = 383
      Top = 257
      Width = 98
      Height = 16
      AutoSize = False
    end
    object RlAno: TRLLabel
      Left = 503
      Top = 257
      Width = 64
      Height = 16
      AutoSize = False
    end
    object RLLabel38: TRLLabel
      Left = 344
      Top = 105
      Width = 93
      Height = 16
      Caption = 'DECLARA'#199#195'O'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object RLLabel35: TRLLabel
      Left = 260
      Top = 60
      Width = 33
      Height = 16
      Caption = 'Tel..:'
    end
    object RLLabel36: TRLLabel
      Left = 352
      Top = 60
      Width = 38
      Height = 16
      Caption = 'Fax..:'
    end
  end
  object ADOQryConfig: TADOQuery
    Connection = DModulo.Conexao
    Parameters = <>
    SQL.Strings = (
      'Select dsObsPrevenda as dsMenPromocional,nmEmpresa,'
      'dsPrazoOrcamento,dsEndereco,'
      'dsTelefone,dsFax, dsCgc,dsInscricao,dsCidade'
      'From Configuracao')
    Left = 648
    Top = 40
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
    object ADOQryConfigdsTelefone: TStringField
      FieldName = 'dsTelefone'
    end
    object ADOQryConfigdsFax: TStringField
      FieldName = 'dsFax'
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
  end
  object ADOQryRelDados: TADOQuery
    Connection = DModulo.Conexao
    Parameters = <>
    Left = 616
    Top = 40
  end
  object dsConfig: TDataSource
    DataSet = ADOQryConfig
    Left = 678
    Top = 38
  end
end
