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
  private
    Procedure AtualizaQryConsulta;
    Procedure AtualizaCampos;
    Procedure AtivaCampos;
    Procedure DesativaCampos;
    { Private declarations }
  public
    Function FormQueChamamouC(Texto1:String) : String;
    // pega o codigo pessoa
    Function FormQueChamamouN(Texto2:String) : String; // pega o nome   pessoa
    { Public declarations }
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
  With AdoQryConsulta do begin
    Sql.Text := 'Select nmTelefone as Número, dsRamal as Ramal,' +
                'dsTelefone as Tipo,cdPessoa,cdTelefone From Telefone WITH (NOLOCK) ';
    Sql.Add('Where cdPessoa = '+ EdtCodigo.Text+' ');
    Sql.Add('Order By nmTelefone');
    Open;            // mostra os dados no dbgrid
    FieldByName('cdPessoa').Visible := false;
    FieldByName('cdTelefone').Visible := false;
  end;
end;

Procedure TfrmCdTelefone.AtualizaCampos;
begin
  EdtCodigo.Text := Codigo;
  EdtNome.Text := Nome;
  EdtTelefone.Text := AdoQryConsulta.FieldByName('Número').AsString;
  EdtRamal.Text := AdoQryConsulta.FieldByName('Ramal').AsString;
  EdtTipo.Text := AdoQryConsulta.FieldByName('Tipo').AsString;
  EdtCodigo.ReadOnly := True;
  EdtNome.ReadOnly := True;
end;

Procedure TFrmCdTelefone.AtivaCampos;
begin
  EdtRamal.ReadOnly := False;
  EdtTelefone.ReadOnly := False;
  EdtTipo.ReadOnly := False;
end;

Procedure TFrmCdTelefone.DesativaCampos;
begin
  EdtRamal.ReadOnly := True;
  EdtTelefone.ReadOnly := True;
  EdtTipo.ReadOnly := True;
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
  if PgCtrolMdCadastro.ActivePage = TbSheetMdCadastroConsulta then begin
    AtualizaQryConsulta;
    BtnMdNovo.Enabled := False;
    BtnMdSalvar.Enabled := False;
    BtnMdAlterar.Enabled := False;
    BtnMdExcluir.Enabled := False;
    BtnMdCancelar.Enabled := False;
  end else
    if PgCtrolMdCadastro.ActivePage = TbSheetMdCadastroDados then begin
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
    [mbYes , mbNo], 0) = mrYes then begin
    With AdoQryExcluir do begin
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
      end;  // try
    end; // with
  end;  // messagedlg
  AdoQryConsulta.Next;
  AtualizaQryConsulta;
  AtualizaCampos;
end;

procedure TFrmCdTelefone.BtnMdSalvarClick(Sender: TObject);
var
  CodTelefone : String[10];
begin
  inherited;
  if not CamposObrigatoriosPreenchidos(TbSheetMdCadastroDados) then Exit;
  if Status = [Novo] then begin
    with AdoQrySalvar do begin
      try
        DModulo.Conexao.BeginTrans;
        Sql.Text := 'Select Max(cdTelefone) + 1 as UtCodigo from Telefone';
        Open;  {usada para calcular o proximo codigo da tabela Telefone}
        UltimoCodigo := IntToStr(AdoQrySalvar.FieldByName('UtCodigo').AsInteger);
        Sql.Text := 'Insert Into Telefone (nmTelefone,dsRamal,dsTelefone,cdPessoa,CdTelefone) '+
                    'Values (:NMTELEFONE,:DSRAMAL,:DSTELEFONE,:CDPESSOA,:CDTELEFONE)          ';
        parameters.parambyname('NMTELEFONE').value := EdtTelefone.Text;
        parameters.parambyname('DSRAMAL').value := EdtRamal.Text;
        parameters.parambyname('DSTELEFONE').value := EdtTipo.Text;
        parameters.parambyname('CDPESSOA').value := EdtCodigo.Text;
        parameters.parambyname('CDTELEFONE').value := UltimoCodigo;
        ExecSql;
        DModulo.Conexao.CommitTrans;
        Messagedlg('Inclusão Ok!', mtinformation, [mbOk], 0);
      except
        on E: Exception do begin
          DModulo.Conexao.RollbackTrans;
          Salvar_erro(vData_Banco + ' | ' + FrmPrincipalPreVenda.pegaHoraBanco, 'PREVENDA', 'TFrmCdTelefone.BtnMdSalvarClick', e.Message);
          Messagedlg('Não foi possivel salvar os dados!', mterror, [mbOk], 0);
          BtnMdCancelarClick(Sender);
        end;
      end; // try
    end;  // QuySalvar
  end else begin
    CodTelefone := AdoQryConsulta.FieldByName('cdTelefone').AsString;
    With AdoQryAlterar do begin
      try
        DModulo.Conexao.BeginTrans;
        Sql.Text := 'Update Telefone Set nmTelefone = :TEL,dsRamal = :RAMAL,'+
        'dsTelefone = :DSTEL Where cdTelefone = :CODIGO ';
        Parameters.parambyname('TEL').VAlue :=  EdtTelefone.Text;
        Parameters.parambyname('RAMAL').VAlue :=  EdtRamal.Text;
        Parameters.parambyname('DSTEL').VAlue := EdtTipo.Text;
        Parameters.parambyname('CODIGO').VAlue :=  CodTelefone;
        ExecSql;
        DModulo.Conexao.CommitTrans;
        Messagedlg('Alteração Ok!', mtinformation, [mbOk], 0);
      Except
        DModulo.Conexao.RollbackTrans;
        Messagedlg('Não foi possivel alterar os dados!', mterror, [mbOk], 0);
      end; // except
    end;  // With
  end;    // else
  TrataBotoesPadrao(Sender,Padrao);
  Status:=[Padrao];
end;     // procedure

end.
