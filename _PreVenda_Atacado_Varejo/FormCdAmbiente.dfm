inherited FrmCdAmbiente: TFrmCdAmbiente
  AutoSize = False
  BorderStyle = bsSingle
  Caption = 'Cadastro de Ambientes'
  ClientHeight = 330
  ClientWidth = 387
  Position = poMainFormCenter
  Visible = False
  OnShow = FormShow
  ExplicitWidth = 393
  ExplicitHeight = 358
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlMoBotoes: TPanel
    Left = 288
    Height = 331
    ExplicitLeft = 288
    ExplicitHeight = 331
    inherited BtnMdImprimir: TBitBtn [0]
      Left = 29
      Top = 259
      Width = 43
      Height = 28
      Visible = False
      ExplicitLeft = 29
      ExplicitTop = 259
      ExplicitWidth = 43
      ExplicitHeight = 28
    end
    inherited BtnMdNovo: TBitBtn [1]
      Top = 4
      ExplicitTop = 4
    end
    inherited BtnMdSalvar: TBitBtn [2]
      Top = 34
      ExplicitTop = 34
    end
    inherited BtnMdAlterar: TBitBtn [3]
      Top = 64
      ExplicitTop = 64
    end
    inherited BtnMdExcluir: TBitBtn [4]
      Top = 94
      ExplicitTop = 94
    end
    inherited BtnMdPrimeiro: TBitBtn [5]
      Left = 6
      Top = 167
      ExplicitLeft = 6
      ExplicitTop = 167
    end
    inherited BtnMdProximo: TBitBtn [6]
      Left = 6
      Top = 197
      ExplicitLeft = 6
      ExplicitTop = 197
    end
    inherited BtnMdAnterior: TBitBtn [7]
      Left = 6
      Top = 227
      ExplicitLeft = 6
      ExplicitTop = 227
    end
    inherited BtnMdUltimo: TBitBtn [8]
      Left = 6
      Top = 257
      ExplicitLeft = 6
      ExplicitTop = 257
    end
    inherited BtnMdSair: TBitBtn
      Left = 6
      Top = 294
      ExplicitLeft = 6
      ExplicitTop = 294
    end
    inherited BtnMdCancelar: TBitBtn
      Top = 124
      Width = 86
      Kind = bkCustom
      ModalResult = 0
      ExplicitTop = 124
      ExplicitWidth = 86
    end
  end
  inherited PgCtrolMdCadastro: TPageControl
    Width = 288
    Height = 331
    ExplicitWidth = 288
    ExplicitHeight = 331
    inherited TBSheetMdCadastroConsulta: TTabSheet
      ExplicitWidth = 280
      ExplicitHeight = 302
      inherited DBGrid1: TDBGrid
        Left = 3
        Top = 76
        Width = 281
        Height = 228
        OnDblClick = DBGrid1DblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'cdAmbiente'
            Title.Caption = 'C'#243'digo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dsAmbiente'
            Title.Caption = 'Descri'#231#227'o do Ambiente'
            Visible = True
          end>
      end
      inherited PnlMdConsulta: TPanel
        Width = 280
        ExplicitWidth = 280
        inherited CmbConsulta: TComboBox
          ItemIndex = 2
          Text = 'Descri'#231#227'o'
          OnChange = CmbConsultaChange
          Items.Strings = (
            'Todos'
            'C'#243'digo '
            'Descri'#231#227'o')
        end
        inherited EdtConsulta: TEdit
          Width = 157
          OnChange = EdtConsultaChange
          ExplicitWidth = 157
        end
      end
    end
    inherited TBSheetMdCadastroDados: TTabSheet
      ExplicitWidth = 280
      ExplicitHeight = 302
      inherited Bevel1: TBevel
        Left = 408
        Top = 312
        Width = 17
        Height = 9
        Visible = False
        ExplicitLeft = 408
        ExplicitTop = 312
        ExplicitWidth = 17
        ExplicitHeight = 9
      end
      inherited Bevel2: TBevel
        Left = 408
        Top = 339
        Width = 25
        Height = 14
        Visible = False
        ExplicitLeft = 408
        ExplicitTop = 339
        ExplicitWidth = 25
        ExplicitHeight = 14
      end
      object Label1: TLabel
        Left = 24
        Top = 20
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
      end
      object Label2: TLabel
        Left = 24
        Top = 66
        Width = 110
        Height = 13
        Caption = 'Descri'#231#227'o do Ambiente'
      end
      object EdtCdAmbiente: TEdit
        Left = 24
        Top = 35
        Width = 57
        Height = 21
        Color = clInfoBk
        Enabled = False
        TabOrder = 0
      end
      object EdtDsAmbiente: TEdit
        Left = 24
        Top = 81
        Width = 201
        Height = 21
        Color = clWhite
        MaxLength = 30
        TabOrder = 1
      end
    end
    inherited TBSheetMdCdRelatorio: TTabSheet
      TabVisible = False
      ExplicitWidth = 280
      ExplicitHeight = 302
    end
  end
  inherited ImageCadastro: TImageList
    Left = 184
    Top = 168
    Bitmap = {
      494C010103000400140010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000FFFFFF00FFFFFF0000000000000000000000
      000000000000000000000000000000000000C6C6C600C6C6C600C6C6C6000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF0000000000FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF000000
      000000000000000000000000000000000000C6C6C60000008400C6C6C6000000
      0000FFFFFF0084000000840000008400000084000000FFFFFF0000000000FFFF
      FF008400000084000000FFFFFF0000000000000000000000000000000000C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000FFFFFF008484840000000000FFFFFF00FFFFFF000000000000000000FFFF
      FF00FFFFFF00000000000000000000000000C6C6C600C6C6C600C6C6C6000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF008484840000000000000000008484840000000000FFFFFF00FFFFFF000000
      000000000000000000000000000000000000C6C6C60000008400C6C6C6000000
      0000FFFFFF0084000000840000008400000084000000FFFFFF0000000000FFFF
      FF008400000084000000FFFFFF00000000000000000000000000C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C6000000FF000000FF000000FF00C6C6C600C6C6
      C600C6C6C6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF008484
      840000000000FFFFFF0000FFFF0000000000000000008484840000000000FFFF
      FF00FFFFFF00000000000000000000000000C6C6C600C6C6C600C6C6C6000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000000000000000008484
      840000000000000000000000000000000000C6C6C60000008400C6C6C6000000
      0000FFFFFF0084000000840000008400000084000000FFFFFF0000000000FFFF
      FF008400000084000000FFFFFF00000000000000000000000000C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6000000
      000000000000C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF000000
      000000000000000000000000000000000000C6C6C600C6C6C600C6C6C6000000
      0000FFFFFF00FFFFFF00000000000000000084848400C6C6C60000000000C6C6
      C600C6C6C600C6C6C600C6C6C600000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C600C6C6C6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF00FFFFFF00000000000000000000000000C6C6C60000008400C6C6C6000000
      0000FFFFFF00840000000000000000000000000000000000000084848400C6C6
      C6008400000084000000C6C6C600000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000000000C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF0000000000000000000000000000000000C6C6C600C6C6C600C6C6C6000000
      0000FFFFFF00FFFFFF00848484000000000000000000C6C6C600000000000000
      000084848400C6C6C600C6C6C600000000000000000000000000000000000000
      0000FFFFFF00FF000000FF000000FF000000FF000000FF000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF000000
      000000000000000000000000000000000000C6C6C60000008400C6C6C6000000
      0000FFFFFF00840000008400000000000000C6C6C600FFFFFF00FFFFFF00C6C6
      C6000000000000000000C6C6C600000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF0000000000000000000000
      000000000000000000000000000000000000C6C6C600C6C6C600C6C6C6000000
      0000FFFFFF00FFFFFF00FFFFFF008484840000000000FFFFFF00FFFFFF00FFFF
      FF00C6C6C6000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FF000000FF000000FF000000FF000000FF000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C600FFFFFF00FFFF
      FF00C6C6C6000000000000848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF00008484840000000000C6C6C600C6C6
      C6000000000000FFFF0084000000008484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF0000FFFF0000FFFF00840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF00FFFFFF00FFFFFF0000FFFF0000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00F07F0000FFFF0000E01F0000E00F0000
      C0070000C00700008203000080030000C0870000800300008023000080010000
      C007000080010000C0070000C001000080030000E0010000C0070000F0030000
      F00D0000F00F0000FC580000F00F0000FF300000F8070000FFFD0000FFFF0000
      FFFD0000FFFF0000FFFFFFC0FFFF000000000000000000000000000000000000
      000000000000}
  end
  inherited PopupMenu1: TPopupMenu
    Left = 224
    Top = 136
  end
  inherited ADOQrySalvar: TADOQuery
    Connection = DModulo.Conexao
    Left = 28
    Top = 225
  end
  inherited ADOQryAlterar: TADOQuery
    Connection = DModulo.Conexao
    Left = 68
    Top = 225
  end
  inherited ADOQryExcluir: TADOQuery
    Connection = DModulo.Conexao
    Left = 108
    Top = 225
  end
  inherited ADOQryUltimoCodigo: TADOQuery
    Connection = DModulo.Conexao
    Left = 148
    Top = 225
  end
  inherited ADOQryExistir: TADOQuery
    Connection = DModulo.Conexao
    Left = 188
    Top = 225
  end
  inherited ADOQryCombFone: TADOQuery
    Connection = DModulo.Conexao
    Left = 228
    Top = 225
  end
  inherited ADOQryPegaEstado: TADOQuery
    Connection = DModulo.Conexao
    Left = 228
    Top = 273
  end
  inherited ADOQryConsulta: TADOQuery
    Connection = DModulo.Conexao
    CursorType = ctStatic
    SQL.Strings = (
      'select * from Ambiente')
    Left = 93
    Top = 153
    object ADOQryConsultacdAmbiente: TAutoIncField
      FieldName = 'cdAmbiente'
      ReadOnly = True
    end
    object ADOQryConsultadsAmbiente: TStringField
      FieldName = 'dsAmbiente'
      Size = 30
    end
  end
  inherited ADOdsConsulta: TDataSource
    Left = 21
    Top = 153
  end
end
