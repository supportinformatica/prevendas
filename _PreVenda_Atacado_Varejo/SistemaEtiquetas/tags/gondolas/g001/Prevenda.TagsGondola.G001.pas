unit Prevenda.TagsGondola.G001;

interface

uses
  NEGProduto,

  Prevenda.Entities.ProductOnPriting;

type
  TGondola001 = class
    private
    public
      procedure PrintTagGondolaG001(ProductOnPriting: TProductOnPriting; NumberOfLinesOnGrid: integer);
  end;

implementation

{ TGondola001 }

procedure TGondola001.PrintTagGondolaG001(ProductOnPriting: TProductOnPriting; NumberOfLinesOnGrid: integer);

var
  LogicalTagFile: TextFile;
  I: integer;

begin
  assignfile(LogicalTagFile, 'myetiqueta.txt');
  rewrite(LogicalTagFile);

  for I := 1 to NumberOfLinesOnGrid do begin
    writeln(LogicalTagFile, ProductOnPriting.code);
    writeln(LogicalTagFile, ProductOnPriting.quantity);
  end;

  close(LogicalTagFile);
end;

end.
