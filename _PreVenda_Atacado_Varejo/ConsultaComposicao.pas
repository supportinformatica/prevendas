unit ConsultaComposicao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids;

type
  TfrmConsultaComposicao = class(TForm)
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    lblNome: TLabel;
    lblCodigo: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    btnFechar: TButton;
    adoConsulta: TADOQuery;
    adoPreVendas: TADOQuery;
    dsConsulta: TDataSource;
    dsPreVendas: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
    codigoProduto : integer;
    procedure ConsultaComposicao(codigoProduto : integer);
    procedure ConsultaPreVendas(codigoProduto : integer);
    procedure AjustarGrid;
  end;

var
  frmConsultaComposicao: TfrmConsultaComposicao;

implementation

{$R *.dfm}

uses DataModulo, uFuncoesPadrao;

procedure TfrmConsultaComposicao.AjustarGrid;
begin
  DBGrid1.Columns.Items[0].Width := 50;
  DBGrid1.Columns.Items[1].Width := 215;
  DBGrid1.Columns.Items[2].Width := 50;
  DBGrid1.Columns.Items[3].Width := 60;
  DBGrid1.Columns.Items[4].Width := 40;
end;

procedure TfrmConsultaComposicao.btnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TfrmConsultaComposicao.ConsultaComposicao(codigoProduto: integer);
begin
  with adoConsulta do begin
    SQl.Text :=
    'DECLARE @CODIGO INT = :CODIGO' + #13#10 +
    'SELECT P.CDPRODUTO Código, P.NMPRODUTO Descrição, P.NRQTDREAL Estoque, SUM(ISNULL(I.NRQTD,0)) +' + #13#10 +
     '(SELECT ISNULL(SUM(ISNULL(F.nrQtd,0) * ISNULL(I.nrQtd,0)),0) FROM IteOrcamento I INNER JOIN Orcamento O ON O.nrOrcamento = I.nrOrcamento AND O.dsImpresso = ''N'' INNER JOIN Formula F ON F.cdProduto = I.cdProduto WHERE cdProdFormula = P.cdProduto ' + ') AS Reservada,' + #13#10 +
    'CASE WHEN FO.nrQtd - (P.NRQTDREAL - SUM(ISNULL(I.NRQTD,0)) -' + #13#10 +
    '(SELECT ISNULL(SUM(ISNULL(F.nrQtd,0) * ISNULL(I.nrQtd,0)),0) FROM IteOrcamento I INNER JOIN Orcamento O ON O.nrOrcamento = I.nrOrcamento AND O.dsImpresso = ''N'' INNER JOIN Formula F ON F.cdProduto = I.cdProduto WHERE cdProdFormula = P.cdProduto ' + ')' + #13#10 +
    ') > 0 THEN (FO.nrQtd - (P.NRQTDREAL - SUM(ISNULL(I.NRQTD,0)) -' + #13#10 +
    '(SELECT ISNULL(SUM(ISNULL(F.nrQtd,0) * ISNULL(I.nrQtd,0)),0) FROM IteOrcamento I INNER JOIN Orcamento O ON O.nrOrcamento = I.nrOrcamento AND O.dsImpresso = ''N'' INNER JOIN Formula F ON F.cdProduto = I.cdProduto WHERE cdProdFormula = P.cdProduto ' + ')' + #13#10 +
    ')) ELSE NULL END Faltam' + #13#10 +
    'FROM FORMULA FO' + #13#10 +
    'INNER JOIN PRODUTO P' + #13#10 +
    'ON FO.CDPRODFORMULA = P.CDPRODUTO' + #13#10 +
    'LEFT JOIN( ITEORCAMENTO I' + #13#10 +
    'INNER JOIN ORCAMENTO O' + #13#10 +
    'ON O.NRORCAMENTO = I.NRORCAMENTO' + #13#10 +
    'AND O.DSIMPRESSO = ''N'')' + #13#10 +
    'ON I.CDPRODUTO = FO.CDPRODFORMULA' + #13#10 +
   'WHERE FO.CDPRODUTO = @CODIGO' + #13#10 +
    'GROUP BY P.CDPRODUTO, P.NMPRODUTO, P.NRQTDREAL, FO.NRQTD' + #13#10 +
    'ORDER BY P.NMPRODUTO';
    Parameters.ParamByName('CODIGO').Value := codigoProduto;
    Open;
  end;
  AjustarGrid;
end;

procedure TfrmConsultaComposicao.ConsultaPreVendas(codigoProduto: integer);
begin
   with adoPreVendas do begin
    SQl.Text :=
    'DECLARE @CODIGO INT = :CODIGO' + #13#10 +
    'SELECT O.nrOrcamento PréVenda, O.dtEmissao Data, sum(i.nrqtd)' + #13#10 +
    'Quantidade' + #13#10 +
    'FROM Orcamento O' + #13#10 +
    'INNER JOIN IteOrcamento I' + #13#10 +
    'ON O.nrOrcamento = I.nrOrcamento' + #13#10 +
    'AND I.cdProduto = @CODIGO' + #13#10 +
    'WHERE O.DSIMPRESSO = ''N''' + #13#10 +
    'GROUP BY O.nrOrcamento, O.dtEmissao' + #13#10 +
    'UNION' + #13#10 +
    'SELECT O.nrOrcamento PréVenda, O.dtEmissao Data, ISNULL(SUM(I.nrQtd),0) * F.NRQTD' + #13#10 +
    'Quantidade' + #13#10 +
    'FROM FORMULA F' + #13#10 +
    'INNER JOIN IteOrcamento I' + #13#10 +
    'ON I.cdProduto = F.cdProduto' + #13#10 +
    'INNER JOIN Orcamento O' + #13#10 +
    'ON O.nrOrcamento = I.nrOrcamento' + #13#10 +
    'AND O.dsImpresso = ''N''' + #13#10 +
    'WHERE F.cdProdFormula = @CODIGO' + #13#10 +
    'GROUP BY O.nrOrcamento, O.dtEmissao, F.NRQTD';
    Parameters.ParamByName('CODIGO').Value := codigoProduto;
    Open;
  end;
end;

procedure TfrmConsultaComposicao.DBGrid1CellClick(Column: TColumn);
begin
  ConsultaPreVendas(adoConsulta.FieldByName('Código').AsInteger);
end;

procedure TfrmConsultaComposicao.FormShow(Sender: TObject);
begin
  ConsultaComposicao(codigoProduto);
  ConsultaPreVendas(adoConsulta.FieldByName('Código').AsInteger);
end;

end.
