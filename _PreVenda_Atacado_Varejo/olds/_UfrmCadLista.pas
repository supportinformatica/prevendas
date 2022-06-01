unit UfrmCadLista;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, ImgList, ExtCtrls, StdCtrls, Grids, DBGrids, UItemPrevenda,
  ComCtrls, Buttons, cdConsultaEstoque, Vcl.Imaging.jpeg, System.DateUtils,
  FormRelLivrosFaltamChegar, FormConsultaEscolas;
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
    Label17: TLabel;
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
    CbxAgrupar: TComboBox;
    Label25: TLabel;
    CbxOrdenar: TComboBox;
    Label26: TLabel;
    CbxExibirProdutos: TCheckBox;
    Label27: TLabel;
    EdtCdListaImpressao: TEdit;
    LblEscola: TLabel;
    LblSerie: TLabel;
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
  private
   procedure AtivaCampos;
   procedure DesativaCampos;
   procedure AtualizaQryConsulta;
   procedure AtualizaCampos;
   procedure montaritens;
   Procedure TrataBotoesPadrao (Sender :TObject; Status :TStatus);
   procedure montaComboProdutos;
   procedure Montaserie;
   procedure MontaComboCliente;
   procedure MontaComboEscola;
   procedure MontaComboFornecedor;
   procedure MontaComboAnoExercicio;
   procedure ImprimeRelatorioLivrosSolicitadosAChegar;
   procedure ImprimeRelatorioAlunosResumido;
   procedure ImprimeRelatorioLivrosPorAluno;
   procedure BuscaLivrosAluno;
   procedure BuscaUltimoCodigoCdLista;
    { Private declarations }
  public
    { Public declarations }
      Vform:string;
      Status: TipoStatus;         // Padrao,Novo ou Alterar
      tipoForracaoAnterior: string;
      cdListaAnterior: String;
      //Pinta a string grid de acordo com o  select passado como paramentro
  end;

var
  FrmCadLista: TFrmCadLista;

implementation

uses uFuncoesPadrao, DataModulo, FrmCadEstados, RelOrcamentoLista, FrmPrincipal,
  FormRelListaRestante, MoPreVenda, FormRelAlunosLivros, NEGPrevenda;

{$R *.dfm}
procedure TFrmCadLista.montaserie;
begin
//  with AdoSerie do
//  begin
//   SQL.Text:='Select dsSerie,cdSerie from SerieEscolar order by 1';
             //'where cdEscola = :param                  ';
//    Parameters.ParamByName('param').Value := FrmCadLista.EdtcdEscola.Text;
    AdoSerie.Open;
    MontaComboListBoolAdo(AdoSerie,CBxSerie);
//  end;
end;
Procedure TFrmCadLista.TrataBotoesPadrao( Sender: TObject; Status: TStatus);
{ abilita ou desabilita os botões do fomulario pai }
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
procedure TFrmCadLista.AtivaCampos;
begin
   CBxEscola.Enabled     :=True;
   CBxSerie.Enabled      :=True;
   CBxProduto.Enabled    :=True;
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

procedure TFrmCadLista.EdtCdListaImpressaoEnter(Sender: TObject);
begin
  cdListaAnterior := EdtCdListaImpressao.Text;
end;

procedure TFrmCadLista.EdtCdListaImpressaoExit(Sender: TObject);
var qry: TADOQuery;
begin
  if (EdtCdListaImpressao.Text <> '') and (EdtPrevenda.Text <> '') then begin
    if cdListaAnterior <> EdtCdListaImpressao.Text then begin
      if Application.MessageBox('Confirma a alteração da lista (Escola e Série)?',
          'Confirmação',MB_YESNO + MB_ICONQUESTION + MB_APPLMODAL) = ID_YES then begin
        qry := TAdoQuery.Create(nil);
        qry.connection := DModulo.Conexao;
        with qry do begin
          sql.text := 'update orcamento set cdLista = :cdLista '+
                      'where nrOrcamento = :nrOrcamento                  ';
          parameters.ParamByName('nrOrcamento').Value := EdtPrevenda.Text;
          parameters.ParamByName('cdLista').Value := EdtCdListaImpressao.Text;
          ExecSQL
        end;
        cdListaAnterior := '';
      end;
    end;
  end;
end;

procedure TFrmCadLista.EdtCdListaImpressaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #42 then begin
    FrmConsultaEscolas := TFrmConsultaEscolas.Create(Application);
    FrmConsultaEscolas.ShowModal;
  end;
end;

procedure TFrmCadLista.AtualizaQryConsulta;
begin
  With AdoQryConsulta do Begin
    Sql.Clear;
    //SQL.Add('Declare @texto varchar(40)');
    //SQL.Add('Set @texto = :Parametro');
    SQL.Text:='Select E.cdEscola,E.dsEscola as Escola,S.cdSerie as cdSerie,S.dsSerie as Serie,                      '+
              'L.cdLista,year(L.Ano) as Ano From ListaEscolar L with(nolock) Inner Join SerieEscolar S with(nolock) '+
              'on L.cdSerie = S.cdSerie left join Escola E with(nolock) on L.cdEscola = E.cdEscola                  '+
              'where year(L.ano) = :anoExercicio                                                                    ';
    Parameters.ParamByName('anoExercicio').Value := CbxAnoFiltro.Text;
    case CmbConsulta.ItemIndex of
