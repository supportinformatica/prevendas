unit CdFornecedor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FrmCadEstados, StdCtrls, Buttons, Mask, ExtCtrls, Db, Grids,
  DBGrids, ComCtrls, ImgList, Menus, ADODB, Variants, DBTables;

type
  TFrmCdFornecedor = class(TFrmMdCadastro)
    RgPessoa: TRadioGroup;
    LblCodigo: TLabel;
    EdtCodigo: TEdit;
    LblNome: TLabel;
    EdtNome: TEdit;
    LblDataCadastro: TLabel;
    RgPessoaD: TRadioGroup;
    CkbAtivosD: TCheckBox;
    LblEndereco: TLabel;
    EdtEndereco: TEdit;
    LblBairro: TLabel;
    EdtBairro: TEdit;
    LblHomePage: TLabel;
    EdtHomePage: TEdit;
    LblCidade: TLabel;
    EdtCidade: TEdit;
    CbxEstado: TComboBox;
    EdtComplemento: TEdit;
    LblComp: TLabel;
    LblTelefone: TLabel;
    CbxTelefone: TComboBox;
    LblEmail: TLabel;
    EdtEmail: TEdit;
    SBtnTelefone: TSpeedButton;
    EdtRamal: TEdit;
    LblRamal: TLabel;
    EdtCep: TMaskEdit;
    LblCep: TLabel;
    Bevel3: TBevel;
    LblCpf: TLabel;
    MskCpf: TMaskEdit;
    LblIdentidade: TLabel;
    EdtIdentidade: TEdit;
    MskNascimento: TMaskEdit;
    LblIdade: TLabel;
    LblNaruralidade: TLabel;
    EdtNaturalidade: TEdit;
    Bevel4: TBevel;
    LblCgc: TLabel;
    MskCgc: TMaskEdit;
    Label1: TLabel;
    EdtRazao: TEdit;
    LblContato: TLabel;
    EdtContato: TEdit;
    Label2: TLabel;
    EdtTelContato: TEdit;
    EdtRamalContato: TEdit;
    LblRamalContato: TLabel;
    MskInscricao: TMaskEdit;
    LblInscricao: TLabel;
    MmCliente: TMemo;
    DtCadastro: TDateTimePicker;
    Label3: TLabel;
    Label4: TLabel;
    RGAtvInatv: TRadioGroup;
    CkbFabricante: TCheckBox;
    RgFabricante: TRadioGroup;
    CbxCidade: TComboBox;
    EdtCdMunicipio: TEdit;
    Label7: TLabel;
    EdtTipoTel: TEdit;
    Label8: TLabel;
    LblListados: TLabel;
    ADOQryMunicipio: TADOQuery;
    Panel2: TPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure EdtConsultaChange(Sender: TObject);
    procedure CkbAtivosClick(Sender: TObject);
    procedure RgPessoaClick(Sender: TObject);
    procedure PgCtrolMdCadastroChange(Sender: TObject);
    procedure TBSheetMdCadastroConsultaEnter(Sender: TObject);
    procedure BtnMdCancelarClick(Sender: TObject);
    procedure BtnMdNovoClick(Sender: TObject);
    procedure SBtnTelefoneClick(Sender: TObject);
    procedure BtnMdSalvarClick(Sender: TObject);
    procedure BtnMdAlterarClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BtnMdPrimeiroClick(Sender: TObject);
    procedure BtnMdProximoClick(Sender: TObject);
    procedure BtnMdAnteriorClick(Sender: TObject);
    procedure BtnMdUltimoClick(Sender: TObject);
    procedure BtnMdExcluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnMdImprimirClick(Sender: TObject);
    procedure BtnMdSairClick(Sender: TObject);
    procedure RgPessoaDClick(Sender: TObject);
    procedure MmClienteEnter(Sender: TObject);
    procedure MmClienteExit(Sender: TObject);
    procedure RGAtvInatvClick(Sender: TObject);
    procedure CmbConsultaChange(Sender: TObject);
    procedure CbxEstadoChange(Sender: TObject);
    procedure CbxCidadeChange(Sender: TObject);
    procedure CbxTelefoneChange(Sender: TObject);
    procedure MskInscricaoExit(Sender: TObject);
    procedure Help1Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    Procedure AtualizaQryConsulta;
    procedure AtivaCampos;
    procedure DesativaCampos;
    Procedure AtualizaCampos;
    Procedure Grava_Pessoa;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCdFornecedor: TFrmCdFornecedor;

implementation

uses FrmPrincipal, CdTelefone, uFuncoesPadrao, DataModulo, RelFornecedor;

{$R *.DFM}

var
  VauxiAlterar:integer;  // usada para verificar se antes de alterar o cliente
                         // era pessoa física ou jurídica

procedure TFrmCdFornecedor.DesativaCampos;
// impossibilita a digitação de dados
begin
  SbtnTelefone.Enabled := True;
  CbxTelefone.Enabled := True;
  EdtRamal.Enabled := True;
  MskCpf.ReadOnly := True;
  MskCgc.ReadOnly := True;
  MskInscricao.ReadOnly := True;
  MskNascimento.ReadOnly := True;
  DtCadastro.Enabled := False;
  MmCliente.ReadOnly := True;
  EdtCodigo.ReadOnly := True;
  EdtNome.ReadOnly := True;
  EdtHomePage.ReadOnly := True;
  EdtEmail.ReadOnly := True;
  EdtEndereco.ReadOnly := True;
  EdtBairro.ReadOnly := True;
  EdtCidade.ReadOnly := True;
  EdtComplemento.ReadOnly := True;
  EdtCep.ReadOnly := True;
  EdtIdentidade.ReadOnly := True;
  EdtRazao.ReadOnly := True;
  EdtContato.ReadOnly := True;
  EdtTelContato.ReadOnly := True;
  EdtRamalContato.ReadOnly := True;
  EdtNome.SetFocus;
end;  // procedure Desativa campos

