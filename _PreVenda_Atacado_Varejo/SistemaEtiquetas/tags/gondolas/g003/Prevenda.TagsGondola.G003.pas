unit Prevenda.TagsGondola.G003;

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

  Prevenda.Helpers.CalculateGondolaG003DescriptionAxis,
  Prevenda.Helpers.CalculateGondolaG003UnityAxis,
  Prevenda.Helpers.CalculateGondolaG003PriceVarejoAxis,
  Prevenda.Helpers.CalculateGondolaG003PriceAtacadoAxis;


type
  TGondola003 = class
    private
      ExecutePrint: TExecutePrint;
      TagFileWriter: TTagFileWriter;

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

    TagFileWriter := TTagFileWriter.Create;

    G003Description := TGondolaG003DescriptionCalcs.Create;
    G003Unit := TGondolaG003UnityCalcs.Create;
    G003PriceVarejo := TGondolaG003PriceVarejoCalcs.Create;
    G003PriceAtacado := TGondolaG003PriceAtacadoCalcs.Create;

      try
        TagFileWriter.WriteOnTagFile('I8,1,001');
        TagFileWriter.WriteOnTagFile('');

        TagFileWriter.WriteOnTagFile('Q240,25');
        TagFileWriter.WriteOnTagFile('q832');
        TagFileWriter.WriteOnTagFile('');

        TagFileWriter.WriteOnTagFile('D13');
        TagFileWriter.WriteOnTagFile('');

        TagFileWriter.WriteOnTagFile('O');
        TagFileWriter.WriteOnTagFile('');

        TagFileWriter.WriteOnTagFile('JF');
        TagFileWriter.WriteOnTagFile('');

        TagFileWriter.WriteOnTagFile('WN');
        TagFileWriter.WriteOnTagFile('');

        TagFileWriter.WriteOnTagFile('ZB');
        TagFileWriter.WriteOnTagFile('');

        TagFileWriter.WriteOnTagFile('N');
        TagFileWriter.WriteOnTagFile('');

        TagFileWriter.WriteOnTagFile('A'+G003Description.GetG003DescriptionXValue+','+G003Description.GetG003DescriptionYValue+',0,4,1,2,N,"' +Produto.descricao+ '"');
        TagFileWriter.WriteOnTagFile('');

        TagFileWriter.WriteOnTagFile('A'+G003Unit.GetG003UnityXValue+','+G003Unit.GetG003UnityYValue+',0,4,1,2,N,"' +Produto.unidade.unidade+ '"');
        TagFileWriter.WriteOnTagFile('');

        TagFileWriter.WriteOnTagFile('A'+G003PriceVarejo.GetG003PriceLabelXValue+','+G003PriceVarejo.GetG003PriceLabelYValue+',0,3,1,1,N,"Pr. Varejo"');
        TagFileWriter.WriteOnTagFile('A'+G003PriceVarejo.GetG003PriceValueXValue+','+G003PriceVarejo.GetG003PriceValueYValue+',0,3,2,4,N,"R$ ' +FormatFloat('0.00', Produto.vlPreco)+ '"');
        TagFileWriter.WriteOnTagFile('');

        TagFileWriter.WriteOnTagFile('A'+G003PriceAtacado.GetG003PriceLabelXValue+','+G003PriceAtacado.GetG003PriceLabelYValue+',0,3,1,1,N,"Pr. Varejo"');
        TagFileWriter.WriteOnTagFile('A'+G003PriceAtacado.GetG003PriceValueXValue+','+G003PriceAtacado.GetG003PriceValueYValue+',0,3,2,4,N,"R$ ' +FormatFloat('0.00', Produto.vlPreco)+ '"');
        TagFileWriter.WriteOnTagFile('');

        TagFileWriter.WriteOnTagFile('P' +FormatFloat('0', StrToFloat(FrmPrincipalPreVenda.SgDados.Cells[2, Line])));

      finally

        FreeAndNil(Produto);
        TagFileWriter.Free;

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
