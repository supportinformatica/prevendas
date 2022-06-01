unit cdCFOP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Menus, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ADODB;

type
  TFrmCFOP = class(TForm)
    DsConsulta: TDataSource;
    DBGrid1: TDBGrid;
    RadioGroup1: TRadioGroup;
    BtnMdPrimeiro: TBitBtn;
    BtnMdAnterior: TBitBtn;
    BtnMdProximo: TBitBtn;
    BtnMdUltimo: TBitBtn;
    BtnMdSair: TBitBtn;
    EdtConsulta: TEdit;
    LblMdConsulta: TLabel;
    PopupMenu1: TPopupMenu;
    Banese1: TMenuItem;
    HiperCard1: TMenuItem;
    RedeCard1: TMenuItem;
    Limpatextoparapesquisa1: TMenuItem;
    Bevel1: TBevel;
    LblListados: TLabel;
    ADOQryConsulta: TADOQuery;
    ADOQryConsultacdCFOP: TStringField;
    ADOQryConsultacdSubCFOP: TStringField;
    ADOQryConsultadsCFOP: TStringField;
    ADOQryConsultadsCFOP_Sai_na_Nota: TStringField;
    ADOQryConsultaCFP_flGeraDebitoCredito_ICMS: TStringField;
    ADOQryAux: TADOQuery;
    procedure BtnMdSairClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EdtConsultaChange(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure Limpatextoparapesquisa1Click(Sender: TObject);
    procedure Banese1Click(Sender: TObject);
    procedure HiperCard1Click(Sender: TObject);
    procedure RedeCard1Click(Sender: TObject);
    Procedure AtualizaQryConsulta;
    procedure EdtConsultaKeyPress(Sender: TObject; var Key: Char);
    procedure BtnMdPrimeiroClick(Sender: TObject);
    procedure BtnMdAnteriorClick(Sender: TObject);
    procedure BtnMdProximoClick(Sender: TObject);
    procedure BtnMdUltimoClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure EdtConsultaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    { 0 ==> Saidas dentro do estado, 1 ==> saidas fora do estado,
      2 ==> Entradas dentro do estado, 3 ==> Entradas Fora do estado }
    vTipoForm : integer;
  end;

var
  FrmCFOP: TFrmCFOP;

implementation

uses  DataModulo, MoPreVenda;

{$R *.DFM}

Procedure TFrmCFOP.AtualizaQryConsulta;
{Atualiza  a consulta}
begin
  With ADOQryConsulta do begin
    Sql.Text := 'Select cdCFOP,cdSubCFOP,dsCFOP,dsCFOP_Sai_na_Nota,dsStatus,    '+
                'CFP_flGeraDebitoCredito_ICMS From CFOP WITH (NOLOCK) Where ';
    Sql.Add('dsCFOP_Sai_na_Nota is not null and ');
    Case RadioGroup1.ItemIndex of
      0: Sql.Add('cdCFOP like :CONSULTA Order By cdCFOP');
      1: Sql.Add('dsCFOP_Sai_na_Nota like :CONSULTA Order By dsCFOP_Sai_na_Nota');
      2: Sql.Add('dsCFOP like :CONSULTA Order by dsCFOP');
    end;
    Parameters.ParamByName('CONSULTA').Value := EdtConsulta.Text +'%';
    Open;            // mostra os dados no dbgrid
    ADOQryConsultaCFP_flGeraDebitoCredito_ICMS.Visible := False;
    LblListados.Caption := 'Listados--> ' + IntToStr(RecordCount);
  end;
end;

procedure TFrmCFOP.BtnMdSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCFOP.FormActivate(Sender: TObject);
begin
  EdtConsulta.SetFocus;
  with ADOQryAux do begin
    SQL.Text := 'SELECT * FROM CFOP WHERE DSSTATUS = ''S'' ';
    Open;
    if ADOQryAux.RecordCount = 0 then begin
      try
        DModulo.Conexao.BeginTrans;
        Sql.Text := 'UPDATE cfop set dsstatus = ''S'' where dscfop like ''%PRESTACAO%'' or dscfop like ''%SERVICO%'' ';
        ExecSQL;
        DModulo.Conexao.CommitTrans;
        AtualizaQryConsulta;
      except
        MessageDlg('Erro ao selecionar os CFOPs de serviços',mtError,[mbOK],0);
        DModulo.Conexao.RollbackTrans;
      end;
    end;
  end;
end;

procedure TFrmCFOP.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  Application.OnMessage := FrmPrincipalPreVenda.ProcessaMsg;
end;

procedure TFrmCFOP.EdtConsultaChange(Sender: TObject);
begin
  AtualizaQryConsulta;
end;

procedure TFrmCFOP.RadioGroup1Click(Sender: TObject);
begin
  EdtConsulta.Clear;
  EdtConsulta.SelectAll;
  EdtConsulta.SetFocus;
end;

procedure TFrmCFOP.Limpatextoparapesquisa1Click(Sender: TObject);
begin
  EdtConsulta.Clear;
  EdtConsulta.SelectAll;
  EdtConsulta.SetFocus;
end;

procedure TFrmCFOP.Banese1Click(Sender: TObject);
begin
  RadioGroup1.ItemIndex := 0;
end;

procedure TFrmCFOP.HiperCard1Click(Sender: TObject);
begin
  RadioGroup1.ItemIndex := 1;
end;

procedure TFrmCFOP.RedeCard1Click(Sender: TObject);
begin
  RadioGroup1.ItemIndex := 2;
end;

procedure TFrmCFOP.EdtConsultaKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = Char(13)) and (ADOQryConsulta.RecordCount > 0) then begin   // enter
    Application.OnMessage := FrmPrincipalPreVenda.NaoProcessaMsg;
    FrmPrincipalPreVenda.EdtCFOP.Text := ADOQryConsulta.FieldByName('cdCFOP').AsString;
    FrmPrincipalPreVenda.EdtQtd.SelectAll;
    FrmPrincipalPreVenda.EdtQtd.SetFocus;
    Application.OnMessage := FrmPrincipalPreVenda.ProcessaMsg;
    close;
  end;
  if Key = Char(27) then begin   // ESC
    FrmPrincipalPreVenda.EdtCFOP.Clear;
    FrmPrincipalPreVenda.EdtCFOP.SetFocus;
    close;
  end;
end;

procedure TFrmCFOP.BtnMdPrimeiroClick(Sender: TObject);
begin
  ADOQryConsulta.First; // Primeiro registro
end;

procedure TFrmCFOP.BtnMdAnteriorClick(Sender: TObject);
begin
  ADOQryConsulta.Prior; // Registro Anterior
end;

procedure TFrmCFOP.BtnMdProximoClick(Sender: TObject);
begin
  ADOQryConsulta.Next;  // Proximo Registro
end;

procedure TFrmCFOP.BtnMdUltimoClick(Sender: TObject);
begin
  ADOQryConsulta.Last; // Ultimo registro
end;

procedure TFrmCFOP.DBGrid1CellClick(Column: TColumn);
begin
  EdtConsulta.SelectAll;
  EdtConsulta.SetFocus;
end;

procedure TFrmCFOP.EdtConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_Down then
    BtnMdProximoClick(Self);
  if Key = VK_Up then
    BtnMdAnteriorClick(Self);
end;

end.