//      0: Sql.Add('Order By 4');
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
    { omite estes campos na grid }
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
    sql.clear;
    sql.text := 'Select I.CdObjeto,I.dsObjeto,I.qtd,P.nmProduto,i.qtd * P.vlPreco as Total, '+
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
  end;
end;

procedure TFrmCadLista.AtualizaCampos;
var
  i,l:Integer;
begin
  With AdoQryConsulta do begin                // move os campos para os componentes
    if AdoQryConsulta.RecordCount = 0 then begin
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
  FrmPrincipalPreVenda.CadastrodeLista1.enabled := true;
  Action :=cafree;
end;

procedure TFrmCadLista.FormCreate(Sender: TObject);
begin
  montaserie;
  MontaComboEscola;
  MontaComboAnoExercicio;
  with StringGrid1 do begin
    Cells[0,0] := 'Código ';
    Cells[1,0] := 'Descrição';
    Cells[2,0] := 'QTD';
    Cells[3,0] := 'Preço';
  end;
  with SgLivros do begin
    Cells[0,0]   := 'Livro';
    Cells[1,0]   := 'Observação';
    Cells[2,0]   := 'cdIteLcto';
    Cells[3,0]   := 'nrOrcamento';
    ColWidths[2] := -1;
    ColWidths[3] := -1;
  end;
  With CmbConsulta do begin  // adiciona itens a combo de consulta
    Items.Clear;
    Items.Add('Todos');
    Items.Add('Código');
    Items.Add('Escola');
    Items.Add('Série');
    ItemIndex := 0;
  end;
  PgCtrolMdCadastro.ActivePageIndex := 0;
  CbxAnoFiltro.Text :='2016';// FormatDateTime('yyyy',date);
  AtualizaQryConsulta;
  montaritens;
  MontaComboCliente;
  montaComboProdutos;
  MontaComboFornecedor;
  DesativaCampos;

  //dtInicial.Date := Date;
  dtFinal.Date   := Date;

  BtnExport.Visible := true;
  FormStyle := fsStayOnTop;
end;

procedure TFrmCadLista.FormShow(Sender: TObject);
begin
   CmbConsulta.ItemIndex := 2;
   EdtConsulta.SetFocus;
end;

procedure TFrmCadLista.ImprimeRelatorioAlunosResumido;
begin
  FrmRelAlunosLivros := TFrmRelAlunosLivros.Create(Self); // Cria o formulário
  FrmRelAlunosLivros.QRLblTitulo.Caption := 'Relação de Alunos e tipos de forros solicitados';
  FrmRelAlunosLivros.QrlPeriodo.Caption := 'De '+datetostr(dtInicial.Date)+' a '+datetostr(dtFinal.Date);
  With FrmRelAlunosLivros.ADOQryRelDados do begin // monta a query para a impressao do orcamento
    sql.Text := 'select distinct O.nrOrcamento, O.tipoForracao, O.dtEmissao,          '+
                'O.cdCliente, P.nmPessoa, E.DsEscola, S.dsSerie                       '+
                'from orcamento O inner join Pessoa P on O.cdCliente = P.cdPessoa     '+
                'inner join IteOrcamento I on O.nrOrcamento = I.nrOrcamento           '+
                'inner join Produto PR on I.cdProduto = PR.cdProduto and PR.cdGrupo = 19 '+
                'left join ListaEscolar L on O.cdLista = L.CdLista                    '+
                'left join SerieEscolar S on L.cdSerie = S.cdSerie                    '+
                'left join Escola E on L.CdEscola = E.CdEscola                        '+
                'left join P_Fisica PF on PF.cdPessoa = P.cdPessoa                    '+
                'left join P_Juridica PJ on PJ.cdPessoa = P.cdPessoa                  '+
                'where O.dsImpresso = ''S''                                           '+
                'and O.dtEmissao between :dt1 and :dt2                                ';
    Parameters.ParamByName('dt1').Value := dateOf(dtInicial.Date);
    Parameters.ParamByName('dt2').Value := dateOf(dtFinal.Date);

    if EdtCdPessoa.Text <> '' then begin
      sql.Add('and O.cdCliente = :cdCliente ');
      Parameters.ParamByName('cdCliente').Value := EdtCdPessoa.Text;
    end;
    if Trim(EdtPrevenda.Text) <> '' then begin
      sql.Add('and O.nrOrcamento = :nrOrcamento ');
      Parameters.ParamByName('nrOrcamento').Value := EdtPrevenda.Text;
    end;
    if Trim(EdtApelido.Text) <> '' then begin
      sql.add('and (case when (P.Existir = ''F'') then PF.dsNaturalidade      ');
      sql.add('when (P.Existir = ''J'') then PJ.nmContato end ) like :apelido ');
      Parameters.ParamByName('apelido').Value := '%'+EdtApelido.Text+'%';
    end;
    sql.add('order by 5');
    Open;
  end;
  if FrmRelAlunosLivros.ADOQryRelDados.RecordCount = 0 then begin
    Application.MessageBox('Nenhum dado encontrado de acordo com os filtros!','Atenção', MB_OK + MB_ICONWARNING + MB_APPLMODAL);
    exit;
  end;
  FrmRelAlunosLivros.QRMdRel.PreviewModal;
  FrmRelAlunosLivros.Free;
