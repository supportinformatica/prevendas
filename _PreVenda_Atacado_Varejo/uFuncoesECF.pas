unit uFuncoesECF;

interface

uses
  Windows, Messages, SysUtils, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Registry, ComCtrls, System.Variants,
  FrmPrincipal, DBIPROCS, DBITypes, DBIErrs, ADODB, TypInfo, System.Math,
  System.Generics.Collections, Shellapi, FileCtrl, classes, NEGBalanca;

  // declaração DLL NFC-e BEMATECH
//  function IniciaPorta( Porta: AnsiString ): integer; stdcall; far; external 'MP2032.DLL';
//  function FechaPorta: integer; stdcall; far; external 'MP2032.DLL';
//  function ConfiguraModeloImpressora( ModeloImpressora: integer ): integer; stdcall; far; external 'MP2032.DLL';
//  function AcionaGuilhotina( Modo: integer ): integer; stdcall; far; external 'MP2032.DLL';
//  function FormataTX (BufTras: AnsiString; TpoLtra: integer; Italic: integer; Sublin: integer; expand: integer; enfat: integer ): integer; stdcall; far; external 'MP2032.DLL';
//  function ComandoTX( BufTrans: AnsiString; TamBufTrans: integer ): integer; stdcall; far; external 'MP2032.DLL';
//  function ImprimeCodigoQRCODE( errorCorrectionLevel: integer; moduleSize: integer; codeType: integer; QRCodeVersion: integer; encodingModes: integer; codeQr: AnsiString ): integer; stdcall; far; external 'MP2032.DLL';
//  function ConfiguraCodigoBarras( Altura: integer; Largura: integer; PosicaoCaracteres: integer; Fonte: integer; Margem: integer ): integer; stdcall; far; external 'MP2032.DLL';

  // declaração DLL ECF DARUMA

//  function rLerDecimaisStr_ECF_Daruma(pszDecimalQtde: string; pszDecimalValor: string): Integer; StdCall; External 'DarumaFramework.dll';
//  function rVerificarImpressoraLigada_ECF_Daruma(): Integer; StdCall; External 'DarumaFramework.dll';
//  function rCFVerificarStatus_ECF_Daruma(pszStatus:AnsiString; var piStatus:Integer): Integer; StdCall; External 'DarumaFrameWork.dll';
//  function iCCDAbrirSimplificado_ECF_Daruma(pszFormaPgto:AnsiString; pszParcelas:AnsiString;pszDocOrigem:AnsiString;pszValor: AnsiString): Integer; StdCall; External 'DarumaFramework.dll';
//  function iCCDImprimirTexto_ECF_Daruma(pszTexto:AnsiString): Integer; StdCall; External 'DarumaFramework.dll';
//  function iCCDFechar_ECF_Daruma(): Integer; StdCall; External 'DarumaFramework.dll';
//  function rRetornarVendaBruta_ECF_Daruma(pszRetorno:AnsiString): Integer; StdCall; External 'DarumaFramework.dll';
//  function iLeituraX_ECF_Daruma: Integer; StdCall; External 'DarumaFramework.dll';
//  function iReducaoZ_ECF_Daruma(pszData:AnsiString; pszHora:AnsiString): Integer; StdCall; External 'DarumaFramework.dll';
//  function rRetornarInformacao_ECF_Daruma(pszIndice:AnsiString;pszRetornar:AnsiString): Integer; StdCall; External 'DarumaFramework.dll';
//  function eVerificarVersaoDLL_Daruma(pszRet:AnsiString): Integer; StdCall; External 'DarumaFramework.dll';
//  function iCFEncerrarConfigMsg_ECF_Daruma(pszMensagem:AnsiString): Integer; StdCall; External 'DarumaFramework.dll';
//  function iCFTotalizarCupom_ECF_Daruma(pszTipoDescAcresc:AnsiString; pszValorDescAcresc:AnsiString): Integer; StdCall; External 'DarumaFramework.dll';
//  function iCFEfetuarPagamentoFormatado_ECF_Daruma(pszFormaPgto:AnsiString; pszValor:AnsiString): Integer; StdCall; External 'DarumaFramework.dll';
//  function iCFCancelarItem_ECF_Daruma(pszNumItem: AnsiString): Integer; StdCall; External 'DarumaFramework.dll';
//  function eAbrirGaveta_ECF_Daruma(): Integer; StdCall; External 'DarumaFramework.dll';
//  function iSangria_ECF_Daruma(pszValor:AnsiString; pszMensagem:AnsiString): Integer; StdCall; External 'DarumaFramework.dll';
//  function iSuprimento_ECF_Daruma(pszValor:AnsiString; pszMensagem:AnsiString): Integer; StdCall; External 'DarumaFramework.dll';
//  function iTEF_Fechar_ECF_Daruma(): Integer; StdCall; External 'DarumaFramework.dll';
//  function iRGImprimirTexto_ECF_Daruma(pszTexto:AnsiString): Integer; StdCall; External 'DarumaFramework.dll';
//  function iCFCancelar_ECF_Daruma: Integer; StdCall; External 'DarumaFramework.dll';
//  function iCFVenderSemDesc_ECF_Daruma(pszCargaTributaria:AnsiString; pszQuantidade:AnsiString; pszPrecoUnitario:AnsiString; pszCodigoItem:AnsiString; pszUnidadeMedida:AnsiString; pszDescricaoItem:AnsiString): Integer; StdCall; External 'DarumaFramework.dll';
//  function rLerAliquotas_ECF_Daruma(cAliquotas:AnsiString): Integer; StdCall; External 'DarumaFramework.dll';
//  function iCFAbrir_ECF_Daruma(pszCPF: AnsiString; pszNome: AnsiString; pszEndereco: AnsiString): Integer; StdCall; External 'DarumaFramework.dll';
//  function rVerificarReducaoZ_ECF_Daruma(zPendente:AnsiString): Integer; StdCall; External 'DarumaFramework.dll';
//  function regAlterarValor_Daruma(pszPathChave:AnsiString;pszValor:AnsiString):Integer; StdCall; External 'DarumaFramework.dll';
//  function rCFSubTotal_ECF_Daruma(pszValor:AnsiString):Integer; StdCall; External 'DarumaFramework.dll';
//  function iRGAbrir_ECF_Daruma(pszNomeRG:AnsiString): Integer; StdCall; External 'DarumaFramework.dll';
//  function iRGFechar_ECF_Daruma(): Integer; StdCall; External 'DarumaFramework.dll';
//  function rGerarEspelhoMFD_ECF_Daruma(pszTipo:AnsiString; pszInicial:AnsiString;pszFinal:AnsiString): Integer; StdCall; External 'DarumaFramework.dll';
//  function rGerarTDM_ECF_Daruma(szTipo:AnsiString; szInicial:AnsiString; szFinal:AnsiString): Integer; StdCall; External 'DarumaFramework.dll';
//  function rGerarMFD_ECF_Daruma(szTipo:AnsiString; szInicial:AnsiString; szFinal:AnsiString): Integer; StdCall; External 'DarumaFramework.dll';
//  function iMFLer_ECF_Daruma(pszInicial:AnsiString; pszFinal:AnsiString): Integer; StdCall; External 'DarumaFramework.dll';
//  function iMFLerSerial_ECF_Daruma(pszInicial:AnsiString; pszFinal:AnsiString): Integer; StdCall; External 'DarumaFramework.dll';
//  function eMemoriaFiscal_ECF_Daruma(pszInicial:AnsiString; pszFinal:AnsiString; pszCompleta: Boolean; pszTipo:AnsiString):Integer; StdCall; External 'DarumaFramework.dll';

  // DECLARAÇÃO EPSON
  function ConfiguraTaxaSerial(dwTaxa:Integer):Integer; StdCall; External 'InterfaceEpsonNF.dll';
  function ImprimeTextoTag(pszTexto:AnsiString):Integer; StdCall; External 'InterfaceEpsonNF.dll';

