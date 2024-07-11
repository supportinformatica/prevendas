unit RelOrcamentos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport, DB, ADODB, RLParser, RLFilters, RLDraftFilter, NEGProduto,
  Jpeg, Math, RLPDFFilter, RLBarcode, Vcl.ExtCtrls;

type
  TfrmRelOrcamentos = class(TForm)
    QRMdRel: TRLReport;
    RLBand1: TRLBand;
    RLBand2: TRLBand;
    RLBand3: TRLBand;
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
    ADOQryCliente: TADOQuery;
    ADOQryConfig: TADOQuery;
    ADOQryConfigdsMenPromocional: TStringField;
    ADOQryConfignmEmpresa: TStringField;
    ADOQryConfigdsPrazoOrcamento: TStringField;
    ADOQryConfigdsEndereco: TStringField;
    ADOQryConfigdsCgc: TStringField;
    ADOQryConfigdsInscricao: TStringField;
    ADOQryConfigdsCidade: TStringField;
    DS: TDataSource;
    QreValidade: TRLDBText;
    QRSysData2: TRLSystemInfo;
    QREVendedor: TRLDBText;
    QREOrcamento: TRLDBText;
    QrlSub: TRLLabel;
    QRLblEmpresa2: TRLLabel;
    QRLD: TRLLabel;
    QRLblPrevisao: TRLLabel;
    QRL2: TRLLabel;
    QRLabel18: TRLLabel;
    QRExpr3: TRLDBText;
    DSConfig: TDataSource;
    RLExpressionParser1: TRLExpressionParser;
    ADOSPRelDados: TADOStoredProc;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    QrlCPF: TRLLabel;
    QrlRG: TRLLabel;
    QrlUf: TRLLabel;
    QRLblEmpresa: TRLLabel;
    RlblFormaPgto: TRLLabel;
    RLLabel4: TRLLabel;
    QrlComp: TRLLabel;
    s: TRLLabel;
    ADOQuery1: TADOQuery;
    rlApelido: TRLLabel;     //se 
    Qualidade_Dos: TRLDraftFilter;
    RLLabel5: TRLLabel;
    QrlUf2: TRLLabel;
    DOS: TRLDraftFilter;
    Padrao: TRLDraftFilter;
    QRLblPagina: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
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
    RLLabel21: TRLLabel;
    RLLabel22: TRLLabel;
    RLMemo1: TRLMemo;
    AdoQryOrcamento: TADOQuery;
    QreEmissao: TRLDBText;
    QrlDtHR: TRLLabel;
    QreRota2: TRLLabel;
    QreRota: TRLLabel;
    qrImage: TRLImage;
    QrlTel: TRLLabel;
    QrlEmail: TRLLabel;
    ADOQryConfigtelefone: TStringField;
    ADOQryConfigemail: TStringField;
    adoQryCabecalho: TADOQuery;
    RLLabel23: TRLLabel;
    RLLabel24: TRLLabel;
    lblSubTotal: TRLLabel;
    lblPorcDesconto: TRLLabel;
    lblValorDesconto: TRLLabel;
    lblTotal: TRLLabel;
    RLPDFFilter1: TRLPDFFilter;
    qrlInstragran: TRLLabel;
    qrlfacebook: TRLLabel;
    RLBarcode: TRLBarcode;
    Image1: TImage;
    RLPanel1: TRLPanel;
    QRECodigo: TRLDBText;
    QREDescricao: TRLDBText;
    QRETotal: TRLDBText;
    QreUnidade: TRLDBText;
    QREPreco: TRLDBResult;
    QREQtd: TRLDBResult;
    RLDBResult3: TRLDBResult;
    RLDBText2: TRLDBText;
    RLLinhaProduto: TRLDraw;
    RlDescricao: TRLLabel;
    RLDBText1: TRLDBText;
    RLDBText6: TRLDBText;
    RLLblUnitario: TRLLabel;
    RLLblDesconto: TRLLabel;
    RLLblTotal: TRLLabel;
    procedure FormCreate(Sender: TObject);
    procedure RLBand2BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand2AfterPrint(Sender: TObject);
    procedure RLBand3BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure QREQtdBeforePrint(Sender: TObject; var AText: string;
      var PrintIt: Boolean);
    procedure RLDBResult3BeforePrint(Sender: TObject; var AText: string;
      var PrintIt: Boolean);
    procedure QREPrecoBeforePrint(Sender: TObject; var AText: string;
      var PrintIt: Boolean);
    procedure QRETotalBeforePrint(Sender: TObject; var AText: string;
      var PrintIt: Boolean);
    procedure lblPorcDescontoBeforePrint(Sender: TObject; var AText: string;
      var PrintIt: Boolean);
    procedure lblValorDescontoBeforePrint(Sender: TObject; var AText: string;
      var PrintIt: Boolean);
    procedure lblTotalBeforePrint(Sender: TObject; var AText: string;
      var PrintIt: Boolean);
    procedure QREOrcamentoAfterPrint(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RLBand3AfterPrint(Sender: TObject);
  private
    totalLiquido, totalBruto : Currency;
  public

  end;

var
  frmRelOrcamentos: TfrmRelOrcamentos;

implementation

uses DataModulo, MoPreVenda, NEGLoja, uFuncoesPadrao;

{$R *.dfm}

procedure TfrmRelOrcamentos.FormCreate(Sender: TObject);
var
  Jpg : TJpegImage;
begin
  totalLiquido := 0;
  totalBruto := 0;
  if vLogoMarca.Size > 0 then
  begin
    vLogoMarca.Position := 0;
    try
      Jpg := nil;
      Jpg := TJpegImage.Create;
      Jpg.LoadFromStream(vLogoMarca);
      qrImage.Picture.Assign(Jpg);
    except
      qrImage.Picture.Bitmap.LoadFromStream(vLogoMarca);
    end;
  end else if FileExists(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName) +
    'Logo_Cupom.JPG'))) then
    qrImage.Picture.LoadFromFile(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName) +
    'Logo_Cupom.JPG')));
  adoQryCabecalho.Open;
  ADOQryConfig.Open;
  QRLblPrograma.Caption := ADOQryConfig.FieldByName('dsEndereco').AsString;
  QRLblEmpresa.Caption  := AdoQryConfig.FieldByName('nmEmpresa').AsString;
  QrlTel.Caption   := 'Tel: '+AdoQryConfig.FieldByName('telefone').AsString;
  QrlEmail.Caption := 'Email: '+AdoQryConfig.FieldByName('email').AsString;
  if vOcultaDesconto = 'S' then
  begin
    RLLabel2.caption := '';
    QREPreco.Visible := False;
  end;
  if (UPPERCASE(vEmpresa) = 'GAMA') or (UpperCase(vEmpresa) = 'JETLASER') or (UpperCase(vEmpresa) = 'ANADRI') then
    QreUnidade.DataField := 'dsMetragem'
  else
    QreUnidade.DataField := 'dsUnidade';
  if (FrmPrincipalPreVenda.dsCGC = '21338426000120') then
  begin
    RLPanel1.Top := RLPanel1.Top + 15;
    RLBand2.Borders.FixedBottom := True;
    RLBand2.Height := 53;
    RLLabel5.Caption := '';
    Image1.Visible := True;
  end;
