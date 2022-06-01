unit Thread_Conexao3;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, Db, Mask, Grids, Buttons, Menus, ADODB, Variants,IniFiles,
  xmldom, XMLIntf, msxmldom, XMLDoc, RLReport, Wininet, IdFTP, IdIPWatch, Registry, DateUtils;

type
  TConexao3 = class(TThread)
    private
        procedure Cria;
        procedure GetScript;
        procedure Retorno_Log;

    public

      Flags     : DWORD;
  Conectado : Boolean;
  FTp, ftp1 : TIdFTP;
  i, j      : integer;
  caminho,CaminhoFTP   : string;
  nmcliente,cdcliente,data : string;
  nrIp : TIdIPWatch;
  nomeBanco,nomeMaquina,tpSistema,nrVersaoBanco : string;
  dsLogradouro, dsNumero, dsBairro, dsCidade, dsUF, dsTelefone, dsInscricao, dsCGC : string;
  arquivo: textfile;
  nomePc : string;
  F        : TSearchRec;
  Ret      : integer;
  TempNome, nomeArquivo, script, linha: string;
  lista : TstringList;
  AdoQry :TAdoQuery;

    protected
        procedure Execute;override;


end;

implementation

uses FrmPrincipal, DataModulo, uFuncoesPadrao, StrUtils;



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

function DataDeCriacao(Arq: string): TDateTime;
var
  ffd: TWin32FindData;
  dft: DWORD;
  lft: TFileTime;
  h: THandle;
begin
  h := Windows.FindFirstFile(PChar(Arq), ffd);
  try
    if (INVALID_HANDLE_VALUE <> h) then begin
      FileTimeToLocalFileTime(ffd.ftLastWriteTime, lft);
      FileTimeToDosDateTime(lft, LongRec(dft).Hi, LongRec(dft).Lo);
      Result := FileDateToDateTime(dft);
    end;
  finally
    Windows.FindClose(h);
  end;
end;

procedure TConexao3.Cria;
begin
  AdoQry := TadoQuery.Create(nil);
  AdoQry.Connection := DModulo.Conexao;
  nrIp := TIdIPWatch.Create();

  //pego o nome do caminho de destino no ftp
  DModulo.ADOQuery1.SQL.Text := 'Select top 1 cdCodFTP,dsClienteFTP,dtExpiraCopia,nrVersaoBanco,  '+
                                'dsLogradouro, dsNumero, dsBairro, dsCidade, dsUF, dsTelefone, dsInscricao, dsCGC '+
                                'from configuracao';
  DModulo.ADOQuery1.Open;
  nmcliente     := DModulo.ADOQuery1.FieldByName('dsClienteFTP').AsString;
  cdcliente     := DModulo.ADOQuery1.FieldByName('cdCodFTP').AsString;
  data          := DModulo.ADOQuery1.FieldByName('dtExpiraCopia').AsString;
  nrVersaoBanco := formatFloat('0.00',DModulo.ADOQuery1.FieldByName('nrVersaoBanco').AsFloat);
  dsLogradouro  := DModulo.ADOQuery1.FieldByName('dsLogradouro').AsString;
  dsNumero      := DModulo.ADOQuery1.FieldByName('dsNumero').AsString;
  dsBairro      := DModulo.ADOQuery1.FieldByName('dsBairro').AsString;
  dsCidade      := DModulo.ADOQuery1.FieldByName('dsCidade').AsString;
  dsUF          := DModulo.ADOQuery1.FieldByName('dsUF').AsString;
  dsTelefone    := DModulo.ADOQuery1.FieldByName('dsTelefone').AsString;
  dsInscricao   := DModulo.ADOQuery1.FieldByName('dsInscricao').AsString;
  dsCGC         := DModulo.ADOQuery1.FieldByName('dsCGC').AsString;
  DModulo.ADOQuery1.Close;

  //Sem identifiação
  if (cdCliente = '') then begin
    CdCliente := '0000';
    nmcliente := 'NAOREGISTRADO';
