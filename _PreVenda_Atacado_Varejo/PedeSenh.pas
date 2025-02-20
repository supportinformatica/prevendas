unit PedeSenh;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Db,  Grids, DBGrids, ADODB, IniFiles, jpeg,
  Menus, DateUtils, Thread_Conexao2, Vcl.Imaging.pngimage, ShellAPI;

type
  TFrmPedeSenha = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    EditSenha: TEdit;
    ADOQuery1: TADOQuery;
    ADOQuery2: TADOQuery;
    ADOQryConfigurar: TADOQuery;
    ADOQryAutorizar: TADOQuery;
    PopupMenu1: TPopupMenu;
    Cancelar1: TMenuItem;
    editUsuario: TComboBox;
    LblData: TLabel;
    Image1: TImage;
    Label10: TLabel;
    Label12: TLabel;
    Label4: TLabel;
    Label15: TLabel;
    Label17: TLabel;
    LblNomeCliente: TLabel;
    Label6: TLabel;
    lblRegistro: TLabel;
    LblAlterar: TLabel;
    LblInserirChave: TLabel;
    Definirimpressora40colunas1: TMenuItem;
    Image2: TImage;
    Label9: TLabel;
    Shape1: TShape;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure EditSenhaEnter(Sender: TObject);
    procedure Cancelar1Click(Sender: TObject);
    procedure EditSenhaKeyPress(Sender: TObject; var Key: Char);
    procedure EditSenhaChange(Sender: TObject);
    procedure LblAlterarClick(Sender: TObject);
    procedure LblAlterarMouseLeave(Sender: TObject);
    procedure LblAlterarMouseEnter(Sender: TObject);
    procedure LblInserirChaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Definirimpressora40colunas1Click(Sender: TObject);
    procedure Label17Click(Sender: TObject);
  private
    isLoginInicial : Boolean;
    Procedure Confirma;
    function BancoEmUsoPorOutroSaef: Boolean;
    function GetVersaoArq: string;
    procedure atualizarSenhaADM;
    procedure ChamaFormMensagensAtualizacao;
  public
    vCasasQtd : integer;
    ThreadConexao2 : TConexao2;
    function RetornaWS(UF : string) : string;
    procedure Configura;
    procedure ExibeLabelResgistro;
    constructor Create(AOWner : TComponent);overload;override;
    constructor Create(AOwner: TComponent; _isLoginInicial : Boolean);overload;

  end;

var
  FrmPedeSenha: TFrmPedeSenha;

implementation

uses MoPreVenda, uFuncoesPadrao, DataModulo, NEGACBrPosPrint,
  FrmAlteraSenha, FormRegistroSistema, FrmConfImpresNFCe;

{$R *.DFM}

procedure TFrmPedeSenha.FormActivate(Sender: TObject);
begin
  FrmPrincipalPreVenda.Enabled := False;
  FrmPrincipalPreVenda.vQtd := 0;  // inicializa vari-ável de quantidade de tentativas
  EditUsuario.SetFocus;
  EditUsuario.SelectAll;
end;

procedure TFrmPedeSenha.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FrmPedeSenha := nil;
  Action := CaFree;
end;

function TFrmPedeSenha.GetVersaoArq: string;
var
  VerInfoSize: DWORD;
  VerInfo: Pointer;
  VerValueSize: DWORD;
  VerValue: PVSFixedFileInfo;
  Dummy: DWORD;
  versao : String;