end;

procedure TfrmRelOrcamentos.FormShow(Sender: TObject);
begin
  totalLiquido := 0;
  totalBruto := 0;
end;

procedure TfrmRelOrcamentos.lblPorcDescontoBeforePrint(Sender: TObject;
  var AText: string; var PrintIt: Boolean);
var
  vCasasPreco : Integer;
begin
  vCasasPreco := MoPreVenda.vCasasPreco;
  if vCasasPreco > 5 then
    vCasasPreco := 5;
  AText := FormatFloatQ(vCasasPreco,SimpleRoundTo(StrtoFloat(AText),vCasasPreco*-1));
end;

procedure TfrmRelOrcamentos.lblTotalBeforePrint(Sender: TObject;
  var AText: string; var PrintIt: Boolean);
begin
  if ((StrToFloat(StringReplace(lblSubTotal.Caption,'.','',[rfReplaceAll])) <= StrtoFloat(StringReplace(AText,'.','',[rfReplaceAll])))) then
    lblSubTotal.Caption := AText;
end;

procedure TfrmRelOrcamentos.lblValorDescontoBeforePrint(Sender: TObject;
  var AText: string; var PrintIt: Boolean);
var
  vCasasPreco : Integer;
begin
  vCasasPreco := MoPreVenda.vCasasPreco;
  if vCasasPreco > 5 then
    vCasasPreco := 5;
  AText := FormatFloatQ(vCasasPreco,SimpleRoundTo(StrtoFloat(AText),vCasasPreco*-1));
  if SimpleRoundTo(StrtoFloat(AText),vCasasPreco*-1) < 0 then
  begin
    AText := FormatFloatQ(vCasasPreco,0);
  end;
