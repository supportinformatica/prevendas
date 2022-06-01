unit RelRecibo2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, RLParser, ADODB, RLReport;

type
  TFrmRel_Recibo2 = class(TForm)
    QrMdRel: TRLReport;
    RLBand1: TRLBand;
    QRLblCGC: TRLLabel;
    QRLblEndereco: TRLLabel;
    RLLabel1: TRLLabel;
    QRLblValor: TRLLabel;
    RLLabel3: TRLLabel;
    QRLblNr: TRLLabel;
    RLDraw1: TRLDraw;
    RLLabel2: TRLLabel;
    QREExtenso: TRLMemo;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLDraw2: TRLDraw;
    QRETexto: TRLMemo;
    QRLblEmpresa: TRLLabel;
    RLImage1: TRLImage;
    RLLabel8: TRLLabel;
    RLLabel7: TRLLabel;
    RLBand2: TRLBand;
    QreDescricao: TRLDBText;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    rlPago: TRLDBText;
    rlVencimento: TRLDBText;
    RLBand3: TRLBand;
    QRLblAssinante: TRLLabel;
    QRLblCGCAssinante: TRLLabel;
    QRLblEndAssinante: TRLLabel;
    RLDraw3: TRLDraw;
    QrlRestante: TRLLabel;
    QRLabel13: TRLLabel;
    QRlblData: TRLLabel;
    RLLabel12: TRLLabel;
    QRLBLObs: TRLLabel;
    RlRestanteParcial: TRLLabel;
    ADOQryConfig: TADOQuery;
    ADOQryConfigdsMenPromocional: TStringField;
    ADOQryConfignmEmpresa: TStringField;
    ADOQryConfigdsPrazoOrcamento: TStringField;
    ADOQryConfigdsEndereco: TStringField;
    ADOQryConfigdsCgc: TStringField;
    ADOQryConfigdsInscricao: TStringField;
    ADOQryConfigdsCidade: TStringField;
    ADOQryConfigdsUf: TStringField;
    DS: TDataSource;
    RLExpressionParser1: TRLExpressionParser;
    ADOQryRelDados: TADOQuery;
    ADOQryRelDadosdsLancamento: TStringField;
    ADOQryRelDadosdsDocumento: TStringField;
    ADOQryRelDadosvlPagamento: TBCDField;
    ADOQryRelDadosdtEmissao_Doc: TDateTimeField;
    ADOQryRelDadosdtVencimento_Doc: TDateTimeField;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRel_Recibo2: TFrmRel_Recibo2;

implementation

uses MoPreVenda;

{$R *.dfm}

procedure TFrmRel_Recibo2.FormCreate(Sender: TObject);
begin
  ADOQryConfig.Open;
  QRLblEmpresa.Caption := AdoQryConfig.FieldByName('nmEmpresa').AsString;
  QRLblCgc.Caption          :=  'CGC: ' + AdoQryConfig.FieldByName('dsCgc').AsString +
         ' I.E.: ' + AdoQryConfig.FieldByName('dsInscricao').AsString;
  QRLblEndereco.Caption     := AdoQryConfig.FieldByName('dsEndereco').AsString;
  QrLabel13.Caption         := AdoQryConfig.FieldByName('dsCidade').AsString + ' - ' +
                               AdoQryConfig.FieldByName('dsUf').AsString;
  QRLblAssinante.Caption      := AdoQryConfig.FieldByName('nmEmpresa').AsString;
  QRLblCGCAssinante.Caption   := QRLblCgc.Caption;
  QRLblEndAssinante.Caption   := QRLblEndereco.Caption;
  if FileExists('Logo_Cupom.JPG') and (UPPERCASE(vEmpresa) <> 'RILDON')then
    RLImage1.Picture.LoadFromFile('Logo_Cupom.JPG')
  else begin
    QRLblEmpresa.Left   := 10;
    QRLblCgc.Left       := 10;
    QRLblEndereco.Left  := 10;
    QrLabel13.Left      := 10;
  end;

end;

end.
