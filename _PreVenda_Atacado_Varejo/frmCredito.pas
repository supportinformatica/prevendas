unit frmCredito;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB, ComCtrls, Grids, DBGrids, ExtCtrls, Menus;

type
  TFormCredito = class(TForm)
    Label1: TLabel;
    RgTipo: TRadioGroup;
    DBGrid1: TDBGrid;
    dtInicial: TDateTimePicker;
    ADOQryConsulta: TADOQuery;
    ADODsConsulta: TDataSource;
    ADOQryCupon: TADOQuery;
    ADOQrySalvar: TADOQuery;
    AdoQryQtd: TADOQuery;
    AdoQryGrupo: TADOQuery;
    ADOQryProcura: TADOQuery;
    dtFinal: TDateTimePicker;
    Label2: TLabel;
    Label36: TLabel;
    edtCredito: TEdit;
    edtDebito: TEdit;
    Label37: TLabel;
    LblSaldo: TLabel;
    EdtSaldo: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    PopupMenu1: TPopupMenu;
    Fechajanela1: TMenuItem;
    Usarcrdito1: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure dtInicialChange(Sender: TObject);
    procedure dtFinalChange(Sender: TObject);
    procedure RgTipoClick(Sender: TObject);
    procedure dtInicialKeyPress(Sender: TObject; var Key: Char);
    procedure dtFinalKeyPress(Sender: TObject; var Key: Char);
    procedure edtCreditoKeyPress(Sender: TObject; var Key: Char);
    procedure edtDebitoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtSaldoKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure Usarcrdito1Click(Sender: TObject);
    procedure Fechajanela1Click(Sender: TObject);
  private
    { Private declarations }
    procedure AtualizaSaldo;
  public
    { Public declarations }
    cdVendedor : Integer;
    Procedure monta_creditos;
  end;

var
  FormCredito: TFormCredito;

implementation

uses MoPreVenda, FrmDesconto;

{$R *.dfm}

procedure TFormCredito.Fechajanela1Click(Sender: TObject);
begin
  close;
end;

procedure TFormCredito.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  if FrmPrincipalPrevenda.Enabled = false then
    FrmPrincipalPrevenda.Enabled := True;
  if FrmPrincipalPrevenda.EdtLancto.Enabled = True then FrmPrincipalPrevenda.EdtLancto.SetFocus;
end;

procedure TFormCredito.FormCreate(Sender: TObject);
begin
  dtInicial.date := date - 730;
  dtfinal.date   := date;
  monta_creditos;
  Application.OnMessage := FrmPrincipalPreVenda.ProcessaMsg;
end;

procedure TFormCredito.monta_creditos;
begin
  with ADOQryConsulta do
  begin
    Sql.Text := 'Select dtdata as Data,dsLancamento as Lancto,vlValorVenda as Valor_Venda,'+
                'vlDesconto as Desconto,vlValor as Valor,                                 '+
                'case dsStatus                                                            '+
                'when ''C'' then ''Crédito''                                              '+
                'when ''D'' then ''Débito''                                               '+
                'End as ''Status''                                                        '+
                'From credito_vendedor WITH (NOLOCK)                                      '+
                'Where cdPessoa = :CDPESSOA and dtdata between :data1 and :data2          ';
    case rgTipo.ItemIndex of
      1: Sql.Add('and dsStatus = ''C'' ');
      2: Sql.Add('and dsStatus = ''D'' ');
    end;
    Sql.Add('Order by sequencial,dtdata desc ');
//    Prepared;
    Parameters.ParamByName('CDPESSOA').Value := cdVendedor;
    Parameters.ParamByName('data1').Value    := dtInicial.date;
    Parameters.ParamByName('data2').Value    := dtFinal.date;
    Open;
    DbGrid1.Columns[0].Width := 80;
    DbGrid1.Columns[1].Width := 80;
    DbGrid1.Columns[2].Width := 80;
    DbGrid1.Columns[3].Width := 80;
    DbGrid1.Columns[4].Width := 80;
    DbGrid1.Columns[4].Font.color  := clRed;
    AtualizaSaldo;
  end;
end;

procedure TFormCredito.dtInicialChange(Sender: TObject);
begin
 monta_creditos;
end;

procedure TFormCredito.dtFinalChange(Sender: TObject);
begin
  monta_creditos;
end;

procedure TFormCredito.RgTipoClick(Sender: TObject);
begin
  monta_creditos;
