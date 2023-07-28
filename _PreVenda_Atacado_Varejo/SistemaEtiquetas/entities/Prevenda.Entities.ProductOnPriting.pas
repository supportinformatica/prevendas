unit Prevenda.Entities.ProductOnPriting;

interface

type
  TRequiredProductToPrint = class
    private
      Fcode: string;
      Fquantity: string;

    public
      property code: string read Fcode write Fcode;
      property quantity: string read Fquantity write Fquantity;
  end;

  TRequiredProductsToPrint = array of TRequiredProductToPrint;

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
