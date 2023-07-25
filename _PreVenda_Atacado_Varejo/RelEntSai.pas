unit RelEntSai;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RelModelo, Qrctrls, Db, QuickRpt, ExtCtrls, ADODB, QRExport, QRPDFFilt;

type
  TFrmRelEntSai = class(TFrmMdRel)
    QRLbLancamento: TQRLabel;
    QRLbData: TQRLabel;
    QRLbCdProduto: TQRLabel;
    QRLbFabrica: TQRLabel;
    QRLbDescriao: TQRLabel;
    QRLbQtd: TQRLabel;
    QRLbvlUnt: TQRLabel;
    QRLabel1: TQRLabel;
    QRBand1: TQRBand;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRLabel2: TQRLabel;
    QRGroup1: TQRGroup;
    QRExpr1: TQRExpr;
    QRExpr9: TQRExpr;
    QRBand2: TQRBand;
    QRLblSelecao: TQRLabel;
    QRLblSelec: TQRLabel;
    QRLabel4: TQRLabel;
    QRLblPeriodo: TQRLabel;
    QREQtd: TQRExpr;
    QRExpr2: TQRExpr;
    QRBand3: TQRBand;
    QRLblTotParc: TQRLabel;
    QRExpTotParc: TQRExpr;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRExpr12: TQRExpr;
    QRExpr13: TQRExpr;
    QRExpr15: TQRExpr;
    ADOQryLancto: TADOQuery;
    ADOQryLanctoValor: TBCDField;
    QrlVendedor: TQRLabel;
    ADOQryVendedor: TADOQuery;
    ADOQryRelDadosdsLancamento: TStringField;
    ADOQryRelDadosdtEmissao: TDateTimeField;
    ADOQryRelDadosDt_Efefiva_E_S: TDateTimeField;
    ADOQryRelDadosdsCFOP: TStringField;
    ADOQryRelDadoscdComissao: TFloatField;
    ADOQryRelDadosvlValor: TBCDField;
    ADOQryRelDadosvlDesconto: TBCDField;
    ADOQryRelDadosdsCancelado: TStringField;
    ADOQryRelDadoscdFabricante: TStringField;
    ADOQryRelDadosnmProduto: TStringField;
    ADOQryRelDadoscdPessoa: TIntegerField;
    ADOQryRelDadosnrQtd: TFloatField;
    ADOQryRelDadosvlUnitario: TBCDField;
    ADOQryRelDadosvlunitario_Bruto: TBCDField;
    ADOQryRelDadoscdProduto: TIntegerField;
    ADOQryRelDadosnmPessoa: TStringField;
    ADOQryRelDadosdsReferencia: TStringField;
    ADOQryRelDadosdsStatus: TStringField;
    ADOQryRelDadosdsLancamento_1: TStringField;
    QRExpr11: TQRExpr;
    QRLabel3: TQRLabel;
    AdoQryOrcamento: TADOQuery;
    QrlDtPreVenda: TQRLabel;
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRExpr3Print(sender: TObject; var Value: String);
    procedure QRGroup1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure QRMdRelBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRExpr1Print(sender: TObject; var Value: String);
  private
    { Private declarations }
    Conta_Lancamentos : integer;
    Conta_Itens,Conta_Real : Real;
  public
    { Public declarations }
  end;

var
  FrmRelEntSai: TFrmRelEntSai;

implementation



{$R *.DFM}

procedure TFrmRelEntSai.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  //QRLabel9.Caption := FormatFloat('0',Conta_Lancamentos);
end;

procedure TFrmRelEntSai.QRExpr3Print(sender: TObject; var Value: String);
begin
  inherited;
  //se os dois valores forem iguais a zero, a conta não pode ser realizada   
{  if (Conta_Itens = 0) and (ADOQryRelDados.FieldByName('nrQtd').AsFloat = 0 ) then exit; //NOVO
  Conta_Itens := Conta_Itens + ADOQryRelDados.FieldByName('nrQtd').AsFloat;
  QRLabel11.Caption := FormatFloat('#,##0.00',Conta_Itens/Conta_Lancamentos);
  Conta_real := Conta_real +  AdoQryRelDados.FieldByName('nrQtd').AsFloat * AdoQryRelDados.FieldByName('vlUnitario').AsFloat;
  QrlMediaReal.Caption := FormatFloat('#,##0.00',Conta_Real/Conta_Lancamentos); }
end;

procedure TFrmRelEntSai.QRGroup1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  inherited;
  Conta_Lancamentos := Conta_Lancamentos + 1;
end;

procedure TFrmRelEntSai.FormCreate(Sender: TObject);
begin
  inherited;
  Conta_Lancamentos := 0;
  Conta_Itens := 0;
  Conta_Real := 0;
end;

procedure TFrmRelEntSai.QRMdRelBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  inherited;
  Conta_Lancamentos := 0;
  Conta_Itens := 0;
  Conta_Real := 0;
end;

procedure TFrmRelEntSai.QRExpr1Print(sender: TObject; var Value: String);
begin
  inherited;
  with ADOQryVendedor do begin
    Sql.Text := 'Select nmpessoa from Pessoa WITH (NOLOCK) where cdpessoa = :CDPESSOA ';
    Parameters.ParamByName('CDPESSOA').Value := ADOQryRelDadoscdComissao.AsString;
    Open;
    QrlVendedor.Caption := 'Vendedor -> ' +ADOQryVendedor.fieldByName('nmpessoa').AsString;
  end;

  with AdoQryOrcamento do begin
    sql.text := 'select dtEmissao from orcamento where dsLancamento_1 = :LANCTO ';
    Parameters.ParamByName('LANCTO').Value := ADOQryRelDadosdsLancamento.AsString;
    open;
    if AdoQryOrcamento.recordCount > 0 then
      QrlDtPreVenda.Caption := FormatDateTime('dd/MM/yyyy',fieldByname('dtEmissao').AsDateTime)
    else
      QrlDtPreVenda.Caption := '';    
    close;
  end;

end;

end.
