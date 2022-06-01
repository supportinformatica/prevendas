inherited FrmCadEscola: TFrmCadEscola
  Left = 357
  Top = 139
  BorderStyle = bsSingle
  Caption = 'Cadastro de Escolas'
  FormStyle = fsStayOnTop
  OldCreateOrder = True
  Position = poMainFormCenter
  OnShow = FormShow
  ExplicitWidth = 562
  ExplicitHeight = 458
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlMoBotoes: TPanel
    inherited BtnMdImprimir: TBitBtn
      Visible = False
    end
  end
  inherited PgCtrolMdCadastro: TPageControl
    inherited TBSheetMdCadastroConsulta: TTabSheet
      OnShow = TBSheetMdCadastroConsultaShow
      inherited DBGrid1: TDBGrid
        OnDblClick = DBGrid1DblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'Codigo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Escola'
            Width = 336
            Visible = True
          end>
      end
      inherited PnlMdConsulta: TPanel
        inherited CmbConsulta: TComboBox
          OnChange = CmbConsultaChange
        end
        inherited EdtConsulta: TEdit
          OnChange = EdtConsultaChange
        end
      end
    end
    inherited TBSheetMdCadastroDados: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 449
      ExplicitHeight = 401
      inherited Bevel1: TBevel
        Left = 3
        Top = 0
        Width = 445
        Height = 399
        ExplicitLeft = 3
        ExplicitTop = 0
        ExplicitWidth = 445
        ExplicitHeight = 399
      end
      inherited Bevel2: TBevel
        Left = 168
        Top = 290
        Width = 85
        Height = 81
        Visible = False
        ExplicitLeft = 168
        ExplicitTop = 290
        ExplicitWidth = 85
        ExplicitHeight = 81
      end
      object Label1: TLabel
        Left = 10
        Top = 84
        Width = 78
        Height = 13
        Caption = 'Nome da Escola'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 10
        Top = 33
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object EditnmEscola: TEdit
        Left = 10
        Top = 99
        Width = 433
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 1
      end
      object EdtcdEscola: TEdit
        Left = 10
        Top = 48
        Width = 78
        Height = 21
        Color = clInfoBk
        ReadOnly = True
        TabOrder = 0
      end
    end
    inherited TBSheetMdCdRelatorio: TTabSheet
      TabVisible = False
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 449
      ExplicitHeight = 401
      object Label3: TLabel
        Left = 200
        Top = 112
        Width = 32
        Height = 13
        Caption = 'Label3'
      end
    end
  end
  inherited ImageCadastro: TImageList
    Bitmap = {
      494C0101030010002C0010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
  inherited ADOQrySalvar: TADOQuery
    Connection = DModulo.Conexao
    Left = 180
    Top = 129
  end
  inherited ADOQryAlterar: TADOQuery
    Connection = DModulo.Conexao
  end
  inherited ADOQryExcluir: TADOQuery
    Connection = DModulo.Conexao
  end
  inherited ADOQryUltimoCodigo: TADOQuery
    Connection = DModulo.Conexao
  end
  inherited ADOQryExistir: TADOQuery
    Connection = DModulo.Conexao
  end
  inherited ADOQryCombFone: TADOQuery
    Connection = DModulo.Conexao
  end
  inherited ADOQryPegaEstado: TADOQuery
    Connection = DModulo.Conexao
  end
  inherited ADOQryConsulta: TADOQuery
    Connection = DModulo.Conexao
    CursorType = ctStatic
    SQL.Strings = (
      'Select cdEscola as Codigo,dsEscola as Escola '
      ' From Escola')
  end
  inherited ADOdsConsulta: TDataSource
    Left = 213
    Top = 49
  end
end
