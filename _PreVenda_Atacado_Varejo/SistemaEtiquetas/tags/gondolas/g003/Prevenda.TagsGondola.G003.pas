unit Prevenda.TagsGondola.G003;

interface

uses
  System.SysUtils,

  Produto,
  NEGProduto,

  Prevenda.Utils.ExecutePrint,
  Prevenda.Utils.VerifyTagList,

  Prevenda.TagsGondola.G003_Header,
  Prevenda.TagsGondola.G003_Body,
  Prevenda.TagsGondola.G003_Footer,

  Prevenda.Helpers.CalculateGondolaG003DescriptionAxis,
  Prevenda.Helpers.CalculateGondolaG003UnityAxis,
  Prevenda.Helpers.CalculateGondolaG003PriceVarejoAxis,
  Prevenda.Helpers.CalculateGondolaG003PriceAtacadoAxis;


type
  TGondola003 = class
    private
      ExecutePrint: TExecutePrint;

    public
      procedure PrintTagGondolaG003;
  end;


implementation

{ TGondola003 }


uses
  MoPreVenda,

  Prevenda.Constants.GondolaG003;


procedure TGondola003.PrintTagGondolaG003;

var
  Line: integer;

  Produto: TDomProduto;

  MainGrid: TVerifyTagList;

  Header: TGondolaG003Header;
  Body: TGondolaG003Body;
  Footer: TGondolaG003Footer;

  G003Description: TGondolaG003DescriptionCalcs;
  G003Unit: TGondolaG003UnityCalcs;
  G003PriceVarejo: TGondolaG003PriceVarejoCalcs;
  G003PriceAtacado: TGondolaG003PriceAtacadoCalcs;

begin

  MainGrid := TVerifyTagList.Create;

  try

    MainGrid.VerifyTagList();

  finally

    MainGrid.Free;

  end;


  for Line := 1 to FrmPrincipalPreVenda.SgDados.RowCount - 1 do begin

    Produto := TNEGProduto.buscarProduto(StrToInt(FrmPrincipalPreVenda.SgDados.Cells[0, Line]));

    Header := TGondolaG003Header.Create;
    Body   := TGondolaG003Body.Create;
    Footer := TGondolaG003Footer.Create;

    G003Description := TGondolaG003DescriptionCalcs.Create;
    G003Unit := TGondolaG003UnityCalcs.Create;
    G003PriceVarejo := TGondolaG003PriceVarejoCalcs.Create;
    G003PriceAtacado := TGondolaG003PriceAtacadoCalcs.Create;

    try
      Header.Mount('I8,1,001', 'Q240,25', 'q832', 'D13', 'O', 'JF', 'ZB');

      Body.MountDescription(G003Description.GetG003DescriptionXValue, G003Description.GetG003DescriptionYValue, Produto.descricao);

      Body.MountUnity(G003Unit.GetG003UnityXValue, G003Unit.GetG003UnityYValue, Produto.unidade.unidade);

      Body.MountPriceLabel(G003PriceVarejo.GetG003PriceLabelXValue, G003PriceVarejo.GetG003PriceLabelYValue, 'Pr. Varejo');
      Body.MountPriceValue(G003PriceVarejo.GetG003PriceValueXValue, G003PriceVarejo.GetG003PriceValueYValue, Produto.vlPreco);

      Body.MountPriceLabel(G003PriceAtacado.GetG003PriceLabelXValue, G003PriceAtacado.GetG003PriceLabelYValue, 'Pr. Atacado');
      Body.MountPriceValue(G003PriceAtacado.GetG003PriceValueXValue, G003PriceAtacado.GetG003PriceValueYValue, Produto.vlAtacado);

      Footer.Mount(FrmPrincipalPreVenda.SgDados.Cells[2, Line]);

    finally

      FreeAndNil(Produto);

      Header.Free;
      Body.Free;
      Footer.Free;

      G003Description.Free;
      G003Unit.Free;
      G003PriceVarejo.Free;
      G003PriceAtacado.Free;

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
