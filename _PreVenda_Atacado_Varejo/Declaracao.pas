unit Declaracao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DB, ADODB, Buttons, ExtCtrls, ComCtrls;

type
  TfrmDeclaracao = class(TForm)
    LblEmpresa: TLabel;
    LblEndereco: TLabel;
    Shape3: TShape;
    LblDiscriminada: TLabel;
    LblRecebi: TLabel;
    LblAracaju: TLabel;
    BtnMdImprimir: TBitBtn;
    BtnMdSair: TBitBtn;
    ADOQryPessoa: TADOQuery;
    LbTelefone: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    EdtSerie: TEdit;
    EdtNota: TEdit;
    Data1: TMaskEdit;
    Label5: TLabel;
    Label6: TLabel;
    EdtCupom: TEdit;
    Label7: TLabel;
    Data2: TMaskEdit;
    Label8: TLabel;
    Label9: TLabel;
    RbTroca: TRadioButton;
    RbGarantia: TRadioButton;
    rbDevParcial: TRadioButton;
    rbDevTotal: TRadioButton;
    Label10: TLabel;
    EdtDia: TEdit;
    Label11: TLabel;
    EdtMes: TEdit;
    Label12: TLabel;
    EdtAno: TEdit;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    cbCliente: TComboBox;
    EdtEndereco: TEdit;
    EdtBairro: TEdit;
    EdtCidade: TEdit;
    EdtFone: TEdit;
    EdtCnpj: TEdit;
    Label19: TLabel;
    Label1: TLabel;
    EdtCEP: TEdit;
    EdtRG: TEdit;
    ADOQryConfig: TADOQuery;
    ADOQrycliente: TADOQuery;
    ADOQryclientenmPessoa: TStringField;
    ADOQryclientecdPessoa: TIntegerField;
    ADOQryclientenmLogradouro: TStringField;
    ADOQryclientedsBairro: TStringField;
    ADOQryclientedsCidade: TStringField;
    ADOQryclientedsUf: TStringField;
    ADOQryclientedsCEP: TStringField;
    ADOQryclienteExistir: TStringField;
    ADOQryclientenmTelefone: TStringField;
    Bevel1: TBevel;
    Editor: TRichEdit;
    EdtECF: TComboBox;
    procedure BtnMdSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbClienteChange(Sender: TObject);
    procedure BtnMdImprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EdtCupomKeyPress(Sender: TObject; var Key: Char);
    procedure EdtNotaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    function MesExtenso( Mes:Word ) : string;
  public
    { Public declarations }
  end;

var
  frmDeclaracao: TfrmDeclaracao;

implementation

uses uFuncoesPadrao, DataModulo, relDeclaracao, MoPreVenda;

{$R *.dfm}

procedure TfrmDeclaracao.BtnMdSairClick(Sender: TObject);
begin
  close;
end;

function TfrmDeclaracao.MesExtenso( Mes:Word ) : string;
const meses : array[0..11] of PChar = ('Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro','Outubro', 'Novembro', 'Dezembro');
begin
  result := meses[mes-1];
End;

procedure TfrmDeclaracao.FormCreate(Sender: TObject);
var
  Data: TDateTime;
  Ano, Mes, Dia: Word;
begin
  with ADOQryConfig do begin
    Open;
    LblEmpresa.Caption  := FieldByName('nmEmpresa').AsString;
    LblEndereco.Caption := FieldByName('dsEndereco').AsString;
    LblAracaju.Caption  := FieldByName('dsCidade').AsString ;
    LbTelefone.Caption  := 'Tel.:'+FieldByName('dsTelefone').AsString + ' Fax:'+FieldByName('dsFax').AsString ;
  end;
  with ADOQrycliente do begin
    sql.Text := 'select P.cdPessoa,P.nmPessoa,E.nmLogradouro,E.dsBairro,E.dsCidade,'+
                'E.dsUf,E.dsCEP,P.Existir,T.nmTelefone from Pessoa P WITH (NOLOCK) '+
                'inner Join Endereco E WITH (NOLOCK)                               '+
                'on P.cdPessoa = E.cdPessoa Inner Join Telefone T WITH (NOLOCK)    '+
                'on T.cdPessoa = P.cdPessoa  where ser = ''C''                     '+ // and P.dsAtivo = ''S''
                'order by P.nmPessoa                                               ';
    MontaComboListBoolADO(adoqryCliente,cbCliente);
    sql.Text := 'select P.cdPessoa,P.nmPessoa,E.nmLogradouro,E.dsBairro,E.dsCidade,'+
                'E.dsUf,E.dsCEP,P.Existir,T.nmTelefone from Pessoa P WITH (NOLOCK) '+
                'inner Join Endereco E WITH (NOLOCK)                               '+
                'on P.cdPessoa = E.cdPessoa Inner Join Telefone T WITH (NOLOCK)    '+
                'on T.cdPessoa = P.cdPessoa  where ser = ''C''                     '+  // and P.dsAtivo = ''S''
                'order by P.nmPessoa                                               ';
    open;
  end;
  Data:= Now;
  DecodeDate(Data, Ano, Mes, Dia);
  EdtDia.text := IntToStr(Dia);
  EdtMes.text := MesExtenso(Mes);
  EdtAno.text := IntToStr(Ano);
