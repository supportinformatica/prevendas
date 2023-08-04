unit Prevenda.TagsGondola.G002G003;

interface

uses
  System.SysUtils,

  Produto,
  NEGProduto,

  Prevenda.Utils.ExecutePrint,
  Prevenda.Utils.VerifyTagList,

  Prevenda.TagsGondola.G002G003_Header,
  Prevenda.TagsGondola.G002G003_Body,
  Prevenda.TagsGondola.G002G003_Footer,

  Prevenda.Helpers.CalculateGondolaG002G003DescriptionAxis,
  Prevenda.Helpers.CalculateGondolaG002G003UnityAxis,
  Prevenda.Helpers.CalculateGondolaG002G003PriceAxis;

type
  TGondolaG002G003 = class
    private
      ExecutePrint: TExecutePrint;

    public
      procedure PrintTagGondolaG002G003;
  end;

implementation

{ TGondolaG002G003 }

uses
  MoPreVenda,

  Prevenda.Constants.GondolaG002G003;

procedure TGondolaG002G003.PrintTagGondolaG002G003;

var
  Line: integer;

  Produto: TDomProduto;

  MainGrid: TVerifyTagList;

  Header: TGondolaG002G003Header;
  Body: TGondolaG002G003Body;
  Footer: TGondolaG002G003Footer;

  G002G003Description: TGondolaG002G003DescriptionCalcs;
  G002G003Unit: TGondolaG002G003UnityCalcs;
  G002G003Price: TGondolaG002G003PriceCalcs;

begin

  MainGrid := TVerifyTagList.Create;

  try

    MainGrid.VerifyTagList();

  finally

    MainGrid.Free;

  end;



  for Line := 1 to FrmPrincipalPreVenda.SgDados.RowCount - 1 do begin

    Produto := TNEGProduto.buscarProduto(StrToInt(FrmPrincipalPreVenda.SgDados.Cells[0, Line]));

    Header := TGondolaG002G003Header.Create;
    Body   := TGondolaG002G003Body.Create;
    Footer := TGondolaG002G003Footer.Create;

    G002G003Description := TGondolaG002G003DescriptionCalcs.Create;
    G002G003Unit := TGondolaG002G003UnityCalcs.Create;
    G002G003Price := TGondolaG002G003PriceCalcs.Create;

    try
      Header.Mount('I8,1,001', 'Q240,25', 'q832', 'D13', 'O', 'JF', 'ZB');

      Body.MountDescription(G002G003Description.GetG002G003DescriptionXValue, G002G003Description.GetG002G003DescriptionYValue, Produto.descricao);

      Body.MountUnity(G002G003Unit.GetG002G003UnityXValue, G002G003Unit.GetG002G003UnityYValue, Produto.unidade.unidade);

      Body.MountPriceLabel(G002G003Price.GetG002G003PriceLabelXValue, G002G003Price.GetG002G003PriceLabelYValue, 'Pr. Varejo');
      Body.MountPriceValue(G002G003Price.GetG002G003PriceValueXValue, G002G003Price.GetG002G003PriceValueYValue, Produto.vlPreco);

      Footer.Mount(FrmPrincipalPreVenda.SgDados.Cells[2, Line]);

    finally

      FreeAndNil(Produto);

      Header.Free;
      Body.Free;
      Footer.Free;

      G002G003Description.Free;
      G002G003Unit.Free;
      G002G003Price.Free;

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
