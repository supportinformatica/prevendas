unit Rel_Orcamentos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, DB, ADODB, jpeg, RLReport;

type
  TFrmRel_Orcamento = class(TForm)
    QuickRep1: TQuickRep;
    QRB1: TQRBand;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    RLLabel5: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel18: TQRLabel;
    QrlComplemento: TQRLabel;
    QRBand1: TQRBand;
    QreTotal: TQRExpr;
    QreDescricao: TQRExpr;
    QrePreco: TQRExpr;
    QreQtd: TQRExpr;
    QreUnidade: TQRExpr;
    QRExpr2: TQRExpr;
    QRBand2: TQRBand;
    QRL2: TQRLabel;
    QrlTotalG: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    RlObs: TQRLabel;
    QRLabel3: TQRLabel;
    rllabel4: TQRLabel;
    QrlCliente: TQRLabel;
    QrlAtt: TQRLabel;
    RLLabel6: TQRLabel;
    ADOQryRelDados: TADOQuery;
    ADOQryConfig: TADOQuery;
    ADOQryConfigdsMenPromocional: TStringField;
    ADOQryConfignmEmpresa: TStringField;
    ADOQryConfigdsPrazoOrcamento: TStringField;
    ADOQryConfigdsEndereco: TStringField;
    ADOQryConfigdsCgc: TStringField;
    ADOQryConfigdsInscricao: TStringField;
    ADOQryConfigdsCidade: TStringField;
    AdoQryCliente: TADOQuery;
    RLImage1: TQRImage;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    ADOQryRelDadosnmPessoa: TStringField;
    ADOQryRelDadosnmProduto: TStringField;
    ADOQryRelDadosdsReferencia: TStringField;
    ADOQryRelDadosNrQtd: TFloatField;
    ADOQryRelDadosvlPreco: TBCDField;
    ADOQryRelDadosdsUnidade: TStringField;
    QRLabel2: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRShape22: TQRShape;
    QRLabel16: TQRLabel;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRel_Orcamento: TFrmRel_Orcamento;

implementation

{$R *.dfm}

procedure TFrmRel_Orcamento.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  rllabel4.caption := InttoStr(StrToInt(rllabel4.caption) + 1);
end;

end.
