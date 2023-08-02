unit Prevenda.TagsGondola.G002;

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

  Prevenda.Helpers.CalculateGondolaG002DescriptionAxis,
  Prevenda.Helpers.CalculateGondolaG002UnityAxis,
  Prevenda.Helpers.CalculateGondolaG002PriceAxis;

type
  TGondola002 = class
    private
      ExecutePrint: TExecutePrint;
      TagFileWriter: TTagFileWriter;

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

    TagFileWriter := TTagFileWriter.Create;

    G002Description := TGondolaG002DescriptionCalcs.Create;
    G002Unit := TGondolaG002UnityCalcs.Create;
    G002Price := TGondolaG002PriceCalcs.Create;

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

        TagFileWriter.WriteOnTagFile('A'+G002Description.GetG002DescriptionXValue+','+G002Description.GetG002DescriptionYValue+',0,4,1,2,N,"' +Produto.descricao+ '"');
        TagFileWriter.WriteOnTagFile('');

        TagFileWriter.WriteOnTagFile('A'+G002Unit.GetG002UnityXValue+','+G002Unit.GetG002UnityYValue+',0,4,1,2,N,"' +Produto.unidade.unidade+ '"');
        TagFileWriter.WriteOnTagFile('');

        TagFileWriter.WriteOnTagFile('A'+G002Price.GetG002PriceLabelXValue+','+G002Price.GetG002PriceLabelYValue+',0,3,1,1,N,"Pr. Varejo"');
        TagFileWriter.WriteOnTagFile('A'+G002Price.GetG002PriceValueXValue+','+G002Price.GetG002PriceValueYValue+',0,3,2,4,N,"R$ ' +FormatFloat('0.00', Produto.vlPreco)+ '"');
        TagFileWriter.WriteOnTagFile('');

        TagFileWriter.WriteOnTagFile('P' +FormatFloat('0', StrToFloat(FrmPrincipalPreVenda.SgDados.Cells[2, Line])));

      finally

        FreeAndNil(Produto);
        TagFileWriter.Free;

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
