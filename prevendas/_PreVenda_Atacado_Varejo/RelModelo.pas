unit RelModelo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Qrctrls, QuickRpt, ExtCtrls, ADODB, QRExport, QRPDFFilt;

type
  TFrmMdRel = class(TForm)
    QRMdRel: TQuickRep;
    QRB1: TQRBand;
    QRLblEmpresa: TQRLabel;
    QRLblPagina: TQRLabel;
    QRSysData1: TQRSysData;
    QRLblPrograma: TQRLabel;
    QRLblTitulo: TQRLabel;
    QRSysData2: TQRSysData;
    QRShape1: TQRShape;
    ADOQryConfig: TADOQuery;
    ADOQryConfigdsMenPromocional: TStringField;
    ADOQryConfignmEmpresa: TStringField;
    ADOQryConfigdsPrazoOrcamento: TStringField;
    ADOQryConfigdsEndereco: TStringField;
    ADOQryConfigdsCgc: TStringField;
    ADOQryConfigdsInscricao: TStringField;
    ADOQryConfigdsCidade: TStringField;
    ADOQryRelDados: TADOQuery;
    QRExcelFilter1: TQRExcelFilter;
    QRPDFFilter1: TQRPDFFilter;
    QRRTFFilter1: TQRRTFFilter;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMdRel: TFrmMdRel;

implementation

uses DataModulo;

{$R *.DFM}

procedure TFrmMdRel.FormCreate(Sender: TObject);
begin
  ADOQryConfig.Active := True;
  QRLblEmpresa.Caption := ADOQryConfig.FieldByName('nmEmpresa').AsString;
end;

end.