procedure TFrmCdFornecedor.AtivaCampos;
// abilita a digitação de dados
begin
  SbtnTelefone.Enabled := False;
  CbxTelefone.Enabled := False;
  EdtRamal.Enabled := False;
  CbxEstado.Enabled := True;
  MskCpf.ReadOnly := False;
  MskCgc.ReadOnly := False;
  MskInscricao.ReadOnly := False;
  MskNascimento.ReadOnly := False;
  DtCadastro.Enabled := True;
  MmCliente.ReadOnly := False;
  EdtNome.ReadOnly := False;
  EdtHomePage.ReadOnly := False;
  EdtEmail.ReadOnly := False;
  EdtEndereco.ReadOnly := False;
  EdtBairro.ReadOnly := False;
  EdtCidade.ReadOnly := False;
  EdtComplemento.ReadOnly := False;
  EdtCep.ReadOnly := False;
  EdtIdentidade.ReadOnly := False;
  EdtRazao.ReadOnly := False;
  EdtContato.ReadOnly := False;
  EdtTelContato.ReadOnly := False;
  EdtRamalContato.ReadOnly := False;
end;  // procedure AtivaCampos

procedure TfrmCdFornecedor.AtualizaCampos;
var
  i :Integer;
begin
  With AdoQryConsulta do begin                // move os campos para os componentes
    if AdoQryConsulta.RecordCount = 0 then begin
      LimpaTodosCampos(TbSheetMdCadastroDados);
      exit;
    end;
    EdtCodigo.Text := AdoQryConsulta.FieldByName('Código').AsString;
    EdtNome.Text := AdoQryConsulta.FieldByName('Fornecedor').AsString;
    EdtHomePage.Text := AdoQryConsulta.FieldByName('dsHomePage').AsString;
    EdtEmail.Text := AdoQryConsulta.FieldByName('dsEmail').AsString;
    DtCadastro.Date := StrToDate(AdoQryConsulta.FieldByName('dtCadastro').AsString);
    EdtEndereco.Text := AdoQryConsulta.FieldByName('Endereço').AsString;
    EdtComplemento.Text := AdoQryConsulta.FieldByName('Complemento').AsString;
    EdtCep.Text := AdoQryConsulta.FieldByName('Cep').AsString;
    EdtCidade.Text := AdoQryConsulta.FieldByName('Cidade').AsString;
    EdtBairro.Text := AdoQryConsulta.FieldByName('Bairro').AsString;
    For i := 0 to CbxEstado.Items.Count do
      if CbxEstado.Items[i] = AdoQryConsulta.FieldByName('Estado').AsString then
        CbxEstado.ItemIndex := i;
    if AdoQryConsulta.FieldByName('Estado').AsString = 'SE' then begin
      EdtCidade.Visible := False;
      CbxCidade.Visible := True;
      for i := 0 to CbxCidade.Items.Count -1 do
        if CbxCidade.Items[i] =  UpperCase(AdoQryConsulta.FieldByName('Cidade').AsString) then begin
          CbxCidade.ItemIndex := i;
          AdoQryMunicipio.Open;
          AdoQryMunicipio.Locate('dsMunicipio',CbxCidade.Text,[]);
          EdtCdMunicipio.Text := AdoQryMunicipio.FieldByName('cdMunicipio').AsString;
          AdoQryMunicipio.Close;
          EdtCidade.Left := 68;
          EdtCidade.Top := 129;
          Label8.Visible := false;
          EdtCidade.Color := clWindow;
          Break;
        end else begin
          CbxCidade.ItemIndex := -1;
          EdtCdMunicipio.Clear;
          EdtCidade.Left := 286;
          EdtCidade.Top := 163;
          EdtCidade.Color := clAqua;
          Label8.Visible := true;
          EdtCidade.Visible := True;
          EdtCidade.Text := AdoQryConsulta.FieldByName('Cidade').AsString;
        end;
    end else begin
      Label8.Visible := False;
      EdtCidade.Color := clWindow;
      EdtCidade.Left := 68;
      EdtCidade.Top := 129;
      EdtCidade.Visible := True;
      EdtCidade.Text := AdoQryConsulta.FieldByName('Cidade').AsString;
      CbxCidade.Visible := False;
      CbxCidade.ItemIndex := -1;
      EdtCdMunicipio.Clear;
    end;
    MmCliente.Text := AdoQryConsulta.FieldByName('dsMemo').AsString;
    with AdoQryExistir do begin
      if AdoQryConsulta.FieldByName('Existir').AsString = 'F' then begin  // Pessoa fisica
        Sql.Text := 'Select S.dsCpf,S.dsIdentidade,S.dtNascimento, ' +
        'S.dsNaturalidade From P_Fisica S Where S.cdPessoa = :CDPESSOA ';
        Parameters.ParamByName('CDPESSOA').Value := EdtCodigo.Text;
        Open;
        MskCpf.Text := FieldByName('dsCpf').AsString;
        MskNascimento.Text := FieldByName('DtNascimento').AsString;
        EdtIdentidade.Text := FieldByName('dsIdentidade').AsString;
        EdtNaturalidade.Text := FieldByName('dsNaturalidade').AsString;
        RgPessoaD.ItemIndex := 0;
        MskCgc.Text:='';
        MskInscricao.Text:='';
        EdtRazao.Text:='';
        EdtContato.Text:='';
        EdtTelContato.Text:='';
        EdtRamalContato.Text:='';
      end else begin    // Pessoa juridica
        MskCpf.Text := '';
        MskNascimento.Text := '';
        EdtIdentidade.Text := '';
        EdtNaturalidade.Text := '';
        Sql.Text := 'Select J.Cgc,J.dsInscricaoEstadual,J.nmRazao,J.nmContato, ' +
        'J.dsTelefContato,J.dsRamalContato From P_Juridica J Where J.cdPessoa = :CDDPESSOA ';
        Parameters.ParamByName('CDDPESSOA').Value := EdtCodigo.Text;
        Open;
        MskCgc.Text := FieldByName('Cgc').AsString;
        MskInscricao.Text := FieldByName('dsInscricaoEstadual').AsString;
        EdtRazao.Text := FieldByName('nmRazao').AsString;
        EdtContato.Text := FieldByName('nmContato').AsString;
        EdtTelContato.Text := FieldByName('dsTelefContato').AsString;
        EdtRamalContato.Text := FieldByName('dsRamalContato').AsString;
        RgPessoaD.ItemIndex := 1;  // abilita a opcao pessoa juridica
      end;  // if qryConsulta
    end;  // with QryExistir
    if AdoQryConsulta.FieldByName('DsAtivo').AsString = 'S' then
      CkbAtivosD.Checked := True  // define se o cliente é ativo ou não
    else
      CkbAtivosD.Checked := False;
    if AdoQryConsulta.FieldByName('dsFlag').AsString = 'S' then
      CkbFabricante.Checked := True  // define se o cliente é ativo ou não
    else
      CkbFabricante.Checked := False;
    With AdoQryCombFone do begin
      Sql.Text := 'Select T.NmTelefone,T.dsRamal,T.dsTelefone From Telefone T ' +
      'Where T.cdPessoa = :CDPESSOA ';
      Parameters.ParamByName('CDPESSOA').Value := EdtCodigo.Text;
      Open;
    end;  // with QryCombFone
  end;  // with QryConsulta
 {monta a combobox com todos os telefones do cliente}
  CbxTelefone.Clear;
  EdtRamal.Clear;
  if MontaComboListBoolADO(AdoQryCombFone,CbxTelefone) then
    CbxTelefone.Text := CbxTelefone.Items[0];
  AdoQryCombFone.Open;
  AdoQryCombFone.Locate ('nmTelefone',CbxTelefone.Text,[]);
  EdtRamal.Text := AdoQryCombFone.FieldByName('dsRamal').AsString;
  EdtTipoTel.Text := AdoQryCombFone.FieldByName('dsTelefone').AsString;