end;

procedure TfrmRelOrcamentos.QREOrcamentoAfterPrint(Sender: TObject);
begin
  RLBarcode.Caption := QREOrcamento.Caption;
end;

procedure TfrmRelOrcamentos.QREPrecoBeforePrint(Sender: TObject;
  var AText: string; var PrintIt: Boolean);
var
  vCasasPreco : Integer;
begin
  vCasasPreco := MoPreVenda.vCasasPreco;
  if vCasasPreco > 5 then
    vCasasPreco := 5;
  AText := FormatFloatQ(vCasasPreco,SimpleRoundTo(StrtoFloat(StringReplace(AText,'.','',[rfReplaceAll])),vCasasPreco*-1));
  case vCasasPreco of
    2 : RLLblDesconto.Caption := FormatFloat('###,##0.00',strtofloat(AText));
    3 : RLLblDesconto.Caption := FormatFloat('###,##0.000',strtofloat(AText));
    4 : RLLblDesconto.Caption := FormatFloat('###,##0.0000',strtofloat(AText));
    5 : RLLblDesconto.Caption := FormatFloat('###,##0.00000',strtofloat(AText));
  end;
end;

procedure TfrmRelOrcamentos.QREQtdBeforePrint(Sender: TObject;
  var AText: string; var PrintIt: Boolean);
begin
  AText := FormatFloatQ(MoPreVenda.vCasasQtd,SimpleRoundTo(StrtoFloat(AText),MoPreVenda.vCasasQtd*-1));
end;

procedure TfrmRelOrcamentos.QRETotalBeforePrint(Sender: TObject;
  var AText: string; var PrintIt: Boolean);
begin
  AText := FormatFloatQ(2,SimpleRoundTo(StrtoFloat(StringReplace(AText,'.','',[rfReplaceAll])),-2));
  RLLblTotal.Caption := FormatFloat('###,##0.00',strtofloat(AText));
end;

procedure TfrmRelOrcamentos.RLBand2AfterPrint(Sender: TObject);
var
  temp : Currency;
begin
  temp := 0;
  temp := (SimpleRoundTo(ADOSPRelDados.FieldByName('nrQtd').asFloat, MoPreVenda.vCasasQtd*-1) * SimpleRoundTo(ADOSPRelDados.FieldByName('vlDesconto').asFloat, MoPreVenda.vCasasPreco*-1));
  temp := SimpleRoundTo(temp, -2);
  totalBruto := totalBruto + temp;
  temp := 0;
  temp := (SimpleRoundTo(ADOSPRelDados.FieldByName('nrQtd').asFloat, MoPreVenda.vCasasQtd*-1) * SimpleRoundTo(ADOSPRelDados.FieldByName('vlPreco').asFloat, MoPreVenda.vCasasPreco*-1));
  temp := SimpleRoundTo(temp, -2);
  totalLiquido := totalLiquido + temp;
end;

procedure TfrmRelOrcamentos.RLBand2BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
var
  estoque:Real;
