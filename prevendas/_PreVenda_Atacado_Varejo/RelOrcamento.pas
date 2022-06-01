unit RelOrcamento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RelModelo, Db, DBTables, Qrctrls, QuickRpt, ExtCtrls, ADODB, QRExport,
  QRPDFFilt;

type
  TFrmRelOrcamento = class(TFrmMdRel)
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRLD: TQRLabel;
    QrlSub: TQRLabel;
    QRL2: TQRLabel;
    QRLabel5: TQRLabel;
    QRECodigo: TQRExpr;
    QREDescricao: TQRExpr;
    QREOrcamento: TQRExpr;
    QREVendedor: TQRExpr;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QREQtd: TQRExpr;
    QREPreco: TQRExpr;
    QRETotal: TQRExpr;
    QREDesconto: TQRExpr;
    QRESubTotal: TQRExpr;
    QRETotalG: TQRExpr;
    QRExpr3: TQRExpr;
    QRLabel11: TQRLabel;
    QreValidade: TQRExpr;
    QrlReimpressao: TQRLabel;
    QreEmissao: TQRExpr;
    QRLabel12: TQRLabel;
    QreUnidade: TQRExpr;
    QRLabel10: TQRLabel;
    QRLabel13: TQRLabel;
    QrlCliente: TQRLabel;
    QrlEndereco: TQRLabel;
    Qrl: TQRLabel;
    QrlTelefone: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QrlCep: TQRLabel;
    QrlBairro: TQRLabel;
    QrlCidade: TQRLabel;
    QrlCnpj: TQRLabel;
    QRShape5: TQRShape;
    QRShape4: TQRShape;
    QRLblEmpresa2: TQRLabel;
    QRLabel18: TQRLabel;
    QRLblPrevisao: TQRLabel;
    QRShape6: TQRShape;
    QRLabel17: TQRLabel;
    QRExpr4: TQRExpr;
    ADOQryCliente: TADOQuery;
    QRLabel19: TQRLabel;
    QRExpr5: TQRExpr;
    ADOSPRelDados: TADOStoredProc;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QrlCPF: TQRLabel;
    QrlRg: TQRLabel;
    QrlUf: TQRLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    
  end;

var
  FrmRelOrcamento: TFrmRelOrcamento;

implementation

uses DataModulo;
{$R *.DFM}


procedure TFrmRelOrcamento.FormCreate(Sender: TObject);
begin
  inherited;
  QRLblPrograma.Caption := ADOQryConfig.FieldByName('dsEndereco').AsString;
end;

end.
