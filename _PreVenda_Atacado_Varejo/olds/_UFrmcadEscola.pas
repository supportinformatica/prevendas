unit UFrmcadEscola;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FrmCadEstados, DB, ADODB, ImgList, ExtCtrls, StdCtrls, Grids,
  DBGrids, ComCtrls, Buttons, Vcl.Menus;

type
  TFrmCadEscola = class(TFrmMdCadastro)
    EditnmEscola: TEdit;
    Label1: TLabel;
    EdtcdEscola: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    procedure BtnMdNovoClick(Sender: TObject);
    procedure BtnMdSalvarClick(Sender: TObject);
    procedure BtnMdAlterarClick(Sender: TObject);
    procedure BtnMdExcluirClick(Sender: TObject);
    procedure BtnMdCancelarClick(Sender: TObject);
    procedure BtnMdSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CmbConsultaChange(Sender: TObject);
    procedure EdtConsultaChange(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure PgCtrolMdCadastroChange(Sender: TObject);
    procedure TBSheetMdCadastroConsultaShow(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure AtivaCampos;
    procedure DesativaCampos;
    procedure AtualizaQryConsulta;
    procedure AtualizaCampos;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadEscola: TFrmCadEscola;

implementation

uses MoPreVenda, uFuncoesPadrao, DataModulo;

{$R *.dfm}

procedure TFrmCadEscola.AtivaCampos;
begin
  EditnmEscola.ReadOnly := False;
end;

procedure TFrmCadEscola.DesativaCampos;
begin
  EditnmEscola.ReadOnly := True;
end;

procedure TFrmCadEscola.AtualizaQryConsulta;
begin
  With AdoQryConsulta do Begin
    Sql.Clear;
    //SQL.Add('Declare @texto varchar(40)');
    //SQL.Add('Set @texto = :Parametro');
    Sql.Add('Select cdEscola as Codigo,dsEscola as Escola ');
    Sql.Add('From Escola');
    case CmbConsulta.ItemIndex of
      0: Sql.Add('Order By cdEscola');
      1: begin              // por codigo
        Sql.Add('where  CdEscola Like '''+EdtConsulta.Text+'%'' ');
      end; // 1
      2: begin              // por nome do cliente
        Sql.Add('where DsEscola Like '''+EdtConsulta.Text+'%'' ');
      end;  // 2
    end;  //case
    Open;
    { omite estes campos na grid }
  end; // with
end;

procedure TFrmCadEscola.AtualizaCampos;
var
  i:Integer;
begin
  With AdoQryConsulta do begin                // move os campos para os componentes
    if AdoQryConsulta.RecordCount = 0 then begin
      LimpaTodosCampos(TbSheetMdCadastroDados);
      exit;
    end;
    EdtcdEscola.Text := AdoQryConsulta.FieldByName('Codigo').AsString;
    EditnmEscola.Text  := AdoQryConsulta.FieldByName('Escola').AsString;
end;
end;

procedure TFrmCadEscola.BtnMdNovoClick(Sender: TObject);
var ultcod:Integer;
begin
  inherited;
  AtivaCampos;
  LimpaTodosCampos(TbSheetMdCadastroDados);
  TrataBotoesPadrao(Sender,novo);
  Status := [novo];
  ADOQryUltimoCodigo.SQL.Text:='Select cdEscola from Escola  Order By cdEscola Desc ';
  ADOQryUltimoCodigo.Open;
  ultcod:=ADOQryUltimoCodigo.FieldByName('cdescola').AsInteger;
  ultcod := ultcod + 1;
  EdtcdEscola.Text:=IntToStr(ultcod);


end;

procedure TFrmCadEscola.BtnMdSalvarClick(Sender: TObject);
begin
  inherited;
try
  if Status = [Novo] then begin
    If not CamposObrigatoriosPreenchidos(TBSheetMdCadastroDados) then exit;

    With ADOQryAlterar do begin   // parametros para a query de inclusão de novo registro
      Dmodulo.Conexao.BeginTrans;
      Try
        Close;
        Sql.Clear;
        Sql.text:='Insert into Escola (cdEscola,dsEscola )'+
                  'Values (:cdEscola,:dsEscola)';

        Parameters.ParamByName('cdEscola').value   := EdtcdEscola.Text ;
        Parameters.ParamByName('dsEscola').value   := EditnmEscola.Text;

     ADOQryAlterar.ExecSql;
     DModulo.Conexao.CommitTrans;
     Messagedlg('Inclusão Ok!', mtinformation, [mbOk], 0);
     TrataBotoesPadrao(Sender,padrao);
     Status := [padrao];
     atualizaQryConsulta;
     desativacampos;
    except
     on E: Exception do begin
       Salvar_erro(vData_Banco + ' | ' + FrmPrincipalPreVenda.pegaHoraBanco, 'PREVENDA', 'TFrmCadEscola.BtnMdSalvarClick', e.Message);
       If not CamposObrigatoriosPreenchidos(TBSheetMdCadastroDados) then exit;
       MessageDlg ('Inclusão Cancelada', mtWarning, [mbOk], 0);
       BtnMdCancelarClick(Sender);
     end;
    end;
   end;
  end;

 if Status = [Alterar] then
  begin
    With ADOQryAlterar do begin  // parametros para a query de alteracao
     Dmodulo.Conexao.BeginTrans;
     Try
        close;
        Sql.Clear;
         Sql.text:='Update Escola set cdEscola = :cdEscola,dsEscola = :dsEscola '+
                   ' where cdEscola =:param                            ';
        Parameters.ParamByName('param').value                         := EdtcdEscola.Text;
        Parameters.ParamByName('dsEscola').value                      := EditnmEscola.Text ;
        ADOQryAlterar.Parameters.ParamByName('cdEscola').value        := EdtcdEscola.Text;
        ExecSql;
        DModulo.Conexao.CommitTrans;
        Messagedlg('Alteração Ok!', mtinformation, [mbOk], 0);
      except
        DMOdulo.Conexao.RollbackTrans;
        BtnMdCancelarClick(Sender);
        Messagedlg('Não é possivel Alterar!', mtinformation, [mbOk], 0);
      end;
    end;
   end;
  // ativa botoes, desabilita edicao e atualiza query
  TrataBotoesPadrao(Sender,padrao);
  Status := [padrao];
  atualizaQryConsulta;
  desativacampos;
 except
  DModulo.Conexao.RollbackTrans;
 end;

end;

procedure TFrmCadEscola.BtnMdAlterarClick(Sender: TObject);
begin
  inherited;
  AtivaCampos;
  EditnmEscola.SetFocus;
  TrataBotoesPadrao(Sender,alterar);
  Status := [alterar];
end;

procedure TFrmCadEscola.BtnMdExcluirClick(Sender: TObject);
begin
  inherited;
  try
    if MessageDlg('Confirma a exclusão deste Equipamento', MtConfirmation,
     [mbYes, mbNo], 0) = mrYes then begin
    With ADOQryExcluir do begin
      DModulo.Conexao.BeginTrans;
      try       // parametros para a query de exclusao
        Sql.Text := 'Delete From Escola         '+
                    'Where cdEscola = :cdEscola ';
     Parameters.ParamByName('cdEscola').Value := EdtcdEscola.Text;
        ExecSql;
        DModulo.Conexao.CommitTrans;
        Messagedlg('Dado excluído com sucesso!', mtinformation, [mbOk], 0);
      except
        DModulo.Conexao.RollbackTrans;
        MessageDlg('Você não pode excluir este Equipamento!',MtWarning,[mbOk],0);
      end;
    end;
    atualizaQryConsulta;
    LimpaTodosCampos(TbSheetMdCadastroDados);
    atualizacampos;
    EditnmEscola.SetFocus;       // seta o focu para o edit grupo
  end;
  except
    on E:Exception do
    begin
      Salvar_erro(vData_Banco + ' | ' + FrmPrincipalPreVenda.pegaHoraBanco, 'PREVENDA', 'TFrmCadEscola.BtnMdExcluirClick', e.Message);
      ShowMessage('Não foi possivel excluir o dados ,Motivo ->'+E.message);
    end;
  end;
 end;
procedure TFrmCadEscola.BtnMdCancelarClick(Sender: TObject);
begin
  inherited;
  Atualizacampos;
  DesativaCampos;
  TrataBotoesPadrao(Sender,padrao);
  Status := [padrao];
end;

procedure TFrmCadEscola.BtnMdSairClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TFrmCadEscola.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FrmPrincipalPreVenda.CadastrodeEscola1.enabled := true;
  Action :=cafree;
end;

procedure TFrmCadEscola.FormCreate(Sender: TObject);
begin
  inherited;
 With CmbConsulta do begin  // adiciona itens a combo de consulta
    Items.Clear;
    Items.Add('Todos');
    Items.Add('Código');
    Items.Add('Nome');
    ItemIndex := 0;
  end;
  AtualizaQryConsulta;
  PgCtrolMdCadastro.ActivePageIndex := 0;
end;

procedure TFrmCadEscola.FormShow(Sender: TObject);
begin
  inherited;
  CmbConsulta.ItemIndex := 2;
  EdtConsulta.SetFocus;
end;

procedure TFrmCadEscola.CmbConsultaChange(Sender: TObject);
begin
  inherited;
EdtConsulta.Clear;
EdtConsulta.SetFocus
end;

procedure TFrmCadEscola.EdtConsultaChange(Sender: TObject);
begin
  inherited;
AtualizaQryConsulta;
end;

procedure TFrmCadEscola.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
   AtualizaCampos;
  PgCtrolMdCadastro.ActivePage := TBSheetMdCadastroDados;
//  desativacampos;
  TrataBotoespadrao(sender,padrao);
  Status := [Padrao];
end;


procedure TFrmCadEscola.PgCtrolMdCadastroChange(Sender: TObject);
begin
  inherited;
 if PgCtrolMdCadastro.ActivePage = TbSheetMdCadastroConsulta then begin
    AtualizaQryConsulta;
  end;
  if PgCtrolMdCadastro.ActivePage = TbSheetMdCadastroDados then begin
    AtualizaCampos;
    DesativaCampos;
    TrataBotoesPadrao(Sender,Padrao);
    Status:=[Padrao];
  end;

end;

procedure TFrmCadEscola.TBSheetMdCadastroConsultaShow(Sender: TObject);
begin
  inherited;
BtnMdAlterar.Enabled := False;
  BtnMdExcluir.Enabled := False;
  BtnMdImprimir.Enabled := False;
  BtnMdNovo.Enabled := False;
  BtnMdSalvar.Enabled := False;
  BtnMdCancelar.Enabled := False;
end;

end.
