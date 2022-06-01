unit prevenda;

interface

uses System.Generics.Collections, itemPrevenda;

type
TPrevenda = class
  private
    FdescontoPercentual: Currency;
    FnomeCliente: string;
    FcodigoFuncionario: Integer;
    FnumeroPrevenda: integer;
    FdataEmissao: TDateTime;
    FcodigoCliente: Integer;
    FprevendaAberta: boolean;
    procedure SetcodigoCliente(const Value: Integer);
    procedure SetcodigoFuncionario(const Value: Integer);
    procedure SetdataEmissao(const Value: TDateTime);
    procedure SetdescontoPercentual(const Value: Currency);
    procedure SetnomeCliente(const Value: string);
    procedure SetnumeroPrevenda(const Value: integer);
    procedure SetprevendaAberta(const Value: boolean);
  public
    itens:TList<TItemPrevenda>;
    property numeroPrevenda:integer read FnumeroPrevenda write SetnumeroPrevenda;
    property codigoCliente:Integer read FcodigoCliente write SetcodigoCliente;
    property nomeCliente:string read FnomeCliente write SetnomeCliente;
    property descontoPercentual:Currency read FdescontoPercentual write SetdescontoPercentual;
    property prevendaAberta:boolean read FprevendaAberta write SetprevendaAberta;
    property dataEmissao:TDateTime read FdataEmissao write SetdataEmissao;
    property codigoFuncionario:Integer read FcodigoFuncionario write SetcodigoFuncionario;
    constructor Create(); overload;
end;

implementation

{ TPrevenda }

constructor TPrevenda.Create;
begin
  itens:= TList<TItemPrevenda>.create();
end;

procedure TPrevenda.SetcodigoCliente(const Value: Integer);
begin
  FcodigoCliente := Value;
end;

procedure TPrevenda.SetcodigoFuncionario(const Value: Integer);
begin
  FcodigoFuncionario := Value;
end;

procedure TPrevenda.SetdataEmissao(const Value: TDateTime);
begin
  FdataEmissao := Value;
end;

procedure TPrevenda.SetdescontoPercentual(const Value: Currency);
begin
  FdescontoPercentual := Value;
end;

procedure TPrevenda.SetnomeCliente(const Value: string);
begin
  FnomeCliente := Value;
end;

procedure TPrevenda.SetnumeroPrevenda(const Value: integer);
begin
  FnumeroPrevenda := Value;
end;

procedure TPrevenda.SetprevendaAberta(const Value: boolean);
begin
  FprevendaAberta := Value;
end;

end.
