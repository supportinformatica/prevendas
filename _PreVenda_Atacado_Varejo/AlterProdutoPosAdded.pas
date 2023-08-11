unit AlterProdutoPosAdded;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmAlterProdutoPosAdded = class(TForm)
    edtUnidade: TEdit;
    edtPrecoBruto: TEdit;
    lblProduto: TLabel;
    btnAtualizar: TButton;
    btnReset: TButton;
    Label2: TLabel;
    Label3: TLabel;
    edtQuantidade: TEdit;
    Label1: TLabel;
    Label4: TLabel;
    edtDesconto: TEdit;
    Label5: TLabel;
    edtPrecoLiquido: TEdit;
    Label6: TLabel;
    edtSubtotal: TEdit;
    procedure FormShow(Sender: TObject);
    procedure btnResetClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure edtPrecoBrutoKeyPress(Sender: TObject; var Key: Char);
    procedure edtDescontoKeyPress(Sender: TObject; var Key: Char);
    procedure edtPrecoLiquidoKeyPress(Sender: TObject; var Key: Char);
    procedure edtDescontoChange(Sender: TObject);
    procedure edtPrecoBrutoChange(Sender: TObject);
    procedure edtQuantidadeChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    unidade, quantidade, precoBruto, precoLiq : string;
    procedure CalcularDesconto;
  end;

var
  frmAlterProdutoPosAdded: TfrmAlterProdutoPosAdded;

implementation

uses UFuncoesPadrao;

{$R *.dfm}

procedure TfrmAlterProdutoPosAdded.btnAtualizarClick(Sender: TObject);
begin
  close;
end;

procedure TfrmAlterProdutoPosAdded.btnResetClick(Sender: TObject);
begin
  edtUnidade.Text := unidade;
  edtPrecoBruto.Text := precoBruto;
  edtPrecoLiquido.Text := precoLiq;
  edtQuantidade.Text := quantidade;
  CalcularDesconto;
end;

procedure TfrmAlterProdutoPosAdded.CalcularDesconto;
var
  _quantidade : real;
  _subtotal, _desconto, _precoBruto, _precoLiquido : currency;
begin
  _quantidade := StrToFloatDef(edtQuantidade.Text,0);
  _precoBruto := StrToFloatDef(edtPrecoBruto.Text,0);
  _precoBruto := _precoBruto * 100; //transformo em centavos
  _desconto := StrToFloatDef(edtDesconto.Text,0) / 100;  //valor em percentual
  _precoLiquido := (_precoBruto - (_precoBruto * _desconto)) / 100;
  _subtotal := (_precoLiquido *  _quantidade);

  edtPrecoLiquido.Text := FormatFloat('0.00',_precoLiquido);
  edtSubtotal.Text     := FormatFloat('0.00',_subtotal);
end;

procedure TfrmAlterProdutoPosAdded.edtDescontoChange(Sender: TObject);
begin
  CalcularDesconto;
end;

procedure TfrmAlterProdutoPosAdded.edtDescontoKeyPress(Sender: TObject;
  var Key: Char);
begin
  ValidarNumero(Key);
end;

procedure TfrmAlterProdutoPosAdded.edtPrecoBrutoChange(Sender: TObject);
begin
  CalcularDesconto;
end;

procedure TfrmAlterProdutoPosAdded.edtPrecoBrutoKeyPress(Sender: TObject;
  var Key: Char);
begin
  ValidarNumero(Key);
end;

procedure TfrmAlterProdutoPosAdded.edtPrecoLiquidoKeyPress(Sender: TObject;
  var Key: Char);
begin
  ValidarNumero(Key);
end;

procedure TfrmAlterProdutoPosAdded.edtQuantidadeChange(Sender: TObject);
begin
  CalcularDesconto;
end;

procedure TfrmAlterProdutoPosAdded.FormShow(Sender: TObject);
begin
  unidade := edtUnidade.Text;
  precoBruto := edtPrecoBruto.Text;
  quantidade := edtQuantidade.Text;
  precoLiq   := edtPrecoLiquido.Text;
end;

end.
