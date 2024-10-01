unit LucroVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids, Produto,
  Data.DB, Data.Win.ADODB;

type
  TfrmLucroVenda = class(TForm)
    SgDados: TStringGrid;
    btnSair: TBitBtn;
    GroupBox1: TGroupBox;
    edtvlValor: TEdit;
    edtvlCusto: TEdit;
    edtvlLucro: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ADOQuery1: TADOQuery;
    Label5: TLabel;
    edtLucroPorcentagem: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
  private
    Desc_Federal : real;
  public
    procedure CarregarDados;
    procedure Verifica_Desc_PisCofins(produto : TDOMProduto);
  end;

var
  frmLucroVenda: TfrmLucroVenda;

implementation

uses MoPrevenda, DOMPrevenda, UItemPrevenda, NEGProduto, NEGLoja, DataModulo, UFuncoesPadrao;

{$R *.dfm}

{ TfrmLucroVenda }

procedure TfrmLucroVenda.btnSairClick(Sender: TObject);
begin
  close;
end;

procedure TfrmLucroVenda.CarregarDados;
var
  i : integer;
  item : TItemPrevenda;
  vlTotal, vlLucro, vlCusto, porcentagem : real;
  vlOutrosImpostos, vlCustoFixo, vlCustoFinal, IcmsC02 : Real;
begin
  i := 1;
  vlTotal := 0;
  vlLucro := 0;
  vlCusto := 0;
  for item in FrmPrincipalPreVenda.prevenda.itens do
  begin
    SgDados.Cells[0,i] := inttostr(item.cdProduto);
    SgDados.Cells[1,i] := (item.descricao);
    SgDados.Cells[2,i] := FormatFloatQ(2,(item.precoVenda * item.quantidade));
    vlTotal := vlTotal + (item.precoVenda * item.quantidade);
    Verifica_Desc_PisCofins(item);
    IcmsC02 := TNEGProduto.getValorICMS_Debito(item, item.precoVenda);
    vlOutrosImpostos := item.precoVenda * (item.nrOutrosImpostos - Desc_Federal) / 100;
    if (UPPERCASE(TNegLoja.getFlagEmpresaConfiguracao) = 'LOCMAQ') then  // calcula o custo fixo em cima do preço de aquisição
      vlCustoFixo := item.nrCustoAquisicao * item.nrCustoFixo / 100
    else
      vlCustoFixo := item.precoVenda  * item.nrCustoFixo / 100;
    vlCustoFinal := TNEGProduto.calcValorCustoFinal(TNEGProduto.getValorIPIVenda(item.cdProduto),item.nrCustoAquisicao,vlOutrosImpostos,
          vlCustoFixo,IcmsC02,TNegLoja.getConfiguracaoRegimeTributario);
    SgDados.Cells[3,i] := floattostr(vlCustoFinal * item.quantidade);
    vlCusto := vlCusto + (vlCustoFinal * item.quantidade);
    SgDados.Cells[4,i] := floattostr((item.precoVenda * item.quantidade)-(vlCustoFinal * item.quantidade));
    vlLucro := vlLucro + ((item.precoVenda * item.quantidade)-(vlCustoFinal * item.quantidade));
    SgDados.Cells[5,i] := FormatFloat('0.00',((StrtoFloat(SgDados.Cells[4,i])/StrtoFloat(SgDados.Cells[2,i])) * 100));
    Inc(i);
    SgDados.RowCount := SgDados.RowCount + 1;
  end;
  edtvlValor.Text := FormatFloatQ(2,(vlTotal));
  edtvlCusto.Text := FormatFloatQ(2,(vlCusto));
  edtvlLucro.Text := FormatFloatQ(2,(vlLucro));
  porcentagem := (1 -(vlCusto / vlTotal)) * 100;
  edtLucroPorcentagem.Text := FormatFloatQ(2,(porcentagem));
end;

procedure TfrmLucroVenda.FormCreate(Sender: TObject);
begin
  with SgDados do
  begin
    Cells[0,0] := 'Código';
    Cells[1,0] := 'Descrição';
    Cells[2,0] := 'Valor Venda';
    Cells[3,0] := 'Custo Final';
    Cells[4,0] := 'Lucro R$';
    Cells[5,0] := 'Lucro %';
  end;
  CarregarDados
end;

procedure TfrmLucroVenda.Verifica_Desc_PisCofins(produto : TDOMProduto);
var
  tpEmpresa : string;
begin
  tpEmpresa := TNegLoja.getConfiguracaoRegimeTributario;
  With ADOQuery1 do
  begin
    Sql.Text := 'Select cdcodigo,vlTaxa From clfiscal WITH (NOLOCK) Where cdclassificacao = :cd';
    parameters.parambyname('cd').Value := produto.ncm.ncm;
    Open;
    Desc_Federal := 0;
    if (tpEmpresa = 'S') and (Copy(produto.cst, 2, 3) = '500') then // quando o produto é substituto tem q retirar a alíquota do icms do simples
      Desc_Federal := TNEGLoja.getConfiguracaoAliqIcmsSimples;
    if (FieldByName('vlTaxa').AsFloat = 0) and ((tpEmpresa = 'N')) then
      Desc_Federal := 3.65;
    if (FieldByName('vlTaxa').AsFloat = 0) and ((tpEmpresa = 'R')) then
      Desc_Federal := 9.25;
  end;
end;

end.