end;

procedure TfrmDeclaracao.cbClienteChange(Sender: TObject);
begin
  ADOQrycliente.Open;
  if ADOQrycliente.Locate('nmPessoa',cbCliente.Text,[]) then
  begin
    EdtEndereco.Text :=  ADOQrycliente.FieldbyName('nmLogradouro').asstring;
    EdtBairro.text   :=  ADOQrycliente.FieldbyName('dsBairro').asstring;
    EdtCidade.text   :=  ADOQrycliente.FieldbyName('dsCidade').asstring+'-'+ADOQrycliente.FieldbyName('dsUF').asstring;
    EdtFone.text     :=  ADOQrycliente.FieldbyName('nmTelefone').asstring;
    EdtCEP.text      :=  ADOQrycliente.FieldbyName('dsCEP').asstring;
    with ADOQryPessoa do
    begin
      if ADOQrycliente.FieldbyName('Existir').asstring = 'F' then
      begin
        sql.Text := 'Select dsCPF as Inscricao,dsIdentidade from P_Fisica WITH (NOLOCK) where cdPessoa =:CD ';
        Parameters.ParamByName('CD').Value := inttoStr(ADOQrycliente.FieldbyName('cdPessoa').AsInteger);
      end;
      if ADOQrycliente.FieldbyName('Existir').asstring = 'J' then
      begin
        sql.Text := 'Select CGC as Inscricao from P_Juridica WITH (NOLOCK) where cdPessoa =:CD ';
        Parameters.ParamByName('CD').Value := inttoStr(ADOQrycliente.FieldbyName('cdPessoa').AsInteger);
      end;
      open;
    end;
    EdtCnpj.Text := ADOQryPessoa.fieldByName('Inscricao').AsString;
    if ADOQrycliente.FieldbyName('Existir').asstring = 'F' then
       EdtRG.Text := ADOQryPessoa.fieldByName('dsIdentidade').AsString;
  end
  else
  begin
    EdtEndereco.Clear;
    EdtBairro.Clear;
    EdtCidade.Clear;
    EdtFone.Clear;
    EdtCEP.Clear;
    EdtCnpj.Clear;
    EdtRG.Clear;
  end;
end;

procedure TfrmDeclaracao.BtnMdImprimirClick(Sender: TObject);
var
  strTroca, strDevolucaoP, strDevolucaoT, strGarantia, linhaCheck1, linhaCheck2, vPath : AnsiString;
  Arq : TextFile;
