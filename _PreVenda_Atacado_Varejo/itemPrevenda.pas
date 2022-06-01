unit itemPrevenda;

interface

uses Produto;

type
TItemPrevenda = class(TDOMProduto)
  private
    FprecoVenda: Currency;
    Fquantidade: Real;
    procedure SetprecoVenda(const Value: Currency);
    procedure Setquantidade(const Value: Real);
  public
    property quantidade:Real read Fquantidade write Setquantidade;
    property precoVenda:Currency read FprecoVenda write SetprecoVenda;
end;

implementation

{ TItemPrevenda }

procedure TItemPrevenda.SetprecoVenda(const Value: Currency);
begin
  FprecoVenda := Value;
end;

procedure TItemPrevenda.Setquantidade(const Value: Real);
begin
  Fquantidade := Value;
end;

end.
