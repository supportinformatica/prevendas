unit uFuncoesPadrao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IdSNTP, Variants,
  StdCtrls, Buttons, Db, DBTables, Mask, ExtCtrls, Registry, ComCtrls, CheckLst, ActiveX,
  DBIPROCS, DBITypes, DBIErrs,Grids, ADODB, IDhTTP,TypInfo, iniFiles, Vcl.Clipbrd, NEGLoja,
  jpeg, IdIOHandlerSocket,IdSSLOpenSSL, IdFTP;

type
   TNumerico = (SmallInt, Int, TinyInt);
   TDia = (domingo,segunda,terca,quarta,quinta,sexta,sabado);

type
   VetorExtenso = Array [1..39] of String;

type
   ArrayRetorno = array[1..4] of string;

const
   RASBASE = 600;
   { Constantes de erro }
   ERROR_NO_CONNECTION = RASBASE + 68;
   ERROR_USER_DISCONNECTION = RASBASE + 31;
   feriadosNacionais: array[0..7] of string = ('01/01','21/04','01/05','07/09','12/10','02/11','15/11','25/12');

procedure Limpa_Grid(grid : TStringGrid );

function BuscaCep(CEP : String) : ArrayRetorno;

function DecodeUTF(codigo : string) : string;

function DecodeCEP(texto : string) : string;

function SoNumeros(Const Texto:String):String;

Function Maiuscula(St:char):char;

function Minuscula(St:char):char;

function calculaDV(Numero : String) : String;

function Capitular(palavra:string):STRING;

function CarregarImagemURL(var imagem :TImage; url: string) : Boolean;

function uploadImagemFTP(CNPJ : string) : string;

function DataDeCriacao(Arq: string): TDateTime;

{
* Retorna um formato que será usado na função FormatFloat
}
function getFormato(quantidadeCasasDecimais:Integer): string;

{
* Mesma função do FormatFloat com um parâmetro diferente, ao invés do formato passamos
* a quantidade de casas decimais.
}
function FormatFloatQ(quantidadeCasasDecimais:Integer; valor:Extended):string;

function getCodigoFornecedor(_connectionString:string; cdProduto:Integer):Integer;

{ Retorna o código do fabricante de determinado lote de um produto }
function getFabricanteLote(_connectionString:string; cdProduto:Integer; nrLote:string):Integer;

procedure persistirForm(nomeForm:string; campo:string; valor:string; arquivo_:string);

function ReadSupportIni(secao:string; variavel:string; retornoDefault:string):string;

function getNomeEmpresa: String;

{ Retorna o estoque físico de determinado produto }
function getNrQtdReal(_connectionString:string; cdproduto:integer):Real;

Function IEok(sInscricao, sEstado: String): Boolean;

procedure Verifica_Existencia_Promocao(data:TDate);

{*******************************************************************}
{Alinha o texto a direita no MaskEdit}
Function AlinharDireitaMsk(edit :TMaskEdit) : String;

{****************************************************************
Objetivo: Monta uma ComboBox ou ListBox que controla um campo (foreign key)
Entrada: Query - Controla o preenchimento da ComboBox.
                 A aplicação deve ter uma query para cada ComboBox que se deseje
                 montar.
         ComboList - ComboBox ou ListBox que se deseja preencher.
******************************************************************}
function MontaComboListBool( Query     :TQuery;
                             ComboList :TWinControl
                           )                          :boolean;

function MontaComboListBoolADO( AdoQuery     :TAdoQuery;
                             ComboList :TWinControl
                           )                          :boolean;

function MontaComboListBoolADOSP( AdoStoredProc     :TAdoStoredProc;
                             ComboList :TWinControl
                           )                          :boolean;


function MontaComboListADO( AdoQuery  : TAdoQuery;
                            ComboList :TWinControl ) :boolean;

function MontaComboListComposto( AdoQuery:TAdoQuery; ComboList:TWinControl; num_campos:integer=1):boolean; // MONTA A COMBO COM UM, DOIS OU MAIS CAMPOS CONCATENADOS

procedure limparArrayInteger(var array_: array of integer; inicio:integer; fim:integer; inserir_em_todos:integer);

procedure limparArrayBoolean(var array_: array of boolean; inicio:integer; fim:integer; inserir_em_todos:Boolean);

function ValidarCFOP(CFOP: String; Entrada:Boolean; vUF_PART:string; var msgRetorno:string; ConnectionString_:string): Boolean;

function getUF(ConnectionString:string):string;overload;

function CFOP_Cadastrado(cfop:string; connectionString: string):boolean;

{ retorna a unidade de cadastro de um produto }
function getUnidade(cdProduto: integer; ConnectionString:string):string;

function getUF(cdPessoa : integer; ConnectionString:string):string;overload;

{ retorna a data e hora do banco de dados }
function getDataBanco(ConnectionString:string):TDateTime;

function copy_campo(texto:string; caracter_delimitador:string; coluna:Integer):string;

function pubNomeComputador : string;

{****************************************************************
Objetivo: Monta uma ComboBox que controla um campo (foreign key)
Entrada: Query - Controla o preenchimento da ComboBox.
                 A aplicação deve ter uma query para cada ComboBox que se deseje
                 montar.
         ComboList - ComboBox ou ListBox que se deseja preencher.
         Mensagem - Mensagem que deve aparecer quando não existir dados na query
                    para preencher a ComboBox ou ListBox.
         NomeCampo - Nome do campo da query que será utilizado para montar a
                     ComboBox ou ListBox.
******************************************************************}

function PreencheComSpace(texto1:string ; tamanho:integer) : String;
{*******************************************************************}

function PreencheComZeros(numero:real ; digitos:integer) : String;
{*******************************************************************}

function SubstituiTexto(StrInicial,StrProcura : String) :  String;

function PegaDataDoExecutavel(Arquivo: String) :TDateTime;

function RemoveChar(Const Texto:String):String;

function VirgPonto(Valor: string): String;  // substitui o ponto de uma string por vírgula

procedure MontaComboList( Query     :TQuery;
                          ComboList :TWinControl;
                          Mensagem  :String;
                          NomeCampo :String     );

function RefreshComboList( qryComboList :TQuery;
                           ComboList :TWinControl;
                           sbRefresh :TSpeedButton) :boolean;