end;  // procedure AtualizaCampos

Procedure TFrmCdFornecedor.AtualizaQryConsulta;
// mona a query de consulta
begin
  With AdoQryConsulta do Begin
    Sql.Text := 'Declare @texto varchar(40) ' +
                'Set @texto = :PARAMETRO    '  +
                'Select P.CdPessoa as Código,P.nmPessoa as Fornecedor,C.dsFlag,P.dsEmail,' +
                'P.Ser,P.Existir,P.dsHomePage,P.DtCadastro,P.DsAtivo,dsMemo,' +
                'E.nmLogradouro as Endereço,E.dsComplemento as Complemento,' +
                'E.dsBairro as Bairro,E.dsCidade as Cidade,E.dsCep as CEP,E.dsUf as Estado ';
    case RgPessoa.ItemIndex of
      0: begin
        Sql.Add('From Pessoa as P,Fornecedor as C,Endereco as E ');
        case CmbConsulta.ItemIndex of
          6: Sql.Add(',P_Juridica as F ');
          7: Sql.Add(',P_Fisica as F ');
        end;
      end;
      1: begin
         Sql.Add(',F.dtNascimento as Data_Nascimento ');
         Sql.Add('From Pessoa P,Fornecedor C,Endereco E,P_Fisica F ');
       end;
       2: Sql.Add('From Pessoa P,Fornecedor C,Endereco E,P_Juridica F');
    end;
    if CmbConsulta.ItemIndex = 5 then Sql.Add(',Telefone T '); // Telefone
    Sql.Add('Where P.Ser = '+'''F'''+' and P.CdPessoa = C.CdPessoa ');
    Sql.Add('and P.CdPessoa = E.cdPessoa ');
    case RgPessoa.ItemIndex of
      1: Sql.Add('and P.cdPessoa = F.cdPessoa and P.Existir = ''F''');
      2: Sql.Add('and P.cdPessoa = F.cdPessoa and P.Existir = ''J''');
    end;
    case RgFabricante.ItemIndex of
      1: Sql.Add('and C.dsFlag is null');  // somente os nao fabricantes
      2: Sql.Add('and C.dsFlag =''S'''); // somente os  fabricantes
    end;
    case RGAtvInatv.ItemIndex of
      1: Sql.Add('and P.DsAtivo =''S''');
      2: Sql.Add('and P.DsAtivo =''N''');
    end;
    case CmbConsulta.ItemIndex of
      0: Sql.Add('Order By P.nmPessoa ');
      1: begin
         // Sql.Add('and P.CdPessoa Like ''' + EdtConsulta.Text + '%''  Order By P.CdPessoa');
          Sql.Add('and P.CdPessoa Like @texto Order By P.CdPessoa');
         end;
      2: begin
          //Sql.Add('and P.nmPessoa Like ''' + EdtConsulta.Text + '%'' Order By P.nmPessoa');
          Sql.Add('and P.nmPessoa Like @texto Order By P.nmPessoa');
         end;
      3: begin
          //Sql.Add('and E.nmLogradouro Like ''' + EdtConsulta.Text + '%'' Order By E.nmLogradouro,P.nmPessoa');
          Sql.Add('and E.nmLogradouro Like @texto Order By E.nmLogradouro,P.nmPessoa');
         end;
      4: begin
          //Sql.Add('and E.dsBairro Like ''' + EdtConsulta.Text + '%'' Order By E.dsBairro,P.nmPessoa ');
          Sql.Add('and E.dsBairro Like @texto Order By E.dsBairro,P.nmPessoa ');
         end;
      5: begin
          //Sql.Add('and C.cdPessoa = P.cdPessoa and T.cdPessoa = C.cdPessoa and T.nmTelefone Like ''' + EdtConsulta.Text + '%'' Order By P.nmPessoa ');
          Sql.Add('and C.cdPessoa = P.cdPessoa and T.cdPessoa = C.cdPessoa and T.nmTelefone Like @texto Order By P.nmPessoa ');
         end;
      6: begin
          //Sql.Add('and C.cdPessoa = P.cdPessoa and F.cdPessoa = C.cdPessoa and F.CGC Like ''' + EdtConsulta.Text + '%'' Order By P.nmPessoa');
          Sql.Add('and C.cdPessoa = P.cdPessoa and F.cdPessoa = C.cdPessoa and F.CGC Like @texto Order By P.nmPessoa');
         end;
      7: begin
          //Sql.Add('and C.cdPessoa = P.cdPessoa and F.cdPessoa = C.cdPessoa and F.dsCPF Like ''' + EdtConsulta.Text + '%'' Order By P.nmPessoa');
          Sql.Add('and C.cdPessoa = P.cdPessoa and F.cdPessoa = C.cdPessoa and F.dsCPF Like @texto Order By P.nmPessoa');
         end;
    end;  //case
    Prepared;
    Parameters.ParamByName('PARAMETRO').Value := EdtConsulta.Text + '%';
    Open;
    LblListados.Caption := 'Listados--> ' + IntToStr(RecordCount);
    { omite estes campos na grid }
    FieldByName('dsEmail').Visible := false;
    FieldByName('Ser').Visible := false;
    FieldByName('Existir').Visible := false;
    FieldByName('dsHomePage').Visible := false;
    FieldByName('dtCadastro').Visible := false;
    FieldByName('dsAtivo').Visible := false;
    FieldByName('dsMemo').Visible := false;
    FieldByName('dsFlag').Visible := false;
  end; // with
