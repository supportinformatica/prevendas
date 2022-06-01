unit relOrcamentosAmbiente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLFilters, RLDraftFilter,
  Data.Win.ADODB, RLReport, Data.DB, RLParser;

type
  TfrmRelOrcamentosAmbiente = class(TForm)
    ADOQryCliente: TADOQuery;
    ADOQryConfig: TADOQuery;
    ADOQryConfigdsMenPromocional: TStringField;
    ADOQryConfignmEmpresa: TStringField;
    ADOQryConfigdsPrazoOrcamento: TStringField;
    ADOQryConfigdsEndereco: TStringField;
    ADOQryConfigdsCgc: TStringField;
    ADOQryConfigdsInscricao: TStringField;
    ADOQryConfigdsCidade: TStringField;
    DSConfig: TDataSource;
    ADOQuery1: TADOQuery;
    Qualidade_Dos: TRLDraftFilter;
    AdoQryOrcamento: TADOQuery;
    AdoQryConsulta: TADOQuery;
    AdoQryConsultanmPessoa: TStringField;
    AdoQryConsultanmProduto: TStringField;
    AdoQryConsultadsProdutoNota: TStringField;
    AdoQryConsultadsReferencia: TStringField;
    AdoQryConsultacdPessoa: TIntegerField;
    AdoQryConsultanrOrcamento: TIntegerField;
    AdoQryConsultacdCliente: TIntegerField;
    AdoQryConsultacdProduto: TIntegerField;
    AdoQryConsultadtEmissao: TDateTimeField;
    AdoQryConsultaNrQtd: TFloatField;
    AdoQryConsultavlPreco: TBCDField;
    AdoQryConsultanrDesconto: TFloatField;
    AdoQryConsultadsUnidade: TStringField;
    AdoQryConsultadsPrateleira: TStringField;
    AdoQryConsultacdAmbiente: TIntegerField;
    AdoQryConsultadsAmbiente: TStringField;
    DataSource1: TDataSource;
    ADOQuery2: TADOQuery;
    ADOQuery2nmPessoa: TStringField;
    ADOQuery2nmProduto: TStringField;
    ADOQuery2dsProdutoNota: TStringField;
    ADOQuery2dsReferencia: TStringField;
    ADOQuery2cdPessoa: TIntegerField;
    ADOQuery2nrOrcamento: TIntegerField;
    ADOQuery2cdCliente: TIntegerField;
    ADOQuery2cdProduto: TIntegerField;
    ADOQuery2dtEmissao: TDateTimeField;
    ADOQuery2NrQtd: TFloatField;
    ADOQuery2vlPreco: TBCDField;
    ADOQuery2nrDesconto: TFloatField;
    ADOQuery2dsUnidade: TStringField;
    ADOQuery2dsPrateleira: TStringField;
    ADOQuery2cdAmbiente: TIntegerField;
    ADOQuery2dsAmbiente: TStringField;
    RLReport1: TRLReport;
    RLExpressionParser1: TRLExpressionParser;
    RLBand5: TRLBand;
    QrlCnpj: TRLLabel;
    QRLblTitulo: TRLLabel;
    QRLblPrograma: TRLLabel;
    RLDraw1: TRLDraw;
    RLDraw2: TRLDraw;
    QRLabel10: TRLLabel;
    QRLabel13: TRLLabel;
    QRLabel1: TRLLabel;
    QrlCliente: TRLLabel;
    QrlEndereco: TRLLabel;
    QRLabel16: TRLLabel;
    QRLabel14: TRLLabel;
    QrlCep: TRLLabel;
    QrlBairro: TRLLabel;
    Qrl: TRLLabel;
    QRLabel15: TRLLabel;
    QrlTelefone: TRLLabel;
    QrlCidade: TRLLabel;
    QrlReimpressao: TRLLabel;
    QRLabel3: TRLLabel;
    QRLabel2: TRLLabel;
    QRLabel11: TRLLabel;
    QRLabel4: TRLLabel;
    QRLabel6: TRLLabel;
    QRLabel12: TRLLabel;
    QRLabel7: TRLLabel;
    QRLabel8: TRLLabel;
    QRLabel9: TRLLabel;
    QreValidade: TRLDBText;
    QRSysData2: TRLSystemInfo;
    QREVendedor: TRLDBText;
    QREOrcamento: TRLDBText;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    QrlCPF: TRLLabel;
    QrlRG: TRLLabel;
    QrlUf: TRLLabel;
    QRLblEmpresa: TRLLabel;
    RLLabel4: TRLLabel;
    QrlComp: TRLLabel;
    s: TRLLabel;
    rlApelido: TRLLabel;
    RLLabel5: TRLLabel;
    QrlUf2: TRLLabel;
    QRLblPagina: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    QreEmissao: TRLDBText;
    QrlDtHR: TRLLabel;
    RLLabel23: TRLLabel;
    RLBand1: TRLBand;
    RLDBResult4: TRLDBResult;
    QrlSub: TRLLabel;
    QRLblEmpresa2: TRLLabel;
    QRLD: TRLLabel;
    QRLblPrevisao: TRLLabel;
    QRL2: TRLLabel;
    QRLabel18: TRLLabel;
    QRExpr3: TRLDBText;
    RLDBResult2: TRLDBResult;
    RLDBResult1: TRLDBResult;
    QREDesconto: TRLDBResult;
    RLLabel3: TRLLabel;
    RlblFormaPgto: TRLLabel;
    RLLabel21: TRLLabel;
    RLLabel22: TRLLabel;
    RLMemo1: TRLMemo;
    RLGroup1: TRLGroup;
    RLDBText3: TRLDBText;
    RLBand2: TRLBand;
    QRECodigo: TRLDBText;
    QREDescricao: TRLDBText;
    QRETotal: TRLDBText;
    QreUnidade: TRLDBText;
    QREPreco: TRLDBResult;
    QREQtd: TRLDBResult;
    RLDBText1: TRLDBText;
    RLDBResult3: TRLDBResult;
    RlDescricao: TRLLabel;
    RLDBText2: TRLDBText;
    RLBand3: TRLBand;
    procedure FormCreate(Sender: TObject);
    procedure RLGroup1BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLGroup1AfterPrint(Sender: TObject);
    procedure RLBand2BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelOrcamentosAmbiente: TfrmRelOrcamentosAmbiente;

implementation

{$R *.dfm}

uses MoPreVenda;

procedure TfrmRelOrcamentosAmbiente.FormCreate(Sender: TObject);
begin
  ADOQryConfig.Open;
  QRLblPrograma.Caption := ADOQryConfig.FieldByName('dsEndereco').AsString;
  QRLblEmpresa.Caption := AdoQryConfig.FieldByName('nmEmpresa').AsString;
{  if vOcultaDesconto = 'S' then begin
    RLLabel2.caption := '';
    QREPreco.Visible := False;
  end;
  if UPPERCASE(vEmpresa) = 'GAMA' then
    QreUnidade.DataField := 'dsMetragem'
  else
    QreUnidade.DataField := 'dsUnidade';
    }
end;

procedure TfrmRelOrcamentosAmbiente.RLBand2BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RLBand3.Height := 0;
end;

procedure TfrmRelOrcamentosAmbiente.RLGroup1AfterPrint(Sender: TObject);
var x:string;
begin
   RLBand3.Height := 0;
   x := ADOQuery2dsAmbiente.AsString;
end;

procedure TfrmRelOrcamentosAmbiente.RLGroup1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
var x:string;
begin
  if ADOQuery2dsAmbiente.AsString <> '' then
    RLBand3.Height := 16 //16
  else
    RLBand3.Height := 0;
end;

end.
