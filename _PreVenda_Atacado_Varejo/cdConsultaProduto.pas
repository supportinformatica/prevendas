unit cdConsultaProduto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Menus, adodb;

type
  TFrmConsultaProduto = class(TForm)
    Bevel1: TBevel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Pedido: TLabel;
    Estoque: TLabel;
    LblCodigo: TLabel;
    LblBarras: TLabel;
    LblReferencia: TLabel;
    LblDescricao: TLabel;
    LblFabricante: TLabel;
    LblEstoque: TLabel;
    LblControle: TLabel;
    PopupMenu1: TPopupMenu;
    Essc1: TMenuItem;
    Label9: TLabel;
    PnlTotal: TPanel;
    Label10: TLabel;
    LblCompra: TLabel;
    Label20: TLabel;
    lblAquisicao: TLabel;
    Label13: TLabel;
    LblCustoFinalVarejo: TLabel;
    LblCustoFinalAtacao: TLabel;
    Label14: TLabel;
    Label6: TLabel;
    LblValor: TLabel;
    Label1: TLabel;
    lblValorAtacado: TLabel;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsultaProduto: TFrmConsultaProduto;

implementation

uses MoPreVenda, DataModulo;

{$R *.DFM}



procedure TFrmConsultaProduto.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = Char(27) ) then  Close;
end;

procedure TFrmConsultaProduto.FormShow(Sender: TObject);
var qry: TadoQuery;
begin
{  if (UpperCase(vEmpresa) = 'CAMARATUBA')OR(UpperCase(vEmpresa) = 'CARDOSOACESSORIOS') then
  begin //exibe o custo final que esta no cadastro de produto
    qry := TAdoQuery.Create(nil);
    qry.Connection := DModulo.Conexao;
    with qry do
    begin
      sql.Text := 'Select nrCustofinal_v, nrCustofinal_a from produto with (nolock) where cdProduto = :cdProduto';
      parameters.ParamByName('cdProduto').Value := LblCodigo.Caption;
      open;
      LblCustoFinalAtacao.Caption := formatFloat('0.00',FieldByName('nrCustofinal_a').AsFloat);
      LblCustoFinalVarejo.Caption := formatFloat('0.00',FieldByName('nrCustofinal_v').AsFloat);
      close;
    end;
    FreeAndNil(qry);
  end; }
end;

end.