end;  // procedure AtualizaQryConsulta

procedure TFrmCdFornecedor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FormPrincipal.MiFornecedores.Enabled := True;
end;

procedure TFrmCdFornecedor.FormActivate(Sender: TObject);
begin
  inherited;
  if PgCtrolMdCadastro.ActivePage = TbSheetMdCadastroConsulta then begin
    EdtConsulta.SetFocus;
    EdtConsulta.Text := '%';
    EdtConsulta.SelectAll;
  end else begin
    With AdoQryCombFone do begin
      Sql.Clear;
      Sql.Add('Select T.NmTelefone,T.dsRamal From Telefone T ');
      Sql.Add('Where T.cdPessoa = :CDPESSOA');
      Parameters.ParamByName('CDPESSOA').Value := EdtCodigo.Text;
    end;  // with QryCombFone
    {monta a combobox com todos os telefones do cliente}
    if MontaComboListBoolADO(AdoQryCombFone,CbxTelefone) then
      CbxTelefone.Text := CbxTelefone.Items[0];
    AdoQryCombFone.Open;
    AdoQryCombFone.Locate ('nmTelefone',CbxTelefone.Text,[]);
    EdtRamal.Text := AdoQryCombFone.FieldByName('dsRamal').AsString;
  end;  // if
end; // procedure

procedure TFrmCdFornecedor.EdtConsultaChange(Sender: TObject);
begin
  inherited;
  AtualizaQryConsulta;
end;

procedure TFrmCdFornecedor.CkbAtivosClick(Sender: TObject);
begin
  inherited;
  AtualizaQryConsulta;
end;

procedure TFrmCdFornecedor.RgPessoaClick(Sender: TObject);
begin
  inherited;
  case CmbConsulta.ItemIndex of  // cnpj e cpf
    6,7: RgPessoa.ItemIndex := 0;
  end;
  AtualizaQryConsulta;
end;

procedure TFrmCdFornecedor.PgCtrolMdCadastroChange(Sender: TObject);
begin
  inherited;
  if PgCtrolMdCadastro.ActivePage = TbSheetMdCadastroConsulta then
    AtualizaQryConsulta
  else
    if PgCtrolMdCadastro.ActivePage = TbSheetMdCadastroDados then begin
      AtualizaCampos;
      DesativaCampos;
      TrataBotoesPadrao(Sender,Padrao);
      Status:=[Padrao];
    end;
end;

procedure TFrmCdFornecedor.TBSheetMdCadastroConsultaEnter(Sender: TObject);
begin
  inherited;
  BtnMdImprimir.Enabled := True;
  EdtConsulta.Setfocus;
end;

procedure TFrmCdFornecedor.BtnMdCancelarClick(Sender: TObject);
begin
  inherited;
  DesativaCampos;
  AtualizaCampos;
  CkbAtivosD.Enabled := True;
end;

procedure TFrmCdFornecedor.BtnMdNovoClick(Sender: TObject);
begin
  inherited;
  if Permissao('12','N') = 'N' then begin
    BtnMdCancelarClick(Self);
    Exit;
  end;
  CbxTelefone.Clear;     // limpa as combo
  CbxEstado.Clear;
  if MontaComboListBoolADO(AdoQryPegaEstado,CbxEstado) then
    CbxEstado.Text := CbxEstado.Items[0]; // monta a combo com todos os estados
  LimpaTodosCampos(TbSheetMdCadastroDados);
  AtivaCampos;
  CbxTelefone.Enabled := True;
  EdtRamal.Enabled := True;
  EdtTipoTel.Enabled := True;
  EdtRamal.ReadOnly := False;
  EdtTipoTel.ReadOnly := False;
  CkbAtivosD.Checked := True;
  CkbAtivosD.Enabled := False;
  RgPessoaD.ItemIndex := 1;
  AdoQryUltimoCodigo.Open;  {usada para calcular o proximo codigo da tabela pessoa}
  EdtCodigo.Text := IntToStr(AdoQryUltimoCodigo.FieldByName('UtCodigo').AsInteger + 1);
  AdoQryUltimoCodigo.Close;
  DtCadastro.Date := Date;
  MskNascimento.Text := DateToStr(Date);
  EdtNome.SetFocus;
end;

procedure TFrmCdFornecedor.SBtnTelefoneClick(Sender: TObject);
begin
  inherited;
  FrmCdTelefone.FormQueChamamouC(EdtCodigo.Text);
  FrmCdTelefone.FormQueChamamouN(EdtNome.Text);
  FrmCdTelefone := TFrmCdTelefone.Create(Application);
  FrmCdTelefone.Show;
end;

procedure TFrmCdFornecedor.BtnMdSalvarClick(Sender: TObject);
var
  vdata:TDateTime;
  vCodigo,AUX1,AUX2 : string;