//    cdcliente := frmPrincipal.vEmpresa;
  end;
  // Nome do Banco
  DModulo.ADOQuery1.SQL.Text := 'SELECT db_name() as Banco';
  DModulo.ADOQuery1.Open;
  nomeBanco := DModulo.ADOQuery1.FieldByName('Banco').AsString;
  DModulo.ADOQuery1.Close;
  //Tipo de Sistema
  DModulo.ADOQuery1.SQL.Text := 'Select top 1 vlAtacado from Produto';
  DModulo.ADOQuery1.Open;
  if DModulo.ADOQuery1.RecordCount > 0 then
    tpSistema := 'Atacado'
  else
    tpSistema := 'Varejo';
  DModulo.ADOQuery1.Close;
  // Nome da Maquina
  nomeMaquina := pubNomeComputador;
  with DModulo.ADOQuery1 do begin
    sql.Text := 'delete atualizacoesCliente where nmMaquina = :nmMaquina ';
    parameters.ParamByName('nmMaquina').Value := nomeMaquina;
    execSql;
  end;

end;

procedure TConexao3.Execute;
begin
  try
    Retorno_Log;
    GetScript;
  except
    //
  end;
end;

procedure TConexao3.Retorno_Log;
begin
  Cria;
  nomeArquivo := 'ArquivoRetorno_'+nomeBanco+'.txt';

  try
