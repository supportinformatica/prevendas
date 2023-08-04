unit Prevenda.TagsGondola.G001;

interface

uses
  System.SysUtils,

  System.IniFiles,

  ShellApi,

  Vcl.Dialogs,

  Produto,
  NEGProduto,

  Prevenda.Constants.App,

  Prevenda.Utils.ExecutePrint,
  Prevenda.Utils.TagFileWriter,
  Prevenda.Utils.ConfigurationFileReader,
  Prevenda.Utils.FirstImpression,
  Prevenda.Utils.VerifyTagList,

  Prevenda.TagsGondola.G001_Header,
  Prevenda.TagsGondola.G001_Body,

  Prevenda.Helpers.CalculateGondolaG001DescriptionAxis,
  Prevenda.Helpers.CalculateGondolaG001UnityAxis,
  Prevenda.Helpers.CalculateGondolaG001BarcodeAxis,
  Prevenda.Helpers.CalculateGondolaG001PriceAxis;

type
  TGondola001 = class
    private
      ExecutePrint: TExecutePrint;
      TagFileWriter: TTagFileWriter;

    public
      procedure PrintTagGondolaG001;
  end;

implementation

{ TGondola001 }

uses
  MoPreVenda,

  Prevenda.Constants.GondolaG001;

procedure TGondola001.PrintTagGondolaG001;

var
  Line: integer;

  Produto: TDomProduto;

  MainGrid: TVerifyTagList;

  Header: TGondolaG001Header;
  Body: TGondolaG001Body;

  G001Description: TGondolaG001DescriptionCalcs;
  G001Unit: TGondolaG001UnityCalcs;
  G001Barcode: TGondolaG001BarcodeCalcs;
  G001Price: TGondolaG001PriceCalcs;

begin

  MainGrid := TVerifyTagList.Create;

  try

    MainGrid.VerifyTagList();

  finally

    MainGrid.Free;

  end;



  for Line := 1 to FrmPrincipalPreVenda.SgDados.RowCount - 1 do begin

    Produto := TNEGProduto.buscarProduto(StrToInt(FrmPrincipalPreVenda.SgDados.Cells[0, Line]));

    Header := TGondolaG001Header.Create;
    Body   := TGondolaG001Body.Create;

    TagFileWriter := TTagFileWriter.Create;

    G001Description := TGondolaG001DescriptionCalcs.Create;
    G001Unit := TGondolaG001UnityCalcs.Create;
    G001Barcode := TGondolaG001BarcodeCalcs.Create;
    G001Price := TGondolaG001PriceCalcs.Create;

      try
        Header.Mount('I8,1,001', 'Q240,12', 'q832', 'D11', 'O', 'JF', 'ZB');

        Body.MountDescription(G001Description.GetG001DescriptionXValue, G001Description.GetG001DescriptionYValue, Produto.descricao);

        Body.MountUnity(G001Unit.GetG001UnityXValue, G001Unit.GetG001UnityYValue, Produto.unidade.unidade);

        Body.MountPriceSymbol(G001Price.GetG001PriceSymbolXValue, G001Price.GetG001PriceSymbolYValue, 'R$');
        Body.MountPriceValue(G001Price.GetG001PriceValueXValue, G001Price.GetG001PriceValueYValue, Produto.vlPreco);

        Body.MountBarcodeSymbol(G001Barcode.GetG001BarcodeSymbolXValue, G001Barcode.GetG001BarcodeSymbolYValue, Produto.codigoBarras);
        Body.MountBarcodeValue(G001Barcode.GetG001BarcodeValueXValue, G001Barcode.GetG001BarcodeValueYValue, Produto.codigoBarras);

        TagFileWriter.WriteOnTagFile('P' +FormatFloat('0', StrToFloat(FrmPrincipalPreVenda.SgDados.Cells[2, Line])));

      finally

        FreeAndNil(Produto);
        TagFileWriter.Free;

        Header.Free;
        Body.Free;

        G001Description.Free;
        G001Unit.Free;
        G001Barcode.Free;
        G001Price.Free;

      end;

  end;


  ExecutePrint := TExecutePrint.Create;

  try

    ExecutePrint.Start();

  finally

    ExecutePrint.Free;

  end;

  FrmPrincipalPreVenda.Limpar_Tela;

  FrmPrincipalPreVenda.RgOpcoes.ItemIndex := 0;

end;

end.
