unit Prevenda.TagsGondola.G001;

interface

uses
  System.SysUtils,

  System.IniFiles,

  ShellApi,

  Vcl.Dialogs,

  Produto,
  NEGProduto,

  Prevenda.Entities.ProductOnPriting,

  Prevenda.Constants.App,

  Prevenda.Utils.ExecutePrint,
  Prevenda.Utils.TagFileWriter,
  Prevenda.Utils.ConfigurationFileReader,
  Prevenda.Utils.FirstImpression,
  Prevenda.Utils.VerifyTagList,

  Prevenda.Helpers.CalculateGondolaG001Axis;

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

  G001Calcs: TGondolaG001Calcs;

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

    G001Calcs := TGondolaG001Calcs.Create;

      try
        TagFileWriter.WriteOnTagFile('I8,1,001');
        TagFileWriter.WriteOnTagFile('');

        TagFileWriter.WriteOnTagFile('Q240,12');
        TagFileWriter.WriteOnTagFile('q832');
        TagFileWriter.WriteOnTagFile('');

        TagFileWriter.WriteOnTagFile('D11');
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

        TagFileWriter.WriteOnTagFile('A'+G001Calcs.GetG001DescriptionXValue+','+G001Calcs.GetG001DescriptionYValue+',0,4,1,2,N,"' +Produto.descricao+ '"');
        TagFileWriter.WriteOnTagFile('');

        TagFileWriter.WriteOnTagFile('A'+G001Calcs.GetG001UnityXValue+','+G001Calcs.GetG001UnityYValue+',0,4,1,2,N,"' +Produto.unidade.unidade+ '"');
        TagFileWriter.WriteOnTagFile('');

        TagFileWriter.WriteOnTagFile('B'+G001Calcs.GetG001BarcodeSymbolXValue+','+G001Calcs.GetG001BarcodeSymbolYValue+',0,1,3,6,48,N,"'+Produto.codigoBarras+'"');
        TagFileWriter.WriteOnTagFile('A'+G001Calcs.GetG001BarcodeValueXValue+','+G001Calcs.GetG001BarcodeValueYValue+',0,1,1,2,N,"'+Produto.codigoBarras+'"');
        TagFileWriter.WriteOnTagFile('');

        TagFileWriter.WriteOnTagFile('A'+G001Calcs.GetG001PriceSymbolXValue+','+G001Calcs.GetG001PriceSymbolYValue+',0,1,2,3,N,"R$"');
        TagFileWriter.WriteOnTagFile('A'+G001Calcs.GetG001PriceValueXValue+','+G001Calcs.GetG001PriceValueYValue+',0,3,2,5,N,"' +FormatFloat('0.00', Produto.vlPreco)+ '"');
        TagFileWriter.WriteOnTagFile('');

        TagFileWriter.WriteOnTagFile('P' +FormatFloat('0', StrToFloat(FrmPrincipalPreVenda.SgDados.Cells[2, Line])));

      finally

        FreeAndNil(Produto);
        TagFileWriter.Free;
        G001Calcs.Free;

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
