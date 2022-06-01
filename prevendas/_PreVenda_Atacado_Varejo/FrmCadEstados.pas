unit FrmCadEstados;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, Db, Variants,
  ImgList, Menus, ADODB, System.ImageList;

Type
  Tstatus = (Padrao,Novo,Alterar,Baixa);
    TipoStatus = Set of Tstatus;
  TAuxDBGrid = class(TDBGrid);

type
  TFrmMdCadastro = class(TForm)
    PnlMoBotoes: TPanel;
    BtnMdNovo: TBitBtn;
    BtnMdSalvar: TBitBtn;
    BtnMdAlterar: TBitBtn;
    BtnMdExcluir: TBitBtn;
    BtnMdPrimeiro: TBitBtn;
    BtnMdProximo: TBitBtn;
    BtnMdAnterior: TBitBtn;
    BtnMdUltimo: TBitBtn;
    BtnMdImprimir: TBitBtn;
    BtnMdSair: TBitBtn;
    PgCtrolMdCadastro: TPageControl;
    TBSheetMdCadastroConsulta: TTabSheet;
    TBSheetMdCadastroDados: TTabSheet;
    DBGrid1: TDBGrid;
    PnlMdConsulta: TPanel;
    CmbConsulta: TComboBox;
    EdtConsulta: TEdit;
    TBSheetMdCdRelatorio: TTabSheet;
    LblMdConsulta: TLabel;
    LblCmbConsulta: TLabel;
    BtnMdCancelar: TBitBtn;
    Bevel1: TBevel;
    Bevel2: TBevel;
    ImageCadastro: TImageList;
    PopupMenu1: TPopupMenu;
    Help1: TMenuItem;
    ADOQrySalvar: TADOQuery;
    ADOQryAlterar: TADOQuery;
    ADOQryExcluir: TADOQuery;
    ADOQryUltimoCodigo: TADOQuery;
    ADOQryExistir: TADOQuery;
    ADOQryCombFone: TADOQuery;
    ADOQryPegaEstado: TADOQuery;
    ADOQryConsulta: TADOQuery;
    ADOdsConsulta: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TBSheetMdCadastroDadosEnter(Sender: TObject);
    procedure BtnMdNovoClick(Sender: TObject);
    procedure BtnMdSalvarClick(Sender: TObject);
    procedure BtnMdCancelarClick(Sender: TObject);
    procedure BtnMdExcluirClick(Sender: TObject);
    procedure BtnMdAlterarClick(Sender: TObject);
    procedure TBSheetMdCadastroConsultaEnter(Sender: TObject);
    procedure TBSheetMdCdRelatorioEnter(Sender: TObject);
    procedure BtnMdUltimoClick(Sender: TObject);
    procedure BtnMdPrimeiroClick(Sender: TObject);
    procedure BtnMdProximoClick(Sender: TObject);
    procedure BtnMdAnteriorClick(Sender: TObject);
    procedure BtnMdSairClick(Sender: TObject);
    procedure CmbConsultaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PgCtrolMdCadastroChange(Sender: TObject);
    procedure Help1Click(Sender: TObject);
    procedure EdtConsultaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
     { Private declarations }
  public
    Status: TipoStatus;         // Padrao,Novo ou Alterar
    Procedure TrataBotoesPadrao (Sender :TObject; Status :TStatus);
                                 // retorna Padrao,Novo ou Alterar
    { Public declarations }
  end;

var
  FrmMdCadastro: TFrmMdCadastro;

implementation



{$R *.DFM}

Procedure TFrmMdCadastro.TrataBotoesPadrao( Sender: TObject; Status: TStatus);
{ abilita ou desabilita os botões do fomulario pai }
begin
  Case Status of
    Padrao : begin
      BtnMdImprimir.Enabled := False;
      BtnMdNovo.Enabled := True;
      BtnMdAlterar.Enabled := True;
      BtnMdExcluir.Enabled := True;
      BtnMdPrimeiro.Enabled := True;
      BtnMdProximo.Enabled := True;
      BtnMdAnterior.Enabled := True;
      BtnMdUltimo.Enabled := True;
      BtnMdSalvar.Enabled := False;
      BtnMdCancelar.Enabled :=False;
    end; // padrao
    Novo : begin
      BtnMdImprimir.Enabled := False;
      BtnMdNovo.Enabled := False;
      BtnMdAlterar.Enabled := False;
      BtnMdExcluir.Enabled := False;
      BtnMdPrimeiro.Enabled := False;
      BtnMdProximo.Enabled := False;
      BtnMdAnterior.Enabled := False;
      BtnMdUltimo.Enabled := False;
      BtnMdSalvar.Enabled := True;
      BtnMdCancelar.Enabled := True;
    end; // novo
    Alterar : Begin
      BtnMdImprimir.Enabled := False;
      BtnMdNovo.Enabled := False;
      BtnMdAlterar.Enabled := False;
      BtnMdExcluir.Enabled := False;
      BtnMdPrimeiro.Enabled := False;
      BtnMdProximo.Enabled := False;
      BtnMdAnterior.Enabled := False;
      BtnMdUltimo.Enabled := False;
      BtnMdSalvar.Enabled := True;
      BtnMdCancelar.Enabled := True;
    end; // alterar
    Baixa: begin
      BtnMdImprimir.Enabled := False;
      BtnMdNovo.Enabled := False;
      BtnMdAlterar.Enabled := False;
      BtnMdExcluir.Enabled := False;
      BtnMdPrimeiro.Enabled := False;
      BtnMdProximo.Enabled := False;
      BtnMdAnterior.Enabled := False;
      BtnMdUltimo.Enabled := False;
      BtnMdSalvar.Enabled := True;
      BtnMdCancelar.Enabled := True;
    end; // baixa
  end; //case
