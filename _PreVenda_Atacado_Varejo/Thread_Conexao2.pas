unit Thread_Conexao2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, Db, Mask, Grids, Buttons, Menus, ADODB, Variants,IniFiles,
  xmldom, XMLIntf, msxmldom, XMLDoc, RLReport, Wininet, Thread_Conexao3;

type
  TConexao2 = class(TThread)
    protected
    procedure Execute;override;
end;

implementation

uses FrmPrincipal, uFuncoesPadrao, MoPreVenda;



{ TConexao }

//function pubNomeComputador : string;
//const
//   MAX_COMPUTER_LENGTH = 30;
//var
//   pNome : PChar;
//   len : DWord;
//begin
//   try
//      len := MAX_COMPUTER_LENGTH + 1;
//      GetMem(pNome, len);
//      if GetComputerName(pNome, len) then
//         Result := pNome
//      else
//         Result := 'Não foi possível obter o nome deste computador!';
//   finally
//      FreeMem(pNome, len);
//   end;
//end;

procedure TConexao2.Execute;
var
  Flags     : DWORD;
  Conectado : Boolean;
  nomePC: String;
  ThreadConexao3 : TConexao3;
begin
  inherited;
  Sleep(800);
  Conectado:=False;
  InternetGetConnectedState(@flags, 0);
  if InternetCheckConnection('http://www.google.com', 1, 0) then begin
     Conectado:=True;
  end
  else begin
    if InternetCheckConnection('http://www.infonet.com.br', 1, 0) then begin
      Conectado:=True;
    end
    else begin
      if InternetCheckConnection('http://www.youtube.com', 1, 0) then begin
        Conectado:=True;
      end
      else begin
        Conectado:=False;
      end;
    end;
  end;
  if Conectado = True then begin
//    FormPrincipal.StbPrincipal.Panels[3].Text := 'Internet: Conectada';
    vInternet := True;
  end
  else begin
//    FormPrincipal.StbPrincipal.Panels[3].Text := 'Internet: Desconectada';
    vInternet := False;
  end;
  if vInternet = True then begin
    nomePC := pubNomeComputador;
    if ((nomePC <> 'DESENV01') and (nomePC <> 'DESENV02') and (nomePC <> 'DESENV03') and (nomePC <> 'NOTEANDRE') and (nomePC <> 'ADM01') and (nomePC <> 'DESENV04') and (nomePC <> 'DESENV05')) then begin // and (nomePC <> 'DESENV04')
      ThreadConexao3 := Tconexao3.Create(true);
      //ThreadConexao.FreeOnTerminate := true;
      ThreadConexao3.Resume;
    end;
  end;
end;

end. 