{************************************************************************************************************************{*}
procedure Salvar_erro(DATA_HORA: string; USUARIO : string; METODO : string; MENSAGEM : string; LANCAMENTO: string = ''); {*}
{**************************************************************************************************************************}
{                  Salva a DATA, HORA, CÓDIGO DO USUÁRIO E O MÉTODO QUE ORIGINARAM ALGUMA EXCEÇÃO NO SISTEMA               }
{**************************************************************************************************************************}

function DesencriptStr(Texto: String):String; //descriptografa uma string criptografada

function EncriptStr(Texto: String):String; //criptografa uma string


procedure MontaComboStringList( Query     :TQuery;
                                ComboList :TWinControl;
                                Mensagem  :String;
                                NomeCampo :String;
                                NomeCodigo: String;
                                StrList   : TStringList
                        );

{*********************************************************************
  Objetivo: Devolve o ItemIndex do item na combobox ou ListBox, senão
            devolve -1
  Entrada: ComboList  :TComboBox ou TListBox
           ItemDesejado  :String
  Saída:   Um inteiro - contendo o ItemIndex da ComboBox
**********************************************************************}
function ProcuraItemComboList( ComboList     :TWinControl;
                               ItemDesejado  :String     ) :integer;

{*********************************************************************
  Objetivo: Limpa o conteúdo dos componentes TEdit, TMaskEdit, TMemo e
            deseleciona TComboBox e TListBox de um TWinControl. Um
            TWinControl pode ser um TForm, TPanel, TabSheet etc.
  Entrada:  WinControl :TWinControl
**********************************************************************}
procedure LimpaTodosCampos(WinControl :TWinControl);

{*********************************************************************
  Objetivo: Retorna true se todos os Edit e ComboBox de um TWinControl
            estiverem vazios. Um TWinControl pode ser um Panel, um
            TabSheet etc.
  Entrada:  WinControl :TWinControl
  Saida:    boolean
**********************************************************************}
function TodosCamposVazios(WinControl :TWinControl) :boolean;

{*******************************************************
  Objetivo: Retorna o login do usuário corrente
  Saída: String contendo o login do usuário

{*************************************************************
 Objetivo:  Testa se uma tecla é numérica ou afim. Caso não seja
            um número devolve o caracter #0, o que anula a tecla
            digitada anteriormente.
 Entrada/Saída:  Key :Char
**************************************************************}
{*************************************************************
 Objetivo: Testa se uma tecla presionada é um número correspondente
           a lista do teste da função, se não for retorna o caracter
           #0, o que anula a tecla digitada anteriormente.
****************************************************************}
{****************************************************************
  Objetivo: Criptografa/Discriptografa Senha}

function SENHA(vsenha: String; vtipo : String) : String;
{****************************************************************
  Objetivo: Testar Permissão para acesso a recursos}

function LasDay(data : TDate): TDate;

//function PERMISSAO(vTag: String; vColuna : String; exibirMsgAcessoNegado:Boolean=True) : String;

{  Objetivo: teste se o CNPJ e o Cpf sao validos}
function CalculaCnpjCpf(Numero : String) : String;

function ConverteHora(Hora :TDateTime) : String;
// Valida as Horas para as query's

function NomeDoDia(Data : TDateTime): String;

Procedure ValidarNumero(Var Key:Char; texto_atual:string ); overload;

Procedure ValidarNumero(Var Key :Char); overload;
// Permite a digitacao de numeros inteiros sem ponto e com virgula
{******************************************************************************}

Procedure ValidarInteiro(Var Key :Char);
// Permite a digitacao de numeros inteiros sem ponto e sem virgula
{******************************************************************************}

procedure TeclaNumerica(var Key :Char);

procedure TeclaNaoNumerica(var Key :Char);

{*************************************************************
 Objetivo:  Testa se um determinado WinControl (TForm, TPanel etc.)
            possui componentes TEdit, TMemo, TMaskEdit, TComboBox
            e TListBox)de preenchimento obrigatório. Para indicar
            que estes componentes são de preenchimento obrigatório
            basta setar sua propriedade IMEMODE para IMOPEN.
 Entrada: TWinControl(TForm, TPanel etc.)
 Saída: true - se os componentes de preenchimento obrigatorio
               estiverem preenchidos
        false - se algum componente de preenchimento obrigatorio
                não estiver preenchido
**************************************************************}
function CamposObrigatoriosPreenchidos(WinControl :TWinControl) : boolean;

{*****************************************************************
  Objetivo: Valida o tipo numerico.
  Entrada: Valor numerico e o tipo numerico(Smallint,Int.Tinynt)
  Saída: true - se o valor esta na faixa correta do tipo.
         false - se o valor não esta na faixa correta.
*****************************************************************}
procedure ValidaTipoNumero(Sender : TObject; Tipo : TNumerico);

{*****************************************************************
 Objetivo: Testar CPF.
 Entrada:  StrCPF - cpf (sem mascara)
 Saída: True - se o cpf esta correto
        False - se o cpf esta errado
*****************************************************************}
function CPFValido(StrCPF :string ) :boolean;

{*****************************************************************
  Objetivo: Retorna true se o CGC for válido.
  Entrada: StrCGC - cgc (sem mascara)
  Saída: true - se o cgc esta correto
         false - se o cgc esta errado
*****************************************************************}

Function SerialNum :String;
{Pega número do HD}

function CGCValido(StrCGC :string) :boolean;

Function EXTENSO(Valor: String) : String;
{Objetivo: Retornar o extenso de um valor}

function isFeriadoNacional(data: TDateTime):Boolean;

function ValidaComputadorSupport(cnpj : string):boolean;

function RetornaDtExpira : TDateTime;

function DesCriptografar(V_Variavel:PChar): PChar;

function Modulo11(pNum: String; DefaultNum : Integer = 0) : Integer;

function Pode_Inserir_o_Mesmo_Produto: Boolean;

procedure Bloquear_Janela_QuickRep;

function OcultarOrcamentoNaPreVenda: boolean;

function vdata_banco: String;

function vHora_banco: String;

function BuscaApelido(cdPessoa: integer):String;

function vSenhaProxy: String;

function vUsuarioProxy: string;

function ValidarString(str : String) : string;

function RetirarAcento ( str: String ): String;

function Modulo11CEF(jNum:String):String;

Function RetiraAspaSimples(Texto:String):String;

function RepeticoesCaractere(caractere, texto: string): integer;

function CentralizaTexto(Texto: String; Tamanho: Integer):Integer;

function RemoveEspaco(str : String) : string;

function RetiraPontuacao(str: string): string;

function ObterDataHoraInternet: TDateTime;

implementation

{uses dbclient, bdeprov, grids, math, mplayer, menus, olectrls,
     comobj, outline, printers, dsgnintf, scktcomp;}

uses  math, mplayer, menus, olectrls,
     comobj, outline, printers, scktcomp, DateUtils, DataModulo;

function ObterDataHoraInternet: TDateTime;
var
  IDSntp: TIDSntp;
begin
  IDSntp := TIDSntp.Create(nil);
  IDSntp.ReceiveTimeout := 3000; //3 segundos
  try
    try
      IDSntp.Host := '0.br.pool.ntp.org';
      Result := IDSntp.DateTime;
    except
      try
        IDSntp.Host := 'a.st1.ntp.br';
        Result := IDSntp.DateTime;
      except
        try
          IDSntp.Host := 'b.st1.ntp.br';
          Result := IDSntp.DateTime;
        except
          result := 0;
        end;
      end;
    end;
  finally
    IDSntp.Free;
  end;
end;

function RetiraPontuacao(str: string): string;
var
i: Integer;
begin
  try
    for i := 1 to Length ( str ) do  begin
      case str[i] of
        ',': str[i] := ' ';
        '.': str[i] := ' ';
        '(': str[i] := ' ';
        ')': str[i] := ' ';
        '/': str[i] := ' ';
        '\': str[i] := ' ';
        '[': str[i] := ' ';
        ']': str[i] := ' ';
        '-': str[i] := ' ';
        '{': str[i] := ' ';
        '}': str[i] := ' ';
        '!': str[i] := ' ';
        '?': str[i] := ' ';
        '=': str[i] := ' ';
        '>': str[i] := ' ';
        '&': str[i] := ' ';
        '<': str[i] := ' ';
      end;
    end;
    Result := ValidarString(str);
  except
    MessageDlg('Erro na função RetiraAcento. Variavel = '+str,mtError,[mbOK],0);
  end;
end;

function RemoveEspaco(str : String) : string;
begin
  str :=  StringReplace(str,' ','',[rfReplaceAll]);
  Result := str;
end;

function CentralizaTexto(Texto: String; Tamanho: Integer):Integer;
begin
  Result := (Tamanho - 4 - Length(Texto)) div 2;
end;

function ValidarString(str : String) : string;
begin
  str :=  StringReplace(str,'>','&gt;',[rfReplaceAll]);
  str :=  StringReplace(str,'<','&lt;',[rfReplaceAll]);
  str :=  StringReplace(str,'&','&amp;',[rfReplaceAll]);
  str :=  StringReplace(str,'"','&quot;',[rfReplaceAll]);
  Result := str;
end;

function RetirarAcento ( str: String ): String;
var
i: Integer;
begin
try
  for i := 1 to Length ( str ) do  begin
    case str[i] of
      'á': str[i] := 'a';
      'é': str[i] := 'e';
      'í': str[i] := 'i';
      'ó': str[i] := 'o';
      'ú': str[i] := 'u';
      'à': str[i] := 'a';
      'è': str[i] := 'e';
      'ì': str[i] := 'i';
      'ò': str[i] := 'o';
      'ù': str[i] := 'u';
      'â': str[i] := 'a';
      'ê': str[i] := 'e';
      'î': str[i] := 'i';
      'ô': str[i] := 'o';
      'û': str[i] := 'u';
      'ä': str[i] := 'a';
      'ë': str[i] := 'e';
      'ï': str[i] := 'i';
      'ö': str[i] := 'o';
      'ü': str[i] := 'u';
      'ã': str[i] := 'a';
      'õ': str[i] := 'o';
      'ñ': str[i] := 'n';
      'ç': str[i] := 'c';
      'Á': str[i] := 'A';
      'É': str[i] := 'E';
      'Í': str[i] := 'I';
      'Ó': str[i] := 'O';
      'Ú': str[i] := 'U';
      'À': str[i] := 'A';
      'È': str[i] := 'E';
      'Ì': str[i] := 'I';
      'Ò': str[i] := 'O';
      'Ù': str[i] := 'U';
      'Â': str[i] := 'A';
      'Ê': str[i] := 'E';
      'Î': str[i] := 'I';
      'Ô': str[i] := 'O';
      'Û': str[i] := 'U';
      'Ä': str[i] := 'A';
      'Ë': str[i] := 'E';
      'Ï': str[i] := 'I';
      'Ö': str[i] := 'O';
      'Ü': str[i] := 'U';
      'Ã': str[i] := 'A';
      'Õ': str[i] := 'O';
      'Ñ': str[i] := 'N';
      'Ç': str[i] := 'C';
      //',': str[i] := ' ';
     // '.': str[i] := ' ';
      //'(': str[i] := ' ';
      //')': str[i] := ' ';
      //'/': str[i] := ' ';
      //'\': str[i] := ' ';
      //'[': str[i] := ' ';
      //']': str[i] := ' ';
      //'-': str[i] := ' ';
      //'{': str[i] := ' ';
      //'}': str[i] := ' ';
      //'!': str[i] := ' ';
      //'?': str[i] := ' ';
      //'#': str[i] := ' ';
      //'$': str[i] := ' ';
      //'%': str[i] := ' ';
      //'+': str[i] := ' ';
      //'*': str[i] := ' ';
      //'^': str[i] := ' ';
      //'~': str[i] := ' ';
      //'=': str[i] := ' ';
      '>': str[i] := ' ';
      '&': str[i] := ' ';
      '<': str[i] := ' ';
    end;
  end;
  Result := ValidarString(str);
except
  MessageDlg('Erro na função RetiraAcento. Variavel = '+str,mtError,[mbOK],0);
end;
end;

function Modulo11CEF(jNum:String):String;
var
  vPeso,ix,vSoma : Integer;
begin
  vSoma := 0;
  vPeso := 1;
  For ix := Length(jNum) downto 1 do
  begin
    if (vPeso + 1) > 9 Then Begin
      vPeso :=  2;
    End
    Else begin
      vPeso :=  (vPeso + 1);
    end;
    vSoma := vSoma + (StrToInt(jNum[ix])*vPeso);
  end;
  vSoma := (11 - (vSoma mod 11));
  if (vSoma = 0) or (vSoma = 10) then
    vSoma := 0; // Se o resto for 0 ou 10 então retorna 0
  Result := IntToStr(vSoma);
end;

Function RetiraAspaSimples(Texto:String):String;
var
  n : Integer;
  NovoTexto : String;
begin
  NovoTexto := '';
  for n := 1 to length(texto) do
  begin
    if copy(texto, n,1) <> Chr(39) then
      NovoTexto := NovoTexto + copy(Texto, n,1)
    else
      NovoTexto := NovoTexto + ' ';
  end;
  Result:=NovoTexto;
end;

function RepeticoesCaractere(caractere, texto: string): integer;
var
  i: integer;
begin
  result := 0;
  for i := 1 to Length(texto) do
    if (texto[i] = caractere) then
      result := result + 1;
end;

function vSenhaProxy: String;
var
  qry: TAdoQuery;
begin
  qry := TadoQuery.Create(nil);
  qry.Connection := DModulo.Conexao;
  with qry do begin
    sql.Text := 'select SENHAPROXY from configuracao with(nolock) ';
    open;
    result := fieldByName('SENHAPROXY').AsString;
    close;
  end;
end;

function vUsuarioProxy: string;
var
  qry: TAdoQuery;
begin
  qry := TadoQuery.Create(nil);
  qry.Connection := DModulo.Conexao;
  with qry do begin
    sql.Text := 'select USUARIOPROXY from configuracao with(nolock) ';
    open;
    result := fieldByName('USUARIOPROXY').AsString;
    close;
  end;
end;

function BuscaApelido(cdPessoa: integer): String;
var
  qry: TAdoQuery;
begin
  qry := TadoQuery.Create(nil);
  qry.Connection := DModulo.Conexao;
  with qry do begin
    sql.Text := 'select J.nmCOntato as Apelido from p_juridica J with (nolock) '+
                'where cdPessoa = :cdPessoa1                       '+
                'union                                             '+
                'select F.dsNaturalidade as Apelido from p_fisica F with (nolock) '+
                'where cdPessoa = :cdPessoa                        ';
    parameters.ParamByName('cdPessoa').value  := cdPessoa;
    parameters.ParamByName('cdPessoa1').value := cdPessoa;
    open;
    result := fieldByName('Apelido').AsString;
    close;
  end;
end;

function vHora_banco: String;
var qry: TADOQuery;
begin
  qry := TAdoQuery.Create(nil);
  qry.connection := DModulo.Conexao;
  with qry do
  begin
    sql.text := 'Select CONVERT(CHAR(8),GETDATE(),14) as HORA';
    Open;
    Result := FieldByName('HORA').AsString; // Pega a data do banco de dados (servidor).
    close;
  end;
  FreeAndNil(qry);
end;

function vdata_banco: String;
var qry: TADOQuery;
begin
  qry := TAdoQuery.Create(nil);
  qry.connection := DModulo.Conexao;
  with qry do begin
    sql.text := 'Select CONVERT(CHAR(10),GETDATE(),103) as data';
    Open;
    vdata_banco := FieldByName('data').AsString; // Pega a data do banco de dados (servidor).
    close;
  end;
  FreeAndNil(qry);
end;

function OcultarOrcamentoNaPreVenda: boolean;
var qry: TADOQuery;
begin
  qry := TAdoQuery.Create(nil);
  qry.connection := DModulo.Conexao;
  with qry do begin
    sql.text := 'select OcultarOrcamentoNaPreVenda from configuracao with (nolock)';
    open;
    OcultarOrcamentoNaPreVenda := FieldByName('OcultarOrcamentoNaPreVenda').AsBoolean;
    close;
  end;
  FreeAndNil(qry);
end;

procedure Bloquear_Janela_QuickRep;
var
  i : integer;
begin
  for i := 0 to Screen.FormCount - 1 do
  begin
    if Screen.Forms[i].ClassName = 'TQRStandardPreview' then begin
      Screen.Forms[i].BorderIcons:= Screen.Forms[i].BorderIcons-[biMinimize];
      Screen.Forms[i].BorderIcons:= Screen.Forms[i].BorderIcons-[biMaximize];
      //Screen.Forms[i].Parent := nil;
      Screen.Forms[i].WindowState := wsNormal;
      Screen.Forms[i].Align := alClient;
      Screen.Forms[i].BorderStyle := bsSingle;
      //Screen.Forms[i].OnResize := Redimensionar;
    end;
  end;
end;

function Pode_Inserir_o_Mesmo_Produto: Boolean;
var qry: TADOQuery;
begin
  qry := TADOQuery.Create(nil);
  qry.Connection := DModulo.Conexao;
  with qry do begin
    sql.Text := 'select InserirMesmoProdutoPrevenda from configuracao with (nolock) ';
    Open;
    Result := FieldByName('InserirMesmoProdutoPrevenda').AsBoolean;
    close;
  end;
  FreeAndNil(qry);
end;

function Modulo11(pNum: String; DefaultNum : Integer = 0) : Integer;
var
  I, Indice: Integer;
  Num: array of Integer;
  Soma : integer;
begin
  SetLength(num, Length(pNum));

  for I := 0 to Length(pNum) - 1 do
    Num[i] := StrToInt(pNum[i + 1]);
  Indice := 1;
  Soma := 0;

  for I := High(Num) downto Low(Num) do
  begin
    Inc(Indice);
    Indice := IfThen(Indice > 9, 2, Indice);
    Soma := Soma + Num[i] * Indice;
  end;

  Result := 11 - (Soma mod 11);
  Result := IfThen(Result > 9, DefaultNum, Result);
  Result := IfThen(Result < 1, DefaultNum, Result);
end;

function DesCriptografar(V_Variavel:PChar): PChar;
var i,j,vn1,vn2,vresp : integer;
    vaux,vresul : PChar;
    vaux1,vaux2 : string;
    dv,dvmd11   : Integer;
begin
  //Mensagem('Descriptografanado a chave');
  try
    j:= 2;
    vn1 := 0;
    vn2 := 0;
    vaux := '';
    dv := StrToInt(Copy(V_Variavel,Length(V_Variavel),1));
    for i := 1 to Length(V_Variavel)-1 do begin
      if (i < j) then begin
        vn1 := StrToInt(Copy(V_Variavel,i,1));
      end else begin
        vresul := PChar(Copy(V_Variavel,i,1));
        IF vresul = 'B' then
          vresul:= '-1'
        else if vresul = 'C' then
          vresul:= '-2'
        else if vresul = 'D' then
          vresul:= '-3'
        else if vresul = 'E' then
          vresul:= '-4'
        else if vresul = 'F' then
          vresul:= '-5'
        else if vresul = 'G' then
          vresul:= '-6'
        else if vresul = 'H' then
          vresul:= '-7'
        else if vresul = 'I' then
          vresul:= '-8'
        else if vresul = 'J' then
          vresul:= '-9';
        vn2 := StrToInt(vresul);
        j := j + 2;

        vresp := vn1-vn2;
        vaux1 := IntToStr(vn1);
        vaux2 := IntToStr(vresp);
        vaux := PChar(vaux +vaux1+vaux2);
      end;
    end;
    dvmd11 := Modulo11(vaux);
    //Mensagem('chave dv'+inttostr(dv));
    //Mensagem('chave dvm11'+inttostr(dvmd11));
    if(dv = dvmd11) then
      Result := vaux
    else
      Result := 'Invalid key!';
  except
    Result := 'Invalid key!';
  end;
end;

function RetornaDtExpira : TDateTime;
var
  Qry : TADOQuery;
  dtExpiracao, chave : string;

  function RetornaDtVlAvulso: TDateTime;
  begin
    //caso o sistema não for registrado a data de expiração vem da tabela sequencial
    with qry do begin
      sql.text := 'Select nrVlAvulso,nSeq from Sequencial';
      Open;
      if FieldByName('nrVlAvulso').IsNull  then
        result := FloatToDateTime(FieldByName('nSeq').AsInteger)
      else
        result := FloatToDateTime(FieldByName('nrVlAvulso').AsInteger);
    end;
  end;
begin
  Qry := TADOQuery.Create(nil);
  Qry.Connection := DModulo.Conexao;
  with Qry do
  begin
    sql.Text := 'select dsRegistro from configuracao  with (nolock)';
    Open;
    //caso o sistema for registrado a data de expiração vem da chave
    if FieldByName('dsRegistro').AsString <> '' then
    begin
      Chave := Descriptografar(PWideChar(FieldByName('dsRegistro').AsString));
      if Chave <> 'Invalid key!' then
      begin
        DtExpiracao   := Copy(chave,18,8);
        DtExpiracao   := copy(dtExpiracao,1,2)+'/'+copy(dtExpiracao,3,2)+'/'+copy(dtExpiracao,5,4);
      end else
        dtExpiracao := DateToStr(RetornaDtVlAvulso);
    end else
    begin
      dtExpiracao := DateToStr(RetornaDtVlAvulso);
    end;
  end;
  Result := StrToDate(dtExpiracao);
end;

function  GetWMIstring(const WMIClass, WMIProperty:string): string;
 const wbemFlagForwardOnly = $00000020;
 var
  FWbemObjectSet: OLEVariant;
  FWbemObject   : OLEVariant;
  oEnum         : IEnumvariant;
  iValue        : LongWord;
  FSWbemLocator : OLEVariant;
  FWMIService   : OLEVariant;
  res : string;
 begin;
   res:='';
   FSWbemLocator := CreateOleObject('WbemScripting.SWbemLocator');
   FWMIService   := FSWbemLocator.ConnectServer('localhost', 'root\CIMV2', '', '');
   FWbemObjectSet:= FWMIService.ExecQuery(Format('Select %s from %s',[WMIProperty, WMIClass]),'WQL',wbemFlagForwardOnly);
   oEnum         := IUnknown(FWbemObjectSet._NewEnum) as IEnumVariant;
   if oEnum.Next(1, FWbemObject, iValue) = 0 then
     if not VarIsNull(FWbemObject.Properties_.Item(WMIProperty).Value) then
       res:=FWbemObject.Properties_.Item(WMIProperty).Value;
   FWbemObject:=Unassigned;
   result := res;
 end;

function ValidaComputadorSupport(cnpj : string):boolean;
var nomePc: String;
begin
  try
    if (cnpj = '32838245000260') or (cnpj = '01655446000117') then begin //CICLOMOTOS e IPANEMA TECIDO
      result := false;
      exit;
    end;
    nomePc := RemoveEspaco(GetWMIstring('Win32_PhysicalMedia','SerialNumber'));
    if //(nomePC <> 'WD-WX91E15CRJ5F') and  COMPUTADOR DE ANDRE
       (nomePC <> '9QF5SGJ3') And  //batista
       (nomePC <> '606569746803') And //anderson
       (nomePC <> '207C09058070') And  //felipe
       (nomePC <> 'WD-WMAV2CW15598') And //josinei
       (nomePC <> '33961GDPS') And       //junior
       (nomePC <> 'WD-WMAV2CP85027') And //Jorge Pereira
       (nomePC <> '5QZ4R1XA') And        //treinamento1
       (nomePC <> '9RA94KG8') And        //treinamento2
       (nomePC <> 'WD-WCARW1186334') And //treinameno3
       (nomePC <> '0000_0000_0000_0000_707C_18F5_5DBB_D70F.') And    //thiago
       (nomePC <> 'WXU1A47AEU17') and
       (nomePC <> '80C9PG0HT') and   // herbert
       (nomePC <> 'WD-WMAV2M247049') and //TREINAMENTO
       (nomePC <> 'AA000000000000000149')  //JOSE
    then
      result := false     //
    else
      result := true;
  except
    result := false;
  end;
end;

function isFeriadoNacional(data: TDateTime):Boolean;
var dia,mes :string;
    i: integer;
    isFeriado: boolean;
begin
  dia := formatdatetime('dd',data);
  mes := formatdatetime('mm',data);
  isFeriado := false;
  for i:= 0 to 7 do
  begin
    if feriadosNacionais[i] = dia+'/'+mes then
      isFeriado := True;
  end;
  Result := isFeriado;

//01/01  Confraternização
//21/04  Tiradentes
//01/05  Dia do trabalho
//07/09  Independencia do Brasil
//12/10  Nossa senhora Aparecida
//02/11  Finados
//15/11  Proclamação da República
//25/12  Natal
end;

function DecodeUTF(codigo : string) : string;
begin
   if codigo = '%F4' then
     result := 'Ô';
   if codigo = '%E1' then
     result := 'Á';
   if codigo = '%E7' then
     result := 'Ç';
   if codigo = '%E9' then
     result := 'É';
   if codigo = '%E3' then
     result := 'Ã';
   if codigo = '%E2' then
     result := 'Â';
end;

function DecodeCEP(texto : string) : string;
var
  x,y       : integer;
  codigo    : string;  // codigo da letra UTF-8
  resultado : string;
begin
  y := 1;
  for x:=1 to Length(texto) do
  begin
    if texto[y] = '%' then
    begin
      codigo := texto[y] + texto[y+1] + texto[y+2];
      resultado := resultado + DecodeUTF(codigo);
      y := y + 3;
    end else
    begin
      resultado := resultado + texto[y];
      y := y + 1;
    end;
  end;
  Result := resultado;
end;
function BuscaCep(CEP : String) : ArrayRetorno;
var
  Temp     : string;
  Lista    : TStringList;
  WS       : TIdHTTP;
//  f        : TextFile;
  linha    : String;
  x,y      : integer;
  texto    : string;
  Lista2   : TStringList;
  Msg_erro : string;
  contador : integer;
  UF,CIDADE,BAIRRO,RUA : string;
  Flag     : Char;
  Flag2    : Char;
begin
  try
    if CEP = '' then
      Exit;
    // requesicao do web service
    contador := 0;
    Lista2 := TStringList.Create;
    WS := TIdHTTP.Create(ws);
    //Ws.ASCIIFilter := True;
    try
      TEMP:= WS.Get('http://republicavirtual.com.br/web_cep.php?cep='+CEP+'&formato=query_string');
    except
      WS.ProxyParams.BasicAuthentication := True;
      WS.ProxyParams.ProxyPassword := vSenhaProxy;
      WS.ProxyParams.ProxyPort := 8080;
      WS.ProxyParams.ProxyServer := '192.168.254.254';
      WS.ProxyParams.ProxyUsername := vUsuarioProxy;
      TEMP:= WS.Get('http://republicavirtual.com.br/web_cep.php?cep='+CEP+'&formato=query_string');
    end;
    LISTA:= TStringList.Create;
    LISTA.Text := UpperCase(StringReplace(TEMP, '&', #13#10, [rfreplaceAll]));
    //tratamento do retorno do WS
    lista2.Clear;
    texto := '';
    Msg_erro := LISTA.text;
    for x := 0 to Length(Msg_erro) do
    begin
      if (Msg_erro[x] = '=') then
      begin
        contador := contador + 1;
        if contador >= 3 then
        begin
          y := x+1;
          while Msg_erro[y] <> #10 do
          begin
            texto := texto + Msg_erro[y];
            y := y+1;
          end;
          Lista2.Add(texto);
          texto := '';
        end;
      end;
    end;
    //filtragem da resposta
    Flag  := #0;
    Flag2 := #13;
    Msg_erro := Lista2.Text;
    for x := 0 to Length(Msg_erro) do
    begin
      if (Msg_erro[x] = Flag) then
      begin
        y := x+1;
        flag := #10;
        while Msg_erro[y] <> Flag2 do
        begin
          texto := texto + Msg_erro[y];
          y := y+1;
        end;
        if UF = '' then
          UF := texto
        else if CIDADE = '' then
          CIDADE := texto
        else if BAIRRO = '' then
          BAIRRO := texto
        else if RUA = '' then
        begin
          RUA := texto;
          Flag2 := #13;
        end else if RUA <> '' then
        begin
          RUA := RUA + ' ' + texto;
          Result[1] := UF;
          Result[2] := DecodeCEP(CIDADE);
          Result[3] := DecodeCEP(BAIRRO);
          Result[4] := DecodeCEP(RUA);
          exit;
        end;
        texto := '';
      end;
    end;
    if Msg_erro = '' then
      exit;
    for x := 0 to Length(Msg_erro) do
    begin
      if (Msg_erro[x] = ',') then
      begin
        Msg_erro[x] := ':';
        Exit;
      end;
    end;
  except
    //MessageDlg('Este CEP não é válido. Se não souber o CEP deixe o campo em branco.',mtInformation,[mbOK],0);
  end;
end;
{*******************************************************************************}
procedure Limpa_Grid(Grid:TStringGrid);
var
  l,c,Lauxi : integer;
begin
  With Grid do begin
    for l := 1 to RowCount-1 do
      Rows[l].Clear;
    RowCount := 2;
  end;
  grid.Refresh;
  Application.ProcessMessages;
{  With Grid do begin
    if Row = RowCount -1 then begin  // limpa quando a grid tem só uma linha
      for C := 0 to ColCount do
        Cells[C,Row] := '';
    end else begin
      for C := 1 to ColCount do
        Cells[C,Row] := '';
      Lauxi := Row;
      for L := Lauxi to RowCount -1 do begin
        for C := 0 to ColCount do
          Cells[C,Row] := Cells[C,Row + 1];
        if Row < Rowcount -1 then
          Row := Row + 1;
      end;
    end;
    Row := 1;
    For L:= Row to RowCount -1 do begin
      if Cells[0,L] = '' then begin
        Row := L;
        Break;
      end;
    end;
    for L := 1 to RowCount -1 do
      for C := 0 to ColCount do
        Cells[C,L] := '';
    RowCount := 2;
  end;
  Application.ProcessMessages;}
end;

function SoNumeros(Const Texto:String):String;
//
// Remove caracteres de uma string deixando apenas numeros
//
var
 I: integer;
 S: string;
begin
  S := '';
  for I := 1 To Length(Texto) Do begin
    if (Texto[I] in ['0'..'9']) then begin
       S := S + Copy(Texto, I, 1);
    end;
  end;
  result := S;
end;

Function Maiuscula(St:char):char;
var a:integer;
begin
  for a:=1 to 1 do
    if(St in['a'..'z'])or(St in['à'..'ý'])then Dec(St,32);
  Result:=St;
end;


function Minuscula(St:char):char;
var a:integer;
begin
  for a:=1 to 1 do
  if(St in['A'..'Z'])or(St in['À'..'Ý'])then Inc(St,32);
  Result:=St;
end;

function calculaDV(Numero : String) : String;
var
 i,j,k  : integer;
 soma   : integer;
 Digito : integer;
begin
 result := numero;
 //calcula duas vezes
 k    := 2;
 Soma := 0;
 for i := length(Result) downto 1 do
 begin
   //converte p digito para numérico, multiplica e soma
   Soma := Soma + StrToint(Result[i])*k;
   Inc(k);
   if (k > 9) then
     K := 2
 end;
 digito := 11 - Soma Mod 11;
 if (digito <= 1) or (digito >= 10) then
   digito := 1;
 //adiciona o digito ao resultado
 result := IntToStr(digito);
end;


function Capitular(palavra:string):STRING;
var
  x : string;
  i : integer;
begin
  x := palavra; // passo o nome da cidade para a variavel para ser capitulado(1º letra maiuscula)
  for i:=1 to length(x) do begin
    if (i = 1) then
      x[i] := Maiuscula(x[i])
    else if (x[i-1] = ' ') and (x[i] <> 'd') then
      x[i] := Maiuscula(x[i])
    else if (x[i-1] = '''')then begin
      x[i] := Maiuscula(x[i]);
      x[i-2] := Minuscula(x[i-2]);
    end
    else if x[i] <> ' ' then
      x[i] := Minuscula(x[i]);
  end;
  result := x;
end;


Function IEok(sInscricao, sEstado: String): Boolean;
Var iBaseFm, iBaseDV: ShortInt;
    iFormula, iFormulas: ShortInt;
    iDigito, iDigitoCalc, iDigitos, iDigitoVer, iDigitosVer, iDigitoPos: ShortInt;
    iPosicao, iPosicao2: ShortInt;
    iSoma: Integer;
    sProduto: string;
    iResto: ShortInt;
    iModulo: ShortInt;
    sModuloSubtrair: string;
    sInscr, sInscrBA: string;
    sPadrao, sPadrao9: string;
    sPeso, sPesos: string;
    lRetorno: Boolean;

Begin
  if sEstado = 'AL' then begin
    Result := True;
    exit;
  end;
  // PADRAO PARA ALGUNS ESTADOS
  sPadrao9 := '1-09-1/09-11-29-S';

  // VALOR PARA RETORNO
  lRetorno := True;

  try

    // TIRA EVENTUAIS CARACTERES NAO NUMERICOS
    sInscr := '';
    For iPosicao := 1 to Length(sInscricao) do
      if Pos(Copy(sInscricao,iPosicao,1),'0123456789') <> 0 then
        sInscr := sInscr + Copy(sInscricao,iPosicao,1);

    // SITUACOES ESPECIAIS -> 'BA'
    sInscrBA := sInscr;

                                   // ---------------------
                                   // PADRAO PARA O CALCULO
                                   // ---------------------
                                   // FOI ADOTADA A NOMENCLATURA HEXADECIMAL PARA OS PESOS
                                   // QUER DIZER QUE A=1O E B=11
                                   //
                                   //  +-> NUMERO DE FORMULAS DE CALCULO
                                   //  |  +-> NUMERO DE DIGITOS DA INSCRICAO ESTADUAL
                                   //  |  | +-> NUMERO DE DIGITOS VERIFICADORES
                                   //  |  | |  +-> POSICAO DO 1o DIGITO VERIFICADOR
                                   //  |  | |  |  +-> MODULO PARA O CALCULO DO 1o DIGITO VERIFICADOR
                                   //  |  | |  |  |  +-> PESOS PARA O 1o DIGITO, SE '00' DIFERENCIADO
                                   //  |  | |  |  |  | +-> SUBTRAIR RESTO DO MODULO S/N?
                                   //  |  | |  |  |  | |  +-> POSICAO DO 2 DIGITO VERIFICADOR
                                   //  |  | |  |  |  | |  |  +-> MODULO PARA CALCULO DO 2o DIGITO VERIFICADOR
                                   //  |  | |  |  |  | |  |  |  +-> PESOS PARA O 2o DIGITO, SE '00' DIFERENCIADO
                                   //  |  | |  |  |  | |  |  |  | +-> SUBTRAIR RESTO DO MODULO?
                                   //  |  | |  |  |  | |  |  |  | | +-> SEGUNDA FORMULA DE CALCULO
                                   //  |  | |  |  |  | |  |  |  | | |->
                                   // '1-12-1/12-12-12-A/12-12-12-A|1-12-1/12-12-12-1/12-12-12-1'
    if sEstado = 'AC' then sPadrao := '1-13-2/12-11-29-S/13-11-29-S';
    if sEstado = 'AL' then sPadrao := '1-09-1/09-11-29-N';
    if sEstado = 'AM' then sPadrao := sPadrao9;
    if sEstado = 'AP' then sPadrao := sPadrao9;
    if sEstado = 'BA' then sPadrao := '2-08-2/07-10-29-S/08-10-29-S|2-08-2/07-11-29-S/08-11-29-S';
    if sEstado = 'CE' then sPadrao := sPadrao9;
    if sEstado = 'DF' then sPadrao := '1-13-2/12-11-29-S/13-11-29-S';
    if sEstado = 'ES' then sPadrao := sPadrao9;
    if sEstado = 'GO' then sPadrao := sPadrao9;
    if sEstado = 'MA' then sPadrao := sPadrao9;
    if sEstado = 'MG' then sPadrao := '1-13-2/12-10-00-S/13-11-00-S';
    if sEstado = 'MS' then sPadrao := sPadrao9;
    if sEstado = 'MT' then sPadrao := '1-11-1/11-11-29-S';
    if sEstado = 'PA' then sPadrao := sPadrao9;
    if sEstado = 'PB' then sPadrao := sPadrao9;
    if sEstado = 'PE' then sPadrao := '1-14-1/14-11-00-S';
    if sEstado = 'PI' then sPadrao := sPadrao9;
    if sEstado = 'PR' then sPadrao := '1-10-2/09-11-27-S/10-11-27-S';
    if sEstado = 'RJ' then sPadrao := '1-08-1/08-11-27-S';
    if sEstado = 'RN' then sPadrao := '1-09-1/09-11-29-N';
    if sEstado = 'RO' then sPadrao := '2-09-1/09-11-00-S/  -  -  - |2-14-1/14-11-29-S';
    if sEstado = 'RR' then sPadrao := '1-09-1/09-09-81-N';
    if sEstado = 'RS' then sPadrao := '1-10-1/10-11-29-S';
    if sEstado = 'SC' then sPadrao := sPadrao9;
    if sEstado = 'SE' then sPadrao := sPadrao9;
    if sEstado = 'SP' then sPadrao := '1-12-2/09-11-00-N/12-11-00-N';
    if sEstado = 'TO' then sPadrao := '1-11-1/11-11-00-S';

    // NUMERO DE FORMULAS DE CALCULO
    iFormulas := StrToInt(Copy(sPadrao,1,1));

    // CONTROLE DAS FORMULAS DE CALCULO
    for iFormula := 1 to iFormulas do
    begin

      // VALOR PARA RETORNO
      lRetorno := True;

      // BASE PARA POSICIONAMENTO NA FORMULA
      iBaseFm := (iFormula-1)*29;

      // SITUACOES ESPECIAIS -> 'BA'
      if (sEstado = 'BA') then
      begin
        if Pos(Copy(sInscricao,1,1),'0123458') <> 0 then
          iBaseFm := 0
        else
          iBaseFm := 29;
      end;

      // SITUACOES ESPECIAIS -> 'RO'
      if (sEstado = 'RO') and (iFormula = 1) and (lRetorno = False) then
        lRetorno := True;

      // NUMERO DE DIGITOS NA INSCRICAO
      iDigitos := StrToInt(Copy(sPadrao,iBaseFm+3,2));

      // NUMERO DE DIGITOS VERIFICADORES
      iDigitosVer := StrToInt(Copy(sPadrao,iBaseFm+6,1));

      // DEIXA INSCRICAO COM NUMERO DE CARACTERES DEVIDOS
      sInscr := '00000000000000'+sInscr;
      sInscr := Copy(sInscr,(Length(sInscr)-iDigitos)+1,iDigitos);

      // CONTROLE DE DIGITOS VERIFICADORES
      for iDigitoVer := 1 to iDigitosVer do
      begin

        // BASE PARA POSICIONAMENTO NOS DADOS DO DIGITO VERIFICADOR
        if iDigitoVer = 1 then
          iBaseDV := 8
        else
          iBaseDV :=19;

        // POSICAO DO DIGITO VERIFICADOR
        iDigitoPos := StrToInt(Copy(sPadrao,iBaseFm+iBaseDV,2));
        // VALOR DO MODULO PARA CALCULO
        iModulo := StrToInt(Copy(sPadrao,iBaseFm+iBaseDV+3,2));
        // PESO PARA CALCULO
        sPeso := Copy(sPadrao,iBaseFm+iBaseDV+6,2);
        // FLAG DE SUBTRACAO DO RESTO PELO MODUTO
        sModuloSubtrair := Copy(sPadrao,iBaseFm+iBaseDV+9,1);

        // DEFINICAO DOS PESOS A SEREM UTILIZADOS
        if sPeso = '27' then
          sPesos := Copy('5432765432765432',18-iDigitoPos,iDigitoPos-1)
        else if sPeso = '29' then
          sPesos := Copy('9876543298765432',18-iDigitoPos,iDigitoPos-1)
        else if sPeso = '81' then
          sPesos := Copy('1234567812345678',18-iDigitoPos,iDigitoPos-1)
        else if (sPeso = '00') and (sEstado = 'MG') and (iDigitoVer = 1) then
          sPesos := '12112121212'
        else if (sPeso = '00') and (sEstado = 'MG') and (iDigitoVer = 2) then
          sPesos := '32BA98765432'
        else if (sPeso = '00') and (sEstado = 'PE') then
          sPesos := '5432198765432'
        else if (sPeso = '00') and (sEstado = 'RO') then
          sPesos := '00065432'
        else if (sPeso = '00') and (sEstado = 'SP') and (iDigitoVer = 1) then
          sPesos := '1345678A'
        else if (sPeso = '00') and (sEstado = 'SP') and (iDigitoVer = 2) then
          sPesos := '32A98765432'
        else if (sPeso = '00') and (sEstado = 'TO') then
          sPesos := '9800765432';

        // INICIANDO VARIAVEL DE SOMATORIO
        iSoma := 0;

        // SITUACOES ESPECIAIS -> 'AP'
        if sEstado = 'AP' then
        begin
          if (sInscr >= '03000001') and (sInscr <= '03017000') then
            iSoma := 5
          else if (sInscr >= '03017001') and (sInscr <= '03019022') then
            iSoma := 9;
        end;

        // SITUACOES ESPECIAIS -> 'BA'
        if (sEstado = 'BA') then
        begin
          // REALIZANDO CALCULO PARA O 1o ('2o') DIGITO VERIFICADOR
          if iDigitoVer = 1 then
            sInscr := Copy(sInscrBA,1,6) + Copy(sInscrBA,8,1)
          // REALIZANDO CALCULO PARA O 2o ('1o') DIGITO VERIFICADOR
          else
            sInscr := Copy(sInscrBA,1,6) + Copy(sInscrBA,8,1) + Copy(sInscrBA,7,1);
        end;

        // SOMATORIO DOS DIGITOS x OS PESOS
        for iPosicao := 1 to iDigitoPos - 1 do
        begin

          // SITUACOES ESPECIAIS - 'MG'
          if (sEstado = 'MG') and (iDigitoVer = 1) then
          begin
            sProduto := IntToStr(StrToInt(Copy(sInscr,iPosicao,1)) * StrToInt(Copy(sPesos,iPosicao,1)));
            for iPosicao2 := 1 to Length(sProduto) do
              iSoma := iSoma + StrToInt(Copy(sProduto,iPosicao2,1));
          end
          // DEMAIS ESTADOS...
          else
          begin
            // PESO NUMERICO?
            if Pos(Copy(sPesos,iPosicao,1),'0123456789') <> 0 then
              iSoma := iSoma + (StrToInt(Copy(sInscr,iPosicao,1)) * StrToInt(Copy(sPesos,iPosicao,1)))
            // PESO VALENDO A=1O?
            else if Copy(sPesos,iPosicao,1) = 'A' then
              iSoma := iSoma + (StrToInt(Copy(sInscr,iPosicao,1)) * 10)
            // PESO VALENDO B=11...
            else
              iSoma := iSoma + (StrToInt(Copy(sInscr,iPosicao,1)) * 11);
          end;

        end;

        // SITUACOES ESPECIAIS -> 'AL' e 'RN'
        if (sEstado = 'AL') or (sEstado = 'RN') then
          iSoma := iSoma * 10;

        // CALCULA O DIGITO VERIFICADOR
        iDigitoCalc := iSoma mod iModulo;

        // RETIRAR RESTO DO MODULO?
        if sModuloSubtrair = 'S' then
          iDigitoCalc := iModulo - iDigitoCalc;

        // SITUACOES ESPECIAIS -> 'AP'
        if (sEstado = 'AP') and (iDigitoCalc = 11) and (sInscr >= '03017001') and (sInscr <= '03019022') then
          iDigitoCalc := 1
        // SITUACOES ESPECIAIS -> 'GO'
        else if (sEstado = 'GO') and (iDigitoCalc = 10) and (sInscr >= '10103105') and (sInscr <= '10119997') then
          iDigitoCalc := 1
        // SITUACOES ESPECIAIS -> 'RO'
        else if (sEstado = 'RO') and (iDigitoCalc >= 10) then
          iDigitoCalc := iDigitoCalc - 10;

        // DIGITO CALCULADO >= 1O?
        if iDigitoCalc >= 10 then
          iDigitoCalc := 0;

        // DIGITO VERIFICADOR INCORRETO???
        if iDigitoCalc <> StrToInt(Copy(sInscr,iDigitoPos,1)) then
          lRetorno := False;

        // SITUACOES ESPECIAIS -> 'GO'
        if (sEstado = 'GO') and (sInscr = '11094402') and (Pos(Copy(sInscr,iDigitoPos,1),'01') <> 0) then
          lRetorno := True;

      end;

      // ATE AQUI DIGITO(S) CORRETO(S)?, VERIFICA ALGUMAS SITUACOES ESPECIAIS
      if lRetorno then
      begin

        // SITUACOES ESPECIAIS -> 'AL'
        if (sEstado = 'AL') and ((Copy(sInscr,1,2) <> '24') or (Pos(Copy(sInscr,3,1),'03578') = 0)) or
        // SITUACOES ESPECIAIS -> 'AP'
        (sEstado = 'AP') and (Copy(sInscr,1,2) <> '03') or
        // SITUACOES ESPECIAIS -> 'DF'
        (sEstado = 'DF') and (Copy(sInscr,1,2) <> '07') or
        // SITUACOES ESPECIAIS -> 'MA'
        (sEstado = 'MA') and (Copy(sInscr,1,2) <> '12') or
        // SITUACOES ESPECIAIS -> 'MS'
        (sEstado = 'MS') and (Copy(sInscr,1,2) <> '28') or
        // SITUACOES ESPECIAIS -> 'PA'
        (sEstado = 'PA') and (Copy(sInscr,1,2) <> '15') or
        // SITUACOES ESPECIAIS -> 'RR'
        (sEstado = 'RR') and (Copy(sInscr,1,2) <> '24') then
        // SITUACOES ESPECIAIS -> 'SP'
//        (sEstado = 'SP') and (Copy(sInscricao,1,1) <> 'P') then
          lRetorno := False;
      end;

      // SITUACOES ESPECIAIS -> 'RO'
      if (sEstado = 'RO') and (iFormula = 1) and lRetorno then
        Break;

    end;

  Except on EConvertError do
    lRetorno := False;

  end;

  // RESULTADO DO CALCULO
  Result := lRetorno;

end;



{******************************************************************************}
{ Alinha texto a direita no MaskEdit }
Function AlinharDireitaMsk(Edit :TMaskEdit) : String;
var Tam,i : Integer;
    Texto, espaco : String;
Begin
  edit.EditMask := '';
  Texto := Edit.Text;
  if (copy(Texto,0,1) = ' ')then AlinharDireitaMsk := Trim(Texto)
  else begin
    Tam := Edit.MaxLength;
    For i := 1 to (Tam - length(Trim(Texto))) do
      if (length(espaco) + length(Trim(texto))) <= 14 then  espaco := espaco + ' ';
    AlinharDireitaMsk := espaco + Trim(Texto);
  end;
  edit.EditMask := '!9\.999\.999\.999\.999\-9;0;_';
end;
{******************************************************************************}
Procedure ValidarNumero(Var Key :Char);
Begin
  if not (Key in ['0'..'9',#8,#44,#45,#46]) then begin
    Key := #0;
    MessageBeep ($FFFFFFFF)
  end else begin
    if Key = #46 then Key := #44; // muda o ponto para virgula
  end;
end;

Procedure ValidarNumero(Var Key:Char; texto_atual:string );
  var
  i : integer;
  resultado : string;
  existe_virgula : boolean;
Begin
  if key = #22 then // COLAR (CTRL + V)
  begin
    if Clipboard.HasFormat(CF_TEXT) then
    begin
      resultado := '';
      existe_virgula := false;
      for i := 1 to length(Clipboard.AsText) do
          if (Clipboard.AsText[i] >= '0') and (Clipboard.AsText[i] <= '9')
             or ((i = 1) and (Clipboard.AsText[i] = '-'))
             or ((Clipboard.AsText[i] = ',') and not(existe_virgula))
          then
          begin
            resultado := resultado + Clipboard.AsText[i];
            if Clipboard.AsText[i] = ',' then
               existe_virgula := True;
          end;
      Clipboard.AsText := resultado;
    end;
  end
  else
  if not (Key in ['0'..'9',#8,#44,#45,#46]) then
  begin
    Key := #0;
    MessageBeep ($FFFFFFFF);
  end
  else
  begin
    if length(texto_atual) > 0 then
    begin
      if (key = #45) then              // não permite adicionar o sinal negativo no meio do número
          key := #0
      else
      if (key = #44) or (key = #46) then // não permite adicionar mais de uma vírgula ao número
      begin
        existe_virgula := False;
        for i := 1 to length(texto_atual) do
            if texto_atual[i] = ',' then
               existe_virgula := True;
        if existe_virgula then
           key := #0
        else
        if Key = #46 then // muda o ponto para virgula
           Key := #44;
      end;
    end
    else
    if Key = #46 then  // muda o ponto para virgula
       Key := #44;
  end;
end;

function NomeDoDia(Data : TDateTime): String;
begin
  case DayOfWeek(Data) of
    1: Result := 'domingo';
    2: Result := 'segunda';
    3: Result := 'terca';
    4: Result := 'quarta';
    5: Result := 'quinta';
    6: Result := 'sexta';
    7: Result := 'sabado';
  end;
//  result := GetEnumName(TypeInfo(TDia), DayofTheWeek(Data));
end;

function pubNomeComputador : string;
const
   MAX_COMPUTER_LENGTH = 30;
var
   pNome : PChar;
   len : DWord;
begin
   try
      len := MAX_COMPUTER_LENGTH + 1;
      GetMem(pNome, len);
      if GetComputerName(pNome, len) then
         Result := pNome
      else
         Result := 'Não foi possível obter o nome deste computador!';
   finally
      FreeMem(pNome, len);
   end;
end;


{******************************************************************************}
Procedure ValidarInteiro(Var Key :Char);
Begin
  if not (Key in ['0'..'9',#8]) then begin
    Key := #0;
    MessageBeep ($FFFFFFFF)
  end;
end;

Function SerialNum :String;
Var
  Serial:DWord;
  DirLen,Flags: DWord;
  DLabel : Array[0..11] of Char;
begin
  Try
    GetVolumeInformation(PChar('C:\'),dLabel,12,@Serial,DirLen,Flags,nil,0);
    Result := IntToStr(Serial);
    //Result := IntToHex(Serial,8); // em hexadecimal
  Except
    Result :='';
  end;
end;

function SubstituiTexto(StrInicial,StrProcura : String) :  String;
var
  PosAtu : Integer;
begin
  PosAtu := Pos(StrProcura,StrInicial);
  while PosAtu <> 0 do begin
    Delete(StrInicial,PosAtu,Length(StrProcura));
    PosAtu := Pos(StrProcura,StrInicial);
  end;
  Result := StrInicial;
end;

function RemoveChar(Const Texto:String):String;
var
 I : integer;
 S : string;
begin
  S := '';
  for I := 1 To Length(Texto) Do begin
    if (Texto[I] in ['0'..'9','.',',']) then begin
      S := S + Copy(Texto, I, 1);
    end;
  end;
  result := S;
end;

function VirgPonto(Valor: string): String;
Var
  i: Integer;
begin
  if Valor <> ' ' then begin
     for i := 0 to Length(Valor) do begin
       if Valor[i]='.' then
          Valor[i]:=',';
     end;
   end;
   Result := valor;
end;

// rotina de cálculo do CNPJ e CPF
// entrada - número em formato String
// saída - número com dígito de verificação
// a rotina testa se é CNPJ ou CPF pelo número de dígitos - se for 9 e CPF, se 12, CNPJ
function CalculaCnpjCpf(Numero : String) : String;
var
  i,j,k : Integer;
  Soma : Integer;
  Digito : Integer;
  CNPJ : Boolean;
begin
  case Length(Numero) of
    9 : CNPJ := False;
    12 : CNPJ := True;
    else raise Exception.Create('Número inválido');
  end;
  Result := Numero;
  for j := 1 to 2 do begin
    k := 2;
    Soma := 0;
    for i := Length(Result) downto 1 do begin
      Soma := Soma + (Ord(Result[i])-Ord('0'))*k;
      Inc(k);
      if (k > 9) and CNPJ then
        k := 2;
    end;
    Digito := 11 - Soma mod 11;
    if Digito >= 10 then
      Digito := 0;
    Result := Result + Chr(Digito + Ord('0'));
  end;
end;


{******************************************************************************}
function ConverteHora(Hora :TDateTime) : String;
var
 Hor, Min, Seg, Mseg : Word;
begin
 try
  DecodeTime (Hora,Hor,Min,Seg,mSeg);
  if (Min <= 9) and (Seg <= 9) then
   ConverteHora := InttoStr(Hor) + ':0' + InttoStr(Min) + ':0' + InttoStr(Seg);
  if (Min <= 9) and (Seg > 9) then
    ConverteHora := InttoStr(Hor) + ':0' + InttoStr(Min) + ':' + InttoStr(Seg);
  if (Min >= 9) and (Seg <= 9) then
    ConverteHora := InttoStr(Hor) + ':' + InttoStr(Min) + ':0' + InttoStr(Seg);
 except
   on E: Exception do
     ShowMessage('Hora Inválida!');
 end;
end;

{******************************************************************************}
function MontaComboListBool( Query     :TQuery;
                             ComboList :TWinControl
                           )                          :boolean;
begin
  Result := true;
  if (ComboList is TComboBox) then
    (ComboList as TComboBox).Items.Clear;
  if (ComboList is TListBox) then
    (ComboList as TListBox).Items.Clear;
  if (ComboList is TCheckListBox) then
    (ComboList as TCheckListBox).Items.Clear;
  with Query do begin
    Open;
    if Query.RecordCount = 0 then
      Result := false
    else begin
      while not EOF do begin
        if (ComboList is TComboBox) then
          (ComboList as TComboBox).Items.Add(FieldByName(Fields[0].FieldName).AsString)
        else
          if (ComboList is TListBox) then
            (ComboList as TListBox).Items.Add(FieldByName(Fields[0].FieldName).AsString)
          else
            if (ComboList is TCheckListBox) then
              (ComboList as TCheckListBox).Items.Add(FieldByName(Fields[0].FieldName).AsString);
        Next;
      end;//while not EOF
    end;//else do if Query.RecordCount = 0 then
    Close;
  end;// with Query
end;//
{******************************************************}

function MontaComboListBoolADO( AdoQuery     :TAdoQuery;
                             ComboList :TWinControl
                           )                          :boolean;
begin
  Result := true;
  if (ComboList is TComboBox) then
    (ComboList as TComboBox).Items.Clear;
  if (ComboList is TListBox) then
    (ComboList as TListBox).Items.Clear;
  if (ComboList is TCheckListBox) then
    (ComboList as TCheckListBox).Items.Clear;
  with AdoQuery do begin
    Open;
    if AdoQuery.RecordCount = 0 then
      Result := false
    else begin
      while not EOF do begin
        if (ComboList is TComboBox) then
          (ComboList as TComboBox).Items.Add(FieldByName(Fields[0].FieldName).AsString)
        else
          if (ComboList is TListBox) then
            (ComboList as TListBox).Items.Add(FieldByName(Fields[0].FieldName).AsString)
          else
            if (ComboList is TCheckListBox) then
              (ComboList as TCheckListBox).Items.Add(FieldByName(Fields[0].FieldName).AsString);
        Next;
      end;//while not EOF
    end;//else do if Query.RecordCount = 0 then
    Close;
  end;// with Query
end;//
{******************************************************}

function MontaComboListBoolADOSP( AdoStoredProc     :TAdoStoredProc;
                             ComboList :TWinControl
                           )                          :boolean;
begin
  Result := true;
  if (ComboList is TComboBox) then
    (ComboList as TComboBox).Items.Clear;
  if (ComboList is TListBox) then
    (ComboList as TListBox).Items.Clear;
  if (ComboList is TCheckListBox) then
    (ComboList as TCheckListBox).Items.Clear;
  with AdoStoredProc do begin
    Open;
    if AdoStoredProc.RecordCount = 0 then
      Result := false
    else begin
      while not EOF do begin
        if (ComboList is TComboBox) then
          (ComboList as TComboBox).Items.Add(FieldByName(Fields[0].FieldName).AsString)
        else
          if (ComboList is TListBox) then
            (ComboList as TListBox).Items.Add(FieldByName(Fields[0].FieldName).AsString)
          else
            if (ComboList is TCheckListBox) then
              (ComboList as TCheckListBox).Items.Add(FieldByName(Fields[0].FieldName).AsString);
        Next;
      end;//while not EOF
    end;//else do if AdoStoredProc.RecordCount = 0 then
    Close;
  end;// with AdoStoredProc
end;//
{******************************************************}

function MontaComboListADO( ADOQuery  :TADOQuery;
                            ComboList :TWinControl ) : boolean;
begin
  Result := true;
  if (ComboList is TComboBox) then
    (ComboList as TComboBox).Items.Clear;
  if (ComboList is TListBox) then
    (ComboList as TListBox).Items.Clear;
  if (ComboList is TCheckListBox) then
    (ComboList as TCheckListBox).Items.Clear;
  with ADOQuery do begin
    Open;
    if ADOQuery.RecordCount = 0 then
      Result := false
    else begin
      while not EOF do begin
        if (ComboList is TComboBox) then
          (ComboList as TComboBox).Items.Add(FieldByName(Fields[0].FieldName).AsString)
        else
          if (ComboList is TListBox) then
            (ComboList as TListBox).Items.Add(FieldByName(Fields[0].FieldName).AsString)
          else
            if (ComboList is TCheckListBox) then
              (ComboList as TCheckListBox).Items.Add(FieldByName(Fields[0].FieldName).AsString);
        Next;
      end;//while not EOF
    end;//else do if Query.RecordCount = 0 then
    Close;
  end;// with Query
end;//

{******************************************************************************}
function RefreshComboList( qryComboList :TQuery;
                           ComboList :TWinControl;
                           sbRefresh :TSpeedButton) :boolean;
var
  ItemAntigoComboList :string;
begin
  if ComboList is TComboBox then begin
    ItemAntigoComboList := (ComboList as TComboBox).Text;
    Result := MontaComboListBool(qryComboList,ComboList);
    //sbRefresh.Enabled := ((ComboList as TComboBox).Items.Count <> 0);
    if ItemAntigoComboList <> '' then begin
      (ComboList as TComboBox).ItemIndex := ProcuraItemComboList(ComboList,ItemAntigoComboList);
      if (ComboList as TComboBox).ItemIndex = -1 then
        messagedlg('O item '+ItemAntigoComboList+' não está mais cadastrado!', mtError, [mbOk],0);
    end;
  end else
    if ComboList is TListBox then begin
      ItemAntigoComboList := (ComboList as TListBox).Items[(ComboList as TListBox).ItemIndex];
      Result := MontaComboListBool(qryComboList,ComboList);
      //sbRefresh.Enabled := ((ComboList as TListBox).Items.Count <> 0);
      (ComboList as TListBox).ItemIndex := ProcuraItemComboList(ComboList,ItemAntigoComboList);
      if (ComboList as TListBox).ItemIndex = -1 then
        messagedlg('O item '+ItemAntigoComboList+' não está mais cadastrado!', mtError, [mbOk],0);
    end else begin
        ShowMessage('O método RefreshComboList só aceita TComboBox e TListBox');
        Result := false;
    end;
end;

{*******************************************************}
function PreencheComSpace(texto1:string ; tamanho:integer) : String;
var
  i : integer;
begin
  result := Texto1;
  for i := 1 to tamanho - Length(Texto1) do Result := Result + ' ';
end;

{*******************************************************}

function PreencheComZeros(numero:real ; digitos:integer) : String;
var
  i : integer;
begin
  result := FloatToStr(numero);
  for i := Length(Result) to digitos -1 do Result := '0'+Result;
end;

{******************************************************}
procedure MontaComboList( Query     :TQuery;
                          ComboList :TWinControl;
                          Mensagem  :String;
                          NomeCampo :String
                        );
begin
  with Query do begin
    Open;
    if Query.RecordCount = 0 then
      MessageDlg(Mensagem, mtWarning, [mbOk],0)
    else begin
      if (ComboList is TComboBox) then
        (ComboList as TComboBox).Items.Clear
      else
        if (ComboList is TListBox) then
          (ComboList as TListBox).Items.Clear;
      while not EOF do begin
        if (ComboList is TComboBox) then
          (ComboList as TComboBox).Items.Add(FieldByName(NomeCampo).AsString)
        else
          if (ComboList is TListBox) then
            (ComboList as TListBox).Items.Add(FieldByName(NomeCampo).AsString);
        Next;
      end;//while not EOF
    end;//else do if Query.RecordCount = 0 then
    Close;
  end;// with Query
end;//

function PegaDataDoExecutavel(Arquivo: String) :TDateTime;
begin
  try
    Result := FileDateToDateTime(FileAge(Arquivo));
  except
    Result := StrToDate('01/01/1999');
  end;
end;


  {--------Funcao--Criptografar------- }
function EncriptStr(Texto: String):String;
const
  Masc=15;
var
  r : string;
  i : integer;
begin
   For i := 1 to Length(texto) do
     r := r + chr(Ord(Texto[i]) + i + Masc);
   result:= r;
end;

   {--------Funcao--Descriptografar------- }
function DesencriptStr(Texto: String):String;
const
  Masc=15;
var
  w : string;
  i : integer;
begin
   FOR i := 1 TO Length(texto) do
     w := w + chr( Ord(texto[i]) - i - Masc );
   result:= w;
end;


{******************************************************}
procedure MontaComboStringList( Query     :TQuery;
                                ComboList :TWinControl;
                                Mensagem  :String;
                                NomeCampo :String;
                                NomeCodigo: String;
                                StrList   : TStringList
                        );
begin
  with Query do begin
    Open;
    if Query.RecordCount = 0 then
      MessageDlg(Mensagem, mtWarning, [mbOk],0)
    else begin
      if (ComboList is TComboBox) then
        (ComboList as TComboBox).Items.Clear
      else
        if (ComboList is TListBox) then
          (ComboList as TListBox).Items.Clear;
      while not EOF do begin
        if (ComboList is TComboBox) then begin
          (ComboList as TComboBox).Items.Add(FieldByName(NomeCampo).AsString);
          StrList.Add(FieldByName(NomeCodigo).asstring);
        end else
          if (ComboList is TListBox) then begin
            (ComboList as TListBox).Items.Add(FieldByName(NomeCampo).AsString);
            StrList.Add(FieldByName(NomeCodigo).asstring);
          end;
        Next;
      end;//while
    end;//else do if Query.RecordCount = 0 then
    Close;
  end;// Query
end;//

{********************************************}
function ProcuraItemComboList( ComboList     :TWinControl;
                               ItemDesejado :String) : integer;
var
  Item  :string;
begin
  Result := 0;
  if (ComboList is TComboBox) then
    with (ComboList as TComboBox) do begin
      Item         := uppercase(Items[Result]);
      ItemDesejado := Uppercase(ItemDesejado);
      while (Result < Items.Count) and (Item <> ItemDesejado) do begin
        Inc(Result);
        Item    := uppercase(Items[Result]);
      end;
      if ((Result = Items.Count) and (Item <> ItemDesejado)) then
        Result := -1; //Não encontrou o item desejado na combobox
    end else //with
    if (ComboList is TlistBox) then
      with (ComboList as TListBox) do begin
        Item         := uppercase(Items[Result]);
        ItemDesejado := Uppercase(ItemDesejado);
        while (Result < Items.Count) and (Item <> ItemDesejado) do begin
          Inc(Result);
          Item    := uppercase(Items[Result]);
        end;
        if ((Result = Items.Count) and (Item <> ItemDesejado)) then
          Result := -1; //Não encontrou o item desejado na combobox
      end else//with
      MessageDlg('Parâmetro ComboList de tipo errado', mtError, [mbOk],0);
end;

{*********************************************************}
procedure LimpaTodosCampos(WinControl :TWinControl);
var
  Cont :integer;
begin
  with WinControl do
    for Cont := 0 to ControlCount-1 do
      if (Controls[Cont] is TMaskEdit) then
        (Controls[Cont] as TMaskEdit).Clear
      else
        if (Controls[Cont] is TMemo) then
          (Controls[Cont] as TMemo).Clear
        else
          if (Controls[Cont] is TEdit) then
            (Controls[Cont] as TEdit).Clear
          else
            if (Controls[Cont] is TCustomComboBox) then
              (Controls[Cont] as TCustomComboBox).ItemIndex := -1
            else
              if (Controls[Cont] is TCustomListBox) then
                (Controls[Cont] as TCustomListBox).ItemIndex := -1
              else
                if (Controls[Cont] is TImage) then
                  (Controls[Cont] as TImage).Picture.LoadFromFile('')
                else
                  if (Controls[Cont] is TRadioButton) then
                    (Controls[Cont] as TRadioButton).Checked := False
                else
                  if (Controls[Cont] is TCheckBox) then
                    (Controls[Cont] as TCheckBox).Checked := False;

end;

{************************************************************}
function TodosCamposVazios(WinControl :TWinControl) :boolean;
var
  Cont :integer;
begin
  Result := true;
  with WinControl do
    for Cont := 0 to ControlCount-1 do
      if ( (Controls[Cont] is TCustomEdit) ) then begin
        if (Controls[Cont] as TCustomEdit).Text <> '' then
        begin
          Result := false;
          Break;
        end;
      end else
        if (Controls[Cont] is TCustomComboBox) then begin
          if (Controls[Cont] as TCustomComboBox).ItemIndex <> -1 then begin
            Result := false;
            Break;
          end;
        end else
          if (Controls[Cont] is TCustomListBox) then begin
            if (Controls[Cont] as TCustomListBox).ItemIndex <> -1 then begin
              Result := false;
              Break;
            end;
          end;
end;

{********************************************************}
Procedure TeclaNumerica(var Key :Char);
begin
  if not (Key in ['0'..'9',#8,#13,#27]) then
    Key := #0;
end;

Procedure TeclaNaoNumerica(var Key :Char);
begin
  if (Key in ['0'..'9']) then
    Key := #0;
end;


{******************************************************************************}
function CPFValido(StrCPF :string ) :boolean;
var
  nSm  :integer;
  nDv  :integer;
begin
  Result := true;
  if ((StrCPF <> '') and (Length(StrCPF )= 11) ) then begin
    nSm := StrToInt(Copy(StrCPF,1,1))*10+
           StrToInt(Copy(StrCPF,2,1))*9+
           StrToInt(Copy(StrCPF,3,1))*8+
           StrToInt(Copy(StrCPF,4,1))*7+
           StrToInt(Copy(StrCPF,5,1))*6+
           StrToInt(Copy(StrCPF,6,1))*5+
           StrToInt(Copy(StrCPF,7,1))*4+
           StrToInt(Copy(StrCPF,8,1))*3+
           StrToInt(Copy(StrCPF,9,1))*2;
      //nDv:=11 - (nSm % 11)
    nDv := 11 - (nSm mod 11);
    if (
         ( nDv = StrToInt( Copy(StrCPF,10,1) ) ) OR
         ( Copy(StrCPF,10,1) = '0' ) AND
         ( (nDv = 10) OR
           (nDv = 11)
         )
       ) then begin
      nSm := StrToInt(Copy(StrCPF,1,1))*11+
             StrToInt(Copy(StrCPF,2,1))*10+
             StrToInt(Copy(StrCPF,3,1))*9+
             StrToInt(Copy(StrCPF,4,1))*8+
             StrToInt(Copy(StrCPF,5,1))*7+
             StrToInt(Copy(StrCPF,6,1))*6+
             StrToInt(Copy(StrCPF,7,1))*5+
             StrToInt(Copy(StrCPF,8,1))*4+
             StrToInt(Copy(StrCPF,9,1))*3+
             StrToInt(Copy(StrCPF,10,1))*2;
           //nDv := 11 - (nSm % 11);
      nDv := 11 - (nSm mod 11);
      if not(
           (nDv = StrToInt( Copy(StrCPF,11,1) )) OR
           (Copy(StrCPF,11,1) = '0') AND
           (nDv > 9)
         ) then
         Result := false
      else
        ;
    end else
      Result := false;
  end else
    Result := false;
  end;

  {******************************************************************************}
  function CGCValido(StrCGC :String) :boolean;
  var
    nSm,
    nDv  :integer;
  begin
    Result := true;
    if (not (StrCGC = '')) and (Length(StrCGC) = 14) then begin
      nSm := StrToInt(Copy(StrCGC,1,1))*5+
             StrToInt(Copy(StrCGC,2,1))*4+
             StrToInt(Copy(StrCGC,3,1))*3+
             StrToInt(Copy(StrCGC,4,1))*2+
             StrToInt(Copy(StrCGC,5,1))*9+
             StrToInt(Copy(StrCGC,6,1))*8+
             StrToInt(Copy(StrCGC,7,1))*7+
             StrToInt(Copy(StrCGC,8,1))*6+
             StrToInt(Copy(StrCGC,9,1))*5+
             StrToInt(Copy(StrCGC,10,1))*4+
             StrToInt(Copy(StrCGC,11,1))*3+
             StrToInt(Copy(StrCGC,12,1))*2;
      nDv := 11 - (nSm mod 11);
      if (
           ( nDv = StrToInt( Copy(StrCGC,13,1) ) ) OR
           ( Copy(StrCGC,13,1) = '0') AND
           (nDv > 9)
         ) then begin
        nSm := StrToInt(Copy(StrCGC,1,1))*6+
               StrToInt(Copy(StrCGC,2,1))*5+
               StrToInt(Copy(StrCGC,3,1))*4+
               StrToInt(Copy(StrCGC,4,1))*3+
               StrToInt(Copy(StrCGC,5,1))*2+
               StrToInt(Copy(StrCGC,6,1))*9+
               StrToInt(Copy(StrCGC,7,1))*8+
               StrToInt(Copy(StrCGC,8,1))*7+
               StrToInt(Copy(StrCGC,9,1))*6+
               StrToInt(Copy(StrCGC,10,1))*5+
               StrToInt(Copy(StrCGC,11,1))*4+
               StrToInt(Copy(StrCGC,12,1))*3+
               StrToInt(Copy(StrCGC,13,1))*2;
        nDv := 11 - (nSm mod 11);
        if (
             ( not (nDv = StrToInt( Copy(StrCGC,14,1) ))) OR
             ( Copy(StrCGC,14,1) = '0' ) AND
             (nDv > 9)
           ) then
           Result := false;
      end else
        Result := false;
    end;
  end;

  {*******************************************************************}
function CamposObrigatoriosPreenchidos(WinControl :TWinControl) : boolean;
var
  Cont  : integer;
begin
Result := true;
with WinControl do
  for Cont := 0 to ControlCount-1 do
    if (Controls[Cont] is TEdit) then begin
    if ((Controls[Cont] as TEdit).ImeMode = imOpen) then
      if ((Controls[Cont] as TEdit).text = '') then begin
        MessageDlg('Você não preencheu os campos obrigatórios!',mtWarning,[mbOK],0);
        (Controls[Cont] as TEdit).setfocus;
        Result := false;
        break;
      end;
    end else //if (Controls[Cont] is TEdit) then
      if (Controls[Cont] is TMaskEdit) then begin
      if ((Controls[Cont] as TMaskEdit).ImeMode = imOpen) then
        if ((Controls[Cont] as TMaskEdit).text = '') then begin
          MessageDlg('Você não preencheu os campos obrigatórios!',mtWarning,[mbOK],0);
          (Controls[Cont] as TMaskEdit).setfocus;
          Result := false;
          break;
        end;
      end else //if (Controls[Cont] is TMaskEdit) then
        if (Controls[Cont] is TMemo) then begin
        if ((Controls[Cont] as TMemo).ImeMode = imOpen) then
          if ((Controls[Cont] as TMemo).text = '') then begin
            MessageDlg('Você não preencheu os campos obrigatórios!',mtWarning,[mbOK],0);
            (Controls[Cont] as TMemo).setfocus;
            Result := false;
            break;
          end;
        end else //if (Controls[Cont] is TMemo) then
          if (Controls[Cont] is TComboBox) then begin
          if ((Controls[Cont] as TComboBox).imemode = imOpen) then
            if (Controls[Cont] as TComboBox).text = ''  then begin
              MessageDlg('Você não preencheu os campos obrigatórios!',mtWarning,[mbOK],0);
              (Controls[Cont] as TComboBox).setfocus;
              Result := false;
              break;
            end;
          end else //if (Controls[Cont] is TComboBox) then
            if (Controls[Cont] is TListBox) then begin
            if ((Controls[Cont] as TListBox).imemode = imOpen) then
              if (Controls[Cont] as TListBox).ItemIndex = -1  then begin
                MessageDlg('Você não preencheu os campos obrigatórios!',mtWarning,[mbOK],0);
                (Controls[Cont] as TListBox).setfocus;
                Result := false;
                break;
              end;
            end; //if (Controls[Cont] is TListBox) then
end;

function SENHA(vsenha: String; vtipo : String) : String;
var
 vsen : String[6];
 vvalor, I, Qtd : Integer;
begin
 // Valor para acréscimo no valor ascii
 vvalor := 150;
 // Loop até quantidade de números digitados
 for I := 1 to Length(vsenha) do begin
  if vtipo = 'C' then begin// Se opção = criptografar
    if I = 1 then vsen := Chr(Ord(vsenha[I]) + vvalor)
    else vsen := vsen + Chr(Ord(vsenha[I]) + vvalor);
  end else begin // if 'C'
    if I = 1 then vsen := Chr(Ord(vsenha[I]) - vvalor)
    else vsen := vsen + Chr(Ord(vsenha[I]) - vvalor);
  end;
  // incrementa fator de variação do caracter
  Inc (vvalor);
 end; // for
 // Move a senha criptografada para a variável
 senha := vsen;
end;

//function PERMISSAO(vTag: String; vColuna : String; exibirMsgAcessoNegado:Boolean=True) : String;
//var
// I : Integer;
// vOpcao : Integer; // Opcão passada como parâmetro convertida para forma integer
// vPermissao : String[1]; // variável de permissão S ou N
//begin
// // Não realiza montagem de vetor com opções de acesso de super usuário
// // Coluna 0 = Acesso Total; 2 = Novo; 3 = Altera; 4 = Exclui; 5 = Visualiza; 6 = Imprime
// // 7 = Baixa
// // Atribui a Opção a uma variável integer
// vPermissao := '';
// if vColuna = '0' then vOpcao := 0;
// if vColuna = 'N' then vOpcao := 1;
// if vColuna = 'A' then vOpcao := 2;
// if vColuna = 'E' then vOpcao := 3;
// if vColuna = 'V' then vOpcao := 4;
// if vColuna = 'I' then vOpcao := 5;
// if vColuna = 'B' then vOpcao := 6;
// // Localiza opção no vetor
// for I := 1 to 600 do
// begin // 60 número máximo de opções do menu
//  // Acesso Total na opção
//   case vOpcao of
//    0: if vVetor[I,1] = vTag  then
//          vPermissao := 'S';
//    1: if (vVetor[I,1] = vTag) and (vVetor[I,2] = 'X') then
//          vPermissao := 'S';
//    2: if (vVetor[I,1] = vTag) and (vVetor[I,3] = 'X') then
//          vPermissao := 'S';
//    3: if (vVetor[I,1] = vTag) and (vVetor[I,4] = 'X') then
//          vPermissao := 'S';
//    4: if (vVetor[I,1] = vTag) and (vVetor[I,5] = 'X') then
//          vPermissao := 'S';
//    5: if (vVetor[I,1] = vTag) and (vVetor[I,6] = 'X') then
//          vPermissao := 'S';
//    6: if (vVetor[I,1] = vTag) and (vVetor[I,7] = 'X') then
//          vPermissao := 'S';
//   end; // Case
// end;  // for
// if vPermissao <> 'S' then
// begin
//   vPermissao := 'N';
//   if exibirMsgAcessoNegado then
//      MessageDlg ('Acesso Negado!', mtInformation, [mbOk],0);
// end; // else
// Permissao := vPermissao;
//end;

{****************************************************************}
procedure ValidaTipoNumero(Sender : TObject; Tipo : TNumerico);
{var
   Valor        : LongInt;
   NumeroValido : boolean;}
begin
{  try
    NumeroValido := false;
    if Sender is TEdit then
    begin
      if length((sender as TEdit).text) = 0 then
      begin
        //(sender as TEdit).text := '0';
        MessageDlg('Nenhum valor foi digitado',mtWarning, [mbOK], 0);
        //exit;
      end
      else
      begin
        try
          Valor := strToInt((Sender as TEdit).text);
        except
          MessageDlg('Conteúdo do campo não é um número válido', mtWarning, [mbOk], 0);
          raise;
        end; //try
        case Tipo of
          Smallint :
            if (Valor <= 32767) and (Valor >= -32768) then
              NumeroValido := true
            else
              MessageDlg('Valor deve estar na faixa de -32768 a 32767',mtWarning,[mbOk],0);
          Int :
            if (Valor <= 2147483647) and (Valor >= -2147483647) then
              NumeroValido := true
            else
              MessageDlg('Valor deve estar na faixa de -2147483647 a 2147483647',mtWarning,[mbOk],0);
          Tinyint  :
            if (Valor <= 255) and (Valor >= 0) then
              NumeroValido := true
            else
              MessageDlg('Valor deve estar na faixa de 0 a 255', mtWarning, [mbOk], 0);
        end; //case
      end;
      if not NumeroValido then
        (Sender as TEdit).setfocus;
    end //if Sender is TEdit then
    else
      MessageDlg('A função ''ValidaTipoNumero'' só pode ser utilizada para TEdit',mtWarning,[mbOk],0);
  except
    on E : Exception do
    begin
      // MostrarErro(E);
      (Sender as TEdit).setfocus;
    end;
  end;//try}
end;

function LasDay(data : TDate): TDate;
var d : Tdate;
begin
  d:=strtodate('15/'+formatdatetime('MM/YYYY',data))+30;
  d:=strtodate('01/'+formatdatetime('MM/YYYY',d));
  d:=d-1;
  result := d;
end;

Function Extenso(valor: String) : String;
var
 vExtenso : VetorExtenso; // Vetor
 cCasa1    : String;
 cCasa2    : String;
 cCasa3    : String;
 cCasa4    : String;
 cMilhoes  : String;
 cMilhares : String;
 cUnidades : String;
 cCentavos : String;
begin
  // Atribui valores de extenso
  vExtenso[1] := 'CENTO';
  vExtenso[2] := 'DUZENTOS';
  vExtenso[3] := 'TREZENTOS';
  vExtenso[4] := 'QUATROCENTOS';
  vExtenso[5] := 'QUINHENTOS';
  vExtenso[6] := 'SEISCENTOS';
  vExtenso[7] := 'SETECENTOS';
  vExtenso[8] := 'OITOCENTOS';
  vExtenso[9] := 'NOVECENTOS';
  vExtenso[11] := 'DEZ';
  vExtenso[12] := 'VINTE';
  vExtenso[13] := 'TRINTA';
  vExtenso[14] := 'QUARENTA';
  vExtenso[15] := 'CINQUENTA';
  vExtenso[16] := 'SESSENTA';
  vExtenso[17] := 'SETENTA';
  vExtenso[18] := 'OITENTA';
  vExtenso[19] := 'NOVENTA';
  vExtenso[21] := 'UM';
  vExtenso[22] := 'DOIS';
  vExtenso[23] := 'TRES';
  vExtenso[24] := 'QUATRO';
  vExtenso[25] := 'CINCO';
  vExtenso[26] := 'SEIS';
  vExtenso[27] := 'SETE';
  vExtenso[28] := 'OITO';
  vExtenso[29] := 'NOVE';
  vExtenso[30] := 'DEZ';
  vExtenso[31] := 'ONZE';
  vExtenso[32] := 'DOZE';
  vExtenso[33] := 'TREZE';
  vExtenso[34] := 'QUATORZE';
  vExtenso[35] := 'QUINZE';
  vExtenso[36] := 'DEZESSEIS';
  vExtenso[37] := 'DEZESSETE';
  vExtenso[38] := 'DEZOITO';
  vExtenso[39] := 'DEZENOVE';
  // Atribui valores para variáveis
  cCasa1 := COPY (valor,1,3);
  cCasa2 := COPY (valor,4,3);
  cCasa3 := COPY (valor,7,3);
  cCasa4 := COPY (valor,11,2);
  // Processa extenso de milhões
  cMilhoes := '';
  if (cCasa1 <> '   ') and (cCasa1 <> '000') then begin
   // ****************
   if cCasa1 = '  1' then cMilhoes := 'H'
     else begin
     if cCasa1 = '100' then  cMilhoes := 'CEM'
     else begin
       if COPY(cCasa1, 1, 1) <> ' ' then begin
          cMilhoes := vExtenso[StrtoInt(COPY(cCasa1, 1, 1))];
          if StrtoInt(COPY(cCasa1, 2, 2)) <> 0 then  cMilhoes := cMilhoes + ' E ';
       end;
      end;
    end;
   // ****************
   if StrtoInt(COPY(cCasa1, 2, 2)) <>  0 then begin
    if StrtoInt(COPY(cCasa1, 2, 2)) < 20 then
       cMilhoes := cMilhoes + vExtenso[20 + StrtoInt(COPY(cCasa1, 2, 2))]
    else begin
       cMilhoes := cMilhoes + vExtenso[10 + StrtoInt(COPY(cCasa1, 2, 1))];
       if COPY(cCasa1, 3, 1) <> '0' then begin
         cMilhoes := cMilhoes + ' E ';
         cMilhoes := cMilhoes + vExtenso[20 + StrtoInt(COPY(cCasa1, 3, 1))];
        end;
     end;
   end;
   // ****************
   if COPY(cCasa1, 3, 1) = '1' then  cMilhoes := cMilhoes + ' MILHAO '
   else cMilhoes := cMilhoes + ' MILHOES ';
   // ****************
   if (cCasa2 = '000') and (cCasa3 = '000') then cMilhoes := cMilhoes + 'DE REAIS';
   // ****************
  end; // fim do processa milhões

  // Processa extenso de milhares
  cMilhares := '';
  if (cCasa2 <> '   ') and (cCasa2 <> '000') then begin
   // ****************
   if (cCasa2 = '  1') and (cCasa1 = '   ') or (cCasa1 = '000') then cMilhares := 'H'
   else begin
     if (cCasa2 = '100') then  cMilhares := 'CEM'
     else
      if (COPY(cCasa2, 1, 1) <> ' ') and (COPY(cCasa2, 1, 1) <> '0') then begin
         cMilhares := vExtenso[StrtoInt(COPY(cCasa2, 1, 1))];
         if COPY(cCasa2, 2, 2) <> '00' then cMilhares := cMilhares + ' E ';
      end;
    end;
   // ****************
   if StrtoInt(COPY(cCasa2, 2, 2)) <> 0 then begin
    if StrtoInt(COPY(cCasa2, 2, 2)) < 20 then
       cMilhares := cMilhares + vExtenso[20 + StrtoInt(COPY(cCasa2, 2, 2))]
    else begin
     cMilhares := cMilhares + vExtenso[10 + StrtoInt(COPY(cCasa2, 2, 1))];
     if COPY(cCasa2, 3, 1) <> '0' then begin
       cMilhares := cMilhares + ' E ';
       cMilhares := cMilhares + vExtenso[20 + StrtoInt(COPY(cCasa2, 3, 1))];
     end;
    end; // else
   end;
   // ****************
   cMilhares := cMilhares + ' MIL ';
   // ****************
   if cCasa3 = '000' then  cMilhares := cMilhares + 'REAIS';
   // ****************
  end; // fim do processa milhares

  // processa extenso de Unidade
  cUnidades := '';
  if (cCasa3 <> '   ') and (cCasa3 <> '000') then begin
   // ****************
   if (cCasa3 = '  1') and (cCasa2 + cCasa1 = '      ') or
      (cCasa2 + cCasa1 = '000000') then  cUnidades := 'H'
   else begin
     if cCasa3 = '100' then  cUnidades := 'CEM'
     else begin
        if (COPY(cCasa3, 1, 1) <> ' ') and (COPY(cCasa3, 1, 1) <> '0') then begin
           cUnidades := vExtenso[StrtoInt(COPY(cCasa3, 1, 1))];
           if COPY(cCasa3, 2, 2) <> '00' then cUnidades := cUnidades + ' E ';
        end;
      end;
    end;
   // ****************
   if COPY(cCasa3, 2, 2) <> '0' then begin
     if StrtoInt(COPY(cCasa3, 2, 2)) < 20 then
        cUnidades := cUnidades + vExtenso[20 + StrtoInt(COPY(cCasa3, 2, 2))]
     else begin
       cUnidades := cUnidades + vExtenso[10 + StrtoInt(COPY(cCasa3, 2, 1))];
       if COPY(cCasa3, 3, 1) <> '0' then begin
         cUnidades := cUnidades + ' E ';
         cUnidades := cUnidades + vExtenso[20 + StrtoInt(COPY(cCasa3, 3, 1))];
       end;
      end;
   end; // if
   // ****************
   if StrtoInt(cCasa1 + cCasa2 + cCasa3) <> 0 then begin
     if StrtoFloat(valor) < 2 then cUnidades := cUnidades + ' REAL'
     else cUnidades := cUnidades + ' REAIS';
   end;
   // ****************
  end; // fim de processa extenso de centavos

  // processa extenso de centavos
  cCentavos := '';
  if (cCasa4 <> '  ') and (cCasa4 <> '00') then begin
   // ****************
   if StrtoInt( cCasa1 + cCasa2 + cCasa3 ) <> 0 then cCentavos := ' E ';
   // ****************
   if cCasa4 = '01' then cCentavos := cCentavos + 'UM CENTAVO'
   else begin
      if COPY(cCasa4, 2, 1) = '0' then begin
         cCentavos := cCentavos + vExtenso[10 + StrtoInt(COPY(cCasa4,1,1))];
         cCentavos := cCentavos + ' CENTAVOS';
       end
      else begin
         if COPY( cCasa4, 1, 1 ) = '0' then begin
            cCentavos := cCentavos + vExtenso[20 + StrtoInt(cCasa4)]
                         + ' CENTAVOS';
          end else begin
            if StrtoInt(cCasa4) < 20 then
              cCentavos := cCentavos + vExtenso[20 + StrtoInt(cCasa4)] + ' CENTAVOS'
            else
              cCentavos := cCentavos + vExtenso[10 + StrtoInt(COPY(cCasa4, 1, 1))]
                           + ' E '   + vExtenso[20 + StrtoInt(COPY(cCasa4, 2, 1))]
                           + ' CENTAVOS';
          end; // else
       end; // else
    end; // else
  end; // if

  // ****************
  Extenso :=  (cMilhoes + cMilhares + cUnidades + cCentavos );
end;

procedure Salvar_erro(DATA_HORA: string; USUARIO : string; METODO : string; MENSAGEM : string; LANCAMENTO: string = '');
var
    NomeDoLog: string;
    Arquivo: TextFile;
begin
    NomeDoLog := ChangeFileExt(Application.Exename, '.log');
    AssignFile(Arquivo, NomeDoLog);
    if FileExists(NomeDoLog) then
      Append(arquivo)
    else
      ReWrite(arquivo);
    try
      WriteLn(arquivo, DATA_HORA + ' | '+ USUARIO + ' | ' + METODO + ' | ' + MENSAGEM + ' | ' + LANCAMENTO);
      WriteLn(arquivo,'------------------------------------------------------------------------------------');
    finally
      CloseFile(arquivo)
    end;
    //SetFileAttributes(pchar(NomeDoLog),6);
//Onde X:
//0  - Nada
//1  - Somente leitura
//2  - Oculto
//3  - Somente leitura e oculto
//4  - Sistema
//5  - Somente leitura e sistema
//6  - Oculto e sistema
//7  - Somente leitura, oculto e sistema
end;

function copy_campo(texto:string; caracter_delimitador:string; coluna:Integer):string;
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

function MontaComboListComposto( AdoQuery:TAdoQuery; ComboList:TWinControl; num_campos:integer=1):boolean; // MONTA A COMBO COM UM, DOIS OU MAIS CAMPOS CONCATENADOS
var
  campos : string;
  i : integer;
begin
  Result := true;
  AdoQuery.Open;
  if AdoQuery.RecordCount = 0 then
     Result := false
  else
  begin
    if num_campos > AdoQuery.FieldCount then
       num_campos := AdoQuery.FieldCount;
    if (ComboList is TComboBox) then
    begin
      (ComboList as TComboBox).Items.Clear;
      while not AdoQuery.EOF do
      begin
        campos := '';
        for i:= 0 to num_campos - 1 do
        begin
          if i > 0 then
             campos := campos + ' | ';
          campos := campos + AdoQuery.FieldByName(AdoQuery.Fields[i].FieldName).AsString;
        end;
        (ComboList as TComboBox).Items.Add(campos);
        AdoQuery.Next;
      end;
    end
    else
    if (ComboList is TListBox) then
    begin
      (ComboList as TListBox).Items.Clear;
      while not AdoQuery.EOF do
      begin
        campos := '';
        for i:= 0 to num_campos - 1 do
        begin
          if i > 0 then
             campos := campos + ' | ';
          campos := campos + AdoQuery.FieldByName(AdoQuery.Fields[i].FieldName).AsString;
        end;
        (ComboList as TListBox).Items.Add(campos); //
        AdoQuery.Next;
      end;
    end
    else
    if (ComboList is TCheckListBox) then
    begin
      (ComboList as TCheckListBox).Items.Clear;
      while not AdoQuery.EOF do
      begin
        campos := '';
        for i:= 0 to num_campos - 1 do
        begin
          if i > 0 then
             campos := campos + ' | ';
          campos := campos + AdoQuery.FieldByName(AdoQuery.Fields[i].FieldName).AsString;
        end;
        (ComboList as TCheckListBox).Items.Add(campos);
        AdoQuery.Next;
      end;
    end;
  end;
  AdoQuery.Close;
end;//
//***************************************************************

procedure limparArrayInteger(var array_: array of integer; inicio:integer; fim:integer; inserir_em_todos:integer);
var
  i: integer;
begin
  for i:= inicio to fim do
     array_[i] := inserir_em_todos;
end;

procedure limparArrayBoolean(var array_: array of boolean; inicio:integer; fim:integer; inserir_em_todos:Boolean);
var
  i: integer;
begin
  for i:= inicio to fim do
     array_[i] := inserir_em_todos;
end;

function ValidarCFOP(CFOP: String; Entrada:Boolean; vUF_PART:string; var msgRetorno:string; ConnectionString_:string): Boolean;
var
 vUF: string;
 operacao_entrada, operacao_saida, cfop_entrada, cfop_saida: boolean;
begin
  vUF:= getUF(ConnectionString_);
  msgRetorno := '';
  if length(trim(CFOP))=0 then
     msgRetorno := 'O CFOP é um campo obrigatório e deve ser preenchido.'
  else
  if (length(trim(CFOP)) > 0)and(length(trim(CFOP)) < 4) then
     msgRetorno := 'O CFOP deve possuir quatro (4) caracteres.'
  else
  if ENTRADA and (strToIntDef(CFOP[1],0) in [4,5,6]) then // CFOP DE ENTRADA
     msgRetorno := 'Não é permitido usar CFOP de saída em itens de nota de entrada.'
  else
  if (not ENTRADA) and (strToIntDef(copy(CFOP, 1, 1), -1) in [1,2,3]) then // CFOP DE ENTRADA
     msgRetorno := 'Não é permitido usar CFOP de entrada em itens de nota de saída.'
  else
  if (UpperCase(vUF) = UpperCase(vUF_PART)) and (strToIntDef(copy(CFOP, 1, 1),-1) = 2) and ENTRADA then
     msgRetorno := 'Não é permitido usar este CFOP em operações estaduais.'
  else
  if (UpperCase(vUF) <> UpperCase(vUF_PART)) and (strToIntDef(copy(CFOP, 1, 1),-1) = 1) and ENTRADA  then
     msgRetorno := 'Não é permitido usar este CFOP em operações interestaduais.'
  else
  if (UpperCase(vUF) = UpperCase(vUF_PART)) and (strToIntDef(copy(CFOP, 1, 1),-1) = 6) and (NOT ENTRADA) then
     msgRetorno := 'Não é permitido usar este CFOP em operações estaduais.'
  else
  if (UpperCase(vUF) <> UpperCase(vUF_PART)) and (strToIntDef(copy(CFOP, 1, 1),-1) = 5) and (NOT ENTRADA)  then
     msgRetorno := 'Não é permitido usar este CFOP em operações interestaduais.'
  else
  if not CFOP_Cadastrado(CFOP, ConnectionString_) then
     msgRetorno := 'CFOP inválido ou não cadastrado.'
  else
  if (UpperCase(vUF) <> UpperCase(vUF_PART)) and (strToInt(copy(CFOP, 1, 1)) = 5) and (NOT ENTRADA)  then
     msgRetorno := 'Não é permitido usar este CFOP em operações interestaduais';
  result:= msgRetorno = ''; // SE A MENSAGEM FOR VAZIA, O CFOP É VÁLIDO
end;

{ retorna a data e hora do banco de dados }
function getDataBanco(ConnectionString:string):TDateTime;
var
  query : TADOQuery;
  resultado: TDateTime;
begin
  query := TADOQuery.Create(nil);
  query.ConnectionString := ConnectionString;
  with query do
  begin
    SQL.Text := 'select getDate() data ';
    Open;
    resultado := FieldByName('data').AsDateTime;
  end;
  freeandnil(query);
  result:= resultado;
end;

{ retorna a unidade de cadastro de um produto }
function getUnidade(cdProduto: integer; ConnectionString:string):string;
var
  query : TADOQuery;
begin
  query := TADOQuery.Create(nil);
  query.ConnectionString := ConnectionString;
  with query do
  begin
    SQL.Text := 'select dsUnidade as unidade from produto with(nolock) where cdProduto=:cdproduto';
    parameters.ParamByName('cdProduto').Value := cdproduto;
    Open;
    if recordCount > 0 then
       Result := FieldByName('unidade').asString
    else
       Result := '';
  end;
  freeandnil(query);
end;

function getUF(cdPessoa : integer; ConnectionString:string):string;
var
  query : TADOQuery;
begin
  query := TADOQuery.Create(nil);
  query.ConnectionString := ConnectionString;
  with query do
  begin
    SQL.Text := 'select dsUF as UF from endereco with (nolock) where cdpessoa=:CODIGO';
    parameters.ParamByName('CODIGO').Value := cdpessoa;
    Open;
    if recordCount > 0 then
       Result := FieldByName('UF').asString
    else
       Result := '';
  end;
  freeandnil(query);
end;

function getUF(ConnectionString:string):string;
var
  query : TADOQuery;
begin
  query := TADOQuery.Create(nil);
  query.ConnectionString := ConnectionString;
  with query do
  begin
    SQL.Text := 'select dsUF as UF from configuracao with (nolock)';
    Open;
    if recordCount > 0 then
       Result := FieldByName('UF').asString
    else
       Result := '';
  end;
  freeandnil(query);
end;

function CFOP_Cadastrado(cfop:string; connectionString: string):boolean;
var
  query : TADOQuery;
begin
  query := TADOQuery.Create(nil);
  query.ConnectionString := ConnectionString;
  with query do
  begin
    SQL.Text := 'select 0               '+
                'where '+ QuotedStr(cfop) +' in ( '+
                'select distinct cdcfop '+
                'from cfop              '+
                'where len(cdcfop)=4)   ';
    Open;
    if recordcount > 0 then
       Result := true
    else
       Result := false;
  end;
  freeandnil(query);
end;

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

{
* Retorna um formato que será usado na função FormatFloat
}
function getFormato(quantidadeCasasDecimais:Integer):string;
var
  formato: string;
  i: integer;
begin
  if quantidadeCasasDecimais <= 0 then
     formato:= '0'
  else begin
    formato:= '0.';
    for i:= 1 to quantidadeCasasDecimais do
        formato:= formato + '0';
  end;
  result:= formato;
end;

{
* Mesma função do FormatFloat com um parâmetro diferente, ao invés do formato passamos
* a quantidade de casas decimais.
}
function FormatFloatQ(quantidadeCasasDecimais:Integer; valor:Extended):string;
var
  formato: string;
begin
  formato:= getFormato(quantidadeCasasDecimais);
  result:= FormatFloat(formato, valor);
end;

function getCodigoFornecedor(_connectionString:string; cdProduto:Integer):Integer;
var
  query: TADOQuery;
  resultado: integer;
begin
  query:= TADOQuery.Create(nil);
  query.ConnectionString:= _connectionString;
  with query do
  begin
    SQL.Text:= 'select cdPessoa from produto with (nolock) where cdproduto=:cdproduto';
    Parameters.ParamByName('cdproduto').Value:= cdproduto;
    Open;
    if RecordCount > 0 then
      resultado:= FieldByName('cdPessoa').AsInteger
    else
      resultado:= -1;
  end;
  FreeAndNil(query);
  result:= resultado;
end;

{ Retorna o estoque físico de determinado produto s}
function getNrQtdReal(_connectionString:string; cdproduto:integer):Real;
var
  query: TADOQuery;
  resultado: Real;
begin
  query:= TADOQuery.Create(nil);
  query.ConnectionString:= _connectionString;
  with query do
  begin
    SQL.Text:= 'select nrqtdreal from produto with (nolock) where cdproduto =:cdproduto  ';
    Parameters.ParamByName('cdproduto').Value:= cdproduto;
    Open;
    if RecordCount > 0 then
      resultado:= FieldByName('nrqtdreal').AsFloat
    else
      resultado:= 0;
  end;
  FreeAndNil(query);
  result:= resultado;
end;

{ Retorna o código do fabricante de determinado lote de um produto }
function getFabricanteLote(_connectionString:string; cdProduto:Integer; nrLote:string):Integer;
var
  query: TADOQuery;
  resultado: integer;
begin
  query:= TADOQuery.Create(nil);
  query.ConnectionString:= _connectionString;
  with query do
  begin
    SQL.Text:= 'select cdfabricante from itelote with (nolock) where cdproduto=:cdproduto and nrLote=:nrlote ';
    Parameters.ParamByName('cdproduto').Value:= cdproduto;
    Parameters.ParamByName('nrlote').Value:= nrLote;
    Open;
    if RecordCount > 0 then
      resultado:= FieldByName('cdFabricante').AsInteger
    else
      resultado:= -1;
  end;
  FreeAndNil(query);
  result:= resultado;
end;

{
* Procedure usada no onClose do form em que se deseja persistir algum dado
* esse dado persistido deve ser lido e restaurado no onCreate do form em questão.
}
procedure persistirForm(nomeForm:string; campo:string; valor:string; arquivo_:string);
var
  arquivo: TIniFile;
begin
  Arquivo := TIniFile.Create(arquivo_);
  Arquivo.WriteString(nomeForm, campo, valor);
  Arquivo.free;
end;

{
  Lê o valor de uma variável de seção no arquivo Support.Ini
  secao ----------> Seção que contém a variável que deseja ler
  variavel -------> variável a ser lida
  retornoDefault -> Valor que será retornado caso a variável não seja encontrada
}
function ReadSupportIni(secao:string; variavel:string; retornoDefault:string):string;
var
  Arq : TIniFile;
  resultado: string;
begin
  Arq := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Support.Ini');
  try
    resultado:= Arq.ReadString(secao, variavel, retornoDefault);
  finally
    Arq.Free;
  end;
  Result:= resultado;
end;

function getNomeEmpresa: String;
var
  Query : TadoQuery;
begin
  Query := TAdoQuery.create(nil);
  Query.Connection := DModulo.Conexao;
  with Query do
  begin
    SQL.Text:= 'select nmEmpresa from configuracao with (nolock)';
    Open;
    getNomeEmpresa:= FieldByName('nmEmpresa').AsString;
    close;
  end;
  FreeAndNil(Query);
end;

function CarregarImagemURL(var imagem :TImage; url: string) : Boolean;
var
  Jpeg: TJpegImage;
  Strm: TMemoryStream;
  ConWeb : TIdHTTP;
begin
  Result := true;
  if url = '' then begin
    imagem.Picture := nil;
    exit;
  end;
  try
    try
      Screen.Cursor := crHourGlass;
      Jpeg := TJpegImage.Create;
      Strm := TMemoryStream.Create;
      ConWeb := TIdHTTP.Create;
      ConWeb.IOHandler := TIdSSLIOHandlerSocketOpenSSL.Create(ConWeb);
      ConWeb.HandleRedirects := True;
      ConWeb.Get(url, Strm);
      if (Strm.Size > 0) then
      begin
        Strm.Position := 0;
        Jpeg.LoadFromStream(Strm);
        imagem.Picture.Assign(Jpeg);
      end;
    finally
      Strm.Free;
      ConWeb.Free;
      Jpeg.Free;
      Screen.Cursor := crDefault;
    end;
  except
    imagem.Picture := nil;
    Result := false;
    raise Exception.Create('Erro ao carregar o link da imagem');
  end;
end;

function uploadImagemFTP(CNPJ : string) : string;
var
  m : TStream;
  f : TStream;
  t : Cardinal;
  Nome_Arquivo,
  Auxiliar :String;
  contador : Integer;
  idFTP1 : TidFTP;
  OpenDialog1 : TOpenDialog;
begin
  Auxiliar := '';
  f := nil;
  m := nil;
  idFTP1 := TIdFTP.Create(Application);
  idFTP1.Passive := true;
  idFTP1.Host := '104.211.8.176';
  idFTP1.Username := 'img';
  idFTP1.Password := 'imgDATASQL';
  idFTP1.Connect;
  try
    idFTP1.MakeDir(CNPJ);
    idFTP1.ChangeDir(CNPJ);
  except
    idFTP1.ChangeDir(CNPJ);
  end;
  //Memo_Relatorio_FTP.Lines.Add(''Diretório original: '' + Diretorio_Leitura);
  OpenDialog1 := TOpenDialog.Create(Application);
  OpenDialog1.Filter  := 'All Files|*.jpg;*.jpeg;';

  try
    if OpenDialog1.Execute then
    begin

      Nome_Arquivo := OpenDialog1.FileName;

      //Memo_Relatorio_FTP.Lines.Add (''Operação: troca de diretório local'');
      //Memo_Relatorio_FTP.Lines.Add (''Diretório do arquivo: '' +ftp GetCurrentDir);
      //Memo_Relatorio_FTP.Lines.Add ('''');

      Nome_Arquivo := AnsiStrRScan(PCHar(Nome_Arquivo), '\');
      for contador := 2 To StrLen(PCHar(Nome_Arquivo)) do
      Auxiliar := Auxiliar + Nome_Arquivo [contador];
      Nome_Arquivo := IntToStr(Round(random(99999))) + StringReplace(Auxiliar,' ','_',[rfReplaceAll]);
      Nome_Arquivo := RetirarAcento(Nome_Arquivo);

      try
        //Memo_Relatorio_FTP.Lines.Add(''Operação: Upload'');
        //Memo_Relatorio_FTP.Lines.Add (''Arquivo local: '' + OpenDialog1.FileName);
        //Memo_Relatorio_FTP.Lines.Add (''Gravado como: '' + Nome_Arquivo);

        f := TFileStream.Create(OpenDialog1.FileName,fmOpenRead);
        m := TMemoryStream.Create;
        m.CopyFrom(f,f.Size);
        m.Seek(0,0) ;
        t := GetTickCount;
        idFTP1.Put(m,Nome_Arquivo);
        Result := 'https://supportinformatica.net/imagens/'+CNPJ+'/'+Nome_Arquivo;
        //Memo_Relatorio_FTP.Lines.Add(Format(''tempo %d milesegundos'',[GetTickCount - t]));
        //Memo_Relatorio_FTP.Lines.Add(Format(''Tamanho %d bytes'',[m.Size]));
        //Memo_Relatorio_FTP.Lines.Add('''');

      finally
        m.Free;
        f.Free;
      end;
    end;
  finally
    idFTP1.Disconnect;
  end;
  //SetCurrentDir (Diretorio_Leitura);
  //Memo_Relatorio_FTP.Lines.Add(''Operação: troca de diretorio local'');
  //Memo_Relatorio_FTP.Lines.Add (''Diretório após a operação: '' + GetCurrentDir);
  //Memo_Relatorio_FTP.Lines.Add ('''');
end;

procedure Verifica_Existencia_Promocao(data:TDate);
var query: TADOQuery;
begin
  query := TADOQuery.Create(nil);
  Try
    with query do
    begin
      Connection:= DModulo.Conexao;
      Dmodulo.Conexao.BeginTrans;
      Sql.Text := 'Update ItePromocao set dsPromocao = ''S'' '+
                  'Where dtInicio <= :HOJE and dtFim >= :HOJE2 and dsPromocao = ''N''';
      Parameters.ParamByName('HOJE').Value  := DateToStr(data);
      Parameters.ParamByName('HOJE2').Value  := DateToStr(data);
      ExecSql;

      Sql.Text := 'Update ItePromocao set dsPromocao = ''N'',dtInicio = NULL,dtFim = NULL,vlPreco = 0.00, vlAtacado = 0.00 '+
                  'Where dtFim < :HOJE ';// and dsPromocao <> ''N''   ';
      Parameters.ParamByName('HOJE').Value := DateToStr(data);
      ExecSql;
      DModulo.Conexao.CommitTrans;
    end;
  except
    DModulo.Conexao.RollBackTrans;
    //Application.messageBox('Não foi possível agendar/desativar promoção!','Erro', MB_OK + MB_ICONERROR);
  end;
end;

end.
