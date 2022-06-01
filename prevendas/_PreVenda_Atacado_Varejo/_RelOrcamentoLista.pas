unit RelOrcamentoLista;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, QRCtrls,
  QuickRpt, Vcl.ExtCtrls;

type
  TfrmRelOrcamentoLista = class(TForm)
    QuickRep1: TQuickRep;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
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
    QRShape2: TQRShape;
    QRLblTitulo: TQRLabel;
    QrlEndereco: TQRLabel;
    QrlCnpj: TQRLabel;
    QRLblEmpresa: TQRLabel;
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
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelOrcamentoLista: TfrmRelOrcamentoLista;

implementation

{$R *.dfm}

uses DataModulo;

procedure TfrmRelOrcamentoLista.FormCreate(Sender: TObject);
begin
  ADOQryConfig.Open;
//  AdoQryConfig.Active := True;
  QRLblEmpresa.Caption := AdoQryConfig.FieldByName('nmEmpresa').AsString;
  QrlEndereco.Caption  := ADOQryConfigdsEndereco.AsString+', '+ADOQryConfigdsCidade.AsString;
end;

end.
