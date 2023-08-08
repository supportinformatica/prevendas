unit Prevenda.TagsGondola.AtacadoVarejo001;

interface

uses
  System.SysUtils,

  Produto,
  NEGProduto,

  Prevenda.Utils.ExecutePrint,
  Prevenda.Utils.VerifyTagList,

  Prevenda.TagsGondola.AtacadoVarejo001_Header,
  Prevenda.TagsGondola.AtacadoVarejo001_Body,
  Prevenda.TagsGondola.G003_Body,
  Prevenda.TagsGondola.AtacadoVarejo001_Footer,

  Prevenda.Helpers.CalculateGondolaAtacadoVarejo001DescriptionAxis,
  Prevenda.Helpers.CalculateGondolaAtacadoVarejo001UnityAxis,
  Prevenda.Helpers.CalculateGondolaAtacadoVarejo001PriceVarejoAxis,
  Prevenda.Helpers.CalculateGondolaAtacadoVarejo001PriceAtacadoAxis,


  Prevenda.Helpers.CalculateGondolaG003PriceAtacadoAxis,
  Prevenda.Helpers.CalculateGondolaG003PriceVarejoAxis;

type
  TGondolaAtacadoVarejo001 = class
    private
      ExecutePrint: TExecutePrint;

      Header: TGondolaAtacadoVarejo001Header;
      Body: TGondolaAtacadoVarejo001Body;
      Footer: TGondolaAtacadoVarejo001Footer;

      GondolaDescription: TGondolaAtacadoVarejo001DescriptionCalcs;
      GondolaUnity: TGondolaAtacadoVarejo001UnityCalcs;
      GondolaPriceVarejo: TGondolaAtacadoVarejo001PriceVarejoCalcs;
      GondolaPriceAtacado: TGondolaAtacadoVarejo001PriceAtacadoCalcs;

    public
      procedure PrintTagGondolaAtacadoVarejo001;

  end;

implementation

{ TGondolaAtacadoVarejo001 }

uses
  MoPreVenda,

  Prevenda.Constants.GondolaAtacadoVarejo001;

procedure TGondolaAtacadoVarejo001.PrintTagGondolaAtacadoVarejo001;

var
  Line: integer;

  Produto: TDomProduto;

  MainGrid: TVerifyTagList;

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

    Header := TGondolaAtacadoVarejo001Header.Create;
    Body   := TGondolaAtacadoVarejo001Body.Create;
    Footer := TGondolaAtacadoVarejo001Footer.Create;

    GondolaDescription := TGondolaAtacadoVarejo001DescriptionCalcs.Create;
    GondolaUnity := TGondolaAtacadoVarejo001UnityCalcs.Create;
    GondolaPriceVarejo := TGondolaAtacadoVarejo001PriceVarejoCalcs.Create;
    GondolaPriceAtacado := TGondolaAtacadoVarejo001PriceAtacadoCalcs.Create;

    condicao := false;

    try
      Header.Mount('I8,1,001', 'Q240,25', 'q832', 'D13', 'O', 'JF', 'ZB');

      Body.MountDescription(
        GondolaDescription.GetDescriptionValueDataX,
        GondolaDescription.GetDescriptionValueDataY,
        Produto.descricao
      );

      Body.MountUnity(
        GondolaUnity.GetUnityValueDataX,
        GondolaUnity.GetUnityValueDataY,
        Produto.unidade.unidade
      );


      if (condicao = false) then begin

        Body.MountPriceLabel(
          GondolaPriceVarejo.GetSinglePriceLabelTextX,
          GondolaPriceVarejo.GetSinglePriceLabelTextY,
          'Pr. Varejo'
        );

        Body.MountPriceValue(
          GondolaPriceVarejo.GetSinglePriceValueDataX,
          GondolaPriceVarejo.GetSinglePriceValueDataY,
          Produto.vlPreco
        );

      end else begin

        Body.MountPriceLabel(
          GondolaPriceVarejo.GetDoublePriceLabelTextX,
          GondolaPriceVarejo.GetDoublePriceLabelTextY,
          'Pr. Varejo'
        );

        Body.MountPriceValue(
          GondolaPriceVarejo.GetDoublePriceValueDataX,
          GondolaPriceVarejo.GetDoublePriceValueDataY,
          Produto.vlPreco
        );

        Body.MountPriceLabel(
          GondolaPriceAtacado.GetPriceLabelTextX,
          GondolaPriceAtacado.GetPriceLabelTextY,
          'Pr. Atacado'
        );

        Body.MountPriceValue(
          GondolaPriceAtacado.GetPriceValueDataX,
          GondolaPriceAtacado.GetPriceValueDataY,
          Produto.vlAtacado
        );

      end;

      Footer.Mount(FrmPrincipalPreVenda.SgDados.Cells[2, Line]);

    finally

      FreeAndNil(Produto);

      Header.Free;
      Body.Free;
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
