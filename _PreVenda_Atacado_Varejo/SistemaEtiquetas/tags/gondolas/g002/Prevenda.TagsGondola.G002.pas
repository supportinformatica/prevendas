unit Prevenda.TagsGondola.G002;

interface

uses
  System.SysUtils,

  Produto,
  NEGProduto,

  Prevenda.Utils.ExecutePrint,
  Prevenda.Utils.VerifyTagList,

  Prevenda.TagsGondola.G002_Header,
  Prevenda.TagsGondola.G002_Body,
  Prevenda.TagsGondola.G002_Footer,

  Prevenda.Helpers.CalculateGondolaG002DescriptionAxis,
  Prevenda.Helpers.CalculateGondolaG002UnityAxis,
  Prevenda.Helpers.CalculateGondolaG002PriceAxis;

type
  TGondola002 = class
    private
      ExecutePrint: TExecutePrint;

    public
      procedure PrintTagGondolaG002;
  end;

implementation

{ TGondola002 }

uses
  MoPreVenda,

  Prevenda.Constants.GondolaG002;

procedure TGondola002.PrintTagGondolaG002;

var
  Line: integer;

  Produto: TDomProduto;

  MainGrid: TVerifyTagList;

  Header: TGondolaG002Header;
  Body: TGondolaG002Body;
  Footer: TGondolaG002Footer;

  G002Description: TGondolaG002DescriptionCalcs;
  G002Unit: TGondolaG002UnityCalcs;
  G002Price: TGondolaG002PriceCalcs;

begin

  MainGrid := TVerifyTagList.Create;

  try

    MainGrid.VerifyTagList();

  finally

    MainGrid.Free;

  end;



  for Line := 1 to FrmPrincipalPreVenda.SgDados.RowCount - 1 do begin

    Produto := TNEGProduto.buscarProduto(StrToInt(FrmPrincipalPreVenda.SgDados.Cells[0, Line]));

    Header := TGondolaG002Header.Create;
    Body   := TGondolaG002Body.Create;
    Footer := TGondolaG002Footer.Create;

    G002Description := TGondolaG002DescriptionCalcs.Create;
    G002Unit := TGondolaG002UnityCalcs.Create;
    G002Price := TGondolaG002PriceCalcs.Create;

    try
      Header.Mount('I8,1,001', 'Q240,25', 'q832', 'D13', 'O', 'JF', 'ZB');

      Body.MountDescription(G002Description.GetG002DescriptionXValue, G002Description.GetG002DescriptionYValue, Produto.descricao);

      Body.MountUnity(G002Unit.GetG002UnityXValue, G002Unit.GetG002UnityYValue, Produto.unidade.unidade);

      Body.MountPriceLabel(G002Price.GetG002PriceLabelXValue, G002Price.GetG002PriceLabelYValue, 'Pr. Varejo');
      Body.MountPriceValue(G002Price.GetG002PriceValueXValue, G002Price.GetG002PriceValueYValue, Produto.vlPreco);

      Footer.Mount(FrmPrincipalPreVenda.SgDados.Cells[2, Line]);

    finally

      FreeAndNil(Produto);

      Header.Free;
      Body.Free;
      Footer.Free;

      G002Description.Free;
      G002Unit.Free;
      G002Price.Free;

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