{-------------------------------------------------------------------------------------}
  function RoundBematech(valor:real; casasDecimais:integer):Currency;
  procedure abilitaDesabilitaLogECF(texto, modeloECF: string);
  procedure Salvar_ReducaoZ(vendaBruta : AnsiString; modeloECF : string; retornarMensagem : Boolean = False);
  function retornoFuncaoECF(iRetorno: Integer; modeloECF, descricaoMetodo : string; mostrarMensagem : Boolean = True): Boolean;
  function AbreGaveta(modeloECF : string) : Boolean;
  function retornarStatusTruncamentoECF(modeloECF : string) : Integer;
  function existeUmCupomAberto(modeloECF : string) : Boolean;
  // funçoes da balança
  procedure setDadosBalanca(var marcaBalanca : string; var portaBalanca : string; var velocidadePorta : string);
  procedure abrePortaBalanca(marcaBalanca, portaBalanca : string);
  procedure fechaPortaBalanca(marcaBalanca : string);
  function getPesoBalancaToledo: string;
  function getPesoBalancaFilizola: string;
  function getPesoBalancaUrano: string;
  function getPesoBalanca(marcaBalanca : string): string;

implementation

uses
  System.IniFiles, DataModulo, uFuncoesPadrao, Pedesenh, objetos,
  System.DateUtils, NEGLoja;

function existeUmCupomAberto(modeloECF : string) : Boolean;  // ok daruma
var
  flagFiscal, iRetorno : Integer;
  buffer : AnsiString;
