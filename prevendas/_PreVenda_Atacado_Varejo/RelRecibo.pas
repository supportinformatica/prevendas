unit RelRecibo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RelModelo, Qrctrls, Db, QuickRpt, ExtCtrls, ADODB, uFuncoesPadrao;

type
  TFrmRelRecibo = class(TFrmMdRel)
    QRLblExtenso: TQRLabel;
    QREExtenso: TQRExprMemo;
    QRLbl: TQRLabel;
    QRLbl1: TQRLabel;
    QRLblValor: TQRLabel;
    QRLblNr: TQRLabel;
    QRLblCGC: TQRLabel;
    QRLblEndereco: TQRLabel;
    QRETexto: TQRExprMemo;
    QRBand1: TQRBand;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRBand3: TQRBand;
    QRLabel13: TQRLabel;
    QRlblData: TQRLabel;
    QRShape2: TQRShape;
    QRLblAssinante: TQRLabel;
    QRLblCGCAssinante: TQRLabel;
    QRLblEndAssinante: TQRLabel;
    QRLabel22: TQRLabel;
    QRLblLanca: TQRLabel;
    QRLblDoc: TQRLabel;
    QRLblValor1: TQRLabel;
    QRShape3: TQRShape;
    QrlRestante: TQRLabel;
    QRLblObs: TQRLabel;
    QRLabel1: TQRLabel;
    QRImage1: TQRImage;
    procedure FormCreate(Sender: TObject);
    procedure QRMdRelBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormMouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelRecibo: TFrmRelRecibo;

implementation

uses MoPreVenda;

{$R *.DFM}

procedure TFrmRelRecibo.FormCreate(Sender: TObject);
begin
  inherited;
  //QRLabel1.Caption := 'Operador: ' + UpperCase( vnome_usuario_logado );
end;

procedure TFrmRelRecibo.QRMdRelBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  inherited;
//  SetupStandardPreview(FrmRelRecibo);
end;

procedure TFrmRelRecibo.FormMouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
begin
//  inherited;
end;

end.
