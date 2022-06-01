unit FormCdAmbiente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FrmCadEstados, Data.DB, Data.Win.ADODB,
  Vcl.Menus, Vcl.ImgList, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids,
  Vcl.ComCtrls, Vcl.Buttons;

type
  TFrmCdAmbiente = class(TFrmMdCadastro)
    ADOQryConsultacdAmbiente: TAutoIncField;
    ADOQryConsultadsAmbiente: TStringField;
    Label1: TLabel;
    EdtCdAmbiente: TEdit;
    EdtDsAmbiente: TEdit;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure CmbConsultaChange(Sender: TObject);
    procedure EdtConsultaChange(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure PgCtrolMdCadastroChange(Sender: TObject);
    procedure BtnMdNovoClick(Sender: TObject);
    procedure BtnMdAlterarClick(Sender: TObject);
    procedure BtnMdCancelarClick(Sender: TObject);
    procedure BtnMdPrimeiroClick(Sender: TObject);
    procedure BtnMdProximoClick(Sender: TObject);
    procedure BtnMdAnteriorClick(Sender: TObject);
    procedure BtnMdUltimoClick(Sender: TObject);
    procedure BtnMdSalvarClick(Sender: TObject);
    procedure BtnMdExcluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure AtualizaQryConsulta;
    procedure AtivaCampos;
    procedure DesativaCampos;
    procedure LimpaCampos;
    function BuscaUltimoCodigo: string;
    procedure preencheCampos;
  public
    { Public declarations }
  end;

var
  FrmCdAmbiente: TFrmCdAmbiente;

implementation

{$R *.dfm}

uses DataModulo;

procedure TFrmCdAmbiente.AtivaCampos;
begin
  EdtDsAmbiente.Enabled := True;
end;

procedure TFrmCdAmbiente.AtualizaQryConsulta;
begin
  with ADOQryConsulta do begin
    sql.Text := 'select * from ambiente where 1 = 1';
    if EdtConsulta.Text <> '' then begin
      if CmbConsulta.ItemIndex = 1 then begin
        sql.Add('and cdAmbiente = :cdAmbiente');
        Parameters.ParamByName('cdAmbiente').Value := EdtConsulta.Text;
      end
      else if CmbConsulta.ItemIndex = 2 then begin
        sql.Add('and dsAmbiente like :dsAmbiente');
        Parameters.ParamByName('dsAmbiente').Value := EdtConsulta.Text + '%';
      end;
    end;
    Open;
  end;
end;

procedure TFrmCdAmbiente.BtnMdAlterarClick(Sender: TObject);
begin
  inherited;
  AtivaCampos;
end;

procedure TFrmCdAmbiente.BtnMdAnteriorClick(Sender: TObject);
begin
  inherited;
  preencheCampos;
end;

procedure TFrmCdAmbiente.BtnMdCancelarClick(Sender: TObject);
begin
  inherited;
  LimpaCampos;
  DesativaCampos;
  PgCtrolMdCadastro.ActivePageIndex := 0;
  AtualizaQryConsulta;
end;

procedure TFrmCdAmbiente.BtnMdExcluirClick(Sender: TObject);
var qry: TADOQuery;
begin
  inherited;
  qry := TADOQuery.Create(nil);
  qry.Connection := DModulo.Conexao;
  with qry do begin
    sql.Text := 'select cdAmbiente from iteOrcamento where cdAmbiente = :cdAmbiente ';
    parameters.ParamByName('cdAmbiente').Value := ADOQryConsultacdAmbiente.AsInteger;
    open;
    if RecordCount > 0 then begin
      Application.MessageBox('Não é possivel excluir esse ambiente pois ele já está vinculado à várias pré vendas!','Atenção', mb_ok + MB_ICONERROR + MB_APPLMODAL);
      Exit;
    end;
    Close;
  end;
  FreeAndNil(qry);
  if Application.MessageBox('Confirma a exlusão deste ambiente?', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_APPLMODAL) = IDYES then begin
    with AdoQrysalvar do begin
      try
        DModulo.Conexao.BeginTrans;
        sql.Text := 'delete ambiente where cdAmbiente = :cdAmbiente ';
        parameters.ParamByName('cdAmbiente').Value := ADOQryConsultacdAmbiente.AsInteger;
        execSql;
        Application.MessageBox('Ambiente excluído com sucesso!','Informação', mb_ok + MB_ICONINFORMATION + MB_APPLMODAL);
        DModulo.Conexao.CommitTrans;
      except
        Application.MessageBox('Erro ao excluir ambiente!','Atenção', mb_ok + MB_ICONERROR + MB_APPLMODAL);
        DModulo.Conexao.RollbackTrans;
      end;
    end;
    AtualizaQryConsulta;
  end;
end;

procedure TFrmCdAmbiente.BtnMdNovoClick(Sender: TObject);
begin
  inherited;
  LimpaCampos;
  AtivaCampos;
  PgCtrolMdCadastro.ActivePageIndex := 1;
  EdtCdAmbiente.Text := BuscaUltimoCodigo;
  EdtDsAmbiente.SetFocus;
end;

procedure TFrmCdAmbiente.BtnMdPrimeiroClick(Sender: TObject);
begin
  inherited;
  preencheCampos;
end;

procedure TFrmCdAmbiente.BtnMdProximoClick(Sender: TObject);
begin
  inherited;
  preencheCampos;
end;

procedure TFrmCdAmbiente.BtnMdSalvarClick(Sender: TObject);
begin
  inherited;
  if EdtDsAmbiente.Text = '' then begin
    Application.MessageBox('Digite a descrição do ambiente!','Atenção', mb_ok + MB_ICONINFORMATION + MB_APPLMODAL);
    EdtDsAmbiente.setFocus;
    exit;
  end;
  with AdoQrysalvar do begin
    try
      DModulo.Conexao.BeginTrans;
      if status = [novo] then begin
        sql.Text := 'insert into ambiente (dsAmbiente) '+
                    'values (:dsAmbiente) ';
        parameters.ParamByName('dsAmbiente').Value := EdtDsAmbiente.Text;
        execSql;
        Application.MessageBox('Ambiente salvo com sucesso!','Atenção', mb_ok + MB_ICONINFORMATION + MB_APPLMODAL);
      end
      else begin
        sql.Text := 'update ambiente set dsAmbiente = :dsAmbiente where cdAmbiente = :cdAmbiente ';
        parameters.ParamByName('dsAmbiente').Value := EdtDsAmbiente.Text;
        parameters.ParamByName('cdAmbiente').Value := ADOQryConsultacdAmbiente.AsInteger;
        execSql;
        Application.MessageBox('Ambiente alterado com sucesso!','Atenção', mb_ok + MB_ICONINFORMATION + MB_APPLMODAL);
      end;
      DModulo.Conexao.CommitTrans;
    except
      Application.MessageBox('Erro ao salvar / alterar ambiente!','Atenção', mb_ok + MB_ICONERROR + MB_APPLMODAL);
      DModulo.Conexao.RollbackTrans;
    end;
  end;
  BtnMdCancelarClick(self);
  AtualizaQryConsulta;
end;

procedure TFrmCdAmbiente.BtnMdUltimoClick(Sender: TObject);
begin
  inherited;
  preencheCampos;
end;

function TFrmCdAmbiente.BuscaUltimoCodigo: string;
var qry: TADOQuery;
begin
  qry := TADOQuery.Create(nil);
  qry.Connection := DModulo.Conexao;
  with qry do begin
    SQL.text := 'select max(cdAmbiente)+1 as ultimo from ambiente';
    Open;
    if FieldByName('ultimo').IsNull then
      Result := '1'
    else
      Result := fieldByName('ultimo').AsString;
  end;
  FreeAndNil(qry);
end;

procedure TFrmCdAmbiente.CmbConsultaChange(Sender: TObject);
begin
  inherited;
  AtualizaQryConsulta;
end;

procedure TFrmCdAmbiente.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  preencheCampos;
  PgCtrolMdCadastro.ActivePageIndex := 1;
  PgCtrolMdCadastroChange(self);
end;

procedure TFrmCdAmbiente.DesativaCampos;
begin
  EdtDsAmbiente.Enabled := false;
end;

procedure TFrmCdAmbiente.EdtConsultaChange(Sender: TObject);
begin
  inherited;
  AtualizaQryConsulta;
end;

procedure TFrmCdAmbiente.FormCreate(Sender: TObject);
begin
  inherited;
  AtualizaQryConsulta;
  LimpaCampos;
  DesativaCampos;
  PgCtrolMdCadastro.ActivePageIndex := 0;
end;

procedure TFrmCdAmbiente.FormShow(Sender: TObject);
begin
  inherited;
  EdtConsulta.SetFocus;
end;

procedure TFrmCdAmbiente.LimpaCampos;
begin
  EdtCdAmbiente.Text := '';
  EdtDsAmbiente.text := '';
end;

procedure TFrmCdAmbiente.PgCtrolMdCadastroChange(Sender: TObject);
begin
  inherited;
  if PgCtrolMdCadastro.ActivePageIndex = 1 then begin
    LimpaCampos;
    DesativaCampos;
    preencheCampos;
  end
  else if PgCtrolMdCadastro.ActivePageIndex = 0 then begin
    LimpaCampos;
    DesativaCampos;
  end;
end;

procedure TFrmCdAmbiente.preencheCampos;
begin
  EdtCdAmbiente.Text := ADOQryConsultacdAmbiente.AsString;
  EdtDsAmbiente.Text := ADOQryConsultadsAmbiente.AsString;
end;

end.
