unit UfrmCadLista;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, ImgList, ExtCtrls, StdCtrls, Grids, DBGrids, Produto,
  ComCtrls, Buttons, cdConsultaEstoque, Vcl.Imaging.jpeg, System.DateUtils,UItemPrevenda,
  FormRelLivrosFaltamChegar, FormConsultaEscolas, System.ImageList, System.Generics.Collections;
Type
 Tstatus = (Padrao,Novo,Alterar,Baixa,Impressao);
 TipoStatus = Set of Tstatus;
 TAuxDBGrid = class(TDBGrid);

type
  TFrmCadLista = class(TForm)
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
    BtnMdCancelar: TBitBtn;
    PgCtrolMdCadastro: TPageControl;
    TBSheetMdCadastroConsulta: TTabSheet;
    DBGrid1: TDBGrid;
    TBSheetMdCadastroDados: TTabSheet;
    TBSheetMdCdRelatorio: TTabSheet;
    Label3: TLabel;
    DsConsulta: TDataSource;
    ImageCadastro: TImageList;
    ADOQrySalvar: TADOQuery;
    ADOQryAlterar: TADOQuery;
    ADOQryExcluir: TADOQuery;
    ADOQryUltimoCodigo: TADOQuery;
    ADOQryExistir: TADOQuery;
    ADOQryCombFone: TADOQuery;
    ADOQryPegaEstado: TADOQuery;
    ADOQryConsulta: TADOQuery;
    EdtcdLista: TEdit;
    Label1: TLabel;
    BtnExport: TBitBtn;
    ADOQryProduto: TADOQuery;
    DBGrid2: TDBGrid;
    ADOQryItensLista: TADOQuery;
    DataSourceItensLista: TDataSource;
    Bevel4: TBevel;
    btnAtualizar: TBitBtn;
    AdoSerie: TADOQuery;
    GroupBox1: TGroupBox;
    CBxEscola: TComboBox;
    EdtcdEscola: TEdit;
    Label7: TLabel;
    Label6: TLabel;
    CBxSerie: TComboBox;
    EdtcdSerie: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    GroupBox2: TGroupBox;
    edtcdProd: TEdit;
    Label10: TLabel;
    Label4: TLabel;
    Label11: TLabel;
    CBxProduto: TComboBox;
    EdtQtdObj: TEdit;
    GroupBox3: TGroupBox;
    StringGrid1: TStringGrid;
    PnlMdConsulta: TPanel;
    LblMdConsulta: TLabel;
    LblCmbConsulta: TLabel;
    CmbConsulta: TComboBox;
    EdtConsulta: TEdit;
    Panel1: TPanel;
    Image2: TImage;
    Label12: TLabel;
    Panel2: TPanel;
    Image1: TImage;
    Label2: TLabel;
    btnOrcamento: TBitBtn;
    TBSheetMdImpressao: TTabSheet;
    v: TGroupBox;
    CbxPessoa: TComboBox;
    EdtCdPessoa: TEdit;
    Label14: TLabel;
    Label15: TLabel;
    CbxSomenteFalta: TCheckBox;
    ADOQryCliente: TADOQuery;
    EdtPrevenda: TEdit;
    Label5: TLabel;
    Label13: TLabel;
    Label16: TLabel;
    CbxProdutoFiltro: TComboBox;
    edtcdProdFltro: TEdit;
    dtInicial: TDateTimePicker;
    LblPeriodo: TLabel;
    Label18: TLabel;
    dtFinal: TDateTimePicker;
    RgTipoRel: TRadioGroup;
    SgLivros: TStringGrid;
    LblLivros: TLabel;
    CbxAnoFiltro: TComboBox;
    Label19: TLabel;
    AdoQryAno: TADOQuery;
    CbxAno: TComboBox;
    Label20: TLabel;
    EdtApelido: TEdit;
    Label21: TLabel;
    ADOQryItensListaCdObjeto: TIntegerField;
    ADOQryItensListadsObjeto: TStringField;
    ADOQryItensListaqtd: TIntegerField;
    ADOQryItensListanmProduto: TStringField;
    ADOQryItensListaTotal: TBCDField;
    ADOQryItensListacdProduto: TIntegerField;
    ADOQryItensListadsPrateleira: TStringField;
    ADOQryItensListacdFabricante: TStringField;
    ADOQryItensListadsReferencia: TStringField;
    ADOQryItensListavlPreco: TBCDField;
    ADOQryItensListanrQtdReal: TFloatField;
    ADOQryItensListadsUnidade: TStringField;
    CbxForracao: TComboBox;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    CbxFornecedor: TComboBox;
    EdtCdFornecedor: TEdit;
    AdoFornecedor: TADOQuery;
    CbxOrdenar: TComboBox;
    Label26: TLabel;
    CbxExibirProdutos: TCheckBox;
    Label27: TLabel;
    EdtCdListaImpressao: TEdit;
    EdtSequencial: TEdit;
    Label28: TLabel;
    EdtPedido: TEdit;
    Label17: TLabel;
    CbxEscolaFiltro: TComboBox;
    Label25: TLabel;
    CbxSerieFiltro: TComboBox;
    Label29: TLabel;
    CbxFiltrarLivrosSolicitados: TComboBox;
    Label30: TLabel;
    CbxFiltrarRelacaoAlunosPreVenda: TComboBox;
    Label31: TLabel;
    EdtObs: TEdit;
    Label32: TLabel;
    RgData: TRadioGroup;
    LblListados: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure PgCtrolMdCadastroChange(Sender: TObject);
    procedure BtnMdNovoClick(Sender: TObject);
    procedure BtnMdAlterarClick(Sender: TObject);
    procedure BtnMdExcluirClick(Sender: TObject);
    procedure BtnMdSairClick(Sender: TObject);
    procedure BtnMdPrimeiroClick(Sender: TObject);
    procedure BtnMdProximoClick(Sender: TObject);
    procedure BtnMdUltimoClick(Sender: TObject);
    procedure BtnMdAnteriorClick(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StringGrid1DblClick(Sender: TObject);
    procedure EdtQtdObjExit(Sender: TObject);
    procedure CBxEscolaChange(Sender: TObject);
    procedure CBxSerieChange(Sender: TObject);
    procedure CBxProdutoChange(Sender: TObject);
    procedure BtnMdSalvarClick(Sender: TObject);
    procedure BtnMdCancelarClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure EdtConsultaChange(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TBSheetMdCadastroConsultaEnter(Sender: TObject);
    procedure BtnExportClick(Sender: TObject);
    procedure TBSheetMdCadastroConsultaShow(Sender: TObject);
    procedure edtcdProdChange(Sender: TObject);
    procedure CBxProdutoExit(Sender: TObject);
    procedure edtcdProdKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure EdtConsultaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BtnMdImprimirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOrcamentoClick(Sender: TObject);
    procedure CbxPessoaChange(Sender: TObject);
    procedure CbxProdutoFiltroChange(Sender: TObject);
    procedure SgLivrosExit(Sender: TObject);
    procedure RgTipoRelClick(Sender: TObject);
    procedure EdtPrevendaChange(Sender: TObject);
    procedure CbxAnoFiltroChange(Sender: TObject);
    procedure CbxForracaoExit(Sender: TObject);
    procedure CbxForracaoEnter(Sender: TObject);
    procedure CbxFornecedorChange(Sender: TObject);
    procedure EdtCdListaImpressaoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCdListaImpressaoExit(Sender: TObject);
    procedure EdtCdListaImpressaoEnter(Sender: TObject);
    procedure EdtSequencialEnter(Sender: TObject);
    procedure EdtSequencialExit(Sender: TObject);
    procedure EdtCdPessoaExit(Sender: TObject);
    procedure edtcdProdFltroExit(Sender: TObject);
    procedure EdtCdFornecedorExit(Sender: TObject);
    procedure EdtApelidoEnter(Sender: TObject);
    procedure EdtApelidoExit(Sender: TObject);
    procedure CbxPessoaExit(Sender: TObject);
    procedure dtInicialChange(Sender: TObject);
    procedure dtFinalChange(Sender: TObject);
    procedure EdtPrevendaExit(Sender: TObject);
    procedure CbxEscolaFiltroChange(Sender: TObject);
    procedure EdtObsExit(Sender: TObject);
    procedure EdtObsEnter(Sender: TObject);
    procedure edtcdProdFltroKeyPress(Sender: TObject; var Key: Char);
    procedure edtcdProdExit(Sender: TObject);
    procedure RgDataClick(Sender: TObject);
  private
    procedure AtivaCampos;
    procedure DesativaCampos;
    procedure AtualizaQryConsulta;
    procedure AtualizaCampos;
    procedure montaritens;
    Procedure TrataBotoesPadrao (Sender :TObject; Status :TStatus);
    procedure montaComboProdutos;
    procedure MontaComboCliente;
    procedure MontaComboEscola;
    procedure MontaComboSerie;
    procedure MontaComboSerieFiltro;
    procedure MontaComboFornecedor;
    procedure MontaComboAnoExercicio;
    procedure ImprimeRelatorioLivrosSolicitadosAChegar;
    procedure ImprimeRelatorioAlunosResumido;
    procedure ImprimeRelatorioLivrosPorAluno;
    procedure BuscaLivrosAluno;
    procedure BuscaUltimoCodigoCdLista;
    procedure LimpaCamposImpressao;
    function BuscaOrcamentosVinculadosAoPedidoDeCompra: String;
    function VerificaSeExisteMaisDeUmaLista(nrOrcamento:string; cdPessoa: string):Boolean;
    procedure ContabilizaLivros;
  public
      Vform:string;
      Status: TipoStatus;         // Padrao,Novo ou Alterar
      tipoForracaoAnterior: string;
      cdListaAnterior: String;
      nrSequencialAnterior: String;
      obsAnterior: String;
      apelidoAnterior: String;
  end;

var
  FrmCadLista: TFrmCadLista;

implementation

uses uFuncoesPadrao, DataModulo, RelOrcamentoLista, FrmPrincipal, BuscaObjetos,
  NEGProduto,
  FormRelAlunosLivros, DOMEscola, DOMSerieEscolar, NEGEscola, NEGSerieEscolar,
  MoPreVenda;

{$R *.dfm}

Procedure TFrmCadLista.TrataBotoesPadrao( Sender: TObject; Status: TStatus);
begin
  Case Status of
    Padrao :
    begin
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
    Novo :
    begin
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
    Alterar :
    Begin
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
    Baixa:
    begin
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
    Impressao:
    begin
      BtnMdImprimir.Enabled := true;
      BtnMdNovo.Enabled := False;
      BtnMdAlterar.Enabled := False;
      BtnMdExcluir.Enabled := False;
      BtnMdPrimeiro.Enabled := False;
      BtnMdProximo.Enabled := False;
      BtnMdAnterior.Enabled := False;
      BtnMdUltimo.Enabled := False;
      BtnMdSalvar.Enabled := False;
      BtnMdCancelar.Enabled := False;
    end;
  end; //case
end;
function TFrmCadLista.VerificaSeExisteMaisDeUmaLista(
  nrOrcamento: string; cdPessoa: string): Boolean;
var qry: TADOQuery;
begin
  qry:= TADOQuery.Create(nil);
  qry.Connection := DModulo.Conexao;
  with qry do
  begin
    sql.Text :=
    'select distinct O.nrOrcamentoDia from orcamento O with(nolock) '+
    'WHERE O.dsImpresso = ''S'' and O.nrOrcamento >= 448290         '+
    'and O.dtEmissao between :dt1 and :dt2                          '+
    'and O.nrOrcamentoDia is not null ';
    Parameters.ParamByName('dt1').Value := DateOf(dtInicial.Date);
    Parameters.ParamByName('dt2').Value := DateOf(dtFinal.Date);
    if cdPessoa <> '' then
    begin
      sql.add('and O.cdCliente = :cdPessoa ');
      Parameters.ParamByName('cdPessoa').Value := cdPessoa;
    end;
    if nrOrcamento <> '' then
    begin
      sql.add('and O.nrOrcamento = :nrOrcamento ');
      Parameters.ParamByName('nrOrcamento').Value := nrOrcamento;
    end;
    open;
    result := RecordCount > 1;
    Close;
  end;
  FreeAndNil(qry);
end;

procedure TFrmCadLista.AtivaCampos;
begin
   CBxEscola.Enabled     :=True;
   CBxSerie.Enabled      :=True;
   EdtQtdObj.Enabled     :=True;
   EdtcdEscola.Enabled   :=True;
   EdtcdSerie.Enabled    :=True;
   edtcdProd.Enabled     :=True;
   StringGrid1.Enabled   :=True;
end;

procedure TFrmCadLista.DesativaCampos;
begin
   CBxEscola.Enabled     :=False;
   CBxSerie.Enabled      :=False;
   CBxProduto.Enabled    :=False;
   EdtQtdObj.Enabled     :=False;
   EdtcdEscola.Enabled   :=False;
   EdtcdSerie.Enabled    :=False;
   edtcdProd.Enabled     :=False;
   StringGrid1.Enabled   :=False;
end;

procedure TFrmCadLista.dtFinalChange(Sender: TObject);
begin
  case RgTipoRel.ItemIndex of
    2: BuscaLivrosAluno;
  end;
end;

procedure TFrmCadLista.dtInicialChange(Sender: TObject);
begin
  case RgTipoRel.ItemIndex of
    2: BuscaLivrosAluno;
  end;
end;

procedure TFrmCadLista.EdtApelidoEnter(Sender: TObject);
begin
  apelidoAnterior := EdtApelido.Text;
end;

procedure TFrmCadLista.EdtApelidoExit(Sender: TObject);
var qry: TADOQuery;
begin
  if (EdtApelido.Text <> '') and (EdtCdPessoa.Text <> '') then
  begin
    if apelidoAnterior <> EdtApelido.Text then
    begin
      if Application.MessageBox('Confirma a alteração do apelido?',
          'Confirmação',MB_YESNO + MB_ICONQUESTION + MB_APPLMODAL) = ID_YES then begin
        qry := TAdoQuery.Create(nil);
        qry.connection := DModulo.Conexao;
        with qry do
        begin
          sql.text := 'update P_Fisica set dsNaturalidade = :apelido where cdPessoa = :cdPessoa ';
          Parameters.ParamByName('apelido').Value := EdtApelido.Text;
          Parameters.ParamByName('cdPessoa').Value := EdtCdPessoa.Text;
          ExecSQL;

          sql.text := 'update P_Juridica set nmContato = :apelido where cdPessoa = :cdPessoa ';
          Parameters.ParamByName('apelido').Value := EdtApelido.Text;
          Parameters.ParamByName('cdPessoa').Value := EdtCdPessoa.Text;
          ExecSQL;
        end;
        apelidoAnterior := '';
      end;
    end;
  end;
end;

procedure TFrmCadLista.EdtCdFornecedorExit(Sender: TObject);
begin
  if (EdtCdFornecedor.Text <> '') then
  begin
    AdoFornecedor.Open;
    AdoFornecedor.Locate('cdPessoa',EdtCdFornecedor.Text,[]);
    CbxFornecedor.Text := AdoFornecedor.FieldByName('nmPessoa').AsString;
  end
  else
    CbxFornecedor.Text := '';
end;

procedure TFrmCadLista.EdtCdListaImpressaoEnter(Sender: TObject);
begin
  cdListaAnterior := EdtCdListaImpressao.Text;
end;

procedure TFrmCadLista.EdtCdListaImpressaoExit(Sender: TObject);
var qry: TADOQuery;
begin
  if (EdtCdListaImpressao.Text <> '') and (EdtPrevenda.Text <> '') then
  begin
    if cdListaAnterior <> EdtCdListaImpressao.Text then
    begin
      if Application.MessageBox('Confirma a alteração da lista (Escola e Série)?',
          'Confirmação',MB_YESNO + MB_ICONQUESTION + MB_APPLMODAL) = ID_YES then
      begin
        qry := TAdoQuery.Create(nil);
        qry.connection := DModulo.Conexao;
        with qry do
        begin
          sql.text :=
          'update orcamento set cdLista = :cdLista '+
          'where nrOrcamento = :nrOrcamento        ';
          parameters.ParamByName('nrOrcamento').Value := EdtPrevenda.Text;
          parameters.ParamByName('cdLista').Value := EdtCdListaImpressao.Text;
          ExecSQL;
        end;
        cdListaAnterior := '';
      end;
    end;
  end;
end;

procedure TFrmCadLista.EdtCdListaImpressaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #42 then
  begin
    FrmConsultaEscolas := TFrmConsultaEscolas.Create(Application);
    FrmConsultaEscolas.ShowModal;
  end;
end;

procedure TFrmCadLista.EdtCdPessoaExit(Sender: TObject);
begin
  if (EdtCdPessoa.Text <> '') then
  begin
    ADOQryCliente.Open;
    ADOQryCliente.Locate('cdPessoa',EdtCdPessoa.Text,[]);
    CbxPessoa.Text :=ADOQryCliente.FieldByName('nmPessoa').AsString;
  end else
  begin
    CbxPessoa.Text := '';
  end;
  BuscaLivrosAluno;
end;

procedure TFrmCadLista.AtualizaQryConsulta;
begin
  With AdoQryConsulta do
  Begin
    SQL.Text :=
    'Select E.cdEscola,E.dsEscola as Escola,S.cdSerie as cdSerie,S.dsSerie as Serie,                      '+
    'L.cdLista,year(L.Ano) as Ano From ListaEscolar L with(nolock) Inner Join SerieEscolar S with(nolock) '+
    'on L.cdSerie = S.cdSerie left join Escola E with(nolock) on L.cdEscola = E.cdEscola                  '+
    'where year(L.ano) = :anoExercicio ';
    Parameters.ParamByName('anoExercicio').Value := CbxAnoFiltro.Text;
    case CmbConsulta.ItemIndex of
      1: begin              // por codigo
        Sql.Add('and L.CdLista Like '''+EdtConsulta.Text+'%'' ');
      end; // 1
      2: begin              // por nome do cliente
        Sql.Add('and E.DsEscola Like '''+EdtConsulta.Text+'%'' ');
      end;  // 2
      3:begin
        SQL.Add('and S.DsSerie Like '''+EdtConsulta.Text+'%'' ');
      end;
    end;  //case
    sql.Add('order by 2,4');
    Open;
  end; // with
end;

procedure TFrmCadLista.btnAtualizarClick(Sender: TObject);
begin
  ADOQryProduto.Active := False;
  montaComboProdutos;
end;

procedure TFrmCadLista.montaritens;
var i: integer;
begin
  Limpa_Grid(StringGrid1);
  with ADOQryItensLista do
  begin
    sql.text :=
    'Select I.CdObjeto,I.dsObjeto,I.qtd,P.nmProduto,i.qtd * P.vlPreco as Total, '+
    'P.cdProduto,P.dsPrateleira,P.cdFabricante,P.dsReferencia,P.vlPreco,        '+
    'P.nrQtdReal, P.dsUnidade from ItensLista I with(nolock)                    '+
    'inner Join Produto P with(nolock) on I.cdObjeto = P.cdproduto              '+
    'where I.cdLista = :param                                                                                                                                  ';
    Parameters.ParamByName('param').value :=DBGrid1.Fields[0].Value;
    Open;
    for i:=1 to ADOQryItensLista.RecordCount do
    begin
      with StringGrid1 do
      begin
        StringGrid1.Cells[0,i] := ADOQryItensLista.FieldByName('cdObjeto').AsString;
        StringGrid1.Cells[1,i] := ADOQryItensLista.FieldByName('dsObjeto').AsString;
        StringGrid1.Cells[2,i] := ADOQryItensLista.FieldByName('qtd').AsString;
        StringGrid1.Cells[3,i] := FormatFloat('0.00',ADOQryItensLista.FieldByName('vlPreco').AsFloat);
        RowCount := RowCount + 1;
        ADOQryItensLista.Next;
      end;
    end;
    ContabilizaLivros;
  end;
end;

procedure TFrmCadLista.AtualizaCampos;
var
  i,l:Integer;
begin
  With AdoQryConsulta do
  begin                // move os campos para os componentes
    if AdoQryConsulta.RecordCount = 0 then
    begin
      LimpaTodosCampos(TbSheetMdCadastroDados);
      Limpa_Grid(StringGrid1);
      CBxEscola.text:='';
      CBxSerie.text:='';
      exit;
    end;
    EdtcdLista.Text  := AdoQryConsulta.FieldByName('cdLista').AsString;
    CBxEscola.Text   := AdoQryConsulta.FieldByName('Escola').AsString;
    EdtcdEscola.Text := AdoQryConsulta.FieldByName('cdEscola').AsString;
    CBxSerie.Text    := AdoQryConsulta.FieldByName('Serie').AsString;
    EdtcdSerie.Text  := AdoQryConsulta.FieldByName('cdSerie').AsString;
    CbxAno.Text      := IntToStr(AdoQryConsulta.FieldByName('ano').asInteger);//FormatDateTime('yyyy', AdoQryConsulta.FieldByName('ano').AsDateTime);
    montaritens;
  end;
end;

procedure TFrmCadLista.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FrmPrincipalPreVenda.CadastrodeLista1.enabled := TRUE;
  Action :=cafree;
end;

procedure TFrmCadLista.FormCreate(Sender: TObject);
begin
  MontaComboSerie;
  MontaComboEscola;
  MontaComboAnoExercicio;
  with StringGrid1 do
  begin
    Cells[0,0] := 'Código ';
    Cells[1,0] := 'Descrição';
    Cells[2,0] := 'QTD';
    Cells[3,0] := 'Preço';
  end;
  with SgLivros do
  begin
    Cells[0,0]   := 'Livro';
    Cells[1,0]   := 'Observação';
    Cells[2,0]   := 'cdIteLcto';
    Cells[3,0]   := 'nrOrcamento';
    ColWidths[2] := -1;
    ColWidths[3] := -1;
  end;
  With CmbConsulta do
  begin  // adiciona itens a combo de consulta
    Items.Clear;
    Items.Add('Todos');
    Items.Add('Código');
    Items.Add('Escola');
    Items.Add('Série');
    ItemIndex := 0;
  end;
  PgCtrolMdCadastro.ActivePageIndex := 0;
  CbxAnoFiltro.ItemIndex := CbxAnoFiltro.Items.Count - 1;
  AtualizaQryConsulta;
  montaritens;
  MontaComboCliente;
  MontaComboFornecedor;
  DesativaCampos;
  dtInicial.Date := Strtodate('05/12/2017');
  dtFinal.Date   := Date;
end;

procedure TFrmCadLista.FormShow(Sender: TObject);
begin
  CmbConsulta.ItemIndex := 2;
  EdtConsulta.SetFocus;
end;

procedure TFrmCadLista.ImprimeRelatorioAlunosResumido;
var cdEscola,cdSerie: string;
begin
  FrmRelAlunosLivros := TFrmRelAlunosLivros.Create(Self); // Cria o formulário
 // FrmRelAlunosLivros.QRLblTitulo.Caption := 'Relação de Alunos e tipos de forros solicitados';
  FrmRelAlunosLivros.QrlPeriodo.Caption := 'De '+datetostr(dtInicial.Date)+' a '+datetostr(dtFinal.Date);
  With FrmRelAlunosLivros.ADOQryRelDados do
  begin // monta a query para a impressao do orcamento
    sql.Text := 'select distinct O.nrOrcamento, O.tipoForracao, O.dtEmissao,             '+
                'O.cdCliente, P.nmPessoa, E.DsEscola, S.dsSerie, O.nrOrcamentoDia,       '+
                'case when (select count(1) from parcela Par inner join lancto Lct on    '+
                '    Par.dsLancamento = Lct.dsLancamento and Par.cdPessoa = Lct.cdPessoa '+
                '    and Par.dsStatus = Lct.dsStatus where Par.dslancamento =            '+
                '             O.dslancamento_1 and Par.cdPessoa = O.cdCliente            '+
                '           and Par.dtpagamento is null and lct.cdConvenio is null       '+
                '           and Lct.dsstatus IN (''E'',''X'',''F'')  )                   '+
                '           > 0 then ''NÃO PAGA''                                        '+
                '           ELSE ''PAGA''                                                '+
                'END as statusPagamento                                                  '+
                'from orcamento O with(nolock) inner join Pessoa P with(nolock) on O.cdCliente = P.cdPessoa '+
                'inner join IteOrcamento I with(nolock) on O.nrOrcamento = I.nrOrcamento              '+
                'inner join Produto PR with(nolock) on I.cdProduto = PR.cdProduto and PR.cdGrupo = 19 '+
                'left join ListaEscolar L with(nolock) on O.cdLista = L.CdLista   '+
                'left join SerieEscolar S with(nolock) on L.cdSerie = S.cdSerie   '+
                'left join Escola E with(nolock) on L.CdEscola = E.CdEscola       '+
                'left join P_Fisica PF with(nolock) on PF.cdPessoa = P.cdPessoa   '+
                'left join P_Juridica PJ with(nolock) on PJ.cdPessoa = P.cdPessoa '+
                'where O.dsImpresso = ''S'' and O.nrOrcamento >= 448290           '+
                'and O.dtEmissao between :dt1 and :dt2                            ';
    Parameters.ParamByName('dt1').Value := dateOf(dtInicial.Date);
    Parameters.ParamByName('dt2').Value := dateOf(dtFinal.Date);
    if EdtCdPessoa.Text <> '' then
    begin
      sql.Add('and O.cdCliente = :cdCliente ');
      Parameters.ParamByName('cdCliente').Value := EdtCdPessoa.Text;
    end;
    if Trim(EdtPrevenda.Text) <> '' then
    begin
      sql.Add('and O.nrOrcamento = :nrOrcamento ');
      Parameters.ParamByName('nrOrcamento').Value := EdtPrevenda.Text;
    end;
    if Trim(EdtApelido.Text) <> '' then
    begin
      sql.add('and (case when (P.Existir = ''F'') then PF.dsNaturalidade      ');
      sql.add('when (P.Existir = ''J'') then PJ.nmContato end ) like :apelido ');
      Parameters.ParamByName('apelido').Value := '%'+EdtApelido.Text+'%';
    end;
    cdEscola := copy_campo(CbxEscolaFiltro.Text,'|',2);
    if cdEscola <> '' then
    begin
      sql.Add('and L.cdEscola = :cdEscola ');
      Parameters.ParamByName('cdEscola').Value := cdEscola;
    end;
    cdSerie  := copy_campo(CbxSerieFiltro.Text,'|',2);
    if cdSerie <> '' then
    begin
      sql.Add('and L.cdSerie = :cdSerie ');
      Parameters.ParamByName('cdSerie').Value := cdSerie;
    end;

    case CbxFiltrarRelacaoAlunosPreVenda.ItemIndex of
      0: FrmRelAlunosLivros.QRLblTitulo.Caption := 'Relação de alunos com Pré-vendas Pagas e Não Pagas';
      1:begin
        FrmRelAlunosLivros.QRLblTitulo.Caption := 'Relação de alunos com Pré-vendas Pagas';
        sql.Add('and (select count(1) from parcela par inner join lancto lct on par.dslancamento = lct.dsLancamento and par.dsStatus = lct.dsStatus and par.cdPessoa = lct.cdPessoa where par.dslancamento = O.dslancamento_1 and par.cdPessoa = O.cdCliente ');
        sql.Add(' and par.dtpagamento is null and lct.cdConvenio is null and Lct.dsstatus IN (''E'',''X'',''F'') ) = 0 '); //pagas;
      end;
      2: begin
        FrmRelAlunosLivros.QRLblTitulo.Caption := 'Relação de alunos com Pré-vendas Não Pagas';
        sql.Add('and (select count(1) from parcela par inner join lancto lct on par.dslancamento = lct.dsLancamento and par.dsStatus = lct.dsStatus and par.cdPessoa = lct.cdPessoa where par.dslancamento = O.dslancamento_1 and par.cdPessoa = O.cdCliente ');
        sql.Add(' and par.dtpagamento is null and lct.cdConvenio is null and Lct.dsstatus IN (''E'',''X'',''F'') ) > 0 '); //não pagas;
      end;
    end;

    case CbxOrdenar.ItemIndex of
      0: sql.Add('order by O.nrOrcamentoDia '); //Sequencial
      1: sql.Add('order by P.nmPessoa '); //Cliente
      2: sql.Add('order by O.nrOrcamento '); //Prevenda
      4: sql.Add('order by S.dsSerie '); //Série
      //  3: sql.Add('order by PR.nmProduto '); //produto
    end;
//    sql.add('order by 5');
    Open;
  end;
  if FrmRelAlunosLivros.ADOQryRelDados.RecordCount = 0 then
  begin
    Application.MessageBox('Nenhum dado encontrado de acordo com os filtros!','Atenção', MB_OK + MB_ICONWARNING + MB_APPLMODAL);
    exit;
  end;
  FrmRelAlunosLivros.QRMdRel.PreviewModal;
  FrmRelAlunosLivros.Free;
end;

procedure TFrmCadLista.ImprimeRelatorioLivrosPorAluno;
begin
  if (EdtCdPessoa.Text = '') and (trim(EdtPrevenda.text) = '') then
  begin
    Application.MessageBox('Selecione um aluno ou digite o numero da pré-venda!','Atenção', mb_ok + MB_ICONWARNING + MB_APPLMODAL);
    CbxPessoa.SetFocus;
    Exit;
  end;

  FrmRelAlunosLivros := TFrmRelAlunosLivros.Create(Self); // Cria o formulário
  FrmRelAlunosLivros.QRLblTitulo.Caption := 'Relação de Livros';
  FrmRelAlunosLivros.QrlPeriodo.Caption := 'De '+datetostr(dtInicial.Date)+' a '+datetostr(dtFinal.Date);
  With FrmRelAlunosLivros.ADOQryRelDados do
  begin // monta a query para a impressao do orcamento
    sql.Text := 'SELECT distinct O.nrOrcamento, O.dtEmissao, O.cdCliente,                '+
                'E.DsEscola,Editora.nmPessoa as nomeEditora,                             '+
                'P.nmPessoa as nomeCliente,It.observacao,                                '+
                'S.dsSerie AS SERIE,PR.cdPessoa_1 AS cdEditora,                          '+
                'O.tipoForracao,O.nrOrcamentoDia, P.Existir,                             '+
                'CASE WHEN IT.Recebido >= IT.nrQtd THEN ''SIM''                          '+
                '                                  ELSE ''NAO'' END AS ATENDIDO,         '+
                'PR.nmproduto AS TITULO, Pr.cdProduto,                                   '+
                'case when (P.Existir = ''F'') then PF.dsNaturalidade                    '+
                '     when (P.Existir = ''J'') then PJ.nmContato                         '+
                'End as Apelido, cast(M.dsMemo as varchar(400))as dsMemo,                '+
                'CASE WHEN IT.recebido < IT.nrQtd THEN '' ''                             '+
                'ELSE convert(nvarchar(MAX), PC.dtchegada, 103) END AS dtchegada,        '+
                'case when (select count(1) from parcela Par inner join lancto Lct on    '+
                '    Par.dsLancamento = Lct.dsLancamento and Par.cdPessoa = Lct.cdPessoa '+
                '    and Par.dsStatus = Lct.dsStatus where Par.dslancamento =            '+
                '             O.dslancamento_1 and Par.cdPessoa = O.cdCliente            '+
                '           and Par.dtpagamento is null and lct.cdConvenio is null       '+
                '           and Lct.dsstatus IN (''E'',''X'',''F'')  )                   '+
                '           > 0 then ''NÃO PAGA''                                        '+
                '           ELSE ''PAGA''                                                '+
                'END as statusPagamento                                                  '+
                'FROM Orcamento O with(nolock)                                           '+
                'INNER JOIN IteOrcamento IT with(nolock)                                 '+
                'ON IT.nrOrcamento = O.nrOrcamento                                       '+
                'INNER JOIN PRODUTO PR with(nolock)                                      '+
                'ON PR.cdProduto = IT.cdProduto and PR.cdGrupo = 19                      '+
                'INNER JOIN PESSOA P with(nolock)                                        '+
                'ON P.cdPessoa = O.cdCliente                                             '+
                'left JOIN ListaEscolar L with(nolock)                                   '+
                'ON L.cdLista = O.cdLista                                                '+
                'left JOIN SerieEscolar S with(nolock)                                   '+
                'ON S.cdSerie = L.cdSerie                                                '+
                'left join Escola E with(nolock) on L.CdEscola = E.CdEscola                 '+
                'inner join Pessoa Editora with(nolock) on Editora.cdPessoa = Pr.cdPessoa_1 '+
                'left join P_Fisica PF with(nolock) on PF.cdPessoa = P.cdPessoa          '+
                'left join P_Juridica PJ with(nolock) on PJ.cdPessoa = P.cdPessoa        '+
                'left join LivroPedido LP with(nolock) on LP.nrOrcamento = O.nrOrcamento '+
                '                             and LP.cdProduto = PR.cdProduto            '+
                'left join PedidoCompra PC with(nolock) on LP.nrLancto = PC.nrLancto     '+
                'left join MemoOrcamento M with(nolock) on O.nrOrcamento = M.nrOrcamento '+
                'WHERE O.dsImpresso = ''S'' and O.nrOrcamento >= 448290                  '+
                'and O.dtEmissao between :dt1 and :dt2                                   ';
    Parameters.ParamByName('dt1').Value := DateOf(dtInicial.Date);
    Parameters.ParamByName('dt2').Value := DateOf(dtFinal.Date);
    if EdtCdPessoa.Text <> '' then
    begin
      sql.Add('and O.cdCliente = :cdCliente ');
      Parameters.ParamByName('cdCliente').Value := EdtCdPessoa.Text;
    end;
    if Trim(EdtPrevenda.Text) <> '' then
    begin
      sql.Add('and O.nrOrcamento = :nrOrcamento ');
      Parameters.ParamByName('nrOrcamento').Value := EdtPrevenda.Text;
    end;
    if Trim(EdtApelido.Text) <> '' then
    begin
      sql.add('and (case when (P.Existir = ''F'') then PF.dsNaturalidade      ');
      sql.add('when (P.Existir = ''J'') then PJ.nmContato end ) like :apelido ');
      Parameters.ParamByName('apelido').Value := '%'+EdtApelido.Text+'%';
    end;
    sql.add('order by 4 desc,O.nrOrcamentoDia, PR.nmproduto');
    Open;
  end;
  if FrmRelAlunosLivros.ADOQryRelDados.RecordCount = 0 then
  begin
    Application.MessageBox('Nenhum dado encontrado de acordo com os filtros!','Atenção', MB_OK + MB_ICONWARNING + MB_APPLMODAL);
    exit;
  end;
  if VerificaSeExisteMaisDeUmaLista(EdtPrevenda.Text,EdtCdPessoa.Text) then
    Application.MessageBox('Existe mais de uma lista.','Atenção', MB_OK + MB_ICONINFORMATION + MB_APPLMODAL);
  FrmRelAlunosLivros.QrMDRelCompleto.PreviewModal;
  FrmRelAlunosLivros.Free;
end;

procedure TFrmCadLista.ImprimeRelatorioLivrosSolicitadosAChegar;
var cdEscola,cdSerie: String;
begin
  FrmRelLivrosFaltamChegar := TFrmRelLivrosFaltamChegar.Create(self);
  FrmRelLivrosFaltamChegar.QrlPeriodo.Caption := 'De '+datetostr(dtInicial.Date)+' a '+datetostr(dtFinal.Date);
  With FrmRelLivrosFaltamChegar.ADOQryRelDados do
  begin // monta a query para a impressao do orcamento
    sql.Text :=
    'select DISTINCT O.nrOrcamento, O.dtemissao as dtEmissao, O.tipoForracao, P.cdProduto,'+
    'P.nmProduto,PE.cdPessoa, PE.nmPessoa, dbo.TELEFONES(PE.cdPessoa) as tels,            '+
    'case when (PE.Existir = ''F'') then PF.dsNaturalidade                                '+
    '     when (PE.Existir = ''J'') then PJ.nmContato End as Apelido,                     '+
    'O.nrOrcamentoDia,(I.nrQtd) as qtdPrevenda,                                           '+
    'case when O.cdTurno = 1 then ''M''                                                   '+
    '     when O.cdTurno = 2 then ''T''                                                   '+
    '     when O.cdTurno = 3 then ''N''                                                   '+
    '     else '''' end as Turno                                                          '+
    'from Orcamento O with(nolock) inner join IteOrcamento I with(nolock) on O.nrOrcamento = I.nrOrcamento '+
    'left join LivroPedido L with(nolock) on L.nrOrcamento = O.nrOrcamento and I.cdProduto = L.cdProduto   '+
    'left join PedidoCompra PC with(nolock) on L.nrLancto = PC.nrLancto                '+
    'inner join Pessoa PE with(nolock) on O.cdCliente = PE.cdPessoa                    '+
    'INNER JOIN Produto P with(nolock) ON I.cdProduto = P.cdProduto and P.cdGrupo = 19 '+
    'INNER JOIN Pessoa Fornecedor with(nolock) ON P.cdPessoa = Fornecedor.cdPessoa     '+
    'left join P_Fisica PF with(nolock) on PF.cdPessoa = PE.cdPessoa                   '+
    'left join P_Juridica PJ with(nolock) on PJ.cdPessoa = Pe.cdPessoa                 '+
    'left join ListaEscolar LI with(nolock) on O.cdLista = LI.CdLista                  '+
    'left join SerieEscolar S with(nolock) on LI.cdSerie = S.cdSerie                   '+
    'left join Escola E with(nolock) on LI.CdEscola = E.CdEscola                       '+
    'where O.nrOrcamento >= 448290 and O.dsImpresso <> ''O'' ';
    if CbxFiltrarLivrosSolicitados.ItemIndex <> 3 then
      sql.Add('AND O.dsImpresso = ''S'' ');
    case RgData.ItemIndex of
      0:
      begin
        sql.Add('and O.dtEmissao between :dt1 and :dt2 ');
        Parameters.ParamByName('dt1').Value := dateOf(dtInicial.Date);
        Parameters.ParamByName('dt2').Value := dateOf(dtFinal.Date + 1);
      end;
      1:
      begin
        sql.Add('and PC.dtchegada between :dt1 and :dt2 ');
        Parameters.ParamByName('dt1').Value := dateOf(dtInicial.Date);
        Parameters.ParamByName('dt2').Value := dateOf(dtFinal.Date);
      end;
    end;
    if EdtCdPessoa.Text <> '' then
    begin
      sql.Add('and O.cdCliente = :cdCliente ');
      Parameters.ParamByName('cdCliente').Value := EdtCdPessoa.Text;
    end;
    if edtcdProdFltro.Text <> '' then
    begin
      sql.Add('and I.cdProduto = :cdProduto ');
      Parameters.ParamByName('cdProduto').Value := edtcdProdFltro.Text;
    end;
    if Trim(EdtPrevenda.Text) <> '' then
    begin
      sql.Add('and O.nrOrcamento = :nrOrcamento ');
      Parameters.ParamByName('nrOrcamento').Value := EdtPrevenda.Text;
    end;
    if Trim(EdtCdFornecedor.Text) <> '' then
    begin
      sql.Add('and Fornecedor.cdPessoa = :cdPessoa ');
      Parameters.ParamByName('cdPessoa').Value := EdtCdFornecedor.Text;
    end;
    if Trim(EdtApelido.Text) <> '' then
    begin
      sql.add('and (case when (PE.Existir = ''F'') then PF.dsNaturalidade      ');
      sql.add('when (PE.Existir = ''J'') then PJ.nmContato end ) like :apelido ');
      Parameters.ParamByName('apelido').Value := '%'+EdtApelido.Text+'%';
    end;
    if Trim(EdtPedido.Text) <> '' then
    begin
      sql.Add('and L.nrLancto = :nrLancto ');
      Parameters.ParamByName('nrLancto').Value := EdtPedido.Text;
    end;
    cdEscola := copy_campo(CbxEscolaFiltro.Text,'|',2);
    if cdEscola <> '' then
    begin
      sql.Add('and LI.cdEscola = :cdEscola ');
      Parameters.ParamByName('cdEscola').Value := cdEscola;
    end;
    cdSerie  := copy_campo(CbxSerieFiltro.Text,'|',2);
    if cdSerie <> '' then
    begin
      sql.Add('and LI.cdSerie = :cdSerie ');
      Parameters.ParamByName('cdSerie').Value := cdSerie;
    end;
    case CbxFiltrarLivrosSolicitados.ItemIndex of
      0: FrmRelLivrosFaltamChegar.QRLblTitulo.Caption := 'Relatório de Livros solicitados nos pedidos de compras pagos';
      1:
      begin
        FrmRelLivrosFaltamChegar.QRLblTitulo.Caption := 'Relatório de Livros solicitados nos pedidos de compras pagos que Chegaram';
        sql.Add('and ((select isnull(sum(I.nrQtd),0) as Solicitado ');
        sql.Add('From Iteorcamento I with(nolock) inner join Produto Pr with(nolock) ON ');
        sql.Add('Pr.cdproduto = I.cdProduto and Pr.cdgrupo = 19    ');
        sql.Add('Where I.nrOrcamento = O.nrOrcamento) =            ');
        sql.Add('(select isnull(sum(I.recebido),0) as chegado      ');
        sql.Add('from Iteorcamento I with(nolock) inner join Produto Pr with(nolock) ON ');
        sql.Add('Pr.cdproduto = I.cdProduto and Pr.cdgrupo = 19    ');
        sql.Add('Where I.nrOrcamento = O.nrOrcamento))             ');
      end;
      2:
      begin
        FrmRelLivrosFaltamChegar.QRLblTitulo.Caption := 'Relatório de Livros solicitados nos pedidos de compras pagos que Faltam Chegar';
        sql.Add('and I.nrQtd > I.RECEBIDO'); //FALTA CHEGAR
      end;
      3:
      begin
        FrmRelLivrosFaltamChegar.QRLblTitulo.Caption := 'Relatório de Livros solicitados nos pedidos de compras que Faltam Pagar';
        sql.Add('AND O.dsImpresso = ''N'' ');
      end;
    end;
    case CbxOrdenar.ItemIndex of
      0: sql.Add('order by O.nrOrcamentoDia ');// Sequencial
      1: sql.Add('order by PE.nmPessoa ');     // Cliente
      2: sql.Add('order by O.nrOrcamento ');   // Prevenda
      3: sql.Add('order by P.nmProduto ');     // Produto
    end;
    Open;
    Application.MessageBox(PChar(inttostr(FrmRelLivrosFaltamChegar.ADOQryRelDados.RecordCount)),'Atenção', MB_OK + MB_ICONWARNING + MB_APPLMODAL);
  end;
  if FrmRelLivrosFaltamChegar.ADOQryRelDados.RecordCount = 0 then
  begin
    Application.MessageBox('Nenhum dado encontrado de acordo com os filtros!','Atenção', MB_OK + MB_ICONWARNING + MB_APPLMODAL);
    exit;
  end;
  FrmRelLivrosFaltamChegar.QRBand1.Enabled := CbxExibirProdutos.Checked;
  if CbxExibirProdutos.Checked = false then
  begin
    FrmRelLivrosFaltamChegar.QRBand1.Height := -1;
    FrmRelLivrosFaltamChegar.QRBand1.Enabled := false;
    FrmRelLivrosFaltamChegar.QRSubDetail1.Height := -1;
    FrmRelLivrosFaltamChegar.QRSubDetail1.Enabled := false;
    FrmRelLivrosFaltamChegar.QRGroup1.Height := 19;
    FrmRelLivrosFaltamChegar.QRLlbCodigo.Enabled := false;
    FrmRelLivrosFaltamChegar.QRLblProduto.Enabled := false;
    FrmRelLivrosFaltamChegar.QRLblQtd.Enabled := false;
    FrmRelLivrosFaltamChegar.QRLblSolicitada.Enabled := false;
    FrmRelLivrosFaltamChegar.QRLblChegou.Enabled := false;
    FrmRelLivrosFaltamChegar.QRLblPedido.Enabled := false;
    FrmRelLivrosFaltamChegar.QRLblDataChegada.Enabled := false;
  end;
  FrmRelLivrosFaltamChegar.QRMdRel.Preview;
  FreeAndNil(FrmRelLivrosFaltamChegar);
end;

procedure TFrmCadLista.LimpaCamposImpressao;
begin
  EdtCdPessoa.Text := '';
  CbxPessoa.Text := '';
  edtcdProdFltro.Text := '';
  CbxProdutoFiltro.Text := '';
  EdtCdFornecedor.Text := '';
  CbxFornecedor.Text := '';
  EdtApelido.Text := '';
  CbxForracao.Text := '';
  EdtCdListaImpressao.Text := '';
end;

procedure TFrmCadLista.MontaComboAnoExercicio;
begin
  MontaComboListBoolADO(ADOQryAno,CbxAnoFiltro);
  CbxAno.Items.Clear;
  CbxAno.Items := CbxAnoFiltro.Items;
end;

procedure TFrmCadLista.MontaComboCliente;
begin
  With ADOQryCliente do
  begin // monta a combo dos clientes
    Sql.Text :=
    'SELECT P.nmPessoa,P.cdPessoa '+
    'FROM P_Fisica T WITH (NOLOCK) INNER JOIN Endereco E WITH (NOLOCK) ON T.cdPessoa = E.cdPessoa INNER '+
    'JOIN Pessoa P WITH (NOLOCK) ON T.cdPessoa = P.cdPessoa INNER JOIN Cliente C WITH (NOLOCK)           '+
    'ON C.cdPessoa = P.cdPessoa AND E.cdPessoa = P.cdPessoa Where P.ser = ''C'' and P.dsAtivo = ''S''    ';
    if (UpperCase(vEmpresa) = 'CAMARATUBA')OR(UpperCase(vEmpresa) = 'CARDOSOACESSORIOS') then
      SQL.Add('and C.cdCodigo <> 2 ');
    SQL.Add('union ');
    SQL.Add('SELECT P.nmPessoa,P.cdPessoa ');
    SQL.Add('FROM P_Juridica T WITH (NOLOCK) INNER JOIN Endereco E WITH (NOLOCK) ON T.cdPessoa = E.cdPessoa   ');
    SQL.Add('INNER JOIN Pessoa P WITH (NOLOCK) ON T.cdPessoa = P.cdPessoa INNER JOIN Cliente C WITH (NOLOCK)  ');
    SQL.Add('ON C.cdPessoa = P.cdPessoa AND E.cdPessoa = P.cdPessoa Where P.ser = ''C'' and P.dsAtivo = ''S'' ');
    if (UpperCase(vEmpresa) = 'CAMARATUBA')OR(UpperCase(vEmpresa) = 'CARDOSOACESSORIOS') then
      SQL.Add('and C.cdCodigo <> 2 ');
    SQL.Add('Order By P.nmPessoa ');
    MontaComboListBoolADO(ADOQryCliente,CbxPessoa);
  end;
end;

procedure TFrmCadLista.MontaComboEscola;
var escola: TEscola;
    listaEscolas: TList<TEscola>;
begin
  CBxEscola.Clear;
  CbxEscolaFiltro.Clear;
  listaEscolas := TNEGEscola.GetEscolas;
  for escola in listaEscolas do
  begin
    CBxEscola.Items.Add(escola.dsEscola + '|'+ IntToStr(escola.cdEscola));
    CbxEscolaFiltro.Items.Add(escola.dsEscola + '|'+ IntToStr(escola.cdEscola));
  end;
  FreeAndNil(listaEscolas);
end;

procedure TFrmCadLista.MontaComboFornecedor;
begin
  With AdoFornecedor do
  begin // monta a combo de fornecedor
    Sql.Text :=
    'Select P.nmPessoa,P.cdPessoa,P.Existir,P.ser,E.dsBairro,E.dsCidade, '+
    'E.nmLogradouro,E.dsCep,E.dsUf,W.dsCPF as CNPJ,W.dsIdentidade as IE,'+
    'W.dsIdentidade as Razao,M.NrICMS,M.nrISS,F.dsFormaPagamento '+
    'FROM ((Estado M WITH (NOLOCK) INNER JOIN (Pessoa P WITH (NOLOCK) INNER JOIN Endereco E WITH (NOLOCK) '+
    'ON P.cdPessoa = E.cdPessoa) ON M.dsUF = E.dsUF) INNER JOIN P_Fisica W WITH (NOLOCK) '+
    'ON (E.cdPessoa = W.cdPessoa) AND (P.cdPessoa = W.cdPessoa) '+
    'inner join Fornecedor F with (nolock) on F.cdPessoa = P.cdPessoa ) '+
    'Where P.ser = ''F'' and P.dsAtivo = ''S'' '+
    'UNION '+
    'Select P.nmPessoa,P.cdPessoa,P.Existir,P.ser,E.dsBairro,E.dsCidade, '+
    'E.nmLogradouro,E.dsCep,E.dsUf,W.CGC as CNPJ,W.dsInscricaoEstadual as IE,'+
    'W.nmRazao as Razao,M.NrICMS,M.nrISS, F.dsFormaPagamento '+
    'FROM ((Estado M WITH (NOLOCK) INNER JOIN (Pessoa P WITH (NOLOCK) INNER JOIN Endereco E WITH (NOLOCK) '+
    'ON P.cdPessoa = E.cdPessoa) ON M.dsUF = E.dsUF) INNER JOIN P_Juridica W WITH (NOLOCK) '+
    'ON (E.cdPessoa = W.cdPessoa) AND (P.cdPessoa = W.cdPessoa) '+
    'inner join Fornecedor F with (nolock) on F.cdPessoa = P.cdPessoa) '+
    'Where P.ser = ''F'' and P.dsAtivo = ''S'' Order By P.nmPessoa ';
    MontaComboListBoolAdo(AdoFornecedor,CbxFornecedor);
  end;
end;

procedure TFrmCadLista.montaComboProdutos;
begin
  With ADOQryProduto do
  begin  // mota a combo dos nomes dos produtos
    if ADOQryProduto.Active = False then
    begin
      Sql.Text :=
      'Select P.nmProduto,P.cdProduto,P.vlPreco,P.nrQtdReal  '+
      'From Produto P WITH (NOLOCK)                          '+
      'where NOT( P.dstipo_item IN (''07'', ''08'', ''10'')) '+
      'and P.dsAtivo = ''S''                                 '+
      'Order By P.nmProduto                                  ';
      open;
      MontaComboListBoolAdo(ADOQryProduto,CBxProduto);
      CbxProdutoFiltro.Items := CBxProduto.Items;
    end;
  end;
end;

procedure TFrmCadLista.MontaComboSerie;
var serie: TSerieEscolar;
    listaSeries: TList<TSerieEscolar>;
begin
  CBxSerie.Clear;
  listaSeries := TNEGSerieEscolar.GetSeries;
  for serie in listaSeries do
  begin
    CBxSerie.Items.Add(serie.dsSerie + '|'+ inttostr(serie.cdSerie));
  end;
  FreeAndNil(listaSeries);
end;

procedure TFrmCadLista.MontaComboSerieFiltro;
var serie: TSerieEscolar;
    listaSeries: TList<TSerieEscolar>;
    codigoEscola: String;
begin
  CbxSerieFiltro.Clear;
  listaSeries := TNEGSerieEscolar.GetSeries;
  for serie in listaSeries do
  begin
    CbxSerieFiltro.Items.Add(serie.dsSerie + '|'+ inttostr(serie.cdSerie));
  end;
  FreeAndNil(listaSeries);
end;

procedure TFrmCadLista.PgCtrolMdCadastroChange(Sender: TObject);
begin
  inherited;
  if PgCtrolMdCadastro.ActivePage = TbSheetMdCadastroConsulta then
  begin
    AtualizaQryConsulta;
    montaritens;
    BtnExport.Enabled := true;
  end
  else
  if PgCtrolMdCadastro.ActivePage = TbSheetMdCadastroDados then
  begin
    Limpa_Grid(StringGrid1);
    AtualizaCampos;
    DesativaCampos;
    TrataBotoesPadrao(Sender,Padrao);
    Status:=[Padrao];
    BtnExport.Enabled := true;
  end
  else
  if PgCtrolMdCadastro.ActivePage = TBSheetMdImpressao then
  begin
    TrataBotoesPadrao(Sender,Impressao);
    Status:=[Impressao];
    BtnExport.Enabled := false;
  end;
end;

procedure TFrmCadLista.RgDataClick(Sender: TObject);
begin
  case RgData.ItemIndex of
    0: LblPeriodo.Caption := 'Período das Pré-vendas';
    1: LblPeriodo.Caption := 'Período das Chegadas dos Livros';
  end;
end;

procedure TFrmCadLista.RgTipoRelClick(Sender: TObject);
begin
  EdtCdPessoa.Text := '';
  CbxPessoa.Text := '';
  edtcdProdFltro.Text := '';
  CbxProdutoFiltro.Text := '';
  EdtCdFornecedor.Text := '';
  CbxFornecedor.Text := '';
  EdtPrevenda.Text := '';
  EdtApelido.Text := '';
  CbxForracao.Text := '';
  EdtCdListaImpressao.Text := '';
  EdtSequencial.Text := '';
  CbxEscolaFiltro.ItemIndex := -1;
  CbxSerieFiltro.ItemIndex := -1;
  CbxEscolaFiltro.Text := '';
  CbxSerieFiltro.Text := '';
  EdtObs.Text := '';
  Limpa_Grid(SgLivros);
  RgData.Enabled := false;
  case RgTipoRel.ItemIndex of
    0:
    begin
      cbxProdutoFiltro.Enabled := True;
      dtInicial.Enabled := true;
      dtFinal.Enabled   := true;
      LblLivros.Visible := false;
      SgLivros.Visible  := false;
      EdtApelido.Enabled := True;
      CbxFornecedor.Enabled := true;
      CbxOrdenar.Enabled := true;
      CbxFiltrarLivrosSolicitados.Enabled := true;
      CbxFiltrarRelacaoAlunosPreVenda.Enabled := false;
      RgData.Enabled := true;
      case RgData.ItemIndex of
        0: LblPeriodo.Caption := 'Período das Pré-vendas';
        1: LblPeriodo.Caption := 'Período das Chegadas dos Livros';
      end;
    end;
    1:
    begin
      cbxProdutoFiltro.Enabled := false;
      dtInicial.Date := Strtodate('05/12/2017');
      dtInicial.Enabled := true;
      dtFinal.Enabled   := true;
      LblLivros.Visible := false;
      SgLivros.Visible  := false;
      EdtApelido.Enabled := True;
      CbxFornecedor.Enabled := false;
      CbxOrdenar.Enabled := true;
      LblPeriodo.Caption := 'Período das Pré-vendas';
      CbxFiltrarLivrosSolicitados.Enabled := false;
      CbxFiltrarRelacaoAlunosPreVenda.Enabled := true;
    end;
    2:
    begin
      cbxProdutoFiltro.Enabled := false;
      dtInicial.Enabled := true;
      dtFinal.Enabled   := true;
      LblLivros.Visible := true;
      SgLivros.Visible  := true;
      EdtApelido.Enabled := True;
      CbxFornecedor.Enabled := false;
      CbxOrdenar.Enabled := false;
      LblPeriodo.Caption := 'Período das Pré-vendas';
      CbxFiltrarLivrosSolicitados.Enabled := false;
      CbxFiltrarRelacaoAlunosPreVenda.Enabled := false;
    end;
  end;
end;

procedure TFrmCadLista.BtnMdNovoClick(Sender: TObject);
var ultcod:Integer;
begin
  AtivaCampos;
  Limpa_Grid(StringGrid1);
  LimpaTodosCampos(TbSheetMdCadastroDados);
  TrataBotoesPadrao(Sender,novo);
  Status := [novo];
  CBxEscola.SelectAll;
  CBxEscola.SetFocus;
  CBxEscola.Text := '';
  EdtcdEscola.Text := '';
  CBxSerie.Text := '';
  CBxSerie.ItemIndex := -1;
  EdtcdSerie.Text := '';
  CbxAno.Text := FormatDateTime('yyyy',date);
  BuscaUltimoCodigoCdLista;
end;

procedure TFrmCadLista.BtnMdAlterarClick(Sender: TObject);
begin
  AtivaCampos;
  CbxSerie.SetFocus;
  TrataBotoesPadrao(Sender,alterar);
  Status := [alterar];
end;

procedure TFrmCadLista.BtnMdExcluirClick(Sender: TObject);
begin
try
  if MessageDlg('Confirma a exclusão deste Dado', MtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    With ADOQryExcluir do
    begin
      DModulo.Conexao.BeginTrans;
      try       // parametros para a query de exclusao
        SQL.Text := 'Delete From ItensLista   '+
                    'Where cdLista = :cdLista ';
        Parameters.ParamByName('cdLista').Value := EdtcdLista.Text;
        ExecSql;
        Sql.Text := 'Delete From ListaEscolar '+
                    'Where cdLista = :cdLista ';
        Parameters.ParamByName('cdLista').Value := EdtcdLista.Text;
        ExecSql;
        DModulo.Conexao.CommitTrans;
        Messagedlg('Dado excluído com sucesso!', mtinformation, [mbOk], 0);
      except
        DModulo.Conexao.RollbackTrans;
        MessageDlg('Você não pode excluir o Dado!',MtWarning,[mbOk],0);
      end;
    end;
    atualizaQryConsulta;
    montaritens;
    LimpaTodosCampos(TbSheetMdCadastroDados);
    CBxEscola.text:='';
    CBxSerie.text:='';
    Limpa_Grid(StringGrid1);
    atualizacampos;
    //CBxEscola.SetFocus;       // seta o focu para o edit grupo
  end;
except
   on E:Exception do
   begin
     ShowMessage('Não foi possivel excluir o dados ,Motivo ->'+E.message);
   end;
end;
end;

procedure TFrmCadLista.BtnMdImprimirClick(Sender: TObject);
begin
  if dtInicial.Date > dtFinal.date then
  begin
    Application.MessageBox('Data inicial maior que a data final!','Atenção', mb_ok + MB_ICONWARNING + MB_APPLMODAL);
    dtInicial.SetFocus;
    exit;
  end;
  case RgTipoRel.ItemIndex of
    0: ImprimeRelatorioLivrosSolicitadosAChegar;
    1: ImprimeRelatorioAlunosResumido;
    2: ImprimeRelatorioLivrosPorAluno;
  end;
end;

procedure TFrmCadLista.BtnMdSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadLista.BtnMdPrimeiroClick(Sender: TObject);
begin
  ADOQryConsulta.First;
  AtualizaCampos;
end;

procedure TFrmCadLista.BtnMdProximoClick(Sender: TObject);
begin
  ADOQryConsulta.Next;
  AtualizaCampos;
end;

procedure TFrmCadLista.BtnMdUltimoClick(Sender: TObject);
begin
  ADOQryConsulta.Last;
  AtualizaCampos;
end;

procedure TFrmCadLista.btnOrcamentoClick(Sender: TObject);
begin
  // Imprime o Orçamento
  //if EdtcdLista.Text <> '' then begin
  if ADOQryConsulta.RecordCount > 0 then
  begin
    frmRelOrcamentoLista := TfrmRelOrcamentoLista.Create(Self); // Cria o formulário
    With frmRelOrcamentoLista.ADOQryRelDados do
    begin // monta a query para a impressao do orcamento
      Sql.Text := 'Select I.CdObjeto,I.dsObjeto,I.qtd,P.nmProduto,          '+
                  'i.qtd * P.vlPreco as Total,P.cdProduto,                  '+
                  'P.dsPrateleira,P.cdFabricante,P.dsReferencia,            '+
                  'P.vlPreco, P.nrQtdReal, P.dsUnidade,                     '+
                  'E.DsEscola, S.dsSerie                                    '+
                  'from ListaEscolar L with(nolock) inner join ItensLista I with(nolock) '+
                  ' on L.cdLista = I.cdLista                                '+
                  'left JOIN SerieEscolar S with(nolock) ON S.cdSerie = L.cdSerie '+
                  'left join Escola E with(nolock) on L.CdEscola = E.CdEscola     '+
                  'inner Join Produto P with(nolock) on I.cdObjeto = P.cdproduto  '+
                  'where I.cdLista = :cdLista';
      case PgCtrolMdCadastro.ActivePageIndex of
        0: Parameters.ParamByName('cdLista').Value := ADOQryConsulta.FieldByName('cdLista').AsInteger;
        1: Parameters.ParamByName('cdLista').Value := EdtcdLista.Text;
      end;
      Open;
    end;
    frmRelOrcamentoLista.QuickRep1.Preview;  // imprime o orcamento
    frmRelOrcamentoLista.Free;
  end;
end;

procedure TFrmCadLista.BuscaLivrosAluno;
var qry: TADOQuery;
    i:Integer;
    escola: TEscola;
    serie: TSerieEscolar;
begin
  Limpa_Grid(SgLivros);
  if (EdtCdPessoa.Text = '') and (trim(EdtPrevenda.text) = '') then
  begin
    Exit;
  end;
  qry := TAdoQuery.Create(nil);
  qry.connection := DModulo.Conexao;
  with qry do
  begin
    sql.Text := 'SELECT distinct O.nrOrcamento, O.dtEmissao, O.cdCliente,          '+
                'E.cdEscola,E.DsEscola,Editora.nmPessoa as nomeEditora, O.cdLista, '+
                'P.nmPessoa as nomeCliente,It.observacao,                          '+
                'S.cdSerie,S.dsSerie AS SERIE,PR.cdPessoa_1 AS cdEditora,          '+
                'O.tipoForracao, O.nrOrcamentoDia, It.cdIteLcto,                   '+
                'PR.nmproduto AS TITULO, cast(M.dsMemo as varchar(400))as dsMemo   '+
                'FROM Orcamento O                                                  '+
                'INNER JOIN IteOrcamento IT                                        '+
                'ON IT.nrOrcamento = O.nrOrcamento                                 '+
                'INNER JOIN PESSOA P                                               '+
                'ON P.cdPessoa = O.cdCliente                                       '+
                'INNER JOIN PRODUTO PR                                             '+
                'ON PR.cdProduto = IT.cdProduto and PR.cdGrupo = 19                '+
                'left JOIN ListaEscolar L                                          '+
                'ON L.cdLista = O.cdLista                                          '+
                'left JOIN SerieEscolar S                                          '+
                'ON S.cdSerie = L.cdSerie                                          '+
                'left join Escola E on L.CdEscola = E.CdEscola                     '+
                'inner join Pessoa Editora on Editora.cdPessoa = Pr.cdPessoa_1     '+
                'left join MemoOrcamento M on O.nrOrcamento = M.nrOrcamento        '+
                'WHERE O.nrOrcamento >= 448290 and O.dsImpresso=''S''              '+
                'and O.dtEmissao between :dt1 and :dt2                             ';
    Parameters.ParamByName('dt1').Value := DateOf(dtInicial.Date);
    Parameters.ParamByName('dt2').Value := DateOf(dtFinal.Date);
    if EdtCdPessoa.Text <> '' then
    begin
      sql.Add('and O.cdCliente = :cdCliente ');
      Parameters.ParamByName('cdCliente').Value := EdtCdPessoa.Text;
    end;
    if Trim(EdtPrevenda.Text) <> '' then
    begin
      sql.Add('and O.nrOrcamento = :nrOrcamento ');
      Parameters.ParamByName('nrOrcamento').Value := EdtPrevenda.Text;
    end;
    sql.add('order by 4, PR.nmproduto');
    open;
    i:= 1;
    while not Eof do
    begin
      with SgLivros do
      begin
        Cells[0,i] := FieldByName('TITULO').AsString;      //'Livro';
        Cells[1,i] := FieldByName('observacao').AsString;  //'Observação';
        Cells[2,i] := FieldByName('cdIteLcto').AsString;   //'cdIteLcto';
        Cells[3,i] := FieldByName('nrOrcamento').AsString; //'nrOrcamento';
        RowCount := RowCount + 1;
      end;
      Inc(i);
      Next;
    end;
    if recordCount > 0 then
    begin
      if qry.FieldByName('tipoForracao').AsString <> '' then
        CbxForracao.Text := qry.FieldByName('tipoForracao').AsString
      else
        CbxForracao.ItemIndex := 5;
      EdtSequencial.text := FieldByName('nrOrcamentoDia').AsString;
      EdtObs.Text := qry.FieldByName('dsMemo').AsString;
      if qry.FieldByName('cdLista').AsString <> '' then begin
        EdtCdListaImpressao.Text := qry.FieldByName('cdLista').AsString;
        escola := TNEGEscola.GetEscola(qry.FieldByName('cdEscola').AsInteger);
        CbxEscolaFiltro.Text := escola.dsEscola + '|' + IntToStr(escola.cdEscola);
        serie := TNEGSerieEscolar.GetSerie(qry.FieldByName('cdSerie').AsInteger);
        CbxSerieFiltro.text := serie.dsSerie + '|' + IntToStr(serie.cdSerie);
      end else
      begin
        EdtCdListaImpressao.text := '';
        CbxEscolaFiltro.Text := '';
        CbxSerieFiltro.Text := '';
      end;
      close;
    end;
  end;
  FreeAndNil(qry);
end;

function TFrmCadLista.BuscaOrcamentosVinculadosAoPedidoDeCompra: String;
var qry: TADOQuery;
    nrOrcamentos: String;
    listaNrOrcamentos, x: String;
    totVirgulas, i: integer;
begin
  qry := TAdoQuery.Create(nil);
  qry.connection := DModulo.Conexao;
  with qry do
  begin
    sql.text :=
    'select distinct PC.dsObs2                                            '+
    'from Orcamento O with(nolock) inner join IteOrcamento I with(nolock) on I.nrOrcamento = O.nrOrcamento '+
    'inner join Itepedcomp IP with(nolock) on IP.cdProduto = I.cdProduto  '+
    'inner join PedidoCompra PC with(nolock) on IP.nrLancto = PC.nrLancto '+
    'inner join Produto P with(nolock) on I.cdProduto = P.cdProduto and P.cdGrupo = 19 '+
    'inner join Pessoa PE with(nolock) on O.cdCliente = PE.cdPessoa     '+
    'left join P_Fisica PF with(nolock) on PF.cdPessoa = PE.cdPessoa    '+
    'left join P_Juridica PJ with(nolock) on PJ.cdPessoa = Pe.cdPessoa  '+
    'where O.dsImpresso = ''S'' and O.nrOrcamento >= 448290             '+
    'and PC.dtEmissao between :dt1 and :dt2 and PC.dsObs2 is not null   ';
    Parameters.ParamByName('dt1').Value := dateOf(dtInicial.Date);
    Parameters.ParamByName('dt2').Value := dateOf(dtFinal.Date + 1);
    if EdtCdPessoa.Text <> '' then begin
      sql.Add('and O.cdCliente = :cdCliente ');
      Parameters.ParamByName('cdCliente').Value := EdtCdPessoa.Text;
    end;
    if edtcdProdFltro.Text <> '' then begin
      sql.Add('and I.cdProduto = :cdProduto ');
      Parameters.ParamByName('cdProduto').Value := edtcdProdFltro.Text;
    end;
    if Trim(EdtPrevenda.Text) <> '' then begin
      sql.Add('and O.nrOrcamento = :nrOrcamento ');
      Parameters.ParamByName('nrOrcamento').Value := EdtPrevenda.Text;
    end;
    if Trim(EdtCdFornecedor.Text) <> '' then begin
      sql.Add('and P.cdPessoa = :cdPessoa ');
      Parameters.ParamByName('cdPessoa').Value := EdtCdFornecedor.Text;
    end;
    if Trim(EdtApelido.Text) <> '' then begin
      sql.add('and (case when (PE.Existir = ''F'') then PF.dsNaturalidade      ');
      sql.add('when (PE.Existir = ''J'') then PJ.nmContato end ) like :apelido ');
      Parameters.ParamByName('apelido').Value := '%'+EdtApelido.Text+'%';
    end;
    if Trim(EdtPedido.Text) <> '' then begin
      sql.Add('and PC.nrLancto = :nrLancto ');
      Parameters.ParamByName('nrLancto').Value := EdtPedido.Text;
    end;
    open;
    nrOrcamentos := '';
    listaNrOrcamentos := '';
    while not eof do
    begin
      nrOrcamentos := nrOrcamentos + FieldByName('dsObs2').AsString +',';
      Next;
    end;
    nrOrcamentos := Copy(nrOrcamentos,1,Length(nrOrcamentos)-1);
    totVirgulas := RepeticoesCaractere(',',nrOrcamentos);
    for I := 1 to totVirgulas + 1 do
    begin
      x := QuotedStr(copy_campo(nrOrcamentos,',',i));
      listaNrOrcamentos := listaNrOrcamentos + x + ',';
    end;
    listaNrOrcamentos := Copy(listaNrOrcamentos,1,Length(listaNrOrcamentos)-1);
  end;
  result := listaNrOrcamentos;
end;

procedure TFrmCadLista.BuscaUltimoCodigoCdLista;
var ultCod: integer;
begin
  ADOQryUltimoCodigo.SQL.Text:='Select cdLista from ListaEscolar with(nolock)  Order By CdLista Desc ';
  ADOQryUltimoCodigo.Open;
  ultcod:=ADOQryUltimoCodigo.FieldByName('cdLista').AsInteger;
  ultcod := ultcod + 1;
  EdtcdLista.Text:=IntToStr(ultcod);
  ADOQryUltimoCodigo.Close;
end;

procedure TFrmCadLista.BtnMdAnteriorClick(Sender: TObject);
begin
ADOQryConsulta.Prior;
AtualizaCampos;
end;

procedure TFrmCadLista.StringGrid1DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  if not (gdSelected in state) then
  begin
    if (ARow <> 0) and ((ARow mod 2) = 0)  then
    begin
      StringGrid1.Canvas.Brush.Color := $00CFD7D8;//$00FFEFDF; // define cor de fundo
      StringGrid1.Canvas.FillRect(Rect); // pinta a célula
      StringGrid1.Canvas.Font.Color := clBlack;
      DrawText(StringGrid1.Canvas.Handle,PChar(StringGrid1.Cells[ACol,ARow]), - 1, Rect, DT_VCENTER or DT_LEFT or DT_SINGLELINE);
    end;
  end;
end;

procedure TFrmCadLista.SgLivrosExit(Sender: TObject);
var qry: TAdoQuery;
    i: integer;
begin
  qry := TAdoQuery.Create(nil);
  qry.connection := DModulo.Conexao;
  for i := 1 to SgLivros.RowCount do
  begin
    if SgLivros.Cells[0,i] <> '' then
    begin
      with qry do begin
        sql.text := 'update iteOrcamento set Observacao = :observacao            '+
                    'where nrOrcamento = :nrOrcamento and cdIteLcto = :cdIteLcto ';
        parameters.ParamByName('nrOrcamento').Value := SgLivros.cells[3,i];
        parameters.ParamByName('cdIteLcto').Value   := SgLivros.cells[2,i];
        parameters.ParamByName('observacao').Value  := SgLivros.cells[1,i];
        ExecSQL;
      end;
    end;
  end;
  FreeAndNil(qry);
end;

procedure TFrmCadLista.StringGrid1DblClick(Sender: TObject);
var c,Lauxi,L,cel:integer; val,val_excluido:real;
begin
  with StringGrid1 do
  begin
    if MessageDlg('Deseja excluir esta linha?',mtConfirmation,[mbYes,mbNo],0) <> mrYes then
    begin
      Application.onmessage := FormPrincipal.NaoProcessaMsg;
      edtcdProd.SetFocus;
      Application.onmessage := FormPrincipal.ProcessaMsg;
      exit;
    end;
    //Valor do EdVAlorToral do Contrato Subtrair o Item Excluido do valor total
    if Row = RowCount -1 then
    begin  // limpa quando a grid tem só uma linha
      for C := 0 to ColCount do
          Cells[C,Row] := '';
    end
    else
    begin
      for C := 1 to ColCount do
        Cells[C,Row] := '';
      Lauxi := Row;
      for L := Lauxi to RowCount -1 do
      begin
        for C := 0 to ColCount do
          Cells[C,Row] := Cells[C,Row + 1];
        if Row < Rowcount -1 then
          Row := Row + 1;
      end;
    end;
    Row := 1;
    For L:= Row to RowCount -1 do
    begin
      if Cells[0,L] = '' then
      begin
        Row := L;
        Break;
      end;
    end;
  end;
  edtcdProd.SetFocus;
end;

procedure TFrmCadLista.EdtQtdObjExit(Sender: TObject);
var qtd,qtdloc,l,i : integer;
begin
  if trim(EdtQtdObj.Text) = '' then
    exit;
  try
    if (StrToFloatDef(EdtQtdObj.Text,0) > 0) AND (edtcdProd.text <> '') then
    begin
      with StringGrid1 do
      begin
        if RowCount >= 2 then
          RowCount := RowCount + 1;
        Row := 1;
        For L:= Row to RowCount -1 do
        begin
          if Cells[0,L] = '' then
          begin
            Row := L;
            Break;
          end
          else
          begin
            if Cells[0,L] = edtcdProd.Text then
            begin
              MessageDlg('Esse produto já está incluso nessa lista!',mtWarning,[mbOk],0);
              Exit;
            end;
          end;
        end;
        Cells[0,Row] := edtcdProd.Text;
        Cells[1,Row] := CBxProduto.Text;
        //Qtd EquipLocados..
        Cells[2,Row] := EdtQtdObj.Text;
        edtcdProd.Clear;
        EdtQtdObj.Clear;
        CBxProduto.ItemIndex := -1;
        edtcdProd.SetFocus;
      end;
      ContabilizaLivros;
    end
    else
    begin
      showmessage('Escolha o produto e insira a quantidade');
      CBxProduto.SetFocus;
    end;
  Except
    on E: Exception do
    begin
       Messagedlg('Não foi possivel adicionar o produto!' + #13'' + '', mterror, [mbOk], 0);
       CBxProduto.setfocus;
    end;
  end;
end;

procedure TFrmCadLista.EdtSequencialEnter(Sender: TObject);
begin
  nrSequencialAnterior := EdtSequencial.Text;
end;

procedure TFrmCadLista.EdtSequencialExit(Sender: TObject);
var qry: TADOQuery;
begin
  if (EdtSequencial.Text <> '') then begin
    if (nrSequencialAnterior <> EdtSequencial.Text) and (EdtPrevenda.Text <> '') then begin
      if Application.MessageBox('Confirma a alteração do sequencial?',
          'Confirmação',MB_YESNO + MB_ICONQUESTION + MB_APPLMODAL) = ID_YES then begin
        qry := TAdoQuery.Create(nil);
        qry.connection := DModulo.Conexao;
        with qry do begin
          sql.text := 'select 1 from orcamento where nrOrcamentoDia = :nrOrcamentoDia';
          parameters.ParamByName('nrOrcamentoDia').Value := EdtSequencial.Text;
          open;
          if recordCount > 0 then begin
            Application.MessageBox('Já existe um sequencial com esse número!','Atenção',MB_OK + MB_ICONWARNING + MB_APPLMODAL);
            exit;
          end
          else begin
            sql.text := 'update orcamento set nrOrcamentoDia = :nrOrcamentoDia '+
                        'where nrOrcamento = :nrOrcamento                  ';
            parameters.ParamByName('nrOrcamento').Value := EdtPrevenda.Text;
            parameters.ParamByName('nrOrcamentoDia').Value := EdtSequencial.Text;
            ExecSQL;
          end;
        end;
        nrSequencialAnterior := '';
      end;
    end
    else begin
      if trim(EdtSequencial.Text) <> '' then begin
        qry := TAdoQuery.Create(nil);
        qry.connection := DModulo.Conexao;
        with qry do begin
          sql.text := 'select O.cdCliente, P.nmPessoa as nomeCliente, O.nrOrcamento     '+
                      'from orcamento O with(nolock) inner join Pessoa P with(nolock) on O.cdCliente = P.cdPessoa '+
                      'where O.nrOrcamentoDia = :nrOrcamentoDia                         ';
          Parameters.ParamByName('nrOrcamentoDia').Value := EdtSequencial.Text;
          open;
          LimpaCamposImpressao;
          EdtCdPessoa.Text := qry.FieldByName('cdCliente').AsString;
          CbxPessoa.Text := qry.FieldByName('nomeCliente').AsString;
//          EdtPrevenda.Text := qry.FieldByName('nrOrcamento').AsString;
          close;

          if EdtCdPessoa.Text <> '' then
            EdtApelido.Text := BuscaApelido(strtoint(EdtCdPessoa.Text));

          BuscaLivrosAluno;
        end;
      end;
    end;
  end;
end;

procedure TFrmCadLista.CbxAnoFiltroChange(Sender: TObject);
begin
  AtualizaQryConsulta;
end;

procedure TFrmCadLista.CBxEscolaChange(Sender: TObject);
var codigoEscola: String;
begin
  codigoEscola := copy_campo(CBxEscola.Text,'|',2);
  CBxSerie.Clear;
  if codigoEscola <> '' then
  begin
    EdtcdEscola.Text := codigoEscola;
    MontaComboSerie;
  end;
end;

procedure TFrmCadLista.CbxEscolaFiltroChange(Sender: TObject);
var codigoEscola: String;
begin
  codigoEscola := copy_campo(CbxEscolaFiltro.Text,'|',2);
  CbxSerieFiltro.Clear;
  MontaComboSerieFiltro;
end;

procedure TFrmCadLista.CbxFornecedorChange(Sender: TObject);
begin
  if (CbxFornecedor.ItemIndex <> -1) and (CbxFornecedor.Text <> '') then
  begin
    AdoFornecedor.Open;
    AdoFornecedor.Locate('nmPessoa',CbxFornecedor.Text,[]);
    EdtCdFornecedor.Text :=AdoFornecedor.FieldByName('cdPessoa').AsString;
  end
  else
    EdtCdFornecedor.Clear;
end;

procedure TFrmCadLista.CbxForracaoEnter(Sender: TObject);
begin
  tipoForracaoAnterior := CbxForracao.Text;
end;

procedure TFrmCadLista.CbxForracaoExit(Sender: TObject);
var qry: TADOQuery;
begin
  if (EdtPrevenda.Text <> '') or (EdtSequencial.Text <> '') then begin
    if tipoForracaoAnterior <> CbxForracao.Text then begin
      if Application.MessageBox('Confirma a alteração do tipo da forração?',
          'Confirmação',MB_YESNO + MB_ICONQUESTION + MB_APPLMODAL) = ID_YES then begin
        qry := TAdoQuery.Create(nil);
        qry.connection := DModulo.Conexao;
        with qry do begin
          sql.text := 'update orcamento set tipoForracao = :tipoForracao ';
          if (EdtPrevenda.Text <> '') then begin
            sql.Add('where nrOrcamento = :nrOrcamento ');
            parameters.ParamByName('nrOrcamento').Value := EdtPrevenda.Text;
          end
          else
          if (EdtSequencial.Text <> '') then begin
            sql.Add('where nrOrcamentoDia = :nrOrcamentoDia ');
            parameters.ParamByName('nrOrcamentoDia').Value := EdtSequencial.Text;
          end;
          parameters.ParamByName('tipoForracao').Value := CbxForracao.Text;
          ExecSQL
        end;
        tipoForracaoAnterior := '';
      end;
    end;
  end;
end;

procedure TFrmCadLista.CbxPessoaChange(Sender: TObject);
begin
  if (CbxPessoa.Text <> '') then begin
    ADOQryCliente.Open;
    ADOQryCliente.Locate('nmPessoa',CbxPessoa.Text,[]);
    EdtCdPessoa.Text := ADOQryCliente.FieldByName('cdPessoa').AsString;
  end else begin
    EdtCdPessoa.Clear;
  end;
  BuscaLivrosAluno;
end;

procedure TFrmCadLista.CbxPessoaExit(Sender: TObject);
begin
  BuscaLivrosAluno;
  if EdtCdPessoa.Text <> '' then
    EdtApelido.Text := BuscaApelido(strtoint(EdtCdPessoa.Text));
end;

procedure TFrmCadLista.CBxSerieChange(Sender: TObject);
var codigoSerie: String;
begin
  codigoSerie := copy_campo(CBxSerie.Text,'|',2);
  if codigoSerie <> '' then
    EdtcdSerie.Text := codigoSerie;
end;

procedure TFrmCadLista.ContabilizaLivros;
var i: Integer;
    tot: Integer;
begin
  tot := 0;
  for I := 1 to StringGrid1.RowCount do
  begin
    if StringGrid1.Cells[0,i] <> '' then
      tot := tot + 1;
  end;
  LblListados.caption := 'Listados -> '+inttostr(tot);
end;

procedure TFrmCadLista.CBxProdutoChange(Sender: TObject);
begin
  if (CBxProduto.ItemIndex <> -1) and (CBxProduto.Text <> '') then
  begin
    ADOQryProduto.Open;
    ADOQryProduto.Locate('nmProduto',CBxProduto.Text,[]);
    edtcdProd.Text :=ADOQryProduto.FieldByName('cdProduto').AsString;
  end else
  begin
    edtcdProd.Clear;
  end;
end;

procedure TFrmCadLista.BtnMdSalvarClick(Sender: TObject);
var i:integer;
    myYear, myMonth, myDay : Word;
    data: String;
begin
  DecodeDate(date, myYear, myMonth, myDay);
  data := IntToStr(myDay)  + '/' + IntToStr(myMonth) + '/' +  CbxAno.Text;// + ' 00:00:00' ;
  try
    if trim(EdtcdEscola.Text) = '' then
    begin
      Application.MessageBox('Selecione uma Escola!','Atenção',MB_OK + MB_ICONWARNING + MB_APPLMODAL);
      CBxEscola.SetFocus;
      exit;
    end;
    if trim(EdtcdSerie.Text) = '' then
    begin
      Application.MessageBox('Selecione uma Série!','Atenção',MB_OK + MB_ICONWARNING + MB_APPLMODAL);
      CBxSerie.SetFocus;
      exit;
    end;
    if Status = [Novo] then
    begin
      With ADOQryAlterar do
      begin
        Dmodulo.Conexao.BeginTrans;
        Try
          Close;
          BuscaUltimoCodigoCdLista;
          Sql.Clear;
          Sql.text:= 'Insert into ListaEscolar (cdLista,cdSerie,Ano,cdEscola ) '+
                     'Values (:cdLista,:cdSerie,:Ano,:cdEscola) ';
          Parameters.ParamByName('cdLista').value    := EdtcdLista.Text ;
          if EdtcdEscola.Text <> '' then
            Parameters.ParamByName('cdEscola').value := EdtcdEscola.Text
          else
            Parameters.ParamByName('cdEscola').value := null;
          Parameters.ParamByName('cdSerie').value    := EdtcdSerie.Text ;
          Parameters.ParamByName('Ano').value        := StrToDate(data);
          ADOQryAlterar.ExecSql;
          SQL.Clear;
          Sql.text:= 'Insert into ItensLista (cdLista,cdObjeto,dsObjeto,qtd ) '+
                     'Values (:cdLista,:cdobjeto,:dsObjeto,:qtd) ';
          for i:=1 to StringGrid1.RowCount -1  do
          begin
            if StringGrid1.Cells[0,i] <> '' then
            begin
              Parameters.ParamByName('cdLista').value  := EdtcdLista.Text ;
              Parameters.ParamByName('cdObjeto').value := StringGrid1.Cells[0,i];
              Parameters.ParamByName('dsObjeto').value := StringGrid1.Cells[1,i];
              Parameters.ParamByName('qtd').value      := StringGrid1.Cells[2,i];
              ADOQryAlterar.ExecSql;
            end;
          end;
          DModulo.Conexao.CommitTrans;
          Messagedlg('Inclusão Ok!', mtinformation, [mbOk], 0);
          TrataBotoesPadrao(Sender,padrao);
          Status := [padrao];
          //atualizaQryConsulta;
          //montaritens;
          desativacampos;
        except
          on E: Exception do
          begin
            If not CamposObrigatoriosPreenchidos(TBSheetMdCadastroDados) then
               exit;
            DModulo.Conexao.RollbackTrans;
            MessageDlg ('Inclusão Cancelada. Motivo: '+E.Message, mtWarning, [mbOk], 0);
            //BtnMdCancelarClick(Sender);

          end;
        end;
      end;
    end;
    if Status = [Alterar] then
    begin
      With ADOQryAlterar do
      begin
        Dmodulo.Conexao.BeginTrans;
        Try
          close;
          SQL.Text:= 'Delete ItensLista where cdLista = :param ';
          Parameters.ParamByName('param').value    := EdtcdLista.Text ;
          ExecSql;
          Sql.text:= 'Update  ListaEscolar set cdSerie = :cdSerie,Ano =:Ano, cdEscola = :cdEscola  '+
                     'Where cdLista = :param';
          Parameters.ParamByName('param').value    := EdtcdLista.Text ;
          if EdtcdEscola.Text <> '' then
            Parameters.ParamByName('cdEscola').value  := EdtcdEscola.Text
          else
            Parameters.ParamByName('cdEscola').value  := null;
          Parameters.ParamByName('cdSerie').value   := EdtcdSerie.Text ;
          Parameters.ParamByName('Ano').value       := StrToDate(data);
          ExecSql;
          Sql.text:= 'Insert into ItensLista (cdLista,cdObjeto,dsObjeto,qtd ) '+
                     'Values (:cdLista,:cdobjeto,:dsObjeto,:qtd)';
          for i:=1 to StringGrid1.RowCount -1  do
          begin
            if StringGrid1.Cells[0,i] <> '' then
            begin
              Parameters.ParamByName('cdLista').value   := EdtcdLista.Text ;
              Parameters.ParamByName('cdObjeto').value  := StringGrid1.Cells[0,i];
              Parameters.ParamByName('dsObjeto').value  :=  StringGrid1.Cells[1,i];
              Parameters.ParamByName('qtd').value       :=  StringGrid1.Cells[2,i];
              ADOQryAlterar.ExecSql;
            end;
          end;
          DModulo.Conexao.CommitTrans;
          Messagedlg('Alteração Ok!', mtinformation, [mbOk], 0);
          TrataBotoesPadrao(Sender,padrao);
          Status := [padrao];
        except
          on E: Exception do
          begin
            DMOdulo.Conexao.RollbackTrans;
            MessageDlg ('Não foi possivel Alterar! Motivo: '+E.Message, mtWarning, [mbOk], 0);
          end;
        end;
      end;
    end;
    DesativaCampos;
    TrataBotoesPadrao(Sender,Padrao);
    Status := [Padrao];
  except
    DModulo.Conexao.RollbackTrans;
  end;
end;

procedure TFrmCadLista.BtnMdCancelarClick(Sender: TObject);
begin
  Limpa_Grid(StringGrid1);
  Atualizacampos;
  DesativaCampos;
  TrataBotoesPadrao(Sender,padrao);
  Status := [padrao];
end;

procedure TFrmCadLista.DBGrid1DblClick(Sender: TObject);
begin
  if Vform ='C'then
  begin
    Limpa_Grid(StringGrid1);
    AtualizaCampos;
    PgCtrolMdCadastro.ActivePage := TBSheetMdCadastroDados;
    TrataBotoespadrao(sender,padrao);
    Status := [Padrao];
  end;
end;

procedure TFrmCadLista.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if (TAuxDBGrid(dbgrid1).DataLink.ActiveRecord + 1 = TAuxDBGrid(dbgrid1).Row)  or(gdSelected in State)then
  begin
    dbgrid1.Canvas.Brush.Color  := clSkyBlue;
    dbgrid1.Canvas.Font.Style   := dbgrid1.Canvas.Font.Style + [fsBold];
  end;
  dbgrid1.Canvas.FillRect(Rect);
  dbgrid1.Canvas.TextOut(Rect.Left + 2,Rect.Top,Column.Field.AsString);
end;

procedure TFrmCadLista.EdtConsultaChange(Sender: TObject);
begin
 AtualizaQryConsulta;
 montaritens;
end;

procedure TFrmCadLista.EdtConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_Down then
    BtnMdProximoClick(Self);
  if Key = VK_Up then
    BtnMdAnteriorClick(Self);
end;

procedure TFrmCadLista.EdtObsEnter(Sender: TObject);
begin
  obsAnterior := EdtObs.Text;
end;

procedure TFrmCadLista.EdtObsExit(Sender: TObject);
var qry: TADOQuery;
    nrOrcamento: Integer;
begin
  nrOrcamento := -1;
  if (EdtObs.Text <> '') then begin
    if (obsAnterior <> EdtObs.Text) and (EdtObs.Text <> '') then begin
      if Application.MessageBox('Confirma a alteração da observação?',
          'Confirmação',MB_YESNO + MB_ICONQUESTION + MB_APPLMODAL) = ID_YES then begin
        qry := TAdoQuery.Create(nil);
        qry.connection := DModulo.Conexao;
        with qry do begin
          if EdtPrevenda.Text <> '' then
            nrOrcamento := StrToInt(EdtPrevenda.Text)
          else begin
            if EdtSequencial.Text <> '' then begin
              sql.Text := 'select nrOrcamento from Orcamento where nrOrcamentoDia = :seq';
              parameters.ParamByName('seq').Value := EdtSequencial.Text;
              open;
              nrOrcamento := FieldByName('nrOrcamento').AsInteger;
            end;
          end;

          sql.Text := 'select * from MemoOrcamento where nrorcamento = :nrOrcamento';
          parameters.ParamByName('nrOrcamento').Value := nrOrcamento;
          open;
          if recordCount = 0 then begin
            sql.text := 'insert into MemoOrcamento (nrorcamento, dsMemo) '+
                        'values (:nrorcamento, :dsMemo) ';
            parameters.ParamByName('nrOrcamento').Value := nrOrcamento;
            parameters.ParamByName('dsMemo').Value      := EdtObs.Text;
            ExecSQL;
          end
          else begin
            sql.text := 'update MemoOrcamento set dsMemo = :dsMemo '+
                        'where nrOrcamento = :nrOrcamento          ';
            parameters.ParamByName('nrOrcamento').Value := nrOrcamento;
            parameters.ParamByName('dsMemo').Value      := EdtObs.Text;
            ExecSQL;
          end;
        end;
        obsAnterior := '';
      end;
    end;
  end;
end;

procedure TFrmCadLista.EdtPrevendaChange(Sender: TObject);
begin
//  EdtApelido.Text := '';
  LimpaCamposImpressao;
  BuscaLivrosAluno;
end;

procedure TFrmCadLista.EdtPrevendaExit(Sender: TObject);
var qry: TADOQuery;
begin
  if trim(EdtPrevenda.Text) <> '' then begin
    qry := TAdoQuery.Create(nil);
    qry.connection := DModulo.Conexao;
    with qry do begin
      sql.text := 'select O.cdCliente, P.nmPessoa as nomeCliente                    '+
                  'from orcamento O inner join Pessoa P on O.cdCliente = P.cdPessoa '+
                  'where O.nrOrcamento = :nrOrcamento                               ';
      Parameters.ParamByName('nrOrcamento').Value := EdtPrevenda.Text;
      open;
      EdtCdPessoa.Text := qry.FieldByName('cdCliente').AsString;
      CbxPessoa.Text := qry.FieldByName('nomeCliente').AsString;
      close;

      if EdtCdPessoa.Text <> '' then
        EdtApelido.Text := BuscaApelido(strtoint(EdtCdPessoa.Text));
    end;
  end;
end;

procedure TFrmCadLista.DBGrid1CellClick(Column: TColumn);
begin
  montaritens;
end;

procedure TFrmCadLista.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  montaritens;
end;

procedure TFrmCadLista.DBGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  montaritens;
end;

procedure TFrmCadLista.TBSheetMdCadastroConsultaEnter(Sender: TObject);
begin
  BtnMdAlterar.Enabled := False;
  BtnMdExcluir.Enabled := False;
  BtnMdImprimir.Enabled := False;
  BtnMdNovo.Enabled := False;
  BtnMdSalvar.Enabled := False;
  BtnMdCancelar.Enabled := False;
end;

function ChamaInputBox(const ACaption,
APrompt: string): string;
var
  Form: TForm;
  Prompt: TLabel;
  cbxFornecedor: TComboBox;
  DialogUnits: TPoint;
  ButtonTop, ButtonWidth, ButtonHeight: Integer;
  Value: string;
  I: Integer;
  Buffer: array[0..51] of Char;
begin
  Result := '';
  Form := TForm.Create(Application);
  with Form do begin
    try
      Canvas.Font := Font;
      for I := 0 to 25 do Buffer[I] := Chr(I + Ord('A'));
      for I := 0 to 25 do Buffer[I + 26] := Chr(I + Ord('a'));
      GetTextExtentPoint(Canvas.Handle, Buffer, 52, TSize(DialogUnits));
      DialogUnits.X := DialogUnits.X div 52;
      BorderStyle := bsDialog;
      Caption := ACaption;
      ClientWidth := MulDiv(380, DialogUnits.X, 4);
      ClientHeight := MulDiv(63, DialogUnits.Y, 8);
      Position := poScreenCenter;
      Prompt := TLabel.Create(Form);
      with Prompt do begin
        Parent := Form;
        AutoSize := True;
        Left := MulDiv(8, DialogUnits.X, 4);
        Top := MulDiv(8, DialogUnits.Y, 8);
        Caption := APrompt;
      end;
      cbxFornecedor := TComboBox.Create(Form);
      with cbxFornecedor do begin
        Parent := Form;
        ItemIndex := 5;
        Left := Prompt.Left;
        Top := MulDiv(19, DialogUnits.Y, 8);
        Width := MulDiv(340, DialogUnits.X, 4);
        Style := csDropDownList;
        cbxFornecedor.Items.Add('Vinitac');
        cbxFornecedor.Items.Add('NF/NE');
        cbxFornecedor.Items.Add('Só Forrar');
        cbxFornecedor.Items.Add('Só etiquetar');
        cbxFornecedor.Items.Add('Observação');
        cbxFornecedor.Items.Add('Nenhuma');
      end;
      ButtonTop := MulDiv(41, DialogUnits.Y, 8);
      ButtonWidth := MulDiv(50, DialogUnits.X, 4);
      ButtonHeight := MulDiv(14, DialogUnits.Y, 8);
      with TButton.Create(Form) do begin
        Parent := Form;
        Caption := 'OK';
        ModalResult := mrOk;
        Default := True;
        SetBounds(MulDiv(38, DialogUnits.X, 4),ButtonTop, ButtonWidth,ButtonHeight);
      end;
      with TButton.Create(Form) do begin
        Parent := Form;
        Caption := 'Cancel';
        ModalResult := mrCancel;
        Cancel := True;
        SetBounds(MulDiv(92, DialogUnits.X, 4),ButtonTop, ButtonWidth,ButtonHeight);
      end;
      cbxFornecedor.ItemIndex := 0;
      if ShowModal = mrOk then begin
        Value := cbxFornecedor.Text;
        Result := Value;
      end;
    finally
      Form.Free;
      Form:=nil;
    end;
  end;
end;

procedure TFrmCadLista.BtnExportClick(Sender: TObject);
var
  itemPrevenda:TItemPrevenda;
  i,l:Integer;
begin
  if FrmPrincipalPreVenda.edtcdLista.Text <> '' then
  begin
    Application.MessageBox('Já existe uma lista na tela da pré-venda!','Atenção', mb_ok + MB_ICONWARNING + MB_APPLMODAL);
    exit;
  end;
  FrmPrincipalPreVenda.tipoForro := ChamaInputBox('Forração','Escolha um estilo de forro na lista abaixo:');
  if FrmPrincipalPreVenda.tipoForro = '' then
     exit;
  ADOQryItensLista.first;
  for i:=0 to ADOQryItensLista.RecordCount -1 do
  begin
    with FrmPrincipalPreVenda.SgDados do
    begin
      if RowCount >= 2 then
        RowCount := RowCount + 1;
      Row := 1;
      For L:= Row to RowCount -1 do
      begin
        if Cells[0,L] = '' then
        begin
          Row := L;
          Break;
        end;
      end;
      if not FrmPrincipalPreVenda.ADOSPConsulta.Locate('Código',DBGrid2.Fields[0].Value,[]) then
      begin
        ADOQryItensLista.Next;
        continue;
      end;
      itemPrevenda:= TItemPrevenda.Create(DBGrid2.Fields[0].AsInteger);
      itemPrevenda.precoVenda:= DBGrid2.Fields[3].Value;
      FrmPrincipalPreVenda.EdtPreco.text := FrmPrincipalPreVenda.ADOSPConsultaVALOR.asString;
      FrmPrincipalPreVenda.LancaProdutos(DBGrid2.Fields[2].Value,'','');
      FrmPrincipalPreVenda.EdtPreco.text := '0,00';
    end;
    ADOQryItensLista.Next;
  end;
  FrmPrincipalPreVenda.edtQtdItens.Text := IntToStr(ADOQryItensLista.RecordCount);
  ADOQryExcluir.Close;
  FrmPrincipalPreVenda.ListBox1.Items.Add('Escola:'+trim(DBGrid1.Fields[1].AsString) +' Série: '+trim(DBGrid1.Fields[2].AsString));
  FrmPrincipalPreVenda.edtcdLista.Text := AdoQryConsulta.fieldByName('cdLista').asString;//EdtcdLista.Text;
  FrmPrincipalPreVenda.SgDados.setfocus;
  close;
end;

procedure TFrmCadLista.TBSheetMdCadastroConsultaShow(Sender: TObject);
begin
  BtnMdAlterar.Enabled:= False;
  BtnMdExcluir.Enabled:= False;
  BtnMdImprimir.Enabled:= False;
  BtnMdNovo.Enabled:= False;
  BtnMdSalvar.Enabled:= False;
  BtnMdCancelar.Enabled:= False;
end;

procedure TFrmCadLista.edtcdProdChange(Sender: TObject);
begin
  if edtcdProd.Text = '' then
     Exit;
  ADOQryProduto.Open;
  if ADOQryProduto.Locate('cdproduto',edtcdProd.Text,[]) then
    CBxProduto.itemIndex:= CBxProduto.Items.IndexOf(ADOQryProduto.FieldByName('nmProduto').AsString)
  else
  begin
    CBxProduto.itemIndex:= -1;
    CBxProduto.Text:= '';
  end;
end;

procedure TFrmCadLista.edtcdProdExit(Sender: TObject);
var
  produto : TDOMProduto;
begin
  if edtcdProd.Text <> '' then
  begin
    produto := TNEGProduto.buscarProduto(StrToInt(edtcdProd.Text));
    if produto <> nil then
    begin
      CBxProduto.Text := produto.descricao;
    end;
  end;
end;

procedure TFrmCadLista.edtcdProdFltroExit(Sender: TObject);
var
  produto : TDOMProduto;
begin
  if edtcdProdFltro.Text <> '' then
  begin
    produto := TNEGProduto.buscarProduto(StrToInt(edtcdProdFltro.Text));
    if produto <> nil then
    begin
      CbxProdutoFiltro.Text := produto.descricao;
    end;
  end;
end;

procedure TFrmCadLista.edtcdProdFltroKeyPress(Sender: TObject; var Key: Char);
var
  produto : TDOMProduto;
begin
  ValidarNumero(Key);
  if Key = #42 then
  begin
    produto := TBuscaObjeto.BuscaProduto(cdOperador);
    if produto <> nil then
    begin
      CbxProdutoFiltro.Text := produto.descricao;
      edtcdProdFltro.Text := IntToStr(produto.cdProduto);
    end;
    Key := #0;
  end;
end;

procedure TFrmCadLista.edtcdProdKeyPress(Sender: TObject; var Key: Char);
var
  produto : TDOMProduto;
begin
  if Key = #42 then
  begin
    produto := TBuscaObjeto.BuscaProduto(cdOperador);
    if produto <> nil then
    begin
      CBxProduto.Text := produto.descricao;
      edtcdProd.Text := IntToStr(produto.cdProduto);
    end;
    Key := #0;
  end;
  ValidarNumero(Key);
end;

procedure TFrmCadLista.CBxProdutoExit(Sender: TObject);
begin
 //EdtQtdObj.SetFocus;
 //EdtQtdObj.SelectAll;
end;

procedure TFrmCadLista.CbxProdutoFiltroChange(Sender: TObject);
begin
  if (CbxProdutoFiltro.ItemIndex <> -1) and (CbxProdutoFiltro.Text <> '') then
  begin
    ADOQryProduto.Open;
    ADOQryProduto.Locate('nmProduto',CbxProdutoFiltro.Text,[]);
    edtcdProdFltro.Text :=ADOQryProduto.FieldByName('cdProduto').AsString;
  end
  else
    edtcdProdFltro.Clear;
end;

end.
