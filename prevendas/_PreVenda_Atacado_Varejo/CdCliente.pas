unit CdCliente;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FrmCadEstados, Db,  ExtCtrls, StdCtrls, Grids, DBGrids, DateUtils,
  ComCtrls, Buttons, Mask, ImgList, Menus, ADODB, DBTables, Variants,
  System.ImageList;

type TAuxDBGrid = class(TDBGrid);

type
  TFrmCdCliente = class(TFrmMdCadastro)
    RgPessoa: TRadioGroup;
    LblCodigo: TLabel;
    LblNome: TLabel;
    EdtCodigo: TEdit;
    EdtNome: TEdit;
    RgPessoaD: TRadioGroup;
    CkbAtivosD: TCheckBox;
    LblEndereco: TLabel;
    LblComp: TLabel;
    LblBairro: TLabel;
    LblCidade: TLabel;
    LblCep: TLabel;
    EdtEndereco: TEdit;
    EdtComplemento: TEdit;
    EdtBairro: TEdit;
    EdtCidade: TEdit;
    CbxTelefone: TComboBox;
    CbxEstado: TComboBox;
    EdtRamal: TEdit;
    LblEstado: TLabel;
    LblTelefone: TLabel;
    LblRamal: TLabel;
    LblDataCadastro: TLabel;
    MmCliente: TMemo;
    LblCpf: TLabel;
    LblIdentidade: TLabel;
    LblIdade: TLabel;
    EdtIdentidade: TEdit;
    MskCpf: TMaskEdit;
    LblCgc: TLabel;
    MskCgc: TMaskEdit;
    MskInscricao: TMaskEdit;
    LblInscricao: TLabel;
    Label1: TLabel;
    EdtRazao: TEdit;
    LblContato: TLabel;
    EdtContato: TEdit;
    Label2: TLabel;
    EdtTelContato: TEdit;
    LblRamalContato: TLabel;
    EdtRamalContato: TEdit;
    SBtnTelefone: TSpeedButton;
    EdtCep: TMaskEdit;
    LblNaruralidade: TLabel;
    EdtNaturalidade: TEdit;
    EdtHomePage: TEdit;
    EdtEmail: TEdit;
    LblHomePage: TLabel;
    LblEmail: TLabel;
    MskNascimento: TMaskEdit;
    DtCadastro: TDateTimePicker;
    EdtLimite: TEdit;
    Label3: TLabel;
    dtData1: TDateTimePicker;
    dtData2: TDateTimePicker;
    LblA: TLabel;
    Label4: TLabel;
    RGAtvInatv: TRadioGroup;
    CBTpCliente: TComboBox;
    Label5: TLabel;
    ChkBTpcliente: TCheckBox;
    EdtcdTpCliente: TEdit;
    CbBtpCli: TComboBox;
    EdtcdtpCli: TEdit;
    Label6: TLabel;
    CbxCidade: TComboBox;
    EdtTipoTel: TEdit;
    Label7: TLabel;
    EdtCdMunicipio: TEdit;
    MskInscricao2: TMaskEdit;
    LblListados: TLabel;
    AdoQryTpCliente: TADOQuery;
    AdoQryMunicipio: TADOQuery;
    TabSheet1: TTabSheet;
    Label9: TLabel;
    Label10: TLabel;
    RgTpVencimento: TRadioGroup;
    EdtDias: TEdit;
    StaticText2: TStaticText;
    Panel2: TPanel;
    Label11: TLabel;
    EdtDia2: TEdit;
    StaticText1: TStaticText;
    StaticText3: TStaticText;
    Label12: TLabel;
    CbxRegiao: TComboBox;
    EdtCdRegiao: TEdit;
    Label13: TLabel;
    CbxVendedor: TComboBox;
    EdtCdVendedor: TEdit;
    AdoQryFuncionario: TADOQuery;
    AdoQryGrupo: TADOQuery;
    ckRestricao: TCheckBox;
    EdtMotivo: TEdit;
    CkAtacado: TCheckBox;
    Label15: TLabel;
    EdtLocalizacao: TEdit;
    LblCadastro: TLabel;
    Label16: TLabel;
    EdtPrevenda: TEdit;
    Label8: TLabel;
    EdtDescVista: TEdit;
    Label17: TLabel;
    EdtDescPrazo: TEdit;
    CkVista: TCheckBox;
    RGTipoCliente: TRadioGroup;
    EdtNumero: TEdit;
    LblNumero: TLabel;
    EdtFormaReceb: TEdit;
    Label18: TLabel;
    BtBtnMapa: TBitBtn;
    EdtEmail_Danfe: TEdit;
    EdtnrCartao: TEdit;
    Label14: TLabel;
    BtnCriarNrCartao: TButton;
    SpdBtnCEP: TSpeedButton;
    Label20: TLabel;
    edtComissao: TEdit;
    ADOQryConsultaCdigo: TIntegerField;
    ADOQryConsultadstipoRecebimento: TStringField;
    ADOQryConsultaCliente: TStringField;
    ADOQryConsultaLimite_Crdito: TBCDField;
    ADOQryConsultadsEmail: TStringField;
    ADOQryConsultaSer: TStringField;
    ADOQryConsultadsEmailNfe: TStringField;
    ADOQryConsultaExistir: TStringField;
    ADOQryConsultadsHomePage: TStringField;
    ADOQryConsultaDtCadastro: TDateTimeField;
    ADOQryConsultadsUsuario: TStringField;
    ADOQryConsultadtAlteracao: TDateTimeField;
    ADOQryConsultadsPreVenda: TStringField;
    ADOQryConsultavlDescVista: TFloatField;
    ADOQryConsultavlDescPrazo: TFloatField;
    ADOQryConsultaDsAtivo: TStringField;
    ADOQryConsultaDsPublicoPrivado: TStringField;
    ADOQryConsultaExcluir: TStringField;
    ADOQryConsultaComissaoCliente: TFloatField;
    ADOQryConsultaEndereo: TStringField;
    ADOQryConsultaComplemento: TStringField;
    ADOQryConsultaBairro: TStringField;
    ADOQryConsultaCidade: TStringField;
    ADOQryConsultaCEP: TStringField;
    ADOQryConsultacdRegiao: TIntegerField;
    ADOQryConsultaRegiao: TStringField;
    ADOQryConsultaEstado: TStringField;
    ADOQryConsultaTipCli: TIntegerField;
    ADOQryConsultanrDiaVenc: TIntegerField;
    ADOQryConsultaOutro: TStringField;
    ADOQryConsultanrDiaVenc2: TIntegerField;
    ADOQryConsultacdPessoa_1: TIntegerField;
    ADOQryConsultadsMotivo: TStringField;
    ADOQryConsultadsRestricao: TStringField;
    ADOQryConsultadsAtacado: TStringField;
    ADOQryConsultadsLocalizacao: TStringField;
    ADOQryConsultanrCartao: TStringField;
    ADOQryConsultadsVista: TStringField;
    ADOQryConsultanrNumero: TStringField;
    Label19: TLabel;
    TbSheetContratos: TTabSheet;
    TbSheetRelatorio: TTabSheet;
    Bevel5: TBevel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Bevel6: TBevel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Bevel7: TBevel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    EdtVisitas: TEdit;
    CBStatus: TComboBox;
    EdtRamais: TEdit;
    CBTecnico: TComboBox;
    CBCodigoTec: TComboBox;
    EdtContrato: TEdit;
    Edtoutros: TEdit;
    Button1: TButton;
    EdtDataChegada: TDateTimePicker;
    EdtDataSaida: TDateTimePicker;
    CbxEquipamento: TComboBox;
    EdtNrObjeto: TEdit;
    EdtEquipamento: TEdit;
    Bevel8: TBevel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    RadioGroup1: TRadioGroup;
    ComboBox2: TComboBox;
    Edit1: TEdit;
    dtInicio: TDateTimePicker;
    dtFim: TDateTimePicker;
    RadioGroup2: TRadioGroup;
    AdoQryEquipamento: TADOQuery;
    AdoQryTecnico: TADOQuery;
    ADOQryConsultadtInicio: TDateTimeField;
    ADOQryConsultadtFim: TDateTimeField;
    ADOQryConsultanrVisitas: TIntegerField;
    ADOQryConsultatpStatus: TIntegerField;
    ADOQryConsultadsEquipamentos: TStringField;
    ADOQryConsultanrRamais: TIntegerField;
    ADOQryConsultadsOutros: TStringField;
    ADOQryConsultacdTecnico: TIntegerField;
    ADOQryConsultanrObjeto: TIntegerField;
    ADOQryConsultaNr_contrato: TStringField;
    MskInscricaoMunic: TMaskEdit;
    LblInscMunicipal: TLabel;
    ADOQryConsultadsIsento: TIntegerField;
    ckbIsento: TCheckBox;
    ADOQryConsultadsMemo: TStringField;
    EdtCdMatriz: TEdit;
    LblMatriz: TLabel;
    ADOQryConsultacdMatriz: TIntegerField;
    CbxFaturaUnica: TCheckBox;
    ADOQryConsultadsFaturaUnica: TBooleanField;
    ckbIndIEDest: TCheckBox;
    ADOQryConsultadsIndIEDest: TIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure EdtConsultaChange(Sender: TObject);
    procedure RgPessoaClick(Sender: TObject);
    procedure RgClassificacaoClick(Sender: TObject);
    procedure CkbAtivosClick(Sender: TObject);
    procedure BtnMdPrimeiroClick(Sender: TObject);
    procedure BtnMdProximoClick(Sender: TObject);
    procedure BtnMdAnteriorClick(Sender: TObject);
    procedure BtnMdUltimoClick(Sender: TObject);
    procedure BtnMdSalvarClick(Sender: TObject);
    procedure BtnMdNovoClick(Sender: TObject);
    procedure BtnMdCancelarClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure PgCtrolMdCadastroChange(Sender: TObject);
    procedure TBSheetMdCadastroConsultaEnter(Sender: TObject);
    procedure BtnMdExcluirClick(Sender: TObject);
    procedure SBtnTelefoneClick(Sender: TObject);
    procedure BtnMdAlterarClick(Sender: TObject);
    procedure BtnMdImprimirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnMdSairClick(Sender: TObject);
    procedure RgPessoaDClick(Sender: TObject);
    procedure EdtLimiteKeyPress(Sender: TObject; var Key: Char);
    procedure EdtLimiteExit(Sender: TObject);
    procedure CmbConsultaClick(Sender: TObject);
    procedure dtData2Change(Sender: TObject);
    procedure dtData1Change(Sender: TObject);
    procedure MmClienteEnter(Sender: TObject);
    procedure MmClienteExit(Sender: TObject);
    procedure RGAtvInatvClick(Sender: TObject);
    procedure ChkBTpclienteClick(Sender: TObject);
    procedure CbBtpCliChange(Sender: TObject);
    procedure CbxEstadoChange(Sender: TObject);
    procedure CbxCidadeChange(Sender: TObject);
    procedure CbxTelefoneChange(Sender: TObject);
    procedure CBTpClienteChange(Sender: TObject);
    procedure MskInscricao2Exit(Sender: TObject);
    procedure MskInscricaoExit(Sender: TObject);
    procedure Help1Click(Sender: TObject);
    procedure EdtDiasExit(Sender: TObject);
    procedure EdtDiasKeyPress(Sender: TObject; var Key: Char);
    procedure RgTpVencimentoClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure EdtDia2Exit(Sender: TObject);
    procedure CbxRegiaoChange(Sender: TObject);
    procedure CbxVendedorChange(Sender: TObject);
    procedure EdtDescVistaExit(Sender: TObject);
    procedure EdtDescPrazoExit(Sender: TObject);
    procedure EdtDescVistaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtDescPrazoKeyPress(Sender: TObject; var Key: Char);
    procedure RGTipoClienteClick(Sender: TObject);
    procedure CbxCidadeExit(Sender: TObject);
    procedure BtBtnMapaClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure EdtCepExit(Sender: TObject);
    procedure BtnCriarNrCartaoClick(Sender: TObject);
    procedure SpdBtnCEPClick(Sender: TObject);
    procedure edtComissaoExit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure CBTecnicoChange(Sender: TObject);
    procedure CbxEquipamentoChange(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure TbSheetRelatorioEnter(Sender: TObject);
    procedure EdtConsultaKeyPress(Sender: TObject; var Key: Char);
    procedure ADOQryConsultaAfterScroll(DataSet: TDataSet);
    procedure EdtCdMatrizExit(Sender: TObject);
    procedure MskInscricao2KeyPress(Sender: TObject; var Key: Char);
    procedure MskInscricaoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtNumeroKeyPress(Sender: TObject; var Key: Char);
    procedure EdtVisitasExit(Sender: TObject);
    procedure ckbIndIEDestClick(Sender: TObject);
    procedure MskInscricaoChange(Sender: TObject);
  private
     PARAM :string;
     Clickou:Boolean;
     vcheck : boolean;
     salvouOCiente : Boolean;  // será true quando o usuário incluir ou alterar um item
    { Private declarations }
    procedure AtualizaQryConsulta;
    procedure AtualizaCampos;
    procedure Grava_Pessoa;
    procedure CarregaMapa;
    procedure salvar_em_itePreco(cdCliente: Integer);
    procedure MontaComboVendedor;
    Function CNPJ_CPFIguais: Boolean;
    procedure TornarObrigatorioRazaoSocial(Obrigatorio:Boolean);
  public
    { Public declarations }
     Linha : integer;
     VauxiAlterar : integer;  // usada para verificar se antes de alterar o cliente
     procedure AtivaCampos;
     procedure DesativaCampos;
     procedure Grava_Sped(codigo : string);
     procedure preencheVetorSped(tipo : string;nome : string;mskCgc : string;mskCpf : string;
                            mskInscricao : string;Municipio :string;
                            Endereco : string; numero :string;compl : string;
                            bairro : string);


  end;

var
  FrmCdCliente: TFrmCdCliente;
  CNPJAtual: string;

implementation

uses FrmPrincipal, CdTelefone, DataModulo, uFuncoesPadrao, RelCliente,
  VerMapa, RelClienteTelequipe, MoPreVenda, NEGLoja;

{$R *.DFM}

var
  v_comparaSedAntes : array [1..9] of string;
  v_comparaSedDepois : array [1..9] of string;


procedure TFrmCdCliente.preencheVetorSped(tipo : string;nome : string;mskCgc : string;mskCpf : string;
                            mskInscricao : string;Municipio :string;
                            Endereco : string; numero :string;compl : string;
                            bairro : string);
begin

  if tipo = 'A' then begin
    v_comparaSedAntes[1] := Nome;
    v_comparaSedAntes[2] := mskCgc;
    v_comparaSedAntes[3] := mskCpf;
    v_comparaSedAntes[4] := mskInscricao;
    v_comparaSedAntes[5] := Municipio;
    v_comparaSedAntes[6] := Endereco;
    v_comparaSedAntes[7] := Numero;
    v_comparaSedAntes[8] := Compl;
    v_comparaSedAntes[9] := Bairro;
  end else if tipo = 'D' then begin
    v_comparaSedDepois[1] := Nome;
    v_comparaSedDepois[2] := mskCgc;
    v_comparaSedDepois[3] := mskCpf;
    v_comparaSedDepois[4] := mskInscricao;
    v_comparaSedDepois[5] := Municipio;
    v_comparaSedDepois[6] := Endereco;
    v_comparaSedDepois[7] := Numero;
    v_comparaSedDepois[8] := Compl;
    v_comparaSedDepois[9] := Bairro;
  end;
end;


procedure TFrmCdCliente.DesativaCampos;
// impossibilita a digitação de dados
begin
  CbBtpCli.Enabled          := false;
  SbtnTelefone.Enabled      := True;
  CbxTelefone.Enabled       := True;
  CbxCidade.Enabled         := false;
  EdtRamal.Enabled          := True;
  EdtTipoTel.Enabled        := True;
  MskCpf.ReadOnly           := True;
  MskCgc.ReadOnly           := True;
  MskInscricao.ReadOnly     := True;
  MskInscricao2.ReadOnly    := True;
  MskInscricaoMunic.ReadOnly:= True;
  MskNascimento.ReadOnly    := True;
  DtCadastro.Enabled        := False;
  MmCliente.ReadOnly        := True;
  EdtLimite.ReadOnly        := True;
  EdtCodigo.ReadOnly        := True;
  EdtNome.ReadOnly          := True;
  EdtDescVista.ReadOnly     := True;
  EdtCdMatriz.ReadOnly      := True;
  EdtHomePage.ReadOnly      := True;
  EdtEmail.ReadOnly         := True;
  Edtemail_danfe.ReadOnly   := True;
  EdtEndereco.ReadOnly      := True;
  EdtDias.ReadOnly          := True;
  edtComissao.ReadOnly      := true;
  EdtDia2.ReadOnly          := True;
  EdtBairro.ReadOnly        := TrUe;
  EdtCidade.ReadOnly        := True;
  EdtComplemento.ReadOnly   := True;
  EdtCep.ReadOnly           := True;
  EdtIdentidade.ReadOnly    := True;
  EdtRazao.ReadOnly         := True;
  EdtContato.ReadOnly       := True;
  EdtTelContato.ReadOnly    := True;
  EdtRamalContato.ReadOnly  := True;
  EdtTipoTel.ReadOnly       := True;
  CbxVendedor.Enabled       := False;
  CbxRegiao.Enabled         := False;
  CkRestricao.Enabled       := False;
  CkAtacado.Enabled         := False;
  CkbAtivosD.Enabled        := False;
  ckbIsento.Enabled         := False;
  CkVista.Enabled           := False;
  EdtMotivo.readonly        := True;
  EdtLocalizacao.readonly   := True;
  EdtPrevenda.readonly      := True;
  EdtNumero.ReadOnly        := True;
  BtnCriarNrCartao.Enabled  := False;
  CbxFaturaUnica.Enabled    := False;
  ckbIndIEDest.Enabled      := False;
  if PgCtrolMdCadastro.ActivePage = TBSheetMdCadastroDados then
     self.EdtNome.SetFocus
  else if PgCtrolMdCadastro.ActivePage = TabSheet1 then
     self.EdtDias.SetFocus;
end;  // procedure Desativa campos

procedure TFrmCdCliente.AtivaCampos;
// abilita a digitação de dados
begin
  MskInscricaoMunic.ReadOnly := False;
  CbBtpCli.Enabled := True;
  SbtnTelefone.Enabled := False;
  CbxVendedor.Enabled  := True;
  CbxRegiao.Enabled    := True;
  CbxCidade.Enabled    := True;
  CbxTelefone.Enabled  := False;
  EdtRamal.Enabled     := False;
  EdtTipoTel.Enabled   := False;
  CbxEstado.Enabled := True;
  MskCpf.ReadOnly   := False;
  MskCgc.ReadOnly   := False;
  MskInscricao.ReadOnly   := False;
  MskInscricao2.ReadOnly  := False;
  MskNascimento.ReadOnly  := False;
  EdtNumero.ReadOnly      := False;
  DtCadastro.Enabled := True;
  MmCliente.ReadOnly := False;
  EdtLimite.ReadOnly := False;
  EdtNome.ReadOnly   := False;
  EdtCdMatriz.ReadOnly := false;
  edtComissao.ReadOnly := False;
  EdtHomePage.ReadOnly := False;
  EdtEmail.ReadOnly    := False;
  EdtEmail_Danfe.ReadOnly := False;
  EdtEndereco.ReadOnly := False;
  EdtBairro.ReadOnly := False;
  EdtCidade.ReadOnly := False;
  EdtDescVista.ReadOnly := False;
  EdtDias.ReadOnly   := False;
  EdtDia2.ReadOnly   := False;
  EdtComplemento.ReadOnly := False;
  EdtCep.ReadOnly := False;
  EdtIdentidade.ReadOnly   := False;
  EdtRazao.ReadOnly        := False;
  EdtContato.ReadOnly      := False;
  EdtTelContato.ReadOnly   := False;
  EdtRamalContato.ReadOnly := False;
  CkRestricao.Enabled      := True;
  CkAtacado.Enabled        := True;
  CkbAtivosD.Enabled       := True;
  ckbIsento.Enabled        := True;
  //if MskInscricao.Text <> '' then
  ckbIndIEDest.Enabled     := True;
  CkVista.Enabled          := True;
  EdtMOtivo.readonly       := False;
  EdtLocalizacao.readonly  := False;
  EdtPreVenda.readonly     := False;
  BtnCriarNrCartao.Enabled := True;
  CbxFaturaUnica.Enabled   := True;
end;  // procedure AtivaCampos

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

procedure TfrmCdCliente.AtualizaQryConsulta;
var vdata1,vdata2 : String[10];
    nome: string;
begin
  With AdoQryConsulta do
  begin
    SQL.Text := 'Declare @texto varchar(40) Set @texto = :PARAMETRO                                           '+
                'Select distinct P.CdPessoa as Código,P.dsTipoRecebimento,P.nmPessoa as Cliente,C.dsLimCredito            '+
                'as Limite_Crédito,P.dsEmail,P.dsEmailNfe,C.dsIsento,P.Ser,P.Existir,P.dsHomePage,P.DtCadastro,           '+
                'P.dsUsuario,P.dtAlteracao,C.dsPreVenda,C.vlDescVista,C.vlDescPrazo,P.dsIndIEDest,                        '+
                'P.DsAtivo,convert(varchar(5000),P.dsMemo) as dsMemo,C.DsPublicoPrivado,C.dsExcluir as Excluir, isnull(P.vlComissao,0) as ComissaoCliente, '+
                'E.nmLogradouro as Endereço,E.dsComplemento as Complemento,C.dsMotivo,C.dsRestricao,C.dsAtacado,          '+
                'C.dsVista,C.dsLocalizacao,E.dsBairro as Bairro,E.dsCidade as Cidade,E.dsCep as CEP,C.cdRegiao,           '+
                'R.dsRegiao as Regiao,E.nrNumero, E.dsUf as Estado,                                     '+
                'C.cdCodigo as TipCli,C.nrDiaVenc,F.nmRazao as Outro,C.nrDiaVenc2,C.cdPessoa_1, C.nrCartao, C.cdMatriz, C.dsFaturaUnica ';
    if UPPERCASE(vEmpresa) = 'TELEQUIPE' then
    begin
      sql.Add(',C.dsContrato as Nr_Contrato,C.dtInicio,C.dtFim,C.nrVisitas,C.tpStatus,');
      sql.Add('C.dsEquipamentos,C.nrRamais,C.dsOutros,C.cdTecnico,C.nrObjeto          ');
    end;
    sql.Add('From Pessoa as P WITH (NOLOCK)                                           ');
    sql.Add('left join  Telefone T with (nolock) ON T.cdPessoa = P.cdPessoa           ');
    sql.Add('Inner Join Cliente as C WITH (NOLOCK) ON P.cdPessoa = C.cdPessoa         ');
    sql.Add('left join  Endereco as E WITH (NOLOCK) ON P.cdPessoa = E.cdPessoa        ');
    sql.Add('Left Join  P_Juridica as F WITH (NOLOCK) ON P.cdPessoa = F.cdPessoa      ');
    sql.Add('Left Join P_Fisica as PF WITH (NOLOCK) ON P.cdPessoa = PF.cdPessoa       ');
    sql.Add('Left Join  Regiao as R WITH (NOLOCK) ON C.cdRegiao = R.cdRegiao          ');
    //Sql.Add(',Telefone T ');
    //if CmbConsulta.ItemIndex = 6 then Sql.Add(',Telefone T '); // Telefone
    Sql.Add('Where P.Ser = ''C'' ');
    //Sql.Add('and P.cdPessoa = T.cdPessoa ');
    //if CmbConsulta.ItemIndex = 6 then Sql.Add('and P.cdPessoa = T.cdPessoa '); // Telefone
    case RgPessoa.ItemIndex of
      1: Sql.Add('and P.Existir = ''F'' ');
      2: Sql.Add('and P.Existir = ''J'' ');
    end;
    case RGAtvInatv.ItemIndex of
      1: Sql.Add('and P.DsAtivo = ''S'' ');
      2: Sql.Add('and P.DsAtivo = ''N'' ');
    end;
    case RGTipoCliente.ItemIndex of
      1: Sql.Add('and C.DsAtacado = ''S'' ');
      2: Sql.Add('and C.DsAtacado = ''N'' ');
    end;
    if ChkBTpcliente.Checked = true then
      Sql.Add('and C.cdCodigo = '+EdtcdTpCliente.Text+' ');
    case CmbConsulta.ItemIndex of
//      0: Sql.Add('Order By P.nmPessoa ');
      1:  Sql.Add('and P.CdPessoa Like '''+ EdtConsulta.Text +'%'' ');
      2:  Sql.Add('and P.nmPessoa Like @texto ');
      3: begin
//        Sql.Add('case when P.Existir = ''F'' then F.dtNascimento else null end as dtNascimento ');
        Sql.Add('and PF.dtNascimento BETWEEN :DTINICIO and :DTFIM ');
//        Sql.Add('and P.dtCadastro BETWEEN :DTINICIO1 and :DTFIM1 ');
        parameters.parambyname('DTINICIO').Value := Dateof(DtData1.Date);//'07/30/1979';//DateToStr(DtData1.Date);
        parameters.parambyname('DTFIM').Value    := Dateof(DtData2.Date);//'07/30/1979';//DateToStr(DtData1.Date);
      end;
      4:  Sql.Add('and E.nmLogradouro Like '''+ EdtConsulta.Text +'%'' ');
      5:  Sql.Add('and E.dsBairro Like '''+ EdtConsulta.Text +'%'' ');
      6:
      begin
        if EdtConsulta.Text <> '%' then
          Sql.Add('and isnull(T.nmTelefone,'''') Like '''+ EdtConsulta.Text +'%'' ')
        else
          Sql.Add('and isnull(T.nmTelefone,'''') Like '+ QuotedStr(EdtConsulta.Text) +' ');
      end;
      7:  SQL.add('and (convert(varchar(14),F.CGC)) Like '''+ EdtConsulta.Text +'%'' ');
      8:  Sql.Add('and (convert(varchar(11),PF.dsCPF)) Like '''+ EdtConsulta.Text +'%'' ');
      9:  Sql.Add('and E.dscidade Like '''+ EdtConsulta.Text +'%'' ');  // cidade
//      10: Sql.Add('and F.nmContato Like '''+ EdtConsulta.Text +'%'' '); // cidade
      10: begin
        sql.add('and (case when (P.Existir = ''F'') then PF.dsNaturalidade      ');
        sql.add('when (P.Existir = ''J'') then F.nmContato end ) like '''+ EdtConsulta.Text +'%''  ');
      end;
      11: Sql.Add('and R.dsRegiao Like '''+ EdtConsulta.Text +'%'' ');  // regiao
      12: Sql.Add('and E.cdPessoa = P.cdPessoa and E.dsUf like '''+ EdtConsulta.Text +'%'' ');  // cidade
      13: Sql.Add('and F.cdPessoa = P.cdPessoa and F.nmRazao Like @texto ');
//      13: Sql.Add('and F.cdPessoa = P.cdPessoa and F.nmRazao Like '''+ EdtConsulta.Text +'%'' ');
      14:
      begin
        Sql.Add('and CONVERT(varchar(10),C.cdpessoa_1) like :CDPESSOA_1 '); // cod vendedor
        Parameters.ParamByName('CDPESSOA_1').Value := EdtConsulta.Text ;
      end;
      15: Sql.Add('and P.dsEmail Like '''+ EdtConsulta.Text +'%'' '); // email
      16:
      begin
        Sql.Add('and P.dtCadastro BETWEEN :DTINICIO1 and :DTFIM1 ');
        parameters.parambyname('DTINICIO1').Value := Dateof(DtData1.Date);//'07/30/1979';//DateToStr(DtData1.Date);
        parameters.parambyname('DTFIM1').Value    := Dateof(DtData2.Date);//'07/30/1979';//DateToStr(DtData1.Date);
      end;
    end;  // case
    if Clickou = false then
    begin
      case CmbConsulta.ItemIndex of
        0:SQL.Add('ORDER BY '+PARAM+' ');
        1:SQL.Add('Order By P.CdPessoa');
        2,3,6,7,8,9,11,14:SQL.Add('Order By P.nmPessoa');
        4:Sql.Add('Order By E.nmLogradouro,P.nmPessoa');
        5:Sql.Add('Order By E.dsBairro,E.dsUF');
        10:SQL.Add('Order By Outro,P.nmPessoa');
        12:SQL.Add('Order By E.dsUf,P.nmPessoa');
      end;
    end else
      SQL.Add('ORDER BY '+PARAM+' ');
    Parameters.ParamByName('PARAMETRO').Value := EdtConsulta.Text + '%';
    Open;
    LblListados.Caption := 'Listados --> ' + IntToStr(RecordCount);
    if EdtCodigo.Text <> '' then
      ADOQryConsulta.Locate('Código',EdtCodigo.Text,[]);
    { omite estes campos na grid }
    ADOQryConsultaLimite_Crdito.DisplayFormat := '#0.00';
    FieldByName('dsEmail').Visible  := false;
    FieldByName('dsEmailNFe').Visible := false;
    FieldByName('nrCartao').Visible := false;
    FieldByName('Ser').Visible      := false;
    FieldByName('Existir').Visible  := false;
    FieldByName('Excluir').Visible  := False;
    FieldByName('dsHomePage').Visible := false;
    FieldByName('dtCadastro').Visible := false;
    FieldByName('dsAtivo').Visible := false;
    FieldByName('dsPublicoPrivado').Visible := false;
    FieldByName('dsMemo').Visible  := false;
    FieldByName('tipCli').Visible  := false;
    FieldByName('Outro').Visible   := false;
  end; // with
end;   // procedure AtualizaQryConsulta

procedure TfrmCdCliente.AtualizaCampos;
var i : Integer;
    vaux : String[20];
begin
  With AdoQryConsulta do
  begin // move os campos para os componentes
    if AdoQryConsulta.RecordCount = 0 then
    begin
      LimpaTodosCampos(TbSheetMdCadastroDados);
      exit;
    end;
    vcheck := false;
    EdtCodigo.Text      := AdoQryConsulta.FieldByName('Código').AsString;
    EdtFormaReceb.Text  := AdoQryConsulta.FieldByName('dsTipoRecebimento').AsString;
    EdtNumero.Text      := AdoQryConsulta.FieldByName('nrNumero').AsString;
    EdtNome.Text        := AdoQryConsulta.FieldByName('Cliente').AsString;
    Label10.Caption     := 'Cliente -> ' + EdtNome.Text;
    EdtHomePage.Text    := AdoQryConsulta.FieldByName('dsHomePage').AsString;
    EdtEmail.Text       := AdoQryConsulta.FieldByName('dsEmail').AsString;
    EdtEmail_Danfe.Text := AdoQryConsulta.FieldByName('dsEmailNFe').AsString;
    EdtnrCartao.Text    := AdoQryConsulta.FieldByName('nrCartao').AsString;
    DtCadastro.Date     := StrToDate(AdoQryConsulta.FieldByName('dtCadastro').AsString);
    EdtEndereco.Text    := AdoQryConsulta.FieldByName('Endereço').AsString;
    EdtComplemento.Text := AdoQryConsulta.FieldByName('Complemento').AsString;
    EdtCep.Text         := AdoQryConsulta.FieldByName('Cep').AsString;
    EdtBairro.Text      := AdoQryConsulta.FieldByName('Bairro').AsString;
    EdtLimite.Text      := FormatFloat('0.00',AdoQryConsulta.FieldByName('Limite_Crédito').AsFloat);
    EdtDias.Text        := AdoQryConsulta.FieldByName('nrDiaVenc').AsString;
    EdtDia2.Text        := AdoQryConsulta.FieldByName('nrDiaVenc2').AsString;
    LblCadastro.Caption := 'Atualizado por: '+ AdoQryConsulta.FieldByName('dsUSuario').AsString +
                           ' Data: '+ AdoQryConsulta.FieldByName('dtAlteracao').AsString;
    EdtMotivo.Text      := AdoQryConsulta.FieldByName('dsMotivo').AsString;
    EdtPreVenda.Text    := AdoQryConsulta.FieldByName('dsPreVenda').AsString;
    EdtLocalizacao.Text := AdoQryConsulta.FieldByName('dsLocalizacao').AsString;
    EdtDescVista.Text   := FormatFloat('0.00',AdoQryConsulta.FieldByName('vldescVista').AsFloat);
    EdtDescPrazo.Text   := FormatFloat('0.00',AdoQryConsulta.FieldByName('vldescPrazo').AsFloat);
    edtComissao.Text    := FormatFloat('0.00',AdoQryConsulta.FieldByName('ComissaoCliente').AsFloat);

    EdtCdMatriz.Text    := AdoQryConsulta.FieldByName('cdMatriz').AsString;
    CbxFaturaUnica.Checked := AdoQryConsulta.FieldByName('dsFaturaUnica').AsBoolean;
    if UPPERCASE(vEmpresa) = 'TELEQUIPE' then
    begin
      EdtContrato.Text    := AdoQryConsulta.FieldByName('nr_contrato').AsString;
      EdtDataChegada.Date := AdoQryConsulta.FieldByName('dtInicio').ASDateTime;
      EdtDataSaida.Date   := AdoQryConsulta.FieldByName('dtFim').ASDateTime;
      if EdtDataChegada.Date < StrToDate('01/01/1950') then
      begin
        EdtDataChegada.Date := Date;
        EdtDataSaida.Date   := Date + 365;
      end;
      EdtVisitas.Text     := AdoQryConsulta.FieldByName('nrVisitas').AsString;
      EdtEquipamento.Text := AdoQryConsulta.FieldByName('dsEquipamentos').AsString;
      EdtRamais.Text      := AdoQryConsulta.FieldByName('nrRamais').AsString;
      EdtOutros.Text      := AdoQryConsulta.FieldByName('dsOutros').AsString;
      // pega o técnico se existir
      if AdoQryConsulta.FieldByName('cdTecnico').AsString <> '' then
      begin //estava assim :     if AdoQryConsulta.FieldByName('Tpstatus').AsString <> '0' then begin
        AdoQryTecnico.Open;
        AdoQryTecnico.Locate('Código',AdoQryConsulta.FieldByName('cdTecnico').AsString,[]);
        CbCodigoTec.Text  := AdoQryTecnico.FieldByName('Código').AsString;
        CbTecnico.Text    := AdoQryTecnico.FieldByName('Técnico').AsString;
      end else
      begin
        CbCodigoTec.Text  := '';
        CbTecnico.Text    := '';
      end;
      // pega o equipamento se existir
      if AdoQryConsulta.FieldByName('nrObjeto').AsString <> '' then
      begin //estava 'O'
        AdoQryEquipamento.Open;
        AdoQryEquipamento.Locate('nrObjeto',AdoQryConsulta.FieldByName('nrObjeto').AsString,[]);
        EdtNrObjeto.Text     := AdoQryEquipamento.FieldByName('nrObjeto').AsString;
        CbxEquipamento.Text  := AdoQryEquipamento.FieldByName('dsModelo').AsString;
        CbxEquipamento.color := clHighlightText;
      end else
      begin
        EdtNrObjeto.Text     := '';
        CbxEquipamento.Text  := '';
        CbxEquipamento.color := clAqua;
      end;
      // pega o status do contrato
      CbStatus.ItemIndex := AdoQryConsulta.FieldByName('Tpstatus').AsInteger;
    end;

    //pega o tipo do cliente
    AdoQryTpCliente.Open;
    AdoQryTpCliente.Locate('cdCodigo',FieldByName('tipCli').AsString,[]);
    EdtcdTpCli.Text := FieldByName('tipCli').AsString;
    vaux := AdoQryTpCliente.FieldbyName('nmTipo').AsString;
    For i := 0 to CbBtpCli.Items.Count do
      if CbBtpCli.Items[i] = vaux then
        CbBtpCli.ItemIndex := i;
    For i := 0 to CbxEstado.Items.Count do
      if CbxEstado.Items[i] = AdoQryConsulta.FieldByName('Estado').AsString then
        CbxEstado.ItemIndex := i;
    CbxCidade.Visible := True;
    with ADOQryMunicipio do
    begin
      close;
      Parameters.ParamByName('DSUF').Value := AdoQryConsulta.FieldByName('Estado').AsString;
      Open;
      MontaComboListADO(ADOQryMunicipio,CbxCidade);
    end;
    for i := 0 to CbxCidade.Items.Count -1 do
    begin
      if UpperCase(CbxCidade.Items[i]) =  UpperCase(AdoQryConsulta.FieldByName('Cidade').AsString) then
      begin
        CbxCidade.ItemIndex := i;
        AdoQryMunicipio.Open;
        AdoQryMunicipio.Locate('dsMunicipio',CbxCidade.Text,[]);
        EdtCdMunicipio.Text := AdoQryMunicipio.FieldByName('cdMunicipio').AsString;
        //AdoQryMunicipio.Close;
        Break;
      end else
      begin
        CbxCidade.ItemIndex := -1;
        EdtCdMunicipio.Clear;
        CbxCidade.text := AdoQryConsulta.FieldByName('Cidade').AsString;
        //EdtCidade.Text := AdoQryConsulta.FieldByName('Cidade').AsString;
      end;
    end;
   { end else begin
      EdtCidade.Text := AdoQryConsulta.FieldByName('Cidade').AsString;
      CbxCidade.Visible := False;
      CbxCidade.ItemIndex := -1;
      EdtCdMunicipio.Clear;
    end;}
    EdtCdRegiao.Text := AdoQryConsulta.FieldByName('cdRegiao').AsString;
    AdoQryGrupo.Open;
    if (EdtCdRegiao.Text <> '') and  (EdtCdRegiao.Text <> '0') then begin
      AdoQryGrupo.Locate('cdRegiao',EdtCdRegiao.Text,[]);
      for i := 0 to CbxRegiao.Items.Count do begin
        if CbxRegiao.Items[i] = AdoQryGrupo.FieldByName('dsRegiao').AsString then begin
          CbxRegiao.ItemIndex := i;
          Break;
        end; // if
      end; // for
    end else
      CbxRegiao.Text := '';
    AdoQryFuncionario.Open;
    EdtCdVendedor.Text := AdoQryConsulta.FieldByName('cdPessoa_1').AsString;
    if (EdtCdVendedor.Text <> '') and (EdtCdVendedor.Text <> '0') and (EdtCdVendedor.Text <> '1') then begin
      if AdoQryFuncionario.Locate('cdPessoa',EdtCdVendedor.Text,[]) then begin
        for i := 0 to CbxVendedor.Items.Count do begin
          if CbxVendedor.Items[i] = AdoQryFuncionario.FieldByName('nmPessoa').AsString then begin
            CbxVendedor.ItemIndex := i;
            Break;
          end; // if
        end; // for
      end
      else
        CbxVendedor.ItemIndex := -1;
    end else CbxVendedor.ItemIndex := -1;
    MmCliente.Text := AdoQryConsulta.FieldByName('dsMemo').AsString;
    with AdoQryExistir do
    begin
      if AdoQryConsulta.FieldByName('Existir').AsString = 'F' then begin
        Sql.Text := 'Select F.dsCpf,F.dsIdentidade,F.dtNascimento, '+
        'F.dsNaturalidade,F.dsInscricaoEstadual,C.dsInscricaoMunicipal From P_Fisica F WITH (NOLOCK), Cliente C with (NoLock) '+
        'Where F.cdPessoa = :CODIGO and C.cdPessoa = :CODIGO1 ';
        Parameters.parambyname('CODIGO').Value := EdtCodigo.Text;
        Parameters.parambyname('CODIGO1').Value := EdtCodigo.Text;
        Open;
        MskCpf.Text := FieldByName('dsCpf').AsString;
        if AdoQryExistir.FieldByName('DtNascimento').AsString <> '' then
          MskNascimento.Text := DateToStr(FieldByName('DtNascimento').AsDateTime)
        else
          MskNascimento.Text := '';
        MskInscricaoMunic.Text := '';
        MskInscricaoMunic.Text := AdoQryExistir.FieldByName('dsInscricaoMunicipal').AsString;
        MskInscricao2.Text   := FieldByName('dsInscricaoEstadual').AsString;
        EdtIdentidade.Text   := FieldByName('dsIdentidade').AsString;
        EdtNaturalidade.Text := FieldByName('dsNaturalidade').AsString;
        RgPessoaD.ItemIndex  := 0;
        MskCgc.Text          := '';
        MskInscricao.Text    := '';
        EdtRazao.Text        := '';
        EdtContato.Text      := '';
        EdtTelContato.Text   := '';
        EdtRamalContato.Text := '';
        if AdoQryConsulta.FieldByName('DsPublicoPrivado').AsString = 'I' then // Flag "I" para poder aproveitar o esquema do público e privado de antigamente --  NORMAL
          RgTpvencimento.ItemIndex := 0  // define se é publico ou privado
        else if AdoQryConsulta.FieldByName('DsPublicoPrivado').AsString = '2' then // Data base
          RgTpvencimento.ItemIndex := 1
        else if AdoQryConsulta.FieldByName('DsPublicoPrivado').AsString = '3' then // Dias após a venda
          RgTpvencimento.ItemIndex := 2
        else if AdoQryConsulta.FieldByName('DsPublicoPrivado').AsString = '4' then // Dois vencimentos
          RgTpvencimento.ItemIndex := 3;
      end else begin
        MskCpf.Text := '';
        MskInscricaoMunic.Text := '';
        MskNascimento.Text := '';
        EdtIdentidade.Text := '';
        MskInscricao2.Text := '';
        EdtNaturalidade.Text := '';
        Sql.Text := 'Select J.Cgc,J.dsInscricaoEstadual,J.nmRazao,J.nmContato,' +
        'J.dsTelefContato,J.dsRamalContato,C.dsInscricaoMunicipal From P_Juridica J WITH (NOLOCK),Cliente C WITH (NOLOCK)   ' +
        'Where J.cdPessoa = :CODIGO and C.cdPessoa = :CODIGO1    ';
        Parameters.parambyname('CODIGO').Value := EdtCodigo.Text;
        Parameters.parambyname('CODIGO1').Value := EdtCodigo.Text;
        Open;
        MskInscricaoMunic.Text := FieldByName('dsInscricaoMunicipal').AsString;
        MskCgc.Text := FieldByName('Cgc').AsString;
        MskInscricao.Text := FieldByName('dsInscricaoEstadual').AsString;
        EdtRazao.Text := FieldByName('nmRazao').AsString;
        EdtContato.Text := FieldByName('nmContato').AsString;
        EdtTelContato.Text := FieldByName('dsTelefContato').AsString;
        EdtRamalContato.Text := FieldByName('dsRamalContato').AsString;
        RgPessoaD.ItemIndex := 1;  // abilita a opcao pessoa juridica
        if AdoQryConsulta.FieldByName('DsPublicoPrivado').AsString = 'I' then // Flag "I" para poder aproveitar o esquema do público e privado de antigamente --  NORMAL
          RgTpvencimento.ItemIndex := 0  // define se é publico ou privado
        else if AdoQryConsulta.FieldByName('DsPublicoPrivado').AsString = '2' then // Data base
          RgTpvencimento.ItemIndex := 1
        else if AdoQryConsulta.FieldByName('DsPublicoPrivado').AsString = '3' then // Dias após a venda
          RgTpvencimento.ItemIndex := 2
        else if AdoQryConsulta.FieldByName('DsPublicoPrivado').AsString = '4' then // Dois vencimentos
          RgTpvencimento.ItemIndex := 3
      end;  // if qryConsulta
    end;  // with QryExistir
    if AdoQryConsulta.FieldByName('DsAtivo').AsString = 'S' then
      CkbAtivosD.Checked := True  // define se o cliente é ativo ou não
    else CkbAtivosD.Checked := False;
    if AdoQryConsulta.FieldByName('dsIsento').AsInteger = 1 then
      ckbIsento.Checked := True  // define se o cliente é isento ou não
    else ckbIsento.Checked := False;
    if AdoQryConsulta.FieldByName('dsRestricao').AsString = 'S' then
      ckrestricao.Checked := True  // define se o cliente é ativo ou não
    else ckrestricao.Checked := False;
    if AdoQryConsulta.FieldByName('dsAtacado').AsString = 'S' then
      CkAtacado.Checked := True  // define se o cliente é ativo ou não
    else CkAtacado.Checked := False;
    if AdoQryConsulta.FieldByName('dsIndIEDest').AsInteger = 1 then
      CkbIndIEDest.Checked := True
    else
      CkbIndIEDest.Checked := False;
    if AdoQryConsulta.FieldByName('dsVista').AsString = 'S' then
      CkVista.Checked := True  // define se o cliente é ativo ou não
    else
      CkVista.Checked := False;
    With AdoQryCombFone do
    begin
      Sql.Text := 'Select T.NmTelefone,T.dsRamal,T.dsTelefone From Telefone T WITH (NOLOCK) '+
      'Where T.cdPessoa = :CODIGO ';
      parameters.parambyname('CODIGO').Value := EdtCodigo.Text;
    end;  // with QryCombFone
  end;  // with QryConsulta
 {monta a combobox com todos os telefones do cliente}
  CbxTelefone.Clear;
  EdtRamal.Clear;
  EdtTipoTel.Clear;
  if MontaComboListBoolAdo(AdoQryCombFone,CbxTelefone) then CbxTelefone.Text := CbxTelefone.Items[0];
  AdoQryCombFone.Open;
  AdoQryCombFone.Locate ('nmTelefone',CbxTelefone.Text,[]);
  EdtRamal.Text := AdoQryCombFone.FieldByName('dsRamal').AsString;
  EdtTipoTel.Text := AdoQryCombFone.FieldByName('dsTelefone').AsString;
  vcheck := true;
  ckbIndIEDest.Enabled := false;
end;  // procedure AtualizaCampos

procedure TFrmCdCliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FrmPrincipalPreVenda.Cadastrodeclientes1.Enabled := True;
  //if FrmInf_Cliente <> nil then
  //  FrmInf_Cliente.Close;
  //FrmCdCliente := nil;
end;

procedure TFrmCdCliente.FormActivate(Sender: TObject);
begin
  if PgCtrolMdCadastro.ActivePage = TbSheetMdCadastroConsulta then
  begin
    if EdtConsulta.Visible then
      EdtConsulta.SetFocus;
    if dtData1.Visible     then
      dtData1.SetFocus;
    EdtConsulta.Text := '%';
    EdtConsulta.SelectAll;
  end else
  begin
    {monta a combobox com todos os telefones do cliente}
    With AdoQryCombFone do
    begin
      Sql.Text := 'Select T.NmTelefone,T.dsRamal,T.dsTelefone From Telefone T '+
                  'WITH (NOLOCK) Where T.cdPessoa = :CODIGO ';
      Parameters.parambyname('CODIGO').Value := AdoQryConsulta.FieldByName('Código').AsString;//EdtCodigo.Text;
      Open;
    end;  // with QryCombFone
    if MontaComboListBoolAdo(AdoQryCombFone,CbxTelefone) then
      CbxTelefone.Text := CbxTelefone.Items[0];
    AdoQryCombFone.Open;
    AdoQryCombFone.Locate ('nmTelefone',CbxTelefone.Text,[]);
    EdtRamal.Text := AdoQryCombFone.FieldByName('dsRamal').AsString;
    EdtTipoTel.Text := AdoQryCombFone.FieldByName('dsTelefone').AsString;
  end;  // if
end;    // procedure

procedure TFrmCdCliente.EdtConsultaChange(Sender: TObject);
begin
  inherited;
  AtualizaQryConsulta;
end;

procedure TFrmCdCliente.RgPessoaClick(Sender: TObject);
begin
  inherited;
  AtualizaQryConsulta;
end;

procedure TFrmCdCliente.RgClassificacaoClick(Sender: TObject);
begin
  inherited;
  AtualizaQryConsulta;
end;

procedure TFrmCdCliente.CkbAtivosClick(Sender: TObject);
begin
  inherited;
  AtualizaQryConsulta;
end;

procedure TFrmCdCliente.ckbIndIEDestClick(Sender: TObject);
begin
  inherited;
  if (ckbIndIEDest.Checked = true) and (vcheck = true) then
    ShowMessage('Ative esta opção somente se o cliente possuir Inscrição Estadual e não for contribuinte do ICMS.');
end;

procedure TFrmCdCliente.BtnMdPrimeiroClick(Sender: TObject);
begin
  inherited;
  AtualizaCampos;
end;

procedure TFrmCdCliente.BtnMdProximoClick(Sender: TObject);
begin
  inherited;
  AtualizaCampos;
end;

procedure TFrmCdCliente.BtnMdAnteriorClick(Sender: TObject);
begin
  inherited;
  AtualizaCampos;
end;

procedure TFrmCdCliente.BtnMdUltimoClick(Sender: TObject);
begin
  inherited;
  AtualizaCampos;
end;

// somente para MASSAPAULISTA
procedure TFrmCdCliente.salvar_em_itePreco(cdCliente : Integer);
var
  query, query_produtos : TADOQuery;
begin
  query:= TADOQuery.Create(Self);
  query.Connection:= DModulo.Conexao;
  query_produtos:= TADOQuery.Create(Self);
  query_produtos.Connection:= DModulo.Conexao;
  with query_produtos do
  begin
    SQL.Text:= 'select distinct cdproduto, vlpreco, vlatacado from produto with(nolock)';
    Open;
  end;
  query_produtos.First;
  while not query_produtos.Eof do
  begin
    with query do
    begin
      SQL.Text:= 'insert into itePreco (cdpessoa, cdproduto, vlpreco, vlatacado) '+
                 'values (:cdpessoa, :cdproduto, :vlpreco, :vlatacado)';
      Parameters.ParamByName('cdpessoa').Value:= cdCliente;
      Parameters.ParamByName('cdproduto').Value:= query_produtos.fieldbyname('cdproduto').AsInteger;
      Parameters.ParamByName('vlpreco').Value:= query_produtos.fieldbyname('vlpreco').AsFloat;
      Parameters.ParamByName('vlatacado').Value:= query_produtos.fieldbyname('vlatacado').AsFloat;
      ExecSQL;
    end;
    query_produtos.Next;
  end;
  FreeAndNil(query);
  FreeAndNil(query_produtos);
end;

function participanteEmNFeNoMesAtual(cdPessoa: integer):Boolean;
var
  Query : TadoQuery;
  resultado : Boolean;
  dataBanco, inicioMes, fimMes: TDateTime;
begin
  Query := TAdoQuery.create(nil);
  Query.Connection := DModulo.Conexao;
  with Query do
  begin
    SQL.Text:= 'select getDate() as hoje ';
    Open;
    dataBanco:= FieldByName('hoje').AsDateTime;
    inicioMes:= StartOfTheMonth(dataBanco);
    fimMes:= EndOfTheMonth(dataBanco);
    SQL.Text:= 'select 0 '+
               'from lancto L with(nolock) inner join tplancto T with(nolock) on L.cdtipo = T.cdtipo '+
               'where dsmodelo = ''55'' '+
               '	and cdpessoa= :cdpessoa '+
               '	and ((T.dsstatus = ''C'' and dtemissao between :DT1 and :DT2) or '+
               '	     (T.dsstatus = ''D'' and dt_efefiva_e_s between :DT3 and :DT4)) ';
    Parameters.ParamByName('cdpessoa').Value:= cdPessoa;
    Parameters.ParamByName('DT1').Value:= inicioMes;
    Parameters.ParamByName('DT2').Value:= fimMes;
    Parameters.ParamByName('DT3').Value:= inicioMes;
    Parameters.ParamByName('DT4').Value:= fimMes;
    Open;
    resultado:= RecordCount > 0;
  end;
  FreeAndNil(Query);
  result:= resultado;
end;

procedure TFrmCdCliente.BtnMdSalvarClick(Sender: TObject);
var
  vdata:TDateTime;  // data de cadastro
  vCodigo,AUX1,AUX2 : string;
   i : integer;
begin
  inherited;
  cdOperador := FrmPrincipalPreVenda.vcdVendedor;
  if CbxVendedor.Text = '' then
  begin
    application.MessageBox('Selecione o vendedor!', 'Atenção', mb_ok + MB_ICONWARNING);
    PgCtrolMdCadastro.ActivePageIndex := 1;
    CbxVendedor.setFocus;
    exit;
  end;
  TornarObrigatorioRazaoSocial((vGerarSpedFiscal or vGerarSpedPis) and (RgPessoaD.ItemIndex = 1));
  if not CamposObrigatoriosPreenchidos(TbSheetMdCadastroDados) then
    Exit;
  CkbAtivosD.Enabled := True;
  ckbIsento.Enabled := True;
  vdata := DtCadastro.Date;
  if RgPessoaD.ItemIndex = -1 then
  begin  // testa se foi escolhido se o cliente é pessoa fisica ou juridica
    ShowMessage('Você deve especificar se o cliente é pessoa física ou jurídica!');
    exit;
  end;  // if
  if CbxCidade.ItemIndex = (-1) then
    EdtCdMunicipio.Clear;
  if EdtCdMunicipio.Text = '' then
  begin
    MessageDlg('Selecione a cidade novamente', mtError, [mbOK],0);
    CbxCidade.SetFocus;
    exit;
  end;
  {if RgPessoaD.ItemIndex = 0 then // SE FOR PESSOA FÍSICA
  begin
    if MskInscricao2.Text <> '' then // TESTA A INSCRIÇÃO ESTADUAL
    begin
      try
        if not IEok(MskInscricao2.Text, CbxEstado.Text) then
        begin
          ShowMessage('Inscrição Estadual inválida, redigite ou deixe em branco!');
          PgCtrolMdCadastro.ActivePage := TBSheetMdCadastroDados;
          MskInscricao2.SetFocus;
          exit;
        end;
      except
        ShowMessage('Inscrição Estadual inválida, redigite ou deixe em branco!');
        PgCtrolMdCadastro.ActivePage := TBSheetMdCadastroDados;
        MskInscricao2.SetFocus;
        exit;
      end;
    end;
  end
  else // SE FOR PESSOA JURÍDICA
  begin
    if MskInscricao.Text <> '' then // TESTA A INSCRIÇÃO ESTADUAL
    begin
      try
        if not IEok(MskInscricao.Text, CbxEstado.Text) then
        begin
          ShowMessage('Inscrição Estadual inválida, redigite ou deixe em branco!');
          PgCtrolMdCadastro.ActivePage := TBSheetMdCadastroDados;
          MskInscricao.SetFocus;
          exit;
        end;
      except
        ShowMessage('Inscrição Estadual inválida, redigite ou deixe em branco!');
        PgCtrolMdCadastro.ActivePage := TBSheetMdCadastroDados;
        MskInscricao.SetFocus;
        exit;
      end;
    end;            
  end;  }
  if RgPessoaD.ItemIndex = 0 then
  begin     // testa o cpf
    if Trim(MskCpf.Text) <> '' then
    begin
      aux1 := Copy(CalculaCnpjCpf(Copy(MskCpf.Text,1,9)),10,2);
      aux2 := Copy(MskCpf.Text,10,2);
      If (aux1 <> aux2) then
      begin
        ShowMessage('CPF inválido redigite ou deixe em branco!');
        PgCtrolMdCadastro.ActivePage := TBSheetMdCadastroDados;
        MskCpf.SetFocus;
        MskCpf.Clear;
        exit;
      end;  // if
    end;
  end else
  begin
    if trim(MskCgc.Text) <> '' then
    begin
      aux1 := Copy(CalculaCnpjCpf(Copy(MskCgc.Text,1,12)),13,2);
      aux2 := Copy(MskCgc.Text,13,2);
      if (aux1 <> aux2)  then
      begin          // testa o cgc
        ShowMessage('CNPJ invalido redigite ou deixe em branco!');
        PgCtrolMdCadastro.ActivePage := TBSheetMdCadastroDados;
        MskCgc.Clear;
        MskCgc.SetFocus;
        exit;
      end;
    end;
  end;
  // TETA IGUALDADE DE CNPJ E OU CPF
  if CNPJ_CPFIguais = False then
    exit;
  if status = [novo] then
  begin
    if Length(CbxTelefone.Text) > 0 then
    begin
      with AdoQryAlterar do
      begin
        Sql.Text := 'Select Max(cdTelefone) as UtCodigo From Telefone WITH (NOLOCK) ';
        open;
        vCodigo := IntToStr(AdoQryAlterar.FieldByName('UtCodigo').AsInteger + 1);
        close;
      end;
    end;
    With AdoQrySalvar do
    begin
      try
        DModulo.Conexao.BeginTrans;
        AdoQryUltimoCodigo.Open;
        EdtCodigo.Text := IntToStr(AdoQryUltimoCodigo.FieldByName('UtCodigo').AsInteger + 1);
        AdoQryUltimoCodigo.Close;
        Sql.Text := 'INSERT INTO Pessoa (cdPessoa,nmPessoa,dtCadastro,dsTipoRecebimento,            '+
        'dsAtivo,Ser,Existir,dsMemo,dsHomePage,dsEmail,dtAlteracao,dsUsuario, vlComissao,dsEmailNFe,'+
        'dsIndIEDest)                                                                               '+
        'VALUES (:CDPESSOA,:NMPESSOA,:DTCADASTRO,:FORMA,:DSATIVO,:SER,:EXISTIR,:DSMEMO,             '+
        ':DSHOMEPAGE, :DSEMAIL, :DTALTERA, :DSUSUARIO, :COMISSAO, :DSEMAILNFE, :dsIndIEDest)        ';
        parameters.parambyname('CDPESSOA').value   := EdtCodigo.Text;
        parameters.parambyname('FORMA').value      := EdtFormaReceb.Text;
        parameters.parambyname('NMPESSOA').value   := EdtNome.Text;
        parameters.parambyname('DSEMAILNFE').value := EdtEmail_Danfe.Text;
        if CkbAtivosD.Checked then
          parameters.parambyname('DSATIVO').value  := 'S'
        else
          parameters.parambyname('DSATIVO').value  := 'N';
        parameters.parambyname('SER').value        := 'C';
        parameters.parambyname('DTCADASTRO').value := DtCadastro.Date;
        parameters.parambyname('DSMEMO').value     := MmCliente.Text;
        parameters.parambyname('DSHOMEPAGE').value := EdtHomePage.Text;
        Parameters.ParamByName('COMISSAO').Value   := edtComissao.Text;
        parameters.parambyname('DSEMAIL').value    := EdtEmail.Text;
        if RgPessoaD.ItemIndex = 0 then
          parameters.parambyname('EXISTIR').value  := 'F'
        else
          parameters.parambyname('EXISTIR').value  := 'J';
        parameters.parambyname('DTALTERA').value   := vData_Banco;
        parameters.parambyname('DSUSUARIO').value  := cdOperador; //+ ' ' +FormPrincipal.StbPrincipal.Panels[0].Text;
        if (ckbIndIEDest.Checked) then//and (Length(MskInscricao.Text) > 0) then
          parameters.parambyname('dsIndIEDest').value  := 1
        else
          parameters.parambyname('dsIndIEDest').value  := 0;
        ExecSql;
        Grava_Pessoa;
        if (UpperCase(vEmpresa)='MASSAPAULISTA') then // coloca os preços de todos os produtos para o novo cliente
          salvar_em_itePreco(StrToInt(EdtCodigo.Text));
        Sql.Text := 'Insert Into Cliente (cdPessoa,cdCodigo,dsPublicoPrivado,dsExcluir,dsLimCredito,                 '+
                    'nrDiaVenc,nrDiaVenc2,cdRegiao,cdPessoa_1,dsMotivo,dsAtacado,dsRestricao,dsLocalizacao,dsPrevenda,'+
                    'vlDescVista,vlDescPrazo,dsVista,nrCartao,dsInscricaoMunicipal,DSISENTO,dsIndIEDest,cdMatriz, dsFaturaUnica ';

        if UPPERCASE(vEmpresa) = 'TELEQUIPE' then
          sql.Add(',dsContrato,dtInicio,dtFim,nrVisitas,tpStatus,dsEquipamentos,nrRamais,dsOutros,cdTecnico,nrObjeto) ')
        else
          sql.Add(')');

        sql.Add('Values (:CDPESSOA,:CDCODIGO,:DSPUBLICOPRIVADO,:DSEXCLUIR,:DSLIMCREDITO,:NRDIAVENC,                   ');
        sql.Add(':NRDIAVENC2,:CDREGIAO,:CDPESSOA_1,:DSMOTIVO,:DSATACADO,:DSRESTRICAO,:DSLOCAL,:DSPREVENDA,            ');
        sql.Add(':DESCVIST,:DESCPRAZO,:DSVISTA,:NRCARTAO,:DSINSCRICAOMUNICIPAL,:DSISENTO,:dsIndIEDest,:cdMatriz, :dsFaturaUnica ');

        if UPPERCASE(vEmpresa) = 'TELEQUIPE' then
          sql.Add(',:DSCONT,:dtInicio,:dtFim,:nrVisitas,:tpStatus,:dsEquipamentos,:nrRamais,:dsOutros,:cdTecnico,:nrObjeto) ')
        else
          sql.Add(')');
        if trim(EdtCdMatriz.Text) <> '' then
          parameters.parambyname('cdMatriz').value := EdtCdMatriz.Text
        else
          parameters.parambyname('cdMatriz').value := null;
        parameters.parambyname('DSINSCRICAOMUNICIPAL').value := TRim(MskInscricaoMunic.Text);
        parameters.parambyname('CDPESSOA').value := EdtCodigo.Text;
        parameters.parambyname('CDCODIGO').value := EdtcdtpCli.Text;
        case RgTpVencimento.ItemIndex of
           0: parameters.parambyname('DSPUBLICOPRIVADO').Value := 'I';
           1: parameters.parambyname('DSPUBLICOPRIVADO').Value := '2';
           2: parameters.parambyname('DSPUBLICOPRIVADO').Value := '3';
           3: parameters.parambyname('DSPUBLICOPRIVADO').Value := '4';
        end;
        if ckbIsento.Checked then
          parameters.parambyname('DSISENTO').value  := 1  // Isento de ICMS
        else
          parameters.parambyname('DSISENTO').value  := 0; // Sem Isencao
        if (ckbIndIEDest.Checked) then//and (Length(MskInscricao.Text) > 0) then
          parameters.parambyname('dsIndIEDest').value  := 1
        else
          parameters.parambyname('dsIndIEDest').value  := 0;
        parameters.parambyname('DSEXCLUIR').value    := 'S';
        parameters.parambyname('DSLIMCREDITO').value := StrToFloat(FormatFloat('0.00',StrToFloat(EdtLimite.Text)));
        if Length(EdtDias.Text) > 0 then
          parameters.parambyname('NRDIAVENC').value := EdtDias.Text
        else
          parameters.parambyname('NRDIAVENC').value := '0';
        if Length(EdtDia2.Text) > 0 then
          parameters.parambyname('NRDIAVENC2').value := EdtDia2.Text
        else
          parameters.parambyname('NRDIAVENC2').value := '0';
        parameters.parambyname('CDREGIAO').value   := EdtCdregiao.Text;
        parameters.parambyname('CDPESSOA_1').value := EdtCdVendedor.Text;
        parameters.parambyname('DSMOTIVO').value   := EdtMotivo.Text;
        parameters.parambyname('DSLOCAL').value    := EdtLocalizacao.Text;
        parameters.parambyname('DSPREVENDA').value := EdtpreVenda.Text;
        parameters.parambyname('DESCVIST').value   := EdtDescVista.Text;
        parameters.parambyname('NRCARTAO').value   := EdtnrCartao.Text;
        parameters.parambyname('DESCPRAZO').value  := EdtDescPrazo.Text;

        if CbxFaturaUnica.Checked then
          parameters.parambyname('dsFaturaUnica').value := 1
        else
          parameters.parambyname('dsFaturaUnica').value := 0;

        if CkAtacado.Checked then   //  mudar se for ativo ou não
          parameters.parambyname('DSATACADO').value := 'S'
        else
          parameters.parambyname('DSATACADO').value := 'N';
        if ckRestricao.Checked then   //  mudar se for ativo ou não
          parameters.parambyname('DSRESTRICAO').value := 'S'
        else
          parameters.parambyname('DSRESTRICAO').value := 'N';
        if CkVista.Checked then //  mudar se for ativo ou não
          parameters.parambyname('DSVISTA').value := 'S'
        else
          parameters.parambyname('DSVISTA').value := 'N';

        if UPPERCASE(vEmpresa) = 'TELEQUIPE' then begin
          parameters.parambyname('DSCONT').value         := EdtContrato.text;
          parameters.parambyname('dtInicio').value       := DateToStr(EdtDataChegada.Date);
          parameters.parambyname('dtFim').value          := DateToStr(EdtDataSaida.Date);
          if EdtVisitas.Text <> '' then
            parameters.parambyname('nrVisitas').value       := EdtVisitas.Text
          else parameters.parambyname('nrVisitas').value  := '0';
          parameters.parambyname('tpStatus').value       := CBStatus.ItemIndex;
          parameters.parambyname('dsEquipamentos').value := EdtEquipamento.Text;
          if EdtRamais.Text <> '' then
            parameters.parambyname('nrRamais').value       := EdtRamais.Text
          else parameters.parambyname('nrRamais').value  := '0';
          parameters.parambyname('dsOutros').value       := EdtOutros.Text;
          if CBCodigoTec.Text <> '' then
            parameters.parambyname('cdTecnico').value      := CBCodigoTec.Text
          else parameters.parambyname('cdTecnico').value := 0;
          if EdtNrObjeto.Text <> '' then
            parameters.parambyname('nrObjeto').value       := EdtNrObjeto.Text
          else parameters.parambyname('nrObjeto').value  := 0;
        end;

        ExecSql;
        Sql.Text := 'Insert Into Endereco (cdPessoa,nmLogradouro,cdEndereco,          '+
                    'dsComplemento,dsCep,dsBairro,dsCidade,cdMunicipio,dsUf,nrnumero) '+
                    'Values (:CDPESSOA,:NMLOGRADOURO,:CDENDERECO,:DSCOMPLEMENTO,      '+
                    ':DSCEP,:DSBAIRRO,:DSCIDADE,:CDMUNICIPIO,:DSUF,:NRNUMERO)         ';
        parameters.parambyname('CDPESSOA').value      := EdtCodigo.Text;
        parameters.parambyname('NMLOGRADOURO').value  := EdtEndereco.Text;
        parameters.parambyname('CDENDERECO').value    := EdtCodigo.Text;
        parameters.parambyname('DSCOMPLEMENTO').value := EdtComplemento.Text;
        parameters.parambyname('DSCEP').value         := EdtCep.Text;
        parameters.parambyname('DSBAIRRO').value      := EdtBairro.Text;
        parameters.parambyname('DSCIDADE').value      := CbxCidade.Text;
        parameters.parambyname('CDMUNICIPIO').value   := EdtCdMunicipio.Text;
        parameters.parambyname('NRNUMERO').value      := EdtNumero.Text;
        parameters.parambyname('DSUF').value          := CbxEstado.Text;
        ExecSql;
        if Length(CbxTelefone.Text) > 0 then
        begin
          Sql.Text := 'Insert Into Telefone (nmTelefone,dsRamal,dsTelefone,cdPessoa,CdTelefone) '+
                      'Values (:NMTELEFONE,:DSRAMAL,:DSTELEFONE,:CDPESSOA,:CDTELEFONE)          ';
          parameters.parambyname('NMTELEFONE').value := CbxTelefone.Text;
          parameters.parambyname('DSRAMAL').value    := EdtRamal.Text;
          parameters.parambyname('DSTELEFONE').value := EdtTipoTel.Text;
          parameters.parambyname('CDPESSOA').value   := EdtCodigo.Text;
          parameters.parambyname('CDTELEFONE').value := vCodigo;
          ExecSql;
        end;
        FrmPrincipalPreVenda.SalvaLogEventos('Cadastro de cliente',FrmPrincipalPreVenda.PegaDataBanco,FrmPrincipalPreVenda.PegaHoraBanco,
                                                          EdtCodigo.Text,'',0,StrToInt(cdOperador),'1');
        DModulo.Conexao.CommitTrans;
        salvouOCiente := True;
        Messagedlg('Inclusão Ok!', mtinformation, [mbOk], 0);
      except
        on ER: EDBEngineError do
        begin
          DModulo.Conexao.RollbackTrans;
          Salvar_erro(vData_Banco + ' | ' + FrmPrincipalPreVenda.PegaHoraBanco, cdOperador,'TFrmCdCliente.BtnMdSalvarClick', ER.Message);
          Messagedlg('Não foi possivel salvar os dados!', mterror, [mbOk], 0);
          exit;
        end;
        on E: Exception do
        begin
          DModulo.Conexao.RollbackTrans;
          Salvar_erro(vData_Banco + ' | ' + FrmPrincipalPreVenda.pegaHoraBanco, cdOperador,'TFrmCdCliente.BtnMdSalvarClick',e.Message);
          Messagedlg('Não foi possivel salvar os dados!', mterror, [mbOk], 0);
          EdtCodigo.Enabled := False;
          exit;
        end;
      end; // except
    end;   // With QrySalvar
  end
  else
  begin
//    if ((Length(MskCgc.Text) > 0) and (RgPessoaD.ItemIndex = 1) and (SoNumeros(MskCgc.Text) <> '')) and (UpperCase(vEmpresa)<>'PLANTA') and (UpperCase(vEmpresa)<>'BG') and (UpperCase(vEmpresa)<>'ATAKADINHO') and (UpperCase(vEmpresa)<>'TEPROLIM') then
//    begin
//      if UPPERCASE(FrmPrincipal.vEmpresa) <> 'SUPPORT' then begin
//        With AdoQryCombFone do
//        begin
//          Sql.Text := 'Select P.cdPessoa,P.nmPessoa,J.CGC FROM Pessoa P WITH (NOLOCK) INNER JOIN '+
//          'P_Juridica J WITH (NOLOCK) ON P.cdPessoa =  J.cdPessoa Where J.CGC = :CGC and P.ser = ''C'' and P.cdPessoa <> :CDPESSOA';
//          Parameters.parambyname('CGC').Value := MskCgc.Text;
//          Parameters.parambyname('CDPESSOA').Value := EdtCodigo.Text;
//          Open;
//          if (AdoQryCombFone.RecordCount <> 0)  then begin
//            Application.OnMessage := FormPrincipal.NaoProcessaMsg;
//            {if} MessageDlg ('Este CNPJ já está cadastrado com o CLIENTE --> ' +
//              AdoQryCombFone.FieldByName('cdPessoa').AsString + ' - ' +
//              AdoQryCombFone.FieldByName('nmPessoa').AsString{+ #13'' +
//              ' '+ #13'' +
//              'Deseja cadastrá-lo mesmo assim?'}, mtWarning,[mbOK],0); {= mrNo then begin}
//              Application.OnMessage := FormPrincipal.ProcessaMsg;
//              PgCtrolMdCadastro.ActivePage := TBSheetMdCadastroDados;
//              EdtNome.SetFocus;
//              close;
//              exit;
//            {end else
//              Application.OnMessage := FormPrincipal.ProcessaMsg;}
//          end;
//          close;
//        end;
//      end;
//    end;
    if (RgPessoaD.ItemIndex = 1) and (CNPJAtual <> MskCgc.Text) and participanteEmNFeNoMesAtual(StrToInt(EdtCodigo.text)) then
    begin
      application.MessageBox('Não é correto alteração do campo CNPJ porque o mesmo já está na EFD (SPED) deste mês.' + #13#10
                            +'Esta alteração vai gerar um erro no EFD (SPED).'
                            +'Dica: Fazer um novo cadastro para este CNPJ, ou aguarde a virada do mês.', 'Atenção', mb_ok + MB_ICONWARNING);
      if Application.MessageBox(PChar('Clique em Sim para salvar as alterações exceto CNPJ, e Não para alterar inclusive o CNPJ'), 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_APPLMODAL) = id_yes then
      begin
        MskCgc.Text:= CNPJAtual;
      end;
    end;

    // testa CPF iguais
//    if ((Length(MskCPF.Text) > 0) and (RgPessoaD.ItemIndex = 0) and (SoNumeros(MskCgc.Text) <> '')) and (UpperCase(vEmpresa)<>'PLANTA') and (UpperCase(vEmpresa)<>'BG') and (UpperCase(vEmpresa)<>'ATAKADINHO') and (UpperCase(vEmpresa)<>'TEPROLIM') then begin
//      With AdoQryCombFone do begin
//        Sql.Text := 'Select P.cdPessoa,P.nmPessoa,J.dsCPF FROM Pessoa P WITH (NOLOCK) INNER JOIN '+
//        'P_Fisica J WITH (NOLOCK) ON P.cdPessoa = J.cdPessoa Where J.dsCPF = :CPF and P.ser = :TIPO and P.cdPessoa <> :CDPESSOA';
//        Parameters.parambyname('CPF').Value := MskCpf.Text;
//        Parameters.parambyname('TIPO').Value := 'C';
//        Parameters.parambyname('CDPESSOA').Value := EdtCodigo.Text;
//        Open;
//        if (AdoQryCombFone.RecordCount <> 0)  then begin
//          Application.OnMessage := FormPrincipal.NaoProcessaMsg;
//          {if} MessageDlg ('Este CPF já está cadastrado com o CLIENTE --> ' +
//            AdoQryCombFone.FieldByName('cdPessoa').AsString + ' - ' +
//            AdoQryCombFone.FieldByName('nmPessoa').AsString{+ #13'' + ' '+ #13'' +
//            'Deseja cadastrá-lo mesmo assim?'}, mtWarning,[mbOK],0); {= mrNo then begin}
//            Application.OnMessage := FormPrincipal.ProcessaMsg;
//            PgCtrolMdCadastro.ActivePage := TBSheetMdCadastroDados;
//            EdtNome.SetFocus;
//            close;
//            exit;
//          {end else
//            Application.OnMessage := FormPrincipal.ProcessaMsg;}
//        end;
//        close;
//      end;
//    end;
     //SPED FISCAL
     // pega os campos para comparar se foram alterados antes
    if RgPessoaD.ItemIndex = 0 then // SE FOR PESSOA FÍSICA
       preencheVetorSped('D',EdtNome.Text,mskCgc.Text,mskCpf.Text,MskInscricao2.Text,EdtCdMunicipio.Text,
                         EdtEndereco.Text, EdtNumero.Text,EdtComplemento.Text,EdtBairro.Text)
    else
       preencheVetorSped('D',EdtNome.Text,mskCgc.Text,mskCpf.Text,MskInscricao.Text,EdtCdMunicipio.Text,
                         EdtEndereco.Text, EdtNumero.Text,EdtComplemento.Text,EdtBairro.Text);

    With AdoQryAlterar do
    begin
      try
        DModulo.Conexao.BeginTrans;
        Sql.Text := 'Delete From P_Fisica Where cdpessoa = :CODIGO ';
        Parameters.ParamByName('CODIGO').Value := EdtCodigo.Text;
        ExecSQL;
        Sql.Text := 'Delete From P_Juridica Where cdPessoa = :CODIGO ';
        Parameters.ParamByName('CODIGO').Value := EdtCodigo.Text;
        ExecSQL;
        Grava_Pessoa;
        Sql.Text := 'Update Pessoa Set dsAtivo = :DSATIVO,nmPessoa = :NMPESSOA,                '+
                    'dtCadastro = :DTCADASTRO,dsEmail = :DSEMAIL,dsMemo = :DSMEMO,             '+
                    'dtAlteracao = :dtAlteracao,dsUsuario = :dsUsuario, vlComissao = :COMISSAO,'+
                    'dsHomePage = :DSHOMEPAGE,EXISTIR = :EXISTIR,dsTipoRecebimento = :FORMA,   '+
                    'dsEmailNFe = :DSEMAILNFE, dsIndIEDest = :dsIndIEDest Where cdPessoa = :CDPESSOA ';
        if CkbAtivosD.Checked then   //  mudar se for ativo ou não
          parameters.parambyname('DSATIVO').value  := 'S'
        else
          parameters.parambyname('DSATIVO').value  := 'N';
        parameters.parambyname('NMPESSOA').value   := EdtNome.Text;
        parameters.parambyname('FORMA').value      := EdtFormaReceb.Text;
        parameters.parambyname('DTCADASTRO').value := DtCadastro.date;
        parameters.parambyname('DSEMAIL').value    := EdtEmail.Text;
        parameters.parambyname('DSEMAILNFE').value := EdtEmail_Danfe.Text;
        parameters.parambyname('DSMEMO').value     := MmCliente.Text;
        parameters.parambyname('DSHOMEPAGE').value := EdtHomePage.Text;
        parameters.parambyname('CDPESSOA').value   := EdtCodigo.Text;
        Parameters.ParamByName('COMISSAO').Value   := edtComissao.Text;
        parameters.parambyname('dtalteracao').value := vData_Banco;
        parameters.parambyname('dsUsuario').value   := cdOperador; //+ ' ' +FormPrincipal.StbPrincipal.Panels[0].Text;
        if RgPessoaD.ItemIndex = 0 then
          parameters.parambyname('EXISTIR').value := 'F'
        else
          parameters.parambyname('EXISTIR').value := 'J';
        if (ckbIndIEDest.Checked) then//and (Length(MskInscricao.Text) > 0) then
          parameters.parambyname('dsIndIEDest').value  := 1
        else
          parameters.parambyname('dsIndIEDest').value  := 0;
        ExecSql;
        Sql.Text := 'Update Endereco Set nmLogradouro = :NMLOGRADOURO,dsComplemento = :DSCOMPLEMENTO,                  '+
                    'dsCep = :DSCEP,dsBairro = :DSBAIRRO,dsUf = :DSUF,dsCidade = :DSCIDADE,CDMunicipio = :CDMUNICIPIO, '+
                    'nrnumero = :NRNUMERO Where cdPessoa = :CDPESSOA                                                   ';
        parameters.parambyname('NMLOGRADOURO').value  := copy(EdtEndereco.Text,1,40); //copy pra não passar do tamanho do campo qd busca pelo cep
        parameters.parambyname('DSCOMPLEMENTO').value := EdtComplemento.Text;
        parameters.parambyname('DSCEP').value         := EdtCep.Text;
        parameters.parambyname('DSBAIRRO').value      := EdtBairro.Text;
        parameters.parambyname('DSUF').value          := CbxEstado.Text;
        parameters.parambyname('DSCIDADE').value      := CbxCidade.Text;
        parameters.parambyname('CDMUNICIPIO').value   := EdtCdMunicipio.Text;
        parameters.parambyname('CDPESSOA').value      := EdtCodigo.Text;
        parameters.parambyname('NRNUMERO').value      := EdtNumero.Text;
        ExecSql;

        Sql.Text := 'Update Cliente Set dsLimCredito = :LIMITE,dsPublicoPrivado = :DSPUBLICOPRIVADO,'+
                    'nrDiaVenc = :NRDIAVENC,nrDiaVenc2 = :NRDIAVENC2,cdCodigo = :CDCODIGO,          '+
                    'cdRegiao = :CDREGIAO, cdPessoa_1 = :CDPESSOA_1,                                '+
                    'dsAtacado = :DSATACADO,dsRestricao = :DSRESTRICAO, dsMotivo = :DSMOTIVO,       '+
                    'dsLocalizacao = :DSLOCAL,dsPreVenda = :DSPREVENDA,dsIndIEDest = :dsIndIEDest,  '+
                    'vlDescVista = :DESCVISTA, vlDescPrazo = :DESCPRAZO,DSVISTA = :DSVISTA,         '+
                    'nrCartao = :NRCARTAO,dsInscricaoMunicipal = :DSINSCRICAOMUNICIPAL,             '+
                    'DSISENTO = :DSISENTO, cdMatriz = :cdMatriz, dsFaturaUnica = :dsFaturaUnica ';

        if UPPERCASE(vEmpresa) = 'TELEQUIPE' then
        begin
          sql.add(',dsContrato = :DSCONT, dtInicio = :dtInicio,      ');
          sql.add('dtFim = :dtFim,nrVisitas = :nrVisitas,tpStatus = :tpStatus,dsEquipamentos = :dsEquipamentos, ');
          sql.add('nrRamais = :nrRamais,dsOutros = :dsOutros,cdTecnico = :cdTecnico,nrObjeto = :nrObjeto  ');
        end;
        sql.add('Where cdPessoa = :CDPESSOA  ');

        if UPPERCASE(vEmpresa) = 'TELEQUIPE' then
        begin
          parameters.parambyname('DSCONT').value            := EdtContrato.Text;
          parameters.parambyname('dtInicio').value          := DateToStr(EdtDataChegada.Date);
          parameters.parambyname('dtFim').value             := DateToStr(EdtDataSaida.Date);
          if EdtVisitas.Text <> '' then
            parameters.parambyname('nrVisitas').value       := EdtVisitas.Text
            else parameters.parambyname('nrVisitas').value  := '0';
          parameters.parambyname('tpStatus').value          := CBStatus.ItemIndex;
          parameters.parambyname('dsEquipamentos').value    := EdtEquipamento.Text;
          if EdtRamais.Text <> '' then
            parameters.parambyname('nrRamais').value        := EdtRamais.Text
            else parameters.parambyname('nrRamais').value   := '0';
          parameters.parambyname('dsOutros').value          := EdtOutros.Text;
          if CBCodigoTec.Text <> '' then
            parameters.parambyname('cdTecnico').value       := CBCodigoTec.Text
            else parameters.parambyname('cdTecnico').value  := 0;
          if EdtNrObjeto.Text <> '' then
            parameters.parambyname('nrObjeto').value       := EdtNrObjeto.Text
            else parameters.parambyname('nrObjeto').value  := 0;
        end;
        if trim(EdtCdMatriz.Text) <> '' then
          parameters.parambyname('cdMatriz').value := EdtCdMatriz.Text
        else
          parameters.parambyname('cdMatriz').value := null;

        if CbxFaturaUnica.Checked then
          parameters.parambyname('dsFaturaUnica').value := 1
        else
          parameters.parambyname('dsFaturaUnica').value := 0;
        if (ckbIndIEDest.Checked) then //and (Length(MskInscricao.Text) > 0) then
          parameters.parambyname('dsIndIEDest').value  := 1
        else
          parameters.parambyname('dsIndIEDest').value  := 0;
        parameters.parambyname('DSINSCRICAOMUNICIPAL').value := TRim(MskInscricaoMunic.Text);
        parameters.parambyname('LIMITE').Value       := StrToFloat(FormatFloat('0.00',StrToFloat(EdtLimite.Text)));
        parameters.parambyname('CDPESSOA').Value     := EdtCodigo.Text;
        parameters.parambyname('CDREGIAO').value     := EdtCdRegiao.Text;
        parameters.parambyname('CDPESSOA_1').value   := EdtCdVendedor.Text;
        parameters.parambyname('NRCARTAO').value     := EdtnrCartao.Text;
        if ckbIsento.Checked then
          parameters.parambyname('DSISENTO').value  := 1
        else
          parameters.parambyname('DSISENTO').value  := 0;
        if Length(EdtDias.Text) > 0 then
          parameters.parambyname('NRDIAVENC').value  := EdtDias.Text
        else
          parameters.parambyname('NRDIAVENC').value  := '0';
        if Length(EdtDia2.Text) > 0 then
          parameters.parambyname('NRDIAVENC2').value := EdtDia2.Text
        else
          parameters.parambyname('NRDIAVENC2').value := '0';
        parameters.parambyname('CDCODIGO').value := EdtcdtpCli.Text;
        case RgTpVencimento.ItemIndex of
           0: parameters.parambyname('DSPUBLICOPRIVADO').value := 'I'; // normal
           1: parameters.parambyname('DSPUBLICOPRIVADO').value := '2'; // data base
           2: parameters.parambyname('DSPUBLICOPRIVADO').value := '3'; // quantidade de dias
           3: parameters.parambyname('DSPUBLICOPRIVADO').value := '4'; // Dois vencimentos
        end;
        if ckRestricao.Checked then   // mudar se for ativo ou não
          parameters.parambyname('DSRESTRICAO').value := 'S'
        else
          parameters.parambyname('DSRESTRICAO').value := 'N';
        if CkAtacado.Checked then   //  mudar se for ativo ou não
          parameters.parambyname('DSATACADO').value := 'S'
        else
          parameters.parambyname('DSATACADO').value := 'N';
        if ckVista.Checked then   //  mudar se for ativo ou não
          parameters.parambyname('DSVISTA').value := 'S'
        else
          parameters.parambyname('DSVISTA').value := 'N';
        parameters.parambyname('DSMOTIVO').Value   := EdtMotivo.Text;
        parameters.parambyname('DSLOCAL').Value    := EdtLocalizacao.Text;
        parameters.parambyname('DSPREVENDA').Value := EdtPreVenda.Text;
        parameters.parambyname('DESCVISTA').Value  := EdtDescVista.Text;
        parameters.parambyname('DESCPRAZO').Value  := EdtDescPrazo.Text;
        FrmPrincipalPreVenda.SalvaLogEventos('Alteração de Cliente',FrmPrincipalPreVenda.PegaDataBanco,FrmPrincipalPreVenda.PegaHoraBanco,
                                                          EdtCodigo.Text,'',0,StrToInt(cdOperador),'1');
        ExecSql;
        Grava_Sped(EdtCodigo.Text);
        DModulo.Conexao.CommitTrans;
        salvouOCiente := True;
        Messagedlg('Alteração ok!', mtinformation, [mbOk], 0);
      except
        DModulo.Conexao.RollbackTrans;
        Messagedlg('Não foi possivel alterar os dados!', mterror, [mbOk], 0);
      end; // except
    end;
  end;  // if
  self.DesativaCampos;
  TrataBotoesPadrao(Sender,Padrao);
  Status := [Padrao];
  AtualizaQryConsulta;
end;

procedure TFrmCdCliente.BtnMdNovoClick(Sender: TObject);
begin
  inherited;
  if FrmPrincipalPreVenda.Permissao('11','N') = 'N' then begin
    BtnMdCancelarClick(Self);
    Exit;
  end;
  CbxTelefone.Clear;     // limpa a combo
  LimpaTodosCampos(TbSheetMdCadastroDados);
  MontaComboVendedor;
  AtivaCampos;
  Label10.Caption     := 'Cliente -> ';
  CkbAtivosD.Checked  := True;
  ckbIsento.Checked   := False;
  CkbAtivosD.Enabled  := False;
  CbxTelefone.Enabled := True;
  EdtRamal.Enabled    := True;
  EdtTipoTel.Enabled  := True;
  EdtRamal.ReadOnly   := False;
  EdtTipoTel.ReadOnly := False;
  RgPessoaD.ItemIndex := 0;
  CbBtpCli.ItemIndex  := 0;
  CbxRegiao.ItemIndex := 0;
  CbxRegiaoChange(sender);
  //EdtCdRegiao.text    := '1';
  EdtDias.Text        := '0';
  RgTpVencimento.ItemIndex := 0;
  EdtDescVista.Text := '0,00';
  EdtDescPrazo.Text := '0,00';
  edtComissao.Text  := '0,00';
  CbBtpCliChange(Self);
  AdoQryUltimoCodigo.Open;  {usada para calcular o proximo codigo da tabela pessoa}
  EdtCodigo.Text     := IntToStr(AdoQryUltimoCodigo.FieldByName('UtCodigo').AsInteger + 1);
  AdoQryUltimoCodigo.Close;
  DtCadastro.Date    := Date;
  CbxCidade.Enabled  := True;
  EdtCidade.Visible  := False;
  MskNascimento.Text := DateToStr(Date);
  EdtLimite.Text     := FormatFloat('0.00',FrmPrincipal.vLimiteCredito);
  if PgCtrolMdCadastro.ActivePage = TBSheetMdCadastroDados then
    EdtNome.SetFocus
  else
    EdtDias.SetFocus;

  EdtdataChegada.Date := Date;
  EdtdataSaida.Date   := Date + 365;
  CbxFaturaUnica.Checked := false;
end;

procedure TFrmCdCliente.BtnMdCancelarClick(Sender: TObject);
begin
  inherited;
  DesativaCampos;
  MontaComboVendedor;
  AtualizaCampos;
//  CkbAtivosD.Enabled := True;
end;

procedure TFrmCdCliente.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  AtualizaCampos;
  PgCtrolMdCadastro.ActivePage := TBSheetMdCadastroDados;
  DesativaCampos;
  TrataBotoesPadrao(Sender,Padrao);
  Status:=[Padrao];
end;

procedure TFrmCdCliente.PgCtrolMdCadastroChange(Sender: TObject);
begin
  inherited;
  if PgCtrolMdCadastro.ActivePage = TbSheetMdCadastroConsulta then
  begin
    if salvouOCiente = True then
      AtualizaQryConsulta;
    salvouOCiente := False;
  end else if PgCtrolMdCadastro.ActivePage = TbSheetMdCadastroDados then
  begin
    AtualizaCampos;
    DesativaCampos;
    TrataBotoesPadrao(Sender,Padrao);
    Status:=[Padrao];
  end else if (PgCtrolMdCadastro.ActivePage = TbSheetRelatorio) then
    ComboBox2.setFocus;
end;

procedure TFrmCdCliente.TBSheetMdCadastroConsultaEnter(Sender: TObject);
begin
  inherited;
  BtnMdImprimir.Enabled := True;
  if EdtConsulta.Visible then EdtConsulta.SetFocus;
  if dtData1.Visible     then dtData1.SetFocus;
end;

procedure TFrmCdCliente.BtnMdExcluirClick(Sender: TObject);
begin
  inherited;
  if FrmPrincipalPreVenda.Permissao('11','E') = 'N' then begin
    BtnMdCancelarClick(Self);
    Exit;
  end;
  if AdoQryConsulta.FieldByName('Excluir').AsString = 'N' then begin
    MessageDlg('Este cliente não pode ser excluido!', mtWarning, [mbOk], 0);
    BtnMdCancelarClick(Self);
    Exit;
  end;
  if MessageDlg('Confirma a exclusão deste cliente?', MtConfirmation,
     [mbYes, mbNo], 0) = mrYes then begin
    With AdoQryExcluir do begin
      Sql.Text := 'Select dsLancamento From Lancto WITH (NOLOCK) Where cdPessoa = :CDPESSOA ';
      parameters.parambyname('CDPESSOA').value := EdtCodigo.Text;
      Open;
      if RecordCount <> 0 then
      begin
        MessageDlg('Este cliente possui lancamentos. Você não poderá excluí-lo!',MtConfirmation, [mbOk], 0);
        close;
        exit;
      end;
      close;
      Sql.Text := 'Select cdPessoa from Objeto WITH (NOLOCK) Where cdPessoa = :CDPESSOA ';
      parameters.parambyname('CDPESSOA').value := EdtCodigo.Text;
      Open;
      if RecordCount <> 0 then begin
        MessageDlg('Este cliente possui equipamentos. Você não poderá excluí-lo!',
          MtConfirmation, [mbOk], 0);
        close;
        exit;
      end;
      Close;
    end;
    With AdoQryExcluir do  // exclusao de clientes
    begin
      try
        DModulo.Conexao.BeginTrans;

        // deleta as prevendas
        Sql.Text := 'Delete From Orcamento Where cdCliente = :CDPESSOA AND nrObjeto = 0 ';
        parameters.parambyname('CDPESSOA').value := EdtCodigo.Text;
        ExecSql;
        if RgPessoaD.ItemIndex = 0 then
          Sql.Text := 'Delete From P_Fisica Where cdPessoa = :CDPESSOA '
        else
          Sql.Text := 'Delete From P_Juridica Where cdPessoa = :CDPESSOA ';
        parameters.parambyname('CDPESSOA').value := EdtCodigo.Text;
        ExecSql;
        Sql.Text := 'Delete From Endereco Where cdPessoa = :CDPESSOA ';
        parameters.parambyname('CDPESSOA').value := EdtCodigo.Text;
        ExecSql;
        Sql.Text := 'Delete From Telefone Where cdPessoa = :CDPESSOA ';
        parameters.parambyname('CDPESSOA').value := EdtCodigo.Text;
        ExecSql;
        if UPPERCASE(vEmpresa) = 'MASSAPAULISTA' then
        begin
          Sql.Text := 'Delete From itePreco Where cdPessoa = :CDPESSOA ';
          parameters.parambyname('CDPESSOA').value := EdtCodigo.Text;
          ExecSql;
        end;
        sql.Text := 'delete PESSOA_ALT_SPED where cdPessoa = :cdPessoa';
        parameters.parambyname('CDPESSOA').value := EdtCodigo.Text;
        ExecSql;

        Sql.Text := 'Delete From Cliente Where cdPessoa = :CDPESSOA ';
        parameters.parambyname('CDPESSOA').value := EdtCodigo.Text;
        ExecSql;
        Sql.Text := 'Delete From Pessoa Where cdPessoa = :CDPESSOA ';
        parameters.parambyname('CDPESSOA').value := EdtCodigo.Text;
        ExecSql;
        FrmPrincipalPreVenda.SalvaLogEventos('Exclusão de cliente.',FrmPrincipalPreVenda.PegaDataBanco,FrmPrincipalPreVenda.PegaHoraBanco,
                                                          EdtCodigo.Text,'',0,StrToInt(cdOperador),'1');
        DModulo.Conexao.CommitTrans;
        Messagedlg('Cliente excluído com sucesso!', mtinformation, [mbOk], 0);
      except
        DModulo.Conexao.RollbackTrans;
        Messagedlg('Você não pode excluir este cliente!', mterror, [mbOk], 0);
      end;
    end;
    EdtNome.SetFocus;
    AdoQryConsulta.Next;
    EdtCodigo.Text := AdoQryConsulta.FieldByName('Código').AsString;
    AtualizaQryConsulta;
    AtualizaCampos;
  end;
end;

procedure TFrmCdCliente.SBtnTelefoneClick(Sender: TObject);
begin
  inherited;
  FrmCdTelefone.FormQueChamamouC(EdtCodigo.Text);
  FrmCdTelefone.FormQueChamamouN(EdtNome.Text);
  FrmCdTelefone := TFrmCdTelefone.Create(FrmCdCliente);
  FrmCdTelefone.PopupParent := FrmCdCliente;
  FrmCdTelefone.Show;
end;

procedure TFrmCdCliente.BtnMdAlterarClick(Sender: TObject);
var
  AuxiCombo : String[2];
  i : integer;
begin
  inherited;
  if FrmPrincipalPreVenda.Permissao('11','A') = 'N' then
  begin
    BtnMdCancelarClick(Self);
    Exit;
  end;

  { Guardo o CNPJ para, na hora de salvar, verificar se houve alteração }
  CNPJAtual:= MskCgc.Text;
  if AdoQryConsulta.FieldByName('Excluir').AsString = 'N' then
  begin
    MessageDlg('Este cliente não pode ser alterado!', mtWarning, [mbOk], 0);
    BtnMdCancelarClick(Self);
    Exit;
  end;
  AtivaCampos;
  MontaComboVendedor;
  EdtCdVendedor.Text := AdoQryConsulta.FieldByName('cdPessoa_1').AsString;
  if (EdtCdVendedor.Text <> '') and (EdtCdVendedor.Text <> '0') and (EdtCdVendedor.Text <> '1') then
  begin
    AdoQryFuncionario.Open;
    if AdoQryFuncionario.Locate('cdPessoa',EdtCdVendedor.Text,[]) then
    begin
      for i := 0 to CbxVendedor.Items.Count do
      begin
        if CbxVendedor.Items[i] = AdoQryFuncionario.FieldByName('nmPessoa').AsString then
        begin
          CbxVendedor.ItemIndex := i;
          Break;
        end; // if
      end; // for
    end
    else
      CbxVendedor.ItemIndex := -1;
  end
  else
    CbxVendedor.ItemIndex := -1;
  //SPED FISCAL
  // pega os campos para comparar se foram alterados antes
  if RgPessoaD.ItemIndex = 0 then // SE FOR PESSOA FÍSICA
     preencheVetorSped('A',EdtNome.Text,mskCgc.Text,mskCpf.Text,MskInscricao2.Text,EdtCdMunicipio.Text,
                       EdtEndereco.Text, EdtNumero.Text,EdtComplemento.Text,EdtBairro.Text)
  else
     preencheVetorSped('A',EdtNome.Text,mskCgc.Text,mskCpf.Text,MskInscricao.Text,EdtCdMunicipio.Text,
                       EdtEndereco.Text, EdtNumero.Text,EdtComplemento.Text,EdtBairro.Text);          
  if RgPessoad.ItemIndex = 0 then
    VauxiAlterar := 0
  else
    VauxiAlterar := 1;
  AuxiCombo := CbxEstado.Text;
  CbxEstado.Enabled := true;
  if PgCtrolMdCadastro.ActivePage = TBSheetMdCadastroDados then
    EdtNome.SetFocus
  else if PgCtrolMdCadastro.ActivePage = TabSheet1 then
    EdtDias.SetFocus
end;

procedure TFrmCdCliente.BtnMdImprimirClick(Sender: TObject);
begin
  inherited;
  if FrmPrincipalPreVenda.Permissao('11','I') = 'N' then
    Exit;
  if PgCtrolMdCadastro.ActivePage = TBSheetMdCadastroConsulta then
  begin
    FrmRelCliente := TFrmRelCliente.Create(Self);
    if CmbConsulta.ItemIndex = 5 then
      FrmRelCliente.QRGroup1.Expression := 'ADOQryRelDados.Bairro'
    else
      FrmRelCliente.QRGroup1.Visible := False;
    With FrmRelCliente.AdoQryRelDados do
    begin
//      if (RGPessoa.ItemIndex = 0) or (RGPessoa.ItemIndex = 2) then // Não Físico - Oculta Data de Nascimento
//      begin
//        FrmRelCliente.QRLbldtNascimento.Enabled := False;
//        FrmRelCliente.QRLabel10.Enabled         := False;
//      end;
//      if RGPessoa.ItemIndex = 1 then  // Física
//      begin
//        FrmRelCliente.QRLbldtNascimento.Enabled := True;
//        FrmRelCliente.QRLabel10.Enabled         := True;
//      end;
      Sql.Clear;
      Sql.Text := AdoQryConsulta.Sql.Text;
      Parameters.ParamByName('PARAMETRO').Value := EdtConsulta.Text + '%';
      if CmbConsulta.ItemIndex = 3 then
      begin
        parameters.parambyname('DTINICIO').Value := Dateof(DtData1.Date);//'07/30/1979';//DateToStr(DtData1.Date);
        parameters.parambyname('DTFIM').Value    := Dateof(DtData2.Date);//'07/30/1979';//DateToStr(DtData1.Date);
      end else if CmbConsulta.ItemIndex = 14 then
      begin
        //Parameters.ParamByName('CDPESSOA_11').Value := EdtConsulta.Text ;
        Parameters.ParamByName('CDPESSOA_1').Value := EdtConsulta.Text ;
      end else if CmbConsulta.ItemIndex = 16 then
      begin
        parameters.parambyname('DTINICIO1').Value := Dateof(DtData1.Date);//'07/30/1979';//DateToStr(DtData1.Date);
        parameters.parambyname('DTFIM1').Value    := Dateof(DtData2.Date);//'07/30/1979';//DateToStr(DtData1.Date);
//        parameters.parambyname('DTINICIO2').Value := Dateof(DtData1.Date);//'07/30/1979';//DateToStr(DtData1.Date);
//        parameters.parambyname('DTFIM2').Value    := Dateof(DtData2.Date);//'07/30/1979';//DateToStr(DtData1.Date);
      end;
      Open;
    end;
    // Ativos/Inativos
    case RGAtvInatv.ItemIndex of
//      0: FrmRelCliente.QrLblAtivo.Caption := 'Todos';
      1: FrmRelCliente.QrLblAtivo.Caption := 'Ativos';
      2: FrmRelCliente.QrLblAtivo.Caption := 'Inativos';
    end;
    // tipo de cliente
    if ChkBTpcliente.Checked = true then
       FrmRelCliente.QrLblAtivo.Caption := FrmRelCliente.QrLblAtivo.Caption +' Tp/Cli:  '+
                                           CBTpCliente.Text;
    case RGTipoCliente.ItemIndex of
//      0:FrmRelCliente.QrLblPubPriv.Caption := 'Todos';
      1:FrmRelCliente.QrLblPubPriv.Caption := 'Atacado';
      2:FrmRelCliente.QrLblPubPriv.Caption := 'Varejo';
    end;
    // Físicos e Jurídicos
    case RGPessoa.ItemIndex of
      0: FrmRelCliente.QrLblFJ.Caption := 'Físicos e Jurídicos';
      1: FrmRelCliente.QrLblFJ.Caption := 'Físicos';
      2: FrmRelCliente.QrLblFJ.Caption := 'Jurídicos';
    end;
    // Públicos e Privados
    case CmbConsulta.ItemIndex of
      0,1,2:
      begin// todos
        FrmRelCliente.QrLabel1.Caption    := '';
        FrmRelCliente.QrLblPessoa.Caption := '';
      end;
      3:
      begin
        FrmRelCliente.QrLabel1.Caption    := 'Cadastrados entre: ';
        FrmRelCliente.QrLblPessoa.Caption := DatetoStr(dtData1.Date) + ' e ' +
        DatetoStr(dtData2.Date);
      end;
      16:
      begin
        FrmRelCliente.QrLabel1.Caption    := 'Nascidos de: ';
        FrmRelCliente.QrLblPessoa.Caption := DatetoStr(dtData1.Date) + ' a ' +
        DatetoStr(dtData2.Date);
      end;
    end; // end
    FrmRelCliente.QRMdRel.Preview;
    FrmRelCliente.Free;
  end else
  begin
    if UPPERCASE(vEmpresa) = 'TELEQUIPE' then
    begin
      FrmRelClienteTelequipe := TFrmRelClienteTelequipe.Create(Self);
      if (Edit1.Text = '') and (ComboBox2.Text <> ' <Todos>') then
      begin
        Application.OnMessage := FormPrincipal.NaoProcessaMsg;
        MessageDlg('Selecione o equipamento!',mtWarning,[mbOK],0);
        ComboBox2.SetFocus;
        Application.OnMessage := FormPrincipal.NaoProcessaMsg;
        Exit;
      end;
      With FrmRelClienteTelequipe.AdoQryRelDados do
      begin
        Sql.Text := 'Select P.CdPessoa as Código,P.nmPessoa as Cliente,C.dsLimCredito        '+
                    'as Limite_Crédito,P.dsEmail,P.Ser,P.Existir,P.dsHomePage,P.DtCadastro,  '+
                    'P.DsAtivo,P.dsMemo,C.DsPublicoPrivado,C.dsExcluir as Excluir,           '+
                    'E.nmLogradouro as Endereço,E.dsComplemento as Complemento,              '+
                    'E.dsBairro as Bairro,E.dsCidade as Cidade,E.dsCep as CEP,               '+
                    'E.dsUf as Estado,C.dsContrato,C.dtInicio,C.dtFim,C.nrVisitas,C.tpStatus,'+
                    'C.dsEquipamentos,C.nrRamais,C.dsOutros,C.cdTecnico,C.nrObjeto           '+
                    'From Pessoa as P with (nolock),Cliente as C with (nolock),Endereco as E with (nolock) '+
                    'Where P.CdPessoa = C.CdPessoa and P.CdPessoa = E.cdPessoa and P.Ser = ''C''           ';
        if RadioGroup1.Itemindex <> 0 then
           Sql.Add('and C.TpStatus = '+IntToStr(RadioGroup1.ItemIndex -1)+'');
        if ComboBox2.Text <> ' <Todos>' then
           Sql.Add('and C.nrObjeto = '+Edit1.Text+'');
        case RadioGroup2.ItemIndex of
          0 :
          begin
            Sql.Add('and C.dtInicio >= :DTINICIO AND C.dtInicio <= :DTFIM ');
            parameters.parambyname('DTINICIO').Value := DatetoStr(dtInicio.Date);
            parameters.parambyname('DTFIM').Value    := DatetoStr(dtFim.Date);
            FrmRelClienteTelequipe.QrLabel1.Caption           := 'Periodo Inicial ';
            FrmRelClienteTelequipe.QrLblPessoa.Caption        := DatetoStr(dtInicio.Date) + ' à ' +
                                                        DatetoStr(dtFim.Date);
          end;
          1 :
          begin
            Sql.Add('and C.dtFim >= :DTINICIO AND C.dtFim <= :DTFIM ');
            parameters.parambyname('DTINICIO').Value := DatetoStr(dtInicio.Date);
            parameters.parambyname('DTFIM').Value    := DatetoStr(dtFim.Date);
            FrmRelClienteTelequipe.QrLabel1.Caption           := 'Periodo Final ';
            FrmRelClienteTelequipe.QrLblPessoa.Caption        := DatetoStr(dtInicio.Date) + ' à ' + DatetoStr(dtFim.Date);
          end;
        end;
        Sql.Add('Order By P.nmPessoa');
        Open;
        FrmRelClienteTelequipe.QRLbldtNascimento.Enabled := False;
        FrmRelClienteTelequipe.QRLblFJ.Enabled     := False;
        FrmRelClienteTelequipe.QrLblATivo.Caption  := 'Equip.: '+ ComboBox2.Text;
        case RadioGroup1.itemIndex of
          0: FrmRelClienteTelequipe.QrLblPubPriv.Caption := 'Status do contrato: Todos';
          1: FrmRelClienteTelequipe.QrLblPubPriv.Caption := 'Status do contrato: Sem Contrato';
          2: FrmRelClienteTelequipe.QrLblPubPriv.Caption := 'Status do contrato: Aberto';
          3: FrmRelClienteTelequipe.QrLblPubPriv.Caption := 'Status do contrato: Garantia';
          4: FrmRelClienteTelequipe.QrLblPubPriv.Caption := 'Status do contrato: A Cobrar';
          5: FrmRelClienteTelequipe.QrLblPubPriv.Caption := 'Status do contrato: Fechado';
          6: FrmRelClienteTelequipe.QrLblPubPriv.Caption := 'Status do contrato: Cancelado';
        end;
      end;
      FrmRelClienteTelequipe.QRMdRel.Preview;
      FrmRelClienteTelequipe.Free;
    end;
  end;
end;

procedure TFrmCdCliente.FormCreate(Sender: TObject);
begin
  inherited;
  Linha := 0;
  PARAM:='Cliente'; //Parametro para  Ordenar pelo titulo
  if UPPERCASE(vEmpresa) = 'PROAUTO' then
  begin
//    Label14.caption := 'Desconto pré-venda';
    Label15.caption := 'Desc C Receber';
  end;
  if vDescontoClienteAuto = True then //aplica desconto automatico por cliente nas vendas
  begin
    Label8.Visible        := True;
    edtDescVista.Visible  := True;
  end;
  if UPPERCASE(vEmpresa) = 'TELEQUIPE' then
  begin  //antes na telequipe tinha essas duas abas (Contrato e Relatórios)
    TbSheetContratos.TabVisible := True;
    TbSheetRelatorio.TabVisible := True;
    DBGrid1.Columns[2].Visible  := True;   //e essa coluna de nr contratos
    With AdoQryTecnico do
    begin
      Sql.Text := 'Select P.nmPessoa as Técnico,P.cdPessoa as Código, C.CdCargo  '+
                  'FROM Pessoa P with (nolock) INNER JOIN                        '+
                  '(Cargo C with (nolock) INNER JOIN Funcionario U with (nolock) '+
                  'ON C.cdcargo = U.cdcargo) ON P.cdPessoa = U.cdPessoa          '+
                  'Where P.ser = ''U'' and P.dsAtivo = ''S'' and C.nmCargo in    '+
                  '(''VENDEDOR'',''CAIXA'',''MECANICO'',''TÉCNICO'')             ';
      MontaComboListBoolADO(AdoQryTecnico,CbTecnico);
    end;
    With AdoQryEquipamento do
    begin
      Sql.Text := 'Select dsModelo, nrObjeto from Objeto with (nolock) ';
      MontaComboListBoolADO(AdoQryEquipamento,CbxEquipamento);
      MontaComboListBoolADO(AdoQryEquipamento,ComboBox2);
      ComboBox2.Items.Add(' <Todos>');
      ComboBox2.Text := ' <Todos>';
    end;
    dtInicio.Date       := Date;
    dtFim.Date          := Date;
    EdtdataChegada.Date := Date;
    EdtdataSaida.Date   := Date + 365;
  end else
  begin
    TbSheetContratos.TabVisible := False;
    TbSheetRelatorio.TabVisible := False;
    DBGrid1.Columns[2].Visible  := False;

    //COLOQUEI ISSO AKI POIS NOS OUTROS CLIENTES (EXCETO TELEQUIPE) DÁ UM ERRO DE NO ARGUMENT FORMAT %...
    //MAS TEM QUE TER ESSES CAMPOS NO ADOQRYCONSULTA - KENNETH
    ADOQryConsulta.FieldByName('nr_contrato').Destroy;
    ADOQryConsulta.FieldByName('dtInicio').Destroy;
    ADOQryConsulta.FieldByName('dtFim').Destroy;
    ADOQryConsulta.FieldByName('nrVisitas').Destroy;
    ADOQryConsulta.FieldByName('tpStatus').Destroy;
    ADOQryConsulta.FieldByName('dsEquipamentos').Destroy;
    ADOQryConsulta.FieldByName('nrRamais').Destroy;
    ADOQryConsulta.FieldByName('dsOutros').Destroy;
    ADOQryConsulta.FieldByName('cdTecnico').Destroy;
    ADOQryConsulta.FieldByName('nrObjeto').Destroy;    
  end;

  if TNEGLoja.getConfiguracaoRegimeTributario = 'S' then
    ckbIsento.Visible := False
  else
    ckbIsento.Visible := True;

  if UPPERCASE(vEmpresa) = 'RILDON' then
  begin // no caso de Rildon o limite de credito fica liberado
    Label8.Visible  := true;
    Label17.Visible := true;
    edtDescVista.Visible  := true;
    edtDescPrazo.Visible  := true;
  end;
  if UPPERCASE(vEmpresa) = 'SUPPORT' then
  begin // exibir o campo da matriz para os clientes da support
    EdtCdMatriz.Visible := true;                             //isso é usado para indicar para qual pasta no ftp vai os boletos dos clientes
    LblMatriz.Visible   := true;
    CbxFaturaUnica.Visible := true;
  end;

  dtData1.Date := Date;
  dtData2.Date := Date;
  With CmbConsulta do
  begin // adiciona itens a combo de consulta
    Clear;
    Items.Add('Todos');
    Items.Add('Código');
    Items.Add('Nome');
    Items.Add('Data de Nascimento');
    Items.Add('Endereço');
    Items.Add('Bairro');
    Items.Add('N° Telefone');
    Items.Add('CNPJ');
    Items.Add('CPF');
    Items.Add('Cidade');
    Items.Add('Apelido');
    Items.Add('Região');
    Items.Add('Sigla Estado');
    Items.Add('Razão Social');
    Items.Add('Cod Vendedor');
    Items.Add('Email');
    Items.Add('Data de Cadastro');
    Text := Items[2];
    ItemIndex := 2;
  end;
  montaComboVendedor;
  With AdoQryGrupo do
  begin
    Sql.Text := 'Select dsRegiao, cdRegiao From Regiao WITH (NOLOCK) Order By dsRegiao ';
    MontaComboListBoolAdo(AdoQryGrupo,CbxRegiao);
  end;
  PgCtrolMdCadastro.ActivePage := TBSheetMdCadastroConsulta;
  MontaComboListBoolAdo(AdoQryPegaEstado,CbxEstado);
  // monta a combo de tipo de cliente
  AdoQryTpCliente.open;
  MontaComboListBoolAdo(AdoQryTpCliente,CBTpCliente);
  CbBtpCli.Items :=  CBTpCliente.Items;

  if CBTpCliente.Items.Count = 0 then
    ShowMessage('Para cadastrar os clients você deverá cadastrar primeiro pelo menos um Tipo para este cliente!' + #13'' +
    ' '+ #13'' + 'Acesse o menu de cadastro, selecione Parametros e em seguida a opção Tipo de Cliente');
end;

procedure TFrmCdCliente.BtnMdSairClick(Sender: TObject);
begin
  inherited;
  FrmPrincipalPreVenda.Cadastrodeclientes1.Enabled := True;
end;

procedure TFrmCdCliente.RgPessoaDClick(Sender: TObject);
begin
  inherited;
  inherited;
  if RgPessoaD.ItemIndex = 0 then  // fisico
  begin
    MskCgc.Visible     := false;
    LblCgc.Visible     := false;
    MskInscricao.Visible := false;
    Label1.Visible     := false;
    EdtRazao.Visible   := false;
    LblContato.Visible := false;
    EdtContato.Visible := false;
    Label2.Visible     := false;
    LblInscMunicipal.visible := false;
    MskInscricaoMunic.Visible := False;
    EdtTelContato.Visible   := false;
    LblRamalContato.Visible := false;
    EdtRamalContato.Visible := false;
    MskCpf.Visible   := True;
    LblCpf.Visible   := True;
    LblIdade.Visible := True;
    MskNascimento.Visible := True;
    LblIdentidade.Visible := True;
    EdtIdentidade.Visible := True;
    MskInscricao2.Visible := True;
    LblNaruralidade.Visible := True;
    EdtNaturalidade.Visible := True;
  end else         // juridico
  begin
    MskCpf.Visible := False;
    LblCpf.Visible := False;
    LblIdade.Visible := False;
    MskNascimento.Visible := False;
    LblIdentidade.Visible := False;
    EdtIdentidade.Visible := False;
    LblInscMunicipal.visible := True;    
    MskInscricaoMunic.Visible   := True;
    LblNaruralidade.Visible := False;
    EdtNaturalidade.Visible := False;
    MskInscricao2.Visible   := False;
    MskCgc.Visible          := True;
    LblCgc.Visible          := True;
    MskInscricao.Visible    := True;
    Label1.Visible          := True;
    EdtRazao.Visible        := True;
    LblContato.Visible      := True;
    EdtContato.Visible      := True;
    Label2.Visible          := True;
    EdtTelContato.Visible   := True;
    LblRamalContato.Visible := True;
    EdtRamalContato.Visible := True;
  end;
end;

procedure TFrmCdCliente.EdtLimiteKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  ValidarNumero(Key);
end;

procedure TFrmCdCliente.EdtNumeroKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = ' ' then
     Key:= #0;
end;

procedure TFrmCdCliente.EdtVisitasExit(Sender: TObject);
begin
  EdtVisitas.Text := FormatFloat('0',StrToIntDef(EdtVisitas.Text,0));
end;

procedure TFrmCdCliente.EdtLimiteExit(Sender: TObject);
begin
  inherited;
  if EdtLimite.Text = '' then EdtLimite.Text := '0,00';
  EdtLimite.Text := FormatFloat('0.00',StrToFloat(EdtLimite.Text));
end;

procedure TFrmCdCliente.CmbConsultaClick(Sender: TObject);
begin
  inherited;
  case CmbConsulta.ItemIndex of
    0,1,2,4,5,6,7,8,9,10,11,12,13,14,15: // todos
    begin
      LblMdConsulta.Caption := 'Texto para Pesquisa';
      EdtConsulta.Visible   := True;
      EdtConsulta.Enabled   := True;
      LblA.Visible          := False;
      dtData1.Visible       := False;
      dtData2.Visible       := False;
      EdtConsulta.SetFocus;
    end;
    3:  //data de nascimento
    begin
      RGPessoa.ItemIndex    := 1; // Força Pessoa Física
      LblMdConsulta.Caption := 'Período de Nascimento';
      EdtConsulta.Visible   := False;
      EdtConsulta.Enabled   := False;
      LblA.Visible          := True;
      dtData1.Visible       := True;
      dtData2.Visible       := True;
      dtData1.SetFocus;
    end;
    16:
    begin
      LblMdConsulta.Caption := 'Período de Cadastro';
      EdtConsulta.Visible   := False;
      EdtConsulta.Enabled   := False;
      LblA.Visible          := True;
      dtData1.Visible       := True;
      dtData2.Visible       := True;
      dtData1.SetFocus;
    end;
  end; // end
  AtualizaQryConsulta;
end;

{
verifica se já existe outro cliente com o mesmo CNPJ ou CPF
esta verificação é para evitar possíveis errso para quem gera SPED
}
function TFrmCdCliente.CNPJ_CPFIguais: Boolean;
var
  complementoDaPergunta : string;
begin
  if vGerarSpedFiscal then
    complementoDaPergunta := 'CNPJs ou CPFs iguais podem gerar erro (s) no SPED Fiscal e Contribuições.'
  else
    complementoDaPergunta := 'CNPJs ou CPFs iguais podem gerar duplicidade de cadastro.';
  if ((Length(MskCgc.Text) > 0) and (RgPessoaD.ItemIndex = 1) and (SoNumeros(MskCgc.Text) <> '')) then  //and (UpperCase(vEmpresa)<>'PLANTA') and (UpperCase(vEmpresa)<>'BG')
  begin
    With AdoQryCombFone do
    begin
      Sql.Text := 'Select P.cdPessoa,P.nmPessoa,J.CGC FROM Pessoa P WITH (NOLOCK) INNER JOIN '+
      'P_Juridica J WITH (NOLOCK) ON P.cdPessoa =  J.cdPessoa            '+
      'Where P.cdPessoa <> :PESSOA and J.CGC = :CGC and P.ser ='+ '''C'' ';
      Parameters.ParamByName('CGC').Value := MskCgc.Text;
      Parameters.ParamByName('PESSOA').Value := StrToIntDef( EdtCodigo.Text, 0);
      Open;
      if (AdoQryCombFone.RecordCount <> 0)  then
      begin
        Application.OnMessage := FormPrincipal.NaoProcessaMsg;
        if MessageDlg('Este CNPJ já está cadastrado com o'+ #13#10 + 'CLIENTE --> ' +
          AdoQryCombFone.FieldByName('cdPessoa').AsString + ' - ' +
          AdoQryCombFone.FieldByName('nmPessoa').AsString + #13#10 + #13#10 +
          complementoDaPergunta + #13#10 + #13#10 +
          'Deseja salvar mesmo correndo risco futuro?', MtConfirmation,
          [mbYes, mbNo], 0) = mrYes then
          Result := True
        else
          Result := False;
      end
      else
        result := True;
      Application.OnMessage := FormPrincipal.ProcessaMsg;
      if PgCtrolMdCadastro.ActivePage = TBSheetMdCadastroDados then
        EdtNome.SetFocus
      else
        EdtDias.SetFocus;
      close;
    end;
  end else if ((Length(MskCPF.Text) > 0) and (RgPessoaD.ItemIndex = 0) and (SoNumeros(MskCpf.Text) <> '')) then   //and (UpperCase(vEmpresa)<>'PLANTA') and (UpperCase(vEmpresa)<>'BG')
  begin
    With AdoQryCombFone do
    begin
      Sql.Text := 'Select P.cdPessoa,P.nmPessoa,J.dsCPF FROM Pessoa P WITH (NOLOCK) INNER JOIN '+
      'P_Fisica J WITH (NOLOCK) ON P.cdPessoa =  J.cdPessoa               '+
      'Where P.cdPessoa <> :PESSOA and J.dsCPF = :CPF and P.ser ='+ '''C''';
      Parameters.ParamByName('CPF').Value := MskCpf.Text;
      Parameters.ParamByName('PESSOA').Value := StrToIntDef( EdtCodigo.Text, 0);
      Open;
      if (AdoQryCombFone.RecordCount <> 0) then
      begin
        Application.OnMessage := FormPrincipal.NaoProcessaMsg;
        if MessageDlg('Este CPF já está cadastrado com o'+ #13#10 + 'CLIENTE --> ' +
          AdoQryCombFone.FieldByName('cdPessoa').AsString + ' - ' +
          AdoQryCombFone.FieldByName('nmPessoa').AsString + #13#10 + #13#10 +
          complementoDaPergunta + #13#10 + #13#10 +
          'Deseja salvar mesmo correndo risco futuro?', MtConfirmation,
          [mbYes, mbNo], 0) = mrYes then
          Result := True
        else
          Result := False;
      end else
        result := True;
      Application.OnMessage := FormPrincipal.ProcessaMsg;
      if PgCtrolMdCadastro.ActivePage = TBSheetMdCadastroDados then
        EdtNome.SetFocus
      else
        EdtDias.SetFocus;
      close;
    end;
  end else
    Result := True;
end;

procedure TFrmCdCliente.dtData2Change(Sender: TObject);
begin
  inherited;
  AtualizaQryConsulta;
end;

procedure TFrmCdCliente.dtData1Change(Sender: TObject);
begin
  inherited;
  AtualizaQryConsulta;
end;

procedure TFrmCdCliente.MmClienteEnter(Sender: TObject);
begin
  inherited;
  Application.OnMessage := FormPrincipal.NaoProcessaMsg;
end;

procedure TFrmCdCliente.MmClienteExit(Sender: TObject);
begin
  inherited;
  Application.OnMessage := FormPrincipal.ProcessaMsg;
end;

procedure TFrmCdCliente.RGAtvInatvClick(Sender: TObject);
begin
  inherited;
  AtualizaQryConsulta;
end;

procedure TFrmCdCliente.ChkBTpclienteClick(Sender: TObject);
begin
  inherited;
  if ChkBTpcliente.Checked = true then
  begin
    CBTpCliente.ItemIndex := 0;
    CBTpCliente.Enabled := True;
    CBTpClienteChange(Self);
    CBTpCliente.SetFocus;
  end else
  begin
    CBTpCliente.ItemIndex := -1;
    CBTpCliente.Enabled := False;
  end;
  AtualizaQryConsulta;
end;


procedure TFrmCdCliente.CbBtpCliChange(Sender: TObject);
begin
  inherited;
  if CbBtpCli.ItemIndex <> -1 then
  begin
    AdoQryTpCliente.Open;
    AdoQryTpCliente.Locate('nmTipo',CbBtpCli.Text,[]);
    EdtcdTpCli.Text := AdoQryTpCliente.FieldbyName('cdCodigo').AsString;
    AtualizaQryConsulta;
  end;
end;

procedure TFrmCdCliente.CbxEstadoChange(Sender: TObject);
begin
  inherited;
  with ADOQryMunicipio do
  begin
    close;
    Parameters.ParamByName('DSUF').Value := CbxEstado.Text;
    Open;
  end;
  MontaComboListADO(ADOQryMunicipio,CbxCidade);
  CbxCidade.itemindex := -1;
  CbxCidade.text      := '';
end;

procedure TFrmCdCliente.CbxCidadeChange(Sender: TObject);
begin
  inherited;
  if CbxCidade.ItemIndex <> -1 then
  begin
    AdoQryMunicipio.Open;
    AdoQryMunicipio.Locate('dsMunicipio',CbxCidade.Text,[]);
    EdtCdMunicipio.Text := AdoQryMunicipio.FieldByName('cdMunicipio').AsString;
    //AdoQryMunicipio.Close;
  end else
  begin
    EdtCdMunicipio.Clear;
  end;
end;

procedure TFrmCdCliente.CbxTelefoneChange(Sender: TObject);
begin
  inherited;
  if CbxTelefone.ItemIndex <> -1 then
  begin
    AdoQryCombFone.Open;
    AdoQryCombFone.Locate('nmTelefone',CbxTelefone.Text,[]);
    EdtRamal.Text := AdoQryCombFone.FieldByName('dsRamal').AsString;
    EdtTipoTel.Text := AdoQryCombFone.FieldByName('dsTelefone').AsString;
  end;
end;

procedure TFrmCdCliente.CBTpClienteChange(Sender: TObject);
begin
  inherited;
  if CBTpCliente.ItemIndex <> -1 then
  begin
    AdoQryTpCliente.Open;
    AdoQryTpCliente.Locate('nmTipo',CBTpCliente.Text,[]);
    EdtcdTpCliente.Text := AdoQryTpCliente.FieldbyName('cdCodigo').AsString;
    AtualizaQryConsulta;
  end;
end;

procedure TFrmCdCliente.MskInscricao2Exit(Sender: TObject);
begin
  inherited;
  //MskInscricao2.Text := AlinharDireitaMsk(MskInscricao2);
  MskInscricao2.Text := SoNumeros(MskInscricao2.Text);
end;

procedure TFrmCdCliente.MskInscricao2KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  ValidarNumero(Key);
end;

procedure TFrmCdCliente.MskInscricaoChange(Sender: TObject);
begin
  inherited;
  //if MskInscricao.Text <> '' then
    ckbIndIEDest.Enabled := true
  //else
  //  ckbIndIEDest.Enabled := false;
end;

procedure TFrmCdCliente.MskInscricaoExit(Sender: TObject);
begin
  inherited;
  ///MskInscricao.Text := AlinharDireitaMsk(MskInscricao);
  MskInscricao.Text := SoNumeros(MskInscricao.Text);
end;

procedure TFrmCdCliente.MskInscricaoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  ValidarNumero(Key);
end;

procedure TFrmCdCliente.Help1Click(Sender: TObject);
begin
  inherited;
  Application.HelpContext(1);
end;


procedure TFrmCdCliente.Grava_Sped(codigo : string);
var
   i : Integer;
   vncampo : string[2];
   qryAux : TADOQuery;
   vDsUf: string;
begin
   qryAux := TADOQuery.Create(Self);
   qryAux.Connection := DModulo.Conexao;
  with qryAux do
  begin
    for i := 1 to 9 do
    begin

      { O índice 4 é a inscrição estadual, que não é mais enviada para a tabela de alterações do participante. }
      if i = 4 then
         Continue;

      //vincula o indice do vetor ao campo da tabela Pessoa_Alt_Sped
      case i of
        1 : vncampo := '03';
        2 : vncampo := '05';
        3 : vncampo := '06';
        4 : vncampo := '07';
        5 : vncampo := '08';
        6 : vncampo := '10';
        7 : vncampo := '11';
        8 : vncampo := '12';
        9 : vncampo := '13';
      end;
      if (v_comparaSedAntes[i] <> v_comparaSedDepois[i])and(Trim(v_comparaSedAntes[i])<>'') then
      begin
        //Verifica se na tabela já possui alteração para este campo nesta data para este codigo de pessoa
        SQL.Text := 'Select cdPessoa from PESSOA_ALT_SPED with (nolock)         '+
                    'Where cdPessoa = :CDPESSOA and dtAlteracao = :DTALTERACAO  '+
                    'and nrCampo = :NRCAMPO                                     ';
        parameters.parambyname('CDPESSOA').Value    := codigo;
        parameters.parambyname('DTALTERACAO').Value := FrmPrincipalPreVenda.PegaDatabanco;
        parameters.parambyname('NRCAMPO').Value     := vncampo;
        Open;
        if QryAux.RecordCount = 0 then //caso não tenha alteraçãor insere a alteração
        begin

          { Inscrição estadual não é mais enviada para a tabela de alterações do participante }
          {if vncampo = '07' then  // se for inscrição estadual
          begin
            sql.Text := 'select E.dsUF from endereco E inner join pessoa P on E.cdpessoa=P.cdpessoa where p.cdpessoa = :pessoa';
            parameters.parambyname('pessoa').value := codigo;
            open;
            vDsUf := fieldbyname('dsuf').AsString;
            if IEok(v_comparaSedAntes[i], vDsUf) then
            begin
              Sql.Text := 'Insert into PESSOA_ALT_SPED (cdPessoa,dtAlteracao,nrCampo,dsConteudoAnterior) '+
                          'Values (:CDPESSOA,:DTALTERACAO,:NRCAMPO,:DSCONTEUDOANTERIOR)                  ';
              parameters.parambyname('CDPESSOA').Value    := codigo;
              parameters.parambyname('DTALTERACAO').Value := FormPrincipal.PegaDatabanco;
              parameters.parambyname('NRCAMPO').Value     := vncampo;
              parameters.parambyname('DSCONTEUDOANTERIOR').Value :=  v_comparaSedAntes[i];
              ExecSQL;
            end;
          end
          else
          begin}
            Sql.Text := 'Insert into PESSOA_ALT_SPED (cdPessoa,dtAlteracao,nrCampo,dsConteudoAnterior) '+
                        'Values (:CDPESSOA,:DTALTERACAO,:NRCAMPO,:DSCONTEUDOANTERIOR)                  ';
            parameters.parambyname('CDPESSOA').Value    := codigo;
            parameters.parambyname('DTALTERACAO').Value := FrmPrincipalPreVenda.PegaDatabanco;
            parameters.parambyname('NRCAMPO').Value     := vncampo;
            parameters.parambyname('DSCONTEUDOANTERIOR').Value :=  v_comparaSedAntes[i];
            ExecSQL;
//          end;
        end else
        begin//caso tenha alteração altera somente o campo conteudo anterior pois so pode haver uma alteração no campo para a mesma data
            SQL.Text := 'Update PESSOA_ALT_SPED set               '+
                        'dsConteudoAnterior = :DSCONTEUDOANTERIOR '+
                        'Where cdPessoa = :CDPESSOA and dtAlteracao = :DTALTERACAO '+
                        'and nrCampo = :NRCAMPO                                  ';
            parameters.parambyname('CDPESSOA').Value    := codigo;
            parameters.parambyname('DTALTERACAO').Value := FrmPrincipalPreVenda.PegaDatabanco;
            parameters.parambyname('NRCAMPO').Value     := vncampo;
            parameters.parambyname('DSCONTEUDOANTERIOR').Value :=  v_comparaSedAntes[i];
            ExecSQL;
        end;
      end;
    end;
  end;
  FreeAndNil(qryAux);
end;

procedure TFrmCdCliente.Grava_Pessoa;
begin
  With AdoQrySalvar do
  begin
    if RgPessoaD.ItemIndex = 0 then
    begin
      Sql.Text := 'Insert Into P_Fisica (cdPessoa,dsCpf,dsIdentidade,   '+
                  'dtNascimento,dsNaturalidade,dsInscricaoEstadual)     '+
                  'Values (:CDPESSOA,:DSCPF,:DSIDENTIDADE,:DTNASCIMENTO,'+
                  ':DSNATURALIDADE,:DSINSCRICAOESTADUAL)                ';
      parameters.parambyname('CDPESSOA').Value := EdtCodigo.Text;
      parameters.parambyname('DSCPF').value := MskCpf.Text;
      parameters.parambyname('DSIDENTIDADE').value := EdtIdentidade.Text;
      if (Length(MskNascimento.Text) = 10) and (MskNascimento.Text <> '  /  /    ') then
        parameters.parambyname('DTNASCIMENTO').value := MskNascimento.Text
      else
        parameters.parambyname('DTNASCIMENTO').value := null;
      parameters.parambyname('DSNATURALIDADE').value := EdtNaturalidade.Text;
      parameters.parambyname('DSINSCRICAOESTADUAL').value := TRim(MskInscricao2.Text);
    end else
    begin
      Sql.Text := 'Insert Into P_Juridica (cdPessoa,CGC,dsInscricaoEstadual,'+
      'nmRazao,nmContato,dsTelefContato,dsRamalContato) '+
      'Values (:CDPESSOA,:CGC,:DSINSCRICAOESTADUAL,:NMRAZAO,:NMCONTATO,:DSTELEFONECONTATO,:DSRAMALCONTATO) ';
      parameters.parambyname('CDPESSOA').Value  := EdtCodigo.Text;
      parameters.parambyname('CGC').value       := MskCgc.Text;
      parameters.parambyname('DSINSCRICAOESTADUAL').value := TRim(MskInscricao.Text);
      parameters.parambyname('NMRAZAO').value   := EdtRazao.Text;
      parameters.parambyname('NMCONTATO').value := EdtContato.Text;
      parameters.parambyname('DSTELEFONECONTATO').value   := EdtTelContato.Text;
      parameters.parambyname('DSRAMALCONTATO').value      := EdtRamalContato.Text;
    end;
    ExecSql;
  end;
end;

procedure TFrmCdCliente.EdtDiasExit(Sender: TObject);
begin
  inherited;
  if (RgTpVencimento.ItemIndex = 1) or (RgTpVencimento.ItemIndex = 3) then
  begin
    if ((StrToInt(EdtDias.Text) > 30) or (StrToInt(EdtDias.Text) = 0)) and ((status = [novo]) or (status = [Alterar])) then
    begin
      Application.OnMessage := FormPrincipal.NaoProcessaMsg;
      ShowMessage('O dia do vencimento não pode ser "ZERO", nem maior do que o dia 30 de cada mês!');
      EdtDias.SetFocus;
      Application.OnMessage := FormPrincipal.ProcessaMsg;
      Exit;
    end;
    if (StrToInt(EdtDia2.Text)=StrToInt(EdtDias.Text)) and ((status = [novo]) or (status = [Alterar])) and (RgTpVencimento.ItemIndex = 3) then
    begin
      Application.OnMessage := FormPrincipal.NaoProcessaMsg;
      ShowMessage('As datas de vencimento não podem ser iguais!');
      EdtDias.SetFocus;
      Application.OnMessage := FormPrincipal.ProcessaMsg;
      Exit;
    end;
  end;
end;

procedure TFrmCdCliente.EdtDiasKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  ValidarInteiro(Key);
end;

procedure TFrmCdCliente.RgTpVencimentoClick(Sender: TObject);
begin
  inherited;
  case RgTpVencimento.ItemIndex of
    0:
    begin
      Label9.caption  := 'Sem vencimento';
      EdtDia2.Visible := False;
      Label11.Visible := False;
      EdtDias.Enabled := True;
      EdtDias.Text    := '0';
    end;
    1:
    begin
      Label9.Caption    := 'Data base';
      EdtDia2.Visible   := False;
      Label11.Visible   := False;
      EdtDias.Enabled   := True;
    end;
    2:
    begin
      Label9.caption    := 'Dias após a venda';
      EdtDia2.Visible   := False;
      Label11.Visible   := False;
      EdtDias.Enabled   := True;
    end;
    3:
    begin
      Label9.Caption    := '1º Venc';
      Label11.Caption   := '2º Venc';
      EdtDias.Enabled   := True;
      EdtDia2.Visible   := True;
      Label11.Visible   := True;
    end;
  end;
end;

procedure TFrmCdCliente.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if ADOQryConsultadsAtivo.AsString = 'N' then
  begin
    DBGrid1.Canvas.Font.Color:= clRed;
    DBGrid1.Canvas.FillRect(Rect);
    DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
  // Para mudar a cor da linha no DbGrid
  if (TAuxDBGrid(dbgrid1).DataLink.ActiveRecord + 1 = TAuxDBGrid(dbgrid1).Row)  or(gdSelected in State)then
  begin
    dbgrid1.Canvas.Brush.Color  := clSkyBlue;
    dbgrid1.Canvas.Font.Style   := dbgrid1.Canvas.Font.Style + [fsBold];
  end;
  dbgrid1.Canvas.FillRect(Rect);
  if ((dataCol <> 3)) then
//    if Column.Field.Text <> '' then
      dbgrid1.Canvas.TextOut(Rect.Left + 2,Rect.Top,Column.Field.AsString)
  else if ((Column.Field.AsString <> '') and (DataCol = 3)) then
    dbgrid1.Canvas.TextOut(Rect.Left + 2,Rect.Top,FormatFloat('#0.00',Column.Field.AsFloat));
end;

Procedure TFrmCdCliente.EdtDia2Exit(Sender: TObject);
begin
  inherited;
  if (RgTpVencimento.ItemIndex = 1) or (RgTpVencimento.ItemIndex = 3) then
  begin
    if ((StrToInt(EdtDia2.Text) > 30) or (StrToInt(EdtDia2.Text) = 0)) and ((status = [novo]) or (status = [Alterar])) then
    begin
      Application.OnMessage := FormPrincipal.NaoProcessaMsg;
      ShowMessage('O dia do vencimento não pode ser "ZERO",nem maior do que o dia 30 de cada mês!');
      EdtDia2.SetFocus;
      Application.OnMessage := FormPrincipal.ProcessaMsg;
      Exit;
    end;
    if (StrToInt(EdtDia2.Text)=StrToInt(EdtDias.Text)) and ((status = [novo]) or (status = [Alterar])) and (RgTpVencimento.ItemIndex = 3) then
    begin
      Application.OnMessage := FormPrincipal.NaoProcessaMsg;
      ShowMessage('As datas de vencimento não podem ser iguais!');
      EdtDia2.SetFocus;
      Application.OnMessage := FormPrincipal.ProcessaMsg;
      Exit;
    end;
  end;
end;

procedure TFrmCdCliente.CbxRegiaoChange(Sender: TObject);
begin
  inherited;
  if CbxRegiao.ItemIndex <> -1 then
  begin
    AdoQryGrupo.Open;
    AdoQryGrupo.Locate('dsRegiao',CbxRegiao.Text,[]);
    EdtCdRegiao.Text := AdoQryGrupo.FieldbyName('cdRegiao').AsString;
    AtualizaQryConsulta;
  end;
end;

procedure TFrmCdCliente.CbxVendedorChange(Sender: TObject);
begin
  inherited;
  if CbxVendedor.ItemIndex <> -1 then
  begin
    AdoQryFuncionario.Open;
    if AdoQryFuncionario.Locate('nmPessoa',CbxVendedor.Text,[]) then
       EdtCdVendedor.Text := AdoQryFuncionario.FieldbyName('cdPessoa').AsString
    else
       EdtCdVendedor.Text := '';
    AtualizaQryConsulta;
  end;
end;

procedure TFrmCdCliente.EdtDescVistaExit(Sender: TObject);
begin
  inherited;
  if EdtDescVista.Text = '' then EdtDescVista.Text := '0,00';
  EdtDescVista.Text := FormatFloat('0.00',StrToFloat(EdtDescVista.Text));
end;

procedure TFrmCdCliente.EdtDescPrazoExit(Sender: TObject);
begin
  inherited;
  if EdtDescPrazo.Text = '' then EdtDescPrazo.Text := '0,00';
  EdtDescPrazo.Text := FormatFloat('0.00',StrToFloat(EdtDescPrazo.Text));
end;

procedure TFrmCdCliente.EdtDescVistaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  ValidarNumero(Key);
end;

procedure TFrmCdCliente.EdtDescPrazoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  ValidarNumero(Key);
end;

procedure TFrmCdCliente.RGTipoClienteClick(Sender: TObject);
begin
  inherited;
  AtualizaQryConsulta;
end;

procedure TFrmCdCliente.CbxCidadeExit(Sender: TObject);
begin
  inherited;
  if CbxCidade.ItemIndex = (-1) then
    EdtCdMunicipio.Clear;
  CbxCidade.text := Capitular(CbxCidade.text);
end;

procedure TFrmCdCliente.CarregaMapa;
begin
  FrmVerMapa := TFrmVerMapa.Create(Application);
  FrmVerMapa.WebBrowser1.Navigate('http://maps.google.com.br/maps?f=q&source=s_q&hl=pt-BR&geocode=&q=' + AdoQryConsulta.FieldByName('Endereço').AsString + ', ' + AdoQryConsulta.FieldByName('nrNumero').AsString + ', ' +
  AdoQryConsulta.FieldByName('Cidade').AsString + '-' + AdoQryConsulta.FieldByName('Estado').AsString + '&jsv=143c&sll=-23.186453,-46.884453' +
  '&sspn=0.478436,0.545883&g=&ie=UTF8&ct=clnk&cd=1');
  FrmVerMapa.Showmodal;
end;


procedure TFrmCdCliente.BtBtnMapaClick(Sender: TObject);
begin
//  inherited;
  if vInternet = true then
    CarregaMapa //  chama o form de mapas
  else
    MessageDlg('Não é possível realizar essa operação sem uma conexão com a internet.',mtError,[mbOK],0);
end;

procedure TFrmCdCliente.DBGrid1TitleClick(Column: TColumn);
begin
  inherited;
  clickou:=false;
  if not (Column.Field.DataType in [ftBlob,ftMemo])then
  begin
    Clickou:=true;
    PARAM:=Column.FieldName;
    AtualizaQryConsulta; //Chama a função para montar contratos
  end else
    ShowMessage('Não e possivel ordenar por Campos do Tipo BLOB E MEMO ,favor selecionar outra coluna com tipo diferente !');
end;

procedure TFrmCdCliente.EdtCdMatrizExit(Sender: TObject);
var qry: TAdoquery;
begin
  //verifico se existe algum cliente cadastrado com o codigo digitado para não causar problemas no envio do boleto
  if trim(EdtCdMatriz.Text) <> '' then
  begin
    qry := TADOQuery.Create(nil);
    qry.Connection := DModulo.Conexao;
    with qry do
    begin
      sql.Text := 'select cdPessoa from cliente with (nolock) where cdPessoa = :cdMatriz';
      parameters.ParamByName('cdMatriz').Value := EdtCdMatriz.Text;
      open;
      if recordCount = 0 then
      begin
        Application.MessageBox('Não existe cliente cadastrado com esse código!','Atenção', mb_ok + MB_ICONWARNING + MB_APPLMODAL);
        EdtCdMatriz.Text := '';
        EdtCdMatriz.SetFocus;
      end;
      close;
    end;
    FreeAndNil(qry);
  end;
end;

procedure TFrmCdCliente.EdtCepExit(Sender: TObject);
begin
  if EdtCep.Text <> '' then
  begin
    if Length(EdtCep.Text) <> 8 then
    begin
      ShowMessage('CEP inválido, favor preencher corretamente.');
      EdtCep.SetFocus;
    end;
  end;
end;

procedure TFrmCdCliente.BtnCriarNrCartaoClick(Sender: TObject);
begin
  inherited;
  EdtnrCartao.Text := EdtCodigo.Text +calculaDV(EdtCodigo.Text);
end;

procedure TFrmCdCliente.SpdBtnCEPClick(Sender: TObject);
var
  retorno : ArrayRetorno;
begin
  inherited;
  if BtnMdAlterar.Enabled = True then
    exit;
  if vInternet = false then
    exit;
  if (Length(EdtCep.Text) = 0) then
    Exit;
  retorno := BuscaCep(EdtCep.Text);
  if retorno[3] = '' then
  begin
    EdtCep.SetFocus;
    MessageDlg('CEP não encontrado.',mtInformation,[mbOK],0);
  end else
  begin
    CbxEstado.ItemIndex := CbxEstado.Items.IndexOf(retorno[1]);
    CbxEstadoChange(Self);
    CbxCidade.ItemIndex := CbxCidade.Items.IndexOf(StringReplace(retorno[2],'+',' ',[rfReplaceAll]));
    CbxCidadeChange(Self);
    EdtBairro.Text := StringReplace(retorno[3],'+',' ',[rfReplaceAll]);
    EdtEndereco.Text := StringReplace(retorno[4],'+',' ',[rfReplaceAll]);
    if CbxCidade.ItemIndex <> -1 then
    begin
      AdoQryMunicipio.Open;
      AdoQryMunicipio.Locate('dsMunicipio',CbxCidade.Text,[]);
      EdtCdMunicipio.Text := AdoQryMunicipio.FieldByName('cdMunicipio').AsString;
      //AdoQryMunicipio.Close;
    end else
    begin
      EdtCdMunicipio.Clear;
      CbxCidade.Text := '';
    end;
  end;
end;

procedure TFrmCdCliente.edtComissaoExit(Sender: TObject);
begin
  inherited;
  if edtComissao.Text = '' then edtComissao.Text := '0,00';
  edtComissao.Text := FormatFloat('0.00',StrToFloat(edtComissao.Text));
end;

procedure TFrmCdCliente.Button1Click(Sender: TObject);
var vNChamado,i   : Integer;
    vDiasData     : TDateTime;
    vVisitas      : Real;
    dia, mes, ano : Word;
    vAuxiData     : String;

    function Verifica_Se_Existe_Chamado(cdPessoa: String): Boolean;
    var AdoQry : TADOQuery;
    begin
      AdoQry := TadoQuery.create(nil);
      AdoQry.connection := Dmodulo.conexao;
      With AdoQry do
      begin
        Sql.Text := 'Select C.dtData as Data,C.hrmarcada as Hora_Marcada,P.nmPessoa   '+
                    'From Chamado C with (nolock), Funcionario F with (nolock), Pessoa P with (nolock) '+
                    'Where C.cdPessoa_1 = F.cdPessoa and C.cdPessoa = P.cdPessoa and  '+
                    'C.dsStatus = ''A'' and C.cdPessoa = :cdPessoa and dsTipo = ''P'' ';
        Parameters.ParamByName('cdPessoa').Value := cdPessoa;
        Open;
        Result := AdoQry.RecordCount > 0;
//          Application.OnMessage := FormPrincipal.NaoProcessaMsg;
//          ShowMessage('Já existe chamados abertos para esse cliente! '#13 +' '#13 +
//                      'Entre no menu Movimentação -> Chamados Técnicos para agendar as suas visitas!');
//          Application.OnMessage := FormPrincipal.ProcessaMsg;

        Close;
      end;
    end;
    procedure AbreChamado(cdTipo, cdPessoa, nomePessoa: string);
    var
      i: Integer;
      dataDoChamado: TDateTime;
      datasFixas: boolean; // indica se as datas para abertura do chamado serão sempre 01/03, 01/06, 01/09 e 01/12
    begin

      // parametros para a query de inclusão de novo registro
      With ADOQrySalvar do
      begin
        datasFixas:= (StrToIntDef(cdTipo, -1) in [2,3]);
        if datasFixas then
        begin
          dataDoChamado:= EncodeDate(YearOf(Now), 3, 1);
          while (dataDoChamado <= Date) do
            dataDoChamado:= IncMonth(dataDoChamado, 3);
        end else
        begin

          // Vou calcular qual a periodicidade das visitas, Ex.: Se for 2 visitas em 1 ano, será 1 visita a cada 6 meses
          vDiasData := EdtDataSaida.Date - EdtDataChegada.Date;
          vVisitas  := vDiasData / StrToint(EdtVisitas.Text);
          // vVisitas  := vVisitas / 30;
          vVisitas  := trunc(vVisitas);
        end;

        {usada para calcular o proximo codigo da tabela pessoa}
        vAuxiData := DateToStr(EdtDataChegada.Date);
        for i := 1 to StrToInt(EdtVisitas.text) do
        begin
          if (not datasFixas) then
          begin

            // Incrementa as datas
            vDiasData := IncDay(StrToDate(vAuxiData),StrToInt(FloatToStr(vVisitas)));
            DecodeDate( vDiasData, ano, mes, dia);
            vDiasData := StrToDate('01/' + IntToStr(mes) + '/' + IntToStr(ano));
            vAuxiData := DateToStr(vDiasData);

            // Se a data for maior que a data final então considera-se a data final como a última visita
            if vDiasData > EdtDataSaida.date then
              vDiasData := EdtDataSaida.date;
          end;
          ADOQrySalvar.Sql.Text := 'Select Max(cdChamado) as Utcodigo From Chamado';
          Open;
          vNChamado := ADOQrySalvar.FieldByName('UtCodigo').AsInteger + 1;
          Application.ProcessMessages;
          ADOQrySalvar.Close;
          Sql.Text := 'Insert Into Chamado (cdChamado,dsStatus,dsTipo,dtData,               '+
                      'dsCausa,cdPessoa,cdPessoa_1,hrmarcada,dsContato) Values (:cdChamado, ';
          Sql.Add('''A'',''P'',:dtData,:dsCausa,:cdPessoa,:cdPessoa_1,:hrmarcada,:dsContato)');
          Parameters.ParamByName('cdChamado').Value  := vNChamado;
          if datasFixas then
          begin
            Parameters.ParamByName('dtData').Value:= DateOf(dataDoChamado);
            dataDoChamado:= IncMonth(dataDoChamado, 3);
          end
          else
            Parameters.ParamByName('dtData').Value     := Dateof(vDiasData);
          //showMessage(DateToStr(vDiasData));
          Parameters.ParamByName('dsCausa').Value    := 'Visita preventiva';
          Parameters.ParamByName('cdPessoa').Value   := cdPessoa;
          Parameters.ParamByName('cdPessoa_1').Value := CbCodigoTec.Text;
          Parameters.ParamByName('hrmarcada').Value  := '8:00:00';
          Parameters.ParamByName('dsContato').Value  := Copy(nomePessoa,1,20);
          ExecSql;
        end;
      end;
    end;
    procedure Abro_chamado_para_todos_clientes_exceto_o_atual_do_mesmo_tipo(cdTipo, nmTipo, cdPessoa: string);
    var qry: TAdoQuery;
    begin
      qry := TAdoQuery.create(nil);
      qry.connection := Dmodulo.conexao;
      qry.sql.text := 'Select distinct C.CdCodigo,T.nmTipo,C.cdPessoa,P.nmPessoa    '+
                      'From cliente C with (nolock) inner join                      '+
                      'tpCliente T with (nolock) on C.cdCodigo = T.cdCodigo         '+
                      'Inner join Pessoa P with (nolock) on P.cdPessoa = C.cdPessoa '+
                      'Where C.cdCodigo = :cdCodigo and C.cdPessoa <> :cdPessoa     ';
      qry.parameters.paramByName('cdCodigo').value := cdTipo;
      qry.parameters.paramByName('cdPessoa').value := cdPessoa;
      qry.open;
      if qry.recordCount > 0 then
      begin
        if Application.MessageBox(PChar('Atenção! Existem '+inttostr(qry.recordCount)+' clientes do tipo '+ nmTipo +'!'+#13#10 +
                               'Deseja cadastrar esse mesmo contrato para todos esses clientes?'), 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_APPLMODAL) = id_yes then begin

          qry.First;
          while not qry.Eof do
          begin
            if Verifica_Se_Existe_Chamado(qry.fieldByName('cdPessoa').asString) then
            begin
              if Application.MessageBox(PChar('Já existe chamados abertos para o cliente '+qry.fieldByName('nmPessoa').AsString+'! '#13#10 +
                                            'Deseja cadastrar mesmo assim?'),'Atenção',MB_YESNO + MB_ICONQUESTION + MB_APPLMODAL) = id_yes then
                AbreChamado(qry.fieldByName('cdCodigo').asString, qry.fieldByName('cdPessoa').asString, qry.fieldByName('nmPessoa').AsString);
            end else
              AbreChamado(qry.fieldByName('cdCodigo').asString, qry.fieldByName('cdPessoa').asString, qry.fieldByName('nmPessoa').AsString);
            qry.Next;
          end;
        end;
        qry.Close;
      end;
      FreeAndNil(qry);
    end;
begin
  inherited;
  if Status <> [Padrao] then
  begin
    Application.MessageBox('Antes de abrir um chamado técnico, conclua as alterações na aba dados e clique em salvar!', 'Atenção', MB_OK + MB_ICONWARNING + MB_APPLMODAL);
    exit;
  end;
  if CBStatus.ItemIndex <> 1 then
  begin
    Application.MessageBox('Para abrir um chamado,o status tem que ser "Aberto"!', 'Atenção', MB_OK + MB_ICONWARNING + MB_APPLMODAL);
    CBStatus.SetFocus;
    exit;
  end;
  if StrToInt(EdtVisitas.Text) = 0 then
  begin
    Application.MessageBox('Digite um número maior que zero no campo visitas!', 'Atenção', MB_OK + MB_ICONWARNING + MB_APPLMODAL);
    EdtVisitas.SetFocus;
    exit;
  end;
  //if (Status = [Padrao]) and (CBStatus.ItemIndex = 1) and (StrToInt(EdtVisitas.Text) > 0) then begin
    // testa se já existe um chamado
 //'Entre no menu Movimentação -> Chamados Técnicos para agendar as suas visitas!'



  Try
    Dmodulo.Conexao.BeginTrans;
    if Verifica_Se_Existe_Chamado(EdtCodigo.Text) then
    begin
      if Application.MessageBox(PChar('Já existe chamados abertos para o cliente '+EdtNome.text+'! '#13#10 +
                                    'Deseja cadastrar mesmo assim?'),'Atenção',MB_YESNO + MB_ICONQUESTION + MB_APPLMODAL) = id_yes then
        AbreChamado(EdtcdtpCli.text, EdtCodigo.Text, EdtNome.text)
    end else
      AbreChamado(EdtcdtpCli.text, EdtCodigo.Text, EdtNome.text);
    //abro o chamado para todos os clientes do mesmo tipo
    Abro_chamado_para_todos_clientes_exceto_o_atual_do_mesmo_tipo(EdtcdtpCli.text,CbBtpCli.text,EdtCodigo.text);
    Dmodulo.Conexao.CommitTrans;
    MessageDlg('Chamados abertos com sucesso!', mtConfirmation, [mbOk], 0);
    DesativaCampos;
    TrataBotoesPadrao(Sender,Padrao);
    Status := [Padrao];
    AtualizaQryConsulta;
  except
    on E: Exception do
    begin
      Application.messageBox(PChar('Erro ao abrir o(s) chamado(s) técnico(s). Motivo: '+E.message), 'Erro', MB_OK + MB_ICONERROR + MB_APPLMODAL);
      BtnMdCancelarClick(Sender);
      DMOdulo.Conexao.RollbackTrans;
      Salvar_erro(vData_Banco + ' | ' + FrmPrincipalPreVenda.PegaHoraBanco, cdOperador,'TFrmCdCliente.Button1Click',e.Message);
    end;
  end;
 // end else begin
 //   ShowMessage('Não pode ser aberto chamados para esse cliente!');
 // end;
end;

procedure TFrmCdCliente.CBTecnicoChange(Sender: TObject);
begin
  inherited;
  if CbTecnico.ItemIndex <> -1 then
  begin
    AdoQryTecnico.Open;
    AdoQryTecnico.Locate('Técnico',CbTecnico.text,[]);
    CbCodigoTec.Text  := AdoQryTecnico.FieldByName('Código').AsString;
  end else
    CbCodigoTec.Clear;
end;

procedure TFrmCdCliente.CbxEquipamentoChange(Sender: TObject);
begin
  inherited;
  if CbxEquipamento.ItemIndex <> -1 then
  begin
     AdoQryEquipamento.Open;
     AdoQryEquipamento.Locate('dsMOdelo',CbxEquipamento.Text,[]);
     EdtNrObjeto.Text := AdoQryEquipamento.FieldbyName('nrObjeto').AsString;
  end;
end;

procedure TFrmCdCliente.ComboBox2Change(Sender: TObject);
begin
  inherited;
  if ComboBox2.ItemIndex <> -1 then
  begin
     AdoQryEquipamento.Open;
     AdoQryEquipamento.Locate('dsMOdelo',ComboBox2.Text,[]);
     Edit1.Text := AdoQryEquipamento.FieldbyName('nrObjeto').AsString;
  end;
end;

procedure TFrmCdCliente.TbSheetRelatorioEnter(Sender: TObject);
begin
  inherited;
  BtnMdImprimir.Enabled := True;
end;

procedure TFrmCdCliente.EdtConsultaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  //
end;

procedure TFrmCdCliente.ADOQryConsultaAfterScroll(DataSet: TDataSet);
begin
  inherited;
  {if Status = [novo] then begin
    if FrmInf_Cliente <> nil then
      FrmInf_Cliente.close;
    Exit;
  end;
  if FrmCdCliente = nil then exit;
  if Linha = -9 then exit;
  if (ADOQryConsulta.RecordCount = 0) then begin
    Exit;
  end;
  if FrmInf_Cliente = nil then FrmInf_Cliente := TFrmInf_Cliente.Create(Application);
  FrmInf_Cliente.Carrega_Dados;
  SetWindowPos(FrmInf_Cliente.Handle, HWND_TOP, 0, 0, 0, 0,SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE or SWP_SHOWWINDOW);
  FrmInf_Cliente.Visible := True; }
end;

procedure TFrmCdCliente.MontaComboVendedor;
begin
//  CbxVendedor.Clear;
  With AdoQryFuncionario do  // Monta a combo do vendedor e cobrador
  begin
    Sql.Text := 'Select P.nmPessoa,P.cdPessoa From Pessoa P WITH (NOLOCK),Funcionario F WITH (NOLOCK),Cargo C WITH (NOLOCK) '+
                'Where P.cdPessoa = F.cdPessoa and F.cdCargo = C.cdCargo and (C.nmCargo = ''Vendedor'' or C.nmCargo = ''ATENDENTE'') '+
                'and P.ser = ''U'' ';
    if ((status = [novo]) or (status = [alterar])) then //monto a combo só com os vendedores ativos
      SQL.Add(' and P.dsAtivo = ''S'' ');
    sql.Add(' Order By nmPessoa ');
    MontaComboListBoolAdo(AdoQryFuncionario,CbxVendedor);
  end;
end;

procedure TFrmCdCliente.TornarObrigatorioRazaoSocial(Obrigatorio:Boolean);
begin
  if Obrigatorio then
    EdtRazao.ImeMode:= imOpen
  else
    EdtRazao.ImeMode:= imDontCare;
end;

end.