begin
  VerInfoSize := GetFileVersionInfoSize(PChar(ParamStr(0)), Dummy);
  GetMem(VerInfo, VerInfoSize);
  GetFileVersionInfo(PChar(ParamStr(0)), 0,VerInfoSize, VerInfo);
  VerQueryValue(VerInfo, '\', Pointer(VerValue),VerValueSize);
  with VerValue^ do
  begin
    versao := IntToStr(dwFileVersionMS shr 16);
    versao := versao + '.' + IntToStr(dwFileVersionMS and $FFFF);
    versao := versao + '.' + IntToStr(dwFileVersionLS shr 16);
    versao := versao + '.' + IntToStr(dwFileVersionLS and $FFFF);
  end;
  Result := (versao);
  FreeMem(VerInfo, VerInfoSize);
end;

procedure TFrmPedeSenha.Label17Click(Sender: TObject);
begin
  ShellExecute(Application.Handle, nil, PChar('https://supportinformatica.net/'), nil, nil, sw_hide);
end;

procedure TFrmPedeSenha.LblAlterarClick(Sender: TObject);
begin
  FormAlteraSenha := TFormAlteraSenha.Create(Application);
  FormAlteraSenha.ShowModal;
end;

procedure TFrmPedeSenha.LblAlterarMouseEnter(Sender: TObject);
begin
  LblAlterar.GlowSize := 1;
//  LblAlterar.Font.Style := [fsUnderline, fsBold];
end;

procedure TFrmPedeSenha.LblAlterarMouseLeave(Sender: TObject);
begin
  LblAlterar.GlowSize := 0;
//  LblAlterar.Font.Style := [fsBold];
end;

procedure TFrmPedeSenha.LblInserirChaveClick(Sender: TObject);
begin
  FrmRegistroSistema := TFrmRegistroSistema.Create(Application);
  FrmRegistroSistema.ShowModal;
end;

procedure TFrmPedeSenha.atualizarSenhaADM;
var
  senha1 : string;
  Hora, Min, Sec, MSec : Word;
begin
  senha1 := FormatDateTime('DD',Date);
  DecodeTime(Now, Hora, Min, Sec, MSec);
  senha1 := senha1 + FormatFloat('00',Min);
  senha1 := senha1 + copy_campo(GetVersaoArq,'.',4);
  DModulo.Conexao.BeginTrans;
  with ADOQuery1 do
  begin
    sql.Text := 'UPDATE SENHA SET DSSENHA = :SENHA WHERE DSNOME = :NOME';
    Parameters.ParamByName('SENHA').Value := Senha(senha1,'C');
    Parameters.ParamByName('NOME').Value := editUsuario.Text;
    ExecSQL;
  end;
  DModulo.Conexao.CommitTrans;
end;

function TFrmPedeSenha.BancoEmUsoPorOutroSaef:Boolean;
//var
//  arquivo: TIniFile;
//  path, banco, bancoEmUso: string;
//  resultado: Boolean;
Begin
//  banco:= getDataBaseName(DModulo.Conexao.ConnectionString); // BANCO QUE ESTOU TENTANDO ACESSAR
//  SetCurrentDir(ExtractFileDir(Application.ExeName));
//  Path := ExpandFileName('..\');
//  //Path:= GetWindowsDrive + ':\';
//  Arquivo:= TIniFile.Create(Path + 'support.ini');
//  bancoEmUso:= Arquivo.ReadString('BANCO_EM_USO_1','nome','');
//  if banco = bancoEmUso then
//     resultado:= True
//  else
//  begin
//    bancoEmUso:= Arquivo.ReadString('BANCO_EM_USO_2','nome','');
//    if banco = bancoEmUso then
//       resultado:= True
//    else
//       resultado:= False;
//  end;
//  Arquivo.Free;
//  result:= resultado;
end;

procedure TFrmPedeSenha.FormCreate(Sender: TObject);
begin
//
end;


procedure TFrmPedeSenha.FormShow(Sender: TObject);
begin
//
end;

procedure TFrmPedeSenha.Configura;
begin
 BorderStyle := bsnone;
 Show;
 Update;
 sleep(2000);
end;
procedure TFrmPedeSenha.EditSenhaChange(Sender: TObject);
begin
  //EditSenha.Text := Senha(EditSenha.Text,'C');
end;

procedure TFrmPedeSenha.EditSenhaEnter(Sender: TObject);
begin
//  if UPPERCASE(FrmCupom.vEmpresa) = 'REIDOFIAT' then
//     BitBtn1.Default := True;
end;

Procedure TFrmPedeSenha.Confirma;
var
  vSenha : String[06];
  I,J : Integer;
  DIniDias : TIniFile;
  Nome : Widestring;
  msgResultado : Widestring;
  Titular : Widestring;
  CNPJ : Widestring;
  NroSerie : Widestring;
  Emissor : Widestring;
  InicioValidade : Widestring;
  FimValidade : Widestring;
  vOpcao : Integer;
  vTag, senhac: String;
  vPermissao : String[1]; // variável de permissão S ou N
  nomePC: String;
begin
  if FrmPrincipalPreVenda.ValidarVersaoExeVersaoBAnco = false then
    exit;
  DIniDias := TIniFile.Create(ExtractFilePath(Application.ExeName)+'Support.ini');
  FrmPrincipalPreVenda.modeloImpressora := UpperCase(DIniDias.ReadString('IMP_PREVENDA','flag',''));
  FrmPrincipalPreVenda.portaImp := UpperCase(DIniDias.ReadString('PORTAIMP_PREVENDA','Porta',''));
  FrmPrincipalPreVenda.driveSpooler := DIniDias.ReadInteger('PosPrinter_PREVENDA','Modelo', Integer(FrmPrincipalPreVenda.ACBrPosPrinter.Modelo)); // usado no compnente ACBr para impressão de NFCe via spooler
  // EdtMensagem.Text := 'Aguarde... Verificando o acesso do usuário';
  DIniDias.Free; // Destrói o arquivo
  if (FrmPrincipalPreVenda.modeloImpressora = 'SPOOLER') then
  begin
//    TNEGABCrNFe.congigurarACBrPosPrinter(FrmPrincipalPreVenda.ACBrPosPrinter, FrmPrincipalPreVenda.modeloImpressora, FrmPrincipalPreVenda.portaImp, 38400, True, FrmPrincipalPreVenda.driveSpooler);
    TNEGACBrPosPrint.congigurarACBrPosPrinterIneteger(FrmPrincipalPreVenda.ACBrPosPrinter, FrmPrincipalPreVenda.portaImp, FrmPrincipalPreVenda.driveSpooler);
    TNEGACBrPosPrint.abrirPorta(FrmPrincipalPreVenda.ACBrPosPrinter);
    TNEGACBrPosPrint.fecharPorta(FrmPrincipalPreVenda.ACBrPosPrinter);
    if FrmPrincipalPreVenda.modeloImpressora = 'SPOOLER' then // O CODIGO ESTAVA PRONTO PARA ELGINI9
      FrmPrincipalPreVenda.modeloImpressora := 'ELGINI9';
  end;
  Application.ProcessMessages;
 // limpar vetor
  for I := 1 to 900 do for J := 1 to 7 do vVetor[I,J] := '';
 // EdtMensagem.Text := 'Aguarde... Verificando o acesso do usuário';
  I := 1; // índice do vetor
  Application.ProcessMessages;
  FrmPrincipalPreVenda.vQtd := FrmPrincipalPreVenda.vQtd + 1; // quantidade de tentativas de acesso
  // Usa função para descriptografar senha
  vSenha := Senha(EditSenha.Text,'C');
  // Localiza usuário
  if (Length(EditSenha.Text) = 0) or (Length(EditUsuario.Text) = 0) then
  begin
    Application.OnMessage := FrmPrincipalPreVenda.NaoProcessaMsg;
    MessageDlg ('Acesso Negado!',mtInformation,[mbOk],0);
    Application.OnMessage := FrmPrincipalPreVenda.ProcessaMsg;
    EditSenha.SelectAll;
    exit;
  end;
  //verifica se o usuário possui permissao para fazer pre-venda
  with AdoQryAutorizar do
  begin
    sql.text := 'select top 1 nrTag from permissao where dsNome = :dsNome and nrTag = 820';
    parameters.paramByName('dsNome').value := editUsuario.Text;
    open;
    if RecordCount = 0 then
    begin
      Application.OnMessage := FrmPrincipalPreVenda.NaoProcessaMsg;
      MessageDlg ('Você não possui permissao para fazer prevenda. Socicite ao gestor que conceda permissão lá no menu Utilitarios\Senhas do Saef.',mtError,[mbOk],0);
      Application.OnMessage := FrmPrincipalPreVenda.ProcessaMsg;
      exit;
    end;
  end;
  with ADOQuery1 do
  begin
    Sql.Text := 'Select * From Senha S WITH (NOLOCK) INNER JOIN Permissao P WITH (NOLOCK) '+
                'ON S.dsNome = P.dsNome Where P.dsnome = :DSNOME and S.dsSenha = :DSSENHA ';
    Parameters.ParamByName('DSNOME').Value  := EditUsuario.Text;
    Parameters.ParamByName('DSSENHA').Value := vSenha;
    Open;
    // Testa autorização de acesso
    if ADOQuery1.RecordCount = 0 then
    begin // Acesso negado
      if FrmPrincipalPreVenda.vQtd >= 9999 then
      begin //pediram para tirar eu so aumentei o limite Thiago
        Application.OnMessage := FrmPrincipalPreVenda.NaoProcessaMsg;
        MessageDlg('Você expirou a quantidade de tentativas!', mtError, [mbOk], 0);
        Application.OnMessage := FrmPrincipalPreVenda.ProcessaMsg;
        FrmPedeSenha.Close;
        //FrmPrincipalPreVenda.Close;
        Application.Terminate;
        exit;
      end;
      Application.OnMessage := FrmPrincipalPreVenda.NaoProcessaMsg;
      MessageDlg('Acesso Negado!', mtInformation, [mbOk], 0);
      Application.OnMessage := FrmPrincipalPreVenda.ProcessaMsg;
      EditSenha.SelectAll;
      exit;
    end; // if
  end; // qry1
    // Testa autorização de acesso
  if ADOQuery1.RecordCount <> 0 then
  begin // Acesso autorizado
    // Monta Vetor da Unit Principal (vVetor) com permissões
    with ADOQuery2 do
    begin
      Sql.Text :=  'Select * From Permissao WITH (NOLOCK) '+
                   'Where dsnome = :DSNOME and dsSenha = :DSSENHA ';
      Parameters.ParamByName('DSNOME').Value := EditUsuario.Text;
      Parameters.ParamByName('DSSENHA').Value := vSenha;
      Open;
      // Monta Vetor
      while not Eof do
      begin
        vVetor[I,1] := ADOQuery2.FieldByName('nrTag').AsString;
        vVetor[I,2] := FieldByName('dsIncluir').AsString;
        vVetor[I,3] := FieldByName('dsAlterar').AsString;
        vVetor[I,4] := FieldByName('dsExcluir').AsString;
        vVetor[I,5] := FieldByName('dsVisualizar').AsString;
        vVetor[I,6] := FieldByName('dsImprimir').AsString;
        vVetor[I,7] := FieldByName('dsBaixa').AsString;
        I := I + 1;
        Next;
      end;
      close;
    end;
    //PESQUISA SE TEM PRODUTOS PARA ENTRAR EM PROMOÇÃO
    Verifica_Existencia_Promocao(Dateof(strToDate(vData_Banco)));
    FrmPrincipalPreVenda.Enabled := True;
    //vnome_usuario_logado := EditUsuario.Text;
    // variaveis de configuracao de ambiente
    With FrmPedeSenha.ADOQryConfigurar do
    begin
      Sql.Text := 'Select Cast(isnull(nrOutrosImpostos,0) as decimal(8,2)) as AliquotaSimples, '+
      'ISNULL(nrPgCartaoDebito, 0) Deb, ISNULL(nrPgCartao1Vez,0) umV, ISNULL(nrPgCartao2Vezes,0) doisV, ISNULL(nrPgCartao3Vezes,0) tresV, '+
      'ISNULL(nrPgCartao4Vezes,0) quatroV, ISNULL(nrPgCartao5Vezes,0) cincoV, ISNULL(nrPgCartao6Vezes,0) seisV, ISNULL(nrPgCartao7Vezes,0) seteV,'+
      'ISNULL(nrPgCartao8Vezes,0) oitoV, ISNULL(nrPgCartao9Vezes,0) noveV, ISNULL(nrPgCartao10Vezes,0) dezV, ISNULL(nrPgCartao11Vezes,0) onzeV,  '+
      'ISNULL(nrPgCartao12Vezes,0) dozeV, * From Configuracao WITH (NOLOCK)';
      Open;
      FrmPrincipalPreVenda.acrescimoParcelamentoCartao := True;
      if ADOQryConfigurar.FieldByName('dtExpiracopia').AsDateTime > (StrToDate(vData_Banco) + 120) then
      begin
        with DModulo.ADOQuery1 do
        begin
          try
            DModulo.Conexao.BeginTrans;
            SQL.Text := 'Update Configuracao Set dtExpiracopia = GetDate() + 10 ';
            ExecSQL;
            DModulo.Conexao.CommitTrans;
          except
            DModulo.Conexao.RollbackTrans;
          end;
        end;
      end;
      Close;
      if (ValidaComputadorSupport(FrmPrincipalPreVenda.dsCGC) = false) then
      begin
        FrmPrincipalPreVenda.RegistraCliente;
      end;
      if (UPPERCASE(editUsuario.Text) <> 'ADM') and (ValidaComputadorSupport(FrmPrincipalPreVenda.dsCGC) = false) then
      begin
        //verifico se o usuario possui a permissão gerencial para exibir o boleto bancario
        vOpcao := 0;
        vTag := '25';
        // Localiza opção no vetor
        for I := 1 to 900 do
        begin // 150 número máximo de opções do menu
          // Acesso Total na opção
          case vOpcao of
            0: if  vVetor[I,1] = vTag  then vPermissao := 'S';
            1: if (vVetor[I,1] = vTag) and (vVetor[I,2] = 'X') then vPermissao := 'S';
            2: if (vVetor[I,1] = vTag) and (vVetor[I,3] = 'X') then vPermissao := 'S';
            3: if (vVetor[I,1] = vTag) and (vVetor[I,4] = 'X') then vPermissao := 'S';
            4: if (vVetor[I,1] = vTag) and (vVetor[I,5] = 'X') then vPermissao := 'S';
            5: if (vVetor[I,1] = vTag) and (vVetor[I,6] = 'X') then vPermissao := 'S';
            6: if (vVetor[I,1] = vTag) and (vVetor[I,7] = 'X') then vPermissao := 'S';
          end; //Case
        end;   // for
        with AdoQryAutorizar do
        begin
          sql.text := 'select top 1 nrTag from permissao where dsNome = :dsNome and nrTag = 621';
          parameters.paramByName('dsNome').value := editUsuario.Text;
          open;
          //se o usuario tiver acesso ao contas a pagar então ele pode ver o boleto
          if ((vPermissao = 'S') and (recordCount = 0)) then
          begin
            close;
            senhac := Senha(EditSenha.Text,'C');
            sql.text := 'insert into permissao(dsNome,dsSenha,nrTag,dsIncluir,dsAlterar,dsExcluir,dsBaixa,dsVisualizar,dsSemAcesso,dsImprimir) '+
                        ' values (:dsNome, :dsSenha, 621,null,null,null,null,''X'',null,null)';
            parameters.paramByName('dsNome').value := editUsuario.Text;
            parameters.paramByName('dsSenha').value := senhac;
            execSql;
          end;
        end;
      end;
    end;
    ADOQuery1.close;
    ADOQuery2.Close;
    FrmPrincipalPreVenda.UltimoLancamento;
    FrmPedeSenha.close;
    FrmPrincipalPreVenda.cbxUsuario.Text := editUsuario.Text;
    FrmPrincipalPreVenda.EdtUsuario.Text := EditSenha.Text;
    FrmPrincipalPreVenda.EdtUsuarioExit(Self);
    FrmPrincipalPreVenda.edtLogin.Text := UpperCase(editUsuario.Text);
  end else
  begin // Acesso negado
    MessageDlg ('Acesso Negado!',mtError,[mbOk],0);
    if FrmPrincipalPreVenda.vQtd >= 3 then
    begin
      FrmPrincipalPreVenda.Close;
      frmPedeSenha.Close;
    end;
  end; // if
end;

constructor TFrmPedeSenha.Create(AOwner: TComponent; _isLoginInicial: Boolean);
begin
  Self := TFrmPedeSenha.Create(AOwner);
  Self.isLoginInicial := _isLoginInicial;
end;

constructor TFrmPedeSenha.Create(AOWner: TComponent);
var
  NomeUsuario : string;
  BufLen : DWord;
  Buffer : string;
  arquivo : string[100];
  saefs_rodando: integer;
begin
  inherited;
  isLoginInicial := True;
  arquivo := ExtractFilePath(Application.ExeName)+'novidade.txt';
  LblNomeCliente.Caption := getNomeEmpresa;
  with ADOQuery1 do
  begin
    SQL.Text := 'select dsnome from senha WITH (NOLOCK) order by dsnome ';
    MontaComboListADO(ADOQuery1,editUsuario);
  end;
  BufLen := 255;
  SetLength(NomeUsuario,BufLen);
  GetUserName(PChar(NomeUsuario), BufLen);
  SetLength(NomeUsuario,BufLen);
  LblData.Caption := DateTimeToStr(PegaDataDoExecutavel(ExtractFileName(Application.ExeName)));
  ExibeLabelResgistro;
  ThreadConexao2 := Tconexao2.Create(true);
  ThreadConexao2.Resume;
end;

procedure TFrmPedeSenha.Definirimpressora40colunas1Click(Sender: TObject);
begin
  try
    if FormConfImpresNFCe = nil then
      FormConfImpresNFCe := TFormConfImpresNFCe.Create(Self, FrmPrincipalPreVenda.ACBrPosPrinter, FrmPrincipalPreVenda.modeloImpressora, FrmPrincipalPreVenda.PortaImp, FrmPrincipalPreVenda.driveSpooler, 'PREVENDA');
    FormConfImpresNFCe.ShowModal;
    FreeAndNil(FormConfImpresNFCe);
  except
    FreeAndNil(FormConfImpresNFCe);
  end;
end;

procedure TFrmPedeSenha.ChamaFormMensagensAtualizacao;
begin

end;

procedure TFrmPedeSenha.Cancelar1Click(Sender: TObject);
begin
  if isLoginInicial then
  begin
    FrmPrincipalPreVenda.Close;
  end else
  begin
    FrmPrincipalPreVenda.Enabled := True;
    Close;
  end;
end;

procedure TFrmPedeSenha.EditSenhaKeyPress(Sender: TObject; var Key: Char);
begin
  if KEY = Char(13) then
  begin
    FrmPrincipalPreVenda.possuiPermissaoVenderAbaixoDoCusto := False;
    if editUsuario.Text = '' then
    begin
      Application.OnMessage := FrmPrincipalPreVenda.NaoProcessaMsg;
      MessageDlg ('Selecione o usuário!',mtWarning,[mbOk],0);
      editUsuario.setfocus;
      Application.OnMessage := FrmPrincipalPreVenda.ProcessaMsg;
      Exit;
    end else if EditSenha.Text = '' then
    begin
      Application.OnMessage := FrmPrincipalPreVenda.NaoProcessaMsg;
      MessageDlg ('Digite a senha!',mtWarning,[mbOk],0);
      EditSenha.setfocus;
      Application.OnMessage := FrmPrincipalPreVenda.ProcessaMsg;
      Exit;
    end else
      Confirma;
  end;
end;

procedure TFrmPedeSenha.ExibeLabelResgistro;
begin
  //lblRegistro.Visible := FrmPrincipalPreVenda.isClienteRegistrado;
end;

function TFrmPedeSenha.RetornaWS(UF: string) : string;
begin
  case strtoint(UF) of
    32,21,15,22,24 : result := 'SVAN';
    12,27,16,53,25,33,11,14,42,28,17 : Result := 'SVRS';
    13 : Result := 'AM';
    29 : Result := 'BA';
    23 : Result := 'CE';
    52 : Result := 'GO';
    50 : Result := 'MS';
    51 : Result := 'MT';
    31 : Result := 'MG';
    26 : Result := 'PE';
    41 : Result := 'PR';
    43 : Result := 'RS';
    35 : Result := 'SP';
  end;
end;

end.

