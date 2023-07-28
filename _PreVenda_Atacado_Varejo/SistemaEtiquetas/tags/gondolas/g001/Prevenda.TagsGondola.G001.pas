unit Prevenda.TagsGondola.G001;

interface

uses
  System.SysUtils,

  Produto,
  NEGProduto,

  Prevenda.Entities.ProductOnPriting;

type
  TGondola001 = class
    private
    public
      procedure PrintTagGondolaG001(RequiredProductsToPrint: TRequiredProductsToPrint; NumberOfLinesOnGrid: integer);
  end;

implementation

{ TGondola001 }

procedure TGondola001.PrintTagGondolaG001(RequiredProductsToPrint: TRequiredProductsToPrint; NumberOfLinesOnGrid: integer);

var
  LogicalTagFile: TextFile;
  I: integer;

  Produto: TDomProduto;

begin
  assignfile(LogicalTagFile, 'myetiqueta.txt');
  rewrite(LogicalTagFile);


  for I := 1 to NumberOfLinesOnGrid - 1 do begin
    Produto := TNEGProduto.buscarProduto(StrToInt(RequiredProductsToPrint[I].code));

    try

      writeln(LogicalTagFile, 'Codigo: ' +Produto.cdProduto.ToString);
      writeln(LogicalTagFile, 'Descricao: ' +Produto.descricao);
      writeln(LogicalTagFile, 'Unidade: ' +Produto.unidade.unidade);
      writeln(LogicalTagFile, 'Preco: ' +FormatFloat('0.00', Produto.vlPreco));
      writeln(LogicalTagFile, 'Quantidade: ' +FormatFloat('0', StrToFloat(RequiredProductsToPrint[I].quantity)));
      writeln(LogicalTagFile, '');

    finally
      FreeAndNil(Produto);
    end;
  end;

  close(LogicalTagFile);
end;

end.
