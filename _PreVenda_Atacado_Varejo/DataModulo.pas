unit DataModulo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db, ADODB, Vcl.ExtCtrls, System.generics.Collections;

type
  TADOMinhasConnections = class(TThreadList<TADOConnection>)
  public
    function Accquire(AConnectionString : string) : TADOConnection;
    procedure Destruir(var AConnection : TADOConnection);
  end;

type
  TDModulo = class(TDataModule)
    Conexao: TADOConnection;
    ADOQuery1: TADOQuery;
    ADOCommand1: TADOCommand;
    ADODeposito: TADOConnection;
    ConexaoThread: TADOConnection;
    adoThread: TADOQuery;
    tmrAtualizacao: TTimer;
    ConexaoWEB: TADOConnection;
    AdoDeposito2: TADOConnection;
    procedure tmrAtualizacaoTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DModulo: TDModulo;
  ADOconnectionManager : TADOMinhasConnections;

implementation

{$R *.DFM}

uses Thread_Atualizacao;

procedure TDModulo.tmrAtualizacaoTimer(Sender: TObject);
var
  ThrdAtualizacao : TAtualizacao;
begin
  ThrdAtualizacao := TAtualizacao.Create(True);
  ThrdAtualizacao.Resume;
end;

{ TADOMinhasConnections }

function TADOMinhasConnections.Accquire(
  AConnectionString: string): TADOConnection;
begin
//
end;

procedure TADOMinhasConnections.Destruir(var AConnection: TADOConnection);
begin
  //
end;

end.
