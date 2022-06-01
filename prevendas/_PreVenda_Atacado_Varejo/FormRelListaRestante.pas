unit FormRelListaRestante;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RelModelo, QRCtrls, QuickRpt, QRExport,
  QRPDFFilt, Data.DB, Data.Win.ADODB, Vcl.ExtCtrls;

type
  TFrmRelListaRestante = class(TFrmMdRel)
    QRGroup1: TQRGroup;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    ADOQryRelDadosNumeroPedComp: TIntegerField;
    ADOQryRelDadoscdProduto: TIntegerField;
    ADOQryRelDadosnmProduto: TStringField;
    ADOQryRelDadoscdPessoa: TIntegerField;
    ADOQryRelDadosnmPessoa: TStringField;
    ADOQryRelDadosqtdPrevenda: TFloatField;
    ADOQryRelDadosqtdPedComp: TFloatField;
    ADOQryRelDadosnrQtdChegada: TFloatField;
    ADOQryRelDadosfaltaChegar: TFloatField;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    ADOQryRelDadosnrOrcamento: TIntegerField;
    QRDBText7: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText8: TQRDBText;
    ADOQryRelDadosdtEmissao: TDateTimeField;
    QRDBText9: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel12: TQRLabel;
    QrlPeriodo: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    ADOQryRelDadostels: TStringField;
    ADOQryRelDadosApelido: TStringField;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelListaRestante: TFrmRelListaRestante;

implementation

{$R *.dfm}

end.