begin
  if (Trim(EdtNota.Text) = '') and (Trim(EdtCupom.Text) = '')  then begin
      showmessage('Obrigatório preencher o campo numero da nota ou número do cupom fiscal!');
      EdtNota.SetFocus;
      Exit;
  end;
  if (Trim(EdtDia.Text) = '') or (Trim(EdtMes.Text) = '') or (Trim(EdtAno.Text) = '') then begin
      showmessage('Data Invalida!');
      EdtDia.SetFocus;
      Exit;
  end;
  if (Trim(cbCliente.Text) = '')  then begin
      showmessage('Selecione o cliente!');
      cbCliente.SetFocus;
      Exit;
  end;
  If (RbTroca.Checked = False) and (RbGarantia.Checked = False) and (rbDevParcial.Checked = False) and (rbDevTotal.Checked = False) then begin
      showmessage('Selecione o tipo da devolução!');
      Exit;
  end;
  if (FrmPrincipalPreVenda.vImpressao_40 <> 'S') then begin
    frmRelDeclaracao := TfrmRelDeclaracao.Create(self);
    frmRelDeclaracao.ADOQryConfig.Open;
    frmRelDeclaracao.RlSerie.Caption := EdtSerie.Text;
    frmRelDeclaracao.RLNota.Caption := EdtNota.Text;
    frmRelDeclaracao.RlCupom.Caption := EdtCupom.Text;
    frmRelDeclaracao.RLECF.Caption := EdtECF.Text;
    frmRelDeclaracao.Rldia.Caption := EdtDia.Text;
    frmRelDeclaracao.RlMes.Caption := EdtMes.Text;
    frmRelDeclaracao.RlAno.Caption := EdtAno.Text;
    frmRelDeclaracao.RLEndereco.Caption := EdtEndereco.Text;
    frmRelDeclaracao.RlBairro.Caption := EdtBairro.Text;
    frmRelDeclaracao.RlCidade.Caption := EdtCidade.Text;
    frmRelDeclaracao.RlFone.Caption := EdtFone.Text;
    frmRelDeclaracao.RLCEP.Caption := EdtCEP.Text;
    frmRelDeclaracao.RlRG.Caption := EdtRG.Text;
    frmRelDeclaracao.RLCNPJ.Caption := EdtCnpj.Text;
    frmRelDeclaracao.RlData2.Caption := Data2.Text;
    frmRelDeclaracao.RlData1.Caption := Data1.Text;
    frmRelDeclaracao.RLNome.Caption := cbCliente.Text;
    If rbTroca.Checked = true then
      frmRelDeclaracao.RLLabel22.Visible := true;
    If RbGarantia.Checked = true then
      frmRelDeclaracao.RLLabel23.Visible := true;
    If rbDevParcial.Checked = true then
      frmRelDeclaracao.RLLabel24.Visible := true;
    If rbDevTotal.Checked = true then
      frmRelDeclaracao.RLLabel25.Visible := true;
    frmRelDeclaracao.RLReport1.Preview;
  end else begin
    If rbTroca.Checked = true then
       strTroca := '(x) Troca'
    else
       strTroca := '( ) Troca';
    If RbGarantia.Checked = true then
       strGarantia := '  (x) Garantia'
    else
       strGarantia := '  ( ) Garantia';
    If rbDevParcial.Checked = true then
       strDevolucaoP := ' (x) Devolucao Par-'
    else
       strDevolucaoP := ' ( ) Devolucao Par-';
    If rbDevTotal.Checked = true then
       strDevolucaoT := 'cial  (x) Devolucao Total'
    else
       strDevolucaoT := 'cial  ( ) Devolucao Total';
    linhaCheck1 := strTroca + strGarantia + strDevolucaoP;
    linhaCheck2 := strDevolucaoT;
    Editor.Clear;
    Editor.Lines.Add('               DECLARACAO                 ');
    Editor.Lines.Add('Declaro para os devidos fins, a quem inte-');
    Editor.Lines.Add('ressar  possa,  que  estou devolvendo a(s)');
    Editor.Lines.Add('mercadoria(s)  constante(s) na nota fiscal');
    Editor.Lines.Add('de venda serie '+EdtSerie.Text+' n  '+EdtNota.Text+' de '+Data1.Text);
    Editor.Lines.Add('ou cupom fiscal n  '+EdtCupom.Text+' de '+Data2.Text+',');
    Editor.Lines.Add('do  ECF  n  '+EdtECF.Text+', tendo em');
    Editor.Lines.Add('vista que:');
    Editor.Lines.Add(' ');
    Editor.Lines.Add(linhaCheck1);
    Editor.Lines.Add(linhaCheck2);
    Editor.Lines.Add(' ');
    Editor.Lines.Add(FrmPrincipalPreVenda.vcidade +' '+edtDia.Text+' de '+edtMes.Text+' de '+edtAno.Text);
    Editor.Lines.Add(' ');
    Editor.Lines.Add('NOME: '+cbCliente.Text);
    Editor.Lines.Add('END: '+EdtEndereco.Text);
    Editor.Lines.Add('BAIRRO: '+EdtBairro.Text);
    Editor.Lines.Add('CIDADE: '+EdtCidade.Text);
    Editor.Lines.Add('FONE: '+EdtFone.Text);
    Editor.Lines.Add('CPF/CNPJ '+EdtCnpj.Text+' RG '+EdtRG.Text);
    Editor.Lines.Add('ASSINATURA:_______________________________');
    Editor.Lines.Add('Declaracao   emitida   em  cumprimento  ao');
    Editor.Lines.Add('Art. 62  seção VII  subsecao I do RICMS-SE');
    Editor.Lines.Add(' ');
    Editor.Lines.Add(' ');
    Editor.Lines.Add(' ');
    Editor.Lines.Add(' ');
    Editor.Lines.Add(' ');
    Editor.Lines.Add(' ');
    Editor.Lines.Add(' ');
    Editor.Lines.Add(' ');
    Editor.Lines.Add('.');
    try
      AssignFile(Arq,'Texto.txt');
      Rewrite(Arq);
      Writeln(Arq,Editor.Text);
    Finally
      CloseFile(Arq);
    end; // try
    vPath := ExtractFilePath(Application.ExeName) + 'printDeclaracao.bat';
    WinExec(PAnsiChar(vPath),sw_ShowNormal);
  end;
  FrmPrincipalPreVenda.SalvaLogEventos('Declaração de devolução',StrToDate(vData_Banco),FrmPrincipalPreVenda.PegaHoraBanco,
                                 EdtNota.text,'',0,StrToInt(FrmPrincipalPreVenda.EdtcdNome.Text),'16')
end;

procedure TfrmDeclaracao.FormShow(Sender: TObject);
begin
  EdtSerie.SetFocus;
end;

procedure TfrmDeclaracao.EdtCupomKeyPress(Sender: TObject; var Key: Char);
begin
  ValidarInteiro(Key);
end;

procedure TfrmDeclaracao.EdtNotaKeyPress(Sender: TObject; var Key: Char);
begin
  ValidarInteiro(Key);
end;

end.