end;

procedure TFrmCadLista.ImprimeRelatorioLivrosPorAluno;
begin
  if (EdtCdPessoa.Text = '') and (trim(EdtPrevenda.text) = '') then begin
    Application.MessageBox('Selecione um aluno ou digite o numero da pré-venda!','Atenção', mb_ok + MB_ICONWARNING + MB_APPLMODAL);
    CbxPessoa.SetFocus;
    Exit;
  end;

  FrmRelAlunosLivros := TFrmRelAlunosLivros.Create(Self); // Cria o formulário
  FrmRelAlunosLivros.QRLblTitulo.Caption := 'Relação de Livros';
  FrmRelAlunosLivros.QrlPeriodo.Caption := 'De '+datetostr(dtInicial.Date)+' a '+datetostr(dtFinal.Date);
  With FrmRelAlunosLivros.ADOQryRelDados do begin // monta a query para a impressao do orcamento
    sql.Text := 'SELECT distinct O.nrOrcamento, O.dtEmissao, O.cdCliente,        '+
                'E.DsEscola,Editora.nmPessoa as nomeEditora,                     '+
                'P.nmPessoa as nomeCliente,It.observacao,                        '+
                'S.dsSerie AS SERIE,PR.cdPessoa_1 AS cdEditora,                  '+
                'O.tipoForracao,                                                 '+
                'CASE WHEN IT.Recebido >= IT.nrQtd THEN ''SIM''                  '+
                '                                  ELSE ''NAO'' END AS ATENDIDO, '+
                'PR.nmproduto AS TITULO, Pr.cdProduto,                           '+
                'case when (P.Existir = ''F'') then PF.dsNaturalidade            '+
                '     when (P.Existir = ''J'') then PJ.nmContato                 '+
                'End as Apelido                                                  '+
                'FROM Orcamento O                                                '+
                'INNER JOIN IteOrcamento IT                                      '+
                'ON IT.nrOrcamento = O.nrOrcamento                               '+
                'INNER JOIN PRODUTO PR                                           '+
                'ON PR.cdProduto = IT.cdProduto and PR.cdGrupo = 19              '+
                'INNER JOIN PESSOA P                                             '+
                'ON P.cdPessoa = O.cdCliente                                     '+
                'left JOIN ListaEscolar L                                        '+
                'ON L.cdLista = O.cdLista                                        '+
                'left JOIN SerieEscolar S                                        '+
                'ON S.cdSerie = L.cdSerie                                        '+
                'left join Escola E on L.CdEscola = E.CdEscola                   '+
                'inner join Pessoa Editora on Editora.cdPessoa = Pr.cdPessoa_1   '+
                'left join P_Fisica PF on PF.cdPessoa = P.cdPessoa               '+
                'left join P_Juridica PJ on PJ.cdPessoa = P.cdPessoa             '+
                'WHERE O.dsImpresso = ''S''                                      ';

    if EdtCdPessoa.Text <> '' then begin
      sql.Add('and O.nrOrcamento = (select MAX(nrOrcamento) from Orcamento where cdCliente = :cdCliente) ');
      Parameters.ParamByName('cdCliente').Value := EdtCdPessoa.Text;
    end;
    if Trim(EdtPrevenda.Text) <> '' then begin
      sql.Add('and O.nrOrcamento = :nrOrcamento ');
      Parameters.ParamByName('nrOrcamento').Value := EdtPrevenda.Text;
    end;
    if Trim(EdtApelido.Text) <> '' then begin
      sql.add('and (case when (PE.Existir = ''F'') then PF.dsNaturalidade      ');
      sql.add('when (PE.Existir = ''J'') then PJ.nmContato end ) like :apelido ');
      Parameters.ParamByName('apelido').Value := '%'+EdtApelido.Text+'%';
    end;
    sql.add('order by 4');
    Open;
  end;
  if FrmRelAlunosLivros.ADOQryRelDados.RecordCount = 0 then begin
    Application.MessageBox('Nenhum dado encontrado de acordo com os filtros!','Atenção', MB_OK + MB_ICONWARNING + MB_APPLMODAL);
    exit;
  end;
  FrmRelAlunosLivros.QrMDRelCompleto.PreviewModal;
  FrmRelAlunosLivros.Free;
end;

