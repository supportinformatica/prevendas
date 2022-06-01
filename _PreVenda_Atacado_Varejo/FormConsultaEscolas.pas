unit FormConsultaEscolas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, FrmPrincipal, uFuncoesPadrao, DataModulo;

Type
  TAuxDBGrid = class(TDBGrid);

type
  TFrmConsultaEscolas = class(TForm)
    DBGrid1: TDBGrid;
    EdtFiltro: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    CbxFiltro: TComboBox;
    AdoQryConsulta: TADOQuery;
    DsConsulta: TDataSource;
    CbxAno: TComboBox;
    Label20: TLabel;
    AdoQryConsultaCdLista: TIntegerField;
    AdoQryConsultaAno: TIntegerField;
    AdoQryConsultaDsEscola: TStringField;
    AdoQryConsultadsSerie: TStringField;
    AdoQryAno: TADOQuery;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure EdtFiltroChange(Sender: TObject);
    procedure EdtFiltroKeyPress(Sender: TObject; var Key: Char);
    procedure EdtFiltroKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
    procedure AtualizaQryConsulta;
    procedure MontaComboAnoExercicio;
    procedure PreencheCampos;
  public
    { Public declarations }
  end;

var
  FrmConsultaEscolas: TFrmConsultaEscolas;

implementation

uses UfrmCadLista, DOMEscola, DOMSerieEscolar, NEGEscola, NEGSerieEscolar;

{$R *.dfm}

procedure TFrmConsultaEscolas.AtualizaQryConsulta;
begin
  with AdoQryConsulta do begin
    SQL.Text := 'select L.CdLista, Year(L.Ano) as Ano, E.DsEscola, S.dsSerie '+
                'from ListaEscolar L inner join                              '+
                'Escola E on E.CdEscola = L.CdEscola                         '+
                'inner join SerieEscolar S on S.cdSerie = L.cdSerie          '+
                'where Year(L.ano) = :ano                                    ';
    parameters.ParamByName('ano').Value := CbxAno.Text;
    if EdtFiltro.Text <> '' then begin
      case CbxFiltro.ItemIndex of
        1: begin
          sql.Add('and E.dsEscola like :dsEscola');
          parameters.ParamByName('dsEscola').Value := '%'+EdtFiltro.Text+'%';
        end;
        2: begin
          sql.Add('and S.dsSerie like :dsSerie');
          parameters.ParamByName('dsSerie').Value := '%'+EdtFiltro.Text+'%';
        end;
      end;
    end;
    sql.add('order by 2 desc,3,4 ');
    open;
  end;
end;

procedure TFrmConsultaEscolas.DBGrid1DblClick(Sender: TObject);
begin
  if (ADOQryConsulta.RecordCount > 0) then begin
    preencheCampos;
  end;
end;

procedure TFrmConsultaEscolas.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
//  if (TAuxDBGrid(dbgrid1).DataLink.ActiveRecord + 1 = TAuxDBGrid(dbgrid1).Row)  or(gdSelected in State)then begin
//    dbgrid1.Canvas.Brush.Color := clSkyBlue;
//  end;
//  DBGrid1.Canvas.Font.Color  := clBlack;
//  dbgrid1.Canvas.Font.Style  := dbgrid1.Canvas.Font.Style + [fsBold];
//  DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
//  dbgrid1.Canvas.FillRect(Rect);
end;

procedure TFrmConsultaEscolas.EdtFiltroChange(Sender: TObject);
begin
  AtualizaQryConsulta;
end;

procedure TFrmConsultaEscolas.EdtFiltroKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_Down then
    AdoQryConsulta.Next;
  if Key = VK_Up then
    AdoQryConsulta.Prior;
end;

procedure TFrmConsultaEscolas.EdtFiltroKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = Char(13)) and (ADOQryConsulta.RecordCount > 0) then begin   // enter
    PreencheCampos;
  end;
  if Key = Char(27) then begin   // ESC
    Application.OnMessage := FormPrincipal.ProcessaMsg;
    close;
  end;
end;

procedure TFrmConsultaEscolas.FormCreate(Sender: TObject);
begin
  MontaComboAnoExercicio;
end;

procedure TFrmConsultaEscolas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  IF Key = Vk_Escape then
    Close;
end;

procedure TFrmConsultaEscolas.FormShow(Sender: TObject);
begin
  AtualizaQryConsulta;
end;

procedure TFrmConsultaEscolas.MontaComboAnoExercicio;
begin
  MontaComboListBoolADO(ADOQryAno,CbxAno);
  CbxAno.Items.Clear;
  CbxAno.Items := CbxAno.Items;
  CbxAno.Text := '2017';
end;

procedure TFrmConsultaEscolas.PreencheCampos;
var escola: TEscola;
    serie: TSerieEscolar;
begin
  Application.OnMessage  := FormPrincipal.NaoProcessaMsg;
  FrmCadLista.edtcdListaImpressao.text := AdoQryConsultaCdLista.AsString;

  escola := TNEGEscola.GetEscola(AdoQryConsulta.FieldByName('cdEscola').AsInteger);
  FrmCadLista.CbxEscolaFiltro.Text := escola.dsEscola + '|' + IntToStr(escola.cdEscola);
  serie := TNEGSerieEscolar.GetSerie(AdoQryConsulta.FieldByName('cdSerie').AsInteger);
  FrmCadLista.CbxSerieFiltro.text := serie.dsSerie + '|' + IntToStr(serie.cdSerie);

  Application.OnMessage := FormPrincipal.ProcessaMsg;
  Close;
end;

end.
