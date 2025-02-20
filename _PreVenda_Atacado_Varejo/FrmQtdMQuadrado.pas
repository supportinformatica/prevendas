unit FrmQtdMQuadrado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.Menus;

type
  TFormQtdMQuadrado = class(TForm)
    BtnConfirmar: TBitBtn;
    BtnCancelar: TBitBtn;
    edtQtdSolicitada: TLabeledEdit;
    edtEmbalagem: TLabeledEdit;
    edtQtdVenda: TLabeledEdit;
    edtPreco: TLabeledEdit;
    edtTotal: TLabeledEdit;
    edtEstoqueCX: TLabeledEdit;
    btnCalcular: TBitBtn;
    PopupMenu1: TPopupMenu;
    Calcular1: TMenuItem;
    Cancelar1: TMenuItem;
    Confirmar1: TMenuItem;
    edtEstoqueM2: TLabeledEdit;
    procedure edtQtdSolicitadaKeyPress(Sender: TObject; var Key: Char);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCalcularClick(Sender: TObject);
    procedure Calcular1Click(Sender: TObject);
    procedure Confirmar1Click(Sender: TObject);
    procedure Cancelar1Click(Sender: TObject);
  private
    procedure calcular;
  public

  end;

var
  FormQtdMQuadrado: TFormQtdMQuadrado;

implementation

uses
  uFuncoesPadrao, MoPreVenda;

{$R *.dfm}

procedure TFormQtdMQuadrado.btnCalcularClick(Sender: TObject);
begin
  calcular;
  if StrToCurrDef(edtQtdVenda.Text, 0) > StrToCurrDef(edtEstoqueCX.Text, 0) then
    ShowMessage('Quantidade indisponível em estoque.');
end;

procedure TFormQtdMQuadrado.BtnCancelarClick(Sender: TObject);
begin
  edtQtdSolicitada.Text := '0';
  Close;
end;

procedure TFormQtdMQuadrado.BtnConfirmarClick(Sender: TObject);
begin
  calcular;
  if StrToCurrDef(edtQtdVenda.Text, 0) > 0 then
    FrmPrincipalPreVenda.EdtQtd.Text := FormatCurr('0.00', Strtocurr(edtQtdVenda.Text) * Strtocurr(edtEmbalagem.Text));
  close;
end;

procedure TFormQtdMQuadrado.calcular;
begin
  edtQtdVenda.Text := transformarM2(edtQtdSolicitada.Text, edtEmbalagem.Text);
  edtTotal.Text := FormatFloat('0.00', StrToCurr(edtQtdVenda.Text) * strToCurr(edtPreco.Text));
end;

procedure TFormQtdMQuadrado.Calcular1Click(Sender: TObject);
begin
  btnCalcular.Click;
end;

procedure TFormQtdMQuadrado.Cancelar1Click(Sender: TObject);
begin
  BtnCancelar.Click;
end;

procedure TFormQtdMQuadrado.Confirmar1Click(Sender: TObject);
begin
  BtnConfirmar.Click;
end;

procedure TFormQtdMQuadrado.edtQtdSolicitadaKeyPress(Sender: TObject;
  var Key: Char);
begin
  validarNumero(Key);
end;

procedure TFormQtdMQuadrado.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  if StrToCurrDef(edtQtdVenda.Text, 0) > 0 then
    FormatCurr('0.00', Strtocurr(edtQtdVenda.Text) * Strtocurr(edtEmbalagem.Text))
  else
  begin
    FrmPrincipalPreVenda.EdtConsulta.SetFocus;
    FrmPrincipalPreVenda.EdtQtd.Text := '0,00';
  end;
end;

end.