procedure TFrmCadLista.ImprimeRelatorioLivrosSolicitadosAChegar;
begin
  FrmRelLivrosFaltamChegar := TFrmRelLivrosFaltamChegar.Create(self);
  FrmRelLivrosFaltamChegar.QrlPeriodo.Caption := 'De '+datetostr(dtInicial.Date)+' a '+datetostr(dtFinal.Date);
  With FrmRelLivrosFaltamChegar.ADOQryRelDados do begin // monta a query para a impressao do orcamento
    sql.Text := 'select O.nrOrcamento, O.dtEmissao, O.tipoForracao, P.cdProduto,              '+
                'P.nmProduto,PE.cdPessoa, PE.nmPessoa, dbo.TELEFONES(PE.cdPessoa) as tels,    '+
                'case when (PE.Existir = ''F'') then PF.dsNaturalidade                        '+
                '   when (PE.Existir = ''J'') then PJ.nmContato                               '+
                'End as Apelido,                                                              '+
                '(I.nrQtd) as qtdPrevenda,                                                    '+
                '  case when (isnull(IP.nrQtd,0)) > i.nrQtd then i.nrQtd                      '+
                '     else isnull(IP.nrQtd,0)                                                 '+
                '  end as qtdPedComp,                                                         '+
                '  case when (isnull(Ip.nrQtdChegada,0)) > I.nrQtd then I.nrQtd               '+
                '     else ISNULL(Ip.nrQtdChegada,0)                                          '+
                '  end as nrQtdChegada,                                                       '+
                '  case when (isnull(IP.nrQtd - Ip.nrQtdChegada,0)) > I.nrQtd then I.nrQtd    '+
                '     else ISNULL(IP.nrQtd - Ip.nrQtdChegada,0)                               '+
                '  end as faltaChegar                                                         '+
//                '(I.nrQtd) as qtdPrevenda,                                                    '+
//                'isnull(IP.nrQtd,0) as qtdPedComp, isnull(Ip.nrQtdChegada,0) as nrQtdChegada, '+
//                'isnull(IP.nrQtd - Ip.nrQtdChegada,0) as faltaChegar                          '+
                'from Orcamento O inner join IteOrcamento I on I.nrOrcamento = O.nrOrcamento  '+
                'left join Itepedcomp IP on IP.cdProduto = I.cdProduto                        '+
                'inner join Produto P on I.cdProduto = P.cdProduto and P.cdGrupo = 19         '+
                'left join Pessoa PE on O.cdCliente = PE.cdPessoa                             '+
                'left join P_Fisica PF on PF.cdPessoa = PE.cdPessoa                           '+
                'left join P_Juridica PJ on PJ.cdPessoa = Pe.cdPessoa                         '+
                'where O.dsImpresso = ''S'' and O.nrOrcamento >= 448290                       '+
                'and O.dtEmissao between :dt1 and :dt2                                        ';

    Parameters.ParamByName('dt1').Value := dateOf(dtInicial.Date);
    Parameters.ParamByName('dt2').Value := dateOf(dtFinal.Date);

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

    case CbxOrdenar.ItemIndex of
      0: sql.Add('order by PE.nmPessoa '); //Cliente
      1: sql.Add('order by O.nrOrcamento '); //Prevenda
//      2: sql.Add('order by PE.nmPessoa '); //Sequencial
    end;
    Open;

  end;
  if FrmRelLivrosFaltamChegar.ADOQryRelDados.RecordCount = 0 then begin
    Application.MessageBox('Nenhum dado encontrado de acordo com os filtros!','Atenção', MB_OK + MB_ICONWARNING + MB_APPLMODAL);
    exit;
  end;
  FrmRelLivrosFaltamChegar.QRBand1.Enabled := CbxExibirProdutos.Checked;
  if CbxExibirProdutos.Checked = false then
    FrmRelLivrosFaltamChegar.QRBand1.Height := 18;

  FrmRelLivrosFaltamChegar.QRMdRel.PreviewModal;
  FrmRelLivrosFaltamChegar.Free;



 { FrmRelListaRestante := TFrmRelListaRestante.Create(Self); // Cria o formulário
  FrmRelListaRestante.QRLblTitulo.Caption := 'Relatório dos produtos a chegar (De acordo com o pedido de compra)';
  FrmRelListaRestante.QrlPeriodo.Caption := 'De '+datetostr(dtInicial.Date)+' a '+datetostr(dtFinal.Date);

  With FrmRelListaRestante.ADOQryRelDados do begin // monta a query para a impressao do orcamento
    sql.Text := 'select Ip.nrLancto as NumeroPedComp,I.nrOrcamento, O.dtEmissao, P.cdProduto, '+
                'P.nmProduto,PE.cdPessoa, PE.nmPessoa, dbo.TELEFONES(PE.cdPessoa) as tels,    '+
                'case when (PE.Existir = ''F'') then PF.dsNaturalidade                        '+
                '     when (PE.Existir = ''J'') then PJ.nmContato                             '+
                'End as Apelido,                                                              '+
                'sum(I.nrQtd) as qtdPrevenda,                                                 '+
                'isnull(IP.nrQtd,0) as qtdPedComp, isnull(Ip.nrQtdChegada,0) as nrQtdChegada, '+
                'isnull(sum(IP.nrQtd - Ip.nrQtdChegada),0) as faltaChegar                     '+
                'from Orcamento O left join IteOrcamento I on I.nrOrcamento = O.nrOrcamento   '+
                'left join Itepedcomp IP on IP.cdProduto = I.cdProduto                        '+
                'left join Produto P on I.cdProduto = P.cdProduto and P.cdGrupo = 19          '+ //somente livros
                'left join Pessoa PE on O.cdCliente = PE.cdPessoa                             '+
                'left join P_Fisica PF on PF.cdPessoa = PE.cdPessoa                           '+
                'left join P_Juridica PJ on PJ.cdPessoa = Pe.cdPessoa                         '+
                'where O.dsImpresso = ''S'' and O.cdLista is not null                         '+ // (IP.nrQtd - IP.nrQtdChegada) > 0 and
                'and O.dtEmissao between :dt1 and :dt2                                        ';

    Parameters.ParamByName('dt1').Value := dateOf(dtInicial.Date);
    Parameters.ParamByName('dt2').Value := dateOf(dtFinal.Date);

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
    if Trim(EdtApelido.Text) <> '' then begin
      sql.add('and (case when (PE.Existir = ''F'') then PF.dsNaturalidade      ');
      sql.add('when (PE.Existir = ''J'') then PJ.nmContato end ) like :apelido ');
      Parameters.ParamByName('apelido').Value := '%'+EdtApelido.Text+'%';
    end;
    if Trim(EdtCdFornecedor.Text) <> '' then begin
      sql.Add('and O.nrOrcamento = :nrOrcamento ');
      Parameters.ParamByName('nrOrcamento').Value := EdtCdFornecedor.Text;
    end;

    sql.Add('group by Ip.nrLancto, P.cdProduto, P.nmProduto, I.nrOrcamento,   ');
    sql.Add('O.dtEmissao, PE.cdPessoa, PE.nmPessoa,IP.nrQtd, Ip.nrQtdChegada, ');
    sql.add('PE.Existir,PF.dsNaturalidade,PE.Existir,PJ.nmContato             ');
    Open;

  end;
  if FrmRelListaRestante.ADOQryRelDados.RecordCount = 0 then begin
    Application.MessageBox('Nenhum dado encontrado de acordo com os filtros!','Atenção', MB_OK + MB_ICONWARNING + MB_APPLMODAL);
    exit;
  end;
  FrmRelListaRestante.QRMdRel.PreviewModal;
  FrmRelListaRestante.Free;
  }