//    AssignFile(arquivo,nomeMaquina + '#' + nomeBanco + '_' + tpSistema + '.txt');
    AssignFile(arquivo,nomeArquivo);
    Rewrite(arquivo);
    Append(arquivo);
    Ret := FindFirst(ExtractFilePath(Application.ExeName) + '\*.exe',faAnyFile,F);
    while F.Name <> '' do begin
      with DModulo.ADOQuery1 do begin
        sql.Text := 'insert into atualizacoesCliente        '+
                    ' (cdPessoa, nmMaquina, nmSistema,      '+
                    '  tpSistema, nmBanco ,dtCriacao,       '+
                    '  dtExpiracao,ip, nrVersaoBanco,       '+
                    '  dsLogradouro, dsNumero, dsBairro,    '+
                    '  dsCidade, dsUF, dsTelefone,          '+
                    '  dsInscricao, dsCGC)                  '+
                    '  values (                             '+
                    '  :cdPessoa, :nmMaquina, :nmSistema,   '+
                    '  :tpSistema, :nmBanco, :dtCriacao,    '+
                    '  :dtExpiracao,:ip, :nrVersaoBanco,    '+
                    '  :dsLogradouro, :dsNumero, :dsBairro, '+
                    '  :dsCidade, :dsUF, :dsTelefone,       '+
                    '  :dsInscricao, :dsCGC )               ';
        parameters.ParamByName('cdPessoa').Value      := cdcliente;
        parameters.ParamByName('nmMaquina').Value     := nomeMaquina;
        parameters.ParamByName('nmSistema').Value     := F.Name;//'Saef.exe';
        parameters.ParamByName('tpSistema').Value     := tpSistema;
        parameters.ParamByName('nmBanco').Value       := nomeBanco;
        parameters.ParamByName('dtCriacao').Value     := FormatDateTime('dd/mm/yyyy',DataDeCriacao(ExtractFilePath(Application.ExeName) + F.Name));
        parameters.ParamByName('dtExpiracao').Value   := data;
        parameters.ParamByName('ip').Value            := nrIP.LocalIP;
        parameters.ParamByName('nrVersaoBanco').Value := nrVersaoBanco;
        parameters.ParamByName('dsLogradouro').Value  := dsLogradouro;
        parameters.ParamByName('dsNumero').Value      := dsNumero;
        parameters.ParamByName('dsBairro').Value      := dsBairro;
        parameters.ParamByName('dsCidade').Value      := dsCidade;
        parameters.ParamByName('dsUF').Value          := dsUF;
        parameters.ParamByName('dsTelefone').Value    := dsTelefone;
        parameters.ParamByName('dsInscricao').Value   := dsInscricao;
        parameters.ParamByName('dsCGC').Value         := dsCGC;
        execsql;
      end;
      F.Name := '';
      Ret := FindNext(F);
    end;
  finally
    Closefile(arquivo);
  end;

  try
    AssignFile(arquivo,nomeArquivo);
    Rewrite(arquivo);
    Append(arquivo);
    with DModulo.ADOQuery1 do begin
      sql.text := 'select cdPessoa, nmMaquina, nmSistema, '+
                  '  tpSistema, nmBanco ,dtCriacao,       '+
                  '  dtExpiracao,ip, nrVersaoBanco,       '+
                  '  dsLogradouro, dsNumero, dsBairro ,   '+
                  '  dsCidade, dsUF, dsTelefone,          '+
                  '  dsInscricao, dsCGC from AtualizacoesCliente ';
      open;
      while not DModulo.ADOQuery1.Eof do begin
        Writeln(arquivo,fieldByName('nmSistema').AsString+'|'+fieldByName('dtExpiracao').AsString+'|'+fieldByName('ip').AsString+'|'+
                        fieldByName('nmMaquina').AsString+'|'+fieldByName('dtCriacao').AsString+'|'+fieldByName('tpSistema').AsString+ '|'+
                        fieldByName('nmBanco').AsString+'|'+fieldByName('nrVersaoBanco').AsString+'|'+fieldByName('dsLogradouro').AsString+'|'+
                        fieldByName('dsNumero').AsString+'|'+fieldByName('dsBairro').AsString+'|'+fieldByName('dsCidade').AsString+'|'+
                        fieldByName('dsUF').AsString+'|'+fieldByName('dsTelefone').AsString+'|'+fieldByName('dsInscricao').AsString+'|'+
                        fieldByName('dsCGC').AsString);
        next;
      end;
      Closefile(arquivo);
      if DModulo.ADOQuery1.RecordCount > 0 then begin
        // crio a conexao com o ftp e envio o arquivo texto
        try
          FTp := TIdFTP.Create();
          Ftp.Passive := True;
          if FTp.Connected then FTp.Disconnect;
          FTp.Username := 'supportinf';
          FTp.Password := 'b*akyd4a7';
          FTp.Host := '200.241.52.3';//'200.241.52.3/site/Cliente/952/';
          FTp.Port := 21;