end;

procedure TFormCredito.dtInicialKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = Char(27) then
  begin   // ESC
    FrmPrincipalPreVenda.Enabled := True;
    if FrmPrincipalPreVenda.EdtLancto.Text = '*' then
      FrmPrincipalPreVenda.EdtLancto.Clear;
    Application.OnMessage := FrmPrincipalPreVenda.ProcessaMsg;
    close;
  end;
end;

procedure TFormCredito.dtFinalKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = Char(27) then
  begin   // ESC
    FrmPrincipalPreVenda.Enabled := True;
    if FrmPrincipalPreVenda.EdtLancto.Text = '*' then
      FrmPrincipalPreVenda.EdtLancto.Clear;
    Application.OnMessage := FrmPrincipalPreVenda.ProcessaMsg;
    close;
  end;
end;

procedure TFormCredito.edtCreditoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = Char(27) then
  begin   // ESC
    FrmPrincipalPreVenda.Enabled := True;
    if FrmPrincipalPreVenda.EdtLancto.Text = '*' then
      FrmPrincipalPreVenda.EdtLancto.Clear;
    Application.OnMessage := FrmPrincipalPreVenda.ProcessaMsg;
    close;
  end;
end;

procedure TFormCredito.edtDebitoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = Char(27) then
  begin   // ESC
    FrmPrincipalPreVenda.Enabled := True;
    if FrmPrincipalPreVenda.EdtLancto.Text = '*' then
      FrmPrincipalPreVenda.EdtLancto.Clear;
    Application.OnMessage := FrmPrincipalPreVenda.ProcessaMsg;
    close;
  end;
end;

procedure TFormCredito.EdtSaldoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = Char(27) then
  begin   // ESC
    FrmPrincipalPreVenda.Enabled := True;
    if FrmPrincipalPreVenda.EdtLancto.Text = '*' then
      FrmPrincipalPreVenda.EdtLancto.Clear;
    Application.OnMessage := FrmPrincipalPreVenda.ProcessaMsg;
    close;
  end;
end;

procedure TFormCredito.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = Char(27) then
  begin // ESC
    FrmPrincipalPreVenda.Enabled := True;
    if FrmPrincipalPreVenda.EdtLancto.Text = '*' then
      FrmPrincipalPreVenda.EdtLancto.Clear;
    Application.OnMessage := FrmPrincipalPreVenda.ProcessaMsg;
    close;
  end;
end;

procedure TFormCredito.AtualizaSaldo;
begin
  with ADOQryCupon do
  begin
    Sql.Text := 'Select Sum(vlValor) as Total From credito_vendedor WITH (NOLOCK) Where dsStatus = ''C'' '+
                'and dtData BETWEEN :dtData1 and :dtData2 and cdPessoa = :CDPESSOA         ';
    Parameters.ParamByName('dtData1').Value := DateToStr(dtInicial.Date);
    Parameters.ParamByName('dtData2').Value := DateToStr(dtFinal.Date);
    Parameters.ParamByName('CDPESSOA').Value := cdVendedor;
    open;
    edtCredito.Text := FormatFloat('0.00',FieldByname('Total').AsFloat);
    Sql.Text := 'Select Sum(vlValor) as Total From credito_vendedor WITH (NOLOCK) Where dsStatus = ''D'' '+
                'and dtData BETWEEN :dtData1 and :dtData2 and cdPessoa = :CDPESSOA         ';
    Parameters.ParamByName('dtData1').Value := DateToStr(dtInicial.Date);
    Parameters.ParamByName('dtData2').Value := DateToStr(dtFinal.Date);
    Parameters.ParamByName('CDPESSOA').Value := cdVendedor;
    open;
    edtDebito.Text := FormatFloat('0.00',FieldByname('Total').AsFloat);
    edtSaldo.Text  := FormatFloat('0.00',(StrToFloat(edtCredito.Text) - StrToFloat(edtDebito.Text)));
  end;
end;

procedure TFormCredito.Usarcrdito1Click(Sender: TObject);
begin
  Application.OnMessage := FrmPrincipalPreVenda.NaoProcessaMsg;
  FormCredito.Enabled := False;
  FormDesconto  := TFormDesconto.Create(Application); // Cria o formulário
  FormDesconto.Show;
  FormDesconto.Height := 182;
  FormDesconto.Width  := 252;
end;

end.

