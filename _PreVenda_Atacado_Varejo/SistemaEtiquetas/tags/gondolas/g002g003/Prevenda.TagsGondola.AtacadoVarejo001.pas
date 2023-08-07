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
  Prevenda.Helpers.CalculateGondolaG002G003PriceAxis,

  Prevenda.Helpers.CalculateGondolaG003PriceAtacadoAxis,
  Prevenda.Helpers.CalculateGondolaG003PriceVarejoAxis;

type
  TGondolaAtacadoVarejo001 = class
    private
      ExecutePrint: TExecutePrint;

    public
      procedure PrintTagGondolaAtacadoVarejo001;
  end;

implementation

{ TGondolaG002G003 }

uses
  MoPreVenda,

  Prevenda.Constants.GondolaG002G003;

procedure TGondolaAtacadoVarejo001.PrintTagGondolaAtacadoVarejo001;

var
  Line: integer;

  Produto: TDomProduto;

  MainGrid: TVerifyTagList;

  Header: TGondolaG002G003Header;
  Body: TGondolaG002G003Body;
  BodyAtacado: TGondolaG003Body;
  Footer: TGondolaG002G003Footer;

  AtacadoVarejo001Description: TGondolaG002G003DescriptionCalcs;
  AtacadoVarejo001Unit: TGondolaG002G003UnityCalcs;
  AtacadoVarejo001Price: TGondolaG002G003PriceCalcs;

  G003PriceVarejo: TGondolaG003PriceVarejoCalcs;
  G003PriceAtacado: TGondolaG003PriceAtacadoCalcs;

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

    AtacadoVarejo001Description := TGondolaG002G003DescriptionCalcs.Create;
    AtacadoVarejo001Unit := TGondolaG002G003UnityCalcs.Create;
    AtacadoVarejo001Price := TGondolaG002G003PriceCalcs.Create;

    condicao := true;

    try
      Header.Mount('I8,1,001', 'Q240,25', 'q832', 'D13', 'O', 'JF', 'ZB');

      Body.MountDescription(AtacadoVarejo001Description.GetG002G003DescriptionXValue, AtacadoVarejo001Description.GetG002G003DescriptionYValue, Produto.descricao);

      Body.MountUnity(AtacadoVarejo001Unit.GetG002G003UnityXValue, AtacadoVarejo001Unit.GetG002G003UnityYValue, Produto.unidade.unidade);


      if (condicao = false) then begin

        Body.MountPriceLabel(AtacadoVarejo001Price.GetG002G003PriceLabelXValue, AtacadoVarejo001Price.GetG002G003PriceLabelYValue, 'Pr. Varejo');
        Body.MountPriceValue(AtacadoVarejo001Price.GetG002G003PriceValueXValue, AtacadoVarejo001Price.GetG002G003PriceValueYValue, Produto.vlPreco);

      end else begin

        Body.MountPriceLabel(G003PriceVarejo.GetG003PriceLabelXValue, G003PriceVarejo.GetG003PriceLabelYValue, 'Pr. Varejo');
        Body.MountPriceValue(G003PriceVarejo.GetG003PriceValueXValue, G003PriceVarejo.GetG003PriceValueYValue, Produto.vlPreco);

        Body.MountPriceLabel(G003PriceAtacado.GetG003PriceLabelXValue, G003PriceAtacado.GetG003PriceLabelYValue, 'Pr. Atacado');
        Body.MountPriceValue(G003PriceAtacado.GetG003PriceValueXValue, G003PriceAtacado.GetG003PriceValueYValue, Produto.vlPreco);

      end;

      Footer.Mount(FrmPrincipalPreVenda.SgDados.Cells[2, Line]);

    finally

      FreeAndNil(Produto);

      Header.Free;
      Body.Free;
      BodyAtacado.Free;
      Footer.Free;

      AtacadoVarejo001Description.Free;
      AtacadoVarejo001Unit.Free;
      AtacadoVarejo001Price.Free;

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