end;

procedure TFrmCadLista.MontaComboAnoExercicio;
begin
  MontaComboListBoolADO(ADOQryAno,CbxAnoFiltro);
  CbxAno.Items.Clear;
  CbxAno.Items := CbxAnoFiltro.Items;
end;

procedure TFrmCadLista.MontaComboCliente;
begin
  With ADOQryCliente do begin // monta a combo dos clientes
    Sql.Text := 'SELECT P.nmPessoa,P.cdPessoa '+
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
begin
  with ADOQryCombFone do
  begin
    SQL.Text:='Select dsEscola,cdEscola from Escola order by dsEscola';
    Open;
    MontaComboListBoolAdo(ADOQryCombFone,CbxEscola);
  end;
end;

procedure TFrmCadLista.MontaComboFornecedor;
begin
  With AdoFornecedor do begin // monta a combo de fornecedor
    Sql.Text := 'Select P.nmPessoa,P.cdPessoa,P.Existir,P.ser,E.dsBairro,E.dsCidade, '+
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
      Sql.Text := 'Select P.nmProduto,P.cdProduto,P.vlPreco,P.nrQtdReal     '+
                  'From Produto P WITH (NOLOCK)                             '+
                  'where NOT( P.dstipo_item IN ( ''07'', ''08'', ''10'' ))  '+
                  'and P.dsAtivo = ''S''                                    '+
                  'Order By P.nmProduto                                     ';
      open;
      MontaComboListBoolAdo(ADOQryProduto,CBxProduto);
      CbxProdutoFiltro.Items := CBxProduto.Items;
    end;
  end;
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
  if PgCtrolMdCadastro.ActivePage = TBSheetMdImpressao then begin
    TrataBotoesPadrao(Sender,Impressao);
    Status:=[Impressao];
    BtnExport.Enabled := false;
  end;
end;