begin
  Result := False;
{  if modeloECF = 'ECFBEMATECH' then
  begin
    flagFiscal := 0;
    iRetorno := Bematech_FI_FlagsFiscais( flagFiscal );  // função usada para ver se o cupom fiscal esta aberto ou não
    retornoFuncaoECF(iRetorno, modeloECF, 'Bematech_FI_FlagsFiscais');
    if ( flagFiscal >= 128 ) then
      flagFiscal := flagFiscal - 128;
    if ( flagFiscal >= 64 ) then
      flagFiscal := flagFiscal - 64;
    if ( flagFiscal >= 32 ) then
      flagFiscal := flagFiscal - 32;
    if ( flagFiscal >= 16 ) then
      flagFiscal := flagFiscal - 16;
    if ( flagFiscal >= 8 ) then
      flagFiscal := flagFiscal - 8;
    if ( flagFiscal >= 4 ) then
      flagFiscal := flagFiscal - 4;
    if ( flagFiscal >= 2 ) then
      flagFiscal := flagFiscal - 2;
    if flagFiscal = 0 then // qualdo este retorno for igual a zero é porq o cupom fiscal esta fechado e pode ser cancelado, quando for diferente o cupom fiscal esta aberto
      Result := False
    else
      Result := True;
  end else
  begin
    SetLength (buffer,2);
    iRetorno := rCFVerificarStatus_ECF_Daruma(buffer, flagFiscal);
    { Possíveis status do cupom fiscal
      0 = Fechado
      1 = CF em registro de item
      2 = CF em totalização
      3 = CF em pagamento
      4 = CF em finalização }
{    if flagFiscal > 4 then // fiz esse armengue porq na Hiper móveis esse método retorna um numero fora da faixa de retorno
      Result := False
    else if flagFiscal <> 0 then  // existe um cupom em aberto entao atualizo o grande total ou em finalização
      Result := True
    else
      Result := False;
  end; }
end;

function retornarStatusTruncamentoECF(modeloECF : string) : Integer;
var
  iRetorno : Integer;
  Buffer : AnsiString;
begin
  if modeloECF = 'ECFBEMATECH' then
  begin
    for iRetorno := 1 to 2 do
      Buffer := Buffer + ' ';
//    iRetorno := Bematech_FI_VerificaTruncamento( Buffer );
    if copy( Buffer,1,1 ) = '1' then
      Result := 0   // a impressora está truncando
    else
      Result := 1;  // a impressora está arredondando
  end else
  begin
    Result := 0   // a impressora está truncando (FORÇADO NA DARUMA)
  end;
end;

function abreGaveta(modeloECF : string) : Boolean;       // ok daruma
var
  iRetorno : Integer;
  s_cmdtx : string;
begin
  Result := True;
  if (modeloECF = 'ELGINI9') or (modeloECF = 'SPOOLER') then
  begin
    try
//      FrmPrincipalPreVenda.ACBrPosPrinter.AbrirGaveta;
    except
      ShowMessage('Erro ao tentar acionar a gaveta, caso não exista gaveta eletrônica no caixa, desabilite nas configurações do sistema esta funcionalidade.');
      Result := False;
    end;
  end;
end;

function retornoFuncaoECF(iRetorno: Integer; modeloECF, descricaoMetodo : string; mostrarMensagem : Boolean): Boolean;   // ok daruma
begin
  Result := True;
end;

// habilita ou desabilita o log da ECF (desabilitado e melhor porq a aplicação fica mais rápida)
procedure abilitaDesabilitaLogECF(texto, modeloECF: string);
var
  arqIni : TIniFile;
begin
  if FileExists(ExtractFileDir(Application.ExeName)+'\BemaFI32.ini') then
  begin
    SetFileAttributes(PWideChar( ExtractFileDir(Application.ExeName)+'\BemaFI32.ini' ), 0);
    arqIni := TIniFile.Create(ExtractFileDir(Application.ExeName)+'\BemaFI32.ini');
    try // verifica se usa balança e qual a porta
      ArqIni.writestring('Sistema', 'Log', texto);
      ArqIni.writestring('Sistema', 'LogDiario', texto);
    finally
      ArqIni.Free;
    end;
  end;
end;

procedure Salvar_ReducaoZ(vendaBruta : AnsiString; modeloECF : string; retornarMensagem : Boolean = False);     // ok daruma
var
  iRetorno,contador,auxiContador : integer;
  iRelatorio,iIndex,iInTotalizador,iConta,iTotal : Integer;
  COO, CRZ,CRO,DT_EMISSAO,HR_EMISSAO,ISSQN,vIndice,totalizadorGeral,cDadosReducao,cHorareducao : AnsiString;
  cAliquota: String;
  cTotalizador: String;
  cRetornotxt: TextFile;
  cLinhatxt: String;
  vet_codTotalizador : array[0..30] of string;
  vet_valorTotalizador : array[0..30] of string;
  DT_MOVIMENTO : AnsiString;
  ADOQrySalvar : TADOQuery;
begin
{  if retornarMensagem then
  begin
    FrmPedeSenha.EdtMensagem.Caption := '';
    FrmPedeSenha.EdtMensagem.Caption := 'Lendo informações da Redução Z';
    FrmPedeSenha.EdtMensagem.Refresh;
  end;
  if modeloECF = 'ECFBEMATECH' then
  begin
    DT_MOVIMENTO := Trim(DT_MOVIMENTO);
    for iRetorno := 1 to 6 do DT_EMISSAO := DT_EMISSAO + ' ';
    for iRetorno := 1 to 6 do HR_EMISSAO := HR_EMISSAO + ' ';
    iRetorno := Bematech_FI_DataHoraReducao(DT_EMISSAO,HR_EMISSAO);
    for iRetorno := 1 to 1279 do cDadosReducao := cDadosReducao + ' ';
    iRetorno := Bematech_FI_DadosUltimaReducaoMFD(cDadosReducao);
    CRZ := Copy(cDadosReducao,9,4);   // 6
    CRZ := SoNumeros( CRZ );
    CRO := Copy(cDadosReducao,4,4);   // 8
    CRO := SoNumeros( CRO );
    COO := Copy(cDadosReducao,14,6);  // 7
    COO := SoNumeros( COO );
    DT_MOVIMENTO := Copy(cDadosReducao,1273,6);  // 9
    SetLength(totalizadorGeral,19);
    iRetorno   := Bematech_FI_GrandeTotalUltimaReducaoMFD(totalizadorGeral);
    SetLength(cDadosReducao,1278);
    iRetorno := Bematech_FI_DadosUltimaReducaoMFD(cDadosReducao);
    iRelatorio := 0;
    iIndex := 1208;
    iInTotalizador := 335;
    iConta := 0;
    iTotal := 0;
    While (iRelatorio = 0) do
    begin
      cAliquota := Copy(cDadosReducao,iIndex,4);
      if(cAliquota <> '0000')then
      begin
        cTotalizador := Copy(cDadosReducao,iInTotalizador,14);
        vet_codTotalizador[contador] := formatfloat('00',iConta+1) + 'T' + cAliquota;
        vet_valorTotalizador[contador] := cTotalizador;
        inc(contador);
        iInTotalizador := iInTotalizador + 14;
      end else
      begin
        iInTotalizador := 560;
        if(iInTotalizador = 560)then
        begin
          cTotalizador := Copy(cDadosReducao,iInTotalizador,14);
          vet_codTotalizador[contador] := 'I1';
          vet_valorTotalizador[contador] := cTotalizador;
          inc(contador);
          iInTotalizador := iInTotalizador + 15;
          iRelatorio := 1;
        end;
        if(iInTotalizador = 575)then
        begin
          cTotalizador := Copy(cDadosReducao,iInTotalizador,14);
          vet_codTotalizador[contador] := 'N1';
          vet_valorTotalizador[contador] := cTotalizador;
          inc(contador);
          iInTotalizador := iInTotalizador + 15;
        end;
        if(iInTotalizador = 590)then
        begin
          cTotalizador := Copy(cDadosReducao,iInTotalizador,14);
          vet_codTotalizador[contador] := 'F1';
          vet_valorTotalizador[contador] := cTotalizador;
          inc(contador);
          iInTotalizador := iInTotalizador + 15;
        end;
        if(iInTotalizador = 605)then
        begin
          cTotalizador := Copy(cDadosReducao,iInTotalizador,14);
          vet_codTotalizador[contador] := 'IS1';
          vet_valorTotalizador[contador] := cTotalizador;
          inc(contador);
          iInTotalizador := iInTotalizador + 15;
        end;
        if(iInTotalizador = 620)then
        begin
          cTotalizador := Copy(cDadosReducao,iInTotalizador,14);
          vet_codTotalizador[contador] := 'NS1';
          vet_valorTotalizador[contador] := cTotalizador;
          inc(contador);
          iInTotalizador := iInTotalizador + 15;
        end;
        if(iInTotalizador = 635)then
        begin
          cTotalizador := Copy(cDadosReducao,iInTotalizador,14);
          vet_codTotalizador[contador] := 'FS1';
          vet_valorTotalizador[contador] := cTotalizador;
          inc(contador);
          iInTotalizador := iInTotalizador + 15;
        end;
        if(iInTotalizador = 650)then
        begin
          cTotalizador := Copy(cDadosReducao,iInTotalizador,14);
          vet_codTotalizador[contador] := 'DT';
          vet_valorTotalizador[contador] := cTotalizador;
          inc(contador);
          iInTotalizador := iInTotalizador + 15;
        end;
        if(iInTotalizador = 665)then
        begin
          cTotalizador := Copy(cDadosReducao,iInTotalizador,14);
          vet_codTotalizador[contador] := 'DS';
          vet_valorTotalizador[contador] := cTotalizador;
          inc(contador);
          iInTotalizador := iInTotalizador + 15;
        end;
        if(iInTotalizador = 680)then
        begin
          cTotalizador := Copy(cDadosReducao,iInTotalizador,14);
          vet_codTotalizador[contador] := 'AT';
          vet_valorTotalizador[contador] := cTotalizador;
          inc(contador);
          iInTotalizador := iInTotalizador + 15;
        end;
        if(iInTotalizador = 695)then
        begin
          cTotalizador := Copy(cDadosReducao,iInTotalizador,14);
          vet_codTotalizador[contador] := 'AS';
          vet_valorTotalizador[contador] := cTotalizador;
          inc(contador);
          iInTotalizador := iInTotalizador + 15;
        end;
        if(iInTotalizador = 710)then
        begin
          cTotalizador := Copy(cDadosReducao,iInTotalizador,14);
          vet_codTotalizador[contador] := 'Can-T';
          vet_valorTotalizador[contador] := cTotalizador;
          inc(contador);
          iInTotalizador := iInTotalizador + 15;
        end;
        if(iInTotalizador = 725)then
        begin
          cTotalizador := Copy(cDadosReducao,iInTotalizador,14);
          vet_codTotalizador[contador] := 'Can-S';
          vet_valorTotalizador[contador] := cTotalizador;
          inc(contador);
          iInTotalizador := iInTotalizador + 15;
        end;
        if(iInTotalizador = 740)then
        begin
          While (iInTotalizador < 1132) do
          begin
            cTotalizador := Copy(cDadosReducao,iInTotalizador,14);
            iTotal := iTotal + StrToInt(cTotalizador);
            iInTotalizador := iInTotalizador + 14;
          end;
          iInTotalizador := iInTotalizador + 1;
          cTotalizador := Copy(cDadosReducao,iInTotalizador,14);
          iTotal := iTotal + StrToInt(cTotalizador);
          iInTotalizador := iInTotalizador + 15;
          cTotalizador := Copy(cDadosReducao,iInTotalizador,14);
          iTotal := iTotal + StrToInt(cTotalizador);
          vet_codTotalizador[contador] := 'OPNF';
          vet_valorTotalizador[contador] := FormatFloat('0000000000000',iTotal);
          inc(contador);
          iInTotalizador := iInTotalizador + 15;
        end;
      end;
      iConta := iConta + 1;
      iIndex := iIndex + 4;
    end;
  end else
  begin
    SetLength(CRZ,04);
    iRetorno := rRetornarInformacao_ECF_Daruma('24',CRZ);
    CRZ      := SoNumeros( CRZ );
    setlength( COO,6 );
    iRetorno := rRetornarInformacao_ECF_Daruma('26',COO );
    COO      := SoNumeros( COO );
    SetLength (CRO,3);
    iRetorno := rRetornarInformacao_ECF_Daruma('23',CRO);
    CRO      := SoNumeros( CRO );
    SetLength(DT_MOVIMENTO,1164);
    iRetorno := rRetornarInformacao_ECF_Daruma('140',DT_MOVIMENTO);
    DT_MOVIMENTO := Copy(DT_MOVIMENTO,1,2) +'/'+ Copy(DT_MOVIMENTO,3,2) +'/'+ Copy(DT_MOVIMENTO,5,4);
    try
      SetLength(DT_EMISSAO,14);
      iRetorno   := rRetornarInformacao_ECF_Daruma('72',DT_EMISSAO);
      HR_EMISSAO := Copy(DT_EMISSAO,9,6);  // primeiro tem q pegar este campo ( a hora )
      DT_EMISSAO := Copy(DT_EMISSAO,1,2) +'/'+ Copy(DT_EMISSAO,3,2) +'/'+ Copy(DT_EMISSAO,5,4);
      SetLength(ISSQN,01);
      iRetorno := rRetornarInformacao_ECF_Daruma('109',ISSQN);
      ISSQN    := Copy(ISSQN,1,1);
      SetLength(totalizadorGeral,18);
      iRetorno := rRetornarInformacao_ECF_Daruma('1',totalizadorGeral);
    except
      DT_EMISSAO := DateToStr(DateOf(Now));
      HR_EMISSAO := '190000';
      ISSQN := '0';
      totalizadorGeral := '0';
    end;
    SetLength(vIndice,1164);
    iRetorno := rRetornarInformacao_ECF_Daruma('140',vIndice);
    iRetorno := 843;
    contador := 0;
    while iRetorno < 922 do     // Pega as alíquotas
    begin
      if Copy(Copy(vIndice,iRetorno,5),1,1) = '1' then  // aliquota de ICMS
      begin
        vet_codTotalizador[contador] := FormatFloat('00',contador+1) + 'T' + Copy(vIndice,iRetorno+1,4);
        inc(contador);
      end;
      if Copy(Copy(vIndice,iRetorno,5),1,1) = '2' then  // aliquota de ISS
      begin
        vet_codTotalizador[contador] := FormatFloat('00',contador+1) + 'S' + Copy(vIndice,iRetorno+1,4);
        inc(contador);
      end;
      iRetorno := iRetorno + 5;
    end;
    //  Pega o valor vendido de cada aliquota exeto ISS FF II NN
    auxiContador := contador;  // vou atribuir valor a variavel p poder utiliza-la como contador novamente
    contador := 0;  // vou zerar a variavel p poder utiliza-la como contador novamente
    iRetorno := 129;
    while iRetorno < 352 do
    begin
      vet_valorTotalizador[contador] := Copy(vIndice,iRetorno,14);
      Inc(contador);
      iRetorno := iRetorno + 14;
      if contador > auxiContador then
        Break;
    end;
    // pega o valor dos descontos, acrescimos, cancelamentos
    vet_codTotalizador[auxiContador] := 'DT';
    vet_valorTotalizador[auxiContador] := Copy(vIndice,45,14);
    Inc(auxiContador);
    vet_codTotalizador[auxiContador] := 'DS';
    vet_valorTotalizador[auxiContador] := Copy(vIndice,59,14);
    Inc(auxiContador);
    vet_codTotalizador[auxiContador] := 'Can-T';
    vet_valorTotalizador[auxiContador] := Copy(vIndice,73,14);
    Inc(auxiContador);
    vet_codTotalizador[auxiContador] := 'Can-S';
    vet_valorTotalizador[auxiContador] := Copy(vIndice,87,14);
    Inc(auxiContador);
    vet_codTotalizador[auxiContador] := 'AT';
    vet_valorTotalizador[auxiContador] := Copy(vIndice,101,14);
    Inc(auxiContador);
    vet_codTotalizador[auxiContador] := 'AS';
    vet_valorTotalizador[auxiContador] := Copy(vIndice,115,14);
    Inc(auxiContador);
    //  Pega o valor vendido de cada aliquota ISS FF II NN
    contador := 1;  // vou zerar a variavel p poder utiliza-la como contador novamente
    iRetorno := 353;
    while iRetorno < 842 do
    begin
      if contador = 1 then
      begin
        vet_codTotalizador[auxiContador] := 'F1';
        vet_valorTotalizador[auxiContador] := Copy(vIndice,iRetorno,14);
      end else if contador = 2 then
      begin
        vet_codTotalizador[auxiContador] := 'F2';
        vet_valorTotalizador[auxiContador] := Copy(vIndice,iRetorno,14);
      end else if contador = 3 then
      begin
        vet_codTotalizador[auxiContador] := 'I1';
        vet_valorTotalizador[auxiContador] := Copy(vIndice,iRetorno,14);
      end else if contador = 4 then
      begin
        vet_codTotalizador[auxiContador] := 'I2';
        vet_valorTotalizador[auxiContador] := Copy(vIndice,iRetorno,14);
      end else if contador = 5 then
      begin
        vet_codTotalizador[auxiContador] := 'N1';
        vet_valorTotalizador[auxiContador] := Copy(vIndice,iRetorno,14);
      end else if contador = 6 then
      begin
        vet_codTotalizador[auxiContador] := 'N2';
        vet_valorTotalizador[auxiContador] := Copy(vIndice,iRetorno,14);
      end else if contador = 7 then
      begin
        vet_codTotalizador[auxiContador] := 'FS1';
        vet_valorTotalizador[auxiContador] := Copy(vIndice,iRetorno,14);
      end else if contador = 8 then
      begin
        vet_codTotalizador[auxiContador] := 'FS2';
        vet_valorTotalizador[auxiContador] := Copy(vIndice,iRetorno,14);
      end else if contador = 9 then
      begin
        vet_codTotalizador[auxiContador] := 'IS1';
        vet_valorTotalizador[auxiContador] := Copy(vIndice,iRetorno,14);
      end else if contador = 10 then
      begin
        vet_codTotalizador[auxiContador] := 'IS2';
        vet_valorTotalizador[auxiContador] := Copy(vIndice,iRetorno,14);
      end else if contador = 11 then
      begin
        vet_codTotalizador[auxiContador] := 'NS1';
        vet_valorTotalizador[auxiContador] := Copy(vIndice,iRetorno,14);
      end else if contador = 12 then
      begin
        vet_codTotalizador[auxiContador] := 'NS2';
        vet_valorTotalizador[auxiContador] := Copy(vIndice,iRetorno,14);
      end;
      Inc(contador);
      if contador > 12 then    // para a daruma só existem 12 aliquotas ii,ff,nn
        Break;
      Inc(auxiContador);
      iRetorno := iRetorno + 14;
    end;
  end;
  ISSQN := '0';  // BEMATECH N RETORNA ESTE CAMPO
  ADOQrySalvar := TADOQuery.Create(nil);
  ADOQrySalvar.Connection := DModulo.Conexao;
  with ADOQrySalvar do
  begin
    if retornarMensagem then
    begin
      FrmPedeSenha.EdtMensagem.Caption := '';
      FrmPedeSenha.EdtMensagem.Caption := 'Salvando Redução Z R2';
      FrmPedeSenha.EdtMensagem.Refresh;
    end;
    try
      DModulo.Conexao.BeginTrans;
      Sql.Text := 'Insert Into ReducaoZ_R2 (nrFabricacao,dsMFAdicional,dsModeloECF,dsNumeroUsuario,dsCRZ,dsCOO, '+
                  'dsCRO,dtMovimento,dtEmissao,dsHREmissao,vlVendaBrutaDiaria,dsParametroECF,vlTotalizadorGeral,'+
                  'nrFabricacao_CRI,dsCRZ_CRI,dsCOO_CRI,dsCRO_CRI,dtMovimento_CRI,dtEmissao_CRI,dsHREmissao_CRI,'+
                  'vlVendaBrutaDiaria_CRI) '+
                  'Values (:nrFabricacao,:dsMFAdicional,:dsModeloECF,:dsNumeroUsuario,:dsCRZ,:dsCOO,:dsCRO,     '+
                  ':dtMovimento,:dtEmissao,:dsHREmissao,:vlVendaBrutaDiaria,:dsParametroECF,:vlTotalizadorGeral,'+
                  ':nrFabricacao_CRI,:dsCRZ_CRI,:dsCOO_CRI,:dsCRO_CRI,:dtMovimento_CRI,:dtEmissao_CRI,          '+
                  ':dsHREmissao_CRI,:vlVendaBrutaDiaria_CRI)';
      Parameters.ParamByName('nrFabricacao').Value  := Copy(Principal.NFabricacao_ECF,1,20);
      Parameters.ParamByName('dsMFAdicional').Value := Copy(Principal.MFAdicional,1,1);
      Parameters.ParamByName('dsModeloECF').Value   := Copy(Principal.ModeloECF,1,20);
      Parameters.ParamByName('dsNumeroUsuario').Value := StrToIntDef(Principal.numeroUsuario_ECF,0);
      Parameters.ParamByName('dsCRZ').Value   := StrToIntDef(CRZ,0);
      Parameters.ParamByName('dsCOO').Value   := StrToIntDef(COO,0);
      Parameters.ParamByName('dsCRO').Value   := StrToIntDef(CRO,0);
      if modeloECF = 'ECFBEMATECH' then
      begin
        if Trim(DT_MOVIMENTO) <> '' then
          Parameters.ParamByName('dtMovimento').Value := Copy( DT_MOVIMENTO,1,2) + '/' + Copy( DT_MOVIMENTO,3,2) + '/20' + Copy( DT_MOVIMENTO,5,2)
        else
          Parameters.ParamByName('dtMovimento').Value := null;
        if Trim(DT_EMISSAO) <> '' then
          Parameters.ParamByName('dtEmissao').Value := Copy( DT_EMISSAO,1,2) + '/' + Copy( DT_EMISSAO,3,2) + '/20' + Copy( DT_EMISSAO,5,2)
        else
          Parameters.ParamByName('dtEmissao').Value := null;
      end else
      begin
        if Trim(DT_MOVIMENTO) <> '' then
          Parameters.ParamByName('dtMovimento').Value := DT_MOVIMENTO
        else
          Parameters.ParamByName('dtMovimento').Value := null;
        if Trim(DT_EMISSAO) <> '' then
          Parameters.ParamByName('dtEmissao').Value := DT_EMISSAO
        else
          Parameters.ParamByName('dtEmissao').Value := null;
      end;
      Parameters.ParamByName('dsHREmissao').Value := copy(trim( HR_EMISSAO ),1,6);
      Parameters.ParamByName('vlVendaBrutaDiaria').Value := FormatFloat('0.00',(StrToIntDef(vendaBruta,0)/100));      // FormatFloat('0.00',StrToFloatDef(Copy(VENDA_BRUTA,1,16) + ',' + Copy(VENDA_BRUTA,17,2),0));
      Parameters.ParamByName('dsParametroECF').Value     := Copy(ISSQN,1,1);
      Parameters.ParamByName('vlTotalizadorGeral').Value := FormatFloat('0.00',(StrToIntDef(totalizadorGeral,0)/100)); // FormatFloat('0.00',StrToFloatDef(Copy(totalizadorGeral,1,16) + ',' + Copy(totalizadorGeral,17,2),0));
      Parameters.ParamByName('nrFabricacao_CRI').Value   := null;
      Parameters.ParamByName('dsCRZ_CRI').Value := null;
      Parameters.ParamByName('dsCOO_CRI').Value := null;
      Parameters.ParamByName('dsCRO_CRI').Value := null;
      Parameters.ParamByName('dtMovimento_CRI').Value := null;
      Parameters.ParamByName('dtEmissao_CRI').Value   := null;
      Parameters.ParamByName('dsHREmissao_CRI').Value := null;
      Parameters.ParamByName('vlVendaBrutaDiaria_CRI').Value := null;
      ExecSQL;
      if retornarMensagem then
      begin
        FrmPedeSenha.EdtMensagem.Caption := '';
        FrmPedeSenha.EdtMensagem.Caption := 'Salvando Redução Z R3';
        FrmPedeSenha.EdtMensagem.Refresh;
      end;
      for iRetorno := 0 to Contador do
      begin
        if Length(vet_valorTotalizador[iRetorno]) > 0 then
        begin
            Sql.Text := 'Insert Into ReducaoZ_R3 (nrFabricacao,dsMFAdicional,dsModeloECF,           '+
                        'dsNumeroUsuario,dsCRZ,dtMovimento,dsCodTotalizadorParcial,nrValorAcumulado,'+
                        'nrFabricacao_CRI,dsCRZ_CRI,dsCodTotalizadorParcial_CRI)                    '+
                        'Values (:nrFabricacao,:dsMFAdicional,:dsModeloECF,:dsNumeroUsuario,:dsCRZ, '+
                        ':dtMovimento,:dsCodTotalizadorParcial,:nrValorAcumulado,:nrFabricacao_CRI, '+
                        ':dsCRZ_CRI,:dsCodTotalizadorParcial_CRI )                                  ';
          Parameters.ParamByName('nrFabricacao').Value  := Copy(Principal.NFabricacao_ECF,1,20);
          Parameters.ParamByName('dsMFAdicional').Value := Copy(Principal.MFAdicional,1,1);
          Parameters.ParamByName('dsModeloECF').Value   := Copy(Principal.ModeloECF,1,20);
          Parameters.ParamByName('dsNumeroUsuario').Value := StrToIntDef(Principal.NumeroUsuario_ECF,0);
          Parameters.ParamByName('dsCRZ').Value         := StrToIntDef(CRZ,0);
          if modeloECF = 'ECFBEMATECH' then
          begin
            if Trim(DT_MOVIMENTO) <> '' then
              Parameters.ParamByName('dtMovimento').Value := Copy( DT_MOVIMENTO,1,2) + '/' + Copy( DT_MOVIMENTO,3,2) + '/20' + Copy( DT_MOVIMENTO,5,2)
            else
              Parameters.ParamByName('dtMovimento').Value := Null;
          end else
          begin
            if Trim(DT_MOVIMENTO) <> '' then
              Parameters.ParamByName('dtMovimento').Value := DT_MOVIMENTO
            else
              Parameters.ParamByName('dtMovimento').Value := Null;
          end;
          Parameters.ParamByName('dsCodTotalizadorParcial').Value := vet_codTotalizador[iRetorno];
          Parameters.ParamByName('nrValorAcumulado').Value := FormatFloat('0.00',StrToFloatDef(Copy(vet_valorTotalizador[iRetorno],1,12) + ',' + Copy(vet_valorTotalizador[iRetorno],13,2),0));
          Parameters.ParamByName('nrFabricacao_CRI').Value := EncriptStr( Principal.NFabricacao_ECF );
          Parameters.ParamByName('dsCRZ_CRI').Value        := EncriptStr( IntToStr( StrToIntDef(CRZ,0) ));
          Parameters.ParamByName('dsCodTotalizadorParcial_CRI').Value := EncriptStr( vet_codTotalizador[iRetorno] );
          ExecSQL;
        end;
      end;
      DModulo.Conexao.CommitTrans;
    except
      DModulo.Conexao.RollbackTrans;
    end;
  end;  }
end;

procedure setDadosBalanca(var marcaBalanca : string; var portaBalanca : string; var velocidadePorta : string);
var
  arq : TIniFile;
begin
  arq := TIniFile.Create(ExtractFilePath(Application.ExeName)+'Support.ini');
  try // verifica se usa balança e qual a porta
    portaBalanca    := arq.ReadString('Porta_Balanca','porta','');
    marcaBalanca    := arq.ReadString('MARCA_BALANCA','tipo','');
    velocidadePorta := arq.ReadString('VELOCIDADE_PORTA_BALANCA','velocidade','');
  finally
    FreeAndNil(arq);
  end;
end;

procedure abrePortaBalanca(marcaBalanca, portaBalanca : string);
var
  inicio: Integer;
  baudRate : Integer;
  mbalanca : String;
  retorno : Boolean;
begin
//  if Copy(UpperCase(marcaBalanca), 1, 6) = UpperCase('TOLEDO') then
//  begin
//    { TODAS AS BALANÇAS TOLEDO DEVEM OBEDECER ESTA CONFIGURAÇÃO PARA FUNCIONAR
//    0 -> velocidade da porta = 2400, 1 -> velocidade da porta = 4800, 2 -> velocidade da porta = 9600
//    1 -> bits dados = 8, 0 -> paridade = nenhum }
//    if UpperCase(marcaBalanca) = UpperCase( 'TOLEDO' ) then    // 9600
//      baudRate := 2
//    else if UpperCase(marcaBalanca) = UpperCase( 'TOLEDOPRIXIII' ) then  //4800
//      baudRate := 1
//    else if UpperCase(marcaBalanca) = UpperCase( 'TOLEDO2400' ) then    // 2400
//      baudRate := 0;
//    try
//      if AbrePorta(StrToIntDef(portaBalanca, 4), baudRate, 1, 0) = 0 then
//        showmessage('Não foi possivel conectar balança Toledo na porta COM' + portaBalanca);
//    except
//      showmessage('Não foi possivel conectar balança Toledo na porta COM' + portaBalanca);
//    end;
//  end;
end;

procedure fechaPortaBalanca(marcaBalanca : string);
begin
//  if Copy(UPPERCASE(marcaBalanca),1 ,6) <> '' then
//    TNEGBalanca.fechaPorta(Principal.ACBrBAL);
end;

function getPesoBalanca(marcaBalanca : string): string;
var
  peso : string;
begin
  if Copy(UPPERCASE(marcaBalanca),1 ,6) = UpperCase( 'TOLEDO' ) then
    Result := getPesoBalancaToledo;
end;

function getPesoBalancaToledo: string;
var
  Peso : array[0..5] of AnsiChar;
  retornoBalanca : string;
begin
//  try
//    if PegaPeso(0, Peso, PAnsiChar('C:\')) <> 0 then
//    begin
//      retornoBalanca := StrPas(Peso);
//      if StrToIntDef( retornoBalanca, 0 ) > 0 then  // mudei aqui  StrToInt( retornoBalanca ) > 0
//      begin
//        try
//          RemoveChar(retornoBalanca);
//          Result := FormatFloat('0.000', StrToFloat( retornoBalanca ) / 1000);
//        except
//          on E: Exception do
//          begin
//            ShowMessage('Erro ');
//          end;
//        end;
//      end else
//        Result := '0';
//    end else
//      Result := '0';
//  except
//    Result := '0';
//  end;
end;

function getPesoBalancaFilizola: string;
var
  status: integer;    //, aux
begin
//  status := StrToInt(FloatToStr(ObtemInformacao(0,0)));
//  case status of
//    0: ShowMessage('Falha comuncando-se com a balança.');
//    3: ShowMessage('Sobrecarga de Peso ou Alivio de Plataforma.');
//    4: ShowMessage('Erro lendo licensa do Software.');
//  end;
//  if ( status = 1 ) or ( status = 2 ) then
//  begin
//    try
//      Result := FormatFloat('0.000',ObtemInformacao(0,1)/1000);
//    except
//      on E: Exception do
//      begin
//        ShowMessage('Erro ');
//        Result := '0';
//      end;
//    end;
//  end else
//    Result := '0';
end;

function getPesoBalancaUrano: string;
var
  retorno : string;
begin
//  try
//    retorno := _LePeso();
//    Result := FormatFloat('0.000',  StrToFloatDef(SoNumeros( retorno ), 1000)/1000);
//  except
//    Result := '0';
//  end;
end;

function RoundBematech(valor:real; casasDecimais:integer):Currency;
var
  valorString, fracao:string;
  posicaoDaVirgula, numeroSeguinte, ultimoNumero, i:integer;
  valorInt: integer;
  seguidoPorZeros: Boolean;
begin
  valorString:= FloatToStr(valor);
  posicaoDaVirgula:= pos(',', valorString);
  try
    ultimoNumero:= strToInt(valorString[posicaoDaVirgula+casasDecimais]);
  except
    ultimoNumero:= 0;
  end;
  try
    numeroSeguinte:= StrToInt(valorString[posicaoDaVirgula+casasDecimais+1]);
  except
    numeroSeguinte:= 0;
  end;
  seguidoPorZeros:= True;
  for i:= (posicaoDaVirgula+casasDecimais+2) to Length(valorString) do
  begin
    if valorString[i] <> '0' then
    begin
      seguidoPorZeros:= False;
      Break;
    end;
  end;
  valorString:= IntToStr(Trunc(valor)) +  FloatToStr(Trunc(Frac(valor)*(Power(10,casasDecimais))));
  // Se o último algarismo a ser conservado for seguido de um algarismo inferior a cinco: Basta apenas retirar os algarismos após o algarismo que queremos conservar
  if numeroSeguinte < 5 then
     Insert(',', valorString, posicaoDaVirgula)
  else
  // Se o último algarismo a ser conservado for seguido de um algarismo superior a cinco : Aumenta-se uma unidade a este último algarismo e retira-se os posteriores.
  if numeroSeguinte > 5 then
  begin
    valorInt:= strToInt(valorString);
    inc(valorInt);
    valorString:= IntToStr(valorInt);
    Insert(',', valorString, posicaoDaVirgula);
  end else
  // Se o último algarismo a ser conservado for seguido de um algarismo igual a cinco: Se o algarismo a ser conservado for ímpar, soma-se uma unidade ao algarismo a ser conservado e retira-se os posteriores
  if Odd(ultimoNumero) then
  begin
    valorInt:= strToInt(valorString);
    inc(valorInt);
    valorString:= IntToStr(valorInt);
    Insert(',', valorString, posicaoDaVirgula);
  end else
  //  Se o algarismo a ser conservado for par...
  begin
    // ... e ao algarismo 5 subsequente seguir-se pelo menos um algarismo diferente de zero, soma-se uma unidade ao algarismo a ser conservado e retira-se os posteriores.
    if (not seguidoPorZeros) then
    begin
      valorInt:= strToInt(valorString);
      inc(valorInt);
      valorString:= IntToStr(valorInt);
      Insert(',', valorString, posicaoDaVirgula);
    end
    else
      Insert(',', valorString, posicaoDaVirgula);
  end;
  result:= StrToCurr(valorString);
end;

end.