begin
  inherited;
  CkbAtivosD.Enabled := True;
  vdata := DtCadastro.Date;              // testa se foi escolhido se o cliente é
  if RgPessoaD.ItemIndex = -1 then begin // pessoa fisica ou juridica
    ShowMessage('Você deve especificar se o cliente é pessoa física ou jurídica!');
    exit;
  end;  // if
  If RgPessoaD.ItemIndex = 0 then begin     // testa o cpf
    if Trim(MskCpf.Text) <> '' then begin
      aux1 := Copy(CalculaCnpjCpf(Copy(MskCpf.Text,1,9)),10,2);
      aux2 := Copy(MskCpf.Text,10,2);
      If (aux1 <> aux2) then begin
        ShowMessage('CPF invalido redigite ou deixe em branco!');
        MskCpf.SetFocus;
        MskCpf.Clear;
        exit;
      end;  // if
    end;
  end else begin
    if trim(MskCgc.Text) <> '' then begin
      aux1 := Copy(CalculaCnpjCpf(Copy(MskCgc.Text,1,12)),13,2);
      aux2 := Copy(MskCgc.Text,13,2);
      If (aux1 <> aux2)  then begin          // testa o cgc
        ShowMessage('CGC invalido redigite ou deixe em branco!');
        MskCgc.Clear;
        MskCgc.SetFocus;
        exit;
      end; //
    end;
  end;
  if not CamposObrigatoriosPreenchidos(TbSheetMdCadastroDados) then Exit;
  if status = [novo] then begin
    if (Length(MskCgc.Text) > 0) and (RgPessoaD.ItemIndex = 1) then begin
      With AdoQryCombFone do begin
        Sql.Clear;
        Sql.Add('Select P.cdPessoa,P.nmPessoa,J.CGC FROM Pessoa P INNER JOIN ');
        Sql.Add('P_Juridica J ON P.cdPessoa =  J.cdPessoa ');
        Sql.Add('Where J.CGC = :CGC and P.ser ='+ '''F''');
        Parameters.ParamByName('CGC').Value := MskCgc.Text;
        Open;
        if (AdoQryCombFone.RecordCount <> 0)  then begin
          Application.OnMessage := FormPrincipal.NaoProcessaMsg;
          MessageDlg ('Este CNPJ já está cadastrado com o FORNECEDOR --> ' +
            AdoQryCombFone.FieldByName('cdPessoa').AsString + ' - ' +
            AdoQryCombFone.FieldByName('nmPessoa').AsString, mtinformation, [mbOk], 0);
          Application.OnMessage := FormPrincipal.ProcessaMsg;
          EdtNome.SetFocus;
          close;
          exit;
        end;
        close;
      end;
    end;
    // testa CPF iguais
    if (Length(MskCPF.Text) > 0) and (RgPessoaD.ItemIndex = 0) then begin
      With AdoQryCombFone do begin
        Sql.Clear;
        Sql.Add('Select P.cdPessoa,P.nmPessoa,J.dsCPF FROM Pessoa P INNER JOIN ');
        Sql.Add('P_Fisica J ON P.cdPessoa =  J.cdPessoa ');
        Sql.Add('Where J.dsCPF = :CPF and P.ser ='+ '''F''');
        Parameters.ParamByName('CPF').Value := MskCpf.Text;
        Open;
        if (AdoQryCombFone.RecordCount <> 0)  then begin
          Application.OnMessage := FormPrincipal.NaoProcessaMsg;
          MessageDlg ('Este CPF já está cadastrado com o FORNECEDOR --> ' +
            AdoQryCombFone.FieldByName('cdPessoa').AsString + ' - ' +
            AdoQryCombFone.FieldByName('nmPessoa').AsString, mtinformation, [mbOk], 0);
          Application.OnMessage := FormPrincipal.ProcessaMsg;
          EdtNome.SetFocus;
          close;
          exit;
        end;
        close;
      end;
    end;
    if Length(CbxTelefone.Text) > 0 then begin
      with AdoQryAlterar do begin
        Sql.Text := 'Select Max(cdTelefone) as UtCodigo From Telefone ';
        open;
        vCodigo := IntToStr(AdoQryAlterar.FieldByName('UtCodigo').AsInteger + 1);
        close;
      end;
    end;
    With AdoQrySalvar do begin
      DModulo.Conexao.BeginTrans;
      try
        AdoQryUltimoCodigo.Open;
        EdtCodigo.Text := IntToStr(AdoQryUltimoCodigo.FieldByName('UtCodigo')
          .AsInteger + 1);
        AdoQryUltimoCodigo.Close;
        Sql.Text := 'Insert Into Pessoa (cdPessoa,nmPessoa,dtCadastro,' +
        'dsAtivo,Ser,Existir,dsMemo,dsHomePage,dsEmail) ' +
        'Values (:CDPESSOA,:NMPESSOA,:DTCADASTRO,:DSATIVO,:SER,:EXISTIR,:DSMEMO,:DSHOMEPAGE,:DSEMAIL) ';
        parameters.parambyname('CDPESSOA').value := EdtCodigo.Text;
        parameters.parambyname('NMPESSOA').value := EdtNome.Text;
        if CkbAtivosD.Checked then
          parameters.parambyname('DSATIVO').value := 'S'
        else
          parameters.parambyname('DSATIVO').value := 'N';
        parameters.parambyname('SER').value := 'F';
        parameters.parambyname('DTCADASTRO').value := DtCadastro.Date;
        parameters.parambyname('DSMEMO').value := MmCliente.Text;
        parameters.parambyname('DSHOMEPAGE').value := EdtHomePage.Text;
        parameters.parambyname('DSEMAIL').value := EdtEmail.Text;
        if RgPessoaD.ItemIndex = 0 then
          parameters.parambyname('EXISTIR').value := 'F'
        else
          parameters.parambyname('EXISTIR').value := 'J';
        ExecSql;
        Grava_Pessoa;
        Sql.Text := 'Insert Into Fornecedor (cdPessoa,dsFlag) Values (:CD ';
        Parameters.ParamByName('CD').Value := EdtCodigo.Text;
        if CkbFabricante.Checked = True then
          Sql.Add(',''S'')')
        else
          Sql.Add(',null)');
        ExecSql;
        Sql.Text := 'Insert Into Endereco (cdPessoa,nmLogradouro,cdEndereco, ' +
        'dsComplemento,dsCep,dsBairro,dsCidade,cdMunicipio,dsUf) ' +
        'Values (:CD,:ENDERECO,:CDEND,:COMPLEMENTO,:CEP,:BAIRRO, ';
        Parameters.ParamByName('CD').Value := EdtCodigo.Text;
        Parameters.ParamByName('ENDERECO').Value := EdtEndereco.Text;
        Parameters.ParamByName('CDEND').Value := EdtCodigo.Text;
        Parameters.ParamByName('COMPLEMENTO').Value := EdtComplemento.Text;
        Parameters.ParamByName('CEP').Value := EdtCep.Text;
        Parameters.ParamByName('BAIRRO').Value := EdtBairro.Text;
        if Length(EdtCdMunicipio.Text) = 5 then begin
          SQL.Add(':CIDADE,:MUNICIPIO,');
          Parameters.ParamByName('CIDADE').Value := CbxCidade.Text;
          Parameters.ParamByName('MUNICIPIO').Value := EdtCdMunicipio.Text;
        end
        else begin
          SQL.Add(':CIDADE,null,');
          Parameters.ParamByName('CIDADE').Value := EdtCidade.Text;
        end;
        Sql.Add(':ESTADO)');
        Parameters.ParamByName('ESTADO').Value := CbxEstado.Text;
        ExecSql;
        if Length(CbxTelefone.Text) > 0 then begin
          Sql.Text := 'Insert Into Telefone (nmTelefone,dsRamal,dsTelefone,cdPessoa,CdTelefone) ' +
                      'Values (:NMTELEFONE,:DSRAMAL,:DSTELEFONE,:CDPESSOA,:CDTELEFONE)';
          parameters.parambyname('NMTELEFONE').value := CbxTelefone.Text;
          parameters.parambyname('DSRAMAL').value := EdtRamal.Text;
          parameters.parambyname('DSTELEFONE').value := EdtTipoTel.Text;
          parameters.parambyname('CDPESSOA').value := EdtCodigo.Text;
          parameters.parambyname('CDTELEFONE').value := vCodigo;
          ExecSql;
        end;
        DModulo.Conexao.CommitTrans;
        Messagedlg('Inclusão Ok!', mtinformation, [mbOk], 0);
       except
        on EDBEngineError do begin
          DModulo.Conexao.RollbackTrans;
          BtnMdSalvarClick(Sender);
        end;
        on E: Exception do begin
          DModulo.Conexao.RollbackTrans;
          Messagedlg('Não foi possivel salvar os dados!', mterror, [mbOk], 0);
          EdtCodigo.Enabled := False;
          BtnMdCancelarClick(Sender);
        end;
      end;  // except
    end; // With QrySalvar
  end else begin
    With AdoQryAlterar do begin
      try
        DModulo.Conexao.BeginTrans;
        SQl.Text := 'Select Count (*) as Encontrados From Produto Where cdPessoa_1 = :PESSOA ';
        Parameters.ParamByName('PESSOA').Value := EdtCodigo.Text;
        Open;
        if (FieldByName('Encontrados').AsInteger <> 0) and
           (CkbFabricante.Checked = False) then begin
          CkbFabricante.Checked := True;
          ShowMessage('Este fornecedor está como fabricante em algum produto!');
        end;
        Sql.Text := 'Delete From P_Fisica Where cdpessoa = :CODIGO ';
        Parameters.ParamByName('CODIGO').Value := EdtCodigo.Text;
        ExecSQL;
        Sql.Text := 'Delete From P_Juridica Where cdPessoa = :CODIGO ';
        Parameters.ParamByName('CODIGO').Value := EdtCodigo.Text;
        ExecSQL;
        Grava_Pessoa;
        Sql.Text := 'Update Pessoa Set dsAtivo = :ATIVO,nmPessoa = :NOME,' +
        'dsEmail = :EMAIL,dsMemo = :MEMO,dsHomePage = :HOMEPAGE, EXISTIR = :EXISTIR ' +
        'Where cdPessoa = :CD';
        if CkbAtivosD.Checked then   //  mudar se for ativo ou não
          Parameters.ParamByName('ATIVO').Value := 'S'
        else
          Parameters.ParamByName('ATIVO').Value := 'N';
        Parameters.ParamByName('NOME').Value := EdtNome.Text;
        Parameters.ParamByName('EMAIL').Value := EdtEmail.Text;
        Parameters.ParamByName('MEMO').Value := MmCliente.Text;
        Parameters.ParamByName('HOMEPAGE').Value := EdtHomePage.Text;
        Parameters.ParamByName('CD').Value := EdtCodigo.Text;
        if RgPessoaD.ItemIndex = 0 then
          parameters.parambyname('EXISTIR').value := 'F'
        else
          parameters.parambyname('EXISTIR').value := 'J';
        ExecSql;
        Sql.Text := 'Update Endereco Set nmLogradouro = :ENDERECO,' +
        'dsComplemento = :COMPLEMENTO,dsCep = :CEP,dsBairro = :BAIRRO,dsUf = :UF,';
        Parameters.ParamByName('ENDERECO').Value := EdtEndereco.Text;
        Parameters.ParamByName('COMPLEMENTO').Value := EdtComplemento.Text;
        Parameters.ParamByName('CEP').Value := EdtCep.Text;
        Parameters.ParamByName('BAIRRO').Value := EdtBairro.Text;
        Parameters.ParamByName('UF').Value := CbxEstado.Text;
        if Length(Trim(EdtCdMunicipio.Text)) = 5 then begin
          SQL.Add('dsCidade = :CIDADE,');
          SQL.Add('cdMunicipio = :MUNICIPIO');
          Parameters.ParamByName('CIDADE').Value := CbxCidade.Text;
          Parameters.ParamByName('MUNICIPIO').Value := EdtCdMunicipio.Text;
        end else begin
          Sql.Add('dsCidade = :CIDADE,');
          SQL.Add('cdMunicipio = null ');
          Parameters.ParamByName('CIDADE').Value := EdtCidade.Text;
        end;
        Sql.Add('Where cdPessoa = :CD');
        Parameters.ParamByName('CD').Value := EdtCodigo.Text;
        ExecSql;
        if CkbFabricante.Checked = True then
          Sql.Text := 'Update Fornecedor Set dsFlag = ''S'' '
        else
          Sql.Text := 'Update Fornecedor Set dsFlag = null ';
        Sql.Add('Where cdPessoa = :CD');
        Parameters.ParamByName('CD').Value := EdtCodigo.Text;
        ExecSql;
        DModulo.Conexao.CommitTrans;
        Messagedlg('Alteração Ok!', mtinformation, [mbOk], 0);
      except
        DModulo.Conexao.RollbackTrans;
        Messagedlg('Não foi possivel alterar os dados!', mterror, [mbOk], 0);
      end; // except
    end;
  end;  // if
  DesativaCampos;
  TrataBotoesPadrao(Sender,Padrao);
  Status := [Padrao];
  AtualizaQryConsulta;
