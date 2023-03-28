unit RelOrcamentos40;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, RLBarcode, RLFilters,
  RLPDFFilter, RLDraftFilter, Data.Win.ADODB, RLParser, Data.DB;

type
  TfrmRelOrcamentos40 = class(TForm)
    ADOQryCliente: TADOQuery;
    ADOQryConfig: TADOQuery;
    ADOQryConfigdsMenPromocional: TStringField;
    ADOQryConfignmEmpresa: TStringField;
    ADOQryConfigdsPrazoOrcamento: TStringField;
    ADOQryConfigdsEndereco: TStringField;
    ADOQryConfigdsCgc: TStringField;
    ADOQryConfigdsInscricao: TStringField;
    ADOQryConfigdsCidade: TStringField;
    ADOQryConfigtelefone: TStringField;
    ADOQryConfigemail: TStringField;
    DS: TDataSource;
    DSConfig: TDataSource;
    RLExpressionParser1: TRLExpressionParser;
    ADOSPRelDados: TADOStoredProc;
    ADOQuery1: TADOQuery;
    AdoQryOrcamento: TADOQuery;
    adoQryCabecalho: TADOQuery;
    RLPDFFilter1: TRLPDFFilter;
    QRMdRel: TRLReport;
    RLBand1: TRLBand;
    QRLblTitulo: TRLLabel;
    QRLblPrograma: TRLLabel;
    RLDraw1: TRLDraw;
    RLDraw2: TRLDraw;
    QRLabel10: TRLLabel;
    QRLabel13: TRLLabel;
    QrlCliente: TRLLabel;
    QrlEndereco: TRLLabel;
    QRLabel14: TRLLabel;
    QrlBairro: TRLLabel;
    QRLabel15: TRLLabel;
    QrlCidade: TRLLabel;
    QRLabel3: TRLLabel;
    QRLabel2: TRLLabel;
    QRLabel4: TRLLabel;
    QRLabel7: TRLLabel;
    QRLabel8: TRLLabel;
    QRLabel9: TRLLabel;
    QREVendedor: TRLDBText;
    QREOrcamento: TRLDBText;
    RLLabel2: TRLLabel;
    QrlUf: TRLLabel;
    QRLblEmpresa: TRLLabel;
    RLLabel4: TRLLabel;
    QrlComp: TRLLabel;
    QrlUf2: TRLLabel;
    QrlDtHR: TRLLabel;
    RLLabel24: TRLLabel;
    RLBarcode: TRLBarcode;
    RLBand2: TRLBand;
    QRECodigo: TRLDBText;
    QREDescricao: TRLDBText;
    QRETotal: TRLDBText;
    QREPreco: TRLDBResult;
    QREQtd: TRLDBResult;
    RLDBResult3: TRLDBResult;
    RLBand3: TRLBand;
    QrlSub: TRLLabel;
    QRLblEmpresa2: TRLLabel;
    QRL2: TRLLabel;
    RlblFormaPgto: TRLLabel;
    RLLabel21: TRLLabel;
    RLLabel22: TRLLabel;
    RLMemo1: TRLMemo;
    lblSubTotal: TRLLabel;
    lblTotal: TRLLabel;
    RLLabel1: TRLLabel;
    RLDraw4: TRLDraw;
    QreUnidade: TRLDBText;
    RLDraw5: TRLDraw;
    QRLblFoneEmpresa: TRLLabel;
    RllQtdItens: TRLLabel;
    RLLabel3: TRLLabel;
    lblDesValor: TRLLabel;
    RLLabel5: TRLLabel;
    lblDesPorcentagem: TRLLabel;
    RLDBResult1: TRLDBResult;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    QRLabel11: TRLLabel;
    QreValidade: TRLDBText;
    procedure QREQtdBeforePrint(Sender: TObject; var AText: string;
      var PrintIt: Boolean);
    procedure RLDBResult3BeforePrint(Sender: TObject; var AText: string;
      var PrintIt: Boolean);
    procedure QREPrecoBeforePrint(Sender: TObject; var AText: string;
      var PrintIt: Boolean);
    procedure QRETotalBeforePrint(Sender: TObject; var AText: string;
      var PrintIt: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure lblDesValorBeforePrint(Sender: TObject; var AText: string;
      var PrintIt: Boolean);
    procedure lblDesPorcentagemBeforePrint(Sender: TObject; var AText: string;
      var PrintIt: Boolean);
    procedure lblTotalBeforePrint(Sender: TObject; var AText: string;
      var PrintIt: Boolean);
    procedure RLBand2AfterPrint(Sender: TObject);
    procedure RLBand3BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    totalLiquido, totalBruto : Real;
  public
    { Public declarations }
  end;

var
  frmRelOrcamentos40: TfrmRelOrcamentos40;

implementation

uses
  System.Math, MoPreVenda, uFuncoesPadrao;

{$R *.dfm}

procedure TfrmRelOrcamentos40.FormCreate(Sender: TObject);
begin
  ADOQryConfig.Open;
  QRLblPrograma.Caption := ADOQryConfig.FieldByName('dsEndereco').AsString;
  QRLblEmpresa.Caption := AdoQryConfig.FieldByName('nmEmpresa').AsString;
  QRLblFoneEmpresa.Caption := 'Fone: ' + AdoQryConfig.FieldByName('telefone').AsString;
end;

procedure TfrmRelOrcamentos40.lblDesPorcentagemBeforePrint(Sender: TObject;
  var AText: string; var PrintIt: Boolean);
var
  vCasasPreco : Integer;
begin
  vCasasPreco := MoPreVenda.vCasasPreco;
  if vCasasPreco > 5 then
    vCasasPreco := 5;
  AText := FormatFloatQ(vCasasPreco,SimpleRoundTo(StrtoFloat(AText),vCasasPreco*-1));
end;

procedure TfrmRelOrcamentos40.lblDesValorBeforePrint(Sender: TObject;
  var AText: string; var PrintIt: Boolean);
begin
  AText := FormatFloatQ(2,StrtoFloat(AText));
end;

procedure TfrmRelOrcamentos40.lblTotalBeforePrint(Sender: TObject;
  var AText: string; var PrintIt: Boolean);
begin
  if StrToFloat(lblSubTotal.Caption) < StrtoFloat(AText) then
    lblSubTotal.Caption := AText;
end;

procedure TfrmRelOrcamentos40.QREPrecoBeforePrint(Sender: TObject;
  var AText: string; var PrintIt: Boolean);
var
  vCasasPreco : Integer;
begin
  vCasasPreco := MoPreVenda.vCasasPreco;
  if vCasasPreco > 5 then
    vCasasPreco := 5;
  AText := FormatFloatQ(vCasasPreco,SimpleRoundTo(StrtoFloat(AText),vCasasPreco*-1));
end;

procedure TfrmRelOrcamentos40.QREQtdBeforePrint(Sender: TObject;
  var AText: string; var PrintIt: Boolean);
begin
  AText := FormatFloatQ(MoPreVenda.vCasasQtd,SimpleRoundTo(StrtoFloat(AText),MoPreVenda.vCasasQtd*-1));
end;

procedure TfrmRelOrcamentos40.QRETotalBeforePrint(Sender: TObject;
  var AText: string; var PrintIt: Boolean);
begin
  AText := FormatFloatQ(2,SimpleRoundTo(StrtoFloat(AText),-2));
end;

procedure TfrmRelOrcamentos40.RLBand2AfterPrint(Sender: TObject);
var
  temp : String;
begin
  temp := FloattoStr(SimpleRoundTo(ADOSPRelDados.FieldByName('nrQtd').asFloat,MoPreVenda.vCasasQtd*-1) * SimpleRoundTo(ADOSPRelDados.FieldByName('vlDesconto').asFloat,MoPreVenda.vCasasPreco*-1));
  temp := FloattoStr(SimpleRoundTo(StrToFloat(temp),-2));
  totalBruto := totalBruto + StrToFloat(temp);
  temp := FloattoStr(SimpleRoundTo(ADOSPRelDados.FieldByName('nrQtd').asFloat,MoPreVenda.vCasasQtd*-1) * SimpleRoundTo(ADOSPRelDados.FieldByName('vlPreco').asFloat,MoPreVenda.vCasasPreco*-1));
  temp := FloattoStr(SimpleRoundTo(StrToFloat(temp),-2));
  totalLiquido := totalLiquido + StrToFloat(temp);
end;

procedure TfrmRelOrcamentos40.RLBand3BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  lblSubTotal.Caption := FormatFloat('0.00',SimpleRoundTo(totalBruto,-2));
  lblTotal.Caption := FormatFloat('0.00',SimpleRoundTo(totalLiquido,-2));
  lblDesValor.Caption := FloatToStr(StrtoFloat(lblSubTotal.Caption) - StrtoFloat(lblTotal.Caption));
  if (lblDesPorcentagem.Visible = True) and (StrToFloatDef(lblDesValor.Caption, 0) > 0) then
  begin
    lblDesPorcentagem.Caption := FormatFloat('0.00',(1 - (StrtoFloat(lblTotal.Caption) / StrtoFloat(lblSubTotal.Caption)) )*100);
  end;
end;

procedure TfrmRelOrcamentos40.RLDBResult3BeforePrint(Sender: TObject;
  var AText: string; var PrintIt: Boolean);
var
  vCasasPreco : Integer;
begin
  vCasasPreco := MoPreVenda.vCasasPreco;
  if vCasasPreco > 5 then
    vCasasPreco := 5;
  if StrToFloat(VarToStr(QREPreco.Value)) > SimpleRoundTo(StrtoFloat(AText),vCasasPreco*-1) then
    AText := FormatFloatQ(vCasasPreco,SimpleRoundTo(StrtoFloat(VarToStr(QREPreco.Value)),vCasasPreco*-1))
  else
    AText := FormatFloatQ(vCasasPreco,SimpleRoundTo(StrtoFloat(AText),vCasasPreco*-1));
end;

end.