procedure TFrmCadLista.RgTipoRelClick(Sender: TObject);
begin
  case RgTipoRel.ItemIndex of
    0: begin
      cbxProdutoFiltro.Enabled := True;
      dtInicial.Enabled := true;
      dtFinal.Enabled   := true;
      LblLivros.Visible := false;
      SgLivros.Visible  := false;
      EdtApelido.Enabled := True;
      CbxFornecedor.Enabled := true;
      CbxAgrupar.Enabled := true;
      CbxOrdenar.Enabled := true;
    end;
    1: begin
      cbxProdutoFiltro.Enabled := false;
      dtInicial.Enabled := true;
      dtFinal.Enabled   := true;
      LblLivros.Visible := false;
      SgLivros.Visible  := false;
      EdtApelido.Enabled := True;
      CbxFornecedor.Enabled := false;
      CbxAgrupar.Enabled := false;
      CbxOrdenar.Enabled := false;
    end;
    2: begin
      cbxProdutoFiltro.Enabled := false;
      dtInicial.Enabled := false;
      dtFinal.Enabled   := false;
      LblLivros.Visible := true;
      SgLivros.Visible  := true;
      EdtApelido.Enabled := false;
      CbxFornecedor.Enabled := false;
      CbxAgrupar.Enabled := false;
      CbxOrdenar.Enabled := false;
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
  CbxAno.Text := '2016';//FormatDateTime('yyyy',date);
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
        SQL.Text:=' Delete From ItensLista   '+
                  ' Where cdLista = :cdLista ';
        Parameters.ParamByName('cdLista').Value := EdtcdLista.Text;
        ExecSql;
        Sql.Text := 'Delete From ListaEscolar         '+
                    'Where cdLista = :cdLista  ';
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
  if dtInicial.Date > dtFinal.date then begin
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
  if ADOQryConsulta.RecordCount > 0 then begin
    frmRelOrcamentoLista := TfrmRelOrcamentoLista.Create(Self); // Cria o formulário
    With frmRelOrcamentoLista.ADOQryRelDados do begin // monta a query para a impressao do orcamento
      Sql.Text := 'Select I.CdObjeto,I.dsObjeto,I.qtd,P.nmProduto,          '+
                  'i.qtd * P.vlPreco as Total,P.cdProduto,                  '+
                  'P.dsPrateleira,P.cdFabricante,P.dsReferencia,            '+
                  'P.vlPreco, P.nrQtdReal, P.dsUnidade,                     '+
                  'E.DsEscola, S.dsSerie                                    '+
                  'from ListaEscolar L inner join ItensLista I with(nolock) '+
                  ' on L.cdLista = I.cdLista                                '+
                  'left JOIN SerieEscolar S ON S.cdSerie = L.cdSerie        '+
                  'left join Escola E on L.CdEscola = E.CdEscola            '+
                  ' inner Join Produto P with(nolock)                       '+
                  '     on I.cdObjeto = P.cdproduto                         '+
                  'where I.cdLista = :cdLista                               ';
      Parameters.ParamByName('cdLista').Value := ADOQryConsulta.FieldByName('cdLista').AsInteger;
      Open;
    end;
    frmRelOrcamentoLista.QrlCnpj.Caption := 'CNPJ: ' +
    frmRelOrcamentoLista.ADOQryConfig.FieldByName('dsCgc').AsString + '     I.E.: ' +
    frmRelOrcamentoLista.ADOQryConfig.FieldByName('dsInscricao').AsString;
    frmRelOrcamentoLista.QuickRep1.Preview;  // imprime o orcamento
    frmRelOrcamentoLista.Free;
  end;
end;

procedure TFrmCadLista.BuscaLivrosAluno;
var qry: TADOQuery;
    i:Integer;
begin
  Limpa_Grid(SgLivros);
  if (EdtCdPessoa.Text = '') and (trim(EdtPrevenda.text) = '') then begin
    Application.MessageBox('Selecione um aluno ou digite o numero da pré-venda!','Atenção', mb_ok + MB_ICONWARNING + MB_APPLMODAL);
    CbxPessoa.SetFocus;
    Exit;
  end;
  qry := TAdoQuery.Create(nil);
  qry.connection := DModulo.Conexao;
  with qry do begin
    sql.Text := 'SELECT distinct O.nrOrcamento, O.dtEmissao, O.cdCliente,      '+
                'E.DsEscola,Editora.nmPessoa as nomeEditora, O.cdLista,        '+
                'P.nmPessoa as nomeCliente,It.observacao,                      '+
                'S.dsSerie AS SERIE,PR.cdPessoa_1 AS cdEditora,                '+
                'O.tipoForracao, It.cdIteLcto,                                 '+
                'PR.nmproduto AS TITULO                                        '+
                'FROM Orcamento O                                              '+
                'INNER JOIN IteOrcamento IT                                    '+
                'ON IT.nrOrcamento = O.nrOrcamento                             '+
                'INNER JOIN PESSOA P                                           '+
                'ON P.cdPessoa = O.cdCliente                                   '+
                'INNER JOIN PRODUTO PR                                         '+
                'ON PR.cdProduto = IT.cdProduto and PR.cdGrupo = 19            '+
                'left JOIN ListaEscolar L                                      '+
                'ON L.cdLista = O.cdLista                                      '+
                'left JOIN SerieEscolar S                                      '+
                'ON S.cdSerie = L.cdSerie                                      '+
                'left join Escola E on L.CdEscola = E.CdEscola                 '+
                'inner join Pessoa Editora on Editora.cdPessoa = Pr.cdPessoa_1 '+
                'WHERE 1 = 1                                                   ';

    if EdtCdPessoa.Text <> '' then begin
      sql.Add('and O.nrOrcamento = (select MAX(nrOrcamento) from Orcamento where cdCliente = :cdCliente) ');
      Parameters.ParamByName('cdCliente').Value := EdtCdPessoa.Text;
    end;
    if Trim(EdtPrevenda.Text) <> '' then begin
      sql.Add('and O.nrOrcamento = :nrOrcamento ');
      Parameters.ParamByName('nrOrcamento').Value := EdtPrevenda.Text;
    end;
    sql.add('order by 4');

    open;
    i:= 1;
    while not Eof do begin
      with SgLivros do begin
        Cells[0,i] := FieldByName('TITULO').  AsString;  //'Livro';
        Cells[1,i] := FieldByName('observacao').AsString; //'Observação';
        Cells[2,i] := FieldByName('cdIteLcto').AsString; //'cdIteLcto';
        Cells[3,i] := FieldByName('nrOrcamento').AsString; //'nrOrcamento';
        RowCount := RowCount + 1;
      end;
      Inc(i);
      Next;
    end;
    if qry.FieldByName('tipoForracao').AsString <> '' then
      CbxForracao.Text := qry.FieldByName('tipoForracao').AsString
    else
      CbxForracao.ItemIndex := 5;
    if qry.FieldByName('cdLista').AsString <> '' then begin
      EdtCdListaImpressao.Text := qry.FieldByName('cdLista').AsString;
      LblEscola.Caption := 'Escola: '+qry.FieldByName('dsEscola').AsString;
      LblSerie.Caption := 'Série: '+qry.FieldByName('serie').AsString;
    end
    else begin
      EdtCdListaImpressao.text := '';
      LblEscola.Caption := '';
      LblSerie.Caption := '';
    end;
    close;
  end;
  FreeAndNil(qry);
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
if not (gdSelected in state) then begin
    if (ARow <> 0) and ((ARow mod 2) = 0)  then begin
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
  for i := 1 to SgLivros.RowCount do begin
    if SgLivros.Cells[0,i] <> '' then begin
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
      CBxProduto.SetFocus;
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
  CBxProduto.SetFocus;