end;

procedure TFrmCdFornecedor.BtnMdAlterarClick(Sender: TObject);
var
  AuxiCombo:String[2];
begin
  inherited;
  if Permissao('12','A') = 'N' then begin
    BtnMdCancelarClick(Self);
    Exit;
  end;
  AtivaCampos;
  DtCadastro.Enabled := False;
  if RgPessoad.ItemIndex = 0 then
    VauxiAlterar := 0
  else
    VauxiAlterar := 1;
  AuxiCombo := CbxEstado.Text;
  CbxEstado.Enabled := true;
end;

procedure TFrmCdFornecedor.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  AtualizaCampos;
  PgCtrolMdCadastro.ActivePage := TBSheetMdCadastroDados;
  DesativaCampos;
  TrataBotoesPadrao(Sender,Padrao);
  Status:=[Padrao];
end;

procedure TFrmCdFornecedor.BtnMdPrimeiroClick(Sender: TObject);
begin
  inherited;
  AtualizaCampos;
end;

procedure TFrmCdFornecedor.BtnMdProximoClick(Sender: TObject);
begin
  inherited;
  AtualizaCampos;
end;

procedure TFrmCdFornecedor.BtnMdAnteriorClick(Sender: TObject);
begin
  inherited;
  AtualizaCampos;
