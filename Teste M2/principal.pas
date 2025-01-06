unit principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, System.Math;

type
  TForm1 = class(TForm)
    edtSolicitada: TLabeledEdit;
    edtEmbalagem: TLabeledEdit;
    edtqtdVenda: TLabeledEdit;
    BitBtn1: TBitBtn;
    LabeledEdit1: TLabeledEdit;
    edtCaixas: TLabeledEdit;
    procedure BitBtn1Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.BitBtn1Click(Sender: TObject);
var
  solicitada : Currency;
  embalagem : Currency;
  resultado : Currency;
  fracao : Currency;
begin
  solicitada := StrToCurr(edtSolicitada.Text);
  embalagem := StrToCurr(edtEmbalagem.Text);
  resultado := solicitada / embalagem;
  fracao := Frac(resultado);
  resultado := trunc(resultado);
  if fracao > 0 then
    resultado := resultado + 1;
  edtCaixas.Text := FormatCurr('0', resultado);
  resultado := resultado * embalagem;
  edtqtdVenda.Text := FormatCurr('0.00', resultado);
end;

end.
