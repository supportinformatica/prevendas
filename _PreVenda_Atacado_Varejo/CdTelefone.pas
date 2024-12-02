unit CdTelefone;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FrmCadEstados, Db,ExtCtrls, StdCtrls, Grids, DBGrids,
  ComCtrls, Buttons, ImgList, ADODB, Menus, System.ImageList;

type
  TFrmCdTelefone = class(TFrmMdCadastro)
    EdtCdPessoa: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    EdtCodigo: TEdit;
    EdtNome: TEdit;
    EdtRamal: TEdit;
    EdtTelefone: TEdit;
    Label5: TLabel;
    EdtTipo: TEdit;
    chkRedeSocial: TCheckBox;
    Label6: TLabel;
    EdtNrDDD: TEdit;
    procedure FormActivate(Sender: TObject);
    procedure PgCtrolMdCadastroChange(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BtnMdProximoClick(Sender: TObject);
    procedure BtnMdAnteriorClick(Sender: TObject);
    procedure BtnMdAlterarClick(Sender: TObject);
    procedure BtnMdCancelarClick(Sender: TObject);
    procedure BtnMdNovoClick(Sender: TObject);
    procedure BtnMdExcluirClick(Sender: TObject);
    procedure BtnMdSalvarClick(Sender: TObject);
    procedure EdtNrDDDKeyPress(Sender: TObject; var Key: Char);
    procedure EdtRamalKeyPress(Sender: TObject; var Key: Char);
    procedure EdtTelefoneKeyPress(Sender: TObject; var Key: Char);
  private
    Procedure AtualizaQryConsulta;
    Procedure AtualizaCampos;
    Procedure AtivaCampos;
    Procedure DesativaCampos;
  public
    Function FormQueChamamouC(Texto1:String) : String;
    Function FormQueChamamouN(Texto2:String) : String;
  end;

var
  FrmCdTelefone: TFrmCdTelefone;
  UltimoCodigo:String[10];
  Codigo:String[8];
  Nome:String[40];

implementation

uses   MoPreVenda, DataModulo, uFuncoesPadrao;

{$R *.DFM}

Function TFrmCdTelefone.FormQueChamamouC(Texto1:String) : String;
begin
  Codigo := Texto1;
end;

Function TFrmCdTelefone.FormQueChamamouN(Texto2:String) : String;
begin
  Nome := Texto2;
end;

Procedure TfrmCdTelefone.AtualizaQryConsulta;
begin
  EdtCdPessoa.Text := Codigo;
  EdtConsulta.Text := Nome;
  EdtCodigo.Text := Codigo;
  EdtNome.Text := Nome;
  With AdoQryConsulta do
  begin
    Sql.Text :=
    'Select nrDDD DDD, nmTelefone Número, dsRamal Ramal,'+
    'dsTelefone Tipo, cdPessoa, cdTelefone, redeSocial  '+
    'From Telefone with (nolock) ';
    Sql.Add('Where cdPessoa = '+ EdtCodigo.Text+' Order By nmTelefone');
    Open;
    FieldByName('cdPessoa').Visible := False;
    FieldByName('cdTelefone').Visible := False;
    FieldByName('redeSocial').Visible := False;
  end;
end;

Procedure TfrmCdTelefone.AtualizaCampos;
begin
  EdtCodigo.Text := Codigo;
  EdtNome.Text := Nome;
  EdtTelefone.Text := AdoQryConsulta.FieldByName('Número').AsString;
  EdtRamal.Text := AdoQryConsulta.FieldByName('Ramal').AsString;
  EdtTipo.Text := AdoQryConsulta.FieldByName('Tipo').AsString;
  EdtNRDDD.Text := AdoQryConsulta.FieldByName('DDD').AsString;
  chkRedeSocial.Checked := AdoQryConsulta.FieldByName('redeSocial').AsBoolean;
  EdtCodigo.ReadOnly := True;
  EdtNome.ReadOnly := True;
end;

Procedure TFrmCdTelefone.AtivaCampos;
begin
  EdtRamal.ReadOnly := False;
  EdtTelefone.ReadOnly := False;
  EdtTipo.ReadOnly := False;
  EdtNRDDD.ReadOnly := False;
  chkRedeSocial.Enabled := True;
end;

Procedure TFrmCdTelefone.DesativaCampos;
begin
  EdtRamal.ReadOnly := True;
  EdtTelefone.ReadOnly := True;
  EdtTipo.ReadOnly := True;
  EdtNRDDD.ReadOnly := True;
  chkRedeSocial.Enabled := False;
end;

procedure TFrmCdTelefone.EdtNrDDDKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  ValidarNumero(Key);
end;

procedure TFrmCdTelefone.EdtRamalKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  ValidarNumero(Key);
end;

procedure TFrmCdTelefone.EdtTelefoneKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  ValidarNumeroETraco(Key);
end;

procedure TFrmCdTelefone.FormActivate(Sender: TObject);
begin
  inherited;
  AtualizaQryConsulta;
  BtnMdNovo.Enabled := False;
  BtnMdSalvar.Enabled := False;
  BtnMdExcluir.Enabled := False;
  BtnMdCancelar.Enabled := False;
  BtnMdAlterar.Enabled := False;
  TBSheetMdCdRelatorio.TabVisible := False;
  TBSheetMdCadastroConsulta.PageControl.ActivePage := TBSheetMdCadastroConsulta;
end;

procedure TFrmCdTelefone.PgCtrolMdCadastroChange(Sender: TObject);
begin
  inherited;
  if PgCtrolMdCadastro.ActivePage = TbSheetMdCadastroConsulta then
  begin
    AtualizaQryConsulta;
    BtnMdNovo.Enabled := False;
    BtnMdSalvar.Enabled := False;
    BtnMdAlterar.Enabled := False;
    BtnMdExcluir.Enabled := False;
    BtnMdCancelar.Enabled := False;
  end else
    if PgCtrolMdCadastro.ActivePage = TbSheetMdCadastroDados then
    begin
      AtualizaCampos;
      DesativaCampos;
      TrataBotoesPadrao(Sender,Padrao);
      Status:=[Padrao];
    end;
end;

procedure TFrmCdTelefone.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  AtualizaCampos;
  PgCtrolMdCadastro.ActivePage := TbSheetMdCadastroDados;
  DesativaCampos;
  TrataBotoesPadrao(Sender,Padrao);
  Status := [Padrao];
end;

procedure TFrmCdTelefone.BtnMdProximoClick(Sender: TObject);
begin
  inherited;
  AtualizaCampos;
end;

procedure TFrmCdTelefone.BtnMdAnteriorClick(Sender: TObject);
begin
  inherited;
  AtualizaCampos;
end;

procedure TFrmCdTelefone.BtnMdAlterarClick(Sender: TObject);
begin
  inherited;
  AtivaCampos;
end;

procedure TFrmCdTelefone.BtnMdCancelarClick(Sender: TObject);
begin
  inherited;
  DesativaCampos;
  AtualizaCampos;
end;

procedure TFrmCdTelefone.BtnMdNovoClick(Sender: TObject);
begin
  inherited;
  EdtRamal.Text    := '';
  EdtTelefone.Text := '';
  EdtTipo.Text     := '';
  AtivaCampos;
  EdtTelefone.SetFocus;
  AdoQryUltimoCodigo.Open;  {usada para calcular o proximo codigo da tabela Telefone}
  UltimoCodigo := IntToStr(AdoQryUltimoCodigo.FieldByName('UtCodigo').AsInteger + 1);
  AdoQryUltimoCodigo.Close;
end;

procedure TFrmCdTelefone.BtnMdExcluirClick(Sender: TObject);
begin
  inherited;
  If MessageDlg('Confirma a exclusão deste telefone?',mtConfirmation,
    [mbYes , mbNo], 0) = mrYes then
  begin
    With AdoQryExcluir do
    begin
      try
        DModulo.Conexao.BeginTrans;
        Sql.Text := 'Delete From Telefone Where nmTelefone = :TEL and cdPessoa = :CDPESSOA ';
        Parameters.parambyname('TEL').Value :=  EdtTelefone.Text;
        Parameters.parambyname('CDPESSOA').Value :=  EdtCodigo.Text;
        ExecSql;
        DModulo.Conexao.CommitTrans;
        Messagedlg('Telefone excluído com sucesso!',mtinformation,[mbOk],0);
      except
        DModulo.Conexao.RollbackTrans;
        Messagedlg('Você não pode excluir este telefone!',mtinformation,[mbOk],0);
      end;
    end;
  end;
  AdoQryConsulta.Next;
  AtualizaQryConsulta;
  AtualizaCampos;
end;

procedure TFrmCdTelefone.BtnMdSalvarClick(Sender: TObject);
var
  CodTelefone : String[10];
begin
  inherited;
  if not CamposObrigatoriosPreenchidos(TbSheetMdCadastroDados) then
    Exit;
  if Status = [Novo] then
  begin
    with AdoQrySalvar do
    begin
      try
        DModulo.Conexao.BeginTrans;
        Sql.Text := 'Select Max(cdTelefone) + 1 as UtCodigo from Telefone';
        Open;
        UltimoCodigo := IntToStr(AdoQrySalvar.FieldByName('UtCodigo').AsInteger);
        Sql.Text :=
        'Insert Into Telefone (nmTelefone,dsRamal,dsTelefone,cdPessoa,CdTelefone,nrDDD, redeSocial) '+
        'Values (:NMTELEFONE,:DSRAMAL,:DSTELEFONE,:CDPESSOA,:CDTELEFONE,:nrDDD, :redeSocial)        ';
        parameters.parambyname('NMTELEFONE').value := EdtTelefone.Text;
        parameters.parambyname('DSRAMAL').value := EdtRamal.Text;
        parameters.parambyname('DSTELEFONE').value := EdtTipo.Text;
        parameters.parambyname('CDPESSOA').value := EdtCodigo.Text;
        parameters.parambyname('CDTELEFONE').value := UltimoCodigo;
        parameters.parambyname('nrDDD').value := EdtNrDDD.Text;
        parameters.parambyname('redeSocial').value := chkRedeSocial.Checked;
        ExecSql;
        DModulo.Conexao.CommitTrans;
        Messagedlg('Inclusão ok.', mtinformation, [mbOk], 0);
      except
        on E: Exception do
        begin
          DModulo.Conexao.RollbackTrans;
          Salvar_erro(vData_Banco + ' | ' + FrmPrincipalPreVenda.pegaHoraBanco, 'PREVENDA', 'TFrmCdTelefone.BtnMdSalvarClick', e.Message);
          Messagedlg('Não foi possivel salvar os dados.', mterror, [mbOk], 0);
          BtnMdCancelarClick(Sender);
        end;
      end;
    end;
  end else
  begin
    CodTelefone := AdoQryConsulta.FieldByName('cdTelefone').AsString;
    With AdoQryAlterar do
    begin
      try
        DModulo.Conexao.BeginTrans;
        Sql.Text :=
        'Update Telefone Set nmTelefone = :TEL,dsRamal = :RAMAL,       '+
        'dsTelefone = :DSTEL, nrDDD = :nrDDD, redesocial = :redeSocial '+
        'Where cdTelefone = :CODIGO';
        Parameters.parambyname('TEL').VAlue := EdtTelefone.Text;
        Parameters.parambyname('RAMAL').VAlue := EdtRamal.Text;
        Parameters.parambyname('DSTEL').VAlue := EdtTipo.Text;
        Parameters.parambyname('CODIGO').VAlue := CodTelefone;
        parameters.parambyname('nrDDD').value := EdtNrDDD.Text;
        parameters.parambyname('redeSocial').value := chkRedeSocial.Checked;
        ExecSql;
        DModulo.Conexao.CommitTrans;
        Messagedlg('Alteração ok.', mtinformation, [mbOk], 0);
      Except
        DModulo.Conexao.RollbackTrans;
        Messagedlg('Não foi possivel alterar os dados.', mterror, [mbOk], 0);
      end;
    end;
  end;
  TrataBotoesPadrao(Sender,Padrao);
  Status := [Padrao];
end;

end.