end;

procedure TFrmCdFornecedor.BtnMdUltimoClick(Sender: TObject);
begin
  inherited;
  AtualizaCampos;
end;

procedure TFrmCdFornecedor.BtnMdExcluirClick(Sender: TObject);
begin
  inherited;
  if Permissao('12','E') = 'N' then begin
    BtnMdCancelarClick(Self);
    Exit;
  end;
  if MessageDlg('Confirma a exclusão deste Fornecedor?', MtConfirmation,
     [mbYes, mbNo], 0) = mrYes then begin
    With AdoQryExcluir do begin
      Sql.Clear;
      Sql.Add('Select dsLancamento From Lancto Where cdPessoa = :CD');
      Parameters.ParamByName('CD').Value := EdtCodigo.Text;
      Open;
      if RecordCount <> 0 then begin
        MessageDlg('Este fornecedor possui lancamentos. você não poderá excluí-lo?',
          MtConfirmation, [mbOk], 0);
        close;
        exit;
      end;
      close;
    end;
    DModulo.Conexao.BeginTrans;
    With AdoQryExcluir do begin     // exclusao de fornecedores
      try
        Sql.Clear;
        if RgPessoaD.ItemIndex = 0 then
          Sql.Add('Delete From P_Fisica ')
        else
          Sql.Add('Delete From P_Juridica ');
        Sql.Add('Where cdPessoa = :CD');
        Parameters.ParamByName('CD').Value := EdtCodigo.Text;
        ExecSql;
        Sql.Clear;
        Sql.Add('Delete From Endereco ');
        Sql.Add('Where cdPessoa = :CD');
        Parameters.ParamByName('CD').Value := EdtCodigo.Text;
        ExecSql;
        Sql.Clear;
        Sql.Add('Delete From Telefone ');
        Sql.Add('Where cdPessoa = :CD');
        Parameters.ParamByName('CD').Value := EdtCodigo.Text;
        ExecSql;
        Sql.Clear;
        Sql.Add('Delete From Fornecedor ');
        Sql.Add('Where cdPessoa = :CD');
        Parameters.ParamByName('CD').Value := EdtCodigo.Text;
        ExecSql;
        Sql.Clear;
        Sql.Add('Delete From Pessoa ');
        Sql.Add('Where cdPessoa = :CD');
        Parameters.ParamByName('CD').Value := EdtCodigo.Text;
        ExecSql;
        DModulo.Conexao.CommitTrans;
        Messagedlg('Fornecedor excluído com sucesso!', mtinformation, [mbOk], 0);
      except
        DModulo.Conexao.RollbackTrans;
        Messagedlg('Você não pode excluir este fornecedor!', mterror, [mbOk], 0);
      end;
    end;
    EdtNome.SetFocus;
    AdoQryConsulta.Next;
    EdtCodigo.Text := AdoQryConsulta.FieldByName('Código').AsString;
    AtualizaQryConsulta;
    AtualizaCampos;
  end;
end;

procedure TFrmCdFornecedor.FormCreate(Sender: TObject);
begin
  inherited;
    With CmbConsulta do begin  // adiciona itens a combo de consulta
      Items.Clear;
      Items.Add('Todos');
      Items.Add('Código');
      Items.Add('Nome');
      Items.Add('Endereço');
      Items.Add('Bairro');
      Items.Add('n° Telefone');
      Items.Add('CNPJ');
      Items.Add('CPF');
      Text := Items[2];
      ItemIndex := 2;
    end;
    PgCtrolMdCadastro.ActivePage := TBSheetMdCadastroConsulta;
    TBSheetMdCdRelatorio.TabVisible := False; // oculta a pagina do relatorio
    MontaComboListBoolADO(AdoQryPegaEstado,CbxEstado);
end;

procedure TFrmCdFornecedor.BtnMdImprimirClick(Sender: TObject);
begin
  inherited;
  FrmRelFornecedor := TFrmRelFornecedor.Create(Self);
  if Permissao('12','I') = 'N' then Exit;
  With FrmRelFornecedor.ADOQryRelDados do begin
    Sql.Clear;
    Sql.Add('Select P.cdPessoa,P.nmPessoa,E.nmLogradouro,E.dsBairro,');
    Sql.Add('E.dsCidade,E.dsUf ');
    Sql.Add('From Pessoa P,Endereco E, Fornecedor C ');
    Sql.Add('Where P.Ser = ''F'' and P.cdPessoa = E.cdPessoa ');
    Sql.Add('and P.cdPessoa = C.cdPessoa');
    if RgPessoa.ItemIndex = 0 then
      FrmRelFornecedor.QrLblPessoa.Caption := 'Físicos & Juridicos'
    else
      if RgPessoa.ItemIndex = 1 then begin
        FrmRelFornecedor.QrLblPessoa.Caption := 'Físicos';
        Sql.Add('and P.Existir = ''F'' ');
      end else begin
        FrmRelFornecedor.QrLblPessoa.Caption := 'Juridicos';
        Sql.Add('and P.Existir = ''J'' ');
      end;
      case RGAtvInatv.ItemIndex of
        0: FrmRelFornecedor.QrLblAtivo.Caption := 'Todos';
        1: FrmRelFornecedor.QrLblAtivo.Caption := 'Ativos';
        2: FrmRelFornecedor.QrLblAtivo.Caption := 'Inativos';
      end;
    case RgFabricante.ItemIndex of
      1: Sql.Add('and C.dsFlag is null');  // somente os nao fabricantes
      2: Sql.Add('and C.dsFlag =''S'''); // somente os  fabricantes
    end;
    Sql.Add('Order By P.nmPessoa');
    Open;
  end;
  FrmRelFornecedor.QRMdRel.Preview;
  FrmRelFornecedor.Free;
end;

procedure TFrmCdFornecedor.BtnMdSairClick(Sender: TObject);
begin
  inherited;
  FormPrincipal.MiFornecedores.Enabled := True;
end;

