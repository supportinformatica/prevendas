unit Prevenda.TagsGondola.G001;

interface

uses
  System.SysUtils,
  ShellApi,

  Vcl.Dialogs,

  Produto,
  NEGProduto,

  Prevenda.Entities.ProductOnPriting,
  Prevenda.Constants.App,
  Prevenda.Utils.ExecutePrint,
  Prevenda.Utils.TagFileWriter,
  Prevenda.Utils.FirstImpression,
  Prevenda.Utils.VerifyTagList;

type
  TGondola001 = class
    private
      ExecutePrint: TExecutePrint;
      TagFileWriter: TTagFileWriter;

    public
      procedure PrintTagGondolaG001(RequiredProductsToPrint: TRequiredProductsToPrint; NumberOfLinesOnGrid: integer);
  end;

implementation

{ TGondola001 }

uses
  MoPreVenda;

procedure TGondola001.PrintTagGondolaG001(RequiredProductsToPrint: TRequiredProductsToPrint; NumberOfLinesOnGrid: integer);

var
  I: integer;

  Produto: TDomProduto;

  MainGrid: TVerifyTagList;

begin
  MainGrid := TVerifyTagList.Create;

  try

    MainGrid.VerifyTagList();

  finally

    MainGrid.Free;

  end;



  for I := 1 to NumberOfLinesOnGrid - 1 do begin
    Produto := TNEGProduto.buscarProduto(StrToInt(RequiredProductsToPrint[I].code));

    TagFileWriter := TTagFileWriter.Create;

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

        TagFileWriter.WriteOnTagFile('A16,24,0,4,1,2,N,"' +Produto.descricao+ '"');
        TagFileWriter.WriteOnTagFile('');

        TagFileWriter.WriteOnTagFile('A16,76,0,4,1,2,N,"' +Produto.unidade.unidade+ '"');
        TagFileWriter.WriteOnTagFile('');

        TagFileWriter.WriteOnTagFile('B24,130,0,1,3,6,48,N,"'+Produto.codigoBarras+'"');
        TagFileWriter.WriteOnTagFile('A120,184,0,1,1,2,N,"'+Produto.codigoBarras+'"');
        TagFileWriter.WriteOnTagFile('');

        TagFileWriter.WriteOnTagFile('A450,144,0,1,2,3,N,"R$"');
        TagFileWriter.WriteOnTagFile('A498,96,0,3,2,5,N,"' +FormatFloat('0.00', Produto.vlPreco)+ '"');
        TagFileWriter.WriteOnTagFile('');

        TagFileWriter.WriteOnTagFile('P' +FormatFloat('0', StrToFloat(RequiredProductsToPrint[I].quantity)));

      finally
        FreeAndNil(Produto);
        TagFileWriter.Free;
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
