unit AlterProdutoPosAdded;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmAlterProdutoPosAdded = class(TForm)
    edtUnidade: TEdit;
    edtPreco: TEdit;
    lblProduto: TLabel;
    btnAtualizar: TButton;
    btnReset: TButton;
    Label2: TLabel;
    Label3: TLabel;
    edtQuantidade: TEdit;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btnResetClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure edtPrecoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    unidade, quantidade, preco : string;
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
  edtPreco.Text := preco;
  edtQuantidade.Text := quantidade;
end;

procedure TfrmAlterProdutoPosAdded.edtPrecoKeyPress(Sender: TObject;
  var Key: Char);
begin
  ValidarNumero(Key);
end;

procedure TfrmAlterProdutoPosAdded.FormShow(Sender: TObject);
begin
  unidade := edtUnidade.Text;
  preco := edtPreco.Text;
  quantidade := edtQuantidade.Text;
end;

end.
