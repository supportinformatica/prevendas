unit Prevenda.TagsGondola.AtacadoVarejo001;

interface

uses
  System.SysUtils,

  Produto,
  NEGProduto,

  Prevenda.Utils.ExecutePrint,
  Prevenda.Utils.VerifyTagList,

  Prevenda.TagsGondola.G002G003_Header,
  Prevenda.TagsGondola.G002G003_Body,
  Prevenda.TagsGondola.G003_Body,
  Prevenda.TagsGondola.G002G003_Footer,

  Prevenda.Helpers.CalculateGondolaG002G003DescriptionAxis,
  Prevenda.Helpers.CalculateGondolaG002G003UnityAxis,
  Prevenda.Helpers.CalculateGondolaAtacadoVarejo001PriceVarejoAxis,
  Prevenda.Helpers.CalculateGondolaAtacadoVarejo001PriceAtacadoAxis,


  Prevenda.Helpers.CalculateGondolaG003PriceAtacadoAxis,
  Prevenda.Helpers.CalculateGondolaG003PriceVarejoAxis;

type
  TGondolaAtacadoVarejo001 = class
    private
      ExecutePrint: TExecutePrint;

      GondolaDescription: TGondolaG002G003DescriptionCalcs;
      GondolaUnity: TGondolaG002G003UnityCalcs;
      GondolaPriceVarejo: TGondolaAtacadoVarejo001PriceVarejoCalcs;
      GondolaPriceAtacado: TGondolaAtacadoVarejo001PriceAtacadoCalcs;
    public
      procedure PrintTagGondolaAtacadoVarejo001;
  end;

implementation

{ TGondolaG002G003 }

uses
  MoPreVenda,

  Prevenda.Constants.GondolaAtacadoVarejo001;

procedure TGondolaAtacadoVarejo001.PrintTagGondolaAtacadoVarejo001;

var
  Line: integer;

  Produto: TDomProduto;

  MainGrid: TVerifyTagList;

  Header: TGondolaG002G003Header;
  Body: TGondolaG002G003Body;
  BodyAtacado: TGondolaG003Body;
  Footer: TGondolaG002G003Footer;

//  AtacadoVarejo001Description: TGondolaG002G003DescriptionCalcs;
//  AtacadoVarejo001Unit: TGondolaG002G003UnityCalcs;
//
//  G003PriceVarejo: TGondolaG003PriceVarejoCalcs;
//  G003PriceAtacado: TGondolaG003PriceAtacadoCalcs;

  condicao: boolean;

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
    BodyAtacado := TGondolaG003Body.Create;
    Footer := TGondolaG002G003Footer.Create;

    GondolaDescription := TGondolaG002G003DescriptionCalcs.Create;
    GondolaUnity := TGondolaG002G003UnityCalcs.Create;
    GondolaPriceVarejo := TGondolaAtacadoVarejo001PriceVarejoCalcs.Create;
    GondolaPriceAtacado := TGondolaAtacadoVarejo001PriceAtacadoCalcs.Create;

    condicao := true;

    try
      Header.Mount('I8,1,001', 'Q240,25', 'q832', 'D13', 'O', 'JF', 'ZB');

      Body.MountDescription(GondolaDescription.GetG002G003DescriptionXValue, GondolaDescription.GetG002G003DescriptionYValue, Produto.descricao);

      Body.MountUnity(GondolaUnity.GetG002G003UnityXValue, GondolaUnity.GetG002G003UnityYValue, Produto.unidade.unidade);


      if (condicao = false) then begin

        Body.MountPriceLabel(GondolaPriceVarejo.GetSinglePriceLabelTextX, GondolaPriceVarejo.GetSinglePriceLabelTextY, 'Pr. Varejo');
        Body.MountPriceValue(GondolaPriceVarejo.GetSinglePriceValueDataX, GondolaPriceVarejo.GetSinglePriceValueDataY, Produto.vlPreco);

      end else begin

        Body.MountPriceLabel(GondolaPriceVarejo.GetDoublePriceLabelTextX, GondolaPriceVarejo.GetDoublePriceLabelTextY, 'Pr. Varejo');
        Body.MountPriceValue(GondolaPriceVarejo.GetDoublePriceValueDataX, GondolaPriceVarejo.GetDoublePriceValueDataY, Produto.vlPreco);

        Body.MountPriceLabel(GondolaPriceAtacado.GetPriceLabelTextX, GondolaPriceAtacado.GetPriceLabelTextY, 'Pr. Atacado');
        Body.MountPriceValue(GondolaPriceAtacado.GetPriceValueDataX, GondolaPriceAtacado.GetPriceValueDataY, Produto.vlAtacado);

      end;

      Footer.Mount(FrmPrincipalPreVenda.SgDados.Cells[2, Line]);

    finally

      FreeAndNil(Produto);

      Header.Free;
      Body.Free;
      BodyAtacado.Free;
      Footer.Free;

      GondolaDescription.Free;
      GondolaUnity.Free;
      GondolaPriceVarejo.Free;
      GondolaPriceAtacado.Free;

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
