unit Thread_Comando_Sql;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, Db, Mask, Grids, Buttons, Menus, ADODB, Variants,IniFiles,
  xmldom, XMLIntf, msxmldom, XMLDoc, RLReport, Wininet;

type
  TComando_SQL = class(TThread)
    protected
    procedure Execute;override;
    public
      ComandoSQL,Tela : string;
      function copy_campo(texto:string; caracter_delimitador:string; coluna:Integer):string;
      function ExecutarSQL(var Comando : String;var Tela : string) : string;
end;

implementation

uses DataModulo, Inf_Cliente;



{ TConexao }

function TComando_SQL.ExecutarSQL(var Comando: String;var Tela : string) : string;
var
  ADOQryAux : TADOQuery;
  i         : integer;
  resultado : string;
begin
  ADOQryAux := TADOQuery.Create(nil);
  ADOQryAux.Connection := DModulo.Conexao;
  ADOQryAux.SQL.Text := Comando;
  ADOQryAux.Open;
  for i:=0 to ADOQryAux.FieldCount -1 do begin
    resultado := resultado + ADOQryAux.Fields.Fields[i].AsString + '|';
  end;
  Result := resultado;
  FreeAndNil(ADOQryAux);
end;

procedure TComando_SQL.Execute;
begin
  inherited;
  FrmInf_Cliente.Thread_End := False;
  if Tela = 'FrmInf_Cliente' then begin
    FrmInf_Cliente.LblTelefone.Caption := copy_campo(ExecutarSQL(ComandoSQL,Tela),'|',1);
    FrmInf_Cliente.LblTelefone.Refresh;
    FrmInf_Cliente.Thread_End := True;
    //Synchronize;
  end;
end;

function TComando_SQL.copy_campo(texto:string; caracter_delimitador:string; coluna:Integer):string;
var
  i, posicao_final, tamanho_texto : integer;
begin
  if (coluna <= 0)or(Length(caracter_delimitador)>1) then
  begin
    Result:='';
    Exit;
  end;
  i:= 1;
  while i <= coluna do
  begin
    posicao_final:= pos(caracter_delimitador,texto);
    if (posicao_final = 0) then // se á coluna desejada for a última, ela não vai ter o caracter delimitador no final
       posicao_final:= Length(texto)+1;
    if (i = coluna) then
    begin
//      if () then

      texto:= Trim(Copy(texto,1,posicao_final-1));
    end
    else
    begin
      tamanho_texto:= Length(texto);
      texto:= Copy(texto,posicao_final+1, tamanho_texto);
    end;
    Inc(i);
  end;
  Result:= texto;
end;

end.