end;

procedure TFrmCadLista.EdtQtdObjExit(Sender: TObject);
var qtd,qtdloc,l,i : integer;
begin
  if trim(EdtQtdObj.Text) = '' then
    exit;
  try
    if (StrToFloatDef(EdtQtdObj.Text,0)>0)AND(CBxProduto.itemIndex >-1) then // AND(edtcdProd.Text<>'')
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
    end
    else
    begin
      showmessage('Escolha o produto e insira a quantidade');
      CBxProduto.SetFocus;
    end;
  Except
    on E: Exception do
    begin
       DModulo.Conexao.RollbackTrans;
       Messagedlg('Não foi possivel adicionar o produto!' + #13'' + '', mterror, [mbOk], 0);
       CBxProduto.setfocus;
    end;
  end;
end;

procedure TFrmCadLista.CbxAnoFiltroChange(Sender: TObject);
begin
  AtualizaQryConsulta;
end;

procedure TFrmCadLista.CBxEscolaChange(Sender: TObject);
begin
  if (CBxEscola.Text <> '') then begin
    ADOQryCombFone.Open;
    if ADOQryCombFone.Locate('dsEscola',CBxEscola.Text,[]) then
      EdtcdEscola.Text :=ADOQryCombFone.FieldByName('cdEscola').AsString
    else
      EdtCdEscola.Clear;
  end else begin
    EdtCdEscola.Clear;
  end;
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
  begin
    EdtCdFornecedor.Clear;
  end;
end;

procedure TFrmCadLista.CbxForracaoEnter(Sender: TObject);
begin
  tipoForracaoAnterior := CbxForracao.Text;
end;

procedure TFrmCadLista.CbxForracaoExit(Sender: TObject);
var qry: TADOQuery;
begin
  if EdtPrevenda.Text <> '' then begin
    if tipoForracaoAnterior <> CbxForracao.Text then begin
      if Application.MessageBox('Confirma a alteração do tipo da forração?',
          'Confirmação',MB_YESNO + MB_ICONQUESTION + MB_APPLMODAL) = ID_YES then begin
        qry := TAdoQuery.Create(nil);
        qry.connection := DModulo.Conexao;
        with qry do begin
          sql.text := 'update orcamento set tipoForracao = :tipoForracao '+
                      'where nrOrcamento = :nrOrcamento                  ';
          parameters.ParamByName('nrOrcamento').Value := EdtPrevenda.Text;
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
  if (CbxPessoa.ItemIndex <> -1) and (CbxPessoa.Text <> '') then begin
    ADOQryCliente.Open;
    ADOQryCliente.Locate('nmPessoa',CbxPessoa.Text,[]);
    EdtCdPessoa.Text :=ADOQryCliente.FieldByName('cdPessoa').AsString;
  end else begin
    EdtCdPessoa.Clear;
  end;
  BuscaLivrosAluno;
end;

procedure TFrmCadLista.CBxSerieChange(Sender: TObject);
begin
  if (CBxSerie.Text <> '') then begin
    AdoSerie.Open;
    if AdoSerie.Locate('dsSerie',cbxserie.Text,[]) then
      EdtcdSerie.Text := AdoSerie.FieldByName('cdSerie').AsString
    else
      EdtcdSerie.Clear;
  end else begin
    EdtcdSerie.Clear;
  end;
end;

procedure TFrmCadLista.CBxProdutoChange(Sender: TObject);
begin
  if (CBxProduto.ItemIndex <> -1) and (CBxProduto.Text <> '') then begin
    ADOQryProduto.Open;
    ADOQryProduto.Locate('nmProduto',CBxProduto.Text,[]);
    edtcdProd.Text :=ADOQryProduto.FieldByName('cdProduto').AsString;
  end else begin
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
    if trim(EdtcdEscola.Text) = '' then begin
      Application.MessageBox('Selecione uma Escola!','Atenção',MB_OK + MB_ICONWARNING + MB_APPLMODAL);
      CBxEscola.SetFocus;
      exit;
    end;
    if trim(EdtcdSerie.Text) = '' then begin
      Application.MessageBox('Selecione uma Série!','Atenção',MB_OK + MB_ICONWARNING + MB_APPLMODAL);
      CBxSerie.SetFocus;
      exit;
    end;

    if Status = [Novo] then begin
      //If not CamposObrigatoriosPreenchidos(TBSheetMdCadastroDados) then exit;
      With ADOQryAlterar do
      begin   // parametros para a query de inclusão de novo registro
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
      With ADOQryAlterar do begin  // parametros para a query de alteracao
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
            //BtnMdCancelarClick(Sender);
            MessageDlg ('Não foi possivel Alterar! Motivo: '+E.Message, mtWarning, [mbOk], 0);
          end;
//          Messagedlg('Não é possivel Alterar!', mtinformation, [mbOk], 0);
        end;
      end;
    end;
    // ativa botoes, desabilita edicao e atualiza query
    DesativaCampos;
    TrataBotoesPadrao(Sender,Padrao);
    Status := [Padrao];
    //AtualizaQryConsulta;
    //montaritens;
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
  if Vform ='C'then begin
    Limpa_Grid(StringGrid1);
    AtualizaCampos;
    PgCtrolMdCadastro.ActivePage := TBSheetMdCadastroDados;
   // montaComboProdutos;
//    With ADOQryProduto do begin  // mota a combo dos nomes dos produtos
//      if ADOQryProduto.Active = False then begin
//        Sql.Text := 'Select P.nmProduto,P.cdProduto,P.vlPreco,P.nrQtdReal '+
//                    'From Produto P WITH (NOLOCK) WHERE P.dsAtivo = ''S'' Order By P.nmProduto    ';
//        open;
//        MontaComboListBoolAdo(ADOQryProduto,CBxProduto);
//      end;
//    end;
//  desativacampos;
    TrataBotoespadrao(sender,padrao);
    Status := [Padrao];
  end;
end;

procedure TFrmCadLista.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if (TAuxDBGrid(dbgrid1).DataLink.ActiveRecord + 1 = TAuxDBGrid(dbgrid1).Row)  or(gdSelected in State)then begin
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

procedure TFrmCadLista.EdtPrevendaChange(Sender: TObject);
begin
  BuscaLivrosAluno;
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
        //MaxLength := 255;
        // aqui vc pode adicionar a data de como vai ser exibida no input:
        //EditMask := '99/99/9999';
        // PasswordChar := '*';
        //SelectAll;
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
var i,l:Integer;
var
  itemPrevenda:TItemPrevenda;
begin
//  if FrmPrincipalPreVenda.edtcdLista.Text <> '' then
//  begin
//    Application.MessageBox('Já existe uma lista na tela da pré-venda!','Atenção', mb_ok + MB_ICONWARNING + MB_APPLMODAL);
//    exit;
//  end;
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

{ TODO -oClaudioO -c : remover comentário abaixo qnd for compilar prevenda ATACADO E VAREJO 04/12/2015 10:40:43 }
//       TNEGPrevenda.setItemNaPrevenda(FrmPrincipalPreVenda.prevenda, itemPrevenda);
//       FrmPrincipalPreVenda.AtualizarGridComItensDaPrevenda;
//       FrmPrincipalPreVenda.AtualizarCamposTotalizadores;

      FrmPrincipalPreVenda.EdtPreco.text := FrmPrincipalPreVenda.ADOSPConsultaVALOR.asString;
      FrmPrincipalPreVenda.LancaProdutos(DBGrid2.Fields[2].Value,'','');
      FrmPrincipalPreVenda.EdtPreco.text := '0,00';
    end;
    ADOQryItensLista.Next;
  end;
  FrmPrincipalPreVenda.edtQtdItens.Text := IntToStr(ADOQryItensLista.RecordCount);
  ADOQryExcluir.Close;
  //FrmPrincipalPreVenda.ListBox1.Visible:=True;
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
     //CBxProduto.Text :=ADOQryProduto.FieldByName('nmProduto').AsString
  else
  begin
    CBxProduto.itemIndex:= -1;
    CBxProduto.Text:= '';
  end;
end;

procedure TFrmCadLista.edtcdProdKeyPress(Sender: TObject; var Key: Char);
begin
  if {(Key = Char(101)) or (Key = Char(69)) or }(Key = Char(42)) then
  begin  // Tabeça de preços E
    FrmCdEstoque:= TFrmCdEstoque.Create(Application);
    //FrmCdEstoque.Position := poMainFormCenter;  comentei porque estava dando erro com o VCLSKIN
    FrmCdEstoque.vTipoForm:= 13;
    FrmCdEstoque.CBxTpItem.Items.Delete(12);
    FrmCdEstoque.CBxTpItem.Items.Delete(7);
    FrmCdEstoque.CBxTpItem.ItemIndex := 0; //itens de revenda
    //FrmCdEstoque.EdtConsulta.SetFocus;
    Key:= #0;
    FrmCdEstoque.ShowModal;
    exit;
  end;
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
  begin
    edtcdProdFltro.Clear;
  end;
end;

end.


