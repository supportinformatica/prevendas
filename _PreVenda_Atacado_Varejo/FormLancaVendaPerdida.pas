unit FormLancaVendaPerdida;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Data.Win.ADODB,
  Vcl.Menus;

type
  TFrmLancaVendaPerdida = class(TForm)
    Label2: TLabel;
    EdtQtd: TEdit;
    BtnConfirmar: TBitBtn;
    BtnCancelar: TBitBtn;
    GroupBox1: TGroupBox;
    EdtProduto: TEdit;
    Label1: TLabel;
    EdtCdProduto: TEdit;
    Label3: TLabel;
    EdtJustificativa: TEdit;
    Label4: TLabel;
    procedure BtnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnConfirmarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure EdtQtdKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent;
                       cdProduto, nmProduto: String);overload;
  end;

var
  FrmLancaVendaPerdida: TFrmLancaVendaPerdida;

implementation

uses DataModulo, uFuncoesPadrao, MoPreVenda, Produto, NEGProduto;

{$R *.dfm}

procedure TFrmLancaVendaPerdida.BtnCancelarClick(Sender: TObject);
begin
  close;
end;

procedure TFrmLancaVendaPerdida.BtnConfirmarClick(Sender: TObject);
var
  qry: TADOQuery;
  produto : TDOMProduto;
begin
  produto := TNEGProduto.buscarProduto(StrToInt(EdtCdProduto.Text));
  if Frac(StrToFloatDef(EdtQtd.Text,1)) <> 0 then
  begin  // a quantidade está fracionada, logo, termos que testar se o produto esta definido como fracionado
    if not FrmPrincipalPreVenda.validarQuantidadeItemFracionado(produto.unidade.unidade) then
    begin
      Application.OnMessage := FrmPrincipalPreVenda.NaoProcessaMsg;
      ShowMessage('Incompatibilidade na quantidade digitada.  Este ítem não pode ser vendido fracionado!');
      Application.OnMessage := FrmPrincipalPreVenda.ProcessaMsg;
      EdtQtd.SelectAll;
      EdtQtd.SetFocus;
      Exit;
    end;
  end;
  qry := TADOQuery.Create(nil);
  qry.Connection := DModulo.Conexao;
  With qry do begin
    Try
      DModulo.Conexao.BeginTrans;
      Sql.Text := 'Insert Into VendasPerdidas (cdProduto,nrQtd,data,cdPessoa, justificativa) '+
                  'Values (:CODIGO,:QUANTD,:DATA,:CDPESSOA, :justificativa)                   ';
      Parameters.ParamByName('CODIGO').Value   :=  EdtCdProduto.text;
      Parameters.ParamByName('QUANTD').Value   :=  EdtQtd.text;
      Parameters.ParamByName('DATA').Value     :=  vdata_banco;
      Parameters.ParamByName('CDPESSOA').Value :=  FrmPrincipalPreVenda.EdtCdNome.Text;
      Parameters.ParamByName('justificativa').Value := EdtJustificativa.Text;
      ExecSQL;
      DModulo.Conexao.CommitTrans;
      Application.MessageBox('Salvo com sucesso!', 'Informação', MB_OK + MB_ICONINFORMATION + MB_APPLMODAL);
      FrmLancaVendaPerdida.Close;
    Except
      on E: Exception do begin
        DModulo.Conexao.RollbackTrans;
        Salvar_erro(vData_Banco + ' | ' + FrmPrincipalPreVenda.pegaHoraBanco, 'PREVENDA', 'TFrmPrincipalPreVenda.Registraperdadevemdaporestoqueinsuficiente1Click', e.Message, FrmPrincipalPreVenda.EdtLancto.Text);
        Application.MessageBox(PChar('Erro ao salvar! Motivo: '+e.Message), 'Informação', MB_OK + MB_ICONERROR + MB_APPLMODAL);
      end;
    end;  // except
  end;
end;

constructor TFrmLancaVendaPerdida.Create(AOwner: TComponent; cdProduto,
  nmProduto: String);
begin
  inherited Create(AOwner);
  EdtCdProduto.Text := cdProduto;
  EdtProduto.Text := nmProduto;
end;

procedure TFrmLancaVendaPerdida.EdtQtdKeyPress(Sender: TObject; var Key: Char);
begin
  ValidarNumero(key);
end;

procedure TFrmLancaVendaPerdida.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmLancaVendaPerdida.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    close;
end;

end.
