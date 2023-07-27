unit Prevenda.Entities.ProductOnPriting;

interface

type
  TProductOnPriting = class
    private
      Fcode: string;
      Fquantity: string;

    public
      property code: string read Fcode write Fcode;
      property quantity: string read Fquantity write Fquantity;
  end;

implementation

end.
