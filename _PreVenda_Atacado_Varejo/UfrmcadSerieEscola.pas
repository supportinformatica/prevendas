unit UfrmcadSerieEscola;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FrmCadEstados, DB, ADODB, ImgList, ExtCtrls, StdCtrls, Grids,
  DBGrids, ComCtrls, Buttons, Vcl.Menus, System.ImageList;

type
  TFrmCadSerieEscola = class(TFrmMdCadastro)
    CBxEscola: TComboBox;
    EdtcdEscola: TEdit;
    EdtcdSerie: TEdit;
    EdtDesSerie: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure PgCtrolMdCadastroChange(Sender: TObject);
    procedure EdtConsultaChange(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BtnMdNovoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnMdCancelarClick(Sender: TObject);
    procedure BtnMdExcluirClick(Sender: TObject);
    procedure BtnMdAlterarClick(Sender: TObject);
    procedure BtnMdSalvarClick(Sender: TObject);
    procedure CBxEscolaChange(Sender: TObject);
    procedure TBSheetMdCadastroConsultaShow(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure AtivaCampos;
    procedure DesativaCampos;
    procedure AtualizaQryConsulta;
    procedure AtualizaCampos;
  public
    { Public declarations }
  end;

var
  FrmCadSerieEscola: TFrmCadSerieEscola;

implementation

uses MoPreVenda, DataModulo, uFuncoesPadrao;

{$R *.dfm}
procedure TFrmCadSerieEscola.AtivaCampos;
begin
  EdtDesSerie.ReadOnly := False;
  CBxEscola.Enabled     :=True;
end;

procedure TFrmCadSerieEscola.DesativaCampos;
begin
  EdtDesSerie.ReadOnly := True;
  CBxEscola.Enabled    := FAlse;
end;

procedure TFrmCadSerieEscola.AtualizaQryConsulta;
begin
  With AdoQryConsulta do Begin
    close;
    Sql.Clear;
    //SQL.Add('Declare @texto varchar(40)');
    //SQL.Add('Set @texto = :Parametro');
    Sql.Add('Select S.cdSerie as cdSerie,S.dsSerie as Serie '); //E.cdEscola as CdEscola,E.dsEscola as Escola,
    Sql.Add('From SerieEscolar S with(nolock) '); //left join Escola E on E.cdEscola = S.cdEscola
    case CmbConsulta.ItemIndex of
      0: Sql.Add('Order By 4');
      1: begin              // por codigo
        Sql.Add('where  S.CdSerie Like '''+EdtConsulta.Text+'%'' Order By S.cdSerie');
      end; // 1
      2: begin              // por nome do cliente
        Sql.Add('where S.DsSerie Like '''+EdtConsulta.Text+'%'' Order By S.dsSerie');
      end;  // 2
//      3:begin
//        SQL.Add('where E.DsEscola Like '''+EdtConsulta.Text+'%'' or (E.DsEscola = '''' or E.DsEscola is null) Order By 4');
//      end;
    end;  //case
    Open;
    { omite estes campos na grid }
  end; // with
end;

procedure TFrmCadSerieEscola.AtualizaCampos;
var
  i:Integer;
begin
  With AdoQryConsulta do begin                // move os campos para os componentes
    if AdoQryConsulta.RecordCount = 0 then begin
      LimpaTodosCampos(TbSheetMdCadastroDados);
       CBxEscola.Text:='';
      exit;
    end;
    EdtDesSerie.Text   := AdoQryConsulta.FieldByName('Serie').AsString;
    EdtcdSerie.Text    := AdoQryConsulta.FieldByName('cdSerie').AsString;
  end;
end;

procedure TFrmCadSerieEscola.PgCtrolMdCadastroChange(Sender: TObject);
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

procedure TFrmCadSerieEscola.EdtConsultaChange(Sender: TObject);
begin
  inherited;
AtualizaQryConsulta;
end;

procedure TFrmCadSerieEscola.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  AtualizaCampos;
  PgCtrolMdCadastro.ActivePage := TBSheetMdCadastroDados;
//  desativacampos;
  TrataBotoespadrao(sender,padrao);
  Status := [Padrao];
end;

procedure TFrmCadSerieEscola.BtnMdNovoClick(Sender: TObject);
var ultcod :Integer;
begin
  inherited;
  AtivaCampos;
  LimpaTodosCampos(TbSheetMdCadastroDados);
  CBxEscola.Text:='';
  TrataBotoesPadrao(Sender,novo);
  Status := [novo];
  ADOQryUltimoCodigo.SQL.Text:='Select cdSerie from SerieEscolar  Order By cdSerie Desc ';
  ADOQryUltimoCodigo.Open;
  ultcod:=ADOQryUltimoCodigo.FieldByName('cdSerie').AsInteger;
  ultcod := ultcod + 1;
  EdtcdSerie.Text:=IntToStr(ultcod);
  EdtDesSerie.SelectAll;
  EdtDesSerie.SetFocus;
end;

procedure TFrmCadSerieEscola.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FrmPrincipalPreVenda.CadastrodeSrie1.enabled := true;
  Action :=cafree;
end;

procedure TFrmCadSerieEscola.FormCreate(Sender: TObject);
begin
  inherited;
  With CmbConsulta do begin  // adiciona itens a combo de consulta
    Items.Clear;
    Items.Add('Todos');
    Items.Add('Codigo Serie');
    Items.Add('Serie');
    ItemIndex := 2;
  end;

// with ADOQryCombFone do
// begin
//   SQL.Text:='Select dsEscola,cdEscola from Escola order by 1 ';
//   Open;
//   MontaComboListBoolAdo(ADOQryCombFone,CbxEscola);
// end;
 PgCtrolMdCadastro.ActivePageIndex := 0;

 AtualizaQryConsulta;
end;

procedure TFrmCadSerieEscola.FormShow(Sender: TObject);
begin
  inherited;
  CmbConsulta.ItemIndex := 2;
  EdtConsulta.SetFocus;
end;

procedure TFrmCadSerieEscola.BtnMdCancelarClick(Sender: TObject);
begin
  inherited;
Atualizacampos;
  DesativaCampos;
  TrataBotoesPadrao(Sender,padrao);
  Status := [padrao];
end;

procedure TFrmCadSerieEscola.BtnMdExcluirClick(Sender: TObject);
begin
  inherited;
  try
    if MessageDlg('Confirma a exclusão desta Série?', MtConfirmation,
       [mbYes, mbNo], 0) = mrYes
    then

    begin
      With ADOQryExcluir do
      begin
        DModulo.Conexao.BeginTrans;
        try       // parametros para a query de exclusao
          Sql.Text := 'Delete From SerieEscolar         '+
                      'Where cdSerie = :cdSerie  ';
          Parameters.ParamByName('cdSerie').Value := EdtcdSerie.Text;
          ExecSql;
          DModulo.Conexao.CommitTrans;
          Messagedlg('Série excluído com sucesso!', mtinformation, [mbOk], 0);
        except
          on E:Exception do
          begin
            Salvar_erro(vData_Banco + ' | ' + FrmPrincipalPreVenda.pegaHoraBanco, 'PREVENDA', 'TFrmCadEscola.BtnMdExcluirClick', e.Message);
            DModulo.Conexao.RollbackTrans;
            MessageDlg('Você não pode excluir esta série! '+E.message,MtWarning,[mbOk],0);
          end;
        end;
      end;
      atualizaQryConsulta;
      LimpaTodosCampos(TbSheetMdCadastroDados);
      CBxEscola.Text:='';
      atualizacampos;
      EdtDesSerie.SetFocus;       // seta o focu para o edit grupo
    end;
  except
    on E:Exception do
    begin
      ShowMessage('Não foi possivel excluir a série ,Motivo ->' + E.message);
      Salvar_erro(vData_Banco + ' | ' + FrmPrincipalPreVenda.pegaHoraBanco, 'PREVENDA', 'TFrmCadSerieEscola.BtnMdExcluirClick', e.Message);
    end;
  end;
end;

procedure TFrmCadSerieEscola.BtnMdAlterarClick(Sender: TObject);
begin
  inherited;
  AtivaCampos;
  EdtDesSerie.SetFocus;
  TrataBotoesPadrao(Sender,alterar);
  Status := [alterar];
end;

procedure TFrmCadSerieEscola.BtnMdSalvarClick(Sender: TObject);
var qry:TAdoquery;
begin
  inherited;
  try
    if Status = [Novo] then
    begin
      If not CamposObrigatoriosPreenchidos(TBSheetMdCadastroDados) then
         exit;
      With ADOQryAlterar do
      begin   // parametros para a query de inclusão de novo registro
        Dmodulo.Conexao.BeginTrans;
        Try
          Close;
          Sql.Clear;
          Sql.text:='Insert into SerieEscolar (cdSerie,dsSerie)'+ //,cdEscola
                    'Values (:cdSerie,:dsSerie)';                 // ,:cdEscola
//          if EdtcdEscola.Text <> '' then
//            Parameters.ParamByName('cdEscola').value  := EdtcdEscola.Text
//          else
//            Parameters.ParamByName('cdEscola').value  := null;
          Parameters.ParamByName('cdSerie').value   := EdtcdSerie.Text;
          Parameters.ParamByName('dsSerie').value   := EdtDesSerie.Text;

          ADOQryAlterar.ExecSql;
          DModulo.Conexao.CommitTrans;
          Messagedlg('Inclusão Ok!', mtinformation, [mbOk], 0);
          TrataBotoesPadrao(Sender,padrao);
          Status := [padrao];
          atualizaQryConsulta;
          desativacampos;
        except
          on E: Exception do
          begin
            If not CamposObrigatoriosPreenchidos(TBSheetMdCadastroDados) then
              exit;
            MessageDlg ('Inclusão Cancelada', mtWarning, [mbOk], 0);
            DMOdulo.Conexao.RollbackTrans;
            Salvar_erro(vData_Banco + ' | ' + FrmPrincipalPreVenda.pegaHoraBanco, 'PREVENDA', 'TFrmCadSerieEscola.BtnMdSalvarClick', e.Message);
            BtnMdCancelarClick(Sender);
          end;
        end;
      end;
    end;
    if Status = [Alterar] then
    begin
      qry := TAdoQuery.Create(nil);
      qry.connection := DModulo.Conexao;
      With qry do
      begin  // parametros para a query de alteracao
        Dmodulo.Conexao.BeginTrans;
        Try
          Sql.text:= 'Update SerieEscolar set dsSerie = :dsSerie '+
                     'where cdSerie = :cdSerie                   ';
          Parameters.ParamByName('dsSerie').value  := EdtDesSerie.Text;
          Parameters.ParamByName('cdSerie').value  := EdtcdSerie.Text;
          ExecSql;
          DModulo.Conexao.CommitTrans;
          Messagedlg('Alteração Ok!', mtinformation, [mbOk], 0);
        except
          on E: Exception do
          begin
            DMOdulo.Conexao.RollbackTrans;
            BtnMdCancelarClick(Sender);
            Messagedlg('Não é possivel Alterar! '+E.Message, mtinformation, [mbOk], 0);
          end;
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

procedure TFrmCadSerieEscola.CBxEscolaChange(Sender: TObject);
begin
  inherited;
  if CBxEscola.ItemIndex <> -1 then begin
    ADOQryCombFone.Open;
    ADOQryCombFone.Locate('dsEscola',CBxEscola.Text,[]);
    EdtcdEscola.Text :=ADOQryCombFone.FieldByName('cdEscola').AsString;
    //AdoQryMunicipio.Close;
  end else begin
    EdtCdEscola.Clear;
  end;
end;

procedure TFrmCadSerieEscola.TBSheetMdCadastroConsultaShow(
  Sender: TObject);
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
