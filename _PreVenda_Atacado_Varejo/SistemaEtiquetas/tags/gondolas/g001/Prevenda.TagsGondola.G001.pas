unit Prevenda.TagsGondola.G001;

interface

uses
  System.SysUtils,
  ShellApi,

  Vcl.Dialogs,

  Produto,
  NEGProduto,

  Prevenda.Entities.ProductOnPriting;

type
  TGondola001 = class
    private
    public
      procedure PrintTagGondolaG001(RequiredProductsToPrint: TRequiredProductsToPrint; NumberOfLinesOnGrid: integer);
  end;

implementation

{ TGondola001 }

uses
  MoPreVenda;

procedure TGondola001.PrintTagGondolaG001(RequiredProductsToPrint: TRequiredProductsToPrint; NumberOfLinesOnGrid: integer);

var
  MainPrevenda: TFrmPrincipalPreVenda;

  LogicalTagFile: TextFile;
  I: integer;

  Produto: TDomProduto;

begin
  assignfile(LogicalTagFile, GetCurrentDir+ '\myetiqueta.txt');
  rewrite(LogicalTagFile);

  if not FileExists('Print2.bat') then
    ShowMessage('Não foi encontrado o arquivo Print2.bat');

  for I := 1 to NumberOfLinesOnGrid - 1 do begin
    Produto := TNEGProduto.buscarProduto(StrToInt(RequiredProductsToPrint[I].code));

    try

      writeln(LogicalTagFile, 'I8,1,001');
      writeln(LogicalTagFile, '');
      writeln(LogicalTagFile, 'Q240,12');
      writeln(LogicalTagFile, 'q832');
      writeln(LogicalTagFile, '');
      writeln(LogicalTagFile, 'D11');
      writeln(LogicalTagFile, '');
      writeln(LogicalTagFile, 'O');
      writeln(LogicalTagFile, '');
      writeln(LogicalTagFile, 'JF');
      writeln(LogicalTagFile, '');
      writeln(LogicalTagFile, 'WN');
      writeln(LogicalTagFile, '');
      writeln(LogicalTagFile, 'ZB');
      writeln(LogicalTagFile, '');
      writeln(LogicalTagFile, 'N');
      writeln(LogicalTagFile, '');
      writeln(LogicalTagFile, 'A16,24,0,4,1,2,N,"' +Produto.descricao+ '"');
      writeln(LogicalTagFile, '');
      writeln(LogicalTagFile, 'A16,76,0,4,1,2,N,"' +Produto.unidade.unidade+ '"');
      writeln(LogicalTagFile, '');
      writeln(LogicalTagFile, 'B24,130,0,1,3,6,48,N,"'+Produto.codigoBarras+'"');
      writeln(LogicalTagFile, 'A120,184,0,1,1,2,N,"'+Produto.codigoBarras+'"');
      writeln(LogicalTagFile, '');
      writeln(LogicalTagFile, 'A450,144,0,1,2,3,N,"R$"');
      writeln(LogicalTagFile, 'A498,96,0,3,2,5,N,"' +FormatFloat('0.00', Produto.vlPreco)+ '"');
      writeln(LogicalTagFile, '');
      writeln(LogicalTagFile, 'P' +FormatFloat('0', StrToFloat(RequiredProductsToPrint[I].quantity)));

    finally
      FreeAndNil(Produto);
    end;

  end;

  close(LogicalTagFile);

  ShellExecute(0, 'open', PChar(GetCurrentDir+ '\print2.bat'), '', PChar(GetCurrentDir), 1);

  FrmPrincipalPreVenda.Limpar_Tela;

  FrmPrincipalPreVenda.RgOpcoes.ItemIndex := 0;

  MessageDlg('Impressão ok no método separado!', mtInformation, [mbOK], 0);

end;

end.
