unit formUltimasVendasDoProdutoAoCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids, Produto, DOMCliente, NEGPrevenda, DOMVendaDeProduto,
  System.Generics.Collections;

type
  TfrmUltimasVendasDoProdutoAoCliente = class(TForm)
    Label1: TLabel;
    gridLista: TStringGrid;
    btnSair: TBitBtn;
    lblProduto: TLabel;
    lblCliente: TLabel;
    procedure btnSairClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure adicionarTitulosGrid;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; produto:TDOMProduto; cliente:TCliente);
  end;

var
  frmUltimasVendasDoProdutoAoCliente: TfrmUltimasVendasDoProdutoAoCliente;

implementation

{$R *.dfm}

procedure TfrmUltimasVendasDoProdutoAoCliente.adicionarTitulosGrid;
begin
  with gridLista do
  begin
    Cells[0,0]:= 'Data';
    Cells[1,0]:= 'Lançamento';
    Cells[2,0]:= 'Quantidade';
    Cells[3,0]:= 'Preço';
  end;
end;

procedure TfrmUltimasVendasDoProdutoAoCliente.btnSairClick(Sender: TObject);
begin
  Close;
end;

constructor TfrmUltimasVendasDoProdutoAoCliente.Create(AOwner: TComponent;
  produto: TDOMProduto; cliente: TCliente);
var
  vendasDoProduto:TList<TVendaDeProduto>;
  i:integer;
begin
  inherited Create(AOwner);
  adicionarTitulosGrid;
  lblCliente.Caption:= 'Cliente .: ' + intToStr(cliente.codigo) + ' | ' + cliente.nome;
  lblProduto.Caption:= 'Produto: '+ intToStr(produto.cdProduto) + ' | ' +  produto.descricao;
  vendasDoProduto:= TNEGPrevenda.getUltimasVendasDoProdutoAoCliente(produto.cdProduto, cliente.codigo, 5);
  for i := 0 to (vendasDoProduto.Count-1) do
  begin
    gridLista.Cells[0,i+1]:= DateToStr(vendasDoProduto[i].dataLancamento);
    gridLista.Cells[1,i+1]:= vendasDoProduto[i].lancamento;
    gridLista.Cells[2,i+1]:= FormatFloat('0.000', vendasDoProduto[i].quantidadeVendida);
    gridLista.Cells[3,i+1]:= FormatFloat('0.00', vendasDoProduto[i].precoVenda);
  end;
  FreeAndNil(vendasDoProduto);
end;

procedure TfrmUltimasVendasDoProdutoAoCliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:= caFree;
end;

procedure TfrmUltimasVendasDoProdutoAoCliente.FormKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_ESCAPE then
    Close;
end;

end.
