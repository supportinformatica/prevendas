unit relOrcamentosPBFARMA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, jpeg,
  Dialogs, RLReport, RLFilters, RLDraftFilter, ADODB, RLParser, DB, MaskUtils,
  RLXLSFilter, RLPDFFilter;

type
  TfrmRelOrcamentosPB = class(TForm)
    QRMdRel: TRLReport;
    RLBand1: TRLBand;
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
    RLBPAF: TRLBand;
    RLLabel6: TRLLabel;
    RLDBText3: TRLDBText;
    QRLblTitulo2: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    LblDenoEmitente: TRLLabel;
    RlblCNPJ_Emit: TRLLabel;
    RLLabel12: TRLLabel;
    RLDraw3: TRLDraw;
    RLDraw4: TRLDraw;
    RLDraw5: TRLDraw;
    LblDenoDest: TRLLabel;
    RLLCNPJ_Dest: TRLLabel;
    RLLabel15: TRLLabel;
    RLDraw6: TRLDraw;
    RLDraw7: TRLDraw;
    RLDraw8: TRLDraw;
    RLDraw9: TRLDraw;
    RLDraw11: TRLDraw;
    RLLabel16: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel10: TRLLabel;
    RLLabel11: TRLLabel;
    RLLabel13: TRLLabel;
    RLLabel14: TRLLabel;
    RLLabel17: TRLLabel;
    RLLabel18: TRLLabel;
    RLLabel19: TRLLabel;
    RLLabel20: TRLLabel;
    RLDraw10: TRLDraw;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    ADOQryCliente: TADOQuery;
    ADOQryConfig: TADOQuery;
    ADOQryConfigdsMenPromocional: TStringField;
    ADOQryConfignmEmpresa: TStringField;
    ADOQryConfigdsPrazoOrcamento: TStringField;
    ADOQryConfigdsCgc: TStringField;
    ADOQryConfigdsInscricao: TStringField;
    ADOQryConfigdsCidade: TStringField;
    DS: TDataSource;
    DSConfig: TDataSource;
    ADOSPRelDados: TADOStoredProc;
    ADOQuery1: TADOQuery;
    DOS: TRLDraftFilter;
    AdoQryOrcamento: TADOQuery;
    ADOQryRelDados: TADOQuery;
    ADOQryRelDadosnmPessoa: TStringField;
    ADOQryRelDadosnmProduto: TStringField;
    ADOQryRelDadoscdFabricante: TIntegerField;
    ADOQryRelDadosnmFabricante: TStringField;
    ADOQryRelDadosvalidade: TDateTimeField;
    ADOQryRelDadosdsReferencia: TStringField;
    ADOQryRelDadoscdPessoa: TIntegerField;
    ADOQryRelDadosnrLote: TStringField;
    ADOQryRelDadosnrOrcamento: TIntegerField;
    ADOQryRelDadoscdCliente: TIntegerField;
    ADOQryRelDadoscdProduto: TIntegerField;
    ADOQryRelDadosvlDesconto: TFloatField;
    ADOQryRelDadosdtEmissao: TDateTimeField;
    ADOQryRelDadosNrQtd: TFloatField;
    ADOQryRelDadosvlPreco: TBCDField;
    ADOQryRelDadosnrDesconto: TFloatField;
    ADOQryRelDadosdsUnidade: TStringField;
    ADOQryRelDadosdsPrateleira: TStringField;
    ADOQryRelDadosdsMetragem: TStringField;
    RLExpressionParser1: TRLExpressionParser;
    ADOQryConfiglogoMarca: TBlobField;
    LogoMarca: TRLImage;
    RLDraw12: TRLDraw;
    ADOQryConfigdsLogradouro: TStringField;
    ADOQryConfigdsNumero: TStringField;
    ADOQryConfigdsBairro: TStringField;
    ADOQryConfigdsEstado: TStringField;
    ADOQryConfigdsCEP: TStringField;
    ADOQryConfigdsTelefone: TStringField;
    qrLblTelefone: TRLLabel;
    RLPDFFilter1: TRLPDFFilter;
    RLXLSFilter1: TRLXLSFilter;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelOrcamentosPB: TfrmRelOrcamentosPB;

implementation

uses DataModulo, MoPreVenda;

{$R *.dfm}

procedure TfrmRelOrcamentosPB.FormCreate(Sender: TObject);
var
  Img : TStream;
  Jpg : TJpegImage; // sem a unit 'jpeg' essa classe não existiria
begin
  //FrmPrincipalPreVenda.RodaScripts2;
  ADOQryConfig.Open;
  try
    Jpg:= nil;
    Img:= ADOQryConfig.CreateBlobStream(ADOQryConfig.FieldByName('LogoMarca'),bmRead);
    Jpg:= TJpegImage.Create;
    if ADOQryConfig.FieldByName('LogoMarca').IsNull <> true then begin
      Jpg.LoadFromStream(Img);
      LogoMarca.Visible := True;
      LogoMarca.Picture.Assign(Jpg);
    end;
  except
    if ADOQryConfig.FieldByName('LogoMarca').IsNull <> true then begin
      Img := ADOQryConfig.CreateBlobStream(ADOQryConfig.FieldByName('LogoMarca'),bmRead);
      LogoMarca.Picture.Bitmap.LoadFromStream(Img);
      LogoMarca.Visible := True;
    end;
  end;
  jpg.Free;
  Img.Destroy;
  QRLblPrograma.Caption:= ADOQryConfig.FieldByName('dsLogradouro').AsString + ', ' +
    ADOQryConfig.FieldByName('dsNumero').AsString + ' - ' +
    ADOQryConfig.FieldByName('dsBairro').AsString + ' - ' +
    ADOQryConfig.FieldByName('dsCidade').AsString + '/' +
    ADOQryConfig.FieldByName('dsEstado').AsString + ' - ' +
    'CEP: ' + FormatMaskText('00000\-999;0;', ADOQryConfig.FieldByName('dsCEP').AsString);
  qrLblTelefone.Caption:= 'Tel.: ' + FormatMaskText('(00) 0000-0000;0;*', ADOQryConfig.FieldByName('dsTelefone').AsString);
  QRLblEmpresa.Caption:= AdoQryConfig.FieldByName('nmEmpresa').AsString;
  if vOcultaDesconto = 'S' then begin
    RLLabel2.caption:= '';
    QREPreco.Visible:= False;
  end;
  QreUnidade.DataField:= 'dsUnidade';
end;

end.