begin
  if (ADOSPRelDados.FieldByName('nrQtd').asFloat * ADOSPRelDados.FieldByName('vlPreco').AsFloat) > 999999 then
    RLBand2.Font.Size := 6
  else
    RLBand2.Font.Size := 7;
  if (UPPERCASE(vEmpresa) = 'GAMA') or (UpperCase(vEmpresa) = 'JETLASER') or
    (UpperCase(vEmpresa) = 'ANADRI') or (FrmPrincipalPreVenda.dsCGC = '49843302000110') or
    (FrmPrincipalPreVenda.dsCGC = '47305252000192') or (FrmPrincipalPreVenda.dsCGC = '30105285000196') or
    (FrmPrincipalPreVenda.dsCGC = '33185213000194') or (FrmPrincipalPreVenda.dsCGC = '52961019000106') then
  begin
    with AdoQuery1 do
    begin
      Sql.Text := 'Select dsServico From IteOrcamento WITH (NOLOCK) where cdproduto = :CD and nrOrcamento = :CD2';
      parameters.parambyname('CD').Value := ADOSPRelDados.fieldbyname('cdProduto').asString;
      parameters.parambyname('CD2').Value := ADOSPRelDados.fieldbyname('nrOrcamento').asString;
      Open;
      RlDescricao.Caption := FieldByName('dsServico').asstring;
    end;
  end;
  if FrmPrincipalPreVenda.usarLoteValidade then
  begin
    with AdoQuery1 do
    begin
      Sql.Text := 'Select validade from itelote with (nolock) where cdproduto = :CD and nrLote = :Lote';
      parameters.parambyname('CD').Value   := ADOSPRelDados.fieldbyname('cdProduto').asString;
      parameters.parambyname('Lote').Value := ADOSPRelDados.fieldbyname('nrLote').asString;
      Open;
      RLDBText2.Text := AdoQuery1.FieldByName('validade').asString + '  ';
    end;
  end;
  try
    if Image1.visible = False then
      exit;
    Image1.Picture := nil;
    if Pos('http',ADOSPRelDados.fieldbyname('dscaminho').AsString) > 0 then
      CarregarImagemURL(Image1, ADOSPRelDados.fieldbyname('dscaminho').AsString)
    else if (ADOSPRelDados.fieldbyname('dscaminho').AsString <> '') then         
      Image1.Picture.LoadFromFile(ADOSPRelDados.fieldbyname('dscaminho').AsString);
  except

  end;
end;

procedure TfrmRelOrcamentos.RLBand3AfterPrint(Sender: TObject);
begin
  totalLiquido := 0;
  totalBruto := 0;
end;

procedure TfrmRelOrcamentos.RLBand3BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  lblSubTotal.Caption := FormatFloat('0.00',SimpleRoundTo(totalBruto,-2));
  lblTotal.Caption := FormatFloat('0.00',SimpleRoundTo(totalLiquido,-2));
  lblValorDesconto.Caption := FloatToStr(StrtoFloat(StringReplace(lblSubTotal.Caption,'.','',[rfReplaceAll])) - StrtoFloat(StringReplace(lblTotal.Caption,'.','',[rfReplaceAll])));
  if (lblPorcDesconto.Visible = True) and ((StrToFloatDef(lblValorDesconto.Caption, 0) > 0)) then
  begin
    lblPorcDesconto.Caption := FormatFloat('0.00',(1 - (StrtoFloat(lblTotal.Caption) / StrtoFloat(lblSubTotal.Caption)) )*100);
    if StrtoFloat(lblPorcDesconto.Caption) < 0 then
      lblPorcDesconto.Caption := FloatToStr(StrtoFloat(lblPorcDesconto.Caption) * -1);
  end;
  lblSubTotal.Caption := FormatFloat('###,##0.00',SimpleRoundTo(totalBruto,-2));
  lblTotal.Caption := FormatFloat('###,##0.00',SimpleRoundTo(totalLiquido,-2));
end;

procedure TfrmRelOrcamentos.RLDBResult3BeforePrint(Sender: TObject;
  var AText: string; var PrintIt: Boolean);
var
  vCasasPreco : Integer;
begin
  vCasasPreco := MoPreVenda.vCasasPreco;
  if vCasasPreco > 5 then
    vCasasPreco := 5;
  if (StrToFloat(VarToStr(QREPreco.Value)) > SimpleRoundTo(StrtoFloat(StringReplace(AText,'.','',[rfReplaceAll])),vCasasPreco*-1)) then
    AText := FormatFloatQ(vCasasPreco,SimpleRoundTo(StrtoFloat(VarToStr(QREPreco.Value)),vCasasPreco*-1))
  else
    AText := FormatFloatQ(vCasasPreco,SimpleRoundTo(StrtoFloat(StringReplace(AText,'.','',[rfReplaceAll])),vCasasPreco*-1));
  case vCasasPreco of
    2 : RLLblUnitario.Caption := FormatFloat('###,##0.00',strtofloat(AText));
    3 : RLLblUnitario.Caption := FormatFloat('###,##0.000',strtofloat(AText));
    4 : RLLblUnitario.Caption := FormatFloat('###,##0.0000',strtofloat(AText));
    5 : RLLblUnitario.Caption := FormatFloat('###,##0.00000',strtofloat(AText));
  end;
end;

end.
