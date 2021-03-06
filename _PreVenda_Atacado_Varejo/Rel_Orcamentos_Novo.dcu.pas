unit Rel_Orcamentos_Novo.dcu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, qrFramelines, QRCtrls, qrpctrls,
  QuickRpt, Vcl.ExtCtrls, Data.DB, Data.Win.ADODB;

type
  TfrmRel_Orcamento_Novo = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRLabel19: TQRLabel;
    QRLabel1: TQRLabel;
    QRPShape1: TQRPShape;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRShape1: TQRShape;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRShape2: TQRShape;
    QRLabel17: TQRLabel;
    QRShape3: TQRShape;
    QRBand2: TQRBand;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRBand3: TQRBand;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    QRExpr11: TQRExpr;
    QRExpr12: TQRExpr;
    QRExpr13: TQRExpr;
    QRExpr14: TQRExpr;
    QRExpr15: TQRExpr;
    QRExpr16: TQRExpr;
    QRExpr17: TQRExpr;
    ADOqryreldados: TADOQuery;
    ADOqryreldadosConfigNome: TStringField;
    ADOqryreldadosConfigCNPJ: TStringField;
    ADOqryreldadosConfEndereco: TStringField;
    ADOqryreldadosConfigCEP: TStringField;
    ADOqryreldadosConfigEmail: TStringField;
    ADOqryreldadosConfigIE: TStringField;
    ADOqryreldadosnrOrcamento: TIntegerField;
    ADOqryreldadosCliente: TStringField;
    ADOqryreldadosEndereco: TStringField;
    ADOqryreldadosTelefone: TStringField;
    ADOqryreldadosEmail: TStringField;
    ADOqryreldadosData: TDateTimeField;
    ADOqryreldadosResponsavel: TStringField;
    ADOqryreldadosObservacao: TMemoField;
    ADOqryreldadosnmproduto: TStringField;
    ADOqryreldadosRefFab: TStringField;
    ADOqryreldadosQtd: TFloatField;
    ADOqryreldadosVlUnit: TFloatField;
    ADOqryreldadosItemTotal: TFloatField;
    ADOqryreldadosNrTotalItens: TIntegerField;
    ADOqryreldadosQtdTotalItens: TFloatField;
    ADOqryreldadosSubTotal: TBCDField;
    ADOqryreldadosDesconto: TFMTBCDField;
    ADOqryreldadosTotal: TBCDField;
    QRExpr18: TQRExpr;
    QRExpr19: TQRExpr;
    QRExpr20: TQRExpr;
    QRExpr21: TQRExpr;
    QRExpr22: TQRExpr;
    QRExpr23: TQRExpr;
    QRExpr24: TQRExpr;
    QRMemo1: TQRMemo;
    QRLabel2: TQRLabel;
    QRExpr25: TQRExpr;
    ADOqryreldadosValidade: TStringField;
    QRBand4: TQRBand;
    QRLabel20: TQRLabel;
    QRShape4: TQRShape;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRLabel3: TQRLabel;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRExpr26: TQRExpr;
    ADOqryreldadosVlBruto: TFloatField;
    ADOqryreldadoscdProduto: TIntegerField;
    QRLabel4: TQRLabel;
    qrlblPag: TQRLabel;
    ADOqryreldadosdsServico: TStringField;
    ADOqryreldadoscdCodigoDIC: TStringField;
    ADOqryreldadosnmEmpresa: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRel_Orcamento_Novo: TfrmRel_Orcamento_Novo;

implementation

{$R *.dfm}

uses DataModulo;

end.