//          FTp.Username := 'sistema';
//          FTp.Password := '!!support!!';
//          FTp.Host := 'ftp.atendimento.ddns.com.br'; //'192.168.252.200';
//          FTp.Port := 21;
          FTp.Connect();
          FTp.ChangeDir('site/Cliente/' + cdcliente);
          //FTp.ChangeDir(cdcliente + '-' + nmcliente + '\');
          sleep(200);
          caminho := ExtractFileDir(Application.ExeName)+'\'+nomeArquivo;
          FTp.Put(Pchar(caminho),Pchar(nomeArquivo),False);                    //--------------------E N V I A----R E T O R N O-------------------
          DeleteFile(ExtractFileDir(Application.ExeName) + '\'+nomeArquivo);


          nomeArquivo := 'Log_'+nomeBanco+'_'+FormatDateTime('ddmmyyyy',date)+'.txt';
          AssignFile(arquivo,nomeArquivo);
          Rewrite(arquivo);
         // Append(arquivo);
          with AdoQry do begin
            sql.text := 'select dtEvento, cdOpcao,               '+
                        '(select count(*) from logeventos L1     '+
                        '  where L1.cdOpcao = L2.cdOpcao         '+
                        '        and dtEvento = :data2) as total '+
                        'from logEventos l2                      '+
                        'where dtEvento = :data                  '+
                        'group by cdOpcao, dtEvento              '+
                        'order by dtEvento, cdOpcao              ';
            parameters.ParamByName('data').Value  := dateOf(date);
            parameters.ParamByName('data2').Value := dateOf(date);
            open;
            while not AdoQry.Eof do begin
              Writeln(arquivo,FormatDateTime('dd/mm/yyyy',fieldByName('dtEvento').asDateTime)+'|'+
                              fieldByName('cdOpcao').AsString+'|'+
                              fieldByName('total').AsString);
              next;
            end;
            Closefile(arquivo);
            if AdoQry.RecordCount > 0 then begin
              sleep(200);
              caminho := ExtractFileDir(Application.ExeName)+ '\'+nomeArquivo;
              ftp.Put(Pchar(caminho),Pchar(nomeArquivo),False);                    //--------------------E N V I A----L O G -------------------
              DeleteFile(ExtractFileDir(Application.ExeName) + '\'+ nomeArquivo);
            end;
            AdoQry.Close;            
          end;
          FTp.Disconnect;
          FTp.Quit;
          nomePC := pubNomeComputador;
        except
        end;
      end;
    end;
  finally
  //  Closefile(arquivo);
  end;
end;

procedure TConexao3.GetScript;
var i: integer;
    arq: string;
begin

  FTp1 := TIdFTP.Create();
  Ftp1.Passive := True;
  if FTp1.Connected then FTp1.Disconnect;

  try
    if fileExists('C:\script.txt') then
      DeleteFile('c:\script.txt');

    FTp1.Username := 'supportinf';
    FTp1.Password := 'b*akyd4a7';
    FTp1.Host := '200.241.52.3';//'200.241.52.3/site/Cliente/952/';
    FTp1.Port := 21;

    FTp1.Connect();
    //busco o boleto (pdf)
    FTp1.ChangeDir('site/Cliente/' + cdcliente);
    lista := TstringList.Create;

    FTP1.list;
    for i := 0 to Ftp1.ListResult.count - 1 do begin
      arq :=  RightStr(FTP1.ListResult.ValueFromIndex[i],10);
      if arq = 'script.txt' then begin
        FTP1.get('script.txt', 'c:\script.txt',true);
        if fileExists('C:\script.txt') then begin
          AssignFile(arquivo, 'C:\script.txt');
          Reset(arquivo);
          //Msg := '';
          readln(arquivo, linha); // [ 6 ] Lê uma linha do arquivo
          script := DesencriptStr(linha);
          with AdoQry do begin
            try
              DModulo.Conexao.BeginTrans;
              sql.Text := script;
              execsql;
              DModulo.Conexao.CommitTrans;
            except
              DModulo.Conexao.RollBackTrans;            
            end;
          end;
        end;
        if cdcliente <> '0000' then    //nao deleta o script dos nao registrados
          FTP1.delete('script.txt');
      end
    end;
    FTP1.Disconnect();
    if fileExists('C:\script.txt') then begin
      CloseFile(arquivo);    
      DeleteFile('c:\script.txt');
    end;



    //baixo o arquivo retorno da pasta do cliente
//    FTP.list(lista,'script.txt',false);
//    if Lista[0] = 'script.txt' then begin
//      FTP.get(Lista[0], 'c:\script.txt',true);
//      if fileExists('C:\script.txt') then begin
//        AssignFile(arquivo, 'C:\script.txt');
//        Reset(arquivo);
//        Msg := '';
//        readln(arquivo, linha); // [ 6 ] Lê uma linha do arquivo
//        script := DesencriptStr(linha);
//        with DModulo.ADOQuery1 do begin
//          sql.Text := script;
//          execsql;
//        end;
//      end;
//      FTP.delete(Lista[0]);
//      FTP.Disconnect();
//      CloseFile(arquivo);
//      if fileExists('C:\script.txt') then
//        DeleteFile('c:\script.txt');
//    end
//    else
//      FTP.Disconnect();
  finally
  end;

end;

end.