procedure TFrmCdFornecedor.RgPessoaDClick(Sender: TObject);
begin
  inherited;
  if RgPessoaD.ItemIndex = 0 then begin // fisico
    MskCgc.Visible := false;
    LblCgc.Visible := false;
    LblInscricao.Visible := false;
    MskInscricao.Visible := false;
    Label1.Visible := false;
    EdtRazao.Visible := false;
    LblContato.Visible := false;
    EdtContato.Visible := false;
    Label2.Visible := false;
    EdtTelContato.Visible := false;
    LblRamalContato.Visible := false;
    EdtRamalContato.Visible := false;
    MskCpf.Visible := True;
    LblCpf.Visible := True;
    LblIdade.Visible := True;
    MskNascimento.Visible := True;
    LblIdentidade.Visible := True;
    EdtIdentidade.Visible := True;
    LblNaruralidade.Visible := True;
    EdtNaturalidade.Visible := True;
  end else begin                   // juridico
    MskCpf.Visible := False;
    LblCpf.Visible := False;
    LblIdade.Visible := False;
    MskNascimento.Visible := False;
    LblIdentidade.Visible := False;
    EdtIdentidade.Visible := False;
    LblNaruralidade.Visible := False;
    EdtNaturalidade.Visible := False;
    MskCgc.Visible := True;
    LblCgc.Visible := True;
    LblInscricao.Visible := True;
    MskInscricao.Visible := True;
    Label1.Visible := True;
    EdtRazao.Visible := True;
    LblContato.Visible := True;
    EdtContato.Visible := True;
    Label2.Visible := True;
    EdtTelContato.Visible := True;
    LblRamalContato.Visible := True;
    EdtRamalContato.Visible := True;
  end;
end;

procedure TFrmCdFornecedor.MmClienteEnter(Sender: TObject);
begin
  inherited;
  Application.OnMessage := FormPrincipal.NaoProcessaMsg;
end;

procedure TFrmCdFornecedor.MmClienteExit(Sender: TObject);
begin
  inherited;
  Application.OnMessage := FormPrincipal.ProcessaMsg;
end;

procedure TFrmCdFornecedor.RGAtvInatvClick(Sender: TObject);
begin
  inherited;
  AtualizaQryConsulta;
end;

procedure TFrmCdFornecedor.CmbConsultaChange(Sender: TObject);
begin
  inherited;
  case CmbConsulta.ItemIndex of  // cnpj e cpf
    6,7: RgPessoa.ItemIndex := 0;
  end;
end;

procedure TFrmCdFornecedor.CbxEstadoChange(Sender: TObject);
begin
  inherited;
  Label8.Visible := False;
  EdtCidade.Color := clWindow;
  EdtCidade.Left := 68;
  EdtCidade.Top := 129;
  if CbxEstado.Text = 'SE' then begin
    CbxCidade.Visible := true;
  end else begin
    EdtCidade.Visible := True;
    CbxCidade.Visible := false;
  end;
end;

procedure TFrmCdFornecedor.CbxCidadeChange(Sender: TObject);
begin
  inherited;
  if CbxCidade.ItemIndex <> -1 then begin
    AdoQryMunicipio.Open;
    AdoQryMunicipio.Locate('dsMunicipio',CbxCidade.Text,[]);
    EdtCdMunicipio.Text := AdoQryMunicipio.FieldByName('cdMunicipio').AsString;
    AdoQryMunicipio.Close;
  end else begin
    EdtCdMunicipio.Clear;
  end;
end;

procedure TFrmCdFornecedor.CbxTelefoneChange(Sender: TObject);
begin
  inherited;
  if CbxTelefone.ItemIndex <> -1 then begin
    AdoQryCombFone.Open;
    AdoQryCombFone.Locate ('nmTelefone',CbxTelefone.Text,[]);
    EdtRamal.Text := AdoQryCombFone.FieldByName('dsRamal').AsString;
    EdtTipoTel.Text := AdoQryCombFone.FieldByName('dsTelefone').AsString;
  end;  
end;

procedure TFrmCdFornecedor.MskInscricaoExit(Sender: TObject);
begin
  inherited;
  MskInscricao.Text := AlinharDireitaMsk(MskInscricao);
end;

procedure TFrmCdFornecedor.Help1Click(Sender: TObject);
begin
  inherited;
  Application.HelpContext(19);
end;

procedure TFrmCdFornecedor.Grava_Pessoa;
begin
  With AdoQrySalvar do begin
    if RgPessoaD.ItemIndex = 0 then begin
      Sql.Text := 'Insert Into P_Fisica (cdPessoa,dsCpf,dsIdentidade, ' +
      'dtNascimento,dsNaturalidade) ' +
      'Values (:CD,:CPF,:RG,:NASCIMENTO,:NATURALIDADE) ';
      Parameters.ParamByName('CD').Value := EdtCodigo.Text;
      Parameters.ParamByName('CPF').Value := MskCpf.Text;
      Parameters.ParamByName('RG').Value := EdtIdentidade.Text;
      Parameters.ParamByName('NATURALIDADE').Value := EdtNaturalidade.Text;
      if (Length(MskNascimento.Text) = 10) and (MskNascimento.Text <> '  /  /    ') then
        parameters.parambyname('NASCIMENTO').value := MskNascimento.Text
      else
        parameters.parambyname('NASCIMENTO').value := '01/01/1900';
    end else begin
      Sql.Text := 'Insert Into P_Juridica (cdPessoa,CGC,dsInscricaoEstadual, ' +
      'nmRazao,nmContato,dsTelefContato,dsRamalContato) ' +
      'Values (:CD,:CGC,:INSCRICAO,:RAZAO,:CONTATO,:TELCONTATO,:RAMAL) ';
      Parameters.ParamByName('CD').Value := EdtCodigo.Text;
      Parameters.ParamByName('CGC').Value := MskCgc.Text;
      Parameters.ParamByName('INSCRICAO').Value := Trim(MskInscricao.Text);
      Parameters.ParamByName('RAZAO').Value := EdtRazao.Text;
      Parameters.ParamByName('CONTATO').Value := EdtContato.Text;
      Parameters.ParamByName('TELCONTATO').Value := EdtTelContato.Text;
      Parameters.ParamByName('RAMAL').Value := EdtRamalContato.Text;
    end;
    ExecSql;
  end;
end;

procedure TFrmCdFornecedor.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if ADOQryConsulta.FieldByName('dsAtivo').AsString = 'N' then begin
    DBGrid1.Canvas.Font.Color:= clRed;
    DBGrid1.Canvas.FillRect(Rect);
    DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

end.
