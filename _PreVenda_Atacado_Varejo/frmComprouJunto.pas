unit frmComprouJunto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, System.Generics.Collections,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids, Produto, DOMProdutoVendidoJunto, NEGPrevenda, DOMCliente;

type
  TformComprouJunto = class(TForm)
    Label1: TLabel;
    gridLista: TStringGrid;
    btnSair: TBitBtn;
    cbxProdutos: TComboBox;
    btnBuscar: TBitBtn;
    procedure btnBuscarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure gridListaDblClick(Sender: TObject);
    procedure gridListaKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cbxProdutosChange(Sender: TObject);
  private
    cliente: TCliente;
    produtos: TList<TDOMProduto>;
    produtoResultado: ^TDOMProduto;
    procedure adicionarTitulosGrid;
    procedure listarProdutosVendidosJunto;
    procedure preencherComboProdutos;
    procedure preencherProdutoResultadoComProdutoSelecionado;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; produtos:TList<TDOMProduto>; cliente:TCliente; var produtoResultado:TDOMProduto);
  end;

var
  formComprouJunto: TformComprouJunto;

implementation

uses uFuncoesPadrao;

{$R *.dfm}

{ TForm1 }

procedure TformComprouJunto.adicionarTitulosGrid;
begin
  with gridLista do
  begin
    Cells[0,0]:= 'Código';
    Cells[1,0]:= 'Descrição';
    Cells[2,0]:= 'Freq (%)';
    Cells[3,0]:= 'Preço';
  end;
end;

procedure TformComprouJunto.preencherComboProdutos;
var
  i:integer;
begin
  cbxProdutos.Clear;
  cbxProdutos.Text:= '';
  for i := 0 to (produtos.Count-1) do
    cbxProdutos.Items.Add(produtos[i].descricao + ' | ' + IntToStr(produtos[i].cdProduto));
end;

procedure TformComprouJunto.listarProdutosVendidosJunto;
var
  codigoProduto:Integer;
  listaProdutosVendidosJunto:TList<TProdutoVendidoJunto>;
  i, j:integer;
begin
  codigoProduto:= StrToIntDef(copy_campo(cbxProdutos.Text,'|',2),-1);
  listaProdutosVendidosJunto:= TNEGPrevenda.getProdutosVendidosJunto(codigoProduto);
  Limpa_Grid(gridLista);
  gridLista.RowCount:= 6;
  if (listaProdutosVendidosJunto = nil) then
  begin
    MessageDlg('Selecione um produto na lista.', mtInformation, [mbOk], 0);
    Exit;
  end;
  if (listaProdutosVendidosJunto.Count = 0) then
  begin
    MessageDlg('Nenhum produto vendido junto nos últimos doze meses.', mtInformation, [mbOk], 0);
    Exit;
  end
  else
  for i:= 0 to (listaProdutosVendidosJunto.Count - 1) do
  begin
    gridLista.Cells[0, i+1]:= IntToStr(listaProdutosVendidosJunto[i].cdProduto);
    gridLista.Cells[1, i+1]:= listaProdutosVendidosJunto[i].descricao;
    gridLista.Cells[2, i+1]:= FormatFloatQ(2, listaProdutosVendidosJunto[i].frequencia);
    if (cliente.descontoPercentual <> 0) then
    begin
      if cliente.isAtacado then
         gridLista.Cells[3, i+1]:= FormatFloatQ(2, listaProdutosVendidosJunto[i].vlAtacado*(100-cliente.descontoPercentual)/100)
      else
         gridLista.Cells[3, i+1]:= FormatFloatQ(2, listaProdutosVendidosJunto[i].vlPreco*(100-cliente.descontoPercentual)/100);
    end
    else
    begin
      if cliente.isAtacado then
         gridLista.Cells[3, i+1]:= FormatFloatQ(2, listaProdutosVendidosJunto[i].vlAtacado)
      else
         gridLista.Cells[3, i+1]:= FormatFloatQ(2, listaProdutosVendidosJunto[i].vlPreco);
    end;
  end;
  FreeAndNil(listaProdutosVendidosJunto);
end;

procedure TformComprouJunto.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TformComprouJunto.cbxProdutosChange(Sender: TObject);
begin
  Limpa_Grid(gridLista);
end;

procedure TformComprouJunto.btnBuscarClick(Sender: TObject);
begin
  listarProdutosVendidosJunto;
  cbxProdutos.SetFocus;
end;

constructor TformComprouJunto.Create(AOwner: TComponent; produtos:TList<TDOMProduto>; cliente:TCliente; var produtoResultado:TDOMProduto);
begin
  inherited Create(AOwner);
  self.produtos:= produtos;
  Self.produtoResultado:= @produtoResultado;
  Self.produtoResultado^:= TDOMProduto.Create;
  Self.cliente:= cliente;
  adicionarTitulosGrid;
  preencherComboProdutos;
  cbxProdutos.ItemIndex:= 0;
end;

procedure TformComprouJunto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:= caFree;
end;

procedure TformComprouJunto.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    listarProdutosVendidosJunto;
    cbxProdutos.SetFocus;
  end
  else
  if key = VK_ESCAPE then
    Close;
end;

procedure TformComprouJunto.preencherProdutoResultadoComProdutoSelecionado;
var
  codigoProduto:integer;
begin
  if (gridLista.Row > 0) and (TryStrToInt(gridLista.Cells[0, gridLista.Row], codigoProduto)) then
  begin
    produtoResultado^.cdProduto:= codigoProduto;
    produtoResultado^.descricao:= gridLista.Cells[1, gridLista.Row];
  end;
end;

procedure TformComprouJunto.gridListaDblClick(Sender: TObject);
begin
  preencherProdutoResultadoComProdutoSelecionado;
  close;
end;

procedure TformComprouJunto.gridListaKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then
  begin
    preencherProdutoResultadoComProdutoSelecionado;
    close;
  end;
end;

end.
