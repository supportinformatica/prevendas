unit RelOrcamentoLista;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, QRCtrls,
  QuickRpt, Vcl.ExtCtrls, QRPDFFilt, JPEG;

type
  TfrmRelOrcamentoLista = class(TForm)
    QuickRep1: TQuickRep;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    ADOQryRelDados: TADOQuery;
    ADOQryRelDadosCdObjeto: TIntegerField;
    ADOQryRelDadosdsObjeto: TStringField;
    ADOQryRelDadosqtd: TIntegerField;
    ADOQryRelDadosnmProduto: TStringField;
    ADOQryRelDadosTotal: TBCDField;
    ADOQryRelDadoscdProduto: TIntegerField;
    ADOQryRelDadosdsPrateleira: TStringField;
    ADOQryRelDadoscdFabricante: TStringField;
    ADOQryRelDadosdsReferencia: TStringField;
    ADOQryRelDadosvlPreco: TBCDField;
    ADOQryRelDadosnrQtdReal: TFloatField;
    ADOQryRelDadosdsUnidade: TStringField;
    QRBand1: TQRBand;
    QRExpr5: TQRExpr;
    ADOQryConfig: TADOQuery;
    ADOQryConfigdsMenPromocional: TStringField;
    ADOQryConfignmEmpresa: TStringField;
    ADOQryConfigdsPrazoOrcamento: TStringField;
    ADOQryConfigdsEndereco: TStringField;
    ADOQryConfigdsCgc: TStringField;
    ADOQryConfigdsInscricao: TStringField;
    ADOQryConfigdsCidade: TStringField;
    QRLabel5: TQRLabel;
    QRExpr6: TQRExpr;
    ADOQryRelDadosDsEscola: TStringField;
    ADOQryRelDadosdsSerie: TStringField;
    QRLabel7: TQRLabel;
    QRExpr7: TQRExpr;
    QRLabel8: TQRLabel;
    QRExpr8: TQRExpr;
    QRPDFFilter1: TQRPDFFilter;
    QRSysData1: TQRSysData;
    QRLabel9: TQRLabel;
    qrNmEmpresa: TQRDBText;
    qrImage: TQRImage;
    QRLabel10: TQRLabel;
    QRSysData2: TQRSysData;
    QRSysData3: TQRSysData;
    qrEndereco: TQRDBText;
    qrCNPJ: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel11: TQRLabel;
    QRBand4: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRShape2: TQRShape;
    adoQryCabecalho: TADOQuery;
    QRLabel12: TQRLabel;
    QRSysData4: TQRSysData;
    procedure FormCreate(Sender: TObject);
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelOrcamentoLista: TfrmRelOrcamentoLista;

implementation

{$R *.dfm}

uses DataModulo, uFuncoesPadrao, MoPreVenda;

procedure TfrmRelOrcamentoLista.FormCreate(Sender: TObject);
var
  Jpg : TJpegImage;
begin
  if vLogoMarca.Size > 0 then begin
    vLogoMarca.Position := 0;
    try
      Jpg := nil;
      Jpg := TJpegImage.Create;
      Jpg.LoadFromStream(vLogoMarca);
      qrImage.Picture.Assign(Jpg);
    except
      qrImage.Picture.Bitmap.LoadFromStream(vLogoMarca);
    end;
  end
  else if FileExists('Logo_Cupom.JPG') then
    qrImage.Picture.LoadFromFile('Logo_Cupom.JPG');
  adoQryCabecalho.Open;

//  ADOQryConfig.Open;
////  AdoQryConfig.Active := True;
//  QRLblEmpresa.Caption := AdoQryConfig.FieldByName('nmEmpresa').AsString;
//  QRLblPrograma.Caption := AdoQryConfig.FieldByName('dsEndereco').AsString + ', '+ AdoQryConfig.FieldByName('dsCidade').AsString;
end;

procedure TfrmRelOrcamentoLista.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  Bloquear_Janela_QuickRep;
end;

end.