end;

procedure TFrmMdCadastro.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TFrmMdCadastro.TBSheetMdCadastroDadosEnter(Sender: TObject);
begin
  BtnMdImprimir.Enabled := False;  //Botao Imprimir
  
//  if (PgCtrolMdCadastro.ActivePage <> TBSheetMdCadastroDados) then
//  begin
//    if (Status <> [Alterar]) and (Status <> [Novo]) then
//    begin
//      TrataBotoesPadrao(Sender,padrao);
//      Status := [padrao];
//    end;
//  end;
end;

procedure TFrmMdCadastro.BtnMdNovoClick(Sender: TObject);
begin
  TrataBotoesPadrao(Sender,novo);
  Status := [novo];
end;

procedure TFrmMdCadastro.BtnMdSalvarClick(Sender: TObject);
begin
  TBSheetMdCadastroDadosEnter(Sender);
end;

procedure TFrmMdCadastro.BtnMdCancelarClick(Sender: TObject);
begin
  TrataBotoesPadrao(Sender,padrao);
  Status := [padrao];
end;

procedure TFrmMdCadastro.BtnMdExcluirClick(Sender: TObject);
begin
  TBSheetMdCadastroDadosEnter(Sender);
end;

procedure TFrmMdCadastro.BtnMdAlterarClick(Sender: TObject);
begin
  TrataBotoesPadrao(Sender,alterar);
  Status := [alterar];
end;

procedure TFrmMdCadastro.TBSheetMdCadastroConsultaEnter(Sender: TObject);
begin  { desabilita todos os botões na tabsheet de consulta }
  BtnMdAlterar.Enabled := False;
  BtnMdExcluir.Enabled := False;
  BtnMdImprimir.Enabled := False;
  BtnMdNovo.Enabled := False;
  BtnMdSalvar.Enabled := False;
  BtnMdCancelar.Enabled := False;
end;

procedure TFrmMdCadastro.TBSheetMdCdRelatorioEnter(Sender: TObject);
begin  { tabsheet de relatorio recebe o foco }
  if PgCtrolMdCadastro.ActivePage <> TBSheetMdCdRelatorio then begin
    TBSheetMdCadastroConsultaEnter(Sender);
    BtnMdImprimir.Enabled := True;
    BtnMdUltimo.Enabled := False;
    BtnMdPrimeiro.Enabled := False;
    BtnMdProximo.Enabled := False;
    BtnMdAnterior.Enabled := False;
  end;
end;

procedure TFrmMdCadastro.BtnMdUltimoClick(Sender: TObject);
begin
  AdoQryConsulta.Last; // Ultimo registro
end;

procedure TFrmMdCadastro.BtnMdPrimeiroClick(Sender: TObject);
begin
  AdoQryConsulta.First; // Primeiro registro
end;

procedure TFrmMdCadastro.BtnMdProximoClick(Sender: TObject);
begin
  AdoQryConsulta.Next;  // Proximo Registro
end;

procedure TFrmMdCadastro.BtnMdAnteriorClick(Sender: TObject);
begin
  AdoQryConsulta.Prior; // Registro Anterior
end;

procedure TFrmMdCadastro.BtnMdSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmMdCadastro.CmbConsultaClick(Sender: TObject);
begin
  if (EdtConsulta.Enabled = true) or (EdtConsulta.Visible = true) Then EdtConsulta.SetFocus;
end;

procedure TFrmMdCadastro.FormCreate(Sender: TObject);
begin
//  EdtConsulta.Clear;
end;

procedure TFrmMdCadastro.PgCtrolMdCadastroChange(Sender: TObject);
begin
  if PgCtrolMdCadastro.ActivePage = TbsheetMdCadastroConsulta then
  begin
    Status := [Padrao];
    if EdtConsulta.Enabled and EdtConsulta.Visible then
    begin
      EdtConsulta.SelectAll;
      EdtConsulta.SetFocus;
    end;
  end
  else
  if (Status = [Padrao])or(Status = []) then
     TrataBotoesPadrao(Sender,Padrao)
  else
  if Status = [Novo] then
     TrataBotoesPadrao(Sender,Novo)
  else
  if Status = [Alterar] then
     TrataBotoesPadrao(Sender,Alterar)
  else
  if Status = [Baixa] then
     TrataBotoesPadrao(Sender,Baixa);
end;

procedure TFrmMdCadastro.Help1Click(Sender: TObject);
begin
  Application.HelpContext(0);
end;

procedure TFrmMdCadastro.EdtConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_Down then
    BtnMdProximoClick(Self);
  if Key = VK_Up then
    BtnMdAnteriorClick(Self);
end;

procedure TFrmMdCadastro.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  // Para mudar a cor da linha no DbGrid
  if (TAuxDBGrid(dbgrid1).DataLink.ActiveRecord + 1 = TAuxDBGrid(dbgrid1).Row) then begin
    dbgrid1.Canvas.Brush.Color  := clSkyBlue;
    dbgrid1.Canvas.Font.Style   := dbgrid1.Canvas.Font.Style + [fsBold];
  end;
//  dbgrid1.Canvas.FillRect(Rect);
//  dbgrid1.Canvas.TextOut(Rect.Left + 2,Rect.Top,Column.Field.AsString);
end;

end.
