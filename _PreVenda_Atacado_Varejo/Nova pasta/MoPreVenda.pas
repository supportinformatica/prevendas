unit MoPreVenda;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, ComCtrls, ExtCtrls, Db, DBTables, DBGrids, RelOrcamentos,
  Menus, ShellApi, IniFiles, ADODB, Variants, XPMan,TypInfo{, letreiro},
  {WinSkinData,} Math, DateUtils, RLConsts, MaskUtils, Themes, NEGCliente, NEGLoja,
  Vcl.ActnMan, System.Generics.Collections,NEGFabricante,
  RLReport, NEGPrevenda, frmComprouJunto, DOMCliente,
  formUltimasVendasDoProdutoAoCliente, DOMPrevenda, UitemPrevenda, DOMFuncionario,
  NEGAmbiente, NEGFuncionario;

type
  VetorPermissao = Array[1..900,1..7] of String;
  TAuxDBGrid = class(TDBGrid);

type
  TRestricao = (ATRASO, LIMITE, CHEQUE); //tipo de restricoes que um cliente pode ter

type
  TListaRestricao = set of TRestricao;

type
  TFrmPrincipalPreVenda = class(TForm)
    Label28: TLabel;
    EdtLancto: TEdit;
    Label29: TLabel;
    CbxNome: TComboBox;
    Label30: TLabel;
    CbxCliente: TComboBox;
    EdtCdCliente: TEdit;
    DtLancto: TDateTimePicker;
    Label32: TLabel;
    BtnAprazo: TBitBtn;
    BtnConfirmar: TBitBtn;
    BtnCancelar: TBitBtn;
    BtnSair: TBitBtn;
    EdtTotal: TEdit;
    EdtDesconto: TEdit;
    EdtSubTotal: TEdit;
    EdtOperador: TEdit;
    EdtCdNome: TEdit;
    RadioGroup1: TRadioGroup;
    CmbConsulta: TComboBox;
    DBGrid1: TDBGrid;
    BtnMdPrimeiro: TBitBtn;
    BtnMdAnterior: TBitBtn;
    BtnMdProximo: TBitBtn;
    BtnMdUltimo: TBitBtn;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DsConsulta: TDataSource;
    PopupMenu1: TPopupMenu;
    Banese1: TMenuItem;
    HiperCard1: TMenuItem;
    VisaNet1: TMenuItem;
    AmericanExpress1: TMenuItem;
    Limpatextoparapesquisa1: TMenuItem;
    ConsultaProduto1: TMenuItem;
    Help1: TMenuItem;
    Alterarpreodoproduto1: TMenuItem;
    RgOpcoes: TRadioGroup;
    ConsultaEspecificacao1: TMenuItem;
    ADOSPConsulta: TADOStoredProc;
    ADOQryProcura: TADOQuery;
    ADOQryEspecificacao: TADOQuery;
    ADOQryProduto: TADOQuery;
    ADOQryNome: TADOQuery;
    ADOQryCliente: TADOQuery;
    ADOQryUltimo: TADOQuery;
    ADOQrySalvar: TADOQuery;
    Produtossimilares1: TMenuItem;
    AdoQrySimilar: TADOQuery;
    Label9: TLabel;
    EdtEndereco: TEdit;
    Label10: TLabel;
    EdtApelido: TEdit;
    ADOSPQryCliente: TADOStoredProc;
    SpeedButton1: TSpeedButton;
    AdoQryLocaliza: TADOQuery;
    Cadastrodeclientes1: TMenuItem;
    Registraperdadevemdaporestoqueinsuficiente1: TMenuItem;
    Consultadecrditodocliente1: TMenuItem;
    Alteraquantidade1: TMenuItem;
    SgDados: TStringGrid;
    ADOSPLiberacao1: TADOStoredProc;
    ADOSPLiberacao2: TADOStoredProc;
    ADOSPLiberacao4: TADOStoredProc;
    ADOSPLiberacao3: TADOStoredProc;
    Label12: TLabel;
    Consultapedidodecompra1: TMenuItem;
    ADOSP_PEDIDO_GARANTIA: TADOStoredProc;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    Label14: TLabel;
    ADOQuery1: TADOQuery;
    Excluiritens1: TMenuItem;
    Desconto1: TMenuItem;
    Cancelaraprvenda1: TMenuItem;
    Alterar1: TMenuItem;
    Oramento1: TMenuItem;
    Label16: TLabel;
    CdigoAdicional1: TMenuItem;
    Cancelar1: TMenuItem;
    Imprimiretiquetas1: TMenuItem;
    Editor: TRichEdit;
    EdtUsuario: TEdit;
    Label7: TLabel;
    CadastrodeEscola1: TMenuItem;
    CadastrodeSrie1: TMenuItem;
    CadastrodeLista1: TMenuItem;
    ConsultarListas1: TMenuItem;
    ListBox1: TListBox;
    Timer1: TTimer;
    ConsultarCrdito1: TMenuItem;
    ransferncia1: TMenuItem;
    Label18: TLabel;
    LblVista: TLabel;
    Label19: TLabel;
    LblPrazo: TLabel;
    ADOQryUltimoCodigo: TADOQuery;
    DsDeposito: TDataSource;
    Especificao1: TMenuItem;
    Relatriodecontagem1: TMenuItem;
    ADOSPConsultaCDIGO: TIntegerField;
    ADOSPConsultaCDIGO_BARRAS: TStringField;
    ADOSPConsultaREFERNCIA: TStringField;
    ADOSPConsultaDESCRIO: TStringField;
    ADOSPConsultaFABRICANTE: TStringField;
    ADOSPConsultaCDCODIGODIC: TStringField;
    ADOSPConsultaPRATELEIRA: TStringField;
    ADOSPConsultaESTOQUE: TFloatField;
    ADOSPConsultaPEDIDO: TFloatField;
    ADOSPConsultaUNIDADE: TStringField;
    ADOSPConsultaEMBALAGEM: TStringField;
    ADOSPConsultaPESO: TFloatField;
    ADOSPConsultaGRUPO: TStringField;
    ADOSPConsultaFORNECEDOR: TIntegerField;
    ADOSPConsultaDSPROMOCAO: TStringField;
    ADOSPConsultadsAtivo: TStringField;
    ADOSPConsultaPRECO: TFloatField;
    Label20: TLabel;
    edtQtdItens: TEdit;
    Imprimir1: TMenuItem;
    Visualizarapelidodocliente1: TMenuItem;
    Voltarparaotemaoriginal1: TMenuItem;
    ADOVarejo: TADOQuery;
    ADOQryProcura1: TADOQuery;
    ADOSPConsultadsCFOPD: TStringField;
    ADOSPConsultadsCFOPF: TStringField;
    btnMensagem: TBitBtn;
    DesbloquearPrVenda1: TMenuItem;
    Declaraodedevoluodecliente1: TMenuItem;
    adoEntrada: TADOQuery;
    ADOSPConsultaVALOR: TFloatField;
    Importarvendasexternas1: TMenuItem;
    GroupBox1: TGroupBox;
    LblMdConsulta: TLabel;
    LblListados: TLabel;
    Label1: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    LblEspecificacao: TLabel;
    Label21: TLabel;
    EdtQtd: TEdit;
    EdtConsulta: TEdit;
    CheckBox1: TCheckBox;
    EdtPreco: TEdit;
    CbPrevisao: TCheckBox;
    EdtDescUnit: TEdit;
    EdtCFOP: TEdit;
    Label22: TLabel;
    CbLote: TComboBox;
    Label23: TLabel;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Shape1: TShape;
    Shape5: TShape;
    Shape6: TShape;
    edtValorBruto: TEdit;
    Panel1: TPanel;
    lblMensagem: TLabel;
    Timer2: TTimer;
    MiCadastroAmbientes: TMenuItem;
    CbxAmbiente: TComboBox;
    EdtCdAmbiente: TEdit;
    AdoAmbiente: TADOQuery;
    LblAmbiente: TLabel;
    SimplesRemessa1: TMenuItem;
    ConsultarporCdigoAdicional1: TMenuItem;
    edtcdLista: TEdit;
    elaPrincipal1: TMenuItem;
    Consultas1: TMenuItem;
    Escola1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    ADOSPConsultadspromocaoatacado: TStringField;
    ADOSPConsultadspromocaovarejo: TStringField;
    ADOSPConsultanrqtdpromocao: TFloatField;
    miProdutosVendidosJunto: TMenuItem;
    miÚltimasVendasDoProdutoAoCliente: TMenuItem;
    cbxUsuario: TComboBox;
    Label8: TLabel;
    chkOcultarProdutosSemEstoque: TCheckBox;
    ro1: TMenuItem;
    edtLogin: TEdit;
    btnLogoff: TBitBtn;
    Memo1: TMemo;
    Label11: TEdit;
    LblReserva: TEdit;
    Label15: TEdit;
    Conferncia1: TMenuItem;
    Label13: TEdit;
    edtDisponivel: TEdit;
    Shape7: TShape;
    Label17: TLabel;
    Shape8: TShape;
    Consultarprvendas1: TMenuItem;
    Logoff1: TMenuItem;
    SBF5: TBitBtn;
    procedure ProcessaMsg (var Msg: Tmsg; var Handled: Boolean);
    procedure NaoProcessaMsg (var Msg: Tmsg; var Handled: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure EdtQtdExit(Sender: TObject);
    procedure EdtDescontoExit(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnConfirmarClick(Sender: TObject);
    procedure SgDadosDblClick(Sender: TObject);
    procedure CbxClienteChange(Sender: TObject);
    procedure SBF5Click(Sender: TObject);
    procedure EdtPrecoExit(Sender: TObject);
    procedure EdtQtdKeyPress(Sender: TObject; var Key: Char);
    procedure EdtPrecoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtSubTotalKeyPress(Sender: TObject; var Key: Char);
    procedure EdtSubTotalExit(Sender: TObject);
    procedure CbxNomeChange(Sender: TObject);
    procedure BtnAprazoClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BtnSairClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox1Enter(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure EdtConsultaChange(Sender: TObject);
    procedure Banese1Click(Sender: TObject);
    procedure HiperCard1Click(Sender: TObject);
    procedure RedeCard1Click(Sender: TObject);
    procedure VisaNet1Click(Sender: TObject);
    procedure AmericanExpress1Click(Sender: TObject);
    procedure DescrioContendo1Click(Sender: TObject);
    procedure BtnMdPrimeiroClick(Sender: TObject);
    procedure BtnMdProximoClick(Sender: TObject);
    procedure BtnMdAnteriorClick(Sender: TObject);
    procedure BtnMdUltimoClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure EdtDescontoKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure ConsultaProduto1Click(Sender: TObject);
    procedure Help1Click(Sender: TObject);
    procedure Alterarpreodoproduto1Click(Sender: TObject);
    procedure RgOpcoesClick(Sender: TObject);
    procedure EdtLanctoExit(Sender: TObject);
    procedure EdtLanctoKeyPress(Sender: TObject; var Key: Char);
    procedure ConsultaEspecificacao1Click(Sender: TObject);
    procedure Produtossimilares1Click(Sender: TObject);
    procedure EdtDescUnitExit(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure EdtConsultaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Cadastrodeclientes1Click(Sender: TObject);
    procedure ConsultaClientepeloCPFouCNPJ1Click(Sender: TObject);
    procedure Registraperdadevemdaporestoqueinsuficiente1Click(
      Sender: TObject);
    procedure Consultadecrditodocliente1Click(Sender: TObject);
    procedure Alteraquantidade1Click(Sender: TObject);
    procedure SgDadosExit(Sender: TObject);
    procedure SgDadosSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure CbxClienteExit(Sender: TObject);
    procedure Consultapedidodecompra1Click(Sender: TObject);
    procedure Excluiritens1Click(Sender: TObject);
    procedure Desconto1Click(Sender: TObject);
    procedure CbxClienteKeyPress(Sender: TObject; var Key: Char);
    procedure CbxNomeKeyPress(Sender: TObject; var Key: Char);
    procedure BtnAprazoKeyPress(Sender: TObject; var Key: Char);
    procedure BtnConfirmarKeyPress(Sender: TObject; var Key: Char);
    procedure BtnCancelarKeyPress(Sender: TObject; var Key: Char);
    procedure BtnSairKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure Alterar1Click(Sender: TObject);
    procedure Oramento1Click(Sender: TObject);
    procedure EdtCdNomeExit(Sender: TObject);
    procedure Cancelaraprvenda1Click(Sender: TObject);
    procedure CdigoAdicional1Click(Sender: TObject);
    procedure EdtConsultaKeyPress(Sender: TObject; var Key: Char);
    procedure Imprimiretiquetas1Click(Sender: TObject);
    procedure EdtUsuarioExit(Sender: TObject);
    procedure EdtUsuarioKeyPress(Sender: TObject; var Key: Char);
    procedure SgDadosClick(Sender: TObject);
    procedure Monta_Combo;
    procedure CadastrodeEscola1Click(Sender: TObject);
    procedure CadastrodeSrie1Click(Sender: TObject);
    procedure CadastrodeLista1Click(Sender: TObject);
    procedure ConsultarListas1Click(Sender: TObject);
    procedure SgDadosDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure ransferncia1Click(Sender: TObject);
    procedure ConsultarCrdito1Click(Sender: TObject);
    procedure Especificao1Click(Sender: TObject);
    procedure Relatriodecontagem1Click(Sender: TObject);
    procedure atualizaEditQtdItens;
    procedure Imprimir1Click(Sender: TObject);
    procedure Visualizarapelidodocliente1Click(Sender: TObject);
    procedure Voltarparaotemaoriginal1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure EdtPrecoEnter(Sender: TObject);
    procedure EdtCFOPKeyPress(Sender: TObject; var Key: Char);
    procedure btnMensagemClick(Sender: TObject);
    procedure DesbloquearPrVenda1Click(Sender: TObject);
    procedure Declaraodedevoluodecliente1Click(Sender: TObject);
    procedure Importarvendasexternas1Click(Sender: TObject);
    procedure CbLoteChange(Sender: TObject);
    procedure EdtCFOPExit(Sender: TObject);
    procedure DBGrid1ColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure Timer2Timer(Sender: TObject);
    procedure MiCadastroAmbientesClick(Sender: TObject);
    procedure CbxAmbienteChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SgDadosGetEditText(Sender: TObject; ACol, ARow: Integer;
      var Value: string);
    procedure SgDadosSetEditText(Sender: TObject; ACol, ARow: Integer;
      const Value: string);
    procedure SgDadosKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SgDadosKeyPress(Sender: TObject; var Key: Char);
    procedure CbxClienteEnter(Sender: TObject);
    procedure ConsultarporCdigoAdicional1Click(Sender: TObject);
    procedure miProdutosVendidosJuntoClick(Sender: TObject);
    procedure miÚltimasVendasDoProdutoAoClienteClick(Sender: TObject);
    procedure EdtUsuarioChange(Sender: TObject);
    procedure cbxUsuarioChange(Sender: TObject);
    procedure chkOcultarProdutosSemEstoqueClick(Sender: TObject);
    procedure cbxUsuarioExit(Sender: TObject);
    procedure EdtDescUnitKeyPress(Sender: TObject; var Key: Char);
    procedure lblLogoffClick(Sender: TObject);
    procedure ro1Click(Sender: TObject);
    procedure EdtCdNomeChange(Sender: TObject);
    procedure btnLogoffClick(Sender: TObject);
    procedure EdtSubTotalEnter(Sender: TObject);
    procedure Conferncia1Click(Sender: TObject);
    procedure Consultarprvendas1Click(Sender: TObject);
    procedure Logoff1Click(Sender: TObject);
    procedure EdtLanctoEnter(Sender: TObject);
  private
    { Private declarations }
    indexGridAux : integer;  //grava a ultima linha editada na grid manualmente
    qtdAnteriorNaGrid: Real; // quantidade do produto antes da alteração direta na grid, usada para corrigir os totais após a alteração
    intemIndexRgOpcoesOLD : Integer;    // controla o itenindex do radiogroup RGOpcoes
    vQtdPrint  : string[1];
    vPrintSetup : string[01]; // define se sobe o print setup na impressao da pre-venda 80 colunas
    QuantidadeGridMaiorQueZero: boolean; // indica se a quantidade setada diretamente na grid é maior quer zero
    function possuiItensLançados:boolean;
    Procedure AuxiliarLancto(i : Integer);
    Procedure RemontaSgDados(i: Integer);
    Procedure ImprimirRequisicao(vCliente : String;vRequisicao: Integer);
    Procedure Consulta_Deposito;
    Procedure ImprimeComprovanteTransferencia;
    procedure SalvaTransferencia;      // somente p proauto
    Procedure AtualizaCombProduto;
    Procedure AtualizaQryConsulta;
    Procedure ConsultaGarantia;
    Procedure LimpaGrid;overload;
    Procedure LimpaGrid(var prevenda : TPrevenda);overload;
    procedure CriarIniSQL;
    procedure CriarIniSQLDeposito;
    Procedure ConsultaReserva;
    procedure ConsultaPreVendas;
    Function  PegaValorAtacado(cdProduto : integer): real;
    function PegaValorVarejo(cdProduto : integer): real;
    function PegaNomeFabricante(cdProduto : integer) : string;
    Procedure SalvaEtiquetas;
    Procedure ImprimeEtiquetasBijouArts;
    procedure ImprimeEtiquetasBijouArtsMaior;
    Procedure ImprimeEtiquetasBijouArtsZebra;
    procedure ImprimeEtiquetaAmorBebe;
    procedure ImprimeEtiquetaAliceDiniz;
    procedure ImprimeEtiquetaRosaMenina;
    procedure ImprimeEtiquetaListo;
    procedure ImprimeEtiquetaLayeVictor;
    procedure ImprimeEtiquetaLayeVictorOS214;
    procedure ImprimeEtiquetaLayeVictorArgoxOS214;
    procedure ImprimeEtiquetaGrandeLayeVictor;
    Procedure ImprimeEtiquetasPipelaine;
    procedure ImprimeEtiquetaTecno;
    Procedure ImprimeEtiquetasPipelaineShopping;
    Procedure ImprimeEtiquetasBijouArtsOS214;
    procedure ImprimeEtiquetasBijouArtsOS214TT;
    procedure ImprimeEtiquetasDalBosco;
    procedure ImprimeEtiquetasComercialGraca;
    procedure ImprimeEtiquetasSaoJose;
    procedure ImprimeEtiquetasCaribe;
    procedure ImprimeEtiquetasCaribe2;
    Procedure ImprimeEtiquetasTemdeTudoSempre;
    procedure ImprimeEtiquetasJALVES_Grande;
    procedure ImprimeEtiquetasDIEGOCUNHA_3COLUNAS;
    procedure ImprimeEtiquetasDIEGOCUNHA_GONDOLA;
    procedure ImprimeEtiquetasAquarium;
    procedure ImprimeEtiquetasPontoDasTintas;
    procedure ImprimeEtiquetasDulalar;
    procedure ImprimeEtiquetasGentePequena;
    procedure ImprimeEtiquetasJALVES_Gondola;
    procedure ImprimeEtiquetasGoncalves;
    procedure ImprimeEtiquetasJALVES_Pequena;
    procedure ImprimeEtiquetasDeluc;
    Procedure ImprimeEtiquetasDisCabos;
    procedure ImprimeEtiquetaSantoAntonio;
    procedure ImprimeEtiquetaParPerfeito;
    procedure ImprimeEtiquetaBrumar_Nova;
    procedure ImprimeEtiquetaEmporioJardins;
    procedure ImprimeEtiquetaSaoJudasTadeus2;
    procedure ImprimeEtiquetaSuperDelli;
    procedure ImprimeEtiquetaSaoMiguel;
    procedure ImprimeEtiquetaPrecoBom;
    procedure ImprimeEtiquetaMaisEconomia;
    procedure ImprimeEtiquetaEmporioJardins_Pequeno;
    Procedure AjustaForm;
    procedure RodaScripts;
    function  ExisteDescontoFornecedorInvalido : Boolean;
    function  Arredonda_Pra_Cima(numero: Real; numero_de_casas: Integer): Real;
    procedure Corrige_Desconto;
    procedure tiraLinhasVazias(Grid: TStringGrid);
    Procedure LimpaGrid2(Grid: TStringGrid; comeco: integer);
    procedure cancelar_item(linha: Integer);
    procedure exibirExclamacao;
    procedure ocultarExclamacao;
    function qtdInsuficienteParaPrevend(cdProduto: Integer;
      qtdSolicitada: Real): Real;
    procedure pintarLinhaStringGrid(grid: TStringGrid; linha: integer;
      cor: TColor);
    function quantidadeEmReserva(cdProduto: integer): Real;
    procedure montaComboLote;
    function QuantidadeDispNoLote(nrLote: string; cdProduto: integer; cdFabricanteLote:Integer): real;
    function QuantidadeNoLoteNaGrid(nrLote:string; cdProduto:integer; cdFabricanteLote:integer): real;
    procedure setLabel23(quantidade: real);
    function QuantidadeDispEmLotes(cdProduto: integer): real;
    function DisponivelNoEstoque(quantidade:real; cdproduto:integer; alterandoQuantidadeNaGrid:boolean=False): Boolean;
    procedure preencheArrayLinhasDestacadas;
    procedure LiberaCopia;
    function GetVersaoArq: string;
    procedure carregarPosicaoColunasDbGrid1;
    procedure salvarPosicaoColunasDbGrid1;
    procedure MontaComboAmbiente;
    procedure moverCamposImpressao(var relOrcamento: TFrmRelOrcamentos;
      movimento: integer);
    function getVMudaPreco: string;
    procedure ProautoPreencherVDescontoCliente(codCliente: string);
    procedure preencherVariaveisCliente(codCliente:string);
    procedure atualizarQuantidadeNaGrid(cdproduto: integer; quantidade: real; quantidadeAnterior:real);
    function mudouTipoClienteAtacadoVarejo: boolean;
    function mudouTipoClienteCrediario : Boolean;
    function Desconto_Fornecedor : Boolean;
    function MessageDlgDef2(const Msg, MyCaption: string; AType: TMsgDlgType;
      AButtons: TMsgDlgButtons; DefButton: TModalResult;
      HelpCtx: Integer): Word;
    procedure DesativarCamposDescontoTotal;
    procedure consultarProdutosVendidosJunto;
    function mudouDescontoCadastroCliente: boolean;
    procedure consultarUltimasVendasDoProdutoAoCliente;
    procedure listarUsuariosNaCombo;
    procedure limparDadosDoUsuario;
    procedure persistirFormulario;
    procedure persistirUltimoEstadoForm;
    function mudouClienteAlterandoPrevenda: Boolean;
    function getSomaCustoFinal: Currency;
    procedure HabilitaDesabilitaDesconto;
    function isDescontoValido(prevenda : TPrevenda) : Boolean;
  public
    prevenda: TPrevenda;
    { Public declarations }
    tipoForro : string;
    turno: string;
    ArraylinhasDestacadas: array[0..299] of boolean;
    transformarOrcamentoPrevenda : Boolean;
    vlDescontoVendedor : Real;
    vDescontoCliente   : Real;  // Desconto do cliente definico no campo motivo da restricao do cadstro do cliente
    vLimiteCredito   : Real;
    valorLimiteDisponivel : Real;   // pega o limite de credito disponível antes da confirmação da pre-venda p ser utilizada no formulario de forma de pagamento p teste do limite ha hora da confirmação
    vUltimo_USUARIO  : string[10]; // pega o nome do ultimo usuário a fazer alguma liberação no sistema
    vMensagem_Promoc : string[40];
    vLimCredito      : String[01];
    vCheqDev         : String[01];
    //vSenha_Alteracao : String[50];
    vCliDevedor      : String[01];
    vImpressao_80    : String[01];
    vImpressao_40    : String[01];
    vTipoImpressora  : string[01];
    vUF_Cliente      : string; //estado do cliente para uso do SugereCFOP
    vUF              : string; //estado do cliente para uso do SugereCFOP
    vcidade          : string;
    vDescricaoGama, vUndGama : string;
    vFatorGama : real;
    vLimitarDescontoFornecedor : Boolean;
    Acao       : integer; //0 - atualizacao, 1 - backup
    vCorrige_Desconto: string[01]; //'S' ou 'N', indica se é pra corrigir o desconto da prevenda
    vPergunta_Apos_Comprovante : String[01];
    vAutoPecas      : String[01]; // define o ramo de atividade do cliente
    vProdutoPromocao : string[01];
    vTeste_do_Financeiro : string[01];  // 0 --> testa no caixa 1 --> testa na pre-venda
    usarLoteValidade : Boolean;  // define se o cliente irá selecionar lote e validade p os produtos
    vConferencia : Boolean;
    liberaDigitacaoLancamento: Boolean;
    vLancamento : string; //usada na nota de transferencia da PBFARMA
    quantidade : real;
    codigoClienteAtual: string; // código do cliente selecionado para a prevenda ou orçamento
    tipoClienteAtual: string; // tipo do cliente selecionado para a prevenda ou orçamento
    vqtd : Integer;
    vcdVendedor, vnmVendedor : string;
    nrOrcamentoDia: Integer;
    possuiLivro:boolean;
    vSimplesRemessa: integer;
    auxiLiberacao : Boolean;
    dsCGC : string;
    liberouVenda : boolean;
    vPorcDesconto : Real;
    vcdAutorizador : integer;
    //LblMensagem: Tletreiro;
//    procedure EnviaProdutosHospitalar;
    procedure LimparPesquisa;
    procedure BloqueiaAlteracaoPreVenda(nrOrcamento: integer);
    procedure DesbloqueiaAlteracaoPreVenda(nrOrcamento: integer);
    procedure ImprimeEtiquetasSafiraZebra;
    procedure ImprimeEtiquetasSafiraArgox;
    procedure LancaProdutos(quantidade: real; lote: string = ''; cdFabricanteLote:string='');
    procedure CarregarItensGrid(prevenda : TPrevenda; ponteiro : string = '');
    procedure ImprimeOrcamentoPBFARMA(indexRadioGroupFormaPgto_: integer; observacao:string='');
    procedure ImprimeOrcamentoAmbiente(valor: integer);
    Procedure LancaProdutosHospitalar;
    function SugereCFOP : string;
    function MessageDlgDef(const Msg, MyCaption: string;AType: TMsgDlgType; AButtons: TMsgDlgButtons;DefButton : TModalResult; HelpCtx: Longint): Word;
    procedure RodaScripts1;
    //procedure RodaScripts2;
    Procedure LiberaVanda;
    function validarQuantidadeItemFracionado(unidade : string) : Boolean;  // valida se o produto esta definido como fracionado no cadastro de unidade
    function ChamaInputBox(const ACaption, APrompt: string): string;
    function ChamaInputBoxTipoForracao(const ACaption,APrompt: string): string;
    function ChamaInputBoxTurno(const ACaption,APrompt: string): integer;
    procedure AuxiliarLanctoNFe(i: Integer);
    function item_cancelado(linha: Integer): Boolean;
    procedure Gera_Desconto_Correto(var Preco_Desconto,
      Desconto_Atual: Real; valor_Total: Real; casas_decimais: Integer);
//    Procedure EnviaProdutos(quantidade:real; lote:string = '');
    Procedure EnviaProdutos;
    procedure Limpar_Tela;
    function SoNumeros(Const  Texto:String):String;
    procedure Recalcula_Desconto;
    Procedure ImprimeOrcamento(valor : Integer);
    Procedure UltimoLancamento;
    Procedure UltimoLancamentoBloqueandoTabela;
    Function  SystemDateTime(tDate: TDateTime; tTime: TDateTime): Boolean; // atualizar a data do sistema com o banco de dados, para as máquinas que perdem a hora
    Function  TestaRestricao: Boolean;
    function LimpaEdtDesconto: string;
    Procedure ImprimeComprovante(valor: integer);
    Procedure ImprimeLL(valor: integer);
    procedure ImprimeEtiquetasVarejao;
    procedure ImprimeEtiquetaPR;
    procedure ImprimeEtiquetaPR_ELGIN;
    procedure ImprimeEtiquetaPRECINHO10;
    procedure ImprimeEtiquetaBRAZNAMODA;
    procedure ImprimeEtiquetaMERCADINHOSAOJUDASTADEU18_ELGIN;
    procedure ImprimeEtiquetaDAYA_ELGIN;
    procedure ImprimeEtiquetaNutriMix;
    procedure ImprimeEtiquetaMEGA;
    procedure ImprimeEtiquetaJetLaser;
    procedure ImprimeEtiquetaPS;
    procedure ImprimeEtiquetaBrumar;
    procedure ImprimeEtiquetaChavesDeOuro;
    procedure ImprimeEtiquetaPoliana;
    procedure ImprimeEtiquetasMarttina;
    procedure ImprimeEtiquetasComplemento;
    procedure ImprimeEtiquetaChaloc;
    procedure ImprimeEtiquetasSaboramil;
    procedure ImprimeEtiquetasPazone;
    procedure ImprimeEtiquetaOticaSantaLuiza;
    Procedure PegaClienteAtacadoVarejo;
    procedure atualizaGridDados;
    Procedure SalvaLogEventos(dsEvento:String;dtEvento:TDateTime;hrEvento:String;dsLancamento:String;
                              dsDocumento:String;vlvalor:real;cdUsuario:integer;cdOpcao:String);
    Function  PegaDatabanco: TDateTime;
    Function  pegaHoraBanco: String;
    function  Verifica_PREVENDA_SALVANOCAIXA: boolean;
    function  Existe_Numero_Orcamento(nrOrcamento: string): boolean;
    function  Verifica_Se_Produto_Fracionado(cdProduto: string): Boolean;
    function  clienteComRestricaoFinanceira(var restricao:TListaRestricao;VendaAtual : string):Boolean;
    procedure SetarClienteNaCombo(cdCliente:string);
    procedure PreencherCamposDoClienteSetadoNaCombo;
    function  PERMISSAO(vTag: String; vColuna : String; exibirMsgAcessoNegado:Boolean=True) : String;
    procedure Cancelar;
    function Solicitar_Login(forcarLogin : String = 'N') : Boolean;
    function  getMensagemRestricao(restricao : TListaRestricao) : string;
    function  RequisitosAtendidos : Boolean;
    function  QuantidadePositiva : Boolean;
    function  Vender_Proibida_Fracionado : Boolean;
    function  PossuiEstoque : Boolean;
    function  ProdutoJaReservado : Boolean;
    function  ClienteValido : Boolean;
    function  VendedorValido : Boolean;
    function  LoginValido : Boolean;
    function  ExisteItemPrevenda : Boolean;
    function  ValidarNumeroLancamento_LIBEL : Boolean;
    function  getHoraServidor : string;
    procedure Verifica_Livro_Forracao;
    procedure SalvarPreVenda(prevenda : TPrevenda);
    function GetFlagEmpresa : string;
    procedure GetValorIPILiquido;
  end;

const ScreenWidth: LongInt = 800; {I designed my form in 800x600 mode.}
      ScreenHeight: LongInt = 600;
      sw : longint = 800;
      sh : longint = 600;


var
  FrmPrincipalPreVenda: TFrmPrincipalPreVenda;
  vInternet     : Boolean; // true - conectado  false - desconectado
  vSalvar: Integer;
  vdtBloqueio : Integer;
  TestaFinanceiroNaConfirmacao: boolean; // Indica se o teste do financeiro do cliente é feito na confirmação ou na escolha do cliente
//  vData_Banco         : String[10];
  vTime               : String[10];
  vEscolheProduto     : String[01];  // verifica se abilita a combo da descrição dos produtos
  vEstqNegativo       : String[01];  // vender com estoque negativo ?
  vSelecionaForma     : String[01];  // Selciona forma de pagamento.
  vSelecionaCFOP      : String[01];  // Selciona CFOP por item
  vJurosCobrado:Real;  // porcentagem padrao de juros cobrado & pega a porcentagem padrao de desconto
  vMudaPreco,vTipoImp : String[01];  // saso seja S o preço de venda é liberado para alteração no ato da venda
  vcdOperador         : String[04];  // codigo na tabela de pessoa do funcionario que loga
  vFlag               : String[02];
  Ativa               : Char;
  DTipoImp            : TIniFile;   // Variáveis que irão cahamar o support.ini para achar o tipo de impressão
  vOpcoes             : String[01];
  vTesteFinanceiro    : String[01]; // variável para testar se já foi testado o financeiro
  vAtacadoVarejo      : String[01]; // variável para saber se o cliente é de atacado ou varejo
  vMemo               : TMemo;
  vTipoDescontoNF     : string[1];
  vPAFECF             : Boolean;
  vVetor              : VetorPermissao;
  vObs                : string; // variavel usada para gravar a observacao da pre-venda
  vCasasPreco,vCasasQtd : Integer;
  vEmpresa            : String[50]; // Pega o nome da empresa do Support.ini
  vGerarSpedFiscal, vGerarSpedPis, vGerarSintegra, vDescontoClienteAuto : Boolean;
  vFlagEtiqueta       : String[50]; // Pega o flag do cliente usado nas etiquetas do support.ini
  nmEmpresa           : String[50];
  vOcultaDesconto     : string[1]; //nao mostra valor com desconto na impressao da pre-venda
  vendereco           : String[100]; // Pega o nome da empresa do Support.ini
  vOrcamento          : String[01];       // indica se é uma prevenda ou orcamento
  vConferencia        : Boolean;
  vMatrizFilial       : String[50];
  vAlteraCliente      : String[1]; // indica se limpa ou nao limpa a grid ao trocar de cliente
  vLimiteCasasPreco   : Integer; //diz a partir de quantas casas decimais do preço
                                 //será usada a máscara antiga do edtdesconto "com cinco casas decimais"
  vlTotalAnterior     : Real;
  vExibir             : Boolean;
  vOcultaReferenciaNaImpressao : Boolean;
  vBloqueioPreVenda   : Boolean;
  vAutoLogoff         : Boolean;
  vBloquearDescontoAtacado : Boolean;
  vBloqueiaDesconto   : Boolean;
  vDestacarItensOcupados : Boolean;  // indica se os itens que são insuficientes para atender todas as prevendas em aberto
                                    // devem ficar destacados em amarelo...
  vUsuarioProxy : string; // usuario usado na dll se tiver
  vSenhaProxy : string; // senha usado na dll se tiver
  restricaoFinanceira: TListaRestricao;
  indiceClienteAtual: integer; // índice do cliente atual
  vLogoMarca: TStream;

implementation

uses uFuncoesPadrao, DataModulo, FrmPrincipal,relOrcamentosPBFARMA,
  cdConsultaProduto, FrmConsultaEspecificacao, CancelamentoVenda,
   FormaPag, Consulta_Prevenda, CdCliente,
  FrmSaida, UFrmcadEscola, UfrmcadSerieEscola, UfrmCadLista,
  FrmRelContagem, TresEtiquetas, AlteraDescricao, cdCFOP, Informacao,
  Thread_Conexao3, Declaracao, formBuscaCliente, ListaPedidos,
  FormCdAmbiente, relOrcamentosAmbiente, Produto, NEGProduto, PedeSenh, FormEtiquetaPontoDasTintas,
  Conferencia, NEGUnidade, DOMUnidade, FormLancaVendaPerdida,
  ConsultaComposicao, FormDuasEtiquetas;

{$R *.DFM}

function TFrmPrincipalPreVenda.PERMISSAO(vTag: String; vColuna : String; exibirMsgAcessoNegado:Boolean=True) : String;
var
 I : Integer;
 vOpcao : Integer; // Opcão passada como parâmetro convertida para forma integer
 vPermissao : String[1]; // variável de permissão S ou N
begin
 // Não realiza montagem de vetor com opções de acesso de super usuário
 // Coluna 0 = Acesso Total; 2 = Novo; 3 = Altera; 4 = Exclui; 5 = Visualiza; 6 = Imprime
 // 7 = Baixa
 // Atribui a Opção a uma variável integer
 vPermissao := '';
 if vColuna = '0' then vOpcao := 0;
 if vColuna = 'N' then vOpcao := 1;
 if vColuna = 'A' then vOpcao := 2;
 if vColuna = 'E' then vOpcao := 3;
 if vColuna = 'V' then vOpcao := 4;
 if vColuna = 'I' then vOpcao := 5;
 if vColuna = 'B' then vOpcao := 6;
 // Localiza opção no vetor
 for I := 1 to 900 do
 begin // 60 número máximo de opções do menu
  // Acesso Total na opção
   case vOpcao of
    0: if vVetor[I,1] = vTag  then
          vPermissao := 'S';
    1: if (vVetor[I,1] = vTag) and (vVetor[I,2] = 'X') then
          vPermissao := 'S';
    2: if (vVetor[I,1] = vTag) and (vVetor[I,3] = 'X') then
          vPermissao := 'S';
    3: if (vVetor[I,1] = vTag) and (vVetor[I,4] = 'X') then
          vPermissao := 'S';
    4: if (vVetor[I,1] = vTag) and (vVetor[I,5] = 'X') then
          vPermissao := 'S';
    5: if (vVetor[I,1] = vTag) and (vVetor[I,6] = 'X') then
          vPermissao := 'S';
    6: if (vVetor[I,1] = vTag) and (vVetor[I,7] = 'X') then
          vPermissao := 'S';
   end; // Case
 end;  // for
 if vPermissao <> 'S' then
 begin
   vPermissao := 'N';
   if exibirMsgAcessoNegado then begin
     //Application.OnMessage := FrmPrincipalPreVenda.NaoProcessaMsg;
     Application.MessageBox('Necessário permissão para executar esta ação.','Aviso',mb_Ok+mb_IconExclamation);
      //MessageDlg ('Necessário permissão para executar esta ação.', mtInformation, [mbOk],0);
   end;
 end; // else
 Permissao := vPermissao;
end;

{ Configuração que pede senha para liberar desconto para cliente atacado }
function bloquearDescontoAtacado: Boolean; // indica se é permitido dar desconto a cliente Atacado
var
  query: TADOQuery;
  resultado: Boolean;
begin
  query:= TADOQuery.Create(nil);
  query.Connection:= DModulo.Conexao;
  with query do
  begin
    SQL.Text:=  'Select bloquearDescontoAtacado From Configuracao WITH (NOLOCK) ';
    Open;
    resultado:= FieldByName('bloquearDescontoAtacado').AsBoolean;
  end;
  FreeAndNil(query);
  result:= resultado;
end;

function GetLimiteDescontoFornecedor(cdCliente,cdProduto : integer) : Real; // pega o desconto maximo permitido por fornecedor
var
  query: TADOQuery;
  resultado: Real;
begin
  query:= TADOQuery.Create(nil);
  query.Connection:= DModulo.Conexao;
  with query do
  begin
    SQL.Text:=  'SELECT CASE '+
                '(SELECT EXISTIR FROM PESSOA with (nolock) WHERE cdPessoa = :cdCliente) WHEN ''F'' THEN '+
                '(SELECT F.DescontoMaxPFisica FROM Produto P with (nolock) INNER JOIN Fornecedor F with (nolock) ON P.cdPessoa = F.cdPessoa '+
                '			WHERE cdProduto = :cdProduto1) '+
                'WHEN ''J'' THEN '+
                '(SELECT F.DescontoMaxPJuridica FROM Produto P with (nolock) INNER JOIN Fornecedor F with (nolock) ON P.cdPessoa = F.cdPessoa '+
                '			WHERE cdProduto = :cdProduto2) '+
                'END AS LimiteDescontoFor ';
    Parameters.ParamByName('cdProduto1').Value := cdProduto;
    Parameters.ParamByName('cdProduto2').Value := cdProduto;
    Parameters.ParamByName('cdCliente').Value  := cdCliente;
    Open;
    if FieldByName('LimiteDescontoFor').AsFloat <= 0 then
      resultado := 100
    else
      resultado:= FieldByName('LimiteDescontoFor').AsFloat;
  end;
  FreeAndNil(query);
  result:= resultado;
end;


function isClienteRegistrado: Boolean;
var qry: TADOQuery;
    temCOD_FTP, temCNPJ, temCampoCriptografado, campoCodFTPPreenchido, campoResgistroPreenchido: Boolean;
    chaveInvalida: Boolean;
begin
  qry:= TADOQuery.Create(nil);
  qry.Connection := DModulo.Conexao;
  with qry do
  begin
    //verifico se o campo do ftp existe
    sql.Text := 'SELECT 1 FROM syscolumns WHERE name = ''cdCodFTP'' ';
    open;
    temCOD_FTP := RecordCount > 0;
    Close;

    //agora verifico se o codigo do cliente do ftp está vazio
    sql.Text := 'select cdCodFTP from configuracao WITH (NOLOCK)';
    open;
    campoCodFTPPreenchido := FieldByName('cdCodFTP').AsString <> '';
    close;

    //agora verifico se o cliente tem o cnpj cadastrado
    sql.Text := 'select dsCGC from configuracao WITH (NOLOCK)';
    open;
    temCNPJ := FieldByName('dsCGC').AsString <> '';
    close;

    //verifico se o campo da chave criptografada existe
    sql.Text := 'SELECT 1 FROM syscolumns WHERE name = ''dsRegistro'' ';
    open;
    temCampoCriptografado := RecordCount > 0;
    close;
    if not temCampoCriptografado then
    begin //crio a o campo do registro e flag de emergência nas configurações
      sql.Text := 'ALTER TABLE CONFIGURACAO ADD dsRegistro varchar(50), Emergencia bit, EmTolerancia bit ';
      ExecSQL;
    end;

    sql.text := 'select dsRegistro from configuracao WITH (NOLOCK)';
    open;
    campoResgistroPreenchido := qry.FieldByName('dsRegistro').AsString <> '';
    Close;

  end;
  result := (temCOD_FTP) and (temCNPJ) and
            (temCampoCriptografado) and (campoCodFTPPreenchido) and (campoResgistroPreenchido);
  FreeAndNil(qry);
end;

function LiberadoUso: Boolean;
var
 DtExpiracao : string;
begin
  //funcao que retorna a data de expriração
  DtExpiracao   := DateToStr(RetornaDtExpira);
  //se a data de expiração faltar menos de 10 dias coloco o flag para sim - true = 1
  if ((strtodate(DtExpiracao) - StrToDate(vData_Banco)) >= 0) then
    LiberadoUso := True
  else
    LiberadoUso := False;
end;

function RegistraCliente: boolean;
var clienteRegistrado, podeUsar: boolean;
    diaDaSemana: String;
begin
  diaDaSemana := UpperCase(NomeDoDia(StrToDate(vData_Banco)));
  podeUsar := false;

  clienteRegistrado := IsClienteRegistrado;
  if (clienteRegistrado = false) then begin
    Application.messagebox('Acesse o sistema saef para atualizar a chave.','Atenção', MB_OK + MB_ICONWARNING + MB_APPLMODAL);
  end
  else if (LiberadoUso = False) then begin
    //não solicita a chave no fim de semana
    if ((diaDaSemana = 'SABADO') or (diaDaSemana = 'DOMINGO') or (isFeriadoNacional(StrToDate(vData_Banco)))) then
      podeUsar := True
    else begin
      Application.messagebox(Pchar('A chave de acesso ao sistema está expirada. '+#13#10+'Acesse o sistema saef para atualizar sua chave'),'Atenção', MB_OK + MB_ICONWARNING + MB_APPLMODAL);
      podeUsar := False;
    end;
  end
  else
    podeUsar := True;
  Result := podeUsar;
end;

{ Retorna o índice da coluna na dbGrid que tem o fieldName }
function IndexOfDbGrid(dbGrid:TDBGrid; fieldName:string):Integer;
var
  i: integer;
  resultado: integer;
begin
  resultado:= -1;
  for i:= 0 to dbGrid.Columns.Count - 1 do begin
    if dbGrid.Columns[i].FieldName = fieldName then begin
      resultado:= i;
      Break;
    end;
  end;
  result:= resultado;
end;

{ Troca as colunas de lugar, a coluna de índice "fromIndex" troca de lugar com a coluna de índice "toIndex" }
procedure trocarColunaDbGrid(dbGrid:TDBGrid; fromIndex, toIndex:Integer);
var
  coluna: TColumn;
begin
  coluna:= TColumn.Create(nil);
  with coluna do begin
    alignment:= DBGrid.Columns[toIndex].Alignment;
    FieldName:= DBGrid.Columns[toIndex].FieldName;
    Title:= DBGrid.Columns[toIndex].Title;
    width:= DBGrid.Columns[toIndex].Width;
  end;
  with DBGrid.Columns[toIndex] do begin
    alignment:= DBGrid.Columns[fromIndex].Alignment;
    FieldName:= DBGrid.Columns[fromIndex].FieldName;
    Title:= DBGrid.Columns[fromIndex].Title;
    width:= DBGrid.Columns[fromIndex].Width;
  end;
  with DBGrid.Columns[fromIndex] do begin
    alignment:= Coluna.Alignment;
    FieldName:= Coluna.FieldName;
    Title:= Coluna.Title;
    width:= Coluna.Width;
  end;
  FreeAndNil(coluna);
end;

procedure TFrmPrincipalPreVenda.RodaScripts;
begin
  try
    with DModulo.ADOCommand1 do
    begin
      CommandText:='';
      CommandText := 'DECLARE @TESTE AS INTEGER '+
                     'SET @TESTE = '+
                     '(SELECT COUNT(COLUMN_NAME) AS OK FROM INFORMATION_SCHEMA.COLUMNS '+
                     'WHERE TABLE_NAME = ''IteOrcamento'' AND COLUMN_NAME  = ''dsMetragem'') '+
                     'IF (@TESTE = 0) BEGIN '+
                     ' ALTER TABLE IteOrcamento ADD '+
                     ' dsMetragem varchar(10) '+
                     'END ';
      Execute;

      CommandText := 'DECLARE @TESTE AS INTEGER                                              '+
                     'SET @TESTE =                                                           '+
                     '(SELECT COUNT(COLUMN_NAME) AS OK FROM INFORMATION_SCHEMA.COLUMNS       '+
                     'WHERE TABLE_NAME = ''IteOrcamento'' AND COLUMN_NAME  = ''dsServico'') '+
                     'IF (@TESTE = 0) BEGIN                                                  '+
                     ' ALTER TABLE IteOrcamento ADD                                          '+
                     ' dsServico  varchar(150)                                               '+
                     'END                                                                    ';
      Execute;

      //Cria SerieEscolar
      CommandText:=' DECLARE @TESTE AS INTEGER        '+
                     'SET @TESTE =                    '+
                     '(SELECT COUNT(COLUMN_NAME) AS OK FROM INFORMATION_SCHEMA.COLUMNS '+
                     'WHERE TABLE_NAME = ''Escola'')  '+
                     'IF (@TESTE = 0) BEGIN           '+
                     ' CREATE TABLE Escola (          '+
                     ' CdEscola int NOT NULL,         '+
                     ' DsEscola varchar(60) NULL )    '+
                     ' ALTER TABLE Escola             '+
                     ' ADD PRIMARY KEY (CdEscola ASC) '+
                     'END                             ';
      Execute;
      CommandText:='';
      CommandText:=' DECLARE @TESTE AS INTEGER        '+
                     'SET @TESTE =                    '+
                     '(SELECT COUNT(COLUMN_NAME) AS OK FROM INFORMATION_SCHEMA.COLUMNS '+
                     'WHERE TABLE_NAME = ''IteOrcamento'')  '+
                     ' Alter TABLE IteOrcamento       '+
                     ' ALTER Column vlDesconto real   ';
      Execute;
      CommandText:='';
      CommandText := 'DECLARE @TESTE AS INTEGER      '+
                     'SET @TESTE =                   '+
                     '(SELECT COUNT(COLUMN_NAME) AS OK FROM INFORMATION_SCHEMA.COLUMNS  '+
                     'WHERE TABLE_NAME = ''SerieEscolar'')                              '+
                     ' IF (@TESTE = 0) BEGIN         '+
                     ' CREATE TABLE SerieEscolar (   '+
                     ' cdSerie   int NOT NULL,       '+
                     ' dsSerie   varchar(50) NULL,   '+
                     ' CdEscola  int NOT NULL )      '+
                     'ALTER TABLE SerieEscolar       '+
                     ' ADD PRIMARY KEY (cdSerie ASC) '+
                     'ALTER TABLE SerieEscolar       '+
                     ' ADD FOREIGN KEY (CdEscola)    '+
                     ' REFERENCES Escola  (CdEscola) '+
                     ' ON DELETE NO ACTION           '+
                     ' ON UPDATE NO ACTION           '+
                     ' END                           ';
      Execute;
      CommandText:='';
      CommandText := 'DECLARE @TESTE AS INTEGER  '+
                     'SET @TESTE =               '+
                     '(SELECT COUNT(COLUMN_NAME) AS OK FROM INFORMATION_SCHEMA.COLUMNS '+
                     'WHERE TABLE_NAME = ''ListaEscolar'') '+
                     ' IF (@TESTE = 0) BEGIN               '+
                     ' CREATE TABLE ListaEscolar ( '+
                     ' CdLista  int NOT NULL,   '+
                     ' Ano      datetime NULL,  '+
                     ' cdSerie  int NOT NULL,   '+
                     ' CdEscola int NOT NULL  ) '+
                     ' ALTER TABLE ListaEscolar '+
                     ' ADD PRIMARY KEY (CdLista ASC) '+
                     ' ALTER TABLE ListaEscolar   '+
                     ' ADD FOREIGN KEY (CdEscola) '+
                     ' REFERENCES Escola  (CdEscola) '+
                     ' ON DELETE NO ACTION  '+
                     ' ON UPDATE NO ACTION  '+
                     ' ALTER TABLE ListaEscolar '+
                     ' ADD FOREIGN KEY (cdSerie) '+
                     ' REFERENCES SerieEscolar  (cdSerie) '+
                     ' ON DELETE NO ACTION '+
                     ' ON UPDATE NO ACTION '+
                     'END   ' ;
      Execute;
      CommandText:='';
      CommandText := 'DECLARE @TESTE AS INTEGER '+
                     'SET @TESTE =              '+
                     '(SELECT COUNT(COLUMN_NAME) AS OK FROM INFORMATION_SCHEMA.COLUMNS '+
                     'WHERE TABLE_NAME = ''ItensLista'') '+
                     ' IF (@TESTE = 0) BEGIN             '+
                     ' CREATE TABLE ItensLista ( '+
                     ' CdItemLista int IDENTITY, '+
                     ' CdObjeto    int NOT NULL, '+
                     ' dsObjeto    varchar(50) NULL, '+
                     ' Qtd         int NULL, '+
                     ' CdLista     int NOT NULL ) '+
                     ' ALTER TABLE ItensLista '+
                     ' ADD PRIMARY KEY (CdItemLista ASC) '+
                     ' ALTER TABLE ItensLista '+
                     ' ADD FOREIGN KEY (CdLista) '+
                     ' REFERENCES ListaEscolar  (CdLista) '+
                     ' ON DELETE NO ACTION '+
                     ' ON UPDATE NO ACTION '+
                     'END   ' ;
      Execute;

      CommandText := 'DECLARE @TESTE AS INTEGER                                        '+
                     'SET @TESTE =                                                     '+
                     '(SELECT COUNT(COLUMN_NAME) AS OK FROM INFORMATION_SCHEMA.COLUMNS '+
                     'WHERE TABLE_NAME = ''Profissional'' )                            '+
                     'IF (@TESTE = 0) BEGIN                                            '+
                     ' CREATE TABLE Profissional (                                     '+
                     '       cdPessoa         int Not Null   )                         '+
                     'ALTER TABLE Profissional ADD PRIMARY KEY (cdPessoa ASC)          '+
                     'END                                                              ';
      Execute;

      CommandText := 'DECLARE @TESTE AS INTEGER                                          '+
                     'SET @TESTE =                                                       '+
                     '(SELECT COUNT(COLUMN_NAME) AS OK FROM INFORMATION_SCHEMA.COLUMNS   '+
                     'WHERE TABLE_NAME = ''ITEORCAMENTO'' and COLUMN_NAME = ''dsCFOP'' ) '+
                     'IF (@TESTE = 0) BEGIN                                              '+
                     ' ALTER TABLE ITEORCAMENTO ADD dsCFOP varchar(4)                    '+
                     'END                                                                ';
      Execute;

      CommandText := 'DECLARE @TESTE AS INTEGER                                               '+
                     'SET @TESTE =                                                            '+
                     '(SELECT COUNT(COLUMN_NAME) AS OK FROM INFORMATION_SCHEMA.COLUMNS        '+
                     'WHERE TABLE_NAME = ''ORCAMENTO'' and COLUMN_NAME = ''cdProfissional'' ) '+
                     'IF (@TESTE = 0) BEGIN                                                   '+
                     ' ALTER TABLE ORCAMENTO ADD cdProfissional int Null                      '+
                     'END                                                                     ';
      Execute;

//                     ' ALTER TABLE ORCAMENTO                                                  '+
//                     ' ADD FOREIGN KEY (cdPessoa)                                             '+
//                     ' REFERENCES Pessoa (cdPessoa)                                           '+
//                     ' ON DELETE NO ACTION                                                    '+
//                     ' ON UPDATE NO ACTION                                                    '+

    end;
  except
    on e:Exception do
    begin
      ShowMessage('Errou ao GERAR TABELAS MOTIVO :'+ e.Message);
      Salvar_erro(vData_Banco + ' | ' + pegaHoraBanco, 'PREVENDA', 'TFrmPrincipalPreVenda.RodaScripts', e.Message);
    end;
  end;
end;

//procedure TFrmPrincipalPreVenda.RodaScripts2;
//begin
//  try
//    with DModulo.ADOCommand1 do begin
//      if (UpperCase(vEmpresa) = 'JP LIVROS') then begin
//        CommandText :='ALTER      PROCEDURE SUP_Imp_Pedido_Prevenda        '+
//                      '@DSLANCAMENTO VarChar(10) = Null,@CODIGO Int = Null,'+
//                      '@FLAG Int = Null   '+
//                      'As                 '+
//                      'If @FLAG = 1 Begin '+
//                      'SELECT P.nmProduto,P.dsUnidade,P.cdFabricante,I.cdProduto,L.cdPessoa,I.nrQtd,I.vlUnitario,'+
//                      'I.vlUnitario_Bruto,L.vlValor,L.vlDesconto,L.vlAcrescimo,P.dsReferencia,P.dsPrateleira   '+
//                      'FROM Produto P WITH (NOLOCK),IteLcto I WITH (NOLOCK),Lancto L WITH (NOLOCK)  '+
//                      'WHERE L.dsStatus = ''F'' And L.dsLancamento = I.dsLancamento And             '+
//                      'I.cdProduto = P.cdProduto And L.dsStatus = I.dsStatus And                    '+
//                      'I.dsCancelado Is Null And                                                    '+
//                      'I.dsLancamento = @DSLANCAMENTO And I.cdPessoa = @CODIGO ORDER BY P.nmProduto '+
//                      'End                                                                          '+
//                      'If @FLAG = 2 Begin                                                           '+
//                      'SELECT P.nmPessoa,T.nmProduto,T.dsProdutoNota,T.dsReferencia,O.cdPessoa,     '+
//                      'O.nrOrcamento,O.cdCliente,I.cdProduto,O.dtEmissao,I.NrQtd,I.vlPreco,         '+
//                      'O.nrDesconto,T.dsUnidade,T.dsPrateleira                                      '+
//                      'FROM Orcamento O WITH (NOLOCK),Pessoa P WITH (NOLOCK),Produto T WITH (NOLOCK),IteOrcamento I WITH (NOLOCK) '+
//                      'WHERE P.cdPessoa = O.cdPessoa And T.cdProduto = I.cdProduto And '+
//                      'O.cdPessoa = P.cdPessoa And I.dsSituacao = '''' And             '+
//                      'O.nrOrcamento = I.nrOrcamento And O.nrOrcamento = @DSLANCAMENTO '+
//                      'order by T.nmProduto                                            '+
//                      'End Else Begin                                                  '+
//                      'SELECT P.nmPessoa,T.nmProduto,T.dsProdutoNota,T.dsReferencia,O.cdPessoa,O.nrOrcamento,O.cdCliente,'+
//                      'I.cdProduto,O.dtEmissao,I.NrQtd,I.vlPreco,O.nrDesconto,T.dsUnidade,T.dsPrateleira       '+
//                      'FROM Orcamento O WITH (NOLOCK),Pessoa P WITH (NOLOCK),Produto T WITH (NOLOCK),IteOrcamento I WITH (NOLOCK) '+
//                      'WHERE P.cdPessoa = O.cdPessoa And T.cdProduto = I.cdProduto And      '+
//                      'O.cdPessoa = P.cdPessoa And I.cdProduto <> 1 And I.dsSituacao = '''' '+
//                      'And                                                                  '+
//                      'O.nrOrcamento = I.nrOrcamento And O.nrOrcamento = @DSLANCAMENTO      '+
//                      'order by T.nmProduto                                                 '+
//                      'End                                                                  ';
//        Execute;
//      end else begin
//        CommandText:= 'Alter PROCEDURE SUP_Imp_Pedido_Prevenda                                                                                                                   '+
//                      '@DSLANCAMENTO VarChar(10) = Null, @CODIGO Int = Null, @FLAG Int = Null  As                                                                                '+
//                      'If @FLAG = 1 Begin                                                                                                                                        '+
//                      ' SELECT P.nmProduto,P.dsUnidade,P.cdFabricante,P.cdProduto,L.cdPessoa,I.nrQtd,I.vlUnitario,I.vlUnitario_Bruto,L.vlValor,L.vlDesconto,L.vlAcrescimo,       '+
//                      ' P.dsReferencia,P.dsPrateleira FROM Produto P WITH (NOLOCK),IteLcto I WITH (NOLOCK),Lancto L WITH (NOLOCK)  WHERE L.dsStatus = ''F'' And L.dsLancamento = '+
//                      ' I.dsLancamento and I.cdProduto = P.cdProduto And L.dsStatus = I.dsStatus And I.dsCancelado Is Null And I.dsLancamento = @DSLANCAMENTO And I.cdPessoa = @CODIGO '+
//                      'End                                                                                                                                                       '+
//                      'If @FLAG = 2 Begin                                                                                                                                        '+
//                      ' SELECT P.nmPessoa,T.nmProduto,T.dsReferencia,O.cdPessoa,I.nrLote,O.nrOrcamento,O.cdCliente,I.cdProduto,I.vlDesconto,O.dtEmissao,I.NrQtd,I.vlPreco,O.nrDesconto,   '+
//                      ' T.dsUnidade,T.dsPrateleira,I.dsMetragem FROM Orcamento O WITH (NOLOCK),Pessoa P WITH (NOLOCK),Produto T WITH (NOLOCK),IteOrcamento I WITH (NOLOCK) WHERE P.cdPessoa = O.cdPessoa '+
//                      ' And T.cdProduto = I.cdProduto And O.cdPessoa = P.cdPessoa And I.dsSituacao = '''' And O.nrOrcamento = I.nrOrcamento And O.nrOrcamento = @DSLANCAMENTO    '+
//                      ' order by T.dsPrateleira '+
//                      'End                                                                                                                                                       '+
//                      'Else Begin                                                                                                                                                '+
//                      ' SELECT P.nmPessoa,T.nmProduto,T.dsReferencia,O.cdPessoa,O.nrOrcamento,O.cdCliente,I.cdProduto,I.vlDesconto,O.dtEmissao,I.NrQtd,I.vlPreco,O.nrDesconto,   '+
//                      ' T.dsUnidade,T.dsPrateleira,I.dsMetragem,I.dsServico FROM Orcamento O WITH (NOLOCK),Pessoa P WITH (NOLOCK),Produto T WITH (NOLOCK),IteOrcamento I WITH (NOLOCK) WHERE P.cdPessoa = O.cdPessoa '+
//                      ' And T.cdProduto = I.cdProduto And O.cdPessoa = P.cdPessoa And I.cdProduto <> 1 And I.dsSituacao = '''' And O.nrOrcamento = I.nrOrcamento                 '+
//                      ' And O.nrOrcamento = @DSLANCAMENTO                                                                                                                        '+
//                      ' order by T.dsPrateleira '+
//                      'End                                                                                                                                                       ';
//        Execute;
//      end;
//    end;
//  except
//    on e:Exception do
//    begin
//      Salvar_erro(vData_Banco + ' | ' + pegaHoraBanco, 'PREVENDA', 'TFrmPrincipalPreVenda.RodaScripts2', e.Message);
//      ShowMessage('Errou ao GERAR TABELAS MOTIVO :'+ e.Message);
//    end;
//  end;
//end;

{ ...Esta procedure redimensiona o form de acordo com a resolução do monitor,
...}
procedure TFrmPrincipalPreVenda.AjustaForm;
var i , w : integer;
begin
  w := width; // automatico ou pode usar a constante sh
  scaled := true;
  if (screen.width <> sw) then begin
    height := longint(height) * longint(screen.height) DIV sh;
    width := longint(width) * longint(screen.width) DIV sw;
    scaleBy(screen.width - 400, sw);
  end;
  for i := ComponentCount-1 downto 0 do
  with Components[i] do begin
    if GetPropInfo(ClassInfo, 'Font') <> nil then
      Font.Size := (width div w) * font.Size;
  end;
end;

function Cryptografia(Action, Src: String): String;
Label Fim;
var KeyLen : Integer;
  KeyPos : Integer;
  OffSet : Integer;
  Dest, Key : String;
  SrcPos : Integer;
  SrcAsc : Integer;
  TmpSrcAsc : Integer;
  Range : Integer;
begin
  if (Src = '') Then begin
    Result:= '';
    Goto Fim;
  end;
  Key := 'YUQL23KL23DF90WI5E1JAS467NMCXXL6JAOAUWWMCL0AOMM4A4VZYW9KHJUI2347EJHJKDF3424SKL K3LAKDJSL9RTIKJ';
  Dest := '';
  KeyLen := Length(Key);
  KeyPos := 0;
  SrcPos := 0;
  SrcAsc := 0;
  Range := 256;
  if (Action = UpperCase('C')) then begin
    Randomize;
    OffSet := Random(Range);
    Dest := Format('%1.2x',[OffSet]);
    for SrcPos := 1 to Length(Src) do begin
      Application.ProcessMessages;
      SrcAsc := (Ord(Src[SrcPos]) + OffSet) Mod 255;
      if KeyPos < KeyLen then KeyPos := KeyPos + 1 else KeyPos := 1;
      SrcAsc := SrcAsc Xor Ord(Key[KeyPos]);
      Dest := Dest + Format('%1.2x',[SrcAsc]);
      OffSet := SrcAsc;
    end;
  end Else if (Action = UpperCase('D')) then begin
    OffSet := StrToInt('$'+ copy(Src,1,2));
    SrcPos := 3;
  repeat
    SrcAsc := StrToInt('$'+ copy(Src,SrcPos,2));
    if (KeyPos < KeyLen) Then KeyPos := KeyPos + 1 else KeyPos := 1;
    TmpSrcAsc := SrcAsc Xor Ord(Key[KeyPos]);
    if TmpSrcAsc <= OffSet then TmpSrcAsc := 255 + TmpSrcAsc - OffSet
    else TmpSrcAsc := TmpSrcAsc - OffSet;
    Dest := Dest + Chr(TmpSrcAsc);
    OffSet := SrcAsc;
    SrcPos := SrcPos + 2;
  until (SrcPos >= Length(Src));
  end;
  Result:= Dest;
  Fim:
end;

function RemoveChar(Const Texto: String) : String;
var
  I : integer;
  S : string;
begin
  S := '';
  for I := 1 To Length(Texto) Do begin
    if (Texto[I] in ['0'..'9','.',',']) then
      S := S + Copy(Texto, I, 1);
  end;
  result := S;
end;

procedure TFrmPrincipalPreVenda.ProcessaMsg;
begin
  if Msg.message = WM_KEYDOWN then
    if Msg.wParam = VK_RETURN then begin
      Keybd_event (VK_TAB,0,0,0);
    end;
end;

function TFrmPrincipalPreVenda.ExisteDescontoFornecedorInvalido : Boolean;
var
  I : integer;
  DescMax : Real;
  DescItemAtual : Real;
  resultado : Boolean;
begin
  resultado := False;
  if vLimitarDescontoFornecedor = True then begin
    for I:= 0 to prevenda.itens.Count -1 do begin
      DescMax := GetLimiteDescontoFornecedor(StrToInt(EdtCdCliente.Text),prevenda.itens[I].cdProduto);
      //DescItemAtual := 100 - ((StrToFloat(SgDados.Cells[3,x]) / StrToFloat(SgDados.Cells[9,x])) * 100);
      DescItemAtual := StrToFloatDef(EdtDesconto.Text,0);
      if DescItemAtual > DescMax then begin
        MessageDlg('Desconto Máx definido pelo fornecedor é de '+
                FormatFloat('0.00',DescMax)+'% no produto: '+prevenda.itens[I].descricao,mtWarning,[mbOK],0);
        resultado := True;
        Break;
      end;
    end;
  end;
  Result := resultado;
end;

function TFrmPrincipalPreVenda.ExisteItemPrevenda: Boolean;
begin
  Result := True;
  if prevenda.itens.Count = 0 then begin
    Application.OnMessage := NaoProcessaMsg;
    Messagedlg('Não foi lançado nenhum item para essa pré venda \ orçamento!', mtWarning, [mbOk], 0);
    EdtDesconto.Text := '0,00000';
    EdtSubTotal.text := '0,00';
    edtQtdItens.text := '0';
    EdtTotal.text := '0,00';
    edtValorBruto.text := '0,00';
    EdtConsulta.Setfocus;
    Application.OnMessage := ProcessaMsg;
    BtnConfirmar.Enabled := True;
    Alteraquantidade1.Enabled := true;
    Result := False;
  end;
end;

Procedure TFrmPrincipalPreVenda.NaoProcessaMsg;
begin
  if Msg.message = WM_KEYDOWN then
    if Msg.wParam = VK_RETURN then begin
  //  Keybd_event (VK_TAB,0,0,0);
    end;
end;

procedure TFrmPrincipalPreVenda.LiberaCopia;
//var DtExp :TDateTime;
//    nomePC : String;
//    diaDaSemana: String;
//    qryChave : TADOQuery;
begin
  if (ValidaComputadorSupport = false)  then
    if RegistraCliente = False then
      Application.Terminate;

 { if (ValidaComputadorSupport = false) then begin
    nomePC := pubNomeComputador;
    diaDaSemana := UpperCase(NomeDoDia(StrToDate(vData_Banco)));
    //não solicita a chave no fim de semana
    if ((diaDaSemana = 'SABADO') or (diaDaSemana = 'DOMINGO') or (isFeriadoNacional(StrToDate(vData_Banco)))) then exit;
    if ((nomePC <> 'DESENV01') and (nomePC <> 'DESENV02') and (nomePC <> 'DESENV03') and (nomePC <> 'KENN-PC') and
        (nomePC <> 'DESENV04') and (nomePC <> 'NOTEANDRE') and (nomePC <> 'ADM01')  and (nomePC <> 'DESENV05')  and
        (nomePC <> 'NOTEFABIANO') and (nomePC <> 'ATEND06') and (nomePC <> 'ATEND03') and (nomePC <> 'ATENDI') and
        (nomePC <> 'ATEND02') and (nomePC <> 'ATEND01') and (nomePC <> 'NOTEFISCAL') and (nomePC <> 'NOTETHIAGO') and (nomePC <> 'NOTEHERBERTH')) then begin

      qryChave := TADOQuery.Create(nil);
      qryChave.Connection := DModulo.Conexao;
      with qryChave do begin
        close;
        SQL.Text := 'SELECT nrVlAvulso FROM sequencial WITH (NOLOCK) ';
        //SQL.Text := 'SELECT dtExpiraCopia FROM CONFIGURACAO WITH (NOLOCK) ';
        Open;
        dtExp := FloatToDateTime(FieldByName('nrVlAvulso').AsInteger);
        close;
        if ((DtExp < StrToDate(vData_Banco)) or ((DtExp - 8) < StrToDate(vData_Banco))) then begin  //prazo vencido
          frmChave := TfrmChave.Create(Self);
          frmChave.ShowModal;
        end;
      end; //with
    end;
  end;
  }
end;

procedure TFrmPrincipalPreVenda.listarUsuariosNaCombo;
var
  query: TADOQuery;
begin
  query:= TADOQuery.Create(self);
  query.Connection:= DModulo.Conexao;
  cbxUsuario.Clear;
  with query do
  begin
    SQL.Text := 'select Distinct s.dsNome '+
                'from Senha S WITH (NOLOCK) '+
                '	inner join Permissao pe WITH (NOLOCK) '+
                '		on s.dsNome = pe.dsNome '+
                '		and s.dsSenha = pe.dsSenha '+
                'where pe.nrTag = 820 and pe.dsIncluir = ''X'' ';
    MontaComboListADO(query, cbxUsuario);
  end;
  FreeAndNil(query);
end;

procedure TFrmPrincipalPreVenda.FormCreate(Sender: TObject);
var
  DIniQtd : TIniFile; // Variáveis que irão cahamar o support.ini
  wndHandle : THandle;
  wndClass  : array[0..50] of Char;
  ThreadConexao3: TConexao3;
  nomePc : string;
begin
  Application.HintHidePause := 30000;
  lblMensagem.Left:=-(lblMensagem.Width);
  carregarPosicaoColunasDbGrid1;
  limparArrayBoolean(arrayLinhasDestacadas,0,299,False);
  CreateMutex( nil, False, 'PreVenda' );
  if GetLastError = ERROR_ALREADY_EXISTS then
  begin
    if MessageDlg('Este programa já está sendo executado neste computador! Deseja abrir outra pre-venda mesmo assim?',mtConfirmation,[mbYes,mbNo],0) = mrNo then begin
      Application.Terminate;  //TESTE
      FrmPrincipalPreVenda.Close;
      FrmPrincipalPreVenda := nil;
      FrmPrincipalPreVenda.Free;
      Exit;
    end;
  end
  else
    EdtTotal.Text := '0,00';
  //********* esconde a barra
 { StrPCopy(@wndClass[0],'Shell_TrayWnd');
  wndHandle := FindWindow(@wndClass[0], nil);
  ShowWindow(wndHandle, SW_RESTORE); }
  //*********
  intemIndexRgOpcoesOLD := RgOpcoes.ItemIndex;
  EdtTotal.Refresh;
  CriarIniSQL;
  DIniQtd    := TIniFile.Create(ExtractFilePath(Application.ExeName)+'Support.ini');
  vMatrizFilial := DIniQtd.ReadString('MATRIZFILIAL','Flag','');
  vFlagEtiqueta := DIniQtd.ReadString('ETIQUETA','Flag','');
  With ADOQryProcura do
  begin //Buscar o valor das variaveis de ambiente
    Sql.Text := 'Select * From Configuracao WITH (NOLOCK) ';
    Open;
    TestaFinanceiroNaConfirmacao:= FieldByName('testFinanConfPrevenda').AsBoolean;
    vBloqueioPreVenda := FieldByName('bloqueiaPrevenda').AsBoolean;
    vOcultaReferenciaNaImpressao := FieldByName('dsOcultaReferencia').AsString = 'S';
    dsCGC            := FieldByName('dsCGC').AsString;
    vConferencia     := FieldByName('ConferenciaPrevenda').AsBoolean;
    vdtBloqueio      := FieldByName('dsDiasAtrazo').AsInteger;
    vPorcDesconto    := FieldByName('dsPorcDesconto').AsFloat;
    vEstqNegativo    := FieldByName('dsBloqEstqNegativo').AsString;
    vSelecionaCFOP   := FieldByName('campo_48').AsString;
    vAutoLogoff      := FieldByName('PrevendaAutoLogoff').AsString = 'S';
    vBloquearDescontoAtacado := fieldByName('bloquearDescontoAtacado').AsBoolean;
    vSelecionaForma  := FieldByName('Campo_7').AsString;
    vJurosCobrado    := FieldByName('nrJurosDia').AsFloat;
    vEscolheProduto  := FieldByName('dsEscolheProduto').AsString;
    vMudaPreco       := FieldByName('dsMudaPreco').AsString;
    vMensagem_Promoc := fieldByName('dsMenPromocional').AsString;
    vCasasPreco      := FieldByName('CasasPreco').AsInteger;
    vLogoMarca       := CreateBlobStream(FieldByName('LogoMarca'),bmRead);
    vCasasQtd        := FieldByName('CasasQtd').AsInteger;
    vCidade          := FieldByName('dsCidade').AsString + ',';
    vUF              := FieldByName('dsUF').AsString;
    vPergunta_Apos_Comprovante := FieldByName('ImpPreVenda').AsString; // se for 1 faz a pergunta p o comprovante de 80 colunas se for 2 imprime direto
    //vSenha_Alteracao := FieldByName('dsSenha1').AsString;
    vCliDevedor      := FieldByName('dsBloqAtrazo').AsString;
    vLimiteCredito   := FieldByName('nrLimiteCredito').ASFloat;
    vCheqDev         := FieldByName('dsChequeDev').AsString;
    vLimCredito      := FieldByName('dsBloqLimite').AsString;
    vendereco        := FieldByName('dsEndereco').AsString;
    nmEmpresa        := FieldByName('nmEmpresa').AsString;
    vAutoPecas       := FieldByName('Campo_8').AsString;
    vOcultaDesconto  := FieldByName('Campo_51').AsString;
    vDescontoClienteAuto := FieldByName('DescontoCliente').AsBoolean;
    vAlteraCliente   := FieldByName('Campo_30').AsString;
    vLimitarDescontoFornecedor := FieldByName('LimitarDescontoFornecedor').AsBoolean;
    vQtdPrint        := FieldByName('nrPrintsPrevenda').AsString;
    vTipoDescontoNF  := FieldByName('Campo_38').AsString;
    vGerarSpedFiscal := FieldByName('campo_52').AsString = 'S';
    vGerarSpedPis    := FieldByName('campo_53').AsString = 'S';
    vGerarSintegra   := FieldByName('campo_54').AsString = 'S';
    // campo booleano que recebe TRUE se o campo_39 = '1'
    vPAFECF          := False; // não existe mais essa configuração   FieldByName('Campo_39').AsString = '1';
    vDestacarItensOcupados := FieldByName('pv_destaque').AsString = 'S';
    vEmpresa         := FieldByName('CAMPO_19').AsString;
    LblMensagem.caption := FieldByName('Campo_20').AsString; //letreiro
    vImpressao_80    := FieldByName('CAMPO_22').AsString;    // define se o cliente imprime prevenda no formularo continuo
    vImpressao_40    := FieldByName('CAMPO_23').AsString;    // define se o cliente imprime prevenda no formularo pequeno de 40 colunas
    vTipoImpressora  := FieldByName('CAMPO_24').AsString;    // define se é para imprimir na porta lpt1 ou USB
    vTeste_do_Financeiro := FieldByName('CAMPO_16').AsString; // 0 --> testa no caixa 1 --> testa na pre-venda
    vPrintSetup      := FieldByName('CAMPO_29').AsString; // S --> sobe o print setup na hora de imprimir a pre-venda p o usuario escolher a qtd de copias
    usarLoteValidade := FieldByName('habilitaLoteValidade').asBoolean;
    vConferencia     := FieldByName('ConferenciaPrevenda').AsBoolean;
    Close;
//    Sql.Text    := 'Select CONVERT(CHAR(10),GETDATE(),103) as data';
//    Open;
//    vdata_banco := FieldByName('data').AsString; // Pega a data do banco de dados (serviSalvaLogEventosdor).
    Sql.Text    := 'Select CONVERT(CHAR(10),GETDATE(),8) as data';
    Open;
    vtime := FieldByName('data').AsString; // Pega a hora do banco de dados (servidor).
    SystemDateTime(StrToDate(vData_banco),StrToTime(vTime));
    Close;
    if Length(SubstituiTexto(LblMensagem.Caption,' ')) = 0 then
      LblMensagem.Caption := 'Digite uma mensagem para os vendedores no SAEF.  Menu UTILITARIOS>GERENCIAIS>CONFIGURAÇÃO DO SISTEMA';
  end;
  if FrmPrincipalPreVenda.vConferencia = true then
    PopupMenu1.Items.Items[13].Enabled := false;
  listarUsuariosNaCombo;
  LiberaCopia;
  if UpperCase(vEmpresa) = 'MEGA' then //Mega móveis pediu para não permitir desmarcar o checkBox1. Protocolo 33228
     CheckBox1.Visible:= False;
  if UPPERCASE(vEmpresa) = 'LIBEL' then begin
    liberaDigitacaoLancamento := true;
    EdtLancto.Enabled := true;
    edtlancto.ReadOnly := false;
    EdtLancto.Color := clWindow;
  end;
  vFlag := '';
  Label14.Visible := false;
  Label15.Visible := false;
  shape2.visible := false;
  shape3.visible := false;
  if UPPERCASE(vEmpresa) = 'PROAUTO' then begin
    RgOpcoes.Items.Add('Ctrl+T Transf');
  end else begin
    ransferncia1.Visible := false;
    ConsultarCrdito1.Visible := false;
  end;
  if UpperCase(vEmpresa) = 'ODONTO' then begin
    label14.caption := 'V.Desconto';
    Label14.Visible := True;
    Label15.Visible := True;
    shape2.visible := True;
    shape3.visible := True;
    Label16.Visible := False;
    shape5.visible := False;
    shape6.visible := False;
    LblReserva.Visible := False;
    Label12.Visible := False;
    Label13.Visible := False;
    Label11.Visible := False;
    shape1.Visible := False;
    shape4.visible := False;
  end;
  if (UpperCase(vEmpresa) = 'REZENDE') or (UpperCase(vEmpresa) = 'BELAVISTA') or (UpperCase(vEmpresa) = 'PROAUTO') then begin
    CriarIniSQLDeposito;
    label12.caption := 'DEPÓSITO';
    Label14.Caption := 'DISPONÍVEL';
    Label16.Caption := 'OFICINA';
    Label11.Visible := True;
    shape1.Visible := True;
    shape4.visible := True;
    Label13.Visible := False;
    Label14.Visible := true;
    Label15.Visible := true;
    shape2.visible := True;
    shape3.visible := True;
  end;
//  if (UpperCase(vEmpresa) = 'AUTOCAR') or (UpperCase(vEmpresa) = 'REIDOFIAT') or
//     (UpperCase(vEmpresa) = 'TOPLINE') or (UpperCase(vEmpresa) = 'TREVO') or
//     (UpperCase(vEmpresa) = 'MECATTRON') or (UpperCase(vEmpresa) = 'LAMARAO')
//  then
  if TNEGLoja.getExibirQuantidadesReservadasPreVenda then
  begin
    Label14.Caption := 'PRÉ-VENDA';
    Label14.Visible := true;
    shape3.visible := True;
    Label15.Visible := true;
    Label15.Hint := 'Quantidades do item selecionado que estão em outras pré-vendas';
    LblReserva.Hint := 'Quantidades do item selecionado que estão em Ordens de Serviço';
    shape2.visible := True;
    Label16.Caption := 'RESERVA';
    if (UpperCase(vEmpresa) = 'PTINTAS_') then begin
      Shape1.Height := Shape3.Height;
      Label11.Top := Label13.Top;
      Label12.Caption := 'DISPONÍVEL';
      Label13.Visible := false;
      Label11.Hint := 'Quantidade disponível';
      Label12.Hint := '';
    end
    else begin
      edtDisponivel.Visible := True;
      Shape7.Visible := true;
      Label17.Visible := True;
      Shape8.Visible := true;
    end;
  end;
  if (UpperCase(vEmpresa) = 'NACIONAL') then begin
    CriarIniSQLDeposito;
    label12.caption := 'DEPÓSITO';
    Label14.Caption := 'LOJA';
    Label16.Caption := 'OFICINA';
    Label11.Visible := True;
    shape1.Visible := True;
    shape4.visible := True;
    Label13.Visible := False;
    Label14.Visible := true;
    Label15.Visible := true;
    shape2.visible := True;
    shape3.visible := True;
    Relatriodecontagem1.visible := True;//exibe a opção de relatorio de contagem de estoque
  end;
  if (UpperCase(vEmpresa) = 'PTINTAS') then begin
    CriarIniSQLDeposito;
    Label16.Caption := 'DEPÓSITO';
    LblReserva.Hint := 'Quantidades do item selecionado no estoque do depósito';
//    LblReserva.Visible    := True;
//    Label16.Visible    := True;
//    shape2.visible := True;
//    shape3.visible := True;
  end;
  Label11.Hint := 'Informações do pedido de compra do item selecionado';
  edtDisponivel.Hint := 'Quantidade do item selecionado baseada no estoque local subtraindo das reservas de pré-vendas';
  if (UpperCase(vEmpresa) = 'LLPARAFUSOS') or (UpperCase(vEmpresa) = 'BIJOUARTS') or (UpperCase(vEmpresa) = 'BIJOUARTSOS214')
  or (UpperCase(vEmpresa) = 'BIJOUARTSZEBRA') or (UpperCase(vEmpresa) = 'PIPELINE') or (UpperCase(vEmpresa) = 'LITORAL655') then begin
    Label14.Visible    := False;
    Label15.Visible    := False;
    shape2.visible := False;
    shape3.visible := False;
    Label16.Visible    := False;
    shape5.visible := False;
    shape6.visible := False;
    LblReserva.Visible := False;
    Label12.Visible    := False;
    Label13.Visible    := False;
    Label11.Visible    := False;
    shape1.Visible := False;
    shape4.visible := False;
  end;
  if (UpperCase(vEmpresa) = 'DISCABOS') or (UpperCase(vEmpresa) = 'SANTANA') then   // LIBERA P ALTERAR A QUANTIDADE NO PRODUTO DIRETO NA GRID
    SgDados.Options := [goFixedVertLine,goFixedHorzLine,goRangeSelect,goEditing];
  if (UpperCase(vEmpresa) = 'BIJOUARTS') or (UpperCase(vEmpresa) = 'BIJOUARTSOS214')    // or (UpperCase(vEmpresa) = 'LLPARAFUSOS') or
  or (UpperCase(vEmpresa) = 'BIJOUARTSZEBRA') or (UpperCase(vEmpresa) = 'PIPELINE') or (UpperCase(vEmpresa) = 'LITORAL655')  then begin
     FrmPrincipalPreVenda.caption := 'Impressão de etiquetas             <<<  Support Informática  79  3214-5161  >>>';
    Label29.Caption := 'Operador';
    Label2.visible  := false;
    Label3.visible  := false;
    Label4.visible  := false;
    EdtDesconto.Visible := false;
    EdtSubTotal.Visible := false;
    EdtTotal.Visible    := false;
  end;
{  if (UpperCase(vEmpresa) = 'LLPARAFUSOS') then begin
    Label2.Visible      := false;
    EdtDesconto.Visible := false;
    BtnAprazo.Enabled   := false;
    BtnAprazo.Visible   := false;
  end; }
  if vSelecionaCFOP = 'S' then begin
    EdtCFOP.Visible := True;
    Label21.Visible := True;
  end
  else begin
    EdtCFOP.Visible := False;
    Label21.Visible := False;
    EdtConsulta.Width := 197;
  end;
  if vMudaPreco = 'S' then begin
    EdtPreco.Color       := clWindow;
    EdtPreco.Enabled     := True;
    EdtPreco.ReadOnly    := False;
    EdtDescUnit.Color    := clWindow;
    EdtDescUnit.Enabled  := True;
    EdtDescUnit.ReadOnly := False;
  end;
  CmbConsulta.Items := RadioGroup1.Items;
{  With CmbConsulta do begin // adiciona itens a combo de consulta
    Items.Add('Código');
    Items.Add('Descrição');
    Items.Add('Código de Barras');
    Items.Add('Referência');
    Items.Add('Grupo');
    Items.Add('Descrição Contendo');
    ItemIndex := 1;
  end; }
  With SgDados do begin
    Cells[0,0] := 'Código';
    Cells[1,0] := 'Descrição';
    Cells[2,0] := 'Qtd';
    Cells[3,0] := 'P.Venda';
    Cells[4,0] := 'Total';
    Cells[5,0] := 'Prateleira';
    Cells[6,0] := 'C_Barras';
    Cells[7,0] := 'Referência';
    Cells[8,0] := 'Estoque';
    Cells[9,0] := 'Valor';
    Cells[10,0] := 'Und';
    Cells[11,0] := 'CFOP';
    if (UpperCase(vEmpresa) = 'GAMA') or (UpperCase(vEmpresa) = 'JETLASER')  then
        Cells[12,0] := 'Fator de Conversão'
    else
        ColWidths[12] := -1;
    if usarLoteValidade = True then
    begin
      Cells[13,0] := 'Lote';
      Cells[16,0] := 'Fab Lote';
    end else
    begin
      ColWidths[13] := -1;
      ColWidths[16] := -1;
    end;
    ColWidths[14] := -1; //cdAmbiente
    if (UpperCase(vEmpresa) = 'AMBIENTE') then
    begin
      Cells[15,0] := 'Ambiente';
      MiCadastroAmbientes.Visible := true;
    end else
      ColWidths[15] := -1;
    if (UpperCase(vEmpresa) = 'COPYART') then
      Cells[16,0] := 'Tipo Forro'
    else
      ColWidths[16] := -1;

    Cells[17,0] := 'ProdutoEmPromocao';
    ColWidths[17] := -1;
  end;
  //if (UpperCase(vEmpresa) = 'GAMA') then
  //  SgDados.ColCount := 12
  //else
  //  SgDados.ColCount := 12;
  Monta_Combo;
  if vCasasPreco > vLimiteCasasPreco then
    EdtDesconto.Text := '0,00000'
  else
    EdtDesconto.Text := '0,00';
  EdtDesconto.ReadOnly  := True;
  EdtSubTotal.ReadOnly  := True;
  Application.OnMessage := ProcessaMsg;
  UltimoLancamento;
  vAtacadoVarejo    := 'V'; // já começa recebendo o valor de varejo
  vDescontoCliente  := 0;
  // EdtCdCliente.Text := '1';
  // CbxCliente.Text   := '  Venda a Consumidor';
  if (UpperCase( vEmpresa ) = 'AMBIENTAR') then
    RgOpcoes.Items.Add('F4 NF-e');
  RodaScripts;
//  RodaScripts1;
  persistirUltimoEstadoForm;
  AtualizaQryConsulta;
  vOpcoes := '0';
  vlTotalAnterior := 0;
  liberouVenda := false;

  nomePC := pubNomeComputador;
  if ((nomePC <> 'DESENV01') and (nomePC <> 'DESENV02') and (nomePC <> 'DESENV03') and (nomePC <> 'NOTEANDRE') and (nomePC <> 'ADM01') and (nomePC <> 'DESENV04')) then begin // and (nomePC <> 'DESENV04')
//    ThreadConexao3 := Tconexao3.Create(true);
    //ThreadConexao.FreeOnTerminate := true;
//    ThreadConexao3.Resume;
  end;

{  if  screen.width = 1360  then // Testa se for 1360 essa resolução é usada para monitor wide screen
    AjustaForm
  else begin
    scaled := true;
    if (screen.width <> ScreenWidth) then begin
      height := longint(height) * longint(screen.height) DIV ScreenHeight;
      width := longint(width) * longint(screen.width) DIV ScreenWidth;
      scaleBy(screen.width, ScreenWidth);
      //scaleBy(800, 600);
    end;
  end; }
  if (UpperCase(vEmpresa) = 'AMBIENTE') then begin
    MontaComboAmbiente;
    CbxAmbiente.Visible := true;
    LblAmbiente.Visible := true;
  end;
  if usarLoteValidade = True then begin
    CbLote.Visible := True;
    label23.visible:= True;
    Label22.Visible := True;
  end
  else if (UpperCase(vEmpresa) <> 'AMBIENTE') then
  begin
    label1.Left:= label1.Left-190;
    label5.Left:= label5.Left-190;
    label6.Left:= label6.Left-190;
    EdtQtd.Left:= EdtQtd.Left-190;
    EdtDescUnit.Left:= EdtDescUnit.Left-190;
    EdtPreco.Left:= EdtPreco.Left-190;
  end;
  if (UPPERCASE(vEmpresa) = 'DELUC') then
  begin
    CbPrevisao.Visible:= false;
    EdtQtd.ReadOnly:= True;
    EdtQtd.Text:= '1,00';
  end;
  self.Caption :=  Self.Caption + '  Compilação ' + GetVersaoArq;
  CbxCliente.ItemIndex := 0;
  CbxClienteChange(Self);
  //if UPPERCASE(vEmpresa) = '' then begin
  //end;
//  self.Caption :=  Self.Caption + '  Data da última atualização: ' + DateTimeToStr(PegaDataDoExecutavel(ExtractFileName(Application.ExeName)))+ '  Compilação ' + GetVersaoArq;
end;

procedure TFrmPrincipalPreVenda.FormShow(Sender: TObject);
begin
 {Oculta a opcao de Orcamento das opções}
 if OcultarOrcamentoNaPreVenda then begin
    RgOpcoes.Controls[2].Visible:= false;
    Oramento1.Enabled:= False;
    Oramento1.Visible:= False;
  end;
  if (UPPERCASE(vEmpresa) = 'CHALOC')  then begin

    //TMenuItem(PopupMenu1.Items.Items[1].Items[2]).Enabled := False;
    TMenuItem(PopupMenu1.Items.Items[0].Items[3]).Enabled := False;
    TMenuItem(PopupMenu1.Items.Items[0].Items[4]).Enabled := False;
    TMenuItem(PopupMenu1.Items.Items[0].Items[5]).Enabled := False;
    TMenuItem(PopupMenu1.Items.Items[0].Items[6]).Enabled := False;
    TMenuItem(PopupMenu1.Items.Items[0].Items[7]).Enabled := False;

    TMenuItem(PopupMenu1.Items.Items[1].Items[2]).Enabled := False;
    TMenuItem(PopupMenu1.Items.Items[1].Items[3]).Enabled := False;
    TMenuItem(PopupMenu1.Items.Items[1].Items[4]).Enabled := False;

    TRadioButton(RadioGroup1.Controls[1]).Enabled := False;
    TRadioButton(RadioGroup1.Controls[2]).Enabled := False;
    TRadioButton(RadioGroup1.Controls[3]).Enabled := False;

    TRadioButton(RadioGroup1.Controls[5]).Enabled := False;
    TRadioButton(RadioGroup1.Controls[6]).Enabled := False;
    TRadioButton(RadioGroup1.Controls[4]).Enabled := False;
    TRadioButton(RadioGroup1.Controls[0]).Enabled := False;

    if dsCGC = '01655446000206' then begin//FLAG CHALOC E CNPJ DA POLIANA
      TRadioButton(RadioGroup1.Controls[0]).Enabled := True;
      TMenuItem(PopupMenu1.Items.Items[1].Items[2]).Enabled := True;
    end
    else
    if dsCGC = '10237494000186' then begin//FLAG CHALOC E CNPJ DA POLIANA
      TRadioButton(RadioGroup1.Controls[0]).Enabled := True;
      TMenuItem(PopupMenu1.Items.Items[1].Items[2]).Enabled := True;
      RadioGroup1.ItemIndex := 0;
    end
    else
    if dsCGC = '01655446000117' then begin//IPANEMA
      TRadioButton(RadioGroup1.Controls[0]).Enabled := True;
      TMenuItem(PopupMenu1.Items.Items[1].Items[2]).Enabled := True;
      RadioGroup1.ItemIndex := 0;
    end
    else begin
      TRadioButton(RadioGroup1.Controls[4]).Enabled := True;
      TMenuItem(PopupMenu1.Items.Items[0].Items[6]).Enabled := True;
      RadioGroup1.ItemIndex := 4;
    end;
  end;
//  if (UpperCase(vEmpresa) = 'AQUARIUM') then
//  begin
//    RgOpcoes.Controls[2].Visible:= False;
//    Oramento1.Enabled:= False;
//    Oramento1.Visible:= False;
//  end;
end;

procedure TFrmPrincipalPreVenda.FormActivate(Sender: TObject);
begin
  Application.OnMessage := ProcessaMsg;
  if (Ativa = 'N') or (vFlag <> '') then exit;
  if (Ativa = 'T') then begin //thiago fiz isso p evtar o bug do asterisco no campo de escolher prevenda
    Ativa := #0;
    Exit;
  end;
  //if (RgOpcoes.ItemIndex in [0,2,4]) or ((transformarOrcamentoPrevenda = true) and (RgOpcoes.ItemIndex = 1)) then
  //  cbxUsuario.SetFocus
  //else
  //  edtLancto.SetFocus;
  DtLancto.Date := Date;
  if UPPERCASE(vEmpresa) <> 'TREVO' then begin
    if UPPERCASE(vEmpresa) = 'SANTANA' then
      RgOpcoes.ItemIndex := 2
    else
      RgOpcoes.ItemIndex := 0;
  end;
end;

procedure TFrmPrincipalPreVenda.UltimoLancamento;
begin
//  if prevenda <> nil then begin
//    prevenda.Destroy;
//    prevenda:= nil;
//  end;
//  prevenda:= TPrevenda.Create();
  With ADOQryUltimo do
  begin
   // Sql.Text := 'Select DISTINCT (nrPedidos + 1) as Lancto From Sequencial Where cdCodigo = 1';
    Sql.Text := 'Select (nrPedidos + 1) as Lancto From Sequencial Where cdCodigo = 1';
    Open;
    EdtLancto.Text:= FormatFloat('000000', FieldByName('Lancto').AsInteger);
    EdtLancto.Refresh;
    EdtOperador.Text:= cdOperador;
    close;
  end;
end;

procedure TFrmPrincipalPreVenda.UltimoLancamentoBloqueandoTabela;
begin
  With ADOQryUltimo do
  begin
    Sql.Text := 'Select DISTINCT (nrPedidos + 1) as Lancto From Sequencial With(Holdlock, Updlock) Where cdCodigo = 1';
    Open;
    EdtLancto.Text:= FormatFloat('000000', FieldByName('Lancto').AsInteger);
    EdtLancto.Refresh;
    EdtOperador.Text := cdOperador;
    Application.ProcessMessages;
    close;
  end;
end;

function TFrmPrincipalPreVenda.ValidarNumeroLancamento_LIBEL: Boolean;
begin
  Result := True;
  if UPPERCASE(vEmpresa) = 'LIBEL' then begin
    if (trim(EdtLancto.text) <> '') and (RgOpcoes.itemIndex <> 1) then begin
      if Existe_Numero_Orcamento(EdtLancto.text) then begin
        Application.MessageBox('Já existe um lançamento com esse número!', 'Atenção', mb_ok + mb_iconwarning + mb_applModal);
        BtnConfirmar.Enabled := TRUE;
        Alteraquantidade1.Enabled := true;
        Result := False;
      end;
    end;
  end;
end;

function TFrmPrincipalPreVenda.LoginValido: Boolean;
begin
  Result := True;
  if EdtUsuario.Text = '' then begin
    Application.OnMessage := NaoProcessaMsg;
    Messagedlg('Informe o usuário e senha do vendedor!', mtWarning, [mbOk], 0);
    cbxUsuario.Setfocus;
    Application.OnMessage := ProcessaMsg;
    BtnConfirmar.Enabled := True;
    Alteraquantidade1.Enabled := true;
    Result := False;
  end;
end;

procedure TFrmPrincipalPreVenda.Logoff1Click(Sender: TObject);
begin
  Solicitar_Login;
end;

function TFrmPrincipalPreVenda.validarQuantidadeItemFracionado(
  unidade: string): Boolean;
begin
  try
    with DModulo.ADOQuery1 do
    begin
      SQL.Text := 'Select fracionado From UNIDADE WITH (NOLOCK) Where dsUnidade = :UNIDADE';
      Parameters.ParamByName('UNIDADE').Value := unidade;
      Open;
      if DModulo.ADOQuery1.RecordCount > 0 then
      begin
        if DModulo.ADOQuery1.FieldByName('fracionado').AsBoolean then
          Result := False
        else
          Result := True;
      end;
    end;
  except
    Result := True;   // no caso de erro liberar a quantidade digitada
  end;
end;

procedure TFrmPrincipalPreVenda.AtualizaCombProduto;
begin
  With ADOQryProduto do
  begin  // mota a combo dos nomes dos produtos
    Sql.Text := 'Select P.nmProduto,P.cdProduto,P.cdFabricante,P.dsReferencia,P.vlPreco,P.nrQtdReal,'+
                'P.dsUnidade, W.nmPessoa From Produto P WITH (NOLOCK) Inner Join Pessoa '+
                'W WITH (NOLOCK) ON P.cdPessoa_1 = W.cdPessoa Order By P.nmProduto      ';
    open;
  end;
  if (UPPERCASE(vEmpresa) <> 'DELUC') then
     EdtQtd.Text:= '0,000';
  EdtPreco.Text := FormatFloatQ(vCasasPreco, 0.0);
  EdtDescUnit.Text:= '0,00';
  setLabel23(0);
  CbLote.ItemIndex := -1;
end;

Procedure TFrmPrincipalPreVenda.EdtQtdExit(Sender: TObject);
var resto : Shortint;
begin
try
//  if (UPPERCASE(vEmpresa)='TREVO') and (StrToFloatDef(EdtQtd.Text,0) > 0) and (edtLogin.Text = '') then
//    Solicitar_Login(true);
  if (UPPERCASE(vEmpresa) = 'GAMA') and (trim(EdtCFOP.Text) = '') and EdtCFOP.Visible then
  begin
    Application.OnMessage :=  FrmPrincipalPreVenda.NaoProcessaMsg;
    ShowMessage('O campo CFOP é obrigatório!');
    EdtCFOP.SelectAll;
    EdtCFOP.SetFocus;
    Application.OnMessage :=  FrmPrincipalPreVenda.ProcessaMsg;
    exit;
  end;
  //na mega moveis e na bela vista, eles não querem q os vendedores vendam "Meio" produto, ou 0,5 sofá. kenneth
  if ((UPPERCASE(vEmpresa) = 'MEGA') or (UPPERCASE(vEmpresa)='BELAVISTA')) then
  begin
    if Frac(StrToFloat(EdtQtd.Text)) > 0 then
    begin
      Application.OnMessage := NaoProcessaMsg;
      MessageDlg('Digite um valor Inteiro!',mtWarning,[mbOk],0);
      Application.OnMessage := ProcessaMsg;
      EdtQtd.SetFocus;
      Exit;
    end;
  end;

  if (Length(EdtQtd.Text) < 1) or (StrToFloat(EdtQtd.Text) <= 0) or (ADOSPConsulta.RecordCount = 0) then
  begin
    //LimparPesquisa;
    Exit;
  end
  else
  begin

    // É obrigatório escolher o cliente antes de lançar produtos
    if (CbxCliente.ItemIndex < 0)  then // and (UPPERCASE(vEmpresa) <> 'CAMARATUBA')
    begin
      Application.messagebox('Informe o cliente','Atenção', MB_OK + MB_ICONWARNING + MB_APPLMODAL);
      LimparPesquisa;
      CbxCliente.SetFocus;
      Exit;
    end
    else
    if not EdtPreco.Enabled then  // caso o usuario não possa alterar o preço dos produtos, lança na grid agora
       EnviaProdutos;
  end;
except
  //
end;
end;

Procedure TFrmPrincipalPreVenda.LimparPesquisa;
begin
    EdtConsulta.SetFocus;
    EdtConsulta.Clear;
    if (UPPERCASE(vEmpresa) <> 'DELUC') then
        EdtQtd.Text:= '0,000';
    EdtPreco.Text := FormatFloatQ(vCasasPreco, 0.0);
    EdtDescUnit.Text := '0,00';
    setLabel23(0);
    CbLote.ItemIndex := -1;
    if usarLoteValidade = True then
    begin
      CbLote.ItemIndex:=-1;
      CbLote.Enabled:=False;
    end;
end;

Procedure TFrmPrincipalPreVenda.enviaProdutos;
begin
  if DisponivelNoEstoque(strToFloatDef(EdtQtd.Text,0),ADOSPConsulta.FieldByName('Código').AsInteger) then
  begin
    if Frac(StrToFloatDef(EdtQtd.Text,1)) <> 0 then
    begin  // a quantidade está fracionada, logo, termos que testar se o produto esta definido como fracionado
      if not validarQuantidadeItemFracionado(ADOSPConsulta.FieldByName('UNIDADE').AsString) then
      begin
        Application.OnMessage := NaoProcessaMsg;
        ShowMessage('Incompatibilidade na quantidade digitada.  Este ítem não pode ser vendido fracionado!');
        Application.OnMessage := ProcessaMsg;
        EdtQtd.SelectAll;
        EdtQtd.SetFocus;
        Exit;
      end;
    end;
    quantidade := StrToFloatDef(EdtQtd.Text,0);
    if usarLoteValidade = True then
    begin
      LancaProdutosHospitalar;
      setLabel23(QuantidadeDispEmLotes(ADOSPConsulta.FieldByName('Código').AsInteger));
    end else
      LancaProdutos(strToFloatDef(EdtQtd.Text, 0));
    atualizaEditQtdItens;
    if (UPPERCASE(vEmpresa) <> 'DELUC') then
      EdtQtd.Text := '0,000';
    EdtPreco.Text    := FormatFloatQ(vCasasPreco, 0.0);
    EdtDescUnit.Text := '0,00';
    CbLote.ItemIndex := -1;
    //  EdtConsulta.Clear;
    EdtConsulta.SetFocus;
    vDescricaoGama := '';
    vUndGama := '';
    vFatorGama := 0;
    if (UpperCase(vFlagEtiqueta) <> 'KARIB') and ((UPPERCASE(vEmpresa)<>'LLPARAFUSOS') and (UpperCase(vEmpresa) <> 'NACIONAL')) then
      AtualizaQryConsulta;
  end;
end;

Procedure TFrmPrincipalPreVenda.LancaProdutosHospitalar;
var
  quantidade, qtdTotalLote, qtdLoteAtual, qtdLancada: real;
  sequencialLote, cdproduto: integer;
  lote, cdFabricanteLote: string;
begin
  quantidade:= strToFloatDef(EdtQtd.Text,0);
  cdproduto:= ADOSPConsulta.FieldByName('Código').AsInteger;
  if cblote.Items.Count > 0 then // SE TIVER LOTE
  begin
    if cblote.ItemIndex = -1 then // SE O USUÁRIO NÃO ESCOLHER UM LOTE, LANÇAMOS AUTOMATICAMENTE OS MAIS ANTIGOS
    begin
      qtdTotalLote:= QuantidadeDispEmLotes(cdProduto);
      if quantidade > qtdTotalLote then // SE NÃO HOUVER QUANTIDADE SUFICIENTE CANCELO O LANÇAMENTO
      begin
        MessageDlg('Quantidade disponível em lotes: ' + formatFloat('0.000',qtdTotalLote) + ' ',mtWarning,[mbOk],0);
        EdtConsulta.SetFocus;
        EdtConsulta.Clear;
        EdtQtd.Text           := '0,000';
        EdtDescUnit.Text      := '0,00';
        setLabel23(0);
        CbLote.ItemIndex := -1;
        Application.OnMessage := ProcessaMsg;
      end
      else
      begin
        sequencialLote:= 0;
        while quantidade > 0 do // DISTRIBUO A QUANTIDADE DO PRODUTO ENTRE OS LOTES QUE JÁ ESTÃO ORDENADOS PELA VALIDADE;
        begin
          lote:= copy_campo(cbLote.Items[sequencialLote],'|',1);
          cdFabricanteLote:= copy_campo(cbLote.Items[sequencialLote],'|',4);
          qtdLoteAtual:= QuantidadeDispNoLote(lote, cdproduto, StrToInt(cdFabricanteLote));

          { Se a quantidade de produtos que resta para ser lançada for maior que a quantidade disponível no lote lanço apenas a quantidade disponível no lote. }
          if (quantidade > qtdLoteAtual) then
             qtdLancada:= qtdLoteAtual
          else
             qtdLancada:= quantidade;
          if qtdLancada > 0 then begin // Se a quantidade a ser lançada for maior que zero eu mando pra grid
            LancaProdutos(qtdLancada, lote, cdFabricanteLote);
            quantidade:= quantidade - qtdLancada;
          end;
          sequencialLote:= sequencialLote + 1;
        end;
      end;
    end
    else // SE O USUÁRIO ESCOLHER UM LOTE, VEJO SE TEM QUANTIDADE SUFICIENTE
    begin
      lote:= copy_campo(cbLote.Items[cbLote.itemIndex],'|',1);
      cdFabricanteLote:= copy_campo(cbLote.Items[cbLote.itemIndex],'|',4);
      qtdLoteAtual:= QuantidadeDispNoLote(lote, cdproduto, strToInt(cdFabricanteLote));
      if quantidade > qtdLoteAtual then // SE NÃO HOUVER QUANTIDADE SUFICIENTE CANCELO O LANÇAMENTO
      begin
        MessageDlg('Quantidade disponível no lote selecionado: ' + formatFloat('0.000',qtdLoteAtual) + ' ',mtWarning,[mbOk],0);
        EdtConsulta.SetFocus;
        EdtConsulta.Clear;
        EdtQtd.Text:= '0,000';
        EdtDescUnit.Text:= '0,00';
        setLabel23(0);
        CbLote.ItemIndex:= -1;
        Application.OnMessage := ProcessaMsg;
      end
      else
        LancaProdutos(quantidade, lote, cdFabricanteLote);
    end;
  end
  else
    LancaProdutos(quantidade);
end;

procedure TFrmPrincipalPreVenda.lblLogoffClick(Sender: TObject);
begin
  Cancelar;
end;

Procedure TFrmPrincipalPreVenda.LancaProdutos(quantidade:real; lote:string = ''; cdFabricanteLote:string='');
var
  L,T : integer;
  und : TUnidade;
  QtdLote : real;
  itemPrevenda: TItemPrevenda;
  possuiPermissaoVenderAbaixoDoCusto, abaixoDoCustoFinal: Boolean;
  produtoLancado: TDOMProduto;
begin

  // TESTA LIMITE DE ITENS
  if (StrToFloat(edtQtdItens.text) >= 135) and ((UpperCase(vFlagEtiqueta) <> 'KARIB')) then
  begin
    Application.OnMessage := NaoProcessaMsg;
    MessageDlg('Esta pré-venda alcançou o limite máximo de 135 itens!',mtWarning,[mbOk],0);
    Application.OnMessage := ProcessaMsg;
    EdtConsulta.SetFocus;
    Exit;
  end;

  // TESTA SE QUANTIDADE ZERADA
  if quantidade <= 0 then
  begin
    EdtConsulta.SetFocus;
    Exit;
  end;

  // TESTA SE PRODUTO INATIVO
  if ADOSPConsulta.FieldByName('dsAtivo').AsString <> 'S' then
  begin
    Application.OnMessage := NaoProcessaMsg;
    MessageDlg('Este produto está definido no cadastro como inativo!',mtWarning,[mbOk],0);
    EdtConsulta.SetFocus;
    EdtConsulta.Clear;
    if (UPPERCASE(vEmpresa) <> 'DELUC') then
        EdtQtd.Text           := '0,000';
    EdtDescUnit.Text      := '0,00';
    setLabel23(0);
    CbLote.ItemIndex := -1;
    Application.OnMessage := ProcessaMsg;
    exit;
  end;
  if (UpperCase(vEmpresa) = 'GAMA') or (UpperCase(vEmpresa) = 'JETLASER') or (UpperCase(vEmpresa) = 'PTINTAS') then
  begin
    FrmDescricao := TFrmDescricao.create(FrmDescricao);
    FrmDescricao.EdtDescricao.Text := ADOSPConsulta.FieldByName('DESCRIÇÃO').AsString;
    FrmDescricao.EdtUndCad.Text    := ADOSPConsulta.FieldByName('UNIDADE').AsString;
    FrmDescricao.EdtUnidade.Text   := ADOSPConsulta.FieldByName('UNIDADE').AsString;
    FrmDescricao.EdtQtd.Text       := FormatFloat('0.00000', StrToFloatDef(EdtQtd.Text,0));
    FrmDescricao.EdtQtdSai.Text    := FormatFloat('0.00000', StrToFloatDef(EdtQtd.Text,0));
    FrmDescricao.EdtFator.Text     := '1,00000';
    if (UpperCase(vEmpresa) = 'PTINTAS') then
    begin
      FrmDescricao.panel2.visible := False;
      FrmDescricao.Height := 112;
//      FrmDescricao.AutoSize := True;
    end;
    FrmDescricao.ShowModal;
    freeandNil(FrmDescricao);
    if vDescricaoGama = '' then
       Exit;
  end;

  { TODO -oclaudioo -c : VALIDAR AS QTDS DISPONIVEIS NOS LOTES NA CONFIRMAÇÃO DA PREVENDA 07/05/2013 11:22:38 }
  if ADOSPConsulta.FieldByName('Preco').AsFloat > ADOSPConsulta.FieldByName('Valor').AsFloat then
     vProdutoPromocao := 'S';

  if prevenda = nil then
    prevenda:= TPrevenda.Create();

  if (Pode_Inserir_o_Mesmo_Produto = false) then
  begin
    for L := 0 to prevenda.itens.Count - 1 do
    begin
      if (prevenda.itens[L].cdProduto = ADOSPConsulta.FieldByName('Código').AsInteger) and
         (not item_cancelado(L)) then
      begin
        if (usarLoteValidade = True) then // "hospitalar" permite lançar o produto mais de uma vez, por causa dos lotes
        begin
          Application.OnMessage := NaoProcessaMsg;
          MessageDlg('Aviso: Esse produto já está incluso nessa pré-venda!',mtInformation,[mbOk],0);
          Application.OnMessage := ProcessaMsg;
          Break;
        end else
        begin
          Application.OnMessage := NaoProcessaMsg;
          MessageDlg('Esse produto já está incluso nessa pré-venda!',mtWarning,[mbOk],0);
          if (UPPERCASE(vEmpresa) <> 'DELUC') then
              EdtQtd.Text      := '0,00';
          EdtDescUnit.Text := '0,00';
          setLabel23(0);
          CbLote.ItemIndex := -1;
          EdtConsulta.SetFocus;
          Application.OnMessage := ProcessaMsg;
          Exit;
        end;
      end;
    end;
  end;
  if (StrToFloat(EdtPreco.Text) <= 0) then
  begin
    EdtConsulta.SetFocus;
    EdtConsulta.Clear;
    if (UPPERCASE(vEmpresa) <> 'DELUC') then
        EdtQtd.Text      := '0,000';
    EdtDescUnit.Text := '0,00';
    setLabel23(0);
    CbLote.ItemIndex := -1;
    exit;
  end;
  if TNEGLoja.getBloquearVendaAbaixoDoCustoFinal then
  begin
    produtoLancado:= TNEGProduto.buscarProduto(ADOSPConsulta.FieldByName('Código').AsInteger);
    abaixoDoCustoFinal:= ((StrToFloat(EdtPreco.Text) < produtoLancado.nrCustoFinal_a) and (vAtacadoVarejo='A'))OR // prevenda.Cliente.isAtacado
                         ((StrToFloat(EdtPreco.Text) < produtoLancado.nrCustoFinal_v) and (vAtacadoVarejo<>'A')); // not prevenda.Cliente.isAtacado
    produtoLancado.destruir;
    if abaixoDoCustoFinal then
    begin
      if FrmCancelamentoVenda.Possui_Permissao('631','V',cbxUsuario.Text,EdtUsuario.Text) then begin
        possuiPermissaoVenderAbaixoDoCusto := true;
        Application.MessageBox(PChar('Vendendo abaixo do custo final'), 'Atenção', MB_OK + MB_ICONINFORMATION + MB_APPLMODAL);
      end
      else begin
        FrmCancelamentoVenda:= TFrmCancelamentoVenda.Create(Self, '631', 'V', possuiPermissaoVenderAbaixoDoCusto);
        FrmCancelamentoVenda.Copyright.Caption :=  '<<<<   Venda abaixo do custo final    >>>>';
        FrmCancelamentoVenda.showmodal;
      end;
      if (not possuiPermissaoVenderAbaixoDoCusto) then
      begin
        if (UPPERCASE(vEmpresa) <> 'DELUC') then
            EdtQtd.Text:= '0,00';
        EdtDescUnit.Text:= '0,00';
        setLabel23(0);
        CbLote.ItemIndex:= -1;
        EdtConsulta.SetFocus;
        Application.OnMessage:= ProcessaMsg;
        Exit;
      end;
    end;
  end;
  if (Trim(EdtDescUnit.Text) <> '') and (StrToFloat(EdtdescUnit.Text) > 0 ) and ((UpperCase(vEmpresa) <> 'BG')and(UpperCase(vEmpresa) <> 'MOTOPECAS')) then
  begin
    //and (UPPERCASE(vEmpresa) <> 'LLPARAFUSOS') then
    BtnAprazo.Enabled := False;
    edtdesconto.Text := '0,00000';
    edtdesconto.ReadOnly := True;
  end;

  if (UpperCase(vFlagEtiqueta) = 'KARIB') then
    T := 1
  else
    T := Round(quantidade);
  for L := T to Round(quantidade) do begin
    itemPrevenda:= TItemPrevenda.Create(ADOSPConsulta.FieldByName('Código').AsInteger);

    if (UpperCase(vEmpresa) = 'GAMA') or (UpperCase(vEmpresa) = 'JETLASER') or (UpperCase(vEmpresa) = 'PTINTAS') then
      itemPrevenda.descricao:= vDescricaoGama; // não coloquei no "senão" porque a descrição original já vem na criação do objeto.

    if (UpperCase(vEmpresa) = 'GAMA') or (UpperCase(vEmpresa) = 'JETLASER') then begin
      und := TNEGUnidade.getUnidade(vUndGama);
      if und = nil then begin
        und := TUnidade.Create;
        und.unidade := vUndGama;
      end;
      itemPrevenda.unidade := und;
    end;

    if (UpperCase(vEmpresa) = 'GAMA') or (UpperCase(vEmpresa) = 'JETLASER') then
      itemPrevenda.fatorConversao:= vFatorGama;

    if (usarLoteValidade = True) and ((lote <> '') and (cdFabricanteLote <> '')) then begin
      itemPrevenda.lote:= lote;
      itemPrevenda.cdFabricanteLote := StrToInt(cdFabricanteLote);
    end;
    if (UpperCase(vFlagEtiqueta) = 'KARIB') then
      itemPrevenda.quantidade   := 1
    else
      itemPrevenda.quantidade   := quantidade;

    itemPrevenda.precoVenda   := StrToFloat(EdtPreco.Text);
    itemPrevenda.precoBruto   := RoundTo(ADOSPConsultaVALOR.AsFloat,vCasasPreco*-1);
    itemPrevenda.SubTotal     := RoundTo(itemPrevenda.quantidade * itemPrevenda.precoVenda,-2);
    itemPrevenda.tipoForro    := tipoForro;
    itemPrevenda.codigoBarras := ADOSPConsulta.FieldByName('CÓDIGO_BARRAS').AsString;
    if vSelecionaCFOP = 'S' then
      itemPrevenda.cfop:= EdtCFOP.Text;
    if ((StrToFloat(FormatFloatQ(vCasasPreco, StrtoFloat(EdtPreco.Text))) > StrToFloat(FormatFloatQ(vCasasPreco, ADOSPConsulta.FieldByName('valor').AsFloat)))
      or (vOcultaDesconto = 'S')) or ((UpperCase(vEmpresa) = 'BG')or(UpperCase(vEmpresa) = 'MOTOPECAS')) then //nao mostrar desconto na venda
    begin
      // Se houver aumento no preço, esse será o novo preço bruto (claudio 18-09-2015)
      itemPrevenda.vlPreco    := StrtoFloat(EdtPreco.Text);
      itemPrevenda.vlAtacado  := StrtoFloat(EdtPreco.Text);
      itemPrevenda.precoBruto := StrtoFloat(EdtPreco.Text);
    end
    else begin
      itemPrevenda.vlPreco   := StrtoFloat(EdtPreco.Text);//ADOSPConsulta.FieldByName('valor').AsFloat;
      itemPrevenda.vlAtacado := ADOSPConsulta.FieldByName('valor').AsFloat;
    end;
    if (UpperCase(vEmpresa) = 'AMBIENTE') then
      itemPrevenda.ambiente:= TNEGAmbiente.getAmbiente(StrToIntDef(edtcdAmbiente.text, -1));

    if (UpperCase(vEmpresa) <> 'BG') and (UpperCase(vEmpresa) <> 'MOTOPECAS') then begin
      if ((StrtoFloat(FormatFloatQ(vCasasPreco,ADOSPConsultaPRECO.AsFloat)) > StrtoFloat(FormatFloatQ(vCasasPreco,ADOSPConsultaVALOR.AsFloat))) or
          (StrtoFloat(FormatFloatQ(vCasasPreco,ADOSPConsultaVALOR.AsFloat)) > StrtoFloat(FormatFloatQ(vCasasPreco,StrToFloat(EdtPreco.Text)))) ) then
        itemPrevenda.Promocao_desconto_Item := true
      else
        itemPrevenda.Promocao_desconto_Item := false;
    end;

    // INDICO NO ARRAY SE ESSA LINHA FICARÁ DESTACADA OU NÃO
    if (vDestacarItensOcupados) and ((RgOpcoes.ItemIndex = 0)or((transformarOrcamentoPrevenda = true) and (RgOpcoes.ItemIndex = 1))) then
        if (vEstqNegativo <> 'S') and (((qtdInsuficienteParaPrevend(itemPrevenda.cdProduto, itemPrevenda.quantidade) > 0) and (itemPrevenda.tipoComposicao <> composto))
              or ((itemPrevenda.tipoComposicao = composto)and(TNEGProduto.getEstoquePossivelProdutoComposto(itemPrevenda.cdproduto,1)<=0))) then
           itemPrevenda.itemLinhaDestacada := True
        else
           itemPrevenda.itemLinhaDestacada := False;

    prevenda.itens.Add(itemPrevenda);

    CarregarItensGrid(prevenda);

    if (UpperCase(vFlagEtiqueta) <> 'KARIB') then
    begin
      EdtConsulta.SetFocus;
      Exit;  // EVITA REPETIR O ITENS NA GRID SE NAO FOR KARIB
    end;
  end;
end;

//Procedure TFrmPrincipalPreVenda.EnviaProdutosHospitalar;
//var
//  quantidade, qtdTotalLote, qtdLoteAtual, qtdLancada: real;
//  sequencialLote, cdproduto: integer;
//  lote: string;
//begin
//  quantidade:= strToFloatDef(EdtQtd.Text,0);
//  qtdTotalLote:= strToFloatDef(copy_campo(Label23.Caption,':',2),0);
//  if quantidade > qtdTotalLote then
//  begin
//    MessageDlg('Quantidade disponível em lotes --> ' + formatFloat('0.000',qtdTotalLote) + ' ',mtWarning,[mbOk],0);
//    EdtConsulta.SetFocus;
//    EdtConsulta.Clear;
//    EdtQtd.Text           := '0,000';
//    EdtDescUnit.Text      := '0,00';
//    setLabel23(0);
//    CbLote.ItemIndex := -1;
//    Application.OnMessage := ProcessaMsg;
//    exit;
//  end;
//  sequencialLote:= 0;
//  while quantidade > 0 do // DISTRIBUO A QUANTIDADE DO PRODUTO ENTRE OS LOTES QUE JÁ ESTÃO ORDENADOS PELA VALIDADE;
//  begin
//    lote:= copy_campo(cbLote.Items[sequencialLote],'|',1);
//    cdproduto:= ADOSPConsulta.FieldByName('Código').AsInteger;
//    qtdLoteAtual:= QuantidadeDispNoLote(lote, cdproduto);
//    if (quantidade > qtdLoteAtual) then  // SE A QUANTIDADE DE PRODUTOS QUE RESTA PARA SER LANÇADA FOR MAIOR QUE A QUANTIDADE DISPONÍVEL NO LOTE
//       qtdLancada:= qtdLoteAtual        // EU LANÇO APENAS A QUANTIDADE DISPONÍVEL NO LOTE
//    else
//       qtdLancada:= quantidade;
//    LancaProdutos(qtdLancada, lote);
//    quantidade:= quantidade - qtdLancada;
//    sequencialLote:= sequencialLote + 1;
//  end;
//end;

function TFrmPrincipalPreVenda.DisponivelNoEstoque(quantidade:real; cdproduto:integer; alterandoQuantidadeNaGrid:boolean=False):Boolean;
var
  vqtd: real;
  l: integer;
  resultado: boolean;
  estoqueFisico, estoqueNecessario, estoqueDisponivel: real;
  produto : TDOMProduto;
begin
  resultado:= True;
  if (vEstqNegativo <> 'S') or (UpperCase(vEmpresa) = 'ODONTO') then
  begin // não vende com estoque negativo
    vqtd := 0;  // rotina para teste se a quantidade exede o estoque real
    for l := 1 to SgDados.RowCount - 1 do
    begin
      if (SgDados.Cells[0,l] = intToStr(cdProduto)) then
        vqtd := vqtd + StrToFloat(SgDados.Cells[2,l]);
    end;
    estoqueFisico:= getNrQtdReal(DModulo.Conexao.ConnectionString, cdproduto);

    { nesse caso, a nova quantidade já está em [vqtd]  }
    if alterandoQuantidadeNaGrid then
    begin
       estoqueNecessario:= vqtd;
       estoqueDisponivel:= estoqueFisico - (vQtd - quantidade);
    end
    else
    begin
      estoqueNecessario:= quantidade + vqtd;
      estoqueDisponivel:= estoqueFisico - vQtd;
    end;
    produto:= TNEGProduto.buscarProduto(cdproduto);
    //claudio, quanddo for orçamento não importa o estoque
    if (RgOpcoes.ItemIndex <> 2) and (vOrcamento<>'O')
        and (((estoqueFisico < estoqueNecessario) and (produto.tipoComposicao <> composto))or
                  ((produto.tipoComposicao = composto)and(TNEGProduto.getEstoquePossivelProdutoComposto(cdproduto) < estoqueNecessario))) then
    begin
      resultado:= False;
      Application.OnMessage := NaoProcessaMsg;
      if produto.tipoComposicao <> composto then
        MessageDlg('Quantidade disponível no estoque --> ' + FormatFloat('0.00', estoqueDisponivel) + ' ', mtWarning,[mbOk],0)
      else
        MessageDlg('Quantidade disponível no estoque --> ' + FormatFloat('0.00', TNEGProduto.getEstoquePossivelProdutoComposto(cdproduto)-vQtd) + ' ', mtWarning,[mbOk],0);
      EdtConsulta.SetFocus;
      EdtConsulta.Clear;
      if (UPPERCASE(vEmpresa) <> 'DELUC') then
          EdtQtd.Text:= '0,000';
      EdtDescUnit.Text:= '0,00';
      setLabel23(0);
      CbLote.ItemIndex := -1;
      Application.OnMessage := ProcessaMsg;
     // exit;
    end
    else
      resultado:= True;
  end;
  result:= resultado;
end;

//Procedure TFrmPrincipalPreVenda.EnviaProdutos(quantidade:real; lote:string = '');
//var
//  L,T,qtd : integer;
//  QtdLote : real;
//begin
//  if StrToFloat(edtQtdItens.text) >= 135 then begin
//    Application.OnMessage := NaoProcessaMsg;
//    MessageDlg('Esta pré-venda alcançou o limite máximo de 135 itens!',mtWarning,[mbOk],0);
//    Application.OnMessage := ProcessaMsg;
//    EdtConsulta.SetFocus;
//    Exit;
//  end;
//  if StrToFloat(quantidade) <= 0 then begin
//    EdtConsulta.SetFocus;
//    Exit;
//  end;
//  if ADOSPConsulta.FieldByName('dsAtivo').AsString <> 'S' then begin
//    Application.OnMessage := NaoProcessaMsg;
//    MessageDlg('Este produto está definido no cadastro como inativo!',mtWarning,[mbOk],0);
//    EdtConsulta.SetFocus;
//    EdtConsulta.Clear;
//    EdtQtd.Text           := '0,000';
//    EdtDescUnit.Text      := '0,00';
//    setLabel23(0);
//    CbLote.ItemIndex := -1;
//    Application.OnMessage := ProcessaMsg;
//    exit;
//  end;
//  if (UpperCase(vEmpresa) = 'GAMA') then begin
//    FrmDescricao := TFrmDescricao.create(FrmDescricao);
//    FrmDescricao.EdtDescricao.Text := ADOSPConsulta.FieldByName('DESCRIÇÃO').AsString;
//    FrmDescricao.EdtUndCad.Text := ADOSPConsulta.FieldByName('UNIDADE').AsString;
//    FrmDescricao.EdtUnidade.Text := ADOSPConsulta.FieldByName('UNIDADE').AsString;
//    FrmDescricao.EdtQtd.Text := FormatFloat('0.00000', StrToFloatDef(EdtQtd.Text,0));
//    FrmDescricao.EdtQtdSai.Text := FormatFloat('0.00000', StrToFloatDef(EdtQtd.Text,0));
//    FrmDescricao.EdtFator.Text := '1,00000';
//    FrmDescricao.ShowModal;
//    freeandNil(FrmDescricao);
//    if vDescricaoGama = '' then
//       Exit;
//  end;
////  if (vAutoPecas = 'H') and (RgOpcoes.ItemIndex <> 2) then begin
////    if (CbLote.Items.Count>0) and (CbLote.ItemIndex=-1) then
////    begin
////       Application.OnMessage := FormPrincipal.NaoProcessaMsg;
////       ShowMessage('Por favor, selecione o lote do produto.');
////       CbLote.SetFocus;
////       Application.OnMessage := ProcessaMsg;
////       exit;
////    end
////    else
////      lote:= copy_campo(cblote.Text,'|',1);
////  end;
//  // ESSA VALIDAÇÃO AGORA SERÁ FEITA NA HORA DE CONFIRMAR
//    // VERIFICA QUANTIDADE DO PRODUTO NO LOTE
////  if (Trim(lote)<>'') and (RgOpcoes.ItemIndex <> 2) then begin
////    QtdLote:= QuantidadeDispNoLote(lote, ADOSPConsulta.FieldByName('Código').AsInteger);
////    if quantidade > QtdLote then
////    begin
////      Application.OnMessage := FormPrincipal.NaoProcessaMsg;
////      MessageDlg('Quantidade disponível no lote --> ' + formatFloat('0.000',QtdLote) + ' ',mtWarning,[mbOk],0)
////      EdtConsulta.SetFocus;
////      EdtConsulta.Clear;
////      EdtQtd.Text           := '0,000';
////      EdtDescUnit.Text      := '0,00';
////      setLabel23(0);
////      CbLote.ItemIndex := -1;
////      Application.OnMessage := ProcessaMsg;
////      exit;
////    end;
////  end;
//  { TODO -oclaudioo -c : VALIDAR AS QTDS DISPONIVEIS NOS LOTES NA CONFIRMAÇÃO DA PREVENDA 07/05/2013 11:22:38 }
//  if ADOSPConsulta.FieldByName('Preco').AsFloat > ADOSPConsulta.FieldByName('Valor').AsFloat then
//     vProdutoPromocao := 'S';
//  if (vAutoPecas <> 'H') then // "hospitalar" permite lançar o produto mais de uma vez, por causa dos lotes
//      for L := 1 to SgDados.RowCount - 1 do begin
//        if (SgDados.Cells[0,l] = ADOSPConsulta.FieldByName('Código').AsString)
//            and (UpperCase(vEmpresa) <> 'DISCABOS')
//            and (UpperCase(vEmpresa) <> 'FRANGOPRENSADO')
//            and (not item_cancelado(L))
//        then
//        begin
//          Application.OnMessage := NaoProcessaMsg;
//          MessageDlg('Esse produto já está incluso nessa pré-venda!',mtWarning,[mbOk],0);
//          EdtQtd.Text      := '0,00';
//          EdtDescUnit.Text := '0,00';
//          setLabel23(0);
//          CbLote.ItemIndex := -1;
//          EdtConsulta.SetFocus;
//          Application.OnMessage := ProcessaMsg;
//          Exit;
//        end;
//      end;
//  if (StrToFloat(EdtPreco.Text) <= 0) then begin
//    EdtConsulta.SetFocus;
//    EdtConsulta.Clear;
//    EdtQtd.Text      := '0,000';
//    EdtDescUnit.Text := '0,00';
//    setLabel23(0);
//    CbLote.ItemIndex := -1;
//    exit;
//  end;
//  if (Trim(EdtDescUnit.Text) <> '') and (StrToFloat(EdtdescUnit.Text) > 0 ) then
//  begin
//    //and (UPPERCASE(vEmpresa) <> 'LLPARAFUSOS') then
//    BtnAprazo.Enabled := False;
//    edtdesconto.Text := '0,00000';
//    edtdesconto.ReadOnly := True;
//  end;
//  qtd := Trunc(StrToFloat(EdtQtd.Text));
//  if qtd = 0 then
//     qtd := 1;
//  for t:=1 to qtd do begin //ESSE LACO DE REPETICAO É UTILIZADO SOMENTE PELA KARIB
//    With SgDados do begin
//      if RowCount >= 2 then
//        RowCount := RowCount + 1;
//      Row := 1;
//      For L:= Row to RowCount -1 do begin
//        if Cells[0,L] = '' then begin
//          Row := L;
//          Break;
//        end;
//      end;
//      Cells[0,Row] := ADOSPConsulta.FieldByName('Código').AsString;     // codigo
//      if (UpperCase(vEmpresa) = 'GAMA') then
//        Cells[1,Row] := vDescricaoGama
//      else
//        Cells[1,Row] := ADOSPConsulta.FieldByName('Descrição').AsString;    // descrição
//      if (UpperCase(vEmpresa) = 'GAMA') then
//        Cells[10,Row] := vUndGama
//      else
//        Cells[10,Row] := ADOSPConsulta.FieldByName('UNIDADE').AsString;    // unidade
//      if (UpperCase(vEmpresa) = 'GAMA') then
//         Cells[12,Row] := floatToStr(vFatorGama);
//      if vAutoPecas = 'H' then
//         Cells[13,Row] := lote;
//      case vCasasQtd of   // preco de venda
//        0: Cells[2,Row] := FormatFloat('0',quantidade);
//        1: Cells[2,Row] := FormatFloat('0.0',quantidade);         // quantidadeCells[3,Row] := FormatFloat('0.0',StrToFloat(EdtPreco.Text));
//        2: Cells[2,Row] := FormatFloat('0.00',quantidade);
//        3: Cells[2,Row] := FormatFloat('0.000',quantidade);
//        4: Cells[2,Row] := FormatFloat('0.0000',quantidade);
//        5: Cells[2,Row] := FormatFloat('0.00000',quantidade);
//      end; // case
//      case vCasasPreco of   // preco de venda
//        1: Cells[3,Row] := FormatFloat('0.0',StrToFloat(EdtPreco.Text));
//        2: Cells[3,Row] := FormatFloat('0.00',StrToFloat(EdtPreco.Text));
//        3: Cells[3,Row] := FormatFloat('0.000',StrToFloat(EdtPreco.Text));
//        4: Cells[3,Row] := FormatFloat('0.0000',StrToFloat(EdtPreco.Text));
//        5: Cells[3,Row] := FormatFloat('0.00000',StrToFloat(EdtPreco.Text));
//      end; // case
//  //    Cells[3,Row] := FormatFloat('0.00',StrToFloat(EdtPreco.Text));        // preco de venda
//      case vCasasPreco of   // preco de venda
//        1: Cells[4,Row] := FormatFloat('0.0',StrToFloat(Cells[2,Row])  // total
//           * StrToFloat(Cells[3,Row]));
//        2: Cells[4,Row] := FormatFloat('0.00',StrToFloat(Cells[2,Row])  // total
//           * StrToFloat(Cells[3,Row]));
//        3: Cells[4,Row] := FormatFloat('0.000',StrToFloat(Cells[2,Row])  // total
//           * StrToFloat(Cells[3,Row]));
//        4: Cells[4,Row] := FormatFloat('0.0000',StrToFloat(Cells[2,Row])  // total
//           * StrToFloat(Cells[3,Row]));
//        5: Cells[4,Row] := FormatFloat('0.00000',StrToFloat(Cells[2,Row])  // total
//           * StrToFloat(Cells[3,Row]));
//      end; // case
//      Cells[5,Row]  := ADOSPConsulta.FieldByName('Prateleira').AsString;
//      Cells[6,Row]  := ADOSPConsulta.FieldByName('CÓDIGO_BARRAS').AsString;
//      Cells[7,Row]  := ADOSPConsulta.FieldByName('Referência').AsString;
//      Cells[8,Row]  := ADOSPConsulta.FieldByName('Estoque').AsString;
//      if vSelecionaCFOP = 'S' then
//        Cells[11,Row]  := EdtCFOP.Text;   // cfop por item thiago
//      case vCasasPreco of
//        1 : begin
//              if StrToFloat(FormatFloat('0.0',StrtoFloat(EdtPreco.Text))) > StrToFloat(FormatFloat('0.0',ADOSPConsulta.FieldByName('valor').AsFloat)) then
//                Cells[9,Row]:= FormatFloat('0.0',StrtoFloat(EdtPreco.Text))
//              //else if vTipoDescontoNF <> '1' then
//              //  Cells[9,Row]  := FormatFloat('0.0',StrtoFloat(EdtPreco.Text))
//              else
//                Cells[9,Row]  := FormatFloat('0.0',ADOSPConsulta.FieldByName('valor').AsFloat);
//            end;
//        2 : begin
//              if StrToFloat(FormatFloat('0.00',StrtoFloat(EdtPreco.Text))) > StrToFloat(FormatFloat('0.00',ADOSPConsulta.FieldByName('valor').AsFloat)) then
//                Cells[9,Row]:= FormatFloat('0.00',StrtoFloat(EdtPreco.Text))
//              //else if vTipoDescontoNF <> '1' then
//              //   Cells[9,Row]  := FormatFloat('0.00',StrtoFloat(EdtPreco.Text))
//              else
//                Cells[9,Row]  := FormatFloat('0.00',ADOSPConsulta.FieldByName('valor').AsFloat);
//            end;
//        3 : begin
//              if StrToFloat(FormatFloat('0.000',StrtoFloat(EdtPreco.Text))) > StrToFloat(FormatFloat('0.000',ADOSPConsulta.FieldByName('valor').AsFloat)) then
//                Cells[9,Row]:= FormatFloat('0.000',StrtoFloat(EdtPreco.Text))
//              //else if vTipoDescontoNF <> '1' then
//              //  Cells[9,Row]  := FormatFloat('0.000',StrtoFloat(EdtPreco.Text))
//              else
//                Cells[9,Row]  := FormatFloat('0.000',ADOSPConsulta.FieldByName('valor').AsFloat);
//            end;
//        4 : begin
//              if StrToFloat(FormatFloat('0.0000',StrtoFloat(EdtPreco.Text))) > StrToFloat(FormatFloat('0.0000',ADOSPConsulta.FieldByName('valor').AsFloat)) then
//                Cells[9,Row]:= FormatFloat('0.0000',StrtoFloat(EdtPreco.Text))
//              //else if vTipoDescontoNF <> '1' then
//              //  Cells[9,Row]  := FormatFloat('0.0000',StrtoFloat(EdtPreco.Text))
//              else
//                Cells[9,Row]  := FormatFloat('0.0000',ADOSPConsulta.FieldByName('valor').AsFloat);
//            end;
//        5 : begin
//              if StrToFloat(FormatFloat('0.00000',StrtoFloat(EdtPreco.Text))) > StrToFloat(FormatFloat('0.0000',ADOSPConsulta.FieldByName('valor').AsFloat)) then
//                Cells[9,Row]:= FormatFloat('0.00000',StrtoFloat(EdtPreco.Text))
//              //else if vTipoDescontoNF <> '1' then
//              //  Cells[9,Row]  := FormatFloat('0.00000',StrtoFloat(EdtPreco.Text))
//              else
//                Cells[9,Row]  := FormatFloat('0.00000',ADOSPConsulta.FieldByName('valor').AsFloat);
//            end;
//      end; // case
//      EdtTotal.Text := FormatFloat('0.00',StrtoFloat(EdtTotal.Text) +
//      StrToFloat(Cells[4,Row]));
//      SgDados.Refresh;
//      EdtSubTotal.Text := EdtTotal.Text;
//    end;
//    if (UpperCase(vFlagEtiqueta) <> 'KARIB') then begin
//      EdtConsulta.SetFocus;
//      atualizaEditQtdItens;
//      EdtQtd.Text      := '0,000';
//      EdtPreco.Text    := '0,000';
//      EdtDescUnit.Text := '0,00';
//      setLabel23(0);
//      CbLote.ItemIndex := -1;
//      vDescricaoGama := '';
//      vUndGama := '';
//      vFatorGama := 0;
//      AtualizaQryConsulta;
//      Exit;  // EVITA REPETIR O ITENS NA GRID SE NAO FOR KARIB
//    end;
//  end;
//  atualizaEditQtdItens;
//  EdtQtd.Text      := '0,000';
//  EdtPreco.Text    := '0,000';
//  EdtDescUnit.Text := '0,00';
//  setLabel23(0);
//  CbLote.ItemIndex := -1;
////  EdtConsulta.Clear;
//  EdtConsulta.SetFocus;
//  vDescricaoGama := '';
//  vUndGama := '';
//  vFatorGama := 0;
//end;

procedure TFrmPrincipalPreVenda.DesativarCamposDescontoTotal;
begin
  EdtDesconto.ReadOnly := True;
  EdtSubTotal.ReadOnly := True;
end;

procedure TFrmPrincipalPreVenda.EdtDescontoExit(Sender: TObject);
var
  possuiPermissaoVenderAbaixoDoCusto:Boolean;
  i: integer;
  vlBruto,vlLiquido,descReal,temp, vlSubTotal: Currency;
begin
  if prevenda = nil then Exit;
  // Se saiu do campo edtDesconto para um campo diferente de edtSubTotal, desativa o desconto
  if ((EdtDesconto.ReadOnly) and (EdtSubTotal.Focused)) or not(EdtSubTotal.Focused) then
     DesativarCamposDescontoTotal;
  if vCasasPreco > vLimiteCasasPreco then //Se a quantidade de casas do preço for maior que dois,
    EdtDesconto.Text := FormatFloat('0.00000',StrToFloatDef(EdtDesconto.Text,0))  //o Edtdesconto fica com a formatação antiga.
  else //senão fica com duas casas decimais
    EdtDesconto.Text := FormatFloat('0.00',StrToFloatDef(EdtDesconto.Text,0));
  if (StrToFloatDef(EdtDesconto.Text,0) > 0) and (vAtacadoVarejo = 'A') then //(UpperCase(vEmpresa) = 'CAMARATUBA')OR
  begin
    if vBloquearDescontoAtacado = true then
    begin
      Application.OnMessage:= NaoProcessaMsg;
      MessageDlg('Desconto para clientes atacado está bloqueado.',mtWarning,[mbOK],0);
      EdtDesconto.Text := '0,00';
      EdtDesconto.SelectAll;
      EdtDesconto.SetFocus;
      Application.OnMessage :=  FrmPrincipalPreVenda.ProcessaMsg;
      exit;
    end
  end;
  if (StrToFloatDef(EdtDesconto.Text,0) > 0) and ((UpperCase(vEmpresa) = 'CARDOSOACESSORIOS')) then // (UpperCase(vEmpresa) = 'CAMARATUBA')or
  begin
    if TNEGCliente.isCliente_Crediario(EdtCdCliente.Text) then
    begin
      Application.OnMessage:= NaoProcessaMsg;
      MessageDlg('Desconto já é automático para clientes de crediário.',mtWarning,[mbOK],0);
      EdtDesconto.Text := '0,00';
      EdtDesconto.SelectAll;
      EdtDesconto.SetFocus;
      Application.OnMessage :=  FrmPrincipalPreVenda.ProcessaMsg;
      exit;
    end
  end;
  if (StrToFloatDef(EdtDesconto.Text,0) > 0) and (vDescontoClienteAuto = True) and (TNEGCliente.getPercentualDoPrecoComDescontoDecimal(StrtoIntDef(EdtCdCliente.Text,0)) < 1) then // (UpperCase(vEmpresa) = 'CAMARATUBA')or
  begin
    Application.OnMessage:= NaoProcessaMsg;
    MessageDlg('Desconto já é automático para este cliente.',mtWarning,[mbOK],0);
    EdtDesconto.Text := '0,00';
    EdtDesconto.SelectAll;
    EdtDesconto.SetFocus;
    Application.OnMessage :=  FrmPrincipalPreVenda.ProcessaMsg;
    exit;
  end;
  if ExisteDescontoFornecedorInvalido then
  begin
    prevenda.descontoPercentual:= 0;
    EdtDesconto.Text := '0,00';
    EdtDesconto.SelectAll;
    EdtDesconto.SetFocus;
    exit;
  end;

  if UPPERCASE(vEmpresa) = 'PROAUTO' then
  begin
    if ((StrToFloat(EdtDesconto.Text) > vlDescontoVendedor) and (vDescontoCliente = 0))
       OR ((StrToFloat(EdtDesconto.Text) > 0) and (bloquearDescontoAtacado) and (vAtacadoVarejo = 'A')) then
    begin
      vFlag := '6';
      LiberaVanda;
    end;
  end else if StrToFloat(FormatFloat('0.0000000',prevenda.descontoPercentual)) < StrToFloat(FormatFloat('0.0000000',StrToFloat(EdtDesconto.Text))) then
  begin
    if ((TNEGCliente.getDescontoPercentual(StrToIntDef(EdtCdCliente.Text,-1))>0)AND(TNEGLoja.getConfiguracaoDescontoAutomaticoPorCliente)AND(StrToFloat(EdtDesconto.Text)>0)AND(Permissao('615','V') = 'N'))
       OR ((StrToFloatDef(EdtDesconto.Text,0) > vPorcDesconto) and (Permissao('615','V') = 'N'))
       OR ((StrToFloat(EdtDesconto.Text) > 0) and (bloquearDescontoAtacado) and (vAtacadoVarejo = 'A'))
       OR (((StrToFloat(EdtDesconto.Text)) > 0) and (Permissao('613','V') = 'N')) then // usuário não tem permissão para dar desconto até o limite
    begin
      // valor total abaixo da soma do custo final
      if (StrToFloat(EdtDesconto.Text) > 0)
          AND (StrToFloat(EdtSubTotal.Text) < getSomaCustoFinal) AND TNEGLoja.getBloquearVendaAbaixoDoCustoFinal
          AND (Permissao('631','V') = 'N') then
      begin
        if FrmCancelamentoVenda.Possui_Permissao('631','V',cbxUsuario.Text,EdtUsuario.Text) then
        begin
          possuiPermissaoVenderAbaixoDoCusto := true;
          Application.MessageBox(PChar('Vendendo abaixo do custo final'), 'Atenção', MB_OK + MB_ICONINFORMATION + MB_APPLMODAL);
        end else
        begin
          FrmCancelamentoVenda:= TFrmCancelamentoVenda.Create(Self, '631', 'V', possuiPermissaoVenderAbaixoDoCusto);
          FrmCancelamentoVenda.Copyright.Caption :=  '<<<<   Venda abaixo do custo final    >>>>';
          FrmCancelamentoVenda.showmodal;
        end;
        if (not possuiPermissaoVenderAbaixoDoCusto) then
        begin
          prevenda.descontoPercentual:= 0;
          EdtDesconto.Text := '0,000';
          //EdtSubTotal.Text := EdtTotal.Text;
        end;
        Application.OnMessage := FormPrincipal.ProcessaMsg;
      end else
      begin
        if TestaFinanceiroNaConfirmacao = false then begin
          vFlag:= '6';
          LiberaVanda;
        end;
        EdtDesconto.SetFocus;
        Application.OnMessage := FormPrincipal.ProcessaMsg;
      end
    end else if (StrToFloat(EdtDesconto.Text) > 0)
        AND (StrToFloat(EdtSubTotal.Text) < getSomaCustoFinal)
        AND TNEGLoja.getBloquearVendaAbaixoDoCustoFinal
        AND (Permissao('631','V') = 'N') then
    begin
      if FrmCancelamentoVenda.Possui_Permissao('631','V',cbxUsuario.Text,EdtUsuario.Text) then
      begin
        possuiPermissaoVenderAbaixoDoCusto := true;
        Application.MessageBox(PChar('Vendendo abaixo do custo final'), 'Atenção', MB_OK + MB_ICONINFORMATION + MB_APPLMODAL);
      end else
      begin
        FrmCancelamentoVenda:= TFrmCancelamentoVenda.Create(Self, '631', 'V', possuiPermissaoVenderAbaixoDoCusto);
        FrmCancelamentoVenda.Copyright.Caption :=  '<<<<   Venda abaixo do custo final    >>>>';
        FrmCancelamentoVenda.showmodal;
      end;
      if (not possuiPermissaoVenderAbaixoDoCusto) then
      begin
        prevenda.descontoPercentual:= 0;
        EdtDesconto.Text := '0,000';
        //EdtSubTotal.Text := EdtTotal.Text;
      end;
      Application.OnMessage := FormPrincipal.ProcessaMsg;
    end
  end;

  //só é permitido aplicar desconto nos itens que não estão em promoção
  vlBruto:= 0;
  vlLiquido := 0;
  prevenda.descontoPercentual := StrToFloat(EdtDesconto.Text);
  for I := 0 to prevenda.itens.Count - 1 do
  begin
  if i = 27 then
   Sleep(1);

    if (prevenda.itens[i].Promocao_desconto_Item = false) or (((UpperCase(vEmpresa) = 'BG')or(UpperCase(vEmpresa) = 'MOTOPECAS'))and(prevenda.descontoPercentual > 0)) then //and (prevenda.descontoPercentual <> 0) then
    begin
       //and (prevenda.itens[i].precoVenda = prevenda.itens[i].precoBruto) then begin
      if SgDados.Cells[0,i+1] <> '' then begin
        //aplico o desconto em cada item
        if prevenda.descontoPercentual <> 0 then begin
//          vlSubTotal := prevenda.itens[i].quantidade * prevenda.itens[i].precoBruto;
//          vlSubTotal := SimpleRoundTo(vlSubTotal,-2);
          prevenda.itens[i].precoVenda := prevenda.itens[i].precoBruto * (1-(prevenda.descontoPercentual/100));
//          prevenda.itens[i].precoVenda :=
//               ((vlSubTotal)
//                    -
//                     (vlSubTotal * (prevenda.descontoPercentual/100)))
//                           / prevenda.itens[i].quantidade;
          prevenda.itens[i].precoVenda := SimpleRoundTo(prevenda.itens[i].precoVenda,vCasasPreco*-1);
        end
        else
          prevenda.itens[i].precoVenda := (prevenda.itens[i].precoBruto);
        //prevenda.itens[i].precoVenda := prevenda.itens[i].precoBruto - ((prevenda.itens[i].precoBruto * prevenda.descontoPercentual) / 100);
//        prevenda.itens[i].precoVenda := prevenda.itens[i].precoBruto - (prevenda.itens[i].precoBruto * (prevenda.descontoPercentual / 100));
      end;
    end;
    prevenda.itens[i].SubTotal := prevenda.itens[i].quantidade * prevenda.itens[i].precoVenda;
    SgDados.Cells[3,i+1]:= FormatFloatQ(vCasasPreco,SimpleRoundTo(prevenda.itens[i].precoVenda,vCasasPreco*-1));
//    prevenda.itens[i].precoVenda := StrToFloat(SgDados.Cells[3,i+1]);
    SgDados.Cells[4,i+1]:= FormatFloatQ(2,SimpleRoundTo(prevenda.itens[i].precoVenda * prevenda.itens[i].quantidade,-2)); // total
    vlBruto   := vlBruto + SimpleRoundTo((prevenda.itens[i].quantidade * prevenda.itens[i].precoBruto),-2);
//    if prevenda.descontoPercentual <> 0 then
//      vlLiquido := vlLiquido + (prevenda.itens[i].quantidade * prevenda.itens[i].precoVenda)
//    else
      temp := ((prevenda.itens[i].quantidade * prevenda.itens[i].precoVenda));
      temp := SimpleRoundTo(temp,-2);
      vlLiquido := vlLiquido + temp;
  end;
  GetValorIPILiquido;
  descReal := (vlBruto * StrToFloat(EdtDesconto.Text)) / 100;
  prevenda.descontoPercentual := StrToFloat(EdtDesconto.Text);
  EdtTotal.Text := FormatFloatQ(2,SimpleRoundTo(vlBruto,-2));
  vlTotalAnterior := SimpleRoundTo(StrToFloatDef(EdtSubTotal.text,0),-2);
  EdtSubTotal.Text := FormatFloatQ(2,(vlLiquido));
end;

function TFrmPrincipalPreVenda.getHoraServidor: string;
begin
  with ADOQryProcura1 do begin
    Sql.Text := 'Select CONVERT(CHAR(10),GETDATE(),8) as data';
    Open;
    Result := FieldByName('data').AsString; // Pega a hora do banco de dados (servidor).
    close;
  end;
end;

function TFrmPrincipalPreVenda.getMensagemRestricao(
  restricao: TListaRestricao): string;
var
  msg : string;
begin
  if ATRASO in restricao  then
    msg := 'ATRASO';
  if CHEQUE in restricao then
    msg := msg + ',CHEQUE';
  if LIMITE in restricao then
    msg := msg + ',LIMITE';
  Result := msg;
end;

function TFrmPrincipalPreVenda.getSomaCustoFinal:Currency;
var
  i: integer;
  soma: Currency;
  produto: TDOMProduto;
  quantidade: Real;
begin
  soma:= 0;
  for i := 1 to (sgDados.RowCount-1) do
  begin
    if (SgDados.Cells[0, i]) <> '' then
    begin
      produto:= TNEGProduto.buscarProduto(strToInt(SgDados.Cells[0, i]));
      quantidade:= StrToFloat(sgDados.Cells[2,i]);
      if vAtacadoVarejo = 'A' then
        soma:= soma + (produto.nrCustoFinal_a * quantidade)
      else
        soma:= soma + (produto.nrCustoFinal_v * quantidade);
      produto.destruir;
    end
    else
      break;
  end;
  result:= soma;
end;


procedure TFrmPrincipalPreVenda.BtnCancelarClick(Sender: TObject);
var
  query:TADOQuery;
begin
  if MessageDlg('Cancelar esta pré-venda?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
  begin
    //Limpar_Tela;
    Cancelar;
    if vAutoLogoff then
      Solicitar_Login;
  end else
  begin
    EdtConsulta.SelectAll;
    EdtConsulta.SetFocus;
  end;
  query:= TADOQUery.Create(self);
  query.Connection:= DModulo.Conexao;
  With query do  // Pegar a obs da pré-venda
  begin
    Sql.Text := 'Select campo_20 From Configuracao WITH (NOLOCK)';
    Open;
    LblMensagem.caption := FieldByName('Campo_20').AsString;
    if Length(SubstituiTexto(LblMensagem.Caption,' ')) = 0 then
      LblMensagem.Caption := 'Digite uma mensagem para os vendedores no SAEF. Menu UTILITARIOS>GERENCIAIS>CONFIGURAÇÃO DO SISTEMA';
    Close;
  end;
  FreeAndNil(query);
  RodaScripts1;
//  SgDados.RowCount:=2;
  atualizaEditQtdItens;
end;

procedure TFrmPrincipalPreVenda.AuxiliarLancto(i: Integer);
begin
  SgDados.Cells[0,i] := ADOQryProcura.FieldByName('cdProduto').AsString;
  if (UpperCase(vEmpresa) = 'PTINTAS') then
    SgDados.Cells[1,i] := ADOQryProcura.FieldByName('dsServico').AsString
  else if (UpperCase(vEmpresa) = 'GAMA') or (UpperCase(vEmpresa) = 'JETLASER') then
  begin
    SgDados.Cells[1,i] := ADOQryProcura.FieldByName('dsServico').AsString;
    SgDados.Cells[10,i] := ADOQryProcura.FieldByName('dsMetragem').AsString;
    SgDados.Cells[12,i] := FormatFloat('0.00000', ADOQryProcura.FieldByName('nrFatorConversao').AsFloat);
  end else
    SgDados.Cells[1,i] := ADOQryProduto.FieldByName('nmProduto').AsString;
  SgDados.Cells[2,i] := FormatFloatQ(vCasasQtd, ADOQryProcura.FieldByName('nrQtd').AsFloat);
  SgDados.Cells[3,i] := FormatFloatQ(vCasasPreco, ADOQryProcura.FieldByName('vlPreco').AsFloat);
  SgDados.Cells[4,i] := FormatFloatQ(vCasasPreco, (ADOQryProcura.FieldByName('nrQtd').AsFloat * ADOQryProcura.FieldByName('vlPreco').AsFloat));
  SgDados.Cells[6,i] := ADOQryProduto.FieldByName('cdFabricante').AsString;
  SgDados.Cells[7,i] := ADOQryProduto.FieldByName('dsReferencia').AsString;
  SgDados.Cells[8,i] := ADOQryProduto.FieldByName('nrQtdReal').AsString;
  SgDados.Cells[9,i] := FormatFloatQ(vCasasPreco, ADOQryProcura.FieldByName('vlDesconto').AsFloat);
  EdtTotal.Text := FormatFloat('0.00',StrToFloat(EdtTotal.Text) + (StrToFloat(SgDados.Cells[9,i]) * StrToFloat(SgDados.Cells[2,i])));
//  if (ADOQryProcura.FieldByName('vlDesconto').AsFloat <> ADOQryProcura.FieldByName('vlPreco').AsFloat) then
//  begin
//    //and (UPPERCASE(vEmpresa) <> 'LLPARAFUSOS') then
//    BtnAprazo.Enabled := False;
//    edtdesconto.Text := '0,00000';
//    edtdesconto.ReadOnly := True;
//  end;

  edtValorBruto.Text := FormatFloat('0.00',StrToFloat(edtValorBruto.Text) + (StrToFloat(SgDados.Cells[9,i])*StrToFloat(SgDados.Cells[2,i])));
  if usarLoteValidade = True then
  begin
     SgDados.Cells[13,i] := ADOQryProcura.FieldByName('nrLote').AsString;
     if (Trim(SgDados.Cells[13,i]) <> '') and  (ADOQryProcura.FieldByName('cdfabricanteLote').AsString = '') then
       SgDados.Cells[16,i] := IntToStr(getFabricanteLote(DModulo.Conexao.ConnectionString, strToInt(SgDados.Cells[0,i]), SgDados.Cells[13,i]))
     else
       SgDados.Cells[16,i] := ADOQryProcura.FieldByName('cdfabricanteLote').AsString;
  end;
  SgDados.Cells[11,i] := ADOQryProcura.FieldByName('dsCfop').AsString;
  if (UpperCase(vEmpresa) = 'AMBIENTE') then begin
    SgDados.Cells[14,i] := ADOQryProcura.FieldByName('cdAmbiente').AsString;
    SgDados.Cells[15,i] := ADOQryProcura.FieldByName('dsAmbiente').AsString;
  end;
  // INDICO NO ARRAY SE ESSA LINHA FICARÁ DESTACADA OU NÃO
  if (vDestacarItensOcupados) and ((RgOpcoes.ItemIndex = 0)or((transformarOrcamentoPrevenda = true) and (RgOpcoes.ItemIndex = 1))) then
    if (vEstqNegativo <> 'S') and (qtdInsuficienteParaPrevend(StrToInt(SgDados.Cells[0,i]), strToFloatDef(SgDados.Cells[2,i],0)) > 0) then
      ArraylinhasDestacadas[i]:= True
    else
      ArraylinhasDestacadas[i]:= False;
end;

procedure TFrmPrincipalPreVenda.RemontaSgDados(i: Integer);
begin
  SgDados.Cells[0,i] := ADOQryProcura.FieldByName('cdProduto').AsString;
  if (UpperCase(vEmpresa) = 'PTINTAS') then
    sgDados.Cells[1,i] := ADOQryProcura.FieldByName('dsServico').AsString
  else if (UpperCase(vEmpresa) = 'GAMA') or (UpperCase(vEmpresa) = 'JETLASER') then
  begin
    SgDados.Cells[1,i] := ADOQryProcura.FieldByName('dsServico').AsString;
    SgDados.Cells[10,i] := ADOQryProcura.FieldByName('dsMetragem').AsString;
    SgDados.Cells[12,i] := FormatFloat('0.00000', ADOQryProcura.FieldByName('nrFatorConversao').AsFloat);
  end else
    SgDados.Cells[1,i] := ADOQryProduto.FieldByName('nmProduto').AsString;
  SgDados.Cells[2,i] := formatFloatQ(vCasasQtd, (ADOQryProduto.FieldByName('nrqtdreal').AsFloat));
  SgDados.Cells[3,i] := FormatFloatQ(vCasasPreco, ADOQryProcura.FieldByName('vlPreco').AsFloat);
  SgDados.Cells[4,i] := FormatFloatQ(vCasasPreco, (ADOQryProduto.FieldByName('nrqtdreal').AsFloat * ADOQryProcura.FieldByName('vlPreco').AsFloat));
  EdtTotal.Text := FormatFloat('0.00',StrToFloat(EdtTotal.Text) + (StrToFloat(SgDados.Cells[9,i]) * StrToFloat(SgDados.Cells[2,i])));
  SgDados.Cells[6,i] := ADOQryProduto.FieldByName('cdFabricante').AsString;
  SgDados.Cells[7,i] := ADOQryProduto.FieldByName('dsReferencia').AsString;
  SgDados.Cells[8,i] := ADOQryProduto.FieldByName('nrQtdReal').AsString;
  SgDados.Cells[9,i] := FormatFloatQ(vCasasPreco, ADOQryProcura.FieldByName('vlDesconto').AsFloat);
  edtValorBruto.Text := FormatFloat('0.00',StrToFloat(edtValorBruto.Text) + (StrToFloat(SgDados.Cells[9,i])*StrToFloat(SgDados.Cells[2,i])));
end;

function TFrmPrincipalPreVenda.requisitosAtendidos: Boolean;
var
  resultado : boolean;
begin
  resultado := True;
  if prevenda = nil then begin
    MessageDlg('Selecione um ou mais itens antes de confirmar a prevenda.',mtWarning,[mbOK],0);
    resultado := False;
  end;
  if resultado then
    if ExisteDescontoFornecedorInvalido then
      resultado := False;
  if resultado then
    if not QuantidadePositiva then
      resultado := False;
  if resultado then
    if Vender_Proibida_Fracionado then
      resultado := False;
  if resultado then
    if not PossuiEstoque then
      resultado := False;
  if resultado then
    if ProdutoJaReservado then
      resultado := False;
  if resultado then
    if not ClienteValido then
      resultado := False;
  if resultado then
    if not VendedorValido then
      resultado := False;
  if resultado then
    if not LoginValido then
      resultado := False;
  if resultado then
    if not CamposObrigatoriosPreenchidos(FrmPrincipalPreVenda) then
    begin
      BtnConfirmar.Enabled := True;
      Alteraquantidade1.Enabled := true;
      resultado := False;
    end;
  if resultado then
    if not ExisteItemPrevenda then
      resultado := False;
  if resultado then
    if not ValidarNumeroLancamento_LIBEL then
      resultado := False;
  Result := resultado;
end;

procedure TFrmPrincipalPreVenda.atualizaGridDados;
var i: integer;
begin
  if(vEstqNegativo <> 'S') then begin
    LimpaGrid2(SgDados, ADOQryProcura.RecordCount);
    tiraLinhasVazias(SgDados);
    //open;
    ADOQryProcura.first;
    for i := 1 to ADOQryProcura.RecordCount do begin
      ADOQryProduto.Locate('cdproduto',ADOQryProcura.FieldByName('cdProduto').AsFloat,[]);
//      if (ADOQryProcura.FieldByName('nrQtd').AsFloat > ADOQryProduto.FieldByName('nrqtdreal').AsFloat) and (vEstqNegativo <> 'S') and (vOrcamento<>'O') then begin
      if (ADOQryProduto.FieldByName('nrqtdreal').AsFloat <= 0) and (vEstqNegativo <> 'S') and (vOrcamento<>'O') then begin
        Application.OnMessage := FrmPrincipalPreVenda.NaoProcessaMsg;
        if (vOrcamento = 'N') and (FrmPrincipalPreVenda.RgOpcoes.ItemIndex = 1) then begin
          Messagedlg('O Produto de código '+ ADOQryProduto.FieldByName('cdProduto').AsString+' está com a quantidade '+ FormatFloat('0.00',ADOQryProduto.FieldByName('nrqtdreal').AsFloat) +
                     ' disponível em estoque.' + #13 + #13 +
                     'Portanto, será excluído deste orçamento!',mtWarning, [mbOk], 0);
          edtQtdItens.Text := FormatFloat('0',StrToFloat(edtQtdItens.Text) - 1);
{            if Messagedlg('O Produto de código '+ ADOQryProduto.FieldByName('cdProduto').AsString+' está com '+ FormatFloat('0.00',ADOQryProduto.FieldByName('nrqtdreal').AsFloat) +
                        ' em estoque, portanto, não está com quantidade suficiente para venda!' + #13 +
                        'Deseja adiciona-lo mesmo com a quantidade insuficiente em estoque?'
                        ,mtInformation, [mbYes, mbNo], 0) = mrYes then
            AuxiliarLancto(i); }
        end;
        Application.OnMessage := FrmPrincipalPreVenda.ProcessaMsg;
      end else
      if (ADOQryProcura.FieldByName('nrQtd').AsFloat > ADOQryProduto.FieldByName('nrqtdreal').AsFloat) and (ADOQryProduto.FieldByName('nrqtdreal').AsFloat > 0)
        and (vEstqNegativo <> 'S') then begin
        Application.OnMessage := FrmPrincipalPreVenda.NaoProcessaMsg;
        Messagedlg('Atenção! '+#13+
                   'O Produto de código '+ ADOQryProduto.FieldByName('cdProduto').AsString+' está com a quantidade '+ FormatFloat('0.00',ADOQryProduto.FieldByName('nrqtdreal').AsFloat) +
                   ' disponível em estoque.' + #13 +
                   'Foi Solicitado '+ formatFloat('0.00',(ADOQryProcura.FieldByName('nrQtd').AsFloat))+' item(s) '+#13+
                   'Será adicionado na pré-venda/orçamento somente '+ formatFloat('0.00',(ADOQryProduto.FieldByName('nrqtdreal').AsFloat)) +' unidades do produto.' ,mtWarning, [mbOk], 0);
        Application.OnMessage := FrmPrincipalPreVenda.ProcessaMsg;
        RemontaSgDados(SgDados.RowCount);
        SgDados.RowCount := SgDados.RowCount + 1;
      end else begin
        AuxiliarLancto(SgDados.RowCount);
        SgDados.RowCount := SgDados.RowCount + 1;
      end;
      ADOQryProcura.Next;
    end;
     tiraLinhasVazias(SgDados);
  end;
end;

//procedure TFrmPrincipalPreVenda.atualizaGridDados;
//var i: integer;
//begin
//  if(vEstqNegativo <> 'S') then begin
//    Limpa_Grid(SgDados);
//    //open;
//    ADOQryProcura.first;
//    for i := 1 to ADOQryProcura.RecordCount do begin
//      ADOQryProduto.Locate('cdproduto',ADOQryProcura.FieldByName('cdProduto').AsFloat,[]);
////      if (ADOQryProcura.FieldByName('nrQtd').AsFloat > ADOQryProduto.FieldByName('nrqtdreal').AsFloat) and (vEstqNegativo <> 'S') and (vOrcamento<>'O') then begin
//      if (ADOQryProduto.FieldByName('nrqtdreal').AsFloat <= 0) and (vEstqNegativo <> 'S') and (vOrcamento<>'O') then begin
//        Application.OnMessage := FrmPrincipalPreVenda.NaoProcessaMsg;
//        if (vOrcamento = 'N') and (FrmPrincipalPreVenda.RgOpcoes.ItemIndex = 1) then begin
//          Messagedlg('O Produto de código '+ ADOQryProduto.FieldByName('cdProduto').AsString+' está com a quantidade '+ FormatFloat('0.00',ADOQryProduto.FieldByName('nrqtdreal').AsFloat) +
//                     ' disponível em estoque.' + #13 + #13 +
//                     'Portanto, será excluído deste orçamento!',mtWarning, [mbOk], 0);
//          edtQtdItens.Text := FormatFloat('0',StrToFloat(edtQtdItens.Text) - 1);
//{            if Messagedlg('O Produto de código '+ ADOQryProduto.FieldByName('cdProduto').AsString+' está com '+ FormatFloat('0.00',ADOQryProduto.FieldByName('nrqtdreal').AsFloat) +
//                        ' em estoque, portanto, não está com quantidade suficiente para venda!' + #13 +
//                        'Deseja adiciona-lo mesmo com a quantidade insuficiente em estoque?'
//                        ,mtInformation, [mbYes, mbNo], 0) = mrYes then
//            AuxiliarLancto(i); }
//        end;
//        Application.OnMessage := FrmPrincipalPreVenda.ProcessaMsg;
//      end else
//      if (ADOQryProcura.FieldByName('nrQtd').AsFloat > ADOQryProduto.FieldByName('nrqtdreal').AsFloat) and (ADOQryProduto.FieldByName('nrqtdreal').AsFloat > 0)
//        and (vEstqNegativo <> 'S') then begin
//        Application.OnMessage := FrmPrincipalPreVenda.NaoProcessaMsg;
//        Messagedlg('Atenção! '+#13+
//                   'O Produto de código '+ ADOQryProduto.FieldByName('cdProduto').AsString+' está com a quantidade '+ FormatFloat('0.00',ADOQryProduto.FieldByName('nrqtdreal').AsFloat) +
//                   ' disponível em estoque.' + #13 +
//                   'Foi Solicitado '+ formatFloat('0.00',(ADOQryProcura.FieldByName('nrQtd').AsFloat))+' item(s) '+#13+
//                   'Será adicionado na pré-venda/orçamento somente '+ formatFloat('0.00',(ADOQryProduto.FieldByName('nrqtdreal').AsFloat)) +' unidades do produto.' ,mtWarning, [mbOk], 0);
//        Application.OnMessage := FrmPrincipalPreVenda.ProcessaMsg;
//        RemontaSgDados(i);
//        SgDados.RowCount := SgDados.RowCount + 1;
//      end else begin
//        AuxiliarLancto(i);
//        SgDados.RowCount := SgDados.RowCount + 1;
//      end;
//      ADOQryProcura.Next;
//    end;
//     tiraLinhasVazias(SgDados);
//  end;
//end;

function TFrmPrincipalPreVenda.Existe_Numero_Orcamento(nrOrcamento: string): boolean;
var qry: TAdoQuery;
begin
  qry := TAdoquery.Create(nil);
  qry.Connection := DModulo.Conexao;
  with qry do
  begin
    sql.Text := 'select nrOrcamento from orcamento where nrOrcamento = :nrOrcamento';
    parameters.ParamByName('nrOrcamento').Value := nrOrcamento;
    open;
    result :=  qry.RecordCount > 0;
    close;
  end;
  freeandnil(qry);
end;

function TFrmPrincipalPreVenda.Verifica_Se_Produto_Fracionado(cdProduto: string): Boolean;
var qry : TADOQuery;
begin
  qry := TADOQuery.Create(nil);
  qry.Connection := DModulo.Conexao;
  with qry do
  begin
    sql.Text := 'select fracionado from unidade U with (noLock) '+
                'inner join Produto P with (noLock) on P.dsUnidade = U.dsUnidade '+
                'where P.cdProduto = :cdProduto ';
    Parameters.ParamByName('cdProduto').Value := cdProduto;
    Open;
    result := not FieldByName('fracionado').AsBoolean;
    close;
  end;
  FreeAndNil(qry);
end;

procedure TFrmPrincipalPreVenda.BtnConfirmarClick(Sender: TObject);
begin
  if requisitosAtendidos then begin //conjuntos de validacoes feitas antes de confirmar a prevenda/orcamento
    if (RgOpcoes.ItemIndex = 3) and (UpperCase( vEmpresa ) <> 'AMBIENTAR') and (UpperCase( vEmpresa ) <> 'PBFARMA') then begin  // somente p proauto
      SalvaTransferencia;
      BtnConfirmar.Enabled := True;
      Alteraquantidade1.Enabled := true;
      exit;
    end;
    if ((vOrcamento = 'O') and (RgOpcoes.itemindex = 1)) then
      if transformarOrcamentoPrevenda then //Indica que o orcamento agora irá se tornar uma prevenda
        vOrcamento := 'N';
    vtime := getHoraServidor;
    if EdtLancto.text <> '' then
      DesbloqueiaAlteracaoPreVenda(StrToInt(EdtLancto.text));
    if (UPPERCASE(vEmpresa) = 'COPYART') then     //se for copy art sempre pergunta o tipo da forração dos livros
      Verifica_Livro_Forracao;
    if (vSelecionaForma = 'S') and (RgOpcoes.ItemIndex <> 3) then begin
      FrmFormaPag := TFrmFormaPag.Create(Self); // Cria o formulário
      FrmFormaPag.Position := poMainFormCenter;
      //auxiLiberacao := false;
      FrmFormaPag.ShowModal;
    end
    else begin
      prevenda.codigoFormaPagamento := '-1';
      SalvarPreVenda(prevenda);
    end;
  end;
  EdtConsulta.SetFocus;
end;

procedure TFrmPrincipalPreVenda.SgDadosDblClick(Sender: TObject);
var
  L,C,Lauxi:Integer;
  existeItemLancadoNaGrid:Boolean;
begin
  if (SgDados.Row = 0) or (SgDados.Cells[0,SgDados.Row] = '') then//SgDados.RowCount -1 then
    Exit;
  if MessageDlg('Deseja excluir esta linha?',mtConfirmation,[mbYes,mbNo],0) <> mrYes then
  begin
    EdtConsulta.SetFocus;
    exit;
  end;
  // remove o valor cancelado do edit do valor total
  if SgDados.EditorMode = True then
     SgDados.EditorMode:= False;

  prevenda.itens.Delete(SgDados.Row-1);

//  EdtTotal.Text := FormatFloat('0.00',StrToFloat(EdtTotal.Text) - (StrToFloat(SgDados.Cells[9,SgDados.Row]) * StrToFloat(SgDados.Cells[2,SgDados.Row])));
//  edtValorBruto.Text := FormatFloat('0.00',StrToFloat(edtValorBruto.Text) -
//                   (StrToFloat(SgDados.Cells[9,SgDados.Row])*StrToFloat(SgDados.Cells[2,SgDados.Row])));
  if StrToFloat(edtTotal.Text) = 0 then
  begin
    EdtDesconto.Text := LimpaEdtDesconto;
    BtnAprazo.Enabled := True;
  end;
  if vPAFECF then
     cancelar_item(SgDados.Row);  // cancela o item da lista
//  else begin // exclui o item da lista
//    With SgDados do
//    begin
//      if Row = RowCount -1 then // limpa quando a grid tem só uma linha
//      begin
//        for C := 0 to ColCount do
//          Cells[C,Row] := '';
//      end else
//      begin
//        for C := 1 to ColCount do
//          Cells[C,Row] := '';
//        Lauxi := Row;
//        for L := Lauxi to RowCount -1 do
//        begin
//          for C := 0 to ColCount do
//            Cells[C,Row] := Cells[C,Row + 1];
//          if Row < Rowcount -1 then
//            Row := Row + 1;
//        end;
//      end;
//      Row := 1;
//      for L:= Row to RowCount -1 do
//      begin
//        if Cells[0,L] = '' then
//        begin
//          Row := L;
//          Break;
//        end;
//      end;
//      if RowCount > 1 then
//        RowCount := RowCount-1;
//    end;
//  end;
//  SgDados.Refresh;
//  // Recalcula o valor da venda com o desconto
//  EdtDescontoExit(Self);
  CarregarItensGrid(prevenda, IntToStr(SgDados.Row));
  if SgDados.Cells[0,1] = '' then
     vProdutoPromocao := ''; // Se só tiver uma linha, limpa o flag da promocao
  existeItemLancadoNaGrid := (sgDados.Cells[0, 1] <> '');
  if (not existeItemLancadoNaGrid) then
    BtnAprazo.Enabled:= True;
  atualizaEditQtdItens;
  SgDadosExit(Self);
  preencheArrayLinhasDestacadas;
  EdtDesconto.Text := '0,00';
  EdtDescontoExit(Self);
  sgDados.Repaint;
  EdtConsulta.SetFocus;
  setLabel23(QuantidadeDispEmLotes(ADOSPConsulta.FieldByName('Código').AsInteger));
end;

function TFrmPrincipalPreVenda.LimpaEdtDesconto: string;
begin
  if MoPrevenda.vCasasPreco > MoPrevenda.vLimiteCasasPreco then
     Result := '0,00000'
  else
  case vCasasPreco of   // preco de venda
      1: Result := '0,0';
      2: Result := '0,00';
      3: Result := '0,000';
      4: Result := '0,0000';
      5: Result := '0,00000';
  end; // case
end;

procedure TFrmPrincipalPreVenda.CbxAmbienteChange(Sender: TObject);
begin
  if CbxAmbiente.ItemIndex <> -1 then begin
    AdoAmbiente.Open;
    AdoAmbiente.Locate('dsAmbiente',CbxAmbiente.Text,[]);
    EdtCdAmbiente.Text := AdoAmbiente.FieldByName('cdAmbiente').AsString;
  end else
    EdtCdAmbiente.Clear;
end;

{
  Preenche os edits relacionados após o usuário alterar o cliente na cbxCliente.
}
procedure TFrmPrincipalPreVenda.PreencherCamposDoClienteSetadoNaCombo;
begin
  if CbxCliente.ItemIndex <> -1 then
  begin
    ADOQryCliente.Open;
    if ADOQryCliente.Locate('cdPessoa',copy_campo(CbxCliente.Text,'|',2),[]) then begin
      EdtCdCliente.Text := ADOQryCliente.FieldbyName('cdPessoa').AsString;
      EdtEndereco.Text  := ADOQryCliente.FieldbyName('nmLogradouro').AsString;
      if (UpperCase(vEmpresa) = 'CAMARATUBA')OR(UpperCase(vEmpresa) = 'CARDOSOACESSORIOS') then
        EdtApelido.Text   := ADOQryCliente.FieldbyName('dsPreVenda').AsString
      else
        EdtApelido.Text   := ADOQryCliente.FieldbyName('apelido').AsString;  // apelido
      vUF_Cliente       := ADOQryCliente.FieldbyName('dsUF').AsString;
    end
    else begin
      EdtCdCliente.Text := '';
      EdtEndereco.Text  := '';
      EdtApelido.Text   := '';  // apelido
      vUF_Cliente       := '';
    end;
  end;
end;



procedure TFrmPrincipalPreVenda.CbxClienteChange(Sender: TObject);
begin
//  if possuiItensLançados then
//  begin
//    if Application.MessageBox('Alterar o cliente implica na perda dos produtos lançados na prevenda, deseja continuar',
//         'Confirmação',MB_ICONEXCLAMATION + Mb_YesNo) = IdYes
//    then
//    begin
//      limparArrayBoolean(arrayLinhasDestacadas,0,299,False);
//      for I := 1 to 180 do
//        for J := 1 to 7 do
//          vVetor[I,J] := '';
//      EdtConsulta.Clear;
//      EdtSubTotal.Text := '0,00';
//      EdtDesconto.Text := LimpaEdtDesconto;
//      EdtTotal.Text    := '0,00';
//      edtValorBruto.text := '0,00';
//      vObs := '';
//      Limpa_Grid(SgDados);
//      atualizaEditQtdItens;
//      indiceClienteAtual:= CbxCliente.ItemIndex;
////      CbxCliente.ItemIndex:= indiceClienteAtual;
//    end
//    else
//    begin
//      CbxCliente.ItemIndex:= indiceClienteAtual;
//      Exit;
//    end;
//  end
//  else
//    indiceClienteAtual:= CbxCliente.ItemIndex;
  if CbxCliente.ItemIndex <> -1 then
  begin
    PreencherCamposDoClienteSetadoNaCombo;
//    LblVista.caption  := FormatFloat('0.00',ADOQryCliente.Fieldbyname('vldescVista').AsFloat);
//    LblPrazo.caption  := FormatFloat('0.00',ADOQryCliente.Fieldbyname('vldescPrazo').AsFloat);
//    if rgOpcoes.ItemIndex <> 1 then
//    if (vAlteraCliente <> 'S') and (RgOpcoes.ItemIndex = 1) then // N IMPORTA O PREÇO DE ATACADO OU VAREJO ENTÃO N PRECISA LIMPAR A TELA DOS PRODUTOS    thiago
//    begin
//      LimpaGrid;
//      EdtTotal.Text    := '0,00';
//      edtValorBruto.text := '0,00';
//      EdtSubTotal.Text := '0,00';
//      EdtDesconto.Text := LimpaEdtDesconto;
//    end;
  end
  else
  begin
//    LblVista.caption   := '0,00';
//    LblPrazo.caption   := '0,00';
    EdtCdCliente.Text := '';
    EdtEndereco.Text  := '';
    EdtApelido.Text   := '';  // apelido
    vUF_Cliente       := '';
  end;
end;

procedure TFrmPrincipalPreVenda.SBF5Click(Sender: TObject);
begin
  //listarUsuariosNaCombo;
  Monta_Combo;
  if (RgOpcoes.ItemIndex in [0,2,4]) then
    CbxCLiente.SetFocus
  else
    edtLancto.SetFocus;
  ADOQryCliente.open;
  ListBox1.Clear;
  ListBox1.Visible :=false;
  Label11.Text  := '0,00';
  Label13.Text  := '__/__/____';
  label15.Text  := '0,00';
  lblReserva.Text := '0,00';
  AtualizaQryConsulta;
end;

procedure TFrmPrincipalPreVenda.EdtPrecoExit(Sender: TObject);
var vdesconto : real;
    vAuxiPreco : real;
    descontoAcimaLimite, descontoSemPermissao,
    descontoEmClienteAtacado: boolean;
    i: Integer;
begin
 if StrtoFloatDef(EdtQtd.text,0) <= 0 then
    Exit;
  if (CbxCliente.ItemIndex < 0)  then // and (UPPERCASE(vEmpresa) <> 'CAMARATUBA')
  begin
    Application.messagebox('Informe o cliente','Atenção', MB_OK + MB_ICONWARNING + MB_APPLMODAL);
    LimparPesquisa;
    CbxCliente.SetFocus;
    Exit;
  end;
  if (ADOSPConsulta.RecordCount = 0) then
  begin
    Application.OnMessage :=  FrmPrincipalPreVenda.NaoProcessaMsg;
    ShowMessage('Nenhum item foi selecionado');
    EdtConsulta.SetFocus;
    EdtConsulta.SelectAll;
    Application.OnMessage :=  FrmPrincipalPreVenda.ProcessaMsg;
    exit;
  end;
  IF (UPPERCASE(vEmpresa) = 'GAMA') and (trim(EdtCFOP.Text) = '') and EdtCFOP.Visible then
  begin
    Application.OnMessage :=  FrmPrincipalPreVenda.NaoProcessaMsg;
    ShowMessage('Preencha o campo CFOP');
    EdtCFOP.SelectAll;
    EdtCFOP.SetFocus;
    Application.OnMessage :=  FrmPrincipalPreVenda.ProcessaMsg;
    exit;
  end;
  if (UPPERCASE(vEmpresa)='TREVO') and ((StrToFloatDef(EdtPreco.Text,0) > 0)and(StrToFloatDef(EdtQtd.Text,0) > 0)) and (edtLogin.Text = '') then
    if Solicitar_Login('S') = False then begin
      EdtConsulta.SelectAll;
      EdtConsulta.SetFocus;
      Exit;
    end;
  if Trim(EdtPreco.Text) = '' then
     EdtPreco.Text := FormatFloatQ(vCasasPreco, 0.0);
  if Length(EdtSUBTotal.Text) < 1 then
     EdtSubTotal.Text := '0';
  EdtPreco.Text := FormatFloatQ(vCasasPreco,StrToFloat(EdtPreco.Text));// preco de venda
  vAuxiPreco := StrToFloat( FormatFloatQ(vCasasPreco,ADOSPConsulta.FieldByName('Valor').AsFloat) );
  if vAuxiPreco > 0 then
    vdesconto := (1 - (StrToFloat(EdtPreco.Text) / vAuxiPreco)) * 100
  else
    vdesconto := 0;
  EdtDescUnit.Text := FormatFloat('0.00',vdesconto);
  if (StrToFloatDef(EdtDescUnit.Text,0) > 0) and (vAtacadoVarejo = 'A') then //(UpperCase(vEmpresa) = 'CAMARATUBA')OR
  begin
    if vBloquearDescontoAtacado = true then
    begin
      Application.OnMessage:= NaoProcessaMsg;
      MessageDlg('Desconto para clientes atacado está bloqueado.',mtWarning,[mbOK],0);
      EdtPreco.Text    := FormatFloatQ(vCasasPreco, ADOSPConsulta.FieldByName('Valor').AsFloat);
      EdtDescUnit.Text := '0,00';
      EdtPreco.SelectAll;
      EdtPreco.SetFocus;
      Application.OnMessage :=  FrmPrincipalPreVenda.ProcessaMsg;
      exit;
    end
  end
  else if (StrToFloatDef(EdtDescUnit.Text,0) > 0) and ((UpperCase(vEmpresa) = 'CARDOSOACESSORIOS')) then //(UpperCase(vEmpresa) = 'CAMARATUBA')OR
  begin
    if TNEGCliente.isCliente_Crediario(EdtCdCliente.Text) then
    begin
      Application.OnMessage:= NaoProcessaMsg;
      MessageDlg('Desconto já é automático para clientes de crediário.',mtWarning,[mbOK],0);
      EdtPreco.Text    := FormatFloatQ(vCasasPreco, ADOSPConsulta.FieldByName('Valor').AsFloat);
      EdtDescUnit.Text := '0,00';
      EdtPreco.SelectAll;
      EdtPreco.SetFocus;
      Application.OnMessage :=  FrmPrincipalPreVenda.ProcessaMsg;
      exit;
    end
  end
  else if (StrToFloatDef(EdtDescUnit.Text,0) > 0) and (vDescontoClienteAuto = True) and (TNEGCliente.getPercentualDoPrecoComDescontoDecimal(StrtoIntDef(EdtCdCliente.Text,0)) < 1) then begin
    Application.OnMessage:= NaoProcessaMsg;
    MessageDlg('Desconto já é automático para este cliente.',mtWarning,[mbOK],0);
    EdtPreco.Text    := FormatFloatQ(vCasasPreco, ADOSPConsulta.FieldByName('Valor').AsFloat);
    EdtDescUnit.Text := '0,00';
    EdtPreco.SelectAll;
    EdtPreco.SetFocus;
    Application.OnMessage :=  FrmPrincipalPreVenda.ProcessaMsg;
    exit;
  end;
  if vLimitarDescontoFornecedor then
  begin
    if StrToFloatDef(EdtDescUnit.Text,0) >
      GetLimiteDescontoFornecedor(StrToInt(EdtCdCliente.Text),ADOSPConsulta.FieldByName('Código').AsInteger) then
    begin
      Application.OnMessage:= NaoProcessaMsg;
      MessageDlg('Desconto Máx definido pelo fornecedor é de '+
            FormatFloat('0.00',GetLimiteDescontoFornecedor(StrToInt(EdtCdCliente.Text),ADOSPConsulta.FieldByName('Código').AsInteger))+'%',mtWarning,[mbOK],0);
      EdtPreco.Text    := FormatFloatQ(vCasasPreco,ADOSPConsulta.FieldByName('Valor').AsFloat);
      EdtDescUnit.Text := '0,00';
      EdtPreco.SelectAll;
      EdtPreco.SetFocus;
      Application.OnMessage :=  FrmPrincipalPreVenda.ProcessaMsg;
      exit;
    end else
    begin
      if GetLimiteDescontoFornecedor(StrToInt(EdtCdCliente.Text),ADOSPConsulta.FieldByName('Código').AsInteger) <> 100 then
      begin
        EdtPreco.Text := FormatFloatQ(vCasasPreco,StrToFloat(EdtPreco.Text));
        enviaProdutos;
         Exit;
      end;
    end;
  end;
    // Não pode da desconto num produto em promoção
//  if (UpperCase(vEmpresa) = 'REZENDE') and
  if (StrToFloat(EdtPreco.Text) < ADOSPConsulta.FieldByName('Valor').AsFloat - 0.1) and ((UPPERCASE(vEmpresa) = 'REZENDE') or (UpperCase(vEmpresa) = 'BELAVISTA') or (UPPERCASE(vEmpresa) = 'PROAUTO')) then
  begin
  //if (StrToFloat(EdtDescUnit.text) > 0.1) and ((ADOSPConsulta.FieldByName('dsPromocao').AsString = 'S') or
  //                                             (ADOSPConsulta.FieldByName('dsPromocaoVarejo').AsString = 'S')) then begin
    Application.OnMessage :=  FrmPrincipalPreVenda.NaoProcessaMsg;
    //ShowMessage('Este item encontra-se em promoção. Portanto não é liberado nenhum desconto para o mesmo!');
    ShowMessage('Não é possível vender este produto com preço menor do que o cadastro!');
    EdtPreco.Text    := FormatFloatQ(vCasasPreco,ADOSPConsulta.FieldByName('Valor').AsFloat);
    EdtDescUnit.Text := '0,00';
    EdtPreco.SelectAll;
    EdtPreco.SetFocus;
    Application.OnMessage :=  FrmPrincipalPreVenda.ProcessaMsg;
    exit;
  end;
//  if (StrToFloat(EdtDescUnit.Text) > 0) and (bloquearDescontoAtacado) and (vAtacadoVarejo = 'A')  then begin
//  //if (StrToFloat(EdtDescUnit.text) > 0.1) and ((ADOSPConsulta.FieldByName('dsPromocao').AsString = 'S') or
//  //                                             (ADOSPConsulta.FieldByName('dsPromocaoVarejo').AsString = 'S')) then begin
//    Application.OnMessage :=  FrmPrincipalPreVenda.NaoProcessaMsg;
//    //ShowMessage('Este item encontra-se em promoção. Portanto não é liberado nenhum desconto para o mesmo!');
//    Application.messagebox('Desconto não permitido: cliente atacado!','Atenção', MB_OK + MB_ICONWARNING + MB_APPLMODAL);
//    EdtPreco.Text:= FormatFloat('0.00',ADOSPConsulta.FieldByName('Valor').AsFloat);
//    EdtDescUnit.Text:= '0,00';
//    EdtPreco.SelectAll;
//    EdtPreco.SetFocus;
//    Application.OnMessage:=  FrmPrincipalPreVenda.ProcessaMsg;
//    exit;
//  end;
  //se o produto estiver em promoção, não pode dar desconto por item
  if (ADOSPConsultaPRECO.AsCurrency <> ADOSPConsultaVALOR.AsCurrency)
      and (StrToFloat(EdtDescUnit.Text)>0) then
  begin
    Application.MessageBox(PChar('Não é possível dar desconto para um produto que está em promoção!'), 'Atenção', MB_OK + MB_ICONINFORMATION + MB_APPLMODAL);
    EdtPreco.Text    := FormatFloatQ(vCasasPreco,ADOSPConsulta.FieldByName('Valor').AsFloat);
    EdtDescUnit.Text := '0,00';
    EdtDescUnit.SelectAll;
    EdtDescUnit.setFocus;
    Exit;
  end;
  if UPPERCASE(vEmpresa) = 'PROAUTO' then
  begin
    if (StrToFloat(EdtDescUnit.Text) > vlDescontoVendedor)
      OR ((StrToFloat(EdtDescUnit.Text) > 0) and (bloquearDescontoAtacado) and (vAtacadoVarejo = 'A')) then
    begin //vPorcDesconto
       vFlag := '0';
       LiberaVanda;
    end;
  end else
  begin                    // existe o desconto no cadastro do cliente E está configurado para dar o desconto automático E o usuário está tentando dar mais desconto SEM permissão
    descontoAcimaLimite:= ((TNEGCliente.getDescontoPercentual(StrToInt(EdtCdCliente.Text))>0)AND(TNEGLoja.getConfiguracaoDescontoAutomaticoPorCliente)AND(StrToFloat(EdtDescUnit.Text)>0)AND(Permissao('615','V') = 'N'))OR
                          (((StrToFloat(EdtDescUnit.Text)) > StrToFloat(FormatFloat('0.00',vPorcDesconto))) and (Permissao('615','V') = 'N'));
    descontoSemPermissao:= (((StrToFloat(EdtDescUnit.Text)) > 0) and (Permissao('613','V') = 'N')); // usuário não tem permissão para dar desconto até o limite
    descontoEmClienteAtacado:= ((StrToFloat(EdtDescUnit.Text) > 0) and (bloquearDescontoAtacado) and (vAtacadoVarejo = 'A') and (Permissao('615','V') = 'N'));
    if (descontoAcimaLimite OR descontoSemPermissao OR descontoEmClienteAtacado) and (TestaFinanceiroNaConfirmacao = false) then
    begin
      vFlag := '0';
      LiberaVanda;
      exit;
    end else
    begin
      if ((TNEGCliente.getDescontoPercentual(StrToInt(EdtCdCliente.Text))>0)AND(TNEGLoja.getConfiguracaoDescontoAutomaticoPorCliente)
            AND(StrToFloat(EdtDescUnit.Text)>0)) OR ((StrToFloat(EdtDescUnit.Text)) > StrToFloat(FormatFloat('0.00',vPorcDesconto))) then
        Application.MessageBox(PChar('Desconto acima do limite'), 'Atenção', MB_OK + MB_ICONINFORMATION + MB_APPLMODAL);
    end;
  end;

  EdtPreco.Text := FormatFloatQ(vCasasPreco,StrToFloat(EdtPreco.Text));
  enviaProdutos;

  HabilitaDesabilitaDesconto;
  EdtConsulta.SelectAll;
  //EdtConsulta.Clear;
end;

procedure TFrmPrincipalPreVenda.HabilitaDesabilitaDesconto;
var existeProdutoSemPromocaoEDesconto: boolean;
    i: integer;
begin
  if prevenda = nil then exit;
  //se só tiver um item e o mesmo estiver em promoção, desabilito o desconto no total
  if prevenda.itens.Count = 1 then begin
    if prevenda.itens[0].Promocao_desconto_Item = true then begin
      BtnAprazo.Enabled := false;
      edtdesconto.Text := '0,00000';
      edtdesconto.ReadOnly := True;
    end;
  end
  else begin
    existeProdutoSemPromocaoEDesconto := false;
    for I := 0 to prevenda.itens.Count - 1 do begin
      //primeiro verifico se o item esta em promocao       //depois verifico se o item não teve desconto
      if (prevenda.itens[i].Promocao_desconto_Item = false) and
         (prevenda.itens[i].precoVenda = prevenda.itens[i].precoBruto) then begin
        existeProdutoSemPromocaoEDesconto := True;
        Break;
      end;
    end;
    //se teve algum produto que não está em promoção ou nao teve desconto por item então libero o campo de desconto no total
    //só libero o campo de desconto no total se
    if ((existeProdutoSemPromocaoEDesconto)and((UpperCase(vEmpresa) <> 'BG')and(UpperCase(vEmpresa) <> 'MOTOPECAS'))) or (((UpperCase(vEmpresa) = 'BG')or(UpperCase(vEmpresa) = 'MOTOPECAS'))and(prevenda.descontoPercentual = 0)) then begin
      BtnAprazo.Enabled    := true;
      edtdesconto.Text     := '0,00000';
      edtdesconto.ReadOnly := false;
    end;
  end;
end;

procedure TFrmPrincipalPreVenda.EdtQtdKeyPress(Sender: TObject;
  var Key: Char);
var
  texto:string;
begin
  //na mega moveis, eles não querem q os vendedores vendam "Meio" produto, ou 0,5 sofá. kenneth
  if ((UPPERCASE(vEmpresa) = 'MEGA') or (UPPERCASE(vEmpresa)='BELAVISTA')) then
    ValidarInteiro(Key)
  else
  begin
    if (Key = Char(27)) then
      BtnCancelar.Click
    else
    begin
      texto:= TEdit(Sender).text;
      if (TEdit(Sender).SelText = TEdit(Sender).text) then
        texto:= '';
      ValidarNumero(key, texto);
    end;
  end;
end;

procedure TFrmPrincipalPreVenda.EdtPrecoKeyPress(Sender: TObject;
  var Key: Char);
var
  texto:string;
begin
  if (Key = Char(27)) then
    BtnCancelar.Click
  else
  begin
    texto:= TEdit(Sender).text;
    if (TEdit(Sender).SelText = TEdit(Sender).text) then
      texto:= '';
    ValidarNumero(key, texto);
  end;
end;

procedure TFrmPrincipalPreVenda.EdtSubTotalKeyPress(Sender: TObject;
  var Key: Char);
begin
  ValidarNumero(key);
  if (Key = Char(27)) then
    BtnCancelar.Click;
end;

procedure TFrmPrincipalPreVenda.EdtSubTotalEnter(Sender: TObject);
begin
  vlTotalAnterior := StrToFloat(FormatFloat('0.00',StrToFloatDef(EdtSubTotal.text,0)));
end;

procedure TFrmPrincipalPreVenda.EdtSubTotalExit(Sender: TObject);
var
  diminuiuTotal, possuiPermissaoVenderAbaixoDoCusto: boolean;
begin
  inherited;
  // Se saiu do campo edtSubTotal para um campo diferente de edtDesconto, desativa o desconto
  if not(EdtSubTotal.ReadOnly or EdtDesconto.Focused) then
     DesativarCamposDescontoTotal;
  EdtSubTotal.Text := FormatFloat('0.00',StrToFloatDef(EdtSubTotal.Text,0));
//  if (diminuiuTotal) and (bloquearDescontoAtacado) and (vAtacadoVarejo = 'A')  then
//  begin
//    Application.OnMessage:=  FrmPrincipalPreVenda.NaoProcessaMsg;
//    Application.messagebox('Desconto não permitido: cliente atacado!','Atenção', MB_OK + MB_ICONWARNING + MB_APPLMODAL);
//    EdtSubTotal.Text:= FormatFloat('0.00', vlTotalAnterior);
//    EdtSubTotal.selectAll;
//    EdtSubTotal.setFocus;
//    Application.OnMessage:= FrmPrincipalPreVenda.ProcessaMsg;
//    Exit;
//  end;
  if vCasasPreco > vLimiteCasasPreco then
    Recalcula_Desconto //recalcula o valor do desconto sem recalculoar o preço com desconto
                       //e sem ajustar o número de casas decimais
  else
    Corrige_Desconto; //recalcula o desconto % e recalcula o preço com desconto,
                      //para não dar diferença na hora de puxar no SPDV100 e no CUPOM
  diminuiuTotal := (StrToFloat(FormatFloat('0.00',vlTotalAnterior)) > StrToFloat(EdtSubTotal.Text));
  if diminuiuTotal then
  begin
    if (StrToFloatDef(EdtDesconto.Text,0) > 0) and (vAtacadoVarejo = 'A') then //(UpperCase(vEmpresa) = 'CAMARATUBA')OR
    begin
      if vBloquearDescontoAtacado = true then
      begin
        Application.OnMessage:= NaoProcessaMsg;
        MessageDlg('Desconto para clientes atacado está bloqueado.',mtWarning,[mbOK],0);
        EdtDesconto.Text := '0,00';
        EdtDesconto.SelectAll;
        EdtDesconto.SetFocus;
        Application.OnMessage :=  FrmPrincipalPreVenda.ProcessaMsg;
        exit;
      end
    end                                                                                               // claudio: comentei de acordo com o atend 33920
    else if (StrToFloatDef(EdtDesconto.Text,0) > 0) and ((UpperCase(vEmpresa) = 'CARDOSOACESSORIOS')) then // (UpperCase(vEmpresa) = 'CAMARATUBA')or
    begin
      if TNEGCliente.isCliente_Crediario(EdtCdCliente.Text) then
      begin
        Application.OnMessage:= NaoProcessaMsg;
        MessageDlg('Desconto já é automático para clientes de crediário.',mtWarning,[mbOK],0);
        EdtDesconto.Text := '0,00';
        EdtSubTotal.Text := FormatFloat('0.00',vlTotalAnterior);
        EdtSubTotal.SetFocus;
        Application.OnMessage :=  FrmPrincipalPreVenda.ProcessaMsg;
        exit;
      end;
    end
    else if (StrToFloatDef(EdtDesconto.Text,0) > 0) and (vDescontoClienteAuto = True) and (TNEGCliente.getPercentualDoPrecoComDescontoDecimal(StrtoIntDef(EdtCdCliente.Text,0)) < 1) then begin
      Application.OnMessage:= NaoProcessaMsg;
      MessageDlg('Desconto já é automático para este cliente.',mtWarning,[mbOK],0);
      EdtDesconto.Text := '0,00';
      EdtSubTotal.Text := FormatFloat('0.00',vlTotalAnterior);
      EdtSubTotal.SetFocus;
      Application.OnMessage :=  FrmPrincipalPreVenda.ProcessaMsg;
      exit;
    end;
    if ExisteDescontoFornecedorInvalido then
    begin
      EdtDesconto.Text := '0,00';
      EdtSubTotal.Text := FormatFloat('0.00',vlTotalAnterior);
      EdtSubTotal.SetFocus;
      exit;
    end;
    if UPPERCASE(vEmpresa) = 'PROAUTO' then
    begin
      if (StrToFloat(EdtDesconto.Text) > vlDescontoVendedor)
        OR ((bloquearDescontoAtacado) and (vAtacadoVarejo = 'A'))
      then
      begin
        vFlag:= '6';
        LiberaVanda;
      end;
    end
    else
    begin
      if ((StrToFloat(EdtDesconto.Text) > vPorcDesconto) and (Permissao('615','V') = 'N'))
        OR ((bloquearDescontoAtacado) and (vAtacadoVarejo = 'A'))
        OR (Permissao('613','V') = 'N')
      then
      begin

        // valor total abaixo da soma do custo final
        if (StrToFloat(EdtDesconto.Text) > 0)
            AND (StrToFloat(EdtSubTotal.Text) < getSomaCustoFinal)
            AND TNEGLoja.getBloquearVendaAbaixoDoCustoFinal
            AND (Permissao('631','V') = 'N')
        then
        begin
          if FrmCancelamentoVenda.Possui_Permissao('631','V',cbxUsuario.Text,EdtUsuario.Text) then begin
            possuiPermissaoVenderAbaixoDoCusto := true;
            Application.MessageBox(PChar('Vendendo abaixo do custo final'), 'Atenção', MB_OK + MB_ICONINFORMATION + MB_APPLMODAL);
          end
          else begin
            FrmCancelamentoVenda:= TFrmCancelamentoVenda.Create(Self, '631', 'V', possuiPermissaoVenderAbaixoDoCusto);
            FrmCancelamentoVenda.Copyright.Caption :=  '<<<<   Venda abaixo do custo final    >>>>';
            FrmCancelamentoVenda.showmodal;
          end;
          if (not possuiPermissaoVenderAbaixoDoCusto) then
          begin
            prevenda.descontoPercentual:= 0;
            EdtDesconto.Text := '0,000';
            //EdtSubTotal.Text := EdtTotal.Text;
          end;
          Application.OnMessage := FormPrincipal.ProcessaMsg;
        end
        else
        begin
          vFlag:= '6';
          LiberaVanda;
        end;
      end
      else
      if (StrToFloat(EdtDesconto.Text) > 0)
          AND (StrToFloat(EdtSubTotal.Text) < getSomaCustoFinal)
          AND TNEGLoja.getBloquearVendaAbaixoDoCustoFinal
          AND (Permissao('631','V') = 'N')
      then
      begin
        if FrmCancelamentoVenda.Possui_Permissao('631','V',cbxUsuario.Text,EdtUsuario.Text) then begin
          possuiPermissaoVenderAbaixoDoCusto := true;
          Application.MessageBox(PChar('Vendendo abaixo do custo final'), 'Atenção', MB_OK + MB_ICONINFORMATION + MB_APPLMODAL);
        end
        else begin
          FrmCancelamentoVenda:= TFrmCancelamentoVenda.Create(Self, '631', 'V', possuiPermissaoVenderAbaixoDoCusto);
          FrmCancelamentoVenda.Copyright.Caption :=  '<<<<   Venda abaixo do custo final    >>>>';
          FrmCancelamentoVenda.showmodal;
        end;
        if (not possuiPermissaoVenderAbaixoDoCusto) then
        begin
          prevenda.descontoPercentual:= 0;
          EdtDesconto.Text := '0,000';
          //EdtSubTotal.Text := EdtTotal.Text;
        end;
        Application.OnMessage := FormPrincipal.ProcessaMsg;
      end
    end;
  end;
end;

procedure TFrmPrincipalPreVenda.Recalcula_Desconto;
var
  varvdesc, varvlComDesc, varvlSemDesc : Real;
  vlBruto, vlLiquido, vlProdutos, vlDescPorc: Real;
    i: Integer;
    x,y,t : real;
begin
  vlBruto:= 0;
  vlLiquido := 0;
  if prevenda = nil then Exit;
  for I := 0 to prevenda.itens.Count - 1 do begin
    if prevenda.itens[i].Promocao_desconto_Item = true then begin
      vlBruto := vlBruto + SimpleRoundTo((prevenda.itens[i].quantidade * prevenda.itens[i].precoVenda),-2);
    end
    else
      vlBruto := vlBruto + SimpleRoundTo((prevenda.itens[i].quantidade * prevenda.itens[i].precoBruto),-2);
    vlLiquido := vlLiquido + prevenda.itens[i].SubTotal;
  end;
  vlLiquido := SimpleRoundTo(vlLiquido,-2);
//  vlBruto    := TNEGPrevenda.GetValorItensComPromocao(prevenda); //StrToFloat(EdtTotal.Text);
  if ((vlLiquido - StrToFloat(EdtSubTotal.Text)) > 0.005) or ((vlLiquido - StrToFloat(EdtSubTotal.Text)) < -0.005) then
    vlLiquido  := StrToFloat(EdtSubTotal.Text);
  vlProdutos := TNEGPrevenda.GetValorItensSemPromocao(prevenda);

  //calculo o valor do desconto em porcentagem somente no valor referente aos produtos que não estão em promoção
  vlDescPorc := 0;
  if vlProdutos > 0 then
    vlDescPorc := (((StrtoFloat(FormatFloatQ(vCasasPreco,vlBruto)) - StrtoFloat(FormatFloatQ(vCasasPreco,vlProdutos)))
                          - (StrtoFloat(FormatFloatQ(vCasasPreco,vlLiquido)) - StrtoFloat(FormatFloatQ(vCasasPreco,vlProdutos)))) * 100)
                                / StrtoFloat(FormatFloatQ(vCasasPreco,vlProdutos));

  EdtDesconto.Text := FormatFloat('0.00000',vlDescPorc);
  EdtDescontoExit(self);
  if StrToFloat(FormatFloat('0.00',vlLiquido)) < StrToFloat(EdtSubTotal.Text) then
    EdtDesconto.Text := FloatToStr(StrToFloat(EdtDesconto.Text)+0.01);
  EdtDescontoExit(self);
  //estava antes assim
{  if vCasasPreco > vLimiteCasasPreco then
  begin
    varvlComDesc := StrToFloat(EdtSubTotal.Text);
    varvlSemDesc := StrToFloat(EdtTotal.Text);

    if varvlSemDesc > 0 then
    begin
      varvdesc := (1-(varvlComDesc/varvlSemDesc))*100;
      EdtDesconto.Text := FormatFloat('0.00000',varvdesc);
    end;
    exit; //Ainda não estamos usando essa parte debaixo do código
  end
  else
  case vCasasPreco of   // preco de venda
      1: EdtDesconto.Text := FormatFloat('0.0',varvdesc);
      2: EdtDesconto.Text := FormatFloat('0.00',varvdesc);
      3: EdtDesconto.Text := FormatFloat('0.000',varvdesc);
      4: EdtDesconto.Text := FormatFloat('0.0000',varvdesc);
      5: EdtDesconto.Text := FormatFloat('0.00000',varvdesc);
  end;
  }
end;

procedure TFrmPrincipalPreVenda.Corrige_Desconto;
var
  vdesconto, vValor_total, vPreco_Desconto : real;
begin
  //atribuo valores às variáves que vou usar na procedure para recalcular o juro
  vdesconto := StrToFloat(EdtDesconto.Text);
  vValor_total := StrToFloat(EdtTotal.Text);
  vPreco_Desconto := StrToFloat(EdtSubTotal.Text);
  //gera o desconto correto, com duas casas decimais
  Gera_Desconto_Correto(vPreco_Desconto, vdesconto, vValor_total, vCasasPreco);
  EdtDesconto.Text := FormatFloat('0.00',vdesconto);
  case vCasasPreco of   // preco de venda
      1: EdtSubTotal.Text := FormatFloat('0.0',vPreco_Desconto);
      2: EdtSubTotal.Text := FormatFloat('0.00',vPreco_Desconto);
      3: EdtSubTotal.Text := FormatFloat('0.000',vPreco_Desconto);
      4: EdtSubTotal.Text := FormatFloat('0.0000',vPreco_Desconto);
      5: EdtSubTotal.Text := FormatFloat('0.00000',vPreco_Desconto);
  end;
end;

//preco_desconto ......: preço após o desconto
//Desconto_Atual ......: variável que vai receber o valor do deconto com duas casas decimais
//Valor_Total .........: Valor total da venda
//Casas_Decimais_Preco : Número de casas decimais do preço de acordo com a configuração do saef
procedure TFrmPrincipalPreVenda.Gera_Desconto_Correto(var Preco_Desconto: Real;
    var Desconto_Atual: Real; valor_Total: Real; casas_decimais: Integer);
var
  vDesconto, vPreco, vlBruto, descReal: Real;
  i: integer;
begin
  //só é permitido aplicar desconto nos itens que não estão em promoção
//  vlBruto:= 0;
//  for I := 0 to prevenda.itens.Count - 1 do begin
//    if prevenda.itens[i].Promocao_desconto_Item = false then begin
//      vlBruto := vlBruto + prevenda.itens[i].quantidade * prevenda.itens[i].precoVenda;
//    end;
//  end;
//  valor_Total := vlBruto;
//  descReal := (vlBruto * StrToFloat(EdtDesconto.Text)) / 100;

  Desconto_Atual := (valor_Total-Preco_Desconto) * 100 / valor_Total; //calculando o desconto atual
  vDesconto      := Arredonda_Pra_Cima(Desconto_Atual, casas_decimais); //arredondo o desconto para duas casas decimais
  vPreco         := (1 - vDesconto/100) * valor_Total;
  if vPreco <> Preco_Desconto then //se o novo preço com desconto for diferente do antigo, o antigo sai e fica o novo
  begin                            //porque senão gera uma diferença quando for recalcular o desconto no SPDV100 ou CUPOM FISCAL
     Preco_Desconto := vPreco; //atribuo o preço recalculado
     Desconto_Atual := vDesconto;
  end;
end;

function TFrmPrincipalPreVenda.GetFlagEmpresa: string;
begin
  Result := UpperCase(vEmpresa);
end;

function TFrmPrincipalPreVenda.Arredonda_Pra_Cima(numero: Real; numero_de_casas:Integer): Real;
var
  Arred: Real;
begin
  case numero_de_casas of
    1 : begin
          Arred := RoundTo(numero, -1);
          if Arred > numero then
             Arred := Arred - 0.1;
          Result := Arred;
        end;
    2 : begin
          Arred := RoundTo(numero, -2);
          if Arred > numero then
             Arred := Arred - 0.01;
          Result := Arred;
        end;
    3 : begin
          Arred := RoundTo(numero, -3);
          if Arred > numero then
             Arred := Arred - 0.001;
          Result := Arred;
        end;
    4 : begin
          Arred := RoundTo(numero, -4);
          if Arred > numero then
             Arred := Arred - 0.0001;
          Result := Arred;
        end;
  else
    Result := numero; //senão estiver entre 1 e 4, não arredonda
  end;
end;

procedure TFrmPrincipalPrevenda.moverCamposImpressao(var relOrcamento:TFrmRelOrcamentos; movimento:integer);
begin
  with relOrcamento do
  begin
    RLLabel5.Left:= RLLabel5.Left + movimento;
    RLLabel13.Left:= RLLabel3.Left + movimento;
    RLDBText2.Left:= RLDBText2.Left + movimento;

    QRLabel12.Left:= QRLabel12.Left + movimento;
    RLLabel14.Left:= RLLabel4.Left + movimento;
    QreUnidade.Left:= QreUnidade.Left + movimento;

    QRLabel7.Left:= QRLabel7.Left + movimento;
    RLLabel17.Left:= RLLabel7.Left + movimento;
    QREQtd.Left:= QREQtd.Left + movimento;

    QRLabel8.Left:= QRLabel8.Left + movimento;
    RLLabel18.Left:= RLLabel8.Left + movimento;
    QREPreco.Left:= QREPreco.Left + movimento;

    RLLabel2.Left:= RLLabel2.Left + movimento;
    RLLabel19.Left:= RLLabel9.Left + movimento;
    RLDBResult3.Left:= RLDBResult3.Left + movimento;
  end;
end;

procedure TFrmPrincipalPrevenda.ImprimeOrcamento(valor : integer);
var
  vcdpessoa : String[01];
  i :  integer;
  varQtdItens : Integer;
begin
  // Imprime Somente o Orçamento
  if vPAFECF and ((vOrcamento = 'N') or (RgOpcoes.ItemIndex in [0,4])) then
    Exit;
  if vMemo.Text <> '' then
  begin
    if MessageDlg('Imprimir o campo OBSERVAÇÃO?',mtConfirmation,[mbYes,mbNo],0) = mrNO then
      vMemo.Clear;
  end;
  FrmRelOrcamentos := TFrmRelOrcamentos.Create(Self); // Cria o formulário
//  FrmRelOrcamentos.QreQtd.DisplayMask      := TNEGLoja.displayFormat(vCasasQtd);
//  //FrmRelOrcamentos.RLDBResult1.DisplayMask := TNEGLoja.displayFormat(vCasasPreco);
//  FrmRelOrcamentos.QrePreco.DisplayMask    := TNEGLoja.displayFormat(vCasasPreco);
  if (UPPERCASE(vEmpresa) = 'MOSR') then
  begin
    FrmRelOrcamentos.QREOrcamento.Font.Size := 11;
    FrmRelOrcamentos.QreRota.Visible  := True;
    FrmRelOrcamentos.QreRota2.Visible := True;
    FrmRelOrcamentos.RLLinhaProduto.Visible := True;
  end;
  if (UPPERCASE(vEmpresa) = 'LAMARAO') then
  begin
    FrmRelOrcamentos.RLDBText6.Visible  := True;
    FrmRelOrcamentos.RLLabel11.Visible  := True;
    FrmRelOrcamentos.QRLabel6.Visible   := True;
    FrmRelOrcamentos.QreUnidade.Visible := false;
    FrmRelOrcamentos.RLLabel14.Visible  := false;
    FrmRelOrcamentos.QRLabel12.Visible  := false;
    FrmRelOrcamentos.RLDBText2.Left     := FrmRelOrcamentos.RLDBText2.Left + 32;
    FrmRelOrcamentos.RLLabel13.Left     := FrmRelOrcamentos.RLLabel13.Left + 32;
    FrmRelOrcamentos.RLLabel5.Left      := FrmRelOrcamentos.RLLabel5.Left + 32;
    FrmRelOrcamentos.RlDescricao.Width  := 228;
    FrmRelOrcamentos.QREDescricao.Width := 228;
  end
  else begin
    FrmRelOrcamentos.RLLabel23.Left     := FrmRelOrcamentos.RLLabel11.Left;
    FrmRelOrcamentos.RLLabel24.Left     := FrmRelOrcamentos.QRLabel6.Left;
    FrmRelOrcamentos.RlDescricao.Left   := FrmRelOrcamentos.RLDBText6.Left;
    FrmRelOrcamentos.QREDescricao.Left  := FrmRelOrcamentos.RLDBText6.Left;
    FrmRelOrcamentos.RlDescricao.Width  := 262;
    FrmRelOrcamentos.QREDescricao.Width := 262;
  end;
  if (UpperCase(vEmpresa) = 'PTINTAS') then
    FrmRelOrcamentos.QREDescricao.DataField := 'dsServico';
  if TNEGLoja.getCongiguracaoCNPJ = '08872144000140' then  // Hiper móveis pediu p ficar envertido o local do campo para o cliente e loja assinarem.
  begin
    FrmRelOrcamentos.QRLblEmpresa2.Caption := 'Cliente';
    FrmRelOrcamentos.QRLabel18.Caption := 'Empresa';
  end;
//  if (UpperCase(vEmpresa) = 'BELAVISTA') then  // esse cliente quer q saia o desconto em porcentagem
//  begin
//    FrmRelOrcamentos.RLLabel3.Visible := True;
//    FrmRelOrcamentos.lblPorcDesconto.Visible := True;
//  end;
  if (vOcultaDesconto = 'S') then
  begin
    FrmRelOrcamentos.RLDBResult3.DataField   := '';
    FrmRelOrcamentos.RLDBResult3.DataFormula := '(vlPreco-((vlPreco*nrDesconto)/100))';
  end;
  { Se for HOSPITALAR troco a coluna de Prateleira por Lote. }
  if usarLoteValidade = True then
  begin
    FrmRelOrcamentos.RLLabel5.Caption    := 'Lote';
    FrmRelOrcamentos.RLLabel13.Caption   := 'Lote';
    FrmRelOrcamentos.rlDbText2.DataField := 'nrLote';
  end;
//  if vPAFECF then
//  begin
//    FrmRelOrcamentos.RLBand1.Height  := 0;
//    FrmRelOrcamentos.RLBPAF.Height   := 132;
//    FrmRelOrcamentos.RLBand3.Height  := 109;
//    FrmRelOrcamentos.RLBand3.Borders.DrawBottom := True;
//    FrmRelOrcamentos.RLBand3.Borders.DrawLeft   := True;
//    FrmRelOrcamentos.RLBand3.Borders.DrawRight  := True;
//    FrmRelOrcamentos.RLBand2.Borders.DrawLeft   := True;
//    FrmRelOrcamentos.RLBand2.Borders.DrawRight  := True;
//  end else
//  begin
    FrmRelOrcamentos.RLBand1.Height := 185;
    FrmRelOrcamentos.RLBPAF.Height  := 0;
    FrmRelOrcamentos.RLBand3.Height := 92;
//  end;
  varQtdItens := StrToIntDef(edtQtdItens.Text,0);
  if (varQtdItens > 13) then
    //if MessageDlg('Imprimir em meia folha?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
      FrmRelOrcamentos.QrMdRel.PageSetup.PaperHeight := 297;
  // FrmRelOrcamentos.QryRelDados.Active := True;
  With FrmRelOrcamentos.ADOSPRelDados do
  begin
    Close;
    Parameters.ParamByName('@DSLANCAMENTO').Value := EdtLancto.Text;
    Parameters.ParamByName('@CODIGO').Value       := EdtCdCliente.Text;
    if (UPPERCASE(vEmpresa) = 'TRESLEOES') then
      Parameters.ParamByName('@FLAG').Value := 3  // SELECT DO ORCAMENTO ORDENANDO OS ITENS PELA DESCRIÇÃO
    else
      Parameters.ParamByName('@FLAG').Value := 2;  // INDICA Q A STORED PROCEDURE RODA PARA SELECT DOS ORCAMENTOS
    Parameters.ParamByName('@ORDEM').Value := TNEGLoja.getConfiguracaoOrdemImpressaoPreVenda;
    Open;
  end;
  if (UPPERCASE(vEmpresa) = 'CARIOCA') or (UPPERCASE(vEmpresa) = 'GAMA') or ((UPPERCASE(vEmpresa) = 'MEGA')and(vOrcamento = 'O')) then
  begin
    FrmRelOrcamentos.rlDescricao.Visible      := True;
    FrmRelOrcamentos.rlDescricao.Transparent  := False;
    FrmRelOrcamentos.qreDescricao.Visible     := False;
    FrmRelOrcamentos.qreDescricao.Transparent := True;
  end else if (UPPERCASE(vEmpresa) = 'TELESOM') then
  begin
    FrmRelOrcamentos.RLSystemInfo2.Info:= TRLInfoType(1);
  end;
  if vOcultaReferenciaNaImpressao then
  begin
    FrmRelOrcamentos.RLLabel1.Visible  := false;
    FrmRelOrcamentos.RLDBText1.Visible := false;
    moverCamposImpressao(frmRelOrcamentos, FrmRelOrcamentos.RLLabel1.left-FrmRelOrcamentos.QRLabel6.left);
    FrmRelOrcamentos.QRLabel6.left     := FrmRelOrcamentos.RLLabel1.left;
    FrmRelOrcamentos.QREDescricao.left := FrmRelOrcamentos.RLLabel1.left;
  end;
  with FrmRelOrcamentos.ADOQryCliente do
  begin
    Sql.Text := 'Select Distinct P.cdPessoa,P.nmPessoa,E.dsUf,E.nmLogradouro,E.dsBairro,              '+
                'E.dsCidade,E.dsCep,P.Existir,E.dsUF,E.dsComplemento,E.nrNumero,C.dsPrevenda,         '+
                'G.dsRegiao                                                                           '+
                'From Pessoa P WITH (NOLOCK), Endereco E WITH (NOLOCK),                               '+
                'Cliente C WITH (NOLOCK) left join Regiao G WITH (NOLOCK) on C.cdRegiao = G.cdRegiao  '+
                'Where P.cdPessoa = E.cdPessoa and P.cdPessoa = C.cdPessoa and P.cdPessoa = :CDPESSOA ';
    Parameters.ParamByName('CDPESSOA').Value := EdtCdCliente.Text;
    open;
    if FieldByName('Existir').AsString = 'F' then
      vcdpessoa := 'F'
    else
      vcdpessoa := 'J';
    if vPAFECF then
      FrmRelOrcamentos.LblDenoDest.Caption := 'Nome: ' + FieldByName('cdPessoa').AsString + ' - ' + FieldByName('nmPessoa').AsString
    else
      FrmRelOrcamentos.QrlCliente.Caption  := FieldByName('cdPessoa').AsString + ' - ' + FieldByName('nmPessoa').AsString;
    if UPPERCASE(vEmpresa) = 'CARIOCA' then // carioca n quer q imprima os dados do cliente
    begin
      FrmRelOrcamentos.QrlEndereco.Caption := ' ';
      FrmRelOrcamentos.QrlCep.Caption      := ' ';
      FrmRelOrcamentos.QrlCidade.Caption   := ' ';
      FrmRelOrcamentos.QrlBairro.Caption   := ' ';
      FrmRelOrcamentos.QrlComp.Caption     := ' ';
      FrmRelOrcamentos.QrlUf.Caption       := 'UF: ';
    end else
    begin
      FrmRelOrcamentos.QrlEndereco.Caption := FieldByName('nmLogradouro').AsString;
      if FieldByName('nrNumero').AsString <> '' then
        FrmRelOrcamentos.QrlEndereco.Caption := FrmRelOrcamentos.QrlEndereco.Caption + ', '+ FieldByName('nrNumero').AsString;
      FrmRelOrcamentos.QrlCep.Caption      := FieldByName('dsCep').AsString;
      FrmRelOrcamentos.QrlCidade.Caption   := FieldByName('dsCidade').AsString;
      FrmRelOrcamentos.QrlBairro.Caption   := FieldByName('dsBairro').AsString;
      FrmRelOrcamentos.QrlComp.Caption     := FieldByName('dsComplemento').AsString;
      FrmRelOrcamentos.QrlUf2.Caption      := FieldByName('dsUf').AsString;
      FrmRelOrcamentos.QreRota2.Caption    := FieldByName('dsRegiao').AsString;
    end;
    //FrmRelOrcamentos.QRLabel21.Caption   := FormatFloat('0.00',StrToFloat(EdtTotal.Text) - StrToFloat(EdtSubTotal.Text));
    Sql.Text := 'Select distinct nmTelefone From Telefone WITH (NOLOCK) '+
                'Where cdPessoa = :CDPESSOA ';
    Parameters.ParamByName('CDPESSOA').Value := EdtCdCliente.Text;
    open;
    FrmRelOrcamentos.QrlTelefone.Caption := FieldByName('nmTelefone').AsString;
    if vcdpessoa = 'F' then
    begin
      Sql.Text := 'Select dsCpf,dsIdentidade,dsNaturalidade from P_fisica '+
                  'WITH (NOLOCK) Where cdPessoa = '+ EdtCdCliente.Text +' ';
      Open;
      FrmRelOrcamentos.rlApelido.Caption := ' - ' +FieldByName('dsnaturalidade').AsString;
      FrmRelOrcamentos.QrlCPF.Caption := 'CPF/CNPJ: ' + FieldByName('dsCpf').AsString;
      FrmRelOrcamentos.QrlRG.Caption  := 'RG/IE: ' + FieldByName('dsIdentidade').AsString;
      if vPAFECF then
        FrmRelOrcamentos.RLLCNPJ_Dest.Caption := 'CPF/CNPJ: ' + FieldByName('dsCpf').AsString;
    end else
    begin
      Sql.Text := 'Select CGC,dsInscricaoEstadual from P_Juridica WITH (NOLOCK) '+
                  'Where cdPessoa = '+ EdtCdCliente.Text +'       ';
      Open;
      FrmRelOrcamentos.QrlCPF.Caption :=  'CPF/CNPJ: ' + FieldByName('CGC').AsString;
      FrmRelOrcamentos.QrlRG.Caption  :=  'RG/IE: ' + FieldByName('dsInscricaoEstadual').AsString;
      if vPAFECF then
        FrmRelOrcamentos.RLLCNPJ_Dest.Caption := 'CPF/CNPJ: ' + FieldByName('CGC').AsString;
    end;
    if UPPERCASE(vEmpresa) = 'CARIOCA' then // carioca n quer q imprima os dados do cliente
    begin
      FrmRelOrcamentos.QrlCPF.Caption :=  'CPF/CNPJ: ';
      FrmRelOrcamentos.QrlRG.Caption  :=  'RG/IE: ';
    end;
  end;
  FrmRelOrcamentos.AdoQryOrcamento.Parameters.ParamByName('nrOrcamento').value := EdtLancto.Text;
  FrmRelOrcamentos.AdoQryOrcamento.open;
  if (UPPERCASE(vEmpresa) = 'TELESOM') then
    FrmRelOrcamentos.QrlDtHR.Caption := DateToStr(DateOf(FrmRelOrcamentos.AdoQryOrcamento.fieldByName('hrHora').AsDateTime))
  else
    FrmRelOrcamentos.QrlDtHR.Caption := FrmRelOrcamentos.AdoQryOrcamento.fieldByName('hrHora').AsString;
  FrmRelOrcamentos.AdoQryOrcamento.close;
  if vPAFECF then
  begin
    if RgOpcoes.ItemIndex = 0 then
      FrmRelOrcamentos.QRLblTitulo2.Caption := '**Pré-Venda**'
    else if RgOpcoes.ItemIndex = 1 then
    begin
      if vOrcamento = 'O' then
        FrmRelOrcamentos.QRLblTitulo2.Caption := '**Orçamento**'
      else if vOrcamento = 'N' then
        FrmRelOrcamentos.QRLblTitulo2.Caption := '**Pré-Venda**'
    end else
    if RgOpcoes.ItemIndex = 2 then
      FrmRelOrcamentos.QRLblTitulo2.Caption := '**Orçamento**'
    else if RgOpcoes.ItemIndex = 4 then
      FrmRelOrcamentos.QRLblTitulo2.Caption := '**Simples Remessa**';
  end else
  begin
    if RgOpcoes.ItemIndex = 0 then
      FrmRelOrcamentos.QRLblTitulo.Caption := '**Pré-Venda**'
    else
    if RgOpcoes.ItemIndex = 1 then
    begin
      if vOrcamento = 'O' then
        FrmRelOrcamentos.QRLblTitulo.Caption := '**Orçamento**'
      else if vOrcamento = 'N' then
        FrmRelOrcamentos.QRLblTitulo.Caption := '**Pré-Venda**'
    end else
    if RgOpcoes.ItemIndex = 2 then
      FrmRelOrcamentos.QRLblTitulo.Caption := '**Orçamento**'
    else if RgOpcoes.ItemIndex = 4 then
      FrmRelOrcamentos.QRLblTitulo.Caption := '**Simples Remessa**';
    if CbPrevisao.Checked = True then
      FrmRelOrcamentos.QRLblPrevisao.Caption := 'Previsão de Entrega: ' + DateToStr(DtLancto.Date)
    else
      FrmRelOrcamentos.QRLblPrevisao.Enabled := False;
  end;
  if (UPPERCASE(vEmpresa) = 'LLPARAFUSOS') then
  begin
     FrmRelOrcamentos.QRLblTitulo.Caption := '**Orçamento**';
     FrmRelOrcamentos.QRMdRel.PrintDialog := True;
  end;
  FrmRelOrcamentos.QrlCnpj.Caption := 'CNPJ: ' +
  FrmRelOrcamentos.ADOQryConfig.FieldByName('dsCgc').AsString + '     I.E.: ' +
  FrmRelOrcamentos.ADOQryConfig.FieldByName('dsInscricao').AsString;
  case valor of
    0 : frmRelOrcamentos.RlblFormaPgto.Caption := 'Forma Pgto: a vista';
    1 : frmRelOrcamentos.RlblFormaPgto.Caption := 'Forma Pgto: a prazo';
    2 : frmRelOrcamentos.RlblFormaPgto.Caption := 'Forma Pgto: cartao a vista';
    3 : frmRelOrcamentos.RlblFormaPgto.Caption := 'Forma Pgto: cartao parcelado';
    4 : frmRelOrcamentos.RlblFormaPgto.Caption := 'Forma Pgto: cheque pré';
    5 : frmRelOrcamentos.RlblFormaPgto.Caption := 'Forma Pgto: entrada + prazo';
    6 : frmRelOrcamentos.RlblFormaPgto.Caption := 'Forma Pgto: entrada + cartao';
    7 : frmRelOrcamentos.RlblFormaPgto.Caption := 'Forma Pgto: entrada + ch pré';
    12 : frmRelOrcamentos.RlblFormaPgto.Caption := 'Forma Pgto: Cheque a Vista';
    13 : frmRelOrcamentos.RlblFormaPgto.Caption := 'Forma Pgto: Cartão Débito';
    14: frmRelOrcamentos.RlblFormaPgto.Caption := 'Forma Pgto: Depósito em Conta';
    15: frmRelOrcamentos.RlblFormaPgto.Caption := 'Forma Pgto: Boleto Bancário';
  else
    frmRelOrcamentos.RlblFormaPgto.Caption := 'Forma Pgto: a vista';
  end;
//  case vCasasQtd of   // preco de venda
//    0: frmRelOrcamentos.QREQtd.DisplayMask := '#,##0';
//    1: frmRelOrcamentos.QREQtd.DisplayMask := '#,##0.0';
//    2: frmRelOrcamentos.QREQtd.DisplayMask := '#,##0.00';
//    3: frmRelOrcamentos.QREQtd.DisplayMask := '#,##0.000';
//    4: frmRelOrcamentos.QREQtd.DisplayMask := '#,##0.0000';
//    5: frmRelOrcamentos.QREQtd.DisplayMask := '#,##0.00000';
//  end; // case
//  case vCasasPreco of   // preco de venda
//    1:
//    begin
//      frmRelOrcamentos.QREPreco.DisplayMask := '#,##0.0';
//      frmRelOrcamentos.RLDBResult3.DisplayMask := '#,##0.0';
//    end;
//    2:
//    begin
//      frmRelOrcamentos.QREPreco.DisplayMask := '#,##0.00';
//      frmRelOrcamentos.RLDBResult3.DisplayMask := '#,##0.00';
//    end;
//    3:
//    begin
//      frmRelOrcamentos.QREPreco.DisplayMask := '#,##0.000';
//      frmRelOrcamentos.RLDBResult3.DisplayMask := '#,##0.000';
//    end;
//    4:
//    begin
//      frmRelOrcamentos.QREPreco.DisplayMask := '#,##0.0000';
//      frmRelOrcamentos.RLDBResult3.DisplayMask := '#,##0.0000';
//    end;
//    5:
//    begin
//      frmRelOrcamentos.QREPreco.DisplayMask := '#,##0.00000';
//      frmRelOrcamentos.RLDBResult3.DisplayMask := '#,##0.00000';
//    end;
//  end; //case
//  if valor <> 10 then  //só imprime o campo memo se vir a impressão a partir do formulário q solicita forma de pagamento
  if(vMemo <> nil) then
    FrmRelOrcamentos.RLMemo1.Lines := vMemo.lines;
  if vTipoImp = '1' then
  begin
    FrmRelOrcamentos.QrMdRel.Preview;
    FrmRelOrcamentos.Free;
  end else
  begin
    try
      //FrmRelOrcamentos.QrMdRel.Print
      //FrmRelOrcamentos.QRMdRel.Printdialog := True;
      //coloca a impressao como default DOS para as empresas que imprime em matricial
      if vTipoImpressora = '' then
        FrmRelOrcamentos.QrMdRel.DefaultFilter:= FrmRelOrcamentos.Qualidade_Dos
      else
        FrmRelOrcamentos.QrMdRel.DefaultFilter:= frmRelOrcamentos.Padrao;
      //imprime na impressora jato e lase ou matricial
      if vTipoImpressora = 'S' then
      begin
         FrmRelOrcamentos.QrMdRel.PageSetup.PaperHeight := 297;
         FrmRelOrcamentos.QrMdRel.PageSetup.PaperWidth := 210;
      end else
      begin
         FrmRelOrcamentos.QrMdRel.PageSetup.PaperHeight := 140;
         FrmRelOrcamentos.QrMdRel.PageSetup.PaperWidth := 210;
      end;
      if (vPrintSetup = 'S') then
      begin
        FrmRelOrcamentos.QrMdRel.DefaultFilter := FrmRelOrcamentos.Padrao;
        FrmRelOrcamentos.QrMdRel.PrintDialog := true;
        if (Trim(vQtdPrint) <> '') then
        begin
          for i := 1 to StrToInt(vQtdPrint)do
          begin
            FrmRelOrcamentos.QrMdRel.DefaultFilter:= FrmRelOrcamentos.Padrao;
            FrmRelOrcamentos.QrMdRel.Print;
          end;
        end else
          FrmRelOrcamentos.QrMdRel.Print;
      end else
      begin
        if (Trim(vQtdPrint) <> '') then
        begin
          for i := 1 to StrToInt(vQtdPrint) do
          begin
            FrmRelOrcamentos.QrMdRel.DefaultFilter := FrmRelOrcamentos.Padrao;
            FrmRelOrcamentos.QrMdRel.PrintDialog := false;
            FrmRelOrcamentos.QrMdRel.Print;
          end;
        end else
          FrmRelOrcamentos.QrMdRel.Print;
      end;
      FrmRelOrcamentos.Free;
    except
      Exit;
//      Application.OnMessage := FormPrincipal.ProcessaMsg;

      //Limpar_Tela;
      //RgOpcoes.ItemIndex := 0;
    end;
  end;
end;

procedure TFrmPrincipalPreVenda.ImprimeOrcamentoAmbiente(valor: integer);
var
  vcdpessoa : String[01];
  i :  integer;
  varQtdItens : Integer;
begin
  // Imprime Somente o Orçamento
  if vPAFECF and ((vOrcamento = 'N') or (RgOpcoes.ItemIndex = 0)) then
    Exit;
  if vMemo.Text <> '' then begin
    if MessageDlg('Imprimir o campo OBSERVAÇÃO?',mtConfirmation,[mbYes,mbNo],0) = mrNO then
      vMemo.Clear;
  end;
  frmRelOrcamentosAmbiente := TFrmRelOrcamentosAmbiente.Create(Self); // Cria o formulário
  { Se for HOSPITALAR troco a coluna de Prateleira por Lote. }
{  if vAutoPecas = 'H' then begin
    frmRelOrcamentosAmbiente.RLLabel5.Caption:= 'Lote';
    frmRelOrcamentosAmbiente.RLLabel13.Caption:= 'Lote';
    frmRelOrcamentosAmbiente.rlDbText2.DataField:= 'nrLote';
  end;
  if vPAFECF then begin
    frmRelOrcamentosAmbiente.RLBand1.Height  := 0;
    frmRelOrcamentosAmbiente.RLBPAF.Height   := 132;
    frmRelOrcamentosAmbiente.RLBand3.Height  := 109;
    frmRelOrcamentosAmbiente.RLBand3.Borders.DrawBottom := True;
    frmRelOrcamentosAmbiente.RLBand3.Borders.DrawLeft   := True;
    frmRelOrcamentosAmbiente.RLBand3.Borders.DrawRight  := True;
    //frmRelOrcamentosAmbiente.RLBand2.Borders.DrawLeft   := True;
    //frmRelOrcamentosAmbiente.RLBand2.Borders.DrawRight  := True;
//    frmRelOrcamentos.QRLabel5.Caption := '';
  end else begin
    frmRelOrcamentosAmbiente.RLBand1.Height := 175;
    frmRelOrcamentosAmbiente.RLBPAF.Height  := 0;
    frmRelOrcamentosAmbiente.RLBand3.Height := 92;
//    FrmRelOrcamentos.RLDraw12.visible := False;
  end;
  varQtdItens := StrToIntDef(edtQtdItens.Text,0);
  if (varQtdItens > 13) then
    //if MessageDlg('Imprimir em meia folha?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
      frmRelOrcamentosAmbiente.QrMdRel.PageSetup.PaperHeight := 297;
  // FrmRelOrcamentos.QryRelDados.Active := True;
  }
  With frmRelOrcamentosAmbiente.ADOQuery2 do
  begin
    Close;
    sql.Text := 'SELECT P.nmPessoa,T.nmProduto,T.dsProdutoNota,T.dsReferencia,O.cdPessoa,                         '+
                'O.nrOrcamento,O.cdCliente,I.cdProduto,O.dtEmissao,I.NrQtd,I.vlPreco,                             '+
                'O.nrDesconto,T.dsUnidade,T.dsPrateleira, I.cdAmbiente, A.dsAmbiente                              '+
                'FROM Orcamento O WITH (nolock),Pessoa P WITH (nolock),                                           '+
                'Produto T WITH (nolock),IteOrcamento I WITH (nolock),                                            '+
                '     Ambiente A WITH (NOLOCK)                                                                    '+
                'WHERE O.nrOrcamento = :nrOrcamento And P.cdPessoa = O.cdPessoa And T.cdProduto = I.cdProduto And '+
                'O.cdPessoa = P.cdPessoa And I.dsSituacao = '''' And A.cdAmbiente =* I.cdAmbiente                 '+
                'and O.nrOrcamento = I.nrOrcamento                                                                '+
              //  'group by I.cdAmbiente, P.nmPessoa,T.nmProduto,T.dsProdutoNota,T.dsReferencia,O.cdPessoa,         '+
              //  'O.nrOrcamento,O.cdCliente,I.cdProduto,O.dtEmissao,I.NrQtd,I.vlPreco,                             '+
              //  'O.nrDesconto,T.dsUnidade,T.dsPrateleira, A.dsAmbiente                                            '+
                'order by A.dsAmbiente,I.cdAmbiente, T.dsPrateleira                                               ';
    Parameters.ParamByName('nrOrcamento').value := EdtLancto.Text;
    Open;
  end;

  if vOcultaReferenciaNaImpressao then
  begin
    frmRelOrcamentosAmbiente.RLLabel1.Visible  := false;
    frmRelOrcamentosAmbiente.RLDBText1.Visible := false;
    frmRelOrcamentosAmbiente.QRLabel6.left     := frmRelOrcamentosAmbiente.RLLabel1.left;
    frmRelOrcamentosAmbiente.QREDescricao.left := frmRelOrcamentosAmbiente.RLLabel1.left;
  end;
  with frmRelOrcamentosAmbiente.ADOQryCliente do
  begin
    Sql.Text := 'Select Distinct P.cdPessoa,P.nmPessoa,E.dsUf,E.nmLogradouro,E.dsBairro,      '+
                'E.dsCidade,E.dsCep,P.Existir,E.dsUF,E.dsComplemento,E.nrNumero,C.dsPrevenda  '+
                'From Pessoa P WITH (NOLOCK),Endereco E WITH (NOLOCK),Cliente C WITH (NOLOCK) '+
                'Where P.cdPessoa = E.cdPessoa and P.cdPessoa = C.cdPessoa and P.cdPessoa = :CDPESSOA';
    Parameters.ParamByName('CDPESSOA').Value := EdtCdCliente.Text;
    open;
    if FieldByName('Existir').AsString = 'F' then
      vcdpessoa := 'F'
    else
      vcdpessoa := 'J';
//    if vPAFECF then
//      frmRelOrcamentosAmbiente.LblDenoDest.Caption := 'Nome: ' + FieldByName('cdPessoa').AsString + ' - ' + FieldByName('nmPessoa').AsString
//    else
      frmRelOrcamentosAmbiente.QrlCliente.Caption  := FieldByName('cdPessoa').AsString + ' - ' + FieldByName('nmPessoa').AsString;

    frmRelOrcamentosAmbiente.QrlEndereco.Caption := FieldByName('nmLogradouro').AsString;
    if FieldByName('nrNumero').AsString <> '' then
      frmRelOrcamentosAmbiente.QrlEndereco.Caption := frmRelOrcamentosAmbiente.QrlEndereco.Caption + ', '+ FieldByName('nrNumero').AsString;
    frmRelOrcamentosAmbiente.QrlCep.Caption      := FieldByName('dsCep').AsString;
    frmRelOrcamentosAmbiente.QrlCidade.Caption   := FieldByName('dsCidade').AsString;
    frmRelOrcamentosAmbiente.QrlBairro.Caption   := FieldByName('dsBairro').AsString;
    frmRelOrcamentosAmbiente.QrlComp.Caption     := FieldByName('dsComplemento').AsString;
    frmRelOrcamentosAmbiente.QrlUf2.Caption      := FieldByName('dsUf').AsString;
    //FrmRelOrcamentos.QRLabel21.Caption   := FormatFloat('0.00',StrToFloat(EdtTotal.Text) - StrToFloat(EdtSubTotal.Text));
    Sql.Text := 'Select distinct nmTelefone From Telefone WITH (NOLOCK) '+
                'Where cdPessoa = :CDPESSOA ';
    Parameters.ParamByName('CDPESSOA').Value := EdtCdCliente.Text;
    open;
    frmRelOrcamentosAmbiente.QrlTelefone.Caption := FieldByName('nmTelefone').AsString;
    if vcdpessoa = 'F' then begin
      Sql.Text := 'Select dsCpf,dsIdentidade,dsNaturalidade from P_fisica '+
                  'WITH (NOLOCK) Where cdPessoa = '+ EdtCdCliente.Text +' ';
      Open;
      frmRelOrcamentosAmbiente.rlApelido.Caption := ' - ' +FieldByName('dsnaturalidade').AsString;
      frmRelOrcamentosAmbiente.QrlCPF.Caption := 'CPF/CNPJ: ' + FieldByName('dsCpf').AsString;
      frmRelOrcamentosAmbiente.QrlRG.Caption  := 'RG/IE: ' + FieldByName('dsIdentidade').AsString;
//      if vPAFECF then
//        frmRelOrcamentosAmbiente.RLLCNPJ_Dest.Caption := 'CPF/CNPJ: ' + FieldByName('dsCpf').AsString;
    end else begin
      Sql.Text := 'Select CGC,dsInscricaoEstadual from P_Juridica WITH (NOLOCK) '+
                  'Where cdPessoa = '+ EdtCdCliente.Text +'       ';
      Open;
      frmRelOrcamentosAmbiente.QrlCPF.Caption :=  'CPF/CNPJ: ' + FieldByName('CGC').AsString;
      frmRelOrcamentosAmbiente.QrlRG.Caption  :=  'RG/IE: ' + FieldByName('dsInscricaoEstadual').AsString;
//      if vPAFECF then
//        frmRelOrcamentosAmbiente.RLLCNPJ_Dest.Caption := 'CPF/CNPJ: ' + FieldByName('CGC').AsString;
    end;
  end;
  frmRelOrcamentosAmbiente.AdoQryOrcamento.Parameters.ParamByName('nrOrcamento').value := EdtLancto.Text;
  frmRelOrcamentosAmbiente.AdoQryOrcamento.open;
  frmRelOrcamentosAmbiente.QrlDtHR.Caption := frmRelOrcamentosAmbiente.AdoQryOrcamento.fieldByName('hrHora').AsString;
  frmRelOrcamentosAmbiente.AdoQryOrcamento.close;

{  if vPAFECF then begin
    if RgOpcoes.ItemIndex = 0 then
      frmRelOrcamentosAmbiente.QRLblTitulo2.Caption := '**Pré-Venda**'
    else if RgOpcoes.ItemIndex = 1 then begin
      if vOrcamento = 'O' then
        frmRelOrcamentosAmbiente.QRLblTitulo2.Caption := '**Orçamento**'
      else if vOrcamento = 'N' then
        frmRelOrcamentosAmbiente.QRLblTitulo2.Caption := '**Pré-Venda**'
    end else if RgOpcoes.ItemIndex = 2 then
      frmRelOrcamentosAmbiente.QRLblTitulo2.Caption := '**Orçamento**';
  end else begin
  }
    if RgOpcoes.ItemIndex = 0 then
      frmRelOrcamentosAmbiente.QRLblTitulo.Caption := '**Pré-Venda**'
    else if RgOpcoes.ItemIndex = 1 then begin
      if vOrcamento = 'O' then
        frmRelOrcamentosAmbiente.QRLblTitulo.Caption := '**Orçamento**'
      else if vOrcamento = 'N' then
        frmRelOrcamentosAmbiente.QRLblTitulo.Caption := '**Pré-Venda**'
    end else if RgOpcoes.ItemIndex = 2 then
      frmRelOrcamentosAmbiente.QRLblTitulo.Caption := '**Orçamento**';
    if CbPrevisao.Checked = True then
      frmRelOrcamentosAmbiente.QRLblPrevisao.Caption := 'Previsão de Entrega: ' + DateToStr(DtLancto.Date)
    else
      frmRelOrcamentosAmbiente.QRLblPrevisao.Enabled := False;
//  end;
  frmRelOrcamentosAmbiente.QrlCnpj.Caption := 'CNPJ: ' +
  frmRelOrcamentosAmbiente.ADOQryConfig.FieldByName('dsCgc').AsString + '     I.E.: ' +
  frmRelOrcamentosAmbiente.ADOQryConfig.FieldByName('dsInscricao').AsString;
  case valor of
    0 : frmRelOrcamentosAmbiente.RlblFormaPgto.Caption := 'Forma Pgto: a vista';
    1 : frmRelOrcamentosAmbiente.RlblFormaPgto.Caption := 'Forma Pgto: a prazo';
    2 : frmRelOrcamentosAmbiente.RlblFormaPgto.Caption := 'Forma Pgto: cartao a vista';
    3 : frmRelOrcamentosAmbiente.RlblFormaPgto.Caption := 'Forma Pgto: cartao parcelado';
    4 : frmRelOrcamentosAmbiente.RlblFormaPgto.Caption := 'Forma Pgto: cheque pré';
    5 : frmRelOrcamentosAmbiente.RlblFormaPgto.Caption := 'Forma Pgto: entrada + prazo';
    6 : frmRelOrcamentosAmbiente.RlblFormaPgto.Caption := 'Forma Pgto: entrada + cartao';
    7 : frmRelOrcamentosAmbiente.RlblFormaPgto.Caption := 'Forma Pgto: entrada + ch pré';
    8 : frmRelOrcamentosAmbiente.RlblFormaPgto.Caption := 'Forma Pgto: Cheque a Vista';
    9 : frmRelOrcamentosAmbiente.RlblFormaPgto.Caption := 'Forma Pgto: Cartão Débito';
    10: frmRelOrcamentosAmbiente.RlblFormaPgto.Caption := 'Forma Pgto: Deposito Bancario';
  else
    frmRelOrcamentosAmbiente.RlblFormaPgto.Caption := 'Forma Pgto: a vista';
  end;
  case vCasasQtd of   // preco de venda
    0: frmRelOrcamentosAmbiente.QREQtd.DisplayMask := '#,##0';
    1: frmRelOrcamentosAmbiente.QREQtd.DisplayMask := '#,##0.0';
    2: frmRelOrcamentosAmbiente.QREQtd.DisplayMask := '#,##0.00';
    3: frmRelOrcamentosAmbiente.QREQtd.DisplayMask := '#,##0.000';
    4: frmRelOrcamentosAmbiente.QREQtd.DisplayMask := '#,##0.0000';
    5: frmRelOrcamentosAmbiente.QREQtd.DisplayMask := '#,##0.00000';
  end; // case
  case vCasasPreco of   // preco de venda
    1: begin
      frmRelOrcamentosAmbiente.QREPreco.DisplayMask := '#,##0.0';
      frmRelOrcamentosAmbiente.RLDBResult3.DisplayMask := '#,##0.0';
    end;
    2: begin
      frmRelOrcamentosAmbiente.QREPreco.DisplayMask := '#,##0.00';
      frmRelOrcamentosAmbiente.RLDBResult3.DisplayMask := '#,##0.00';
    end;
    3: begin
      frmRelOrcamentosAmbiente.QREPreco.DisplayMask := '#,##0.000';
      frmRelOrcamentosAmbiente.RLDBResult3.DisplayMask := '#,##0.000';
    end;
    4: begin
      frmRelOrcamentosAmbiente.QREPreco.DisplayMask := '#,##0.0000';
      frmRelOrcamentosAmbiente.RLDBResult3.DisplayMask := '#,##0.0000';
    end;
    5: begin
      frmRelOrcamentosAmbiente.QREPreco.DisplayMask := '#,##0.00000';
      frmRelOrcamentosAmbiente.RLDBResult3.DisplayMask := '#,##0.00000';
    end;
  end; //case
//  if valor <> 10 then  //só imprime o campo memo se vir a impressão a partir do formulário q solicita forma de pagamento
  if(vMemo <> nil) then
    frmRelOrcamentosAmbiente.RLMemo1.Lines := vMemo.lines;

  if vTipoImp = '' then begin
    frmRelOrcamentosAmbiente.RLReport1.print;
    frmRelOrcamentosAmbiente.Free;
  end else begin
    try
      //FrmRelOrcamentos.QrMdRel.Print
      //FrmRelOrcamentos.QRMdRel.Printdialog := True;
      //coloca a impressao como default DOS para as empresas que imprime em matricial
      if vTipoImpressora = '' then
        frmRelOrcamentosAmbiente.RLReport1.DefaultFilter:= frmRelOrcamentosAmbiente.Qualidade_Dos;
 //     else
 //      frmRelOrcamentosAmbiente.QrMdRel.DefaultFilter:= frmRelOrcamentosAmbiente.Padrao;
      //imprime na impressora jato e lase ou matricial
      if vTipoImpressora = 'S' then begin
         frmRelOrcamentosAmbiente.RLReport1.PageSetup.PaperHeight:= 297;
         frmRelOrcamentosAmbiente.RLReport1.PageSetup.PaperWidth:= 210;
      end else begin
         frmRelOrcamentosAmbiente.RLReport1.PageSetup.PaperHeight:= 140;
         frmRelOrcamentosAmbiente.RLReport1.PageSetup.PaperWidth:= 210;
      end;
      if (vPrintSetup = 'S') then
      begin
       // frmRelOrcamentosAmbiente.QrMdRel.DefaultFilter:= frmRelOrcamentosAmbiente.Padrao;
        frmRelOrcamentosAmbiente.RLReport1.PrintDialog:= true;
        if (Trim(vQtdPrint) <> '') then begin
          for i := 1 to StrToInt(vQtdPrint)do begin
          //  frmRelOrcamentosAmbiente.QrMdRel.DefaultFilter:= frmRelOrcamentosAmbiente.Padrao;
  //          if vPAFECF = False then
              frmRelOrcamentosAmbiente.RLReport1.Print;
          end;
        end
        else
          frmRelOrcamentosAmbiente.RLReport1.Print;
      end
      else begin
  //      if vPAFECF = False then
  //      if (Trim(vQtdPrint) <> '') and (vQtdPrint <> '1')  then begin
        if (Trim(vQtdPrint) <> '') then begin
          for i := 1 to StrToInt(vQtdPrint) do begin
           // frmRelOrcamentosAmbiente.QrMdRel.DefaultFilter := frmRelOrcamentosAmbiente.Padrao;
            frmRelOrcamentosAmbiente.RLReport1.PrintDialog := false;
  //          if vPAFECF = False then
              frmRelOrcamentosAmbiente.RLReport1.Print;
          end;
        end
        else
          frmRelOrcamentosAmbiente.RLReport1.Print;
      end;
      frmRelOrcamentosAmbiente.Free;
    except
      Exit;
//      Application.OnMessage := FormPrincipal.ProcessaMsg;

      //Limpar_Tela;
      //RgOpcoes.ItemIndex := 0;
    end;
  end;
end;

{$REGION 'Impressão do orçamento da PBFARMA'}
procedure TFrmPrincipalPrevenda.ImprimeOrcamentoPBFARMA(indexRadioGroupFormaPgto_ : integer; observacao:string='');
var
  vcdpessoa : String[01];
  i :  integer;
  varQtdItens : Integer;
begin
  //ImprimeOrcamento(indexRadioGroupFormaPgto_);

  // Imprime Somente o Orçamento
  if vPAFECF and ((vOrcamento = 'N') or (RgOpcoes.ItemIndex = 0)) then
    Exit;
  if vMemo.Text <> '' then
  begin
    if MessageDlg('Imprimir o campo OBSERVAÇÃO?',mtConfirmation,[mbYes,mbNo],0) = mrNO then
       vMemo.Clear;
  end;
  frmRelOrcamentosPB:= TfrmRelOrcamentosPB.Create(Self); // Cria o formulário
  { Se for HOSPITALAR troco a coluna de Prateleira por Lote. }
  if usarLoteValidade = True then
  begin
    FrmRelOrcamentosPB.RLLabel5.Caption:= 'Lote';
    FrmRelOrcamentosPB.RLLabel13.Caption:= 'Lote';
    FrmRelOrcamentosPB.rlDbText2.DataField:= 'nrLote';
  end;
  if vPAFECF then
  begin
    FrmRelOrcamentosPB.RLBand1.Height:= 0;
    FrmRelOrcamentosPB.RLBPAF.Height:= 132;
    FrmRelOrcamentosPB.RLBand3.Height:= 109;
    FrmRelOrcamentosPB.RLBand3.Borders.DrawBottom:= True;
    FrmRelOrcamentosPB.RLBand3.Borders.DrawLeft:= True;
    FrmRelOrcamentosPB.RLBand3.Borders.DrawRight:= True;
    FrmRelOrcamentosPB.RLBand2.Borders.DrawLeft:= True;
    FrmRelOrcamentosPB.RLBand2.Borders.DrawRight:= True;
//    FrmRelOrcamentosPB.QRLabel5.Caption := '';
  end else begin
    //FrmRelOrcamentosPB.RLBand1.Height:= 159;
    FrmRelOrcamentosPB.RLBand1.Height:= 257;
    FrmRelOrcamentosPB.RLBPAF.Height:= 0;
    //FrmRelOrcamentosPB.RLBand3.Height:= 92;
//    FrmRelOrcamentosPB.RLDraw12.visible := False;
  end;
  varQtdItens:= StrToIntDef(edtQtdItens.Text,0);
  if (varQtdItens > 13) then
    //if MessageDlg('Imprimir em meia folha?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
      FrmRelOrcamentosPB.QrMdRel.PageSetup.PaperHeight:= 297;
  // FrmRelOrcamentosPB.QryRelDados.Active := True;
  With FrmRelOrcamentosPB.ADOQryRelDados do
  begin
    Parameters.ParamByName('DSLANCAMENTO').Value:= EdtLancto.Text;
    Open;
  end;
  if vOcultaReferenciaNaImpressao then
  begin
    FrmRelOrcamentosPB.RLLabel1.Visible:= false;
    FrmRelOrcamentosPB.RLDBText1.Visible:= false;
    FrmRelOrcamentosPB.QRLabel6.left:= FrmRelOrcamentosPB.RLLabel1.left;
    FrmRelOrcamentosPB.QREDescricao.left:= FrmRelOrcamentosPB.RLLabel1.left;
  end;
  with FrmRelOrcamentosPB.ADOQryCliente do
  begin
    Sql.Text:= 'Select Distinct P.cdPessoa,P.nmPessoa,E.dsUf,E.nmLogradouro,E.dsBairro,      '+
               'E.dsCidade,E.dsCep,P.Existir,E.dsUF,E.dsComplemento,E.nrNumero,C.dsPrevenda  '+
               'From Pessoa P WITH (NOLOCK),Endereco E WITH (NOLOCK),Cliente C WITH (NOLOCK) '+
               'Where P.cdPessoa = E.cdPessoa and P.cdPessoa = C.cdPessoa and P.cdPessoa = :CDPESSOA';
    Parameters.ParamByName('CDPESSOA').Value:= EdtCdCliente.Text;
    open;
    if FieldByName('Existir').AsString = 'F' then
      vcdpessoa:= 'F'
    else
      vcdpessoa:= 'J';
    if vPAFECF then
      FrmRelOrcamentosPB.LblDenoDest.Caption:= 'Nome: ' + FieldByName('cdPessoa').AsString + ' - ' + FieldByName('nmPessoa').AsString
    else
      FrmRelOrcamentosPB.QrlCliente.Caption:= FieldByName('cdPessoa').AsString + ' - ' + FieldByName('nmPessoa').AsString;
    FrmRelOrcamentosPB.QrlEndereco.Caption:= FieldByName('nmLogradouro').AsString;
    if FieldByName('nrNumero').AsString <> '' then
      FrmRelOrcamentosPB.QrlEndereco.Caption:= FrmRelOrcamentosPB.QrlEndereco.Caption + ', '+ FieldByName('nrNumero').AsString;
    FrmRelOrcamentosPB.QrlCep.Caption:= FieldByName('dsCep').AsString;
    FrmRelOrcamentosPB.QrlCidade.Caption:= FieldByName('dsCidade').AsString;
    FrmRelOrcamentosPB.QrlBairro.Caption:= FieldByName('dsBairro').AsString;
    FrmRelOrcamentosPB.QrlComp.Caption:= FieldByName('dsComplemento').AsString;
    FrmRelOrcamentosPB.QrlUf2.Caption:= FieldByName('dsUf').AsString;
    //FrmRelOrcamentosPB.QRLabel21.Caption   := FormatFloat('0.00',StrToFloat(EdtTotal.Text) - StrToFloat(EdtSubTotal.Text));
    Sql.Text:= 'Select distinct nmTelefone From Telefone WITH (NOLOCK) '+
                'Where cdPessoa = :CDPESSOA ';
    Parameters.ParamByName('CDPESSOA').Value:= EdtCdCliente.Text;
    open;
    FrmRelOrcamentosPB.QrlTelefone.Caption:= FieldByName('nmTelefone').AsString;
    if vcdpessoa = 'F' then
    begin
      Sql.Text:= 'Select dsCpf,dsIdentidade,dsNaturalidade from P_fisica '+
                  'WITH (NOLOCK) Where cdPessoa = '+ EdtCdCliente.Text +' ';
      Open;
      FrmRelOrcamentosPB.rlApelido.Caption:= ' - ' +FieldByName('dsnaturalidade').AsString;
      FrmRelOrcamentosPB.QrlCPF.Caption:= 'CPF/CNPJ: ' + FieldByName('dsCpf').AsString;
      FrmRelOrcamentosPB.QrlRG.Caption:= 'RG/IE: ' + FieldByName('dsIdentidade').AsString;
      if vPAFECF then
        FrmRelOrcamentosPB.RLLCNPJ_Dest.Caption:= 'CPF/CNPJ: ' + FieldByName('dsCpf').AsString;
    end else begin
      Sql.Text:= 'Select CGC,dsInscricaoEstadual from P_Juridica WITH (NOLOCK) '+
                  'Where cdPessoa = '+ EdtCdCliente.Text +'       ';
      Open;
      FrmRelOrcamentosPB.QrlCPF.Caption:=  'CPF/CNPJ: ' + FieldByName('CGC').AsString;
      FrmRelOrcamentosPB.QrlRG.Caption:=  'RG/IE: ' + FieldByName('dsInscricaoEstadual').AsString;
      if vPAFECF then
        FrmRelOrcamentosPB.RLLCNPJ_Dest.Caption:= 'CPF/CNPJ: ' + FieldByName('CGC').AsString;
    end;
  end;
  FrmRelOrcamentosPB.AdoQryOrcamento.Parameters.ParamByName('nrOrcamento').value := EdtLancto.Text;
  FrmRelOrcamentosPB.AdoQryOrcamento.open;
  FrmRelOrcamentosPB.QrlDtHR.Caption := FrmRelOrcamentosPB.AdoQryOrcamento.fieldByName('hrHora').AsString;
  FrmRelOrcamentosPB.AdoQryOrcamento.close;

  if vPAFECF then begin
    if RgOpcoes.ItemIndex = 0 then
      FrmRelOrcamentosPB.QRLblTitulo2.Caption:= '**Pré-Venda**'
    else if RgOpcoes.ItemIndex = 1 then begin
      if vOrcamento = 'O' then
        FrmRelOrcamentosPB.QRLblTitulo2.Caption:= '**Orçamento**'
      else if vOrcamento = 'N' then
        FrmRelOrcamentosPB.QRLblTitulo2.Caption:= '**Pré-Venda**'
    end else if RgOpcoes.ItemIndex = 2 then
      FrmRelOrcamentosPB.QRLblTitulo2.Caption:= '**Orçamento**';
  end else begin
    if RgOpcoes.ItemIndex = 0 then
      FrmRelOrcamentosPB.QRLblTitulo.Caption:= '**Pré-Venda**'
    else if RgOpcoes.ItemIndex = 1 then begin
      if vOrcamento = 'O' then
        FrmRelOrcamentosPB.QRLblTitulo.Caption:= '**Orçamento**'
      else if vOrcamento = 'N' then
        FrmRelOrcamentosPB.QRLblTitulo.Caption:= '**Pré-Venda**'
    end else if RgOpcoes.ItemIndex = 2 then
      FrmRelOrcamentosPB.QRLblTitulo.Caption:= '**Orçamento**';
    if CbPrevisao.Checked = True then
      FrmRelOrcamentosPB.QRLblPrevisao.Caption:= 'Previsão de Entrega: ' + DateToStr(DtLancto.Date)
    else
      FrmRelOrcamentosPB.QRLblPrevisao.Enabled:= False;
  end;
  FrmRelOrcamentosPB.QrlCnpj.Caption:= 'CNPJ: ' +
  FrmRelOrcamentosPB.ADOQryConfig.FieldByName('dsCgc').AsString + '     Insc. Estadual: ' +
  FormatMaskText('00.000.000-00;0;\',FrmRelOrcamentosPB.ADOQryConfig.FieldByName('dsInscricao').AsString);
  case indexRadioGroupFormaPgto_ of
    0 : FrmRelOrcamentosPB.RlblFormaPgto.Caption:= 'Forma Pgto: a vista';
    1 : FrmRelOrcamentosPB.RlblFormaPgto.Caption:= 'Forma Pgto: a prazo';
    2 : FrmRelOrcamentosPB.RlblFormaPgto.Caption:= 'Forma Pgto: cartao a vista';
    3 : FrmRelOrcamentosPB.RlblFormaPgto.Caption:= 'Forma Pgto: cartao parcelado';
    4 : FrmRelOrcamentosPB.RlblFormaPgto.Caption:= 'Forma Pgto: cheque pré';
    5 : FrmRelOrcamentosPB.RlblFormaPgto.Caption:= 'Forma Pgto: entrada + prazo';
    6 : FrmRelOrcamentosPB.RlblFormaPgto.Caption:= 'Forma Pgto: entrada + cartao';
    7 : FrmRelOrcamentosPB.RlblFormaPgto.Caption:= 'Forma Pgto: entrada + ch pré';
    8 : FrmRelOrcamentosPB.RlblFormaPgto.Caption:= 'Forma Pgto: Cheque a Vista';
    9 : FrmRelOrcamentosPB.RlblFormaPgto.Caption:= 'Forma Pgto: Cartão Débito';
    10: FrmRelOrcamentosPB.RlblFormaPgto.Caption:= 'Forma Pgto: Deposito Bancario';
  else
    FrmRelOrcamentosPB.RlblFormaPgto.Caption:= 'Forma Pgto: a vista';
  end;
  FrmRelOrcamentosPB.QREQtd.DisplayMask:= getFormato(vCasasQtd);
  FrmRelOrcamentosPB.QREPreco.DisplayMask:= getFormato(vCasasPreco);
  FrmRelOrcamentosPB.QRETotal.DisplayMask:= '0.00';
  FrmRelOrcamentosPB.RLMemo1.Lines.Add(observacao);
  if(vMemo <> nil) then
    FrmRelOrcamentosPB.RLMemo1.Lines.AddStrings(vMemo.lines);
  if vTipoImp = '1' then begin
    FrmRelOrcamentosPB.QrMdRel.PreviewModal;
    FrmRelOrcamentosPB.Free;
  end else begin
    try

      { coloca a impressao como default DOS para as empresas que imprime em matricial. }
      if vTipoImpressora = '' then
        FrmRelOrcamentosPB.QrMdRel.DefaultFilter:= FrmRelOrcamentosPB.DOS;
//      else
//        FrmRelOrcamentosPB.QrMdRel.DefaultFilter:= FrmRelOrcamentosPB.Padrao;

      { imprime na impressora jato e lase ou matricial. }
      if vTipoImpressora = 'S' then begin
        FrmRelOrcamentosPB.QrMdRel.PageSetup.PaperHeight:= 297;
        FrmRelOrcamentosPB.QrMdRel.PageSetup.PaperWidth:= 210;
      end else begin
        FrmRelOrcamentosPB.QrMdRel.PageSetup.PaperHeight:= 140;
        FrmRelOrcamentosPB.QrMdRel.PageSetup.PaperWidth:= 210;
      end;
      if (vOrcamento = 'O') and not(transformarOrcamentoPrevenda) then
        FrmRelOrcamentosPB.QrMdRel.PreviewModal
      else
      if (vPrintSetup = 'S') then
      begin
        //FrmRelOrcamentosPB.QrMdRel.DefaultFilter:= FrmRelOrcamentosPB.Padrao;
        FrmRelOrcamentosPB.QrMdRel.PrintDialog:= true;
        if (Trim(vQtdPrint) <> '') then
        begin
          for i := 1 to StrToInt(vQtdPrint) do
          begin
            //FrmRelOrcamentosPB.QrMdRel.DefaultFilter:= FrmRelOrcamentosPB.Padrao;
            FrmRelOrcamentosPB.QrMdRel.Print;
          end;
        end
        else
          FrmRelOrcamentosPB.QrMdRel.Print;
      end
      else
      begin
        if (Trim(vQtdPrint) <> '') then
        begin
          for i := 1 to StrToInt(vQtdPrint) do
          begin
            //FrmRelOrcamentosPB.QrMdRel.DefaultFilter:= FrmRelOrcamentosPB.Padrao;
            FrmRelOrcamentosPB.QrMdRel.PrintDialog:= false;
            FrmRelOrcamentosPB.QrMdRel.Print;
          end;
        end
        else FrmRelOrcamentosPB.QrMdRel.Print;
      end;
      FrmRelOrcamentosPB.Free;
    except
      Exit;
    end;
  end;
end;
{$ENDREGION}

procedure TFrmPrincipalPreVenda.CbxNomeChange(Sender: TObject);
begin
// ** Claudio 10-09-2015
//  if CbxNome.ItemIndex <> -1 then
//  begin
//    ADOQryNome.Open;
//    ADOQryNome.Locate('nmPessoa',CbxNome.Text,[]);
//    EdtCdNome.Text := ADOQryNome.FieldbyName('cdPessoa').AsString;
//  end
//  else
//    EdtCdNome.Clear;
  //vnmVendedor := CbxNome.Text;
end;

procedure TFrmPrincipalPreVenda.BtnAprazoClick(Sender: TObject);
begin
  if (isDescontoValido(prevenda) = false) and (StrToFloatDef(EdtDesconto.Text,0) = 0) then begin
    Application.OnMessage := NaoProcessaMsg;
    ShowMessage('Já foi concedido desconto no(s) iten(s) selecionado(s).');
    EdtConsulta.SelectAll;
    EdtConsulta.SetFocus;
    Application.OnMessage:= ProcessaMsg;
    Exit;
  end;

  if vBloqueiaDesconto = True then begin
    Application.OnMessage := NaoProcessaMsg;
    MessageDlg('Esta pré-venda contém um ou mais produtos com o preço alterado no cadastro, não sendo possível dar desconto.',mtWarning,[mbOk],0);
    Application.OnMessage := ProcessaMsg;
    Exit;
  end;
  if trim(sgDados.Cells[0, 1]) = '' then // so poderá dar desconto quando tiver algum item pelo menos
  begin
    Application.OnMessage := NaoProcessaMsg;
    ShowMessage('O desconto só é permitido quando este lançamento possuir pelo menos um ítem!');
    EdtConsulta.SelectAll;
    EdtConsulta.SetFocus;
    Application.OnMessage:= ProcessaMsg;
    EdtDesconto.Text := '0,00';
    Exit;
  end;


  // VERIFICA SE EXISTE ALGUM PRODUTO EM PROMOÇÃO (itepromocao.dspromocao)
  if vProdutoPromocao = 'S' then begin
    Application.OnMessage:= NaoProcessaMsg;
    if (UpperCase(vEmpresa) = 'NACIONAL') then begin
      ShowMessage('Esta pré-venda contém produtos em promoção, portanto não será possível dar desconto!');
      EdtDesconto.Text:= LimpaEdtDesconto;
      EdtDesconto.ReadOnly:= true;
      EdtSubTotal.ReadOnly:= true;
      EdtConsulta.SetFocus;
    end else begin
      //ShowMessage('Esta pré-venda contém produtos que estão em promoção, cuidado com o desconto!');
      EdtDesconto.ReadOnly := False;
      EdtSubTotal.ReadOnly := False;
      EdtDesconto.SetFocus;
    end;
    Application.OnMessage := ProcessaMsg;
  end else begin
    EdtDesconto.ReadOnly := False;
    EdtSubTotal.ReadOnly := False;
    EdtDesconto.SetFocus;
  end;
end;

Procedure TFrmPrincipalPreVenda.LimpaGrid;
var I, C: Integer;
begin
//  For I := 1 to SgDados.RowCount do  //limpa grid Pecas
//    for C:=0 to SgDados.ColCount do
//      SgDados.Cells[C,I] := '';
//  SgDados.RowCount:=2;
//  SgDados.Refresh;

  Limpa_Grid(SgDados);
  ocultarExclamacao;
  tipoForro := '';
  edtQtdItens.text := '0,00';
  limparArrayBoolean(arrayLinhasDestacadas,0,299,False);
end;

Procedure TFrmPrincipalPreVenda.LimpaGrid(var prevenda : TPrevenda);
var I, C: Integer;
begin
//  For I := 1 to SgDados.RowCount do  //limpa grid Pecas
//    for C:=0 to SgDados.ColCount do
//      SgDados.Cells[C,I] := '';
//  SgDados.RowCount:=2;
//  SgDados.Refresh;
  EdtSubTotal.Text := '0,00';
  EdtDesconto.Text := LimpaEdtDesconto;
  EdtTotal.Text    := '0,00';
  edtValorBruto.text := '0,00';
  if prevenda <> nil then
      FreeAndNil(prevenda);
  Limpa_Grid(SgDados);
  ocultarExclamacao;
  tipoForro := '';
  edtQtdItens.text := '0,00';
  limparArrayBoolean(arrayLinhasDestacadas,0,299,False);
end;

Procedure TFrmPrincipalPreVenda.LimpaGrid2(Grid:TStringGrid; comeco: integer);
var I, C: Integer;
begin
  With Grid do begin
    for I := comeco downto 1 do
      Rows[I].Clear;
  end;
end;

procedure TFrmPrincipalPreVenda.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if Application.MessageBox('Tem certeza que deseja sair da Pré-Venda?',
      'Confirmação',MB_ICONEXCLAMATION + Mb_YesNo) = IdNo then CanClose := False
  else begin
    if prevenda <> nil then
      DesbloqueiaAlteracaoPreVenda(prevenda.numeroPrevenda);
    DModulo.adoThread.Cancel;
    DModulo.ConexaoThread.Cancel;
    //ExitProcess(0);
    TerminateProcess( getCurrentProcess, 0 );
    Halt;
  end;
end;

procedure TFrmPrincipalPreVenda.BtnSairClick(Sender: TObject);
var
  wndHandle : THandle;
  wndClass  : array[0..50] of Char;
begin
  if MessageDlg('Tem certeza que deseja sair da Pré-Venda?',mtConfirmation,[mbYes,mbNo],0)
    = mrYes then begin
    //********* esconde a barra
    StrPCopy(@wndClass[0],'Shell_TrayWnd');
    wndHandle := FindWindow(@wndClass[0], nil);
    ShowWindow(wndHandle, SW_RESTORE);
    //*********
    Application.Terminate
  end
  else begin
    EdtConsulta.SelectAll;
    EdtConsulta.SetFocus;
  end;
end;

Procedure TFrmPrincipalPreVenda.AtualizaQryConsulta;
begin
  With AdoSPConsulta do begin
{    Close;
    Parameters.ParamByName('@DSATIVO').Value := 'S';
    if CheckBox1.Checked = false then
      Parameters.ParamByName('@DSATIVO').Value := Null;
    Parameters.ParamByName('@ATACADOVAREJO').Value := vAtacadoVarejo;
    //Parameters.ParamByName('@CLIENTE').Value := EdtCdCliente.Text;
    //Parameters.ParamByName('@TABELAPRECO').Value := 'S';
    Case CmbConsulta.ItemIndex of
      0: begin
        if EdtConsulta.Text <> '' then
          Parameters.ParamByName('@CDPRODUTO').Value  := StrToInt(EdtConsulta.Text)
        else
          Parameters.ParamByName('@CDPRODUTO').Value  := EdtConsulta.Text;
        Parameters.ParamByName('@NMPRODUTO').Value    := Null;
        Parameters.ParamByName('@DSREFERENCIA').Value := Null;
        Parameters.ParamByName('@CDCODIGODIC').Value  := Null;
        Parameters.ParamByName('@NMGRUPO').Value      := Null;
        Parameters.ParamByName('@NMPRODUTO2').Value   := Null;
        Parameters.ParamByName('@C_BARRAS').Value     := Null;
        Parameters.ParamByName('@LANCAMENTO').Value   := Null;
        Parameters.ParamByName('@PESSOA').Value       := Null;
      end;
      1: begin
        Parameters.ParamByName('@CDPRODUTO').Value    := Null;
        Parameters.ParamByName('@NMPRODUTO').Value    := EdtConsulta.Text;
        Parameters.ParamByName('@DSREFERENCIA').Value := Null;
        Parameters.ParamByName('@CDCODIGODIC').Value  := Null;
        Parameters.ParamByName('@NMGRUPO').Value      := Null;
        Parameters.ParamByName('@NMPRODUTO2').Value   := Null;
        Parameters.ParamByName('@C_BARRAS').Value     := Null;
        Parameters.ParamByName('@LANCAMENTO').Value   := Null;
        Parameters.ParamByName('@PESSOA').Value       := Null;
      end;
      2: begin
        Parameters.ParamByName('@CDPRODUTO').Value    := Null;
        Parameters.ParamByName('@NMPRODUTO').Value    := Null;
        Parameters.ParamByName('@DSREFERENCIA').Value := EdtConsulta.Text;
        Parameters.ParamByName('@CDCODIGODIC').Value  := NULL;
        Parameters.ParamByName('@NMGRUPO').Value      := Null;
        Parameters.ParamByName('@NMPRODUTO2').Value   := Null;
        Parameters.ParamByName('@C_BARRAS').Value     := Null;
        Parameters.ParamByName('@LANCAMENTO').Value   := Null;
        Parameters.ParamByName('@PESSOA').Value       := Null;
      end;
      3: begin
        Parameters.ParamByName('@CDPRODUTO').Value    := Null;
        Parameters.ParamByName('@NMPRODUTO').Value    := Null;
        Parameters.ParamByName('@DSREFERENCIA').Value := NUll;
        Parameters.ParamByName('@CDCODIGODIC').Value  := EdtConsulta.Text;
        Parameters.ParamByName('@NMGRUPO').Value      := Null;
        Parameters.ParamByName('@NMPRODUTO2').Value   := Null;
        Parameters.ParamByName('@C_BARRAS').Value     := Null;
        Parameters.ParamByName('@LANCAMENTO').Value   := Null;
        Parameters.ParamByName('@PESSOA').Value       := Null;
      end;
      4: begin
        Parameters.ParamByName('@CDPRODUTO').Value    := Null;
        Parameters.ParamByName('@NMPRODUTO').Value    := Null;
        Parameters.ParamByName('@DSREFERENCIA').Value := Null;
        Parameters.ParamByName('@CDCODIGODIC').Value  := NULL;
        Parameters.ParamByName('@NMGRUPO').Value      := EdtConsulta.Text;
        Parameters.ParamByName('@NMPRODUTO2').Value   := Null;
        Parameters.ParamByName('@C_BARRAS').Value     := Null;
        Parameters.ParamByName('@LANCAMENTO').Value   := Null;
        Parameters.ParamByName('@PESSOA').Value       := Null;
      end;
      5: begin
        Parameters.ParamByName('@CDPRODUTO').Value    := Null;
        Parameters.ParamByName('@NMPRODUTO').Value    := Null;
        Parameters.ParamByName('@DSREFERENCIA').Value := Null;
        Parameters.ParamByName('@CDCODIGODIC').Value  := NULL;
        Parameters.ParamByName('@NMGRUPO').Value      := Null;
        if LblEspecificacao.Caption <> 'Localizar especificação contendo: ' then
          Parameters.ParamByName('@DSREFERENCIA').Value := Copy(LblEspecificacao.Caption,35,length(LblEspecificacao.Caption))
         else
          Parameters.ParamByName('@DSREFERENCIA').Value := null;
        Parameters.ParamByName('@NMPRODUTO2').Value := EdtConsulta.Text;
        Parameters.ParamByName('@C_BARRAS').Value   := Null;
        Parameters.ParamByName('@LANCAMENTO').Value := Null;
        Parameters.ParamByName('@PESSOA').Value     := Null;
      end;
    end; //case
    Case CmbConsulta.ItemIndex of
      0: Parameters.ParamByName('@OPCAO').Value   := '0'; // pesqisa por codigo do produto
      1,5: Parameters.ParamByName('@OPCAO').Value := '1';
      2: Parameters.ParamByName('@OPCAO').Value   := '2';
      3: Parameters.ParamByName('@OPCAO').Value   := '3';
      4: Parameters.ParamByName('@OPCAO').Value   := '4';
    end;}
    Close;
    if chkOcultarProdutosSemEstoque.Checked then
      Parameters.ParamByName('@OCULTARPRODUTOSEMESTOQUE').Value := 1
    else
      Parameters.ParamByName('@OCULTARPRODUTOSEMESTOQUE').Value := 0;
    if (vDescontoClienteAuto = True) then begin //se a opcao do configuracao tiver marcada
      Parameters.ParamByName('@DESCONTO').Value := TNEGCliente.getPercentualDoPrecoComDescontoDecimal(StrtoIntDef(EdtCdCliente.Text,0))
    end
    else
      Parameters.ParamByName('@DESCONTO').Value := 1;
    if CheckBox1.Checked = false then
      Parameters.ParamByName('@DSATIVO').Value := '%'
    else
      Parameters.ParamByName('@DSATIVO').Value := 'S';
    Parameters.ParamByName('@ATACADOVAREJO').Value := vAtacadoVarejo;
    if UPPERCASE(vEmpresa) = 'CHALOC' then
      Parameters.ParamByName('@BUSCAPARCIAL').Value := 0
    else
      Parameters.ParamByName('@BUSCAPARCIAL').Value := 1;
    if RadioGroup1.ItemIndex = 5 then
    begin
      Parameters.ParamByName('@PESQUISA').Value := Copy(LblEspecificacao.Caption,35,length(LblEspecificacao.Caption));
      Parameters.ParamByName('@PESQUISA2').Value:= EdtConsulta.Text;
    end
    else
    if RadioGroup1.ItemIndex <> 4 then  // diferente de codigo de barras
      Parameters.ParamByName('@PESQUISA').Value      := EdtConsulta.Text;
    Case RadioGroup1.ItemIndex of
      0: Parameters.ParamByName('@OPCAO').Value   := '0'; // pesqisa por codigo do produto
      1: Parameters.ParamByName('@OPCAO').Value   := '1'; // pesqisa por nome do produto OU CODIGO DE BARRAS
      2: Parameters.ParamByName('@OPCAO').Value   := '3'; // REFERENCIA FABRICA
      3: Parameters.ParamByName('@OPCAO').Value   := '2'; // REFERENCIA DE INTERNA
      4 :
      begin
        Parameters.ParamByName('@OPCAO').Value   := '7';
        if (Copy(EdtConsulta.Text,1,1) = '2') then  // codigo da balança
          Parameters.ParamByName('@PESQUISA').Value := Copy(EdtConsulta.Text,1,7)
        else begin
          if EdtConsulta.Text = '' then
            Parameters.ParamByName('@PESQUISA').Value      := -1
          else
            Parameters.ParamByName('@PESQUISA').Value      := EdtConsulta.Text;
        end;
      end;
      5: Parameters.ParamByName('@OPCAO').Value   := '5'; // ESPECIFICAÇÃO
      6: Parameters.ParamByName('@OPCAO').Value   := '4'; // CODIGO ADICIONAL
    end;
    ADOSPConsultaPreco.DisplayFormat   := '#0.00';  //ADD POR CLAUDIO
    ADOSPConsultaValor.DisplayFormat   := '#0.00';
    ADOSPConsultaEstoque.DisplayFormat := '#' + getFormato(vCasasQtd);
    ADOSPConsultaPedido.DisplayFormat  := '#0.00';
    if (UpperCase(vEmpresa) = 'BELAVISTA') then begin
      DBGrid1.Columns[IndexOfDbGrid(DBGrid1,'CÓDIGO_BARRAS')].Visible := False;      // oculta o codigo de barras
      DBGrid1.Columns[IndexOfDbGrid(DBGrid1,'DESCRIÇÃO')].Width := 350;          // aumenta a largura da coluna
    end;
    if (vAutoPecas = 'A') and (UpperCase(vEmpresa) <> 'TRATORMEC') then
      DBGrid1.Columns[IndexOfDbGrid(DBGrid1,'CÓDIGO_BARRAS')].Visible := False;
    Open;   // mostra os dados no dbgrid
    LblListados.Caption := 'Listados--> ' + IntToStr(RecordCount);
    EdtPreco.Text:= FormatFloatQ(vCasasPreco,FieldByName('Valor').AsFloat);
    if EdtCFOP.Visible = True then
      EdtCFOP.Text  := SugereCFOP;
    Label11.Text := '0,00';
    Label13.Text := '__/__/____';
  end;
end;

procedure TFrmPrincipalPreVenda.CheckBox1Click(Sender: TObject);
begin
  vFlag := '0';
  EdtConsulta.SelectAll;
  EdtConsulta.SetFocus;
  AtualizaQryConsulta;
end;

procedure TFrmPrincipalPreVenda.CheckBox1Enter(Sender: TObject);
begin
  if vflag = '1' then
    EdtConsulta.SetFocus;
end;

procedure TFrmPrincipalPreVenda.RadioGroup1Click(Sender: TObject);
var vIdent : String[20];
    I : Integer;
begin
  CmbConsulta.ItemIndex := RadioGroup1.ItemIndex;
  if RadioGroup1.ItemIndex = 5 then begin
    Application.OnMessage := NaoProcessaMsg;
    vIdent := InputBox('Localizar também pela especificação', 'Entre com o texto para pesquisa, ou pressione enter para continuar!', '');
    Application.OnMessage := ProcessaMsg;
    LblEspecificacao.Visible := true;
    LblEspecificacao.Caption := 'Localizar especificação contendo: ' + vIdent;
  end
  else
    LblEspecificacao.Visible := False;
  //EdtConsulta.Clear;
  EdtConsultaChange(self);
  EdtConsulta.SelectAll;
  EdtConsulta.SetFocus;
end;

procedure TFrmPrincipalPreVenda.EdtConsultaChange(Sender: TObject);
begin
  if (Radiogroup1.ItemIndex <> 4) then  // DIFERENTE DE CODIGO DE BARRAS
    AtualizaQryConsulta;
  if DBGrid1.Color = clBtnHighlight then;
    DBGrid1.Color := clInfoBk;
  if ADOSPConsulta.RecordCount > 0 then begin
    ConsultaReserva;
    if usarLoteValidade = True then
       montaComboLote;
    if (UpperCase(vEmpresa) = 'REZENDE') or (UpperCase(vEmpresa) = 'BELAVISTA') or (UpperCase(vEmpresa) = 'PROAUTO') or (UpperCase(vEmpresa) = 'NACIONAL') OR (UpperCase(vEmpresa) = 'PTINTAS') then
      Consulta_Deposito
    else if Label12.Visible = True then
      Consultapedidodecompra1.Click;
    if (UpperCase(vEmpresa) = 'PTINTAS') then
      Consultapedidodecompra1.Click;
  end;
end;

procedure TFrmPrincipalPreVenda.Banese1Click(Sender: TObject);
begin
  RadioGroup1.ItemIndex := 0;
end;

procedure TFrmPrincipalPreVenda.btnLogoffClick(Sender: TObject);
begin
//  Cancelar;
  Solicitar_Login('B');
end;

procedure TFrmPrincipalPreVenda.HiperCard1Click(Sender: TObject);
begin
  RadioGroup1.ItemIndex := 1;
end;

procedure TFrmPrincipalPreVenda.RedeCard1Click(Sender: TObject);
begin
  BtnConfirmar.Click;
end;

procedure TFrmPrincipalPreVenda.VisaNet1Click(Sender: TObject);
begin
  RadioGroup1.ItemIndex := 2;
end;

procedure TFrmPrincipalPreVenda.AmericanExpress1Click(Sender: TObject);
begin
  RadioGroup1.ItemIndex := 3;
end;

procedure TFrmPrincipalPreVenda.DescrioContendo1Click(Sender: TObject);
begin
  RadioGroup1.ItemIndex := 5;
end;

procedure TFrmPrincipalPreVenda.BtnMdPrimeiroClick(Sender: TObject);
begin
  ADOSPConsulta.First;
  EdtPreco.Text := FormatFloatQ(vCasasPreco, ADOSPConsulta.FieldByName('Valor').AsFloat);
  if EdtCFOP.Visible = True then //se tiver marcado no configuracao para exibir
    EdtCFOP.Text := SugereCFOP;
  if UpperCase(vEmpresa) = 'ODONTO' then
    label15.Text     := FormatFloat('0.00',PegaValorAtacado(AdoSpConsulta.FieldByName('código').asInteger));
  //ConsultaGarantia;
  ConsultaReserva;
  if usarLoteValidade = True then
  begin
     montaComboLote;
     setLabel23(QuantidadeDispEmLotes(ADOSPConsulta.FieldByName('Código').AsInteger));
  end;
  if (UpperCase(vEmpresa) = 'REZENDE')
      or (UpperCase(vEmpresa) = 'BELAVISTA')
      or (UpperCase(vEmpresa) = 'PROAUTO')
      or (UpperCase(vEmpresa) = 'NACIONAL')
      or (UpperCase(vEmpresa) = 'PTINTAS')
  then
    Consulta_Deposito
  else
    Consultapedidodecompra1Click(Sender);
  if (UpperCase(vEmpresa) = 'PTINTAS') then
    Consultapedidodecompra1.Click;
end;

procedure TFrmPrincipalPreVenda.BtnMdProximoClick(Sender: TObject);
begin
  ADOSPConsulta.Next;
  EdtPreco.Text := FormatFloatQ(vCasasPreco, ADOSPConsulta.FieldByName('Valor').AsFloat);
  if EdtCFOP.Visible = True then //se tiver marcado no configuracao para exibir
    EdtCFOP.Text := SugereCFOP;
  if UpperCase(vEmpresa) = 'ODONTO' then
    label15.Text     := FormatFloat('0.00',PegaValorAtacado(AdoSpConsulta.FieldByName('código').asInteger));
//  ConsultaGarantia;
  ConsultaReserva;
  if usarLoteValidade = True then
  begin
     montaComboLote;
     setLabel23(QuantidadeDispEmLotes(ADOSPConsulta.FieldByName('Código').AsInteger));
  end;
  if (UpperCase(vEmpresa) = 'REZENDE')
      or (UpperCase(vEmpresa) = 'BELAVISTA')
      or (UpperCase(vEmpresa) = 'PROAUTO')
      or (UpperCase(vEmpresa) = 'NACIONAL')
      or (UpperCase(vEmpresa) = 'PTINTAS')
  then
    Consulta_Deposito
  else
    Consultapedidodecompra1Click(Sender);
  if (UpperCase(vEmpresa) = 'PTINTAS') then
      Consultapedidodecompra1.Click;
end;

procedure TFrmPrincipalPreVenda.BtnMdAnteriorClick(Sender: TObject);
begin
  ADOSPConsulta.Prior;
  EdtPreco.Text := FormatFloatQ(vCasasPreco, ADOSPConsulta.FieldByName('Valor').AsFloat);
  if EdtCFOP.Visible = True then //se tiver marcado no configuracao para exibir
    EdtCFOP.Text := SugereCFOP;
  if UpperCase(vEmpresa) = 'ODONTO' then
    label15.Text     := FormatFloat('0.00',PegaValorAtacado(AdoSpConsulta.FieldByName('código').asInteger));
//  ConsultaGarantia;
  ConsultaReserva;
  if usarLoteValidade = True then
  begin
     montaComboLote;
     setLabel23(QuantidadeDispEmLotes(ADOSPConsulta.FieldByName('Código').AsInteger));
  end;
  if (UpperCase(vEmpresa) = 'REZENDE')
      or (UpperCase(vEmpresa) = 'BELAVISTA')
      or (UpperCase(vEmpresa) = 'PROAUTO')
      or (UpperCase(vEmpresa) = 'NACIONAL')
      or (UpperCase(vEmpresa) = 'PTINTAS')
  then
    Consulta_Deposito
  else
    Consultapedidodecompra1Click(Sender);
  if (UpperCase(vEmpresa) = 'PTINTAS') then
      Consultapedidodecompra1.Click;
end;

procedure TFrmPrincipalPreVenda.BtnMdUltimoClick(Sender: TObject);
begin
  ADOSPConsulta.Last;
  EdtPreco.Text := FormatFloatQ(vCasasPreco, ADOSPConsulta.FieldByName('Valor').AsFloat);
  if EdtCFOP.Visible = True then //se tiver marcado no configuracao para exibir
    EdtCFOP.Text := SugereCFOP;
  if UpperCase(vEmpresa) = 'ODONTO' then
    label15.Text     := FormatFloat('0.00',PegaValorAtacado(AdoSpConsulta.FieldByName('código').asInteger));
//  ConsultaGarantia;
  ConsultaReserva;
  if usarLoteValidade = True then
  begin
     montaComboLote;
     setLabel23(QuantidadeDispEmLotes(ADOSPConsulta.FieldByName('Código').AsInteger));
  end;
  if (UpperCase(vEmpresa) = 'REZENDE')
      or (UpperCase(vEmpresa) = 'BELAVISTA')
      or (UpperCase(vEmpresa) = 'PROAUTO')
      or (UpperCase(vEmpresa) = 'NACIONAL')
      or (UpperCase(vEmpresa) = 'PTINTAS')
  then
    Consulta_Deposito;
  //if (UpperCase(vEmpresa) = 'PTINTAS') then
      Consultapedidodecompra1.Click;
end;

procedure TFrmPrincipalPreVenda.DBGrid1CellClick(Column: TColumn);
begin
  EdtPreco.Text := FormatFloatQ(vCasasPreco, ADOSPConsulta.FieldByName('Valor').AsFloat);
  if EdtCFOP.Visible = True then //se tiver marcado no configuracao para exibir
    EdtCFOP.Text := SugereCFOP;
  if UpperCase(vEmpresa) = 'ODONTO' then
    label15.Text := FormatFloat('0.00',PegaValorAtacado(AdoSpConsulta.FieldByName('código').asInteger));
// ConsultaGarantia;
  ConsultaReserva;
  if usarLoteValidade = True then
  begin
     montaComboLote;
     setLabel23(QuantidadeDispEmLotes(ADOSPConsulta.FieldByName('Código').AsInteger));
  end;
  if (UpperCase(vEmpresa) = 'REZENDE')
      or (UpperCase(vEmpresa) = 'BELAVISTA')
      or (UpperCase(vEmpresa) = 'PROAUTO')
      or (UpperCase(vEmpresa) = 'NACIONAL')
      or (UpperCase(vEmpresa) = 'PTINTAS')
  then
    Consulta_Deposito
  else
    Consultapedidodecompra1Click(Self);
  if (UpperCase(vEmpresa) = 'PTINTAS') then
      Consultapedidodecompra1.Click;
  EdtConsulta.SelectAll;
  EdtConsulta.SetFocus;
end;

procedure TFrmPrincipalPreVenda.EdtDescontoKeyPress(Sender: TObject;
  var Key: Char);
begin
  ValidarNumero(Key);
  if (Key = Char(27)) then
    BtnCancelar.Click;
end;

procedure TFrmPrincipalPreVenda.DBGrid1DblClick(Sender: TObject);
begin
  EdtQtd.SetFocus;
end;

procedure TFrmPrincipalPreVenda.ConsultaProduto1Click(Sender: TObject);
begin
  //Géssica da Mega Móveis Noderste não quer q ninguém olhe essa tela de consulta
  //pois os funcionários dela estão olhando o preço de custo e etc...

  if (UPPERCASE(vEmpresa) = 'MEGA') then
  begin
    Application.OnMessage := FormPrincipal.NaoProcessaMsg;
    Messagedlg('Necessário permissão para executar esta ação.', mterror, [mbOk], 0);
    Application.OnMessage := FormPrincipal.ProcessaMsg;
    Exit;
  end;
   Application.OnMessage := FormPrincipal.NaoProcessaMsg;
    FrmConsultaProduto    := TFrmConsultaProduto.Create(Application);
    with ADOQryProduto do
    begin
      Sql.Text := 'Select vlcompra,nripi,nrfrete,nricms from produto WITH (NOLOCK) where cdproduto = :cdproduto';
      Parameters.ParamByName('cdproduto').Value := ADOSPConsulta.FieldByName('Código').AsString;
      Open;
    end;
    FrmConsultaProduto.LblCodigo.Caption     := ADOSPConsulta.FieldByName('Código').AsString;
    FrmConsultaProduto.LblBarras.Caption     := ADOSPConsulta.FieldByName('Código_Barras').AsString;
    FrmConsultaProduto.LblReferencia.Caption := ADOSPConsulta.FieldByName('Referência').AsString;
    FrmConsultaProduto.LblDescricao.Caption  := ADOSPConsulta.FieldByName('Descrição').AsString;
    FrmConsultaProduto.LblFabricante.Caption := ADOSPConsulta.FieldByName('Fabricante').AsString;
    FrmConsultaProduto.LblValor.Caption      := FormatFloat('#,##0.00',ADOSPConsulta.FieldByName('Valor').AsFloat);
    FrmConsultaProduto.LblCompra.Caption     := FormatFloat('#,##0.00',ADOQryProduto.FieldByName('vlCompra').AsFloat);
    FrmConsultaProduto.LblIPIR.Caption       := FormatFloat('0.00',ADOQryProduto.FieldByName('vlCompra').AsFloat * ADOQryProduto.fieldbyname('nrIpi').AsFloat/100);
    FrmConsultaProduto.LblICMSR.Caption      := FormatFloat('0.00',ADOQryProduto.FieldByName('vlCompra').AsFloat * ADOQryProduto.fieldbyname('nrIcms').AsFloat/100);
    FrmConsultaProduto.LblFreteR.Caption     := FormatFloat('0.00',ADOQryProduto.FieldByName('vlCompra').AsFloat * ADOQryProduto.fieldbyname('nrFrete').AsFloat/100);
    FrmConsultaProduto.LblTotal.Caption      := FormatFloat('0.00',StrToFloat(FrmConsultaProduto.LblCompra.Caption) + StrToFloat(FrmConsultaProduto.LblIpiR.Caption) +
                                                               StrToFloat(FrmConsultaProduto.LblIcmsR.Caption) + StrToFloat(FrmConsultaProduto.LblFreteR.Caption));
    FrmConsultaProduto.LblEstoque.Caption    := FormatFloat('#,##0.00',ADOSPConsulta.FieldByName('Estoque').AsFloat);
    FrmConsultaProduto.LblControle.Caption   := FormatFloat('#,##0.00',ADOSPConsulta.FieldByName('Pedido').AsFloat);
    FrmConsultaProduto.Position              := poMainFormCenter;
    Ativa := 'N';
//    if (cbxUsuario.ItemIndex < 0)OR(trim(EdtUsuario.Text) = '') then
//    begin
//      Application.OnMessage := FormPrincipal.NaoProcessaMsg;
//      Messagedlg('Informe usuário e senha!', mtWarning, [mbOk], 0);
//      cbxUsuario.SetFocus;
//      Application.OnMessage := FormPrincipal.ProcessaMsg;
//      Exit;
//    end
//    else
    if (Permissao('121','V', False) = 'N') then
    begin
      FrmConsultaProduto.PnlTotal.Visible:= False;
      FrmConsultaProduto.PnlCustoFinal.Visible:= False;
    end;
    FrmConsultaProduto.ShowModal;
    Application.OnMessage := FormPrincipal.ProcessaMsg;
end;

procedure TFrmPrincipalPreVenda.Help1Click(Sender: TObject);
begin
   RgOpcoes.ItemIndex := 0;
end;

procedure TFrmPrincipalPreVenda.Alterarpreodoproduto1Click(
  Sender: TObject);
begin
  if UpperCase(vEmpresa) = 'MEGA' then //a mega moveis não quer isso
    Exit;
  if vMudaPreco = 'N' then begin
    if not(EdtPreco.Enabled) then begin
      vFlag := '10';
      LiberaVanda; //< Se tiver permissão a varíável [vMudaPreco] fica, temporariamente, igual a 'S'
      if (vMudaPreco = 'S') then
      begin
        EdtPreco.Enabled    := True;
        EdtPreco.Color      :=  clWindow;
        if (UpperCase(vEmpresa) <> 'REZENDE') then begin  //< para a autopeças rezende n é p liberar o desconto
          EdtDescUnit.Enabled := True;
          EdtDescUnit.Color   :=  clWindow;
        end;
        EdtConsulta.SetFocus;
      end;
      vMudaPreco:= getVMudaPreco; //< Devolvo o valor que está na tabela [configuracao] à variável
    end else begin
       EdtPreco.Enabled := False;
       EdtPreco.Color := clInfoBk;
       EdtDescUnit.Enabled := False;
       EdtDescUnit.Color := clInfoBk;
       EdtConsulta.SetFocus;
    end;
  end;
end;

Procedure TFrmPrincipalPreVenda.RgOpcoesClick(Sender: TObject);
var
  vTexto : String;
  restrincaoFinanceira: TListaRestricao;
  possuiPermissaoParaAlterarPrevenda: Boolean;
begin
  if (intemIndexRgOpcoesOLD <> RgOpcoes.ItemIndex) and (UPPERCASE(vEmpresa)='TREVO') then begin
    cbxUsuario.Text := '';
    EdtUsuario.Text := '';
    edtLogin.Text := '';
  end;
  if (vMudaPreco = 'N') and (edtpreco.Enabled) then
  begin
    EdtPreco.Enabled := False;
    EdtPreco.Color := clInfoBk;
    EdtDescUnit.Enabled := False;
    EdtDescUnit.Color := clInfoBk;
    EdtConsulta.SetFocus;
  end;
  if (intemIndexRgOpcoesOLD = 1) and (intemIndexRgOpcoesOLD <> RgOpcoes.ItemIndex) then
    if prevenda <> nil then
      DesbloqueiaAlteracaoPreVenda(prevenda.numeroPrevenda);
  if (intemIndexRgOpcoesOLD = 2) and (intemIndexRgOpcoesOLD <> RgOpcoes.ItemIndex) and (vEstqNegativo <> 'S') and (StrToFloatDef(EdtSubTotal.Text,0) > 0) and (RgOpcoes.ItemIndex = 0) then begin // alterou o itemIndex de orçamento para prevenda
    Application.OnMessage := NaoProcessaMsg;
    MessageDlg('Por conta da diretiva de segurança definada no sistema, a grade com os ítens vai ser apagada para obedecer validações de pre-venda!',mtWarning,[mbOk],0);
    Application.OnMessage := ProcessaMsg;
    LimpaGrid(prevenda);
  end;
  if (vOpcoes = '1') and (RgOpcoes.ItemIndex in [0,2,4]) then // Se estiver fazendo uma pré-venda pode alterar para orçamento sem limpar os produtos
  begin
     CbxCliente.Enabled := True;
     Limpar_Tela;
     //CbxCliente.SetFocus;
//     CbxCliente.SetFocus;
//     CbxCliente.SelectAll;
  end
  else
  begin
    case RgOpcoes.ItemIndex of
      1:
      begin
        if MessageDlg('Deseja alterar uma Pré-Venda/Orçamento?',mtConfirmation,[mbYes,mbNo],0) = mrNO then begin
          RgOpcoes.ItemIndex := intemIndexRgOpcoesOLD;
          exit;
        end;
        if (UPPERCASE(vEmpresa)='TREVO') and (edtLogin.Text = '') then begin
          EdtLancto.Enabled := True;
          if Solicitar_Login('S') = False then begin
            RgOpcoes.ItemIndex := 0;
            Exit;
          end;
        end;
//        if (vSenha_Alteracao = 'X') then
//        begin
//          // vTexto := InputBox('Liberação para alteração', 'Digite senha que permite alterar as pré-vendas', '#');
//          CbxCliente.Enabled := False;
//          vFlag := '1';
//          LiberaVanda;
//          LimpaGrid;
//        end
//        else
        //begin

{A PEDIDO DA MEGA O TRECHO ABAIXO QUE SOLICITAVA PERMISSAO PARA ALTERAR ORCAMENTO FOI COMENTADO}
//        if FrmCancelamentoVenda.Possui_Permissao('820','A',cbxUsuario.Text,EdtUsuario.Text) then
          possuiPermissaoParaAlterarPrevenda := true;
//        else begin
//          FrmCancelamentoVenda:= TFrmCancelamentoVenda.Create(Self, '820', 'A', possuiPermissaoParaAlterarPrevenda);
//          FrmCancelamentoVenda.Copyright.Caption :=  '<<<<   Alteração de pré-venda    >>>>';
//          FrmCancelamentoVenda.showmodal;
//        end;

        if not possuiPermissaoParaAlterarPrevenda then begin
          if UPPERCASE(vEmpresa) = 'SANTANA' then
            RgOpcoes.ItemIndex := 2
          else
            RgOpcoes.ItemIndex := 0;
          exit;
        end;
        EdtLancto.Enabled:= True;
        EdtLancto.Color:= clWindow;
        EdtLancto.Text:= '';
        EdtLancto.ReadOnly:= False;
        EdtLancto.SetFocus;
        EdtCdNome.Text:= '';
        CbxNome.ItemIndex:= -1;
        CbxNome.text := '';
        EdtCdCliente.Text:= '';
        CbxCliente.ItemIndex:= -1;
        CbxCliente.Text:= '';
        CbxCliente.Enabled:= False;
        LimpaGrid(prevenda);
        //end;
        EdtSubTotal.Text   := '0,00';
        EdtDesconto.Text   := LimpaEdtDesconto;
        EdtTotal.Text      := '0,00';
        edtValorBruto.text := '0,00';
        edtQtdItens.Text   := '0';
      end;
      0,2,4:
      begin
//        EdtConsulta.SetFocus;
        CbxCliente.Enabled := True;
        if (RgOpcoes.ItemIndex = 0)and(clienteComRestricaoFinanceira(restrincaoFinanceira,EdtSubTotal.Text)) then
           CbxCliente.SetFocus
        else
           CbxCliente.SetFocus;
        CbxCliente.SelectAll;
//        if UpperCase( vEmpresa ) = 'DISCABOS' then
//          Limpar_Tela;
        //LimpaGrid(prevenda);
      end;
      3:
      begin
        if (UpperCase( vEmpresa ) = 'AMBIENTAR')OR(UpperCase( vEmpresa ) = 'PBFARMA') then
        begin
          if FrmCancelamentoVenda.Possui_Permissao('820','A',cbxUsuario.Text,EdtUsuario.Text) then
            possuiPermissaoParaAlterarPrevenda := true
          else begin
            FrmCancelamentoVenda:= TFrmCancelamentoVenda.Create(Self, '820', 'A', possuiPermissaoParaAlterarPrevenda);
            FrmCancelamentoVenda.Copyright.Caption :=  '<<<<   Alteração de pré-venda    >>>>';
            FrmCancelamentoVenda.showmodal;
          end;
          if (possuiPermissaoParaAlterarPrevenda) then //           if (vSenha_Alteracao = 'X') then
          begin
           //vTexto := InputBox('Liberação para alteração', 'Digite senha que permite alterar as pré-vendas', '#');
            FrmPrincipalPreVenda.Enabled := True;
            FrmPrincipalPreVenda.vUltimo_USUARIO := cbxUsuario.Text;
            FrmPrincipalPreVenda.Enabled := True;
            FrmPrincipalPreVenda.EdtLancto.Enabled:= True;
            FrmPrincipalPreVenda.EdtLancto.Color:= clBtnHighlight;
            FrmPrincipalPreVenda.EdtLancto.Text:= '';
            FrmPrincipalPreVenda.EdtLancto.ReadOnly:= False;
            FrmPrincipalPreVenda.EdtLancto.SetFocus;
            FrmPrincipalPreVenda.EdtCdNome.Text       := '';
            FrmPrincipalPreVenda.CbxNome.ItemIndex    := -1;
            FrmPrincipalPreVenda.EdtCdCliente.Text    := '';
            FrmPrincipalPreVenda.CbxCliente.ItemIndex := -1;
          end
          else
          begin
            EdtLancto.Enabled    := True;
            EdtLancto.Color      := clWindow;
            EdtLancto.Text       := '';
            EdtLancto.ReadOnly   := False;
            EdtLancto.SetFocus;
            EdtCdNome.Text       := '';
            CbxNome.ItemIndex    := -1;
            EdtCdCliente.Text    := '';
            CbxCliente.ItemIndex := -1;
            CbxCliente.Text      := '';
            CbxCliente.Enabled   := False;
          end;
        end
        else begin
          if vMatrizFilial = 'MATRIZ' then
            CbxCliente.Text  := 'Proauto Auto Peças (FILIAL) | 4427'
          else
            CbxCliente.Text  := 'Proauto Auto Peças (MATRIZ) | 4427';
          EdtCdCliente.Text  := '4427';
          CbxCliente.Enabled := False;
          EdtUsuario.SelectAll;
          CbxCliente.SetFocus;
  //        CbxCliente.Enabled := True;
  //        CbxCliente.SetFocus;
  //        CbxCliente.SelectAll;
        end;
      end;
    end;
  end;
  intemIndexRgOpcoesOLD := RgOpcoes.ItemIndex;
  if RgOpcoes.ItemIndex in [0,4] then        // incica q é uma pre-venda
    vOrcamento := 'N'
  else if RgOpcoes.ItemIndex = 2 then  // incica q é um orcamento
    vOrcamento := 'O';
  vOpcoes := IntToStr(RgOpcoes.ItemIndex);
  //Solicitar_Login;
end;

procedure TFrmPrincipalPreVenda.ro1Click(Sender: TObject);
begin
  Cancelar;
  Solicitar_Login;
end;

procedure TFrmPrincipalPreVenda.BloqueiaAlteracaoPreVenda(nrOrcamento: integer);
var Qry : TadoQuery;
begin
  if (vBloqueioPreVenda = true) or (vConferencia = true) then
  begin
    Qry := TAdoQuery.create(nil);
    Qry.Connection := DModulo.Conexao;
    with qry do
    begin
      try
        DModulo.Conexao.BeginTrans;
        sql.Text := 'update orcamento set dsEmUso = ''S'' where nrOrcamento = :nrOrcamento';//'update orcamento set dsImpresso = ''S'' where nrOrcamento = :nrOrcamento ';
        parameters.ParamByName('nrOrcamento').Value := nrOrcamento;
        ExecSQL;
        DModulo.Conexao.CommitTrans;
      except
        DModulo.Conexao.RollbackTrans;
      end;
    end;
  end;
end;

procedure TFrmPrincipalPreVenda.DesbloqueiaAlteracaoPreVenda(nrOrcamento: integer);
var Qry : TadoQuery;
begin
  if (vBloqueioPreVenda = true) or (vConferencia = true) then begin
    Qry := TAdoQuery.create(nil);
    Qry.Connection := DModulo.Conexao;
    with qry do begin
      try
        DModulo.Conexao.BeginTrans;
        sql.Text := 'update orcamento set dsEmUso = ''N'' where nrOrcamento = :nrOrcamento ';
        parameters.ParamByName('nrOrcamento').Value := nrOrcamento;
        ExecSQL;
        DModulo.Conexao.CommitTrans;
      except
        DModulo.Conexao.RollbackTrans;
      end;
    end;
  end;
end;

procedure TFrmPrincipalPreVenda.EdtLanctoEnter(Sender: TObject);
begin
  if (RgOpcoes.ItemIndex = 1) then
    if prevenda <> nil then
      DesbloqueiaAlteracaoPreVenda(prevenda.numeroPrevenda);
end;

procedure TFrmPrincipalPreVenda.EdtLanctoExit(Sender: TObject);
var I : integer;
    verificarDispEmEstoque, possuiPermissaoParaTransformarOrcamento,
    possuiPermissaoParaAlterarPrevenda: Boolean;
begin
  if (EdtLancto.Text = '') or (EdtLancto.Enabled = False) then
    exit;
  if RgOpcoes.ItemIndex = 1 then
  begin // com orçamento

      try
        prevenda := TNEGPrevenda.getPrevenda(StrToInt(EdtLancto.Text), true);
        prevenda.isAlteracao := true;
      except
        Messagedlg('Pré-Venda/Orçamento não encontrado!', mtInformation, [mbOk], 0);
        EdtLancto.Enabled := True;
        EdtLancto.Color := clWindow;
        EdtLancto.Text := '';
        EdtLancto.ReadOnly := False;
        EdtLancto.SetFocus;
        EdtCdNome.Text := '';
        CbxNome.ItemIndex := -1;
        EdtCdCliente.Text := '';
        CbxCliente.ItemIndex := -1;
        Exit;
      end;

      if (prevenda.emUso = 'S') and ((vConferencia = true)or(vBloqueioPreVenda = true)) then
      begin
        Application.OnMessage := NaoProcessaMsg;
        Application.messageBox('Pré-Venda/Orçamento já está em uso no caixa!','Atenção', mb_ok + MB_ICONWARNING + MB_APPLMODAL);
        prevenda := nil;
        EdtLancto.SetFocus;
        EdtLancto.SelectAll;
        Application.OnMessage := ProcessaMsg;
        Exit;
      end;

      if (prevenda.conferida) then
      begin
        Application.OnMessage := NaoProcessaMsg;
        Application.messageBox('A conferência desta Pré-Venda/Orçamento será cancelada automaticamente ao salvar a alteração!','Atenção', mb_ok + MB_ICONWARNING + MB_APPLMODAL);
//        EdtLancto.SetFocus;
//        EdtLancto.SelectAll;
        Application.OnMessage := ProcessaMsg;
//        Exit;
      end;

      HabilitaDesabilitaDesconto;
      if (vBloqueioPreVenda = True) or (vConferencia = true) then
        BloqueiaAlteracaoPreVenda(StrToInt(EdtLancto.text));
      vOrcamento   := prevenda.dsImpresso;
      if (vOrcamento<>'O')  then // (vSenha_Alteracao = 'X')and
      begin
        LimpaGrid;
      end;
      vObs := prevenda.observacao;
      if UpperCase(IntToStr(prevenda.vendedor.codigo)) <> Trim(EdtCdNome.Text) then
      begin
        EdtCdNome.Text := IntToStr(prevenda.vendedor.codigo);
        CbxNome.Text   := prevenda.vendedor.nome;
        //edtusuario.Clear;
      end;
      if prevenda.isOrcamento then
        vOrcamento := 'O'
      else
        vOrcamento := 'N';
      CbxNome.Enabled := false;
      // Pega o cliente
      EdtCdCliente.Text := IntToStr(prevenda.Cliente.codigo);
      ADOQryCliente.Open;
      ADOQryCliente.Locate('cdPessoa',EdtCdCliente.Text,[]);
      CbxCliente.ItemIndex:= CbxCliente.Items.IndexOf(ADOQryCliente.FieldbyName('nmPessoa').AsString + ' | ' + ADOQryCliente.FieldbyName('cdPessoa').AsString);
      PegaClienteAtacadoVarejo;
      vUF_Cliente       := ADOQryCliente.FieldbyName('dsUF').AsString;
      // pega o número de itens
      edtQtdItens.Text       := IntToStr(prevenda.itens.Count);
      // Montar a grid dos produtos
      //ADOQryProcura.Prior;
      if vCasasPreco > vLimiteCasasPreco then
        EdtDesconto.Text := FormatFloat('0.00000',prevenda.descontoPercentual)
      else
        EdtDesconto.Text := FormatFloat('0.00',prevenda.descontoPercentual);
      EdtTotal.Text      := '0,00';
      edtValorBruto.text := '0,00';
      EdtSubTotal.Text   := '0,00';
      //SgDados.RowCount       := ADOQryProcura.RecordCount + 1;  // adiciona linhas a string
      AtualizaCombProduto;  // pega o nome do produto
      verificarDispEmEstoque := False;
      transformarOrcamentoPrevenda := False;
      if (vOrcamento = 'O')  then
      begin  // se for orcamento preguntar se ele vai transormar em pre-venda
        Application.OnMessage := FrmPrincipalPreVenda.NaoProcessaMsg;
        if MessageDlg('Este orçamento será transformado em Pre Venda?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
        begin

{A PEDIDO DA MEGA O TRECHO ABAIXO QUE SOLICITAVA PERMISSAO PARA ALTERAR ORCAMENTO FOI COMENTADO}
          if UpperCase(vEmpresa) <> 'MEGA' then begin
            if FrmCancelamentoVenda.Possui_Permissao('831','V',cbxUsuario.Text,EdtUsuario.Text) then
              possuiPermissaoParaTransformarOrcamento := true
            else
            begin
              FrmCancelamentoVenda:= TFrmCancelamentoVenda.Create(Self, '831', 'V', possuiPermissaoParaTransformarOrcamento);
              FrmCancelamentoVenda.Copyright.Caption :=  '<<<<   Transformar orçamento em pré-venda    >>>>';
              FrmCancelamentoVenda.showmodal;
            end;
            if (not possuiPermissaoParaTransformarOrcamento) then
            begin
              Application.OnMessage := NaoProcessaMsg;
              Application.messageBox('Necessário permissão para executar esta ação.','Atenção', mb_ok + MB_ICONWARNING + MB_APPLMODAL);
              EdtLancto.Clear;
              EdtLancto.SetFocus;
              EdtLancto.SelectAll;
              Application.OnMessage := ProcessaMsg;
              Exit;
            end;
          end;
          transformarOrcamentoPrevenda:= True;
          if (vEstqNegativo <> 'S') then
            verificarDispEmEstoque := True;
        end else
        begin
          LimpaGrid;
          if (vOrcamento = 'N') and (vEstqNegativo <> 'S') then
             verificarDispEmEstoque := True;
        end;
        Application.OnMessage := FrmPrincipalPreVenda.ProcessaMsg;
      end else if (vOrcamento = 'N') then begin
        if FrmCancelamentoVenda.Possui_Permissao('820','A',cbxUsuario.Text,EdtUsuario.Text) then
          possuiPermissaoParaAlterarPrevenda := true
        else begin
          FrmCancelamentoVenda:= TFrmCancelamentoVenda.Create(Self, '820', 'A', possuiPermissaoParaAlterarPrevenda);
          FrmCancelamentoVenda.Copyright.Caption :=  '<<<<   Alteração de pré-venda    >>>>';
          FrmCancelamentoVenda.showmodal;
        end;
        if not possuiPermissaoParaAlterarPrevenda then begin
          if UPPERCASE(vEmpresa) = 'SANTANA' then
            RgOpcoes.ItemIndex := 2
          else
            RgOpcoes.ItemIndex := 0;
          exit;
        end;
        if (vEstqNegativo <> 'S') then
          verificarDispEmEstoque := True;
      end;
      i := 0;
      while i <= prevenda.itens.Count -1 do
      begin
        //ADOQryProduto.Locate('cdproduto',ADOQryProcura.FieldByName('cdProduto').AsInteger,[]);
        if (prevenda.itens[I].quantidade > prevenda.itens[I].nrQtdReal) and (vEstqNegativo <> 'S') and (verificarDispEmEstoque) then //and (vOrcamento<>'O')
        begin
          Application.OnMessage := FrmPrincipalPreVenda.NaoProcessaMsg;
          if (FrmPrincipalPreVenda.RgOpcoes.ItemIndex = 1) then
          begin //(vOrcamento = 'N') and
            Messagedlg('O Produto de código '+ prevenda.itens[I].descricao +' está com a quantidade '+ FormatFloat('0.00',prevenda.itens[I].nrQtdReal) +
                       ' disponível em estoque.' + #13 + #13 +
                       'Portanto, será excluído desta pre-venda!',mtWarning, [mbOk], 0);
            edtQtdItens.Text := FormatFloat('0',StrToFloat(edtQtdItens.Text) - 1);
          end;
          Application.OnMessage := FrmPrincipalPreVenda.ProcessaMsg;
          prevenda.itens.Delete(i);
          i := i-1;
        end;
        //else begin

          //AuxiliarLancto(i);
          //SgDados.RowCount := SgDados.RowCount + 1;
        //end;
        //ADOQryProcura.Next;
        i := i+1;
      end;
      CarregarItensGrid(prevenda);
      //tiraLinhasVazias(SgDados);
      //EdtDescontoExit(Self);
      CbxCliente.Enabled := True; // vAlteraCliente = 'S';
      CbxCliente.SetFocus;
      if not liberaDigitacaoLancamento then
        EdtLancto.ReadOnly := True;
      CbxClienteExit(Self);
  end else if RgOpcoes.ItemIndex = 3 then // AMBIENTAR NOTA DE ENTRADA
  begin
    With ADOQryProcura do
    begin
      Sql.Text := 'SELECT L.CDCOMISSAO,L.CDPESSOA,L.DSLANCAMENTO,I.CDPRODUTO,L.DTEMISSAO,I.NRQTD,I.VLUNITARIO_DESC,I.NRVALORDESCONTO,L.VLDESCONTO,P.NRQTDREAL FROM ITELCTO I WITH (NOLOCK) INNER JOIN LANCTO L WITH (NOLOCK) '+
                  'ON L.DSLANCAMENTO = I.DSLANCAMENTO AND L.CDPESSOA = I.CDPESSOA AND L.DSSTATUS = I.DSSTATUS INNER JOIN PRODUTO P WITH (NOLOCK) ON P.CDPRODUTO = I.CDPRODUTO WHERE L.DSLANCAMENTO = :LANCTO '+
                  'AND L.CDPESSOA = :CDPESSOA AND L.DSSTATUS = ''C'' ';
      Parameters.ParamByName('LANCTO').Value := EdtLancto.Text;
      Application.OnMessage := FrmPrincipalPreVenda.NaoProcessaMsg;
      Parameters.ParamByName('CDPESSOA').Value := StrToIntDef(ChamaInputBox('Seleção de fornecedor','Escolha o fornecedor na lista abaixo:'),0);
      Application.OnMessage := FrmPrincipalPreVenda.ProcessaMsg;
      Open;
      if Recordcount = 0 then  // caso o lancamento não seja encontrado
      begin
        Application.OnMessage := FrmPrincipalPreVenda.NaoProcessaMsg;
        Messagedlg('Lançamento não encontrado!', mtInformation, [mbOk], 0);
        Application.OnMessage := FrmPrincipalPreVenda.ProcessaMsg;
        EdtLancto.Enabled  := True;
        EdtLancto.Color    := clWindow;
        EdtLancto.Text     := '';
        vLancamento := '';
        EdtLancto.ReadOnly := False;
        EdtLancto.SetFocus;
        EdtCdNome.Text       := '';
        CbxNome.ItemIndex    := -1;
        EdtCdCliente.Text    := '';
        CbxCliente.ItemIndex := -1;
        Exit;
      end;
      vLancamento := EdtLancto.Text;
      CbxNome.Text := '';
      edtcdnome.Clear;
      CbxCliente.ItemIndex := 0;
      EdtCdCliente.Text := '1';
      edtQtdItens.Text       := IntToStr(RecordCount);
      // Montar a grid dos produtos
      ADOQryProcura.Prior;
      if vCasasPreco > vLimiteCasasPreco then
        EdtDesconto.Text := FormatFloat('0.00000',(ADOQryProcura.FieldByName('NRVALORDESCONTO').AsFloat))
      else
        EdtDesconto.Text := FormatFloat('0.00',(ADOQryProcura.FieldByName('NRVALORDESCONTO').AsFloat));
      EdtTotal.Text      := '0,00';
      EdtSubTotal.Text   := '0,00';
      edtValorBruto.text := '0,00';
      AtualizaCombProduto;  // pega o nome do produto
      AdoQrySimilar.Sql.Text := 'Select vlpreco from produto WITH (NOLOCK) where cdproduto = :CDPRODUTO';
      AdoQrySimilar.Parameters.ParamByName('CDPRODUTO').Value := ADOQryProcura.FieldByName('cdProduto').AsString;
      AdoQrySimilar.Open;
      if AdoQrySimilar.FieldByName('vlPreco').AsFloat > ADOQryProcura.FieldByName('VLUNITARIO_DESC').AsFloat then
        BtnAPrazo.Enabled := False;
      verificarDispEmEstoque := False;
      transformarOrcamentoPrevenda := False;
      for i := 1 to ADOQryProcura.RecordCount do
      begin
        ADOQryProduto.Locate('cdproduto',ADOQryProcura.FieldByName('cdProduto').AsFloat,[]);
        if (ADOQryProcura.FieldByName('nrQtd').AsFloat > ADOQryProduto.FieldByName('nrqtdreal').AsFloat) and (vEstqNegativo <> 'S') and (verificarDispEmEstoque) then //and (vOrcamento<>'O')
        begin
          Application.OnMessage := FrmPrincipalPreVenda.NaoProcessaMsg;
          if (FrmPrincipalPreVenda.RgOpcoes.ItemIndex = 1) then
          begin //(vOrcamento = 'N') and
            Messagedlg('O Produto de código '+ ADOQryProduto.FieldByName('cdProduto').AsString+' está com a quantidade '+ FormatFloat('0.00',ADOQryProduto.FieldByName('nrqtdreal').AsFloat) +
                       ' disponível em estoque.' + #13 + #13 +
                       'Portanto, será excluído desta pre-venda!',mtWarning, [mbOk], 0);
            edtQtdItens.Text := FormatFloat('0',StrToFloat(edtQtdItens.Text) - 1);
          end;
          Application.OnMessage := FrmPrincipalPreVenda.ProcessaMsg;
        end else
        begin
          AuxiliarLanctoNFe(i);
          SgDados.RowCount := SgDados.RowCount + 1;
        end;
        ADOQryProcura.Next;
      end;
      tiraLinhasVazias(SgDados);
      EdtDescontoExit(Self);
      CbxCliente.Enabled := True;
      CbxCliente.SetFocus;
      if not liberaDigitacaoLancamento then
        EdtLancto.ReadOnly := True;
      UltimoLancamento;
    end;
  end;
end;

procedure TFrmPrincipalPreVenda.tiraLinhasVazias(Grid: TStringGrid);
var i,j: integer;
    achou : boolean;
begin
  //while Grid.Cells[0,j] = '' do begin
  for j := 1 to Grid.RowCount do
  begin
    if Grid.Cells[0,j] = '' then
    begin
      for i := 1 to Grid.RowCount do
      begin
        if Grid.Cells[0,i] = '' then
        begin
          Grid.Cells[0,i]:= Grid.Cells[0,i+1];
          Grid.Cells[1,i]:= Grid.Cells[1,i+1];
          Grid.Cells[2,i]:= Grid.Cells[2,i+1];
          Grid.Cells[3,i]:= Grid.Cells[3,i+1];
          Grid.Cells[4,i]:= Grid.Cells[4,i+1];
          Grid.Cells[6,i]:= Grid.Cells[6,i+1];
          Grid.Cells[7,i]:= Grid.Cells[7,i+1];
          Grid.Cells[8,i]:= Grid.Cells[8,i+1];
          Grid.Cells[9,i]:= Grid.Cells[9,i+1];

          Grid.Cells[0,i+1]:= '';
          Grid.Cells[1,i+1]:= '';
          Grid.Cells[2,i+1]:= '';
          Grid.Cells[3,i+1]:= '';
          Grid.Cells[4,i+1]:= '';
          Grid.Cells[6,i+1]:= '';
          Grid.Cells[7,i+1]:= '';
          Grid.Cells[8,i+1]:= '';
          Grid.Cells[9,i+1]:= '';
        end;
      end;
    end;
  end;
end;

procedure TFrmPrincipalPreVenda.EdtLanctoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = Char(42)) then
  begin  // *  --> prevenda
    Consulta_prevenca := TConsulta_prevenca.Create(Application);
    try
      FrmPrincipalPreVenda.Enabled := False;
      Consulta_prevenca.Show;
    except
      Consulta_prevenca.Free;
      FrmPrincipalPreVenda.Enabled:= True;
    end;
  end else if (Key = Char(27)) then
    BtnCancelar.Click
  else
    ValidarInteiro(Key);
end;

procedure TFrmPrincipalPreVenda.ConsultaEspecificacao1Click(
  Sender: TObject);
var i : Integer;
begin
  if ADOSPConsulta.FieldByName('Código').AsString = '' then begin
    ShowMessage('Selecione um produto antes de realizar esta consulta.');
    EdtConsulta.SetFocus;
    exit;
  end;
  Application.OnMessage := FormPrincipal.NaoProcessaMsg;
  FrmEspecificacao := TFrmEspecificacao.Create(Application);
  // pegar os códigos adicionais
  With ADOQryEspecificacao do
  begin
    Sql.Text := 'Select * from CodAdicional WITH (NOLOCK) where cdproduto = '+ ADOSPConsulta.FieldByName('Código').AsString;
    Open;
    for i := 0 to RecordCount -1 do
    begin
      FrmEspecificacao.SgCodigos.Cells[i,1] := FieldByName('cdAdicional').AsString;
      Next;
    end;
    Sql.Text := 'Select P.dsEspecificacao, P.dscaminho,P.nrCustofinal_v,P.vlPreco, P.vlAtacado, P.dsMercosul,C.dsClassificacao, P.vlCustoAvulso  '+
                'From Produto P WITH (NOLOCK) left join clfiscal C WITH (NOLOCK) on P.dsMercosul = C.cdClassificacao '+
                'Where P.cdProduto = :CDPRODUTO                                                                     ';
    Parameters.ParamByName('CDPRODUTO').Value := ADOSPConsulta.FieldByName('Código').AsString;
    Open;
  end;
  FrmEspecificacao.Memo1.Text          := ADOQryEspecificacao.FieldByName('dsEspecificacao').AsString;
  FrmEspecificacao.lblAquisicao.Caption := FormatFloat('0.00',ADOQryEspecificacao.FieldByName('vlCustoAvulso').AsFloat);
  FrmEspecificacao.LblProduto.Caption  := ADOSPConsulta.FieldByName('Descrição').AsString;
  FrmEspecificacao.LblcdBarras.Caption := ADOSPConsulta.FieldByName('Código_Barras').AsString;
  FrmEspecificacao.LblFab.Caption      := ADOSPConsulta.FieldByName('Fabricante').AsString;
  FrmEspecificacao.LblRefer.Caption    := ADOSPConsulta.FieldByName('Referência').AsString;
  FrmEspecificacao.Lblcod.Caption      := ADOSPConsulta.FieldByName('Código').AsString;
  FrmEspecificacao.LblRefInterna.Caption  := ADOSPConsulta.FieldByName('CDCODIGODIC').AsString;
  FrmEspecificacao.LblVarejo.Caption  := FormatFloat('0.00',ADOQryEspecificacao.FieldByName('vlPreco').AsFloat);
  if (vAtacadoVarejo = 'V') and (UpperCase(vEmpresa) = 'NACIONAL') then  // caso o cliente seja de varejo n mostra o preço de atacado
  begin
    FrmEspecificacao.LblAtacado.Caption := '0';
  end else
  begin
    FrmEspecificacao.LblAtacado.Caption := FormatFloat('0.00',ADOQryEspecificacao.FieldByName('vlAtacado').AsFloat);
  end;
  FrmEspecificacao.LblClFiscal.Caption := ADOQryEspecificacao.FieldByName('dsMercosul').AsString + ' - ' + ADOQryEspecificacao.FieldByName('dsClassificacao').AsString;;
  try
    FrmEspecificacao.Image1.Picture.LoadFromFile(ADOQryEspecificacao.FieldByName('dsCaminho').AsString);
  except
  //  MessageDlg('Erro ao buscar a foto!',mtInformation,[mbOK],0);  tirei a mensagem - kenneth (Atendimento 26582)
  end;
  FrmEspecificacao.Position := poMainFormCenter;
  Ativa := 'N';
  FrmEspecificacao.ShowModal;
  EdtConsulta.SetFocus;
end;

procedure TFrmPrincipalPreVenda.CriarIniSQL;
var
  Arquivo  : TIniFile;
  Path     : String;
  ConstBd  : String;
begin
  {Procedimento para criar ou carregar configurações do BD}
  try{try finnaly}
    try
      Path    := ExtractFilePath(Application.ExeName);
      ConstBd := '';
      if not FileExists(Path + 'ConfSQL.ini') then
      begin
        ShowMessage('Configure a Conexão com o Banco SQL Server');
        Arquivo := TIniFile.Create(Path + 'ConfSQL.ini');
        DModulo.Conexao.ConnectionString := PromptDataSource(self.handle,
                                           'Provider=SQLOLEDB.1;Password=;' +
                                           'Persist Security Info=True;'    +
                                           'User ID=;Initial Catalog=;Data Source=');
        ConstBd := Cryptografia('C',DModulo.Conexao.ConnectionString);
        Arquivo.WriteString('BD','Path',ConstBd);
      end else
      begin
        Arquivo := TIniFile.Create(Path + 'ConfSQL.ini');
        ConstBd := Arquivo.ReadString('BD','Path','');
      end;
    except
      Showmessage('Erro ao carregar o arquivo de Inicialização. '+#13+
                  'Entre em contato com o Suporte do Sistema!');
    end;
  finally
    if Arquivo <> nil then
      Arquivo.Free;
  end;
  try
    with DModulo.Conexao do
    begin
      Connected        := False;
      ConnectionString := Cryptografia('D',ConstBd);
      Connected        := True;
    end;
  except
    Showmessage('Não foi possível conectar com o banco de dados.'+#13+
                '   Entre em contato com o suporte do sistema');
    Application.Terminate;  //TESTE
    FrmPrincipalPreVenda.Close;
    FrmPrincipalPreVenda := nil;
    FrmPrincipalPreVenda.Free;
    Exit;
  end;
end;

procedure TFrmPrincipalPreVenda.Limpar_Tela;
var
  I,J : integer;
begin
  limparArrayBoolean(arrayLinhasDestacadas,0,299,False);
  for I := 1 to 900 do for J := 1 to 7 do vVetor[I,J] := '';
  EdtConsulta.Clear;
//  EdtSubTotal.Text := '0,00';
//  EdtDesconto.Text := LimpaEdtDesconto;
//  EdtTotal.Text    := '0,00';
//  edtValorBruto.text := '0,00';
  vObs := '';
  if vEmpresa = 'VAREJAO' then
  begin

  end else
  begin
    CbxCliente.ItemIndex := 0;
    CbxCliente.Text:= CbxCliente.Items[0];
    CbxClienteChange(Self);
  end;
  if EdtLancto.text <> '' then
    DesbloqueiaAlteracaoPreVenda(StrToInt(EdtLancto.text));
  UltimoLancamento;
  LimpaGrid(prevenda);
  if (vMudaPreco = 'N') and (edtpreco.Enabled) then
  begin
    EdtPreco.Enabled := False;
    EdtPreco.Color := clInfoBk;
    EdtDescUnit.Enabled := False;
    EdtDescUnit.Color := clInfoBk;
    EdtConsulta.SetFocus;
  end;
  vBloqueiaDesconto := False;
  ListBox1.Clear;
  ListBox1.Visible := false;
  UltimoLancamento;
  if not liberaDigitacaoLancamento then
  begin
    EdtLancto.Color  := clInfoBk;
    EdtLancto.Enabled  := False;
    EdtLancto.ReadOnly := True;
  end;
  if (UpperCase( vEmpresa ) = 'AMBIENTAR')OR(UpperCase( vEmpresa ) = 'PBFARMA') then
    Monta_Combo;
  if vEmpresa = 'VAREJAO' then
  begin

  end else
  begin
    CbxNome.Text := vnmVendedor;
    edtcdnome.Text := vcdVendedor;
    //edtusuario.Clear;
  end;
  edtcdLista.Text := '';
  Cancelar;
end;

function TFrmPrincipalPreVenda.ProdutoJaReservado: Boolean;
var
  I : integer;
  resultado : Boolean;
begin
  resultado := False;
  if (vDestacarItensOcupados) and
          ((RgOpcoes.ItemIndex = 0)or((transformarOrcamentoPrevenda = true) and (RgOpcoes.ItemIndex = 1))) then begin
      for i := 0 to prevenda.itens.Count -1 do begin
        if (vEstqNegativo <> 'S') and
         (((qtdInsuficienteParaPrevend(prevenda.itens[I].cdProduto, prevenda.itens[I].quantidade) > 0) and (prevenda.itens[I].tipoComposicao <> composto))
          or ((prevenda.itens[I].tipoComposicao = composto)and(TNEGProduto.getEstoquePossivelProdutoComposto(prevenda.itens[I].cdproduto,1)<=0))) then begin
          MessageDlg('Os produtos em amarelo já estão reservados por outra(s) prevenda(s), '+#13#10+
                   'clique sobre o produto para saber mais detalhes.',mtWarning,[mbOK],0);
          resultado := True;
          break;
        end;
      end;
  end;
  result := resultado;
end;

procedure TFrmPrincipalPreVenda.Produtossimilares1Click(Sender: TObject);
var cod : string[20];
begin
  DBGrid1.Color := clWindow;
  With AdoSPConsulta do
  begin
    cod := ADOSPConsulta.FieldByName('código').AsString;
    Close;
    Parameters.ParamByName('@DSATIVO').Value := 'S';
    if CheckBox1.Checked = false then
      Parameters.ParamByName('@DSATIVO').Value := Null;
    Parameters.ParamByName('@ATACADOVAREJO').Value := vAtacadoVarejo;
    Parameters.ParamByName('@PESQUISA').Value      := COD;
    Parameters.ParamByName('@OPCAO').Value     := '6';
    Open;
    ADOSPConsultaPeso.Visible           := False;
    ADOSPConsultaEstoque.DisplayFormat  := '#' + getFormato(vCasasQtd);
    EdtPreco.Text := FormatFloatQ(vCasasPreco,ADOSPConsulta.FieldByName('Valor').AsFloat);
    if UpperCase(vEmpresa) = 'ODONTO' then
      label15.Text     := FormatFloat('0.00',PegaValorAtacado(AdoSpConsulta.FieldByName('código').asInteger));
    LblListados.Caption := 'Listados--> ' + IntToStr(RecordCount);
  end;
end;

procedure TFrmPrincipalPreVenda.LiberaVanda;
begin
  if vFlag <> '6' then
  begin
    FrmPrincipalPreVenda.Enabled := False;
    FrmCancelamentoVenda := TFrmCancelamentoVenda.Create(Application); // Cria o formulário
    if vFlag = '2' then
      FrmCancelamentoVenda.Position := poDefaULTPosOnly;
    FrmCancelamentoVenda.ShowModal;
  end else if prevenda.descontoPercentual < StrToFloat(EdtDesconto.Text) then//vlTotalAnterior > StrToFloat(EdtSubTotal.Text) then
  begin //se o valor total atual for menor que o anterior então tem que liberar o desconto
    FrmPrincipalPreVenda.Enabled := False;
    FrmCancelamentoVenda := TFrmCancelamentoVenda.Create(Application); // Cria o formulário
    FrmCancelamentoVenda.ShowModal;
    vlTotalAnterior := StrToFloat(FormatFloat('0.00',StrToFloatDef(EdtSubTotal.text,0)));
    EdtSubTotal.ReadOnly := False;
  end;
end;

procedure TFrmPrincipalPreVenda.EdtDescUnitExit(Sender: TObject);
begin
  if EdtDescUnit.Text = '' then
     EdtDescUnit.Text := '0,00'
  else if (StrToFloatDef(EdtDescUnit.Text,0) > 0) and (vAtacadoVarejo = 'A') then //(UpperCase(vEmpresa) = 'CAMARATUBA')OR
  begin
    if vBloquearDescontoAtacado = true then
    begin
      Application.OnMessage:= NaoProcessaMsg;
      MessageDlg('Desconto para clientes atacado está bloqueado.',mtWarning,[mbOK],0);
      EdtPreco.Text    := FormatFloatQ(vCasasPreco, ADOSPConsulta.FieldByName('Valor').AsFloat);
      EdtDescUnit.Text := '0,00';
      EdtPreco.SelectAll;
      EdtPreco.SetFocus;
      Application.OnMessage :=  FrmPrincipalPreVenda.ProcessaMsg;
      exit;
    end
  end
  else                                                                                       // claudio: comentei de acordo com o atend 33920
  if (StrToFloatDef(EdtDescUnit.Text,0) > 0) and ((UpperCase(vEmpresa) = 'CARDOSOACESSORIOS')) then // (UpperCase(vEmpresa) = 'CAMARATUBA')OR
  begin
    if TNEGCliente.isCliente_Crediario(EdtCdCliente.Text) then
    begin
      EdtDescUnit.Text := '0,00';
      Application.OnMessage:= NaoProcessaMsg;
      MessageDlg('Desconto já é automático para clientes de crediário.',mtWarning,[mbOK],0);
      Application.OnMessage:= ProcessaMsg;
      EdtDescUnit.SetFocus;
    end
  end
  else if (StrToFloatDef(EdtDescUnit.Text,0) > 0) and (vDescontoClienteAuto = True) and (TNEGCliente.getPercentualDoPrecoComDescontoDecimal(StrtoIntDef(EdtCdCliente.Text,0)) < 1) then // (UpperCase(vEmpresa) = 'CAMARATUBA')OR
  begin
    EdtDescUnit.Text := '0,00';
    Application.OnMessage:= NaoProcessaMsg;
    MessageDlg('Desconto já é automático para este cliente.',mtWarning,[mbOK],0);
    Application.OnMessage:= ProcessaMsg;
    EdtDescUnit.SetFocus;
  end;
  if vLimitarDescontoFornecedor then
  begin
    if StrToFloatDef(EdtDescUnit.Text,0) >
      GetLimiteDescontoFornecedor(StrToInt(EdtCdCliente.Text),ADOSPConsulta.FieldByName('Código').AsInteger) then begin
      EdtDescUnit.Text := '0,00';
      Application.OnMessage:= NaoProcessaMsg;
      MessageDlg('Desconto Máx definido pelo fornecedor é de '+
            FormatFloat('0.00',GetLimiteDescontoFornecedor(StrToInt(EdtCdCliente.Text),ADOSPConsulta.FieldByName('Código').AsInteger))+'%',mtWarning,[mbOK],0);
      Application.OnMessage:= ProcessaMsg;
      EdtDescUnit.SetFocus;
    end;
  end;
  //EdtDescUnit.Text := FormatFloat('0.00',StrToFloat(EdtDescUnit.Text));
  //EdtPreco.Text    := FormatFloat('0.000',StrToFloat(EdtPreco.Text) - (StrToFloat(EdtPreco.Text) * StrToFloat(EdtDescUnit.Text)/100));
  {if UPPERCASE(vEmpresa) = 'PROAUTO' then begin
    if StrToFloat(EdtDescUnit.Text) > vlDescontoVendedor then begin //vPorcDesconto
       vFlag := '0';
       LiberaVanda;
    end;
  end else begin
    if StrToFloat(EdtDescUnit.Text) > vPorcDesconto then begin
      vFlag := '0';
      LiberaVanda;
    end;
  end;}
end;

procedure TFrmPrincipalPreVenda.EdtDescUnitKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (EdtDescUnit.Text = EdtDescUnit.SelText) then
    ValidarNumero(key, '')
  else
    ValidarNumero(key, TEdit(Sender).text);
end;

procedure TFrmPrincipalPreVenda.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  // Para mudar a cor da linha no DbGrid
  if (TAuxDBGrid(dbgrid1).DataLink.ActiveRecord + 1 = TAuxDBGrid(dbgrid1).Row)  or(gdSelected in State)then
  begin
    dbgrid1.Canvas.Brush.Color  := $00DDDDDD;//$00B79A00;//clSkyBlue;
    dbgrid1.Canvas.Font.Style   := dbgrid1.Canvas.Font.Style + [fsBold];
  end;
  dbgrid1.Canvas.FillRect(Rect);
  if (dataCol < 4) or (dataCol > 5) then
    dbgrid1.Canvas.TextOut(Rect.Left + 2,Rect.Top,Column.Field.AsString)
  else
  begin
    if (Column.Field.FieldName = 'Valor') then
      dbgrid1.Canvas.TextOut(Rect.Left + 2,Rect.Top,FormatFloat('#0.00',Column.Field.AsFloat));
    {if (Column.Field.FieldName = 'Preco') then                                                   // ADD POR CLAUDIO
      dbgrid1.Canvas.TextOut(Rect.Left + 2,Rect.Top,FormatFloat('#0.00',Column.Field.AsFloat));  // ADD POR CLAUDIO}
  end;
  if (Column.Field.FieldName = 'Valor') then
  begin
    DBGrid1.Canvas.Brush.Color := clMoneyGreen;
    DBGrid1.Canvas.Font.Color  := clBlack;
    DBGrid1.Canvas.FillRect(Rect);
    DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
  if (Column.Field.FieldName = 'Estoque') then
  begin
    DBGrid1.Canvas.Brush.Color := clSilver;
    DBGrid1.Canvas.Font.Color  := clBlack;
    DBGrid1.Canvas.FillRect(Rect);
    DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
  if ADOSPConsultaVALOR.AsFloat <> ADOSPConsultaPRECO.AsFloat then begin    //ADD POR CLAUDIO
    //DBGrid1.Canvas.Brush.Color := clMoneyGreen;
    if (Column.Field.FieldName = 'VALOR') then
      DBGrid1.Canvas.Brush.Color := clMoneyGreen;
    DBGrid1.Canvas.Font.Color    := clBlack;
    DBGrid1.Canvas.FillRect(Rect);
    DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
  if (ADOSPConsultaEstoque.AsFloat <= 0) or (ADOSPConsultadsAtivo.AsString <> 'S') then
  begin
    DBGrid1.Canvas.Font.Color := clRed;
    DBGrid1.Canvas.FillRect(Rect);
    DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end  else  begin
    DBGrid1.Canvas.Font.Color:= clBlack;
    DBGrid1.Canvas.FillRect(Rect);
    DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

Function TFrmPrincipalPreVenda.SystemDateTime(tDate: TDateTime; tTime: TDateTime): Boolean;
var
   tSetDate: TDateTime;
   vDateBias: Variant;
   tSetTime: TDateTime;
   vTimeBias: Variant;
   tTZI: TTimeZoneInformation;
   tST: TSystemTime;
begin
  GetTimeZoneInformation(tTZI);
  vDateBias := tTZI.Bias / 1440;
  tSetDate  := tDate + vDateBias;
  vTimeBias := tTZI.Bias / 1440;
  tSetTime  := tTime + vTimeBias;
  with tST do begin
    wYear := StrToInt(FormatDateTime('yyyy', tSetDate));
    wMonth := StrToInt(FormatDateTime('mm', tSetDate));
    wDay := StrToInt(FormatDateTime('dd', tSetDate));
    wHour := StrToInt(FormatDateTime('hh', tSettime));
    wMinute := StrToInt(FormatDateTime('nn', tSettime));
    wSecond := StrToInt(FormatDateTime('ss', tSettime));
    wMilliseconds := 0;
  end;
 SystemDateTime := SetSystemTime(tST);
end;


Procedure TFrmPrincipalPreVenda.EdtConsultaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_Down then
    BtnMdProximoClick(Self);
  if Key = VK_Up then
    BtnMdAnteriorClick(Self);
end;

procedure TFrmPrincipalPreVenda.SpeedButton1Click(Sender: TObject);
var vIdent : String[20];
    I : Integer;
begin
  frmBuscaCliente:= TfrmBuscaCliente.Create(self);
  frmBuscaCliente.ShowModal;
//  vIdent := InputBox('Localizar cliente', 'Entre com o número do CPF/CNPJ ou código do cliente para pesquisa!', '');
//  vIdent := SubstituiTexto(vIdent,'.');
//  vIdent := SubstituiTexto(vIdent,',');
//  vIdent := SubstituiTexto(vIdent,'-');
//  vIdent := SubstituiTexto(vIdent,'/');
//  vIdent := SubstituiTexto(vIdent,'\');
//  if Length(vIdent) = 11 then begin
//    with AdoQryLocaliza do begin
//      Sql.Text := 'Select P.cdPessoa,nmPessoa,F.dsCPF From Pessoa P WITH (NOLOCK),P_Fisica F WITH (NOLOCK)  '+
//                  'Where P.cdPessoa = F.cdPessoa and F.dsCPF = :CPF and P.Ser = ''C'' and P.dsAtivo = ''S'' ';
//      Parameters.ParamByName('CPF').Value := vIdent;
//      Open;
//      if AdoQryLocaliza.RecordCount = 0 then begin
//        ShowMessage('CPF não encontrado... Tente novamente!');
//        exit;
//      end else begin
//        EdtCdCliente.Text := AdoQryLocaliza.FieldByName('cdpessoa').AsString;
//        CbxCliente.Text   := AdoQryLocaliza.FieldByName('nmpessoa').AsString;
//      end;
//    end; // with
//  end else if Length(vIdent) = 14 then begin
//    with AdoQryLocaliza do begin
//      Sql.Text := 'Select P.cdPessoa,nmPessoa,F.CGC From Pessoa P WITH (NOLOCK),P_Juridica F WITH (NOLOCK)  '+
//                  'Where P.cdPessoa = F.cdPessoa and F.CGC = :CNPJ  and P.Ser = ''C'' and P.dsAtivo = ''S'' ';
//      Parameters.ParamByName('CNPJ').Value := vIdent;
//      Open;
//      if AdoQryLocaliza.RecordCount = 0 then begin
//        ShowMessage('CNPJ não encontrado... Tente novamente!');
//        exit;
//      end else begin
//        EdtCdCliente.Text := AdoQryLocaliza.FieldByName('cdpessoa').AsString;
//        CbxCliente.Text   := AdoQryLocaliza.FieldByName('nmpessoa').AsString;
//      end;
//    end; // with
//  end else if (Length(vIdent) <= 5) and (Length(vIdent) >= 1) then begin
//    with AdoQryLocaliza do begin
//      Sql.Text := 'Select P.cdPessoa,nmPessoa From Pessoa P WITH (NOLOCK)             '+
//                  'Where P.cdPessoa = :CODIGO and P.Ser = ''C'' and P.dsAtivo = ''S'' ';
//      Parameters.ParamByName('CODIGO').Value := vIdent;
//      Open;
//      if AdoQryLocaliza.RecordCount = 0 then begin
//        ShowMessage('Código não encontrado... Tente novamente!');
//        exit;
//      end else begin
//        EdtCdCliente.Text := AdoQryLocaliza.FieldByName('cdpessoa').AsString;
//        CbxCliente.Text   := AdoQryLocaliza.FieldByName('nmpessoa').AsString;
//      end;
//    end; // with
//  end else
//    ShowMessage('Cliente não encontrado ou inativo... Tente novamente!');
end;

procedure TFrmPrincipalPreVenda.Cadastrodeclientes1Click(Sender: TObject);
begin
  if Permissao('11','V') = 'N' then
     Exit;
  vFlag := '';
//  FrmPrincipalPreVenda.Enabled := False;
  FrmCdCliente := TFrmCdCliente.Create(self);
  FrmCdCliente.ShowModal;
end;

function TFrmPrincipalPreVenda.ClienteValido: Boolean;
begin
  Result := True;
  if (trim(edtcdcliente.Text) = '') then begin
    Application.OnMessage := FrmPrincipalPreVenda.NaoProcessaMsg;
    Showmessage('O nome do cliente está digitado errado!!');
    CbxCliente.SetFocus;
    Application.OnMessage := FrmPrincipalPreVenda.ProcessaMsg;
    BtnConfirmar.Enabled := True;
    Alteraquantidade1.Enabled := true;
    Result := False;
  end;
end;

procedure TFrmPrincipalPreVenda.Conferncia1Click(Sender: TObject);
begin
  frmConferencia := TfrmConferencia.Create(self);
  frmConferencia.ShowModal;
end;

procedure TFrmPrincipalPreVenda.ConsultaClientepeloCPFouCNPJ1Click(
  Sender: TObject);
begin
  SpeedButton1.Click;
end;

procedure TFrmPrincipalPreVenda.Registraperdadevemdaporestoqueinsuficiente1Click(
  Sender: TObject);
var
  vTexto : String[14];
begin
  if ( ADOSPConsulta.RecordCount = 0 ) or ( Length(EdtCdNome.Text) = 0) then exit;
  FrmLancaVendaPerdida := TFrmLancaVendaPerdida.Create(Application,
                                                       ADOSPConsulta.FieldByName('Código').AsString,
                                                       ADOSPConsulta.FieldByName('DESCRIÇÃO').AsString);
  FrmLancaVendaPerdida.ShowModal;
  EdtConsulta.setFocus;


//  if ( ADOSPConsulta.RecordCount = 0 ) or ( Length(EdtCdNome.Text) = 0) then exit;
//  Application.OnMessage := NaoProcessaMsg;
//  vtexto := InputBox('Registro de venda perdida',
//                     'Entre com a quantidade que o cliente solicitou do produto?', '');
//  Application.OnMessage := ProcessaMsg;
//  vtexto := RemoveChar(vtexto);
//  if Length(vTexto) = 0 then exit;
//  vtexto := VirgPonto(vTexto);
//  With ADOQrySalvar do begin
//    Try
//      DModulo.Conexao.BeginTrans;
//      Sql.Text := 'Insert Into VendasPerdidas (cdProduto,nrQtd,data,cdPessoa) '+
//                  'Values (:CODIGO,:QUANTD,:DATA,:CDPESSOA)                   ';
//      Parameters.ParamByName('CODIGO').Value   :=  ADOSPConsulta.FieldByName('Código').AsInteger;
//      Parameters.ParamByName('QUANTD').Value   :=  vTexto;
//      Parameters.ParamByName('DATA').Value     :=  vdata_banco;
//      Parameters.ParamByName('CDPESSOA').Value :=  EdtCdNome.Text;
//      ExecSQL;
//      DModulo.Conexao.CommitTrans;
//    Except
//      on ER: EDBEngineError do begin
//        DModulo.Conexao.RollbackTrans;
//        Salvar_erro(vData_Banco + ' | ' + pegaHoraBanco, 'PREVENDA', 'TFrmPrincipalPreVenda.Registraperdadevemdaporestoqueinsuficiente1Click', ER.Message,EdtLancto.Text);
//        Messagedlg('Não foi possível salvar!', mterror, [mbOk], 0);
//      end;
//      on E: Exception do begin
//        DModulo.Conexao.RollbackTrans;
//        Salvar_erro(vData_Banco + ' | ' + pegaHoraBanco, 'PREVENDA', 'TFrmPrincipalPreVenda.Registraperdadevemdaporestoqueinsuficiente1Click', e.Message,EdtLancto.Text);
//        Messagedlg('Não foi possível salvar!', mterror, [mbOk], 0);
//      end;
//    end;  // except
//  end;
end;

procedure TFrmPrincipalPreVenda.Consultadecrditodocliente1Click(
  Sender: TObject);
begin
  vFlag := '5';
  LiberaVanda;
end;

procedure TFrmPrincipalPreVenda.Alteraquantidade1Click(Sender: TObject);
begin
  if EdtSubTotal.Focused and (not EdtSubTotal.ReadOnly) then
     EdtSubTotalExit(EdtSubTotal)
  else
  if EdtDesconto.Focused and (not EdtDesconto.ReadOnly) then
     EdtDescontoExit(EdtDesconto)
  else
  if CbxCliente.Focused and (codigoClienteAtual <> copy_campo(CbxCliente.Text,'|',2)) then
     CbxClienteExit(CbxCliente);
  if BtnConfirmar.Enabled then
     BtnConfirmarClick(self);
end;


function TFrmPrincipalPreVenda.isDescontoValido(prevenda: TPrevenda): Boolean;
var
  item : TItemPrevenda;
  resultado : Boolean;
begin
  resultado := False;
  for item in prevenda.itens do begin
    if item.Promocao_desconto_Item = False then begin
      resultado := True;
      Break;
    end;
  end;
  result := resultado;
end;

function TFrmPrincipalPreVenda.item_cancelado(linha: Integer): Boolean;
begin
  Result:= Copy(SgDados.Cells[1,linha],1,6) = '<CANC>';
end;

procedure TFrmPrincipalPreVenda.cancelar_item(linha: Integer);
begin
  SgDados.Cells[1, linha] := '<CANC>' + SgDados.Cells[1, linha];
end;

procedure TFrmPrincipalPreVenda.CarregarItensGrid(prevenda : TPrevenda; ponteiro : string = '');
var
  I : integer;
begin
  EdtSubTotal.Text   := '0,00';
  edtValorBruto.Text := '0,00';
  EdtTotal.Text      := '0,00';
  LimpaGrid;
  edtQtdItens.Text := IntToStr(prevenda.itens.Count);
  for I := 0 to prevenda.itens.Count -1 do begin
    with SgDados do begin
      Cells[0,I+1]  := IntToStr(prevenda.itens[I].cdProduto);  //codigo
      Cells[1,I+1]  := prevenda.itens[I].descricao;
      Cells[10,I+1] := prevenda.itens[I].unidade.unidade;    //unidade
      Cells[12,I+1] := floatToStr(prevenda.itens[I].fatorConversao);
      Cells[13,I+1] := prevenda.itens[I].lote;
      Cells[16,I+1] := IntToStr(prevenda.itens[I].cdFabricanteLote);
      Cells[2,I+1]  := FormatFloatQ(vCasasQtd,SimpleRoundTo(prevenda.itens[I].quantidade,vCasasQtd*-1));
      Cells[3,I+1]  := FormatFloatQ(vCasasPreco,SimpleRoundTo(prevenda.itens[I].precoVenda,vCasasPreco*-1));
      prevenda.itens[I].precoVenda := StrtoFloat(Cells[3,I+1]);
      Cells[4,I+1]  := FormatFloatQ(2,SimpleRoundTo(prevenda.itens[I].SubTotal,-2)); // total
      Cells[5,I+1]  := prevenda.itens[I].prateleira;
      Cells[6,I+1]  := prevenda.itens[I].codigoBarras;
      Cells[7,I+1]  := prevenda.itens[I].referenciaFabrica;
      Cells[8,I+1]  := FormatFloatQ(vCasasQtd,SimpleRoundTo(prevenda.itens[I].nrQtdReal,vCasasQtd*-1));
      Cells[16,I+1] := prevenda.itens[I].tipoForro;
      Cells[11,I+1] := prevenda.itens[I].cfop;   // cfop por item thiago
      Cells[9,I+1]  := FormatFloatQ(vCasasPreco,SimpleRoundTo(prevenda.itens[I].precoBruto,vCasasPreco*-1));
      prevenda.itens[I].precoBruto := StrtoFloat(Cells[9,I+1]);
      if prevenda.itens[I].ambiente <> nil then begin
        Cells[14,I+1] := IntToStr(prevenda.itens[I].ambiente.codigo);
        Cells[15,I+1] := prevenda.itens[I].ambiente.descricao;
      end;
      if prevenda.itens[I].Promocao_desconto_Item then
        Cells[17,I+1] := '1'
      else
        Cells[17,I+1] := '0'; //produto em promoção
      ArraylinhasDestacadas[I+1] := prevenda.itens[I].itemLinhaDestacada;
    end;
    edtValorBruto.Text := FloatToStr(StrtoFloat(edtValorBruto.Text) + (prevenda.itens[I].precoBruto * prevenda.itens[I].quantidade));
    EdtTotal.Text := FloatToStr(StrtoFloat(EdtTotal.Text) + (prevenda.itens[I].precoBruto * prevenda.itens[I].quantidade));
    edtValorBruto.Text := FloatToStr(SimpleRoundTo(StrtoFloat(edtValorBruto.Text),-2));
    EdtTotal.Text := FloatToStr(SimpleRoundTo(StrtoFloat(EdtTotal.Text),-2));
  end;
  EdtDescontoExit(Self);
  if (prevenda.itens.Count + 1) = 1 then
    SgDados.RowCount := 2
  else
    SgDados.RowCount := prevenda.itens.Count +1;
  if (ponteiro = '') or ((StrToInt(ponteiro) > prevenda.itens.Count)and(prevenda.itens.Count > 0)) then
    SgDados.Row := prevenda.itens.Count
  else if (StrToInt(ponteiro) = 1) and (prevenda.itens.Count = 0) then
    SgDados.Row := 1
  else
    SgDados.Row := StrToInt(ponteiro);
end;

procedure TFrmPrincipalPreVenda.SgDadosExit(Sender: TObject);
var
  i : Integer;
  cansel : Boolean;
begin
  if indexGridAux > 0 then begin
    if (StrToFloatDef(SgDados.Cells[2, indexGridAux],0) <= 0) then begin
      MessageDlg('Quantidade inválida no produto ['+SgDados.Cells[1, indexGridAux]+'].',mtWarning,[mbOK],0);
      SgDados.Row:=indexGridAux;
      SgDados.Col:=2;
      SgDadosSelectCell(self,indexGridAux,2,cansel);
      SgDados.SetFocus;
      Exit;
    end;
    indexGridAux := 0; //reinicializa o ponteiro
  end;
  OcultarExclamacao;
  { A Discabos libera p alterar a quantidade do produto direto na grid, por isso tem que atualizar os totais. }
  if (UpperCase(vEmpresa) = 'DISCABOS') OR (UpperCase(vEmpresa) = 'SANTANA') then
  begin
    EdtSubTotal.Text:= '0,00';
    EdtTotal.Text:= '0,00';
    edtValorBruto.text:= '0,00';
    EdtDesconto.Text:= LimpaEdtDesconto;
    if Label15.Visible= true then
      label15.Text:= '0,00';
    for I := 1 to SgDados.RowCount - 1 do
    begin
      if (SgDados.Cells[1,I] = '') then
        Break;
      if vEstqNegativo <> 'S' then
      begin
        if (vDestacarItensOcupados) and ((RgOpcoes.ItemIndex = 0)or((transformarOrcamentoPrevenda = true) and (RgOpcoes.ItemIndex = 1))) then
          if (vEstqNegativo <> 'S') and (qtdInsuficienteParaPrevend(StrToInt(SgDados.Cells[0,i]), strToFloatDef(SgDados.Cells[2,i],0)) > 0) then
             ArraylinhasDestacadas[i]:= True
          else
             ArraylinhasDestacadas[i]:= False;

        if (ArraylinhasDestacadas[i]) or (strtofloatdef(SgDados.Cells[2,i],0) > strtofloatdef(SgDados.Cells[8,i],0)) then
        begin
          Application.MessageBox(PWideChar('O produto '+SgDados.Cells[1,i]+ ' não possui estoque suficiente!'), 'Atenção', mb_ok + mb_Iconwarning + mb_applModal);
        end;
      end;
      SgDados.Cells[2,i]:= FormatFloatQ(vCasasQtd, StrToFloatDef(SgDados.Cells[2,i],0)); // quantidade
      SgDados.Cells[3,i]:= FormatFloatQ(vCasasPreco, StrToFloat(SgDados.Cells[3,i])); // preco de venda
      SgDados.Cells[4,i]:= FormatFloatQ(vCasasPreco,StrToFloat(SgDados.Cells[2,i]) * StrToFloat(SgDados.Cells[3,i]));  // total
      if not item_cancelado(i) then
      begin       // atualiza o valor total da venda
        EdtTotal.Text:= FormatFloat('0.00',StrtoFloat(EdtTotal.Text) + (StrToFloat(SgDados.Cells[9,i]) * StrToFloat(SgDados.Cells[2,i])));
        edtValorBruto.Text := FormatFloat('0.00',StrtoFloat(edtValorBruto.Text) + (StrToFloat(SgDados.Cells[9,i])*StrToFloat(SgDados.Cells[2,i])));
//        EdtSubTotal.Text := EdtTotal.Text;
      end;
    end;
    SgDados.Refresh;
    EdtDescontoExit(Self);
    Application.OnMessage:= NaoProcessaMsg;
    EdtConsulta.SetFocus;
    Application.OnMessage:= ProcessaMsg;
  end;
  
//  if (UpperCase(vEmpresa) = 'DISCABOS') OR (UpperCase(vEmpresa) = 'SANTANA') then
//  begin
//    EdtSubTotal.Text:= '0,00';
//    EdtTotal.Text:= '0,00';
//    edtValorBruto.text:= '0,00';
//    EdtDesconto.Text:= LimpaEdtDesconto;
//    if Label15.Visible= true then
//      label15.Text:= '0,00';
//    for I := 1 to SgDados.RowCount - 1 do begin
//      if (SgDados.Cells[1,I] = '') then Break;
//      SgDados.Cells[2,i]:= FormatFloatQ(vCasasQtd, StrToFloat(SgDados.Cells[2,i])); // quantidade
//      SgDados.Cells[3,i]:= FormatFloatQ(vCasasPreco, StrToFloat(SgDados.Cells[3,i])); // preco de venda
//      SgDados.Cells[4,i]:= FormatFloatQ(vCasasPreco,StrToFloat(SgDados.Cells[2,i]) * StrToFloat(SgDados.Cells[3,i]));  // total
//      if not item_cancelado(i) then
//      begin       // atualiza o valor total da venda
//        EdtTotal.Text:= FormatFloat('0.00',StrtoFloat(EdtTotal.Text) +  StrToFloat(SgDados.Cells[4,i]));
//        edtValorBruto.Text := FormatFloat('0.00',StrtoFloat(edtValorBruto.Text) + (StrToFloat(SgDados.Cells[9,i])*StrToFloat(SgDados.Cells[2,i])));
//        EdtSubTotal.Text := EdtTotal.Text;
//      end;
//    end;
//    SgDados.Refresh;
//    Application.OnMessage:= NaoProcessaMsg;
//    EdtConsulta.SetFocus;
//    Application.OnMessage:= ProcessaMsg;
//  end;
end;

procedure TFrmPrincipalPreVenda.SgDadosGetEditText(Sender: TObject; ACol,
  ARow: Integer; var Value: string);
begin
  if (SgDados.Cells[0, sgdados.Row] <> '')and(sgdados.Col=2) then
     qtdAnteriorNaGrid:= StrToFloat(Value);
end;

procedure TFrmPrincipalPreVenda.SgDadosSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  if Acol >= 3 then
    EdtConsulta.SetFocus;
end;

procedure TFrmPrincipalPreVenda.SgDadosSetEditText(Sender: TObject; ACol,
  ARow: Integer; const Value: string);
var
  cdproduto : integer;
  quantidade: Real;
begin
//  if (Value <> '') and (SgDados.Cells[0, sgdados.Row] <> '') then
//  begin
//
//    { se a quantidade insertada na grid for positiva, recalculo. Senão, coloco o valor anterior }
//    if QuantidadeGridMaiorQueZero then
//    begin
//      quantidade:= StrToFloatDef(Value, 0);
//      cdproduto:= StrToInt(SgDados.Cells[0, sgdados.Row]);
//      atualizarQuantidadeNaGrid(cdproduto, quantidade, qtdAnteriorNaGrid);
//    end
//    else
//    begin
//      SgDados.Cells[2, SgDados.Row]:= FormatFloatQ(vCasasQtd, qtdAnteriorNaGrid);
//      sgDados.Repaint;
//    end;
//  end;
end;

procedure TFrmPrincipalPreVenda.atualizarQuantidadeNaGrid(cdproduto:integer; quantidade:real; quantidadeAnterior:real);
begin
  if not DisponivelNoEstoque(quantidade, cdProduto, True) then begin
    SgDados.Cells[2, SgDados.Row]:= FormatFloatQ(vCasasQtd, quantidadeAnterior);
    quantidade := quantidadeAnterior;
  end;
  //begin
    if Frac(quantidade) <> 0 then
    begin  // a quantidade está fracionada, logo, termos que testar se o produto esta definido como fracionado
      if not validarQuantidadeItemFracionado(SgDados.Cells[10,sgDados.row]) then
      begin
        Application.OnMessage := NaoProcessaMsg;
        ShowMessage('Incompatibilidade na quantidade digitada.  Este ítem não pode ser vendido fracionado!');
        SgDados.Cells[2, SgDados.Row]:= FormatFloatQ(vCasasQtd, qtdAnteriorNaGrid);
        Application.OnMessage := ProcessaMsg;
        Exit;
      end;
    end;
    With SgDados do
    begin
      prevenda.itens[sgDados.row - 1].quantidade := Strtofloat(SgDados.Cells[2, SgDados.Row]);
      prevenda.itens[sgDados.row - 1].SubTotal := prevenda.itens[sgDados.row - 1].quantidade * prevenda.itens[sgDados.row - 1].precoVenda;
      { INDICO NO ARRAY SE ESSA LINHA FICARÁ DESTACADA OU NÃO }
      if (vDestacarItensOcupados) and ((RgOpcoes.ItemIndex = 0)or((transformarOrcamentoPrevenda = true) and (RgOpcoes.ItemIndex = 1))) then
          if (vEstqNegativo <> 'S') and (qtdInsuficienteParaPrevend(StrToInt(Cells[0,Row]), strToFloatDef(Cells[2,Row],0)) > 0) then
             ArraylinhasDestacadas[Row]:= True
          else
             ArraylinhasDestacadas[Row]:= False;
      //prevenda.itens[Row-1].quantidade:= StrToFloat(Cells[2,Row]);

      { Abato o valor bruto anterior do item alterado e adiciono o novo valor bruto }
      edtValorBruto.Text := FormatFloat('0.00',StrtoFloat(edtValorBruto.Text) -
      (StrToFloat(Cells[9,Row]) * quantidadeAnterior));
      edtValorBruto.Text := FormatFloat('0.00',StrtoFloat(edtValorBruto.Text) +
      (StrToFloat(Cells[9,Row])*quantidade));

      { abato o valor líquido anterior do item alterado }
      EdtTotal.Text := FormatFloat('0.00',StrtoFloat(EdtTotal.Text) - (StrToFloat(Cells[9,Row]) * StrToFloat(Cells[2,Row])));

      { corrijo o valor líquido do item }
      Cells[4,Row]:= FormatFloatQ(vCasasPreco ,StrToFloat(Cells[2,Row]) * StrToFloat(Cells[3,Row]));

      { adiciono o novo valor líquido }
      EdtTotal.Text := FormatFloat('0.00',StrtoFloat(EdtTotal.Text) + (StrToFloat(Cells[9,Row]) * StrToFloat(Cells[2,Row])));
      Refresh;
      //EdtSubTotal.Text := EdtTotal.Text;
      EdtDescontoExit(Self);
    end;

    atualizaEditQtdItens;
  //end
  //else
  //  SgDados.Cells[2, SgDados.Row]:= FormatFloatQ(vCasasQtd, qtdAnteriorNaGrid);
end;

procedure TFrmPrincipalPreVenda.chkOcultarProdutosSemEstoqueClick(
  Sender: TObject);
begin
  persistirFormulario;
  AtualizaQryConsulta;
end;

function TFrmPrincipalPreVenda.clienteComRestricaoFinanceira(var restricao:TListaRestricao;VendaAtual : string):Boolean;
var vEmAberto,vCheques,vChDevolvido,vAtraso,vteste1,vLimite : real;
    vAuxi : Char;
    resultado: Boolean;
begin
  restricao := [];
  if (vOrcamento = 'N') or (RgOpcoes.ItemIndex = 0) then
  begin
//    if TestaRestricao then exit;
    // Vou testar a situação financeira do cliente
    if (TRIM(UPPERCASE(copy_campo(CbxCliente.TEXT,'|',1))) <> 'VENDA A CONSUMIDOR') and (vTeste_do_Financeiro = '1') then begin  // testo somente se não for venda a consumidor
      resultado:= False;
//      vauxi:= 'N';
      vteste1:= 0;
      vlimite:= 0;
      vChDevolvido:= 0;
      vAtraso:= 0;
      With ADOSPLiberacao1 do // pega o limite de crédito do cliente
      begin
        close;
        Parameters.ParamByName('@Codigo_Cliente').Value := copy_campo(CbxCliente.Text,'|',2);
        open;
        vLimite := FieldByName('dsLimCredito').AsFloat;
      end;
      if vCliDevedor = 'S' then // Cliente em atraso
      begin
        With ADOSPLiberacao2 do
        begin
          // pega todas as contas abertas e as duplicatas em atraso
          Close;
          Parameters.ParamByName('@CODIGO_CLIENTE').Value := copy_campo(CbxCliente.Text,'|',2);
          Parameters.ParamByName('@DATA').value := DateToStr(StrToDate(vData_Banco) - vDtBloqueio);
          open;
          vAtraso := FieldByName('Saldo').AsFloat;
          if vAtraso > 0 then
          begin
            restricao := [ATRASO];
            resultado:= True;
      //      vauxi := 'S';
          end;
          next;
          vteste1 := FieldByName('Saldo').AsFloat;
        end;
      end;
      With ADOSPLiberacao2 do // pega todas as contas abertas
      begin
        Close;
        Parameters.ParamByName('@CODIGO_CLIENTE').Value := copy_campo(CbxCliente.Text,'|',2);
        Parameters.ParamByName('@DATA').Value           := DateToStr(StrToDate(vData_Banco) + 5000);
        open;
        vEmAberto := FieldByName('Saldo').AsFloat;
        next;
        vteste1 := FieldByName('Saldo').AsFloat;
      end;
      if vLimCredito = 'S' then // Limite de crédito
      begin
        With ADOSPLiberacao3 do
        begin
          close;
          vEmAberto := vTeste1;  // valor de todas as duplicatas em aberto
          Parameters.ParamByName('@CODIGO').Value := copy_campo(CbxCliente.Text,'|',2);
          open;
          vCheques := FieldByName('Saldo2').AsFloat;
          vteste1  := vteste1 + vCheques + StrToFloat(VendaAtual);
          //valorLimiteDisponivel := vLimite - vEmAberto;
          valorLimiteDisponivel := vLimite;
          if (vteste1 > valorLimiteDisponivel) then  // verifica o limite de crédito
          begin
            restricao:= restricao + [LIMITE];
            resultado:= True;
    //        vauxi := 'S';
          end;
        end;
      end;
      if vCheqDev = 'S' then // Cheque devolvido
      begin
        With ADOSPLiberacao4 do
        begin
          close;
          Parameters.ParamByName('@CODIGO').Value := copy_campo(CbxCliente.Text,'|',2);
          open;
          vChDevolvido := FieldByName('Saldo').AsFloat;
          if vChDevolvido > 0 then
          begin
  //          vauxi := 'S';
            restricao:= restricao + [CHEQUE];
            resultado:= True;
          end;
          close;
        end;
      end;
    end
    else
    begin
//      vauxi := 'N'; // venda a consumidor
      resultado:= False;
    end;
  end
  else
  begin
//    vAuxi := 'N';
    resultado:= False;
  end;
//  if vauxi = 'S' then // Se passou por alguma das opções acima então chama a tela de liberação
//  begin
//    Application.OnMessage := FrmPrincipalPreVenda.NaoProcessaMsg;
//    vFlag := '7';
//    FrmPrincipalPreVenda.LiberaVanda;
//    Application.OnMessage := FrmPrincipalPreVenda.ProcessaMsg;
//  end;
  result:= resultado;
end;

{
  Verifica se, ao mudar o cliente na prevenda, o DESCONTO do cliente(cadastro cliente) também é diferente
}
function TFrmPrincipalPreVenda.mudouDescontoCadastroCliente:boolean;
var
  descontoClienteAtual:Real;
begin
  if (codigoClienteAtual <> '') then
  begin
    descontoClienteAtual:= TNEGCliente.getDescontoPercentual(strToIntDef(codigoClienteAtual,-1));
    result:= (descontoClienteAtual <> TNEGCliente.getDescontoPercentual(strToIntDef(copy_campo(cbxCliente.text,'|',2),-1)));
  end
  else
    result:= False;
end;

function TFrmPrincipalPreVenda.mudouClienteAlterandoPrevenda:Boolean;
begin
  result:= ((rgopcoes.itemIndex = 1)and(codigoClienteAtual <> Trim(copy_campo(cbxCliente.text,'|',2))));
end;

{
  Verifica se, ao mudar o cliente na prevenda, o tipo do cliente também é diferente
 (verifica se mudou de um cliente atacado -> varejo ou varejo -> atacado)
}
function TFrmPrincipalPreVenda.mudouTipoClienteAtacadoVarejo:boolean;
var
  eAtacado: boolean;
  stringConexao: string;
begin
  if (codigoClienteAtual <> '') then
  begin
    if UPPERCASE(vEmpresa) = 'GIRORAPIDO' then
    begin
      eAtacado:= (tipoClienteAtual = 'A');
      result:= (eAtacado <> (vAtacadoVarejo = 'A'));
    end
    else
    begin
      stringConexao:= dmodulo.conexao.connectionString;
      eAtacado:= TNEGCliente.clienteAtacado(stringConexao, strToIntDef(codigoClienteAtual,-1));
      result:= (eAtacado <> TNEGCliente.clienteAtacado(stringConexao, strToIntDef(copy_campo(cbxCliente.text,'|',2),-1)))
    end;
  end
  else
    result:= False;
end;

function TFrmPrincipalPreVenda.mudouTipoClienteCrediario: Boolean;
var
  eCrediario: boolean;
  stringConexao: string;

begin
  if (codigoClienteAtual <> '') then
  begin
    if ((UPPERCASE(vEmpresa) <> 'CAMARATUBA')OR(UpperCase(vEmpresa) = 'CARDOSOACESSORIOS')) then
      result:= false
    else
    begin
      stringConexao:= dmodulo.conexao.connectionString;
      eCrediario:= TNEGCliente.isCliente_Crediario(codigoClienteAtual);
      result:= (eCrediario <> TNEGCliente.isCliente_Crediario(copy_campo(cbxCliente.text,'|',2)))
    end;
  end
  else
    result:= False;
end;

procedure TFrmPrincipalPreVenda.CbxClienteEnter(Sender: TObject);
begin
  indiceClienteAtual:= CbxCliente.ItemIndex;
  codigoClienteAtual:= copy_campo(CbxCliente.text, '|', 2);
  if (Label30.caption = 'Cliente -> Atacado') then
      tipoClienteAtual:= 'A'
  else
      tipoClienteAtual:= 'V';
end;

procedure TFrmPrincipalPreVenda.SetarClienteNaCombo(cdCliente:string);
var
  i: integer;
begin
  for I := 0 to (cbxCliente.Items.Count-1) do
    if (copy_campo(cbxCliente.items[i], '|', 2) = CdCliente) then
    begin
      cbxCliente.itemIndex:= i;
      cbxCliente.Text:= cbxCliente.items[i];
      PreencherCamposDoClienteSetadoNaCombo;
      break;
    end;
end;

procedure TFrmPrincipalPreVenda.CbxClienteExit(Sender: TObject);
var vEmAberto,vCheques,vChDevolvido,vAtraso,vteste1,vLimite : real;
    vAuxi : Char;
var
  i, j: integer;
  existeItemLancadoNaGrid, possuiPermissaoParaAlterarCliente: boolean;
  codigoClienteNovo: string;
begin

  // so testa a restrição se estiver incluindo ou alterando uma prevenda
//  vauxi := 'N';

  if ADOQryCliente.Active then
     CbxCliente.ItemIndex:= CbxCliente.Items.IndexOf(ADOQryCliente.FieldbyName('nmPessoa').AsString + ' | ' + ADOQryCliente.FieldbyName('cdPessoa').AsString);
  if EdtCdCliente.Text = '' then begin
    MessageDlg('Selecione um cliente válido na lista de clientes.',mtWarning,[mbOK],0);
    CbxCliente.SetFocus;
    Exit;
  end;
  existeItemLancadoNaGrid:= (sgDados.Cells[0, 1] <> '');
  codigoClienteNovo:= copy_campo(cbxCliente.text,'|',2);
  if (codigoClienteAtual <> codigoClienteNovo) then
    auxiLiberacao := False;
  if UPPERCASE(vEmpresa) = 'GIRORAPIDO' then begin
    Application.OnMessage := FrmPrincipalPreVenda.NaoProcessaMsg;
    if MessageDlgDef2('Qual o tipo deste Cliente?', 'Confirmação', mtConfirmation, [mbYes, mbOk], mrYes, 0) = mrYes then
    begin //Yes - varejo, Ok - atacado
      vAtacadoVarejo  := 'V';
      Label30.caption := 'Cliente -> Varejo';
    end
    else
    begin
      vAtacadoVarejo  := 'A';
      Label30.caption := 'Cliente -> Atacado';
    end;
    Application.OnMessage := FrmPrincipalPreVenda.ProcessaMsg;
  end;
  if mudouClienteAlterandoPrevenda and (Permissao('821','V', False) = 'N') then
  begin
    if FrmCancelamentoVenda.Possui_Permissao('821','V',cbxUsuario.Text,EdtUsuario.Text) then
      possuiPermissaoParaAlterarCliente := true
    else begin
      FrmCancelamentoVenda:= TFrmCancelamentoVenda.Create(Self, '821', 'V', possuiPermissaoParaAlterarCliente);
      FrmCancelamentoVenda.Copyright.Caption :=  '<<<<   Alteração de Cliente    >>>>';
      FrmCancelamentoVenda.showmodal;
    end;
    if (not possuiPermissaoParaAlterarCliente) then
    begin

      // VOLTA PARA O CLIENTE ORIGINAL DA PRÉ-VENDA
      SetarClienteNaCombo(codigoClienteAtual);
      if UPPERCASE(vEmpresa) = 'GIRORAPIDO' then
        if (tipoClienteAtual = 'A') then
        begin //Yes - varejo, Ok - atacado
          vAtacadoVarejo  := 'A';
          Label30.caption := 'Cliente -> Atacado';
        end
        else
        begin
          vAtacadoVarejo  := 'V';
          Label30.caption := 'Cliente -> Varejo';
        end;
    end;
  end;
  if (existeItemLancadoNaGrid)and(mudouTipoClienteAtacadoVarejo or mudouTipoClienteCrediario or mudouDescontoCadastroCliente or Desconto_Fornecedor or (codigoClienteNovo='')) then
  begin
    if Application.MessageBox(PWideChar('Ao mudar para um cliente de tipo diferente(atacado, varejo, desconto do cadastro diferente ou crediário) ou informar um cliente inexistente no cadastro, os produtos lançados serão excluídos da prevenda. Deseja continuar?'),
        'Confirmação',MB_ICONEXCLAMATION + Mb_YesNo) = IdYes then
    begin
      LimpaGrid(prevenda);
      EdtTotal.Text    := '0,00';
      edtValorBruto.text := '0,00';
      EdtSubTotal.Text := '0,00';
      edtQtdItens.Text := '0';
      EdtDesconto.Text := LimpaEdtDesconto;
      codigoClienteAtual:= copy_campo(CbxCliente.text, '|', 2);
      BtnAprazo.Enabled:= True;
      if UPPERCASE(vEmpresa) = 'GIRORAPIDO' then
        tipoClienteAtual:= vAtacadoVarejo;
    end else
    begin
      SetarClienteNaCombo(codigoClienteAtual);
      if UPPERCASE(vEmpresa) = 'GIRORAPIDO' then
        if (tipoClienteAtual = 'A') then
        begin //Yes - varejo, Ok - atacado
          vAtacadoVarejo  := 'A';
          Label30.caption := 'Cliente -> Atacado';
        end
        else
        begin
          vAtacadoVarejo  := 'V';
          Label30.caption := 'Cliente -> Varejo';
        end;
    end;
  end else
  begin
    codigoClienteAtual:= copy_campo(CbxCliente.Text,'|',2);
    if UPPERCASE(vEmpresa) = 'GIRORAPIDO' then
       tipoClienteAtual:= vAtacadoVarejo;
  end;
  if TestaRestricao then      {6T9Q-QBN8-6JAH}
     exit;
  if clienteComRestricaoFinanceira(restricaoFinanceira,EdtSubTotal.Text) then
  begin //restricaoFinanceira in [ATRASO,CHEQUE]
    if ((ATRASO in restricaoFinanceira) or (CHEQUE in restricaoFinanceira)) and TestaFinanceiroNaConfirmacao then
    begin
      Application.OnMessage := FrmPrincipalPreVenda.NaoProcessaMsg;
      if Application.MessageBox(PWideChar('Restrição: '+getMensagemRestricao(restricaoFinanceira) + #13#10 + #13#10 + 'Pode ser necessária liberação por senha na confirmação, deseja continuar a prevenda?'),
        'Confirmação',MB_ICONEXCLAMATION + Mb_YesNo) = IdNo then
      begin
        CbxCliente.SetFocus;
        Application.OnMessage := FrmPrincipalPreVenda.ProcessaMsg;
        Exit;
      end else
      begin
        EdtConsulta.SelectAll;
        EdtConsulta.SetFocus;
        Application.OnMessage := FrmPrincipalPreVenda.ProcessaMsg;
      end;
    end else if (((ATRASO in restricaoFinanceira) or (CHEQUE in restricaoFinanceira))and(auxiLiberacao = false)) then
    begin
      Application.OnMessage := FrmPrincipalPreVenda.NaoProcessaMsg;
      vFlag := '7';
      FrmPrincipalPreVenda.LiberaVanda;
      Application.OnMessage := FrmPrincipalPreVenda.ProcessaMsg;
      CbxCliente.SetFocus;
    end
  end;
  begin
    codigoClienteAtual:= copy_campo(CbxCliente.Text,'|',2);
    if UPPERCASE(vEmpresa) = 'GIRORAPIDO' then
       tipoClienteAtual:= vAtacadoVarejo;
  end;
  if UPPERCASE(vEmpresa) = 'PROAUTO' then
     ProautoPreencherVDescontoCliente(EdtCdCliente.Text);
  if UPPERCASE(vEmpresa) <> 'GIRORAPIDO' then
     preencherVariaveisCliente(EdtCdCliente.Text);
  AtualizaQryConsulta;
  if UPPERCASE(vEmpresa) = 'GIRORAPIDO' then
    EdtConsulta.SetFocus;
  // prevenda.Cliente:= TNEGCliente.getCliente(StrToIntDef(codigoClienteAtual, -1));
end;

{ Preenche a variável vDescontoCliente, que só é usada para o cliente PROAUTO }
procedure TFrmPrincipalPreVenda.ProautoPreencherVDescontoCliente(codCliente:string);
var
  query: TADOquery;
begin
  query:= TADOquery.create(self);
  query.Connection:= DModulo.Conexao;
  with query do
  begin
    Sql.Text := 'Select dsmotivo from cliente WITH (NOLOCK) where cdPessoa = :CDCLIENTE';
    if Length(codCliente) <> 0  then
      Parameters.ParamByName('CDCLIENTE').Value := codCliente
    else                                     // caso n tenha nehum cliente selecionado vou forçar o codigo 1 p n dar mensagem de erro p o usuário
      Parameters.ParamByName('CDCLIENTE').Value := 1;
    Open;
    if FieldByname('dsMotivo').asString <> '' then
    begin
      try
        vDescontoCliente := StrToFloat(FormatFLoat('0.00',FieldByname('dsMotivo').asFloat));
      except
        vDescontoCliente := 0;
        ShowMessage('O desconto do cliente está definido incorretamente. Verifique no cadastro do cliente!');
      end;
    end else
      vDescontoCliente := 0;
  end;
end;

{ preenche variáveis de acordo com o cliente selecionado  }
procedure TFrmPrincipalPreVenda.preencherVariaveisCliente(codCliente:string);
var
  query: TADOquery;
begin
  query:= TADOquery.create(self);
  query.Connection:= DModulo.Conexao;
  with query do
  begin
    Sql.Text := 'Select dsAtacado from cliente WITH (NOLOCK) where cdPessoa = :CDCLIENTE';
    if Length(codCliente) <> 0  then
      Parameters.ParamByName('CDCLIENTE').Value := codCliente
    else                                     // caso n tenha nehum cliente selecionado vou forçar o codigo 1 p n dar mensagem de erro p o usuário
      Parameters.ParamByName('CDCLIENTE').Value := 1;
    Open;
    if UpperCase(Fieldbyname('dsAtacado').AsString) = 'S' then
    begin
      vAtacadoVarejo  := 'A';
      Label30.caption := 'Cliente -> Atacado';
    end else
    begin
      vAtacadoVarejo  := 'V';
      Label30.caption := 'Cliente -> Varejo';
    end;
  end;
end;

function TFrmPrincipalPreVenda.TestaRestricao: Boolean;
begin
  TestaRestricao := False;
  with AdoQryLocaliza do
  begin
    Sql.Text := 'Select dsrestricao, dsMotivo from cliente WITH (NOLOCK) where cdPessoa = :CDCLIENTE';
    if Length(EdtCdCliente.Text) <> 0  then
      Parameters.ParamByName('CDCLIENTE').Value := EdtCdCliente.Text
    else                                     // caso n tenha nehum cliente selecionado vou forçar o codigo 1 p n dar mensagem de erro p o usuário
      Parameters.ParamByName('CDCLIENTE').Value := 1;
    Open;
    if UPPERCASE(vEmpresa) = 'PROAUTO' then
       ProautoPreencherVDescontoCliente(EdtCdCliente.Text);
    if UpperCase(Fieldbyname('dsrestricao').AsString) = 'S' then
    begin
      Application.OnMessage := FrmPrincipalPreVenda.NaoProcessaMsg;
      ShowMessage('Restrição para pré-venda: '+ FieldByname('dsMotivo').asString);
      Testarestricao        := True;
      if (RgOpcoes.ItemIndex = 0) or (RgOpcoes.ItemIndex = 2) then
        CbxCLiente.SetFocus
      else
        edtLancto.SetFocus;
      Application.OnMessage := FrmPrincipalPreVenda.ProcessaMsg;
      exit;
    end;
  end;
end;

procedure TFrmPrincipalPreVenda.Timer2Timer(Sender: TObject);
begin
  if lblMensagem.Left=panel1.Width then
    lblMensagem.Left:=-(lblMensagem.Width)
  else
    lblMensagem.Left:=lblMensagem.Left+1;
end;

procedure TFrmPrincipalPreVenda.Consultapedidodecompra1Click(Sender: TObject);
begin
  //if (UpperCase(vEmpresa) = 'LAMARAO') or (UpperCase(vEmpresa) = 'AUTOCAR')or(UpperCase(vEmpresa) = 'TOPLINE') or (UpperCase(vEmpresa) = 'TREVO')  then  // nao fazer p autocar
  if (TNEGLoja.getExibirQuantidadesReservadasPreVenda) and (UpperCase(vEmpresa) = 'PTINTAS_') then
    Exit;
{  With ADOSP_PEDIDO_GARANTIA do begin
    Close;
    Parameters.ParamByName('@OPCAO').Value  := 'P';
    Parameters.ParamByName('@CODIGO').Value := ADOSPConsulta.FieldByName('Código').AsInteger;
    Open;
    Label13.Caption := FieldByName('dtEmissao').AsString;
    Label11.Text := FormatFloat('#,##0.00',ADOSP_PEDIDO_GARANTIA.FieldByName('NrQtd').AsFloat);
  end; }
  with AdoQrySimilar do
  begin
    Sql.Text:= 'Select P.cdPessoa,P.dtEmissao,P.dtChegada,P.dsFormaPgto,                                    '+
               'P.cdPessoa_1,P.ds_Frete,P.cdTransp,P.nrDesconto,P.dsObs, isnull(P.dsFlag,''N'') as dsFlag,  '+
               'I.cdProduto,I.NrQtd,I.vlUnitario,I.nrIcms,I.nrFrete,                                        '+
               'I.nrIpi,I.dsReferForn,isnull(nrQtdChegada,0) as nrQtdChegada,W.nmProduto                    '+
               'From PedidoCompra P WITH (NOLOCK), ItePedComp I WITH                                        '+
               '(NOLOCK), Produto W WITH (NOLOCK)                                                           '+
               'Where  I.cdProduto = :CDPRODUTO and isnull(P.dsFlag,''N'') <> ''S'' and                     '+
               'P.nrLancto = I.nrLancto and I.cdProduto = W.cdProduto                                       '+
               'and P.nrLancto = I.nrLancto and I.nrqtd > isnull(I.nrqtdchegada,0) Order by P.dtChegada asc ';
    Parameters.ParamByName('CDPRODUTO').Value := ADOSPConsulta.FieldByName('Código').AsInteger;
    Open;
    if (FieldByName('dtChegada').AsDateTime <> 0) then
      Label13.Text:= DateToStr(DateOf(FieldByName('dtChegada').AsDateTime))
    else
      Label13.Text:= '__/__/____';
    Label11.Text:= FormatFloat('#,##0.00',FieldByName('NrQtd').AsFloat - FieldByName('NrQtdChegada').AsFloat);
    Label11.Refresh;
    Label13.Refresh;
  end;
end;

procedure TFrmPrincipalPreVenda.ConsultaGarantia;
begin
{  With ADOSP_PEDIDO_GARANTIA do begin
    Close;
    Parameters.ParamByName('@OPCAO').Value  := 'G';
    Parameters.ParamByName('@CODIGO').Value := ADOSPConsulta.FieldByName('Código').AsInteger;
    Open;
    label15.Text := FormatFloat('#,##0.00',ADOSP_PEDIDO_GARANTIA.FieldByName('NQtd').AsFloat);
  end; }
  with ADOQuery1 do
  begin
    Sql.Text := 'Select SUM(I.nrQtd) as Qtd,I.cdProduto                            '+
                'FROM ((Lancto L WITH (NOLOCK) INNER JOIN Pessoa C WITH (NOLOCK) ON L.cdPessoa = C.cdPessoa) '+
                'INNER JOIN IteLcto I WITH (NOLOCK) ON (L.dsstatus = I.dsstatus) AND '+
                '(L.cdPessoa = I.cdPessoa) AND (L.dslancamento = I.dslancamento))  '+
                'INNER JOIN Produto P WITH (NOLOCK) ON I.cdProduto = P.cdProduto   '+
                'Where L.dtEmissao >= GETDATE() - 90 and L.dtEmissao <= GETDATE()  '+
                'and I.cdProduto = :CODIGO and I.dsstatus in (''Q'') and           '+
                'L.dsCancelado is null and I.cdProduto = P.cdProduto               '+
                'group by I.nrqtd,I.cdProduto                                      ';
    Parameters.ParamByName('CODIGO').Value := ADOSPConsulta.FieldByName('Código').AsInteger;
    Open;
    label15.Text := FormatFloat('#,##0.00',ADOQuery1.FieldByName('Qtd').AsFloat);
  end;
  { TODO -oclaudioo -c : corrigir o o lançaProdutos, o segundo lote lançado automaticamente está ficando com o código do produto errado 08/05/2013 11:52:49 }
end;

procedure TFrmPrincipalPreVenda.preencheArrayLinhasDestacadas;
var
  i: integer;
  produto : TDOMProduto;
begin
  limparArrayBoolean(arrayLinhasDestacadas,0,299,False);
  for i:= 1 to SgDados.RowCount-1 do
  begin
    if (trim(SgDados.Cells[0,i])<>'') and (vDestacarItensOcupados) and ((RgOpcoes.ItemIndex = 0)or((transformarOrcamentoPrevenda = true) and (RgOpcoes.ItemIndex = 1))) then begin
        produto:= TNEGProduto.buscarProduto(Strtoint(SgDados.Cells[0,i]));
        if (vEstqNegativo <> 'S') and
         (((qtdInsuficienteParaPrevend(StrToInt(SgDados.Cells[0,i]), strToFloatDef(SgDados.Cells[2,i],0)) > 0)and(produto.tipoComposicao <> composto))
         or ((produto.tipoComposicao = composto)and(TNEGProduto.getEstoquePossivelProdutoComposto(produto.cdproduto,1)<=0))) then
            ArraylinhasDestacadas[i]:= True
        else
            ArraylinhasDestacadas[i]:= False
    end
    else
      break;
  end;
end;

procedure TFrmPrincipalPreVenda.Excluiritens1Click(Sender: TObject);
var
  L,C,Lauxi:Integer;
begin
  if SgDados.Focused then
  begin
    if MessageDlg('Deseja excluir esta linha?',mtConfirmation,[mbYes,mbNo],0) <> mrYes then
    begin
      Application.OnMessage := NaoProcessaMsg;
      EdtConsulta.SetFocus;
      Application.OnMessage := ProcessaMsg;
      exit;
    end;
    EdtTotal.Text := FormatFloat('0.00',StrToFloat(EdtTotal.Text) - (StrToFloat(SgDados.Cells[9,SgDados.Row]) * StrToFloat(SgDados.Cells[2,SgDados.Row])));
    edtValorBruto.Text := FormatFloat('0.00',StrToFloat(edtValorBruto.Text) -
    (StrToFloatDef(SgDados.Cells[9,SgDados.Row],0)*StrToFloatDef(SgDados.Cells[2,SgDados.Row],0)));
    EdtDescontoExit(Self);
    with SgDados do
    begin
      if Row = RowCount -1 then
      begin  // limpa quando a grid tem só uma linha
        for C := 0 to ColCount do
          Cells[C,Row] := '';
      end else
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
      for L := Row to RowCount -1 do
      begin
        if Cells[0,L] = '' then
        begin
          Row := L;
          Break;
        end;
      end;
    end;
    SgDados.Refresh;
    preencheArrayLinhasDestacadas;
    sgDados.Repaint;
    Application.OnMessage := NaoProcessaMsg;
    cbxUsuario.SetFocus;
    Application.OnMessage := ProcessaMsg;
    setLabel23(QuantidadeDispEmLotes(ADOSPConsulta.FieldByName('Código').AsInteger));
  end;
end;

procedure TFrmPrincipalPreVenda.Desconto1Click(Sender: TObject);
begin
  if BtnAprazo.Enabled = true then
    BtnAprazoClick(self);
end;

{Varro a grid e verifico se o produto tem o limite de desconto setado por Fornecedor para evitar
 a mudanca de cliente na combo somente se realmente houver um desconto dado}
function TFrmPrincipalPreVenda.Desconto_Fornecedor: Boolean;
var
  x : integer;
begin
  if (vLimitarDescontoFornecedor = true) and (codigoClienteAtual <> '') then
  begin
    for x := 1 to SgDados.RowCount do
    begin
      if SgDados.Cells[9,x] = '' then
         break;
      if (GetLimiteDescontoFornecedor(StrToInt(codigoClienteAtual),StrtoInt(SgDados.Cells[0,x])) > 0)
         and (TNEGCliente.getTipoPessoa(StrToInt(codigoClienteAtual)) <> TNEGCliente.getTipoPessoa(strToIntDef(copy_campo(cbxCliente.text,'|',2),-1)))
      then
        if (StrtoFloat(SgDados.Cells[3,x]) < StrtoFloat(SgDados.Cells[9,x])) //Desconto por item
          or (StrtoFloat(EdtDesconto.Text)>0)
        then
        begin  //Desconto no total
          Result := true;
          exit;
        end;
    end;
  end;
  Result := false;
end;

procedure TFrmPrincipalPreVenda.CbxClienteKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = Char(27)) then
    BtnCancelar.Click;
end;

procedure TFrmPrincipalPreVenda.CbxNomeKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = Char(27)) then
    BtnCancelar.Click;
end;

procedure TFrmPrincipalPreVenda.cbxUsuarioChange(Sender: TObject);
begin
  limparDadosDoUsuario;
end;

procedure TFrmPrincipalPreVenda.cbxUsuarioExit(Sender: TObject);
begin
  if (cbxUsuario.ItemIndex < 0) and (cbxUsuario.text <> '') then
  begin
    cbxUsuario.text:= '';
    cbxUsuario.SetFocus;
  end;
end;

procedure TFrmPrincipalPreVenda.BtnAprazoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = Char(27)) then
    BtnCancelar.Click;
end;

procedure TFrmPrincipalPreVenda.BtnConfirmarKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = Char(27)) then
    BtnCancelar.Click;
end;

procedure TFrmPrincipalPreVenda.BtnCancelarKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = Char(27)) then
    BtnCancelar.Click;
end;

procedure TFrmPrincipalPreVenda.BtnSairKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = Char(27)) then
    BtnCancelar.Click;
end;

procedure TFrmPrincipalPreVenda.SgDadosKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = Char(27)) then
    BtnCancelar.Click
  else
  if (SgDados.Col <> 2)or(SgDados.Cells[0, sgdados.Row] = '') then
    key:= #0
  else
    ValidarNumero(key);
  //quantidade := StrToFloatDef(SgDados.Cells[2, sgdados.Row],0);
end;

procedure TFrmPrincipalPreVenda.SgDadosKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  cdproduto: integer;
begin
  if (SgDados.Col = 2)and(SgDados.Cells[0, sgdados.Row] <> '') then
  begin
    //quantidade:= StrToFloatDef(SgDados.Cells[2, sgdados.Row],0);
    cdproduto:= StrToInt(SgDados.Cells[0, sgdados.Row]);
    if (StrToFloatDef(SgDados.Cells[2, sgdados.Row],0) > 0) then
    begin
      //quantidade:= StrToFloatDef(SgDados.Cells[2, sgdados.Row], 0);
      atualizarQuantidadeNaGrid(cdproduto, StrToFloatDef(SgDados.Cells[2, sgdados.Row],0), quantidade);
    end
    else
    begin
      indexGridAux := SgDados.Row;
//      SgDados.Cells[2, SgDados.Row]:= FormatFloatQ(vCasasQtd, quantidade);
//      atualizarQuantidadeNaGrid(cdproduto, StrToFloatDef(SgDados.Cells[2, sgdados.Row],0), quantidade);
//      sgDados.Repaint;
    end;
  end;
end;

procedure TFrmPrincipalPreVenda.DBGrid1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = Char(27)) then
    BtnCancelar.Click;
  ConsultaReserva;
  if usarLoteValidade = True then
  begin
     montaComboLote;
     setLabel23(QuantidadeDispEmLotes(ADOSPConsulta.FieldByName('Código').AsInteger));
  end;
  Consultapedidodecompra1Click(Sender);
end;

procedure TFrmPrincipalPreVenda.Alterar1Click(Sender: TObject);
begin
  RgOpcoes.ItemIndex := 1;
end;

procedure TFrmPrincipalPreVenda.Oramento1Click(Sender: TObject);
begin
  RgOpcoes.ItemIndex := 2;
end;

procedure TFrmPrincipalPreVenda.ConsultaPreVendas;
var
  query: TADOQuery;
  qtdPrevendas, qtdDeposito: integer;
begin
  query:= TADOQuery.Create(self);
  query.Connection:= DModulo.Conexao;
  label15.Text := '0';
  if ADOSPConsulta.RecordCount > 0 then
  begin
    with query do  // Vou pegar o q está reservado  ( OU SEJA NAS OS )
    begin
      Sql.Text := 'SELECT Sum(I.nrQtd) as Qtd FROM Orcamento O WITH (NOLOCK) INNER JOIN IteOrcamento '+
                    'I WITH (NOLOCK) ON O.nrOrcamento = I.nrOrcamento Where I.cdproduto = :CDPRODUTO '+
                    'and I.dsSituacao <> ''C'' and O.dsImpresso = ''N'' AND o.nrobjeto = 0';
      Parameters.ParamByName('CDPRODUTO').Value := ADOSPConsulta.FieldByName('Código').AsString;
      Open;
      if query.FieldByName('Qtd').AsString = '' then
         label15.Text := '0,00'
      else // if (UpperCase(vEmpresa) <> 'AUTOCAR') then
        label15.Text := FormatFloat('0.00',FieldByName('Qtd').AsFloat)
    end;
  end
  else
    label15.Text := '0,00';
  FreeAndNil(query);
  Label15.Refresh;
  Label11.Refresh;
end;

procedure TFrmPrincipalPreVenda.ConsultaReserva;
var
  query: TADOQuery;
  qtdPrevendas, qtdDeposito: integer;
begin
  query:= TADOQuery.Create(self);
  query.Connection:= DModulo.Conexao;
  if NOT(UpperCase(vEmpresa) = 'PTINTAS') then
    lblReserva.Text := '0';
  if ADOSPConsulta.RecordCount > 0 then
  begin
    with ADOQuery1 do  // Vou pegar o q está reservado  ( OU SEJA NAS OS )
    begin
//      if (UpperCase(vEmpresa) = 'NACIONAL')
//          or (UpperCase(vEmpresa) = 'REIDOFIAT')
//          or (UpperCase(vEmpresa) = 'AUTOCAR')
//          or (UpperCase(vEmpresa) = 'TOPLINE')
//          or (UpperCase(vEmpresa) = 'TREVO')
//          or (UpperCase(vEmpresa) = 'MECATTRON')
//          or (UpperCase(vEmpresa) = 'LAMARAO')
//      then
      if ((TNEGLoja.getExibirQuantidadesReservadasPreVenda)OR(UpperCase(vEmpresa) = 'NACIONAL')) then
      begin
        Sql.Text := 'SELECT Sum(I.nrQtd) as Qtd FROM Orcamento O WITH (NOLOCK) INNER JOIN IteOrcamento I '+
                    'WITH (NOLOCK) ON O.nrOrcamento = I.nrOrcamento Where I.cdproduto = :CDPRODUTO '+
                    'and I.dsSituacao <> ''C'' and O.dsImpresso <> ''S'' and O.nrObjeto <> 0 ';
      end
      else
      begin
        Sql.Text := 'SELECT Sum(I.nrQtd) as Qtd FROM Orcamento O WITH (NOLOCK) INNER JOIN IteOrcamento '+
                    'I WITH (NOLOCK) ON O.nrOrcamento = I.nrOrcamento Where I.cdproduto = :CDPRODUTO '+
                    'and I.dsSituacao <> ''C'' and O.dsImpresso = ''N'' ';
      end;
      Parameters.ParamByName('CDPRODUTO').Value := ADOSPConsulta.FieldByName('Código').AsString;
      Open;
      if NOT(UpperCase(vEmpresa) = 'PTINTAS') then begin
        if ADOQuery1.FieldByName('Qtd').AsString = '' then
           lblReserva.Text := '0,00'
        else // if (UpperCase(vEmpresa) <> 'AUTOCAR') then
          lblReserva.Text := FormatFloat('0.00',FieldByName('Qtd').AsFloat);
      end;
    end;
//    if (UpperCase(vEmpresa) = 'AUTOCAR') or (UpperCase(vEmpresa) = 'TOPLINE') or
//       (UpperCase(vEmpresa) = 'TREVO') or (UpperCase(vEmpresa) = 'MECATTRON') or (UpperCase(vEmpresa) = 'LAMARAO')
    if (TNEGLoja.getExibirQuantidadesReservadasPreVenda) and (UpperCase(vEmpresa) = 'PTINTAS_') then
    begin
      ConsultaPreVendas;
      Label11.Text := FormatFloat('0.00',ADOSPConsulta.FieldByName('estoque').AsFloat -
                ADOQuery1.FieldByName('Qtd').AsFloat - StrToFloatDef(label15.Text,0));
    end
    else if (TNEGLoja.getExibirQuantidadesReservadasPreVenda) then begin
      ConsultaPreVendas;
      edtDisponivel.Text := FormatFloat('0.00',ADOSPConsulta.FieldByName('estoque').AsFloat -
                ADOQuery1.FieldByName('Qtd').AsFloat - StrToFloatDef(label15.Text,0));
    end;
  end
  else begin
    if NOT(UpperCase(vEmpresa) = 'PTINTAS') then
      lblReserva.Text := '0,00';
  end;
end;

procedure TFrmPrincipalPreVenda.EdtCdNomeChange(Sender: TObject);
begin
  //vcdVendedor := EdtCdNome.Text;
end;

procedure TFrmPrincipalPreVenda.EdtCdNomeExit(Sender: TObject);
begin

// claudio 10-09-2015
//  if (Length(EdtCdNome.Text) > 0) then begin
//    ADOQryNome.Open;
//    if (ADOQryNome.Locate('cdPessoa',EdtCdNome.Text,[])) then begin
//      CbxNome.Text := ADOQryNome.FieldByName('nmPessoa').AsString;
//      vlDescontoVendedor := ADOQryNome.FieldByName('vlDesconto').AsFloat;
//    end else begin
//      CbxNome.ItemIndex := -1;
//      CbxNome.Text := '';
//      ADOQryNome.Close;
//    end;
//  end else begin
//    CbxNome.ItemIndex := -1;
//    CbxNome.Text := '';
//  end;
end;

procedure TFrmPrincipalPreVenda.Cancelar;
begin
  EdtConsulta.Clear;
  vProdutoPromocao := '';
  vLancamento := '';
  EdtSubTotal.Text := '0,00';
  EdtDesconto.Text := LimpaEdtDesconto; //atribui '0' formatado ao edit
  EdtTotal.Text    := '0,00';
  edtValorBruto.text := '0,00';
  CbxCliente.ItemIndex := 0;
  //edtLogin.Clear;
  CbxCliente.enabled   := true;
  CbxClienteChange(Self);
  if EdtLancto.text <> '' then
    DesbloqueiaAlteracaoPreVenda(StrToInt(EdtLancto.text));
  UltimoLancamento;
  LimpaGrid(prevenda);
  if (vMudaPreco = 'N') and (edtpreco.Enabled) then
  begin
    EdtPreco.Enabled := False;
    EdtPreco.Color := clInfoBk;
    EdtDescUnit.Enabled := False;
    EdtDescUnit.Color := clInfoBk;
    EdtConsulta.SetFocus;
  end;
  if not liberaDigitacaoLancamento then begin
    EdtLancto.Color := clInfoBk;
    EdtLancto.Enabled  := False;
    EdtLancto.ReadOnly := True;
  end;
  EdtCFOP.Clear;
  //CbxCLiente.SetFocus;
  //if RgOpcoes.ItemIndex = 1 then
  // RgOpcoes.ItemIndex := 0;
  if UPPERCASE(vEmpresa) <> 'TREVO' then begin
    if UPPERCASE(vEmpresa) = 'SANTANA' then
      RgOpcoes.ItemIndex := 2
    else
      RgOpcoes.ItemIndex := 0;
  end;
  CbxNome.Text    := '';
  edtcdnome.Text  := '';
  //edtusuario.Text := '';
  edtcdLista.Text := '';
  BtnAprazo.Enabled := True;
  vlTotalAnterior := 0;
  ListBox1.Clear;
  ListBox1.Visible:=false;
  EdtUsuarioExit(Self);
//  FrmPedeSenha.editUsuario.SetFocus;
//  FrmPedeSenha.editUsuario.SelectAll;
end;

procedure TFrmPrincipalPreVenda.Cancelaraprvenda1Click(Sender: TObject);
begin
  FrmRelSaida := TFrmRelSaida.Create(Application);
  try
    FrmPrincipalPreVenda.Enabled := False;
    FrmRelSaida.Position := poMainFormCenter;
    FrmRelSaida.ShowModal;
  finally
    FrmPrincipalPreVenda.Enabled := True;
  end;


//  FrmRelSaida := TFrmRelSaida.Create(Application);
//  try
//    FrmPrincipalPreVenda.Enabled := False;
//    FrmRelSaida.Position := poMainFormCenter;
//    FrmRelSaida.Show;
//  except
//    FrmRelSaida.Free;
//    FrmPrincipalPreVenda.Enabled := True;
//  end;
end;

procedure TFrmPrincipalPreVenda.CdigoAdicional1Click(Sender: TObject);
begin
  RadioGroup1.ItemIndex := 4;
end;

procedure TFrmPrincipalPreVenda.EdtConsultaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if RadioGroup1.ItemIndex = 0 then //CODIGO
    ValidarNumero(Key);
  if (Key = Char(13)) and (RadioGroup1.ItemIndex = 4) then begin
    AtualizaQryConsulta;
//    With AdoSPConsulta do begin
//      Close;
//      if CheckBox1.Checked = false then
//        Parameters.ParamByName('@DSATIVO').Value := Null
//      else
//        Parameters.ParamByName('@DSATIVO').Value := 'S';
//      Parameters.ParamByName('@ATACADOVAREJO').Value := vAtacadoVarejo;
//      if (Copy(EdtConsulta.Text,1,1) = '2') then  // codigo da balança
//        Parameters.ParamByName('@PESQUISA').Value := Copy(EdtConsulta.Text,1,7)
//      else
//        Parameters.ParamByName('@PESQUISA').Value      := EdtConsulta.Text;
//      Parameters.ParamByName('@OPCAO').Value        := '7'; // pesqisa CODIGO DE BARRAS
//      ADOSPConsultaValor.DisplayFormat   := '#0.00';
//      ADOSPConsultaEstoque.DisplayFormat := '#0.00';
//      ADOSPConsultaPedido.DisplayFormat  := '#0.00';
//      Open; // mostra os dados no dbgrid
//      EdtPreco.Text := FormatFloat('0.000',FieldByName('Valor').AsFloat);
//      montaComboLote;
//      setLabel23(QuantidadeDispEmLotes(ADOSPConsulta.FieldByName('Código').AsInteger));
//      if UpperCase(vEmpresa) = 'ODONTO' then
//        label15.Text     := FormatFloat('0.00',PegaValorAtacado(AdoSpConsulta.FieldByName('código').asInteger));
//      LblListados.Caption := 'Listados --> ' + IntToStr(RecordCount);
//    end;
  end;
  if (Key = Char(27)) then
    BtnCancelar.Click;
end;

procedure TFrmPrincipalPreVenda.ImprimeComprovante(valor: integer);
var Arq : TextFile;
    vcampo_1,vcampo_2,vcampo_3,vcampo_4,vcampo_5,vcampo_6, vcampo_7 : String[50];
    vTotal,vTotalD, VdescontoReal, vDescontoPorc : real;
    vtitulo,vformapag,vvencimento : String;
    i : integer;
    vnumero_invertido : string[10];  // usado p inverter o numero da prevenda na impressão da via do estoquista
    impressoraSelecionada : Boolean;
    numeroLancamento:integer;
    isPrevendaOuOrcamento, isReimpressao: Boolean;
begin
  Editor.Clear;
  if ((UpperCase(vEmpresa) = 'CAMARATUBA')or(UpperCase(vEmpresa) = 'CARIOCA')OR(UpperCase(vEmpresa) = 'CARDOSOACESSORIOS')) and (vImpressao_40 = 'S') then
  begin

  end else if ((UpperCase(vEmpresa) = 'DISCABOS') OR (UpperCase(vEmpresa) = 'TREVO')) and (vImpressao_80 = 'S' ) and (vOrcamento = 'O') then
  begin  //((UpperCase(vEmpresa) = 'DISCABOS') and (vImpressao_80 = 'S' )) or (vOrcamento = 'O')
    ImprimeOrcamento(valor);
    //exit;
  end else if (UPPERCASE(vEmpresa) = 'CICLOMOTOS') and (vOrcamento = 'O') then
  begin
    ImprimeOrcamento(valor);
    exit;
  end else if ((UpperCase(vEmpresa) = 'DISCABOS')  OR (UpperCase(vEmpresa) = 'TREVO')) and (vOrcamento = 'O') then
  begin  //((UpperCase(vEmpresa) = 'DISCABOS') and (vImpressao_80 = 'S' )) or (vOrcamento = 'O')
    ImprimeOrcamento(valor);
    exit;
  end;
  if ((vImpressao_40 = 'S') AND (vOrcamento <> 'O')) OR ((vImpressao_40 = 'S') and ((UpperCase(vEmpresa) <> 'DISCABOS') OR (UpperCase(vEmpresa) <> 'TREVO'))) then
  begin // antes if (vOrcamento <> 'O') and (vImpressao_40 = 'S') then begin
    if (UpperCase(vEmpresa) = 'SODUCATO') then
    begin
      if MessageDlg('Deseja imprimir o Comprovante Pequeno da Pré-Venda \ Orçamento de nº '+ EdtLancto.Text + ' ?',
        mtConfirmation,[mbYes, mbNo],0) = mrNO then
        exit;
    end;
//    if not FileExists('Texto.txt') then   // Caso não encontre o arquivo tenta criar
//      AssignFile(Arq,Pchar(ExtractFilePath(Application.ExeName)+'Texto.txt'));  // cria o arquivo
    if not FileExists('Print.bat') then   // Caso não encontre o arquivo tenta criar
      ShowMessage('Arquivo Print.bat não foi encontrado!');
    if FileExists('Print.bat') then
    begin // and (vOrcamento <> 'O') // FileExists('Texto.txt') and
      if (UPPERCASE(vEmpresa) = 'LLPARAFUSOS') then
      begin
         ImprimeLL(valor);
         exit;
      end;
  //    if (MessageDlg('Deseja imprimir o comprovante de nº '+ EdtLancto.Text + ' ?',mtConfirmation,[mbYes, mbNo],0) = mrYes) then begin
      if (UPPERCASE(vEmpresa) = 'LLPARAFUSOS') or (UPPERCASE(vEmpresa) = 'DISCABOS') then
        vPergunta_Apos_Comprovante := '2';  // não pergunta se quer imprimir a pre-venda
      vformapag   := '';
      vvencimento := '';
      if (RgOpcoes.ItemIndex = 0) or ((vorcamento = 'N') and (RgOpcoes.ItemIndex = 1)) then
        vtitulo := 'PRE-VENDA'
      else if RgOpcoes.ItemIndex = 2 then
        vtitulo := 'ORCAMENTO';
      // esta primeira impressão referente ao bloco abaixo é somente p a ELETRONICAf NACIONAL
      if FileExists('Texto.txt') and FileExists('Print.bat') and ((UpperCase(vEmpresa) = 'NACIONAL') or (UpperCase(vEmpresa) = 'CICLOMOTOS')) and (RgOpcoes.ItemIndex <> 2) and (vOrcamento <> 'O') then begin
        Editor.Lines.Add('############################################');
        Editor.Lines.Add('Orcamento N. '+ EdtLancto.Text);
        Editor.Lines.Add('Cliente:     '+ copy_campo(CbxCliente.Text,'|',1));
        Editor.Lines.Add('Vendedor:    '+ CbxNome.Text);
        Editor.Lines.Add('Data:        '+ DatetoStr(Date) + '  '+TimeToStr(Time));
        Editor.Lines.Add('Valor:       '+ EdtSubTotal.Text);
        Editor.Lines.Add(vformapag);
        if(vMemo <> nil) then
          for i := 0 to vMemo.Lines.Count -1 do
            Editor.Lines.Add(vMemo.Lines[i]);
        Editor.Lines.Add('############################################');
    //    Editor.Lines.Add('Condicao: '+ vMemo);
        Editor.Lines.Add('');
        Editor.Lines.Add('');
        Editor.Lines.Add('');
        Editor.Lines.Add('');
        Editor.Lines.Add('');
        Editor.Lines.Add('');
        Editor.Lines.Add('');
        Editor.Lines.Add('');
        Editor.Lines.Add('');
        if    (UPPERCASE(vEmpresa) = 'CICLOMOTOS') // Ciclomotos e Trevo não imprimirão em um arquivo só
           or (UPPERCASE(vEmpresa) = 'TREVO')
        then
        begin
          try
            AssignFile(Arq,'Texto.txt');
            Erase(Arq);
            Rewrite(Arq);
            Writeln(Arq,Editor.Text);
          Finally
            CloseFile(Arq);
          end; // try
          if vPAFECF = False then
             WinExec(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'print.bat')),sw_ShowNormal);
          Sleep(6000);
          if not FileExists('Print.bat') then
             ShowMessage('Não foi encontrado o arquivo Print.bat');
        end;
      end;
      if (UPPERCASE(vEmpresa) = 'CICLOMOTOS') then // ciclomotos n imprime os ítens
        exit;
      if (UpperCase(vEmpresa) = 'TREVO') or (UpperCase(vEmpresa) = 'LOCMAQ') then begin
        if MessageDlg('Imprimir na impressora do estoque?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
          impressoraSelecionada := True    // imprime no estoque ( padrao )
        else
          impressoraSelecionada := False;  // imprime na outra impressora
      end;
//      vTotal := 0; // total sem desconto
//      vTotalD := 0; // total com desconto
//      VdescontoReal := 0;
//      vDescontoPorc := 0;
//      With ADOQryLocaliza do
//      begin
//        Sql.Text := 'Select P.nmPessoa,T.nmProduto,T.dsReferencia,T.cdFabricante,O.cdPessoa,O.nrOrcamento,'+ // monta a query para a impressao do orcamento
//                    'I.cdProduto,O.dtEmissao,I.NrQtd,I.vlPreco,O.nrDesconto,O.dsImpresso,O.dtEmissao,     '+
//                    'O.cdCliente,T.dsUnidade,T.dsPrateleira,T.dsProdutoNota                               '+
//                    'From Orcamento O WITH (NOLOCK),Pessoa P WITH (NOLOCK),Produto T WITH (NOLOCK),       '+
//                    'IteOrcamento I WITH (NOLOCK) Where P.cdPessoa = O.cdPessoa and T.cdProduto = I.cdProduto '+
//                    'and I.dsSituacao not in (''C'',''T'') and O.nrOrcamento = I.nrOrcamento and O.nrOrcamento = :NRORCAMENTO '+
//                    'Order by T.dsPrateleira,T.nmProduto ';
//        Parameters.ParamByName('NRORCAMENTO').Value := EdtLancto.Text;
//        Open;
//      end;
//
//       // Trevo imprime essa parte separada, por isso precisamos limpar o editor
//       // Quando não limpar o editor no trecho de código acima, precisamos limpar agora, antes de imprimir
//      if not(FileExists('Texto.txt') and FileExists('Print.bat') and ((UpperCase(vEmpresa) = 'NACIONAL') or (UpperCase(vEmpresa) = 'CICLOMOTOS')) and (RgOpcoes.ItemIndex <> 2) and (vOrcamento <> 'O'))
//         OR (UPPERCASE(vEmpresa) = 'TREVO') OR (UPPERCASE(vEmpresa) = 'LOCMAQ')
//      then
//        Editor.Clear;
//      Editor.Lines.Add('    **S E M  V A L O R  F I S C A L**    ');
//      Editor.Lines.Add(' ');
//      Editor.Lines.Add('-----------------------------------------');
//      Editor.Lines.Add('' + Copy(nmEmpresa,1,40) );
//      Editor.Lines.Add('' + Copy(vendereco,1,36) );
//      Editor.Lines.Add('' + Copy(vendereco,37,100) );
//      Editor.Lines.Add('-----------------------------------------');
//      Editor.Lines.Add('                ' + vtitulo);
//      Editor.Lines.Add('-----------------------------------------');
//      Editor.Lines.Add('Cliente: '+ Copy(EdtcdCliente.Text + '-' + Copy(copy_campo(CbxCliente.Text,'|',1),1,39),1,43));
//      if UPPERCASE(vEmpresa) <> 'CARIOCA' then      // carioca n quer q imprima os dados do cliente
//        Editor.Lines.Add(edtendereco.text);
//      Editor.Lines.Add('OBS: ' + edtApelido.Text);
//      Editor.Lines.Add('-----------------------------------------');
//      Editor.Lines.Add('Orcamento '+ EdtLancto.Text + '  '+ DatetoStr(Date)+ '  '+ TimeToStr(Time));
//      if UPPERCASE(vEmpresa) <> 'PROAUTO' then
//        Editor.Lines.Add('Vendedor: '+ Copy(CbxNome.Text,1,32))
//      else
//        Editor.Lines.Add('Vendedor: '+ EdtCDNome.Text);
//      Editor.Lines.Add('-----------------------------------------');
//
//      if UPPERCASE(vEmpresa) = 'VIASUL' then
//        Editor.Lines.Add('Ref.   Descriçao             Qtd V.Total')
//      else
//        Editor.Lines.Add('Codigo Descriçao             Qtd V.Total');
//      for i := 1 to ADOQryLocaliza.RecordCount do begin
//        if UPPERCASE(vEmpresa) = 'VIASUL' then
//          vcampo_1 := ADOQryLocaliza.FieldByname('dsReferencia').AsString
//        else
//          vcampo_1 := ADOQryLocaliza.FieldByname('cdProduto').AsString;
//        while Length(vcampo_1) < 6 do vcampo_1 := vcampo_1 + ' ';
//        if UPPERCASE(vEmpresa) = 'CARIOCA' then      // carioca n quer q imprima a descriçao da nota
//          vcampo_2 := Copy(ADOQryLocaliza.FieldByname('dsProdutoNota').AsString,1,21)  // 36
//        else
//          vcampo_2 := Copy(ADOQryLocaliza.FieldByname('nmproduto').AsString,1,21);  // 36
//        while Length(vcampo_2) < 21 do vcampo_2 := vcampo_2 + ' ';    // 38
//        vcampo_3 := FormatFloat('0.00',ADOQryLocaliza.FieldByname('nrqtd').AsFloat);
//        while Length(vcampo_3) < 6 do vcampo_3 := vcampo_3 + ' ';
//
//        vcampo_4 := FormatFloat('0.00',ADOQryLocaliza.FieldByname('nrqtd').AsFloat * ADOQryLocaliza.FieldByname('vlPreco').AsFloat);
//                                      //* ((ADOQryLocaliza.FieldByname('vlPreco').AsFloat-
//                                        //(ADOQryLocaliza.FieldByname('vlPreco').AsFloat*
//                                        // StrToFloat(FormatFloat('0.00',ADOQryLocaliza.FieldByname('nrDesconto').AsFloat)))/100)));
//
//        vTotal := vTotal + (ADOQryLocaliza.FieldByname('nrqtd').AsFloat * ADOQryLocaliza.FieldByname('vlPreco').AsFloat);
//                             //((ADOQryLocaliza.FieldByname('vlPreco').AsFloat-
//                             //(ADOQryLocaliza.FieldByname('vlPreco').AsFloat*
//                            // StrToFloat(FormatFloat('0.00',ADOQryLocaliza.FieldByname('nrDesconto').AsFloat)))/100)));
//
//        vTotalD := vTotalD + (ADOQryLocaliza.FieldByname('nrqtd').AsFloat *
//                             ((ADOQryLocaliza.FieldByname('vlPreco').AsFloat-
//                             (ADOQryLocaliza.FieldByname('vlPreco').AsFloat*
//                             StrToFloat(FormatFloat('0.00',ADOQryLocaliza.FieldByname('nrDesconto').AsFloat)))/100)));
//
//        VdescontoReal := VdescontoReal + (((ADOQryLocaliza.FieldByname('vlPreco').AsFloat *
//                          StrToFloat(FormatFloat('0.00',ADOQryLocaliza.FieldByname('nrDesconto').AsFloat)))/100));
//
//        vDescontoPorc := vDescontoPorc + ADOQryLocaliza.FieldByname('nrDesconto').AsFloat;
//
//        while Length(vcampo_4) < 7 do vcampo_4 := vcampo_4 + ' ';
//        vcampo_5 := ADOQryLocaliza.FieldByname('dsReferencia').AsString;
//        vcampo_6 := ADOQryLocaliza.FieldByname('dsPrateleira').AsString;
//        while Length(vcampo_5) < 15 do vcampo_5 := vcampo_5 + ' ';
//        Editor.Lines.Add(vcampo_1 +' '+ vcampo_2 +' '+ vcampo_3 +' '+ vcampo_4);
//        if (UpperCase(vEmpresa) = 'NACIONAL') then begin // adicionar mais uma linha c o valor unitario
//          Editor.Lines.Add('Prat: ' + vcampo_6 + '   Preço unitario: ' + FormatFloat('0.00',ADOQryLocaliza.FieldByname('vlPreco').AsFloat));
//        end;
//        if vAutoPecas = 'A' then
//          Editor.Lines.Add('Ref.: '+ vcampo_5 +'  Prat.: ' + vcampo_6);
//        ADOQryLocaliza.Next;
//      end;
//      Editor.Lines.Add(' ');
//      Editor.Lines.Add('Qtd itens: '+IntToStr(ADOQryLocaliza.RecordCount)+ '             SubTotal: '+ FormatFloat('0.00',vTotal)+'');
//      Editor.Lines.Add('-----------------------------------------');
//
//  //estava assim antes, mas colocava um valor errado qd o produto ñ tinha no estoque - kenneth
////      Editor.Lines.Add('TOTAL GERAL ==> '+ edtTotal.Text);
////      Editor.Lines.Add('DESCONTO ( R$ ) '+ FormatFloat('0.00',StrToFloat(edtTotal.Text) - StrToFloat(edtSubTotal.Text)));
////      Editor.Lines.Add('DESCONTO (  % ) '+ FormatFloat('0.00',strToFloat(edtDesconto.Text)));
//      Editor.Lines.Add('Desconto em R$ '+ FormatFloat('0.00',StrToFloat(edtValorBruto.Text) - StrToFloat(edtSubTotal.Text)));
//      Editor.Lines.Add('Desconto em %  '+ edtDesconto.Text); // FormatFloat('0.00',strToFloat(edtDesconto.Text))
//      Editor.Lines.Add('                    TOTAL A PAGAR: '+ edtSubTotal.Text); // FormatFloat('0.00',vTotalD)
//      Editor.Lines.Add('------------------------------------------');
//      Editor.Lines.Add(' ');
//      case valor of
//        0 : vformapag := 'Forma Pgto: A vista';
//        1 : vformapag := 'Forma Pgto: A prazo';
//        2 : vformapag := 'Forma Pgto: Cartao a Vista';
//        3 : vformapag := 'Forma Pgto: Cartao Parcelado';
//        4 : vformapag := 'Forma Pgto: Cheque Pre';
//        5 : vformapag := 'Forma Pgto: Entrada + Prazo';
//        6 : vformapag := 'Forma Pgto: Entrada + Cartao';
//        7 : vformapag := 'Forma Pgto: Entrada + Cheque Pre';
//        8 : vformapag := 'Forma Pgto: Cheque a Vista';
//        9 : vformapag := 'Forma Pgto: Cartao Debito';
//        10 :vformapag := 'Forma Pgto: Deposito em Banco';
//      end;
//      if (vSelecionaForma = 'S') and (RgOpcoes.ItemIndex <> 3) then begin
//        Editor.Lines.Add(vformapag);
//        for i := 0 to vMemo.Lines.Count -1 do
//          Editor.Lines.Add(vMemo.Lines[i]);
//      end;
//      Editor.Lines.Add(' ');
//      Editor.Lines.Add(' _______________________________________');
//      Editor.Lines.Add('                   Visto');
//      Editor.Lines.Add(vMensagem_Promoc);
//      Editor.Lines.Add(' ');
//      if (UpperCase(vEmpresa) = 'FRANGOPRENSADO') then
//        Editor.Lines.Add('Aguarde seu Cupom Fiscal');
//      Editor.Lines.Add(' ');
//      Editor.Lines.Add(' ');
//      Editor.Lines.Add(' ');
//      Editor.Lines.Add(' ');
//      Editor.Lines.Add(' ');
//      Editor.Lines.Add(' ');
      numeroLancamento:= StrToInt(EdtLancto.Text);
      isPrevendaOuOrcamento:= (RgOpcoes.ItemIndex <> 3);
      isReimpressao:= False;
      Editor.Lines.AddStrings(TNEGPrevenda.getComprovantePrevenda(numeroLancamento, isReimpressao, isPrevendaOuOrcamento));
      try
        AssignFile(Arq,'Texto.txt');
        Rewrite(Arq);
        Writeln(Arq,Editor.Text);
      Finally
        CloseFile(Arq);
      end; // try
      if vPAFECF = False then
      begin
        if ((UpperCase(vEmpresa) = 'TREVO') OR (UpperCase(vEmpresa) = 'LOCMAQ')) and (impressoraSelecionada) then
        begin
          WinExec(PAnsiChar(AnsiString(ExtractFilePath(Application.ExeName)+'print1.bat')),sw_ShowNormal)
        end else
          WinExec(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'print.bat')),sw_ShowNormal);
      end;
      Sleep(3000);
      if not FileExists('Print.bat') then
         ShowMessage('Não foi encontrado o arquivo Print.bat');
      if (FileExists('Texto3.txt')) or (FileExists('Print3.bat')) or (FileExists('Print4.bat')) then begin //Caso encontre o arquivo manda p impressora and (RgOpcoes.ItemIndex <> 2) and (vtitulo <> 'ORCAMENTO')
        vnumero_invertido := copy(FormatFloat('000000',StrToFloat(EdtLancto.Text)),1,4);
        vnumero_invertido := copy(FormatFloat('000000',StrToFloat(EdtLancto.Text)),5,2) + vnumero_invertido ;
        Editor.Clear;
        Editor.Lines.Add('----------------ESTOQUISTA----------------');
        Editor.Lines.Add( nmEmpresa );
        Editor.Lines.Add('------------------------------------------');
        if RgOpcoes.ItemIndex = 1 then  // quando esta alterando
          Editor.Lines.Add('Reimpressao');
        Editor.Lines.Add('Sequencia: '+ vnumero_invertido + '  Emissao: '+ FormatDateTime('dd/mm/yy HH:MM',Now));
        Editor.Lines.Add('------------------------------------------');
        Editor.Lines.Add('Codigo Prat Referencia       Quant   UND');
        With ADOQryLocaliza do
        begin
          Sql.Text := 'Select P.nmPessoa,T.nmProduto,T.dsReferencia,T.cdFabricante,O.cdPessoa,O.nrOrcamento,'+ // monta a query para a impressao do orcamento
                      'I.cdProduto,O.dtEmissao,I.NrQtd,I.vlPreco,O.nrDesconto,O.dsImpresso,O.dtEmissao,     '+
                      'O.cdCliente,T.dsUnidade,T.dsPrateleira,T.dsProdutoNota                               '+
                      'From Orcamento O WITH (NOLOCK),Pessoa P WITH (NOLOCK),Produto T WITH (NOLOCK),       '+
                      'IteOrcamento I WITH (NOLOCK) Where P.cdPessoa = O.cdPessoa and T.cdProduto = I.cdProduto '+
                      'and I.dsSituacao not in (''C'',''T'') and O.nrOrcamento = I.nrOrcamento and O.nrOrcamento = :NRORCAMENTO '+
                      'Order by T.dsPrateleira,T.nmProduto ';
          Parameters.ParamByName('NRORCAMENTO').Value := EdtLancto.Text;
          Open;
        end;
        AdoQryLocaliza.First;
        for i := 1 to ADOQryLocaliza.RecordCount do
        begin
          vcampo_1 := ADOQryLocaliza.FieldByname('cdProduto').AsString;
          while Length(vcampo_1) < 5 do vcampo_1 := vcampo_1 + ' ';
          vcampo_2 := TrimRight( Copy(ADOQryLocaliza.FieldByname('dsProdutoNota').AsString,1,40) );
          while Length(vcampo_2) < 38 do vcampo_2 := vcampo_2 + ' ';
          vcampo_3 := FormatFloat('0.00',ADOQryLocaliza.FieldByname('nrqtd').AsFloat);
          while Length(vcampo_3) < 4 do vcampo_3 := vcampo_3 + ' ';
          vcampo_4 := ADOQryLocaliza.FieldByname('dsUnidade').AsString;
          vcampo_5 := TrimRight( ADOQryLocaliza.FieldByname('dsReferencia').AsString );  // remove os espaços a direita da referecia p dar  + espaço p a descriçao do produto
          while Length(vcampo_5) < 16 do vcampo_5 := vcampo_5 + ' ';   // VOU COLOCAR PELO - 16 ESPAÇOS P GARANTIR COMEÇAR A DESCRIÇAO BEM ABAIXO
          vcampo_6 := TrimRight( ADOQryLocaliza.FieldByname('dsPrateleira').AsString );
          while Length(vcampo_6) < 4 do vcampo_6:= vcampo_6 + ' ';   // VOU COLOCAR PELO - 10 ESPAÇOS P GARANTIR COMEÇAR A DESCRIÇAO BEM ABAIXO
          Editor.Lines.Add(vcampo_1 + ' ' + vcampo_6 + '  ' + vcampo_5 + ' ' + vcampo_3 +'    '+ vcampo_4 );
          ADOQryLocaliza.Next;
        end;
        Editor.Lines.Add('------------------------------------------');
        Editor.Lines.Add('Qtd itens: ' + IntToStr(ADOQryLocaliza.RecordCount));          // Total:  '+ FormatFloat('0.00',vTotal)+'');
        if(vMemo <> nil) then
          for i := 0 to vMemo.Lines.Count -1 do
            Editor.Lines.Add(vMemo.Lines[i]);
        Editor.Lines.Add(' ');
        Editor.Lines.Add('_______________________________________');
        Editor.Lines.Add('              Estoquista');
        Editor.Lines.Add(' ');
        Editor.Lines.Add(' ');
        Editor.Lines.Add(' ');
        Editor.Lines.Add(' ');
        Editor.Lines.Add(' ');
        Editor.Lines.Add(' ');
        try
          AssignFile(Arq,'Texto3.txt');
          Rewrite(Arq);
          Writeln(Arq,Editor.Text);
        Finally
          CloseFile(Arq);
        end; // try
//        if vPAFECF = False then
        if ((UpperCase(vEmpresa) = 'TREVO') OR (UpperCase(vEmpresa) = 'LOCMAQ')) and (impressoraSelecionada) then
        begin
          WinExec(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'print4.bat')),sw_ShowNormal)
        end else
          WinExec(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'print3.bat')),sw_ShowNormal);

        //a trevo solicitou que imprima também uma cópia dessa mesma impressão do estoquista, mas com algumas modificações
//        if (UpperCase(vEmpresa) = 'TREVO') then begin
//          Editor.Clear;
//          Editor.Lines.Add('------------------CAIXA-------------------');
//          Editor.Lines.Add( nmEmpresa );
//          Editor.Lines.Add('------------------------------------------');
//          if RgOpcoes.ItemIndex = 1 then  // quando esta alterando
//            Editor.Lines.Add('Reimpressao');
//          Editor.Lines.Add('Sequencia: '+ vnumero_invertido + '  Emissao: '+ FormatDateTime('dd/mm/yy HH:MM',Now));
//          Editor.Lines.Add('------------------------------------------');
//          Editor.Lines.Add('Codigo Prat Referencia       Quant   Valor');
//          With ADOQryLocaliza do
//          begin
//            Sql.Text := 'Select P.nmPessoa,T.nmProduto,T.dsReferencia,T.cdFabricante,O.cdPessoa,O.nrOrcamento,'+ // monta a query para a impressao do orcamento
//                        'I.cdProduto,O.dtEmissao,I.NrQtd,I.vlPreco,O.nrDesconto,O.dsImpresso,O.dtEmissao,     '+
//                        'O.cdCliente,T.dsUnidade,T.dsPrateleira,T.dsProdutoNota                               '+
//                        'From Orcamento O WITH (NOLOCK),Pessoa P WITH (NOLOCK),Produto T WITH (NOLOCK),       '+
//                        'IteOrcamento I WITH (NOLOCK) Where P.cdPessoa = O.cdPessoa and T.cdProduto = I.cdProduto '+
//                        'and I.dsSituacao not in (''C'',''T'') and O.nrOrcamento = I.nrOrcamento and O.nrOrcamento = :NRORCAMENTO '+
//                        'Order by T.dsPrateleira,T.nmProduto ';
//            Parameters.ParamByName('NRORCAMENTO').Value := EdtLancto.Text;
//            Open;
//          end;
//          AdoQryLocaliza.First;
//          vTotal := 0;
//          for i := 1 to ADOQryLocaliza.RecordCount do begin
//            vcampo_1 := ADOQryLocaliza.FieldByname('cdProduto').AsString;
//            while Length(vcampo_1) < 6 do vcampo_1 := vcampo_1 + ' ';
//            vcampo_2 := TrimRight( Copy(ADOQryLocaliza.FieldByname('dsProdutoNota').AsString,1,40) );
//            while Length(vcampo_2) < 38 do vcampo_2 := vcampo_2 + ' ';
//            vcampo_3 := FormatFloat('0.00',ADOQryLocaliza.FieldByname('nrqtd').AsFloat);
//            while Length(vcampo_3) < 5 do vcampo_3 := vcampo_3 + ' ';
//            vTotal := vTotal + ADOQryLocaliza.FieldByname('NrQtd').asFloat * ADOQryLocaliza.FieldByname('vlPreco').asFloat;
//            vcampo_4 := FormatFloat('0.00',ADOQryLocaliza.FieldByname('NrQtd').asFloat * ADOQryLocaliza.FieldByname('vlPreco').asFloat);
//            while Length(vcampo_4) < 7  do vcampo_4 := ' '+vcampo_4;
//            vcampo_5 := TrimRight( ADOQryLocaliza.FieldByname('dsReferencia').AsString );  // remove os espaços a direita da referecia p dar  + espaço p a descriçao do produto
//            while Length(vcampo_5) < 16 do vcampo_5 := vcampo_5 + ' ';   // VOU COLOCAR PELO - 16 ESPAÇOS P GARANTIR COMEÇAR A DESCRIÇAO BEM ABAIXO
//            vcampo_6 := copy(TrimRight( ADOQryLocaliza.FieldByname('dsPrateleira').AsString),1,4);
//            while Length(vcampo_6) < 4 do vcampo_6:= vcampo_6 + ' ';   // VOU COLOCAR PELO - 10 ESPAÇOS P GARANTIR COMEÇAR A DESCRIÇAO BEM ABAIXO
//            Editor.Lines.Add(vcampo_1 + ' ' + vcampo_6 + ' ' + vcampo_5 + ' ' + vcampo_3 +' '+ vcampo_4 );
//            ADOQryLocaliza.Next;
//          end;
//          Editor.Lines.Add('------------------------------------------');
////          Editor.Lines.Add('Qtd itens: ' + IntToStr(ADOQryLocaliza.RecordCount));          // Total:  '+ FormatFloat('0.00',vTotal)+'');
//          case StrToInt(prevenda.codigoFormaPagamento) of
//            0 : vformapag := 'Forma Pgto: A vista';
//            1 : vformapag := 'Forma Pgto: A prazo';
//            2 : vformapag := 'Forma Pgto: Cartao a Vista';
//            3 : vformapag := 'Forma Pgto: Cartao Parcelado';
//            4 : vformapag := 'Forma Pgto: Cheque Pre';
//            5 : vformapag := 'Forma Pgto: Entrada + Prazo';
//            6 : vformapag := 'Forma Pgto: Entrada + Cartao';
//            7 : vformapag := 'Forma Pgto: Entrada + Cheque Pre';
//            12 : vformapag := 'Forma Pgto: Cheque a Vista';
//            13 : vformapag := 'Forma Pgto: Cartao Debito';
//            14 :vformapag := 'Forma Pgto: Deposito em Banco';
//          end;
//          vcampo_7 := FormatFloat('0.00',vTotal);
//          while Length(vcampo_7) < 11  do vcampo_7 := ' '+vcampo_7;
//          Editor.Lines.Add('                      TOTAL R$ '+ vcampo_7);
//          Editor.Lines.Add(vformapag);
//          if(vMemo <> nil) then
//            for i := 0 to vMemo.Lines.Count -1 do
//              Editor.Lines.Add(vMemo.Lines[i]);
//          Editor.Lines.Add(' ');
//          Editor.Lines.Add('_______________________________________');
//          Editor.Lines.Add('  CAIXA: '+CbxNome.Text);
//          Editor.Lines.Add(' ');
//          Editor.Lines.Add(' ');
//          Editor.Lines.Add(' ');
//          Editor.Lines.Add(' ');
//          Editor.Lines.Add(' ');
//          Editor.Lines.Add(' ');
//          try
//            AssignFile(Arq,'Texto3.txt');
//            Rewrite(Arq);
//            Writeln(Arq,Editor.Text);
//          Finally
//            CloseFile(Arq);
//          end; // try
//  //        if vPAFECF = False then
//          if ((UpperCase(vEmpresa) = 'TREVO')) and (impressoraSelecionada) then begin
//            WinExec(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'print4.bat')),sw_ShowNormal)
//          end else
//            WinExec(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'print3.bat')),sw_ShowNormal);
//
//        end;
      end;
    end;
  end;
end;

function TFrmPrincipalPreVenda.PegaNomeFabricante(cdProduto: integer): string;
begin
  with ADOQryProcura do
  begin
    Sql.Text := 'SELECT nmPessoa FROM Pessoa P with (nolock) INNER JOIN Produto Pr with (nolock) '+
                'ON P.cdPessoa = Pr.cdPessoa_1 where pr.cdProduto = :CDPRODUTO';
    Parameters.ParamByName('CDPRODUTO').Value := cdProduto;
    open;
    Result := Fieldbyname('nmPessoa').AsString;
  end;
end;

function TFrmPrincipalPreVenda.PegaValorAtacado(cdProduto : integer): real;
begin
  with ADOQryProcura do
  begin
    Sql.Text := 'Select vlAtacado from Produto WITH (NOLOCK) where cdproduto = :CD';
    Parameters.ParamByName('CD').Value := cdProduto;
    open;
    Result := Fieldbyname('vlAtacado').AsFloat;
  end;
end;

function TFrmPrincipalPreVenda.PegaValorVarejo(cdProduto : integer): real;
begin
  with ADOQryProcura do
  begin
    Sql.Text := 'Select vlPreco from Produto WITH (NOLOCK) where cdproduto = :CD';
    Parameters.ParamByName('CD').Value := cdProduto;
    open;
    Result := Fieldbyname('vlPreco').AsFloat;
  end;
end;

procedure TFrmPrincipalPreVenda.ImprimeLL(valor: integer);
var Arq : TextFile;
    Imp : TextFile;
    text,vformapag : string;
begin
   Editor.Clear;
   Editor.Lines.Add('       **S E M  V A L O R  F I S C A L**');
   Editor.Lines.Add(' ');
   Editor.Lines.Add('=============================================');
   Editor.Lines.Add('Cliente: '+ EdtcdCliente.Text + '-' + Copy(copy_campo(CbxCliente.Text,'|',1),1,39));
   Editor.Lines.Add(''+ edtendereco.text);
   Editor.Lines.Add(' ');
   Editor.Lines.Add('=============================================');
   Editor.Lines.Add('Orcamento '+ EdtLancto.Text + '       Data:   '+ DatetoStr(Date));
   Editor.Lines.Add('Vendedor: '+ CbxNome.Text);
   Editor.Lines.Add('Desc  R$: '+ FormatFloat('0.00',StrToFloat(EdtTotal.Text) - StrToFloat(EdtSubTotal.Text)) + ' SubTotal R$: ' + EdtTotal.Text );
   Editor.Lines.Add('Total R$: '+ EdtSubTotal.Text);
   Editor.Lines.Add('=============================================');
   case valor of
      0 : vformapag := 'Forma Pgto: A vista';
      1 : vformapag := 'Forma Pgto: A prazo';
      2 : vformapag := 'Forma Pgto: Cartao a Vista';
      3 : vformapag := 'Forma Pgto: Cartao Parcelado';
      4 : vformapag := 'Forma Pgto: Cheque Pre';
      5 : vformapag := 'Forma Pgto: Entrada + Prazo';
      6 : vformapag := 'Forma Pgto: Entrada + Cartao';
      7 : vformapag := 'Forma Pgto: Entrada + Cheque Pre';
      12 : vformapag := 'Forma Pgto: Cheque a Vista';
      13 : vformapag := 'Forma Pgto: Cartao Debito';
      14 :vformapag := 'Forma Pgto: Deposito em Banco';
   end;
    Editor.Lines.Add(vformapag);
   Editor.Lines.Add(' ');
   Editor.Lines.Add(' ');
   Editor.Lines.Add(' ');
   Editor.Lines.Add(' ');
   Editor.Lines.Add(' ');
   Editor.Lines.Add(' ');
   try
     AssignFile(Arq,'Texto.txt');
     Erase(Arq);
     Rewrite(Arq);
     Writeln(Arq,Editor.Text);
   Finally
     CloseFile(Arq);
   end; // try
   if vPAFECF = False then
     WinExec(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'print.bat')),sw_ShowNormal);
   if not FileExists('Print.bat') then
    ShowMessage('Não foi encontrado o arquivo Print.bat');
   ShowMessage('Pré-venda realizada com sucesso!');
end;

procedure TFrmPrincipalPreVenda.PegaClienteAtacadoVarejo;
begin
  with AdoQryLocaliza do
  begin
    Sql.Text := 'Select dsrestricao,dsmotivo,dsAtacado from cliente WITH (NOLOCK) where cdPessoa = :CDCLIENTE';
    Parameters.ParamByName('CDCLIENTE').Value := EdtCdCliente.Text;
    Open;
    if UpperCase(Fieldbyname('dsAtacado').AsString) = 'S' then
    begin
      vAtacadoVarejo  := 'A';
      Label30.caption := 'Cliente -> Atacado';
    end else
    begin
      vAtacadoVarejo  := 'V';
      Label30.caption := 'Cliente -> Varejo';
    end;
    AtualizaQryConsulta;
  end;
end;

procedure TFrmPrincipalPreVenda.Imprimiretiquetas1Click(Sender: TObject);
var
  escolha : TModalResult;
begin
  if vFlagEtiqueta = '' then begin
    MessageDlg('Ausência do flag do cliente no support.ini',mtWarning,[mbOK],0);
    Exit;
  end;
  if UpperCase(vFlagEtiqueta) = 'AMORBEBE' then  //ARGOX
    ImprimeEtiquetaAmorBebe;
  if UpperCase(vFlagEtiqueta) = 'ALICEDINIZ' then  //ARGOX
    ImprimeEtiquetaAliceDiniz;
  if UpperCase(vFlagEtiqueta) = 'LISTO' then  //ARGOX
    ImprimeEtiquetaListo;
  if UpperCase(vFlagEtiqueta) = 'TECNO' then  //ARGOX
    ImprimeEtiquetaTecno;
  if UpperCase(vFlagEtiqueta) = 'ANTONIO' then  //ARGOX
    ImprimeEtiquetaSantoAntonio;
  if UpperCase(vFlagEtiqueta) = 'ROSAMENINA' then  //ARGOX OS 214 PLUS
    ImprimeEtiquetaRosaMenina;
  if UpperCase(vFlagEtiqueta) = 'DELUC' then  //GK
    ImprimeEtiquetasDeluc;
  if UpperCase(vFlagEtiqueta) = 'GENTEPEQUENA' then  //TLP 2844
    ImprimeEtiquetasGentePequena;
  if UpperCase(vFlagEtiqueta) = 'VAREJAO' then  //TLP 2844
    ImprimeEtiquetasVarejao;
  if UpperCase(vFlagEtiqueta) = 'BIJOUARTSMAIOR' then  //ARGOX
    ImprimeEtiquetasBijouArtsMaior;
  if UpperCase(vFlagEtiqueta) = 'BIJOUARTS' then  //ELGIN
    ImprimeEtiquetasBijouArts;
  if UpperCase(vFlagEtiqueta) = 'BIJOUARTSTT' then  //OS214TT
    ImprimeEtiquetasBijouArtsOS214TT;
  if UpperCase(vFlagEtiqueta) = 'LAYEVICTOROS214' then  //ELGIN
    ImprimeEtiquetaLayeVictorOS214;
  if UpperCase(vFlagEtiqueta) = 'LAYEVICTOR' then begin //ELGIN
    if MessageDlgDef('Escolha qual tipo de etiqueta:', 'Impressão', mtConfirmation, [mbOK, mbCancel], mrOK, 0) = mrOK then  //ok - Pequena,Cancel - Grande
      ImprimeEtiquetaLayeVictor
    else
      ImprimeEtiquetaGrandeLayeVictor;
  end;
  if UpperCase(vFlagEtiqueta) = 'LAYEVICTORARGOXOS214' then  //Argox OS 214 A
   ImprimeEtiquetaLayeVictorArgoxOS214;  
  if UpperCase(vFlagEtiqueta) = 'SEMPRE' then   //ARGOX
    ImprimeEtiquetasTemdeTudoSempre;
  if UpperCase(vFlagEtiqueta) = 'JALVES' then begin  //ARGOX  OS-214
    FrmTresEtiquetas := TFrmTresEtiquetas.Create(Application);
    escolha := FrmTresEtiquetas.ShowModal;
    if escolha = mrOK then
      ImprimeEtiquetasJALVES_Grande
    else if escolha = mrCancel then
      ImprimeEtiquetasJALVES_Gondola
    else if escolha = mrAbort then
      ImprimeEtiquetasJALVES_Pequena;
  end;

  if UpperCase(vFlagEtiqueta) = 'DIEGOCUNHA' then begin  //ELGIN L42
    FrmDuasEtiquetas := TFrmDuasEtiquetas.Create(Application);
    escolha := FrmDuasEtiquetas.ShowModal;
    if escolha = mrCancel then
      ImprimeEtiquetasDIEGOCUNHA_3COLUNAS
    else if escolha = mrOK  then
      ImprimeEtiquetasDIEGOCUNHA_GONDOLA
  end;

  if UpperCase(vFlagEtiqueta) = 'SAFIRAZEBRA' then   //ZEBRA TLP 2844 then
    ImprimeEtiquetasSafiraZebra
  else
  if UpperCase(vFlagEtiqueta) = 'SAFIRAARGOX' then
    ImprimeEtiquetasSafiraArgox
  else
  if UpperCase(vFlagEtiqueta) = 'BIJOUARTSZEBRA' then   //ZEBRA TLP 2844
    ImprimeEtiquetasBijouArtsZebra
  else
  if UpperCase(vFlagEtiqueta) = 'BIJOUARTSOS214' then // ZEBRA OS214
    ImprimeEtiquetasBijouArtsOS214
  else
  if (UpperCase(vFlagEtiqueta) = 'PIPELINE') or (UpperCase(vFlagEtiqueta) = 'LITORAL655') then //ZEBRA TLP 2844 - LITORAL 655(CENTRO) E PIPELINE
    ImprimeEtiquetasPipelaine
  else
  if (UpperCase(vFlagEtiqueta) = 'LITORALSHOPPING') then //ZEBRA TLP 2844 - SHOPPING E RUA GERU
    ImprimeEtiquetasPipelaineShopping
  else
  if (UpperCase(vFlagEtiqueta) = 'DISCABOS') then //ZEBRA TLP 2844 - SHOPPING E RUA GERU
    ImprimeEtiquetasDisCabos
  else
  if (UpperCase(vFlagEtiqueta) = 'KARIB') then begin //ZEBRA TLP 2844 - SHOPPING E RUA GERU
    if Messagedlg('Escolha SIM para folheados ou NÃO para jóias',mtConfirmation,[mbYes,mbNo],0) = mrYes then
      ImprimeEtiquetasCaribe
    else
      ImprimeEtiquetasCaribe2;
  end
  else
  if (UpperCase(vFlagEtiqueta) = 'SAOJOSE') then //ZEBRA TLP 2844 - SHOPPING E RUA GERU
    ImprimeEtiquetasSaoJose
  else
  if (UpperCase(vFlagEtiqueta) = 'PR') then //ZEBRA TLP 2844 - SHOPPING E RUA GERU
    ImprimeEtiquetaPR
  else
  if (UpperCase(vFlagEtiqueta) = 'PRELGIN') then //ZEBRA TLP 2844 - SHOPPING E RUA GERU
    ImprimeEtiquetaPR_ELGIN
  else
  if (UpperCase(vFlagEtiqueta) = 'PRECINHO10') then
    ImprimeEtiquetaPRECINHO10
  else
  if (UpperCase(vFlagEtiqueta) = 'BRAZNAMODA') then
    ImprimeEtiquetaBRAZNAMODA
  else
  if (UpperCase(vFlagEtiqueta) = 'SAOJUDASTADEU18') then //ZEBRA TLP 2844 - SHOPPING E RUA GERU
    ImprimeEtiquetaMERCADINHOSAOJUDASTADEU18_ELGIN
  else
  if (UpperCase(vFlagEtiqueta) = 'DAYA') then
    ImprimeEtiquetaDAYA_ELGIN
  else
  if (UpperCase(vFlagEtiqueta) = 'NUTRIMIX') then //ARGOX OS 214 PPLA 300 dpi
    ImprimeEtiquetaNutriMix
  else
  if (UpperCase(vFlagEtiqueta) = 'JETLASER') then //ZEBRA TLP 2844 - SHOPPING E RUA GERU
    ImprimeEtiquetaJetLaser
  else
  if (UpperCase(vFlagEtiqueta) = 'PS') then //ARGOX OS-214plus A
    ImprimeEtiquetaPS
  else
  if (UpperCase(vFlagEtiqueta) = 'BRUMAR') then //ARGOX OS-214plus A
    ImprimeEtiquetaBrumar_Nova
  else
  if (UpperCase(vFlagEtiqueta) = 'CHAVESDEOURO') then //ARGOX OS-214plus A
     ImprimeEtiquetaChavesDeOuro
  else
  if (UpperCase(vFlagEtiqueta) = 'POLIANA') then //ARGOX OS-214plus A
     ImprimeEtiquetaPoliana
  else
  if (UpperCase(vFlagEtiqueta) = 'MEGA') then //ARGOX OS-214plus A
     ImprimeEtiquetaMEGA
  else
  if (UpperCase(vFlagEtiqueta) = 'SABORAMIL') then //ELGIN L-42
    ImprimeEtiquetasSaboramil
  else
  if (UpperCase(vFlagEtiqueta) = 'PANZONE') then //ELGIN L-42
    ImprimeEtiquetasPazone
  else
  if (UpperCase(vFlagEtiqueta) = 'COMPLEMENTUS') then //ARGOX OS214
    ImprimeEtiquetasComplemento
  else
  if (UpperCase(vFlagEtiqueta) = 'CHALOC') then //ARGOX OS214
     ImprimeEtiquetaChaloc
  else
  if (UpperCase(vFlagEtiqueta) = 'MARTTINA') then //ZEBRA TLP 2844 - SHOPPING E RUA GERU
    ImprimeEtiquetasMarttina
  else
  if (UpperCase(vFlagEtiqueta) = 'SANTALUIZA') then //ZEBRA TLP 2844 - SHOPPING E RUA GERU
    ImprimeEtiquetaOticaSantaLuiza
  else if (UpperCase(vFlagEtiqueta) = 'EMPORIOJARDINS') then //ARGOX OS-214plus A
    ImprimeEtiquetaEmporioJardins
  else if (UpperCase(vFlagEtiqueta) = 'SAOJUDASTADEU') then //ARGOX OS-214plus A
    ImprimeEtiquetaSaoJudasTadeus2
  else if (UpperCase(vFlagEtiqueta) = 'SUPERDELLI') then //ELGIN L-42
    ImprimeEtiquetaSuperDelli
  else if (UpperCase(vFlagEtiqueta) = 'SAOMIGUEL') then //ARGOX OS-214plus A
    ImprimeEtiquetaSaoMiguel
  else if (UpperCase(vFlagEtiqueta) = 'PRECOBOM') then //ARGOX OS-214plus A
    ImprimeEtiquetaPrecoBom
  else if (UpperCase(vFlagEtiqueta) = 'MAISECONOMIA') then //ARGOX OS-214plus A
    ImprimeEtiquetaMaisEconomia
  else if (UpperCase(vFlagEtiqueta) = 'EMPORIOJARDINSPEQUENO') then //ARGOX OS-214plus A
    ImprimeEtiquetaEmporioJardins_Pequeno
  else if (UpperCase(vFlagEtiqueta) = 'PARPERFEITO') then //ARGOX OS-214plus A
    ImprimeEtiquetaParPerfeito
  else
  if (UpperCase(vFlagEtiqueta) = 'DALBOSCO') then //ELGIN
    ImprimeEtiquetasDalBosco
  else
  if (UpperCase(vFlagEtiqueta) = 'COMERCIALGRACA') then //ELGIN
    ImprimeEtiquetasComercialGraca
  else
  if (UpperCase(vFlagEtiqueta) = 'DULALAR') then //ARGOX OS-214 PPLA
    ImprimeEtiquetasDulalar
  else
  if (UpperCase(vFlagEtiqueta) = 'AQUARIUM') then //ARGOX OS-214 PPLA
    ImprimeEtiquetasAquarium
  else
  if (UpperCase(vFlagEtiqueta) = 'PONTODASTINTAS') then //ARGOX OS-214 PPLA
    ImprimeEtiquetasPontoDasTintas;
end;

procedure TFrmPrincipalPreVenda.ImprimeEtiquetasBijouArtsMaior;
var L : integer;
    Arq : TextFile;
    vQtd : real;
begin
  //if not CamposObrigatoriosPreenchidos(FrmPrincipalPreVenda) then exit;
  if SgDados.Cells[0,1] = '' then begin
    Messagedlg('Não foi lançado nenhum item para impressão das etiquetas!', mtWarning, [mbOk], 0);
    EdtConsulta.Setfocus;
    exit;
  end;
  if (Trim(EdtCdCliente.Text)<> '') and (Trim(EdtCdNome.Text) <> '') then
    SalvaEtiquetas;
  Editor.Lines.Clear;
  for L := 1 to SgDados.RowCount - 1 do begin // Salvando os itens da pré-venda.
    if SgDados.Cells[0,L] = '' then Break;
    Editor.Lines.Add('c0000');
    Editor.Lines.Add('KI503');
    Editor.Lines.Add('O0220');
    Editor.Lines.Add('f220');
    Editor.Lines.Add('KW0415');
    Editor.Lines.Add('KI7');
    Editor.Lines.Add('V0');
    Editor.Lines.Add('L');
    Editor.Lines.Add('H12');
    Editor.Lines.Add('PC');
    Editor.Lines.Add('A2');
    Editor.Lines.Add('D11');

    Editor.Lines.Add('121100000700008'+Trim(Copy(SgDados.Cells[1,L],1,20)));
    Editor.Lines.Add('121100000580008'+Trim(Copy(SgDados.Cells[1,L],21,20)));
    Editor.Lines.Add('121100000700145'+Trim(Copy(SgDados.Cells[1,L],1,20)));
    Editor.Lines.Add('121100000580145'+Trim(Copy(SgDados.Cells[1,L],21,20)));
    Editor.Lines.Add('121100000700280'+Trim(Copy(SgDados.Cells[1,L],1,20)));
    Editor.Lines.Add('121100000580280'+Trim(Copy(SgDados.Cells[1,L],21,20)));

    Editor.Lines.Add('1a6203400210147'+Trim(SgDados.Cells[0,L]));  //Cod. Barra
    Editor.Lines.Add('1a6203400210281'+Trim(SgDados.Cells[0,L]));  //Cod. Barra
    Editor.Lines.Add('1a6203400210012'+Trim(SgDados.Cells[0,L]));  //Cod. Barra

    Editor.Lines.Add('121100000070037'+Trim(SgDados.Cells[0,L]));  //Cod. Barra
    Editor.Lines.Add('121100000070171'+Trim(SgDados.Cells[0,L]));  //Cod. Barra
    Editor.Lines.Add('121100000070305'+Trim(SgDados.Cells[0,L]));  //Cod. Barra

    // Cálculo para imprimir a qtd de etiquetas certo
    if Frac(StrToFloat(SgDados.Cells[2,L])/3) = 0.00 then
      vQtd := StrToFloat(SgDados.Cells[2,L])/3
    else vQtd := (StrToint(FormatFloat('0000',StrToFloat(SgDados.Cells[2,L]))) div 3) + 1;
    Editor.Lines.Add('^'+FormatFloat('00',vQtd));
    Editor.Lines.Add('Q'+FormatFloat('0000',vQtd));
    Editor.Lines.Add('E');
//    vQtd := StrToFloat(SgDados.Cells[2,L]);
//    Editor.Lines.Add('^'+FormatFloat('0',vQtd));
//    Editor.Lines.Add('Q'+FormatFloat('000',vQtd));
//    Editor.Lines.Add('E');
  end;
  Editor.Lines.SaveToFile(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'etiqueta.txt')));
  WinExec(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'print2.bat')),sw_ShowNormal);
  if not FileExists('Print2.bat') then
    ShowMessage('Não foi encontrado o arquivo Print2.bat');
  Application.OnMessage := FormPrincipal.ProcessaMsg;
  Limpar_Tela;
  RgOpcoes.ItemIndex := 0;
  Messagedlg('Impressão ok!', mtInformation, [mbOk], 0);
end;

procedure TFrmPrincipalPreVenda.ImprimeEtiquetasBijouArts;
var L : integer;
    Arq : TextFile;
    vQtd : real;
begin
  //if not CamposObrigatoriosPreenchidos(FrmPrincipalPreVenda) then exit;
  if SgDados.Cells[0,1] = '' then begin
    Messagedlg('Não foi lançado nenhum item para impressão das etiquetas!', mtWarning, [mbOk], 0);
    EdtConsulta.Setfocus;
    exit;
  end;
  if (Trim(EdtCdCliente.Text)<> '') and (Trim(EdtCdNome.Text) <> '') then
    SalvaEtiquetas;
  Editor.Lines.Clear;
  for L := 1 to SgDados.RowCount - 1 do begin // Salvando os itens da pré-venda.
    if SgDados.Cells[0,L] = '' then Break;
    Editor.Lines.Add('');
    Editor.Lines.Add('');
    Editor.Lines.Add('N');
    Editor.Lines.Add('q822');
    Editor.Lines.Add('Q320,24');
    Editor.Lines.Add('JB');
    Editor.Lines.Add('D9');
    Editor.Lines.Add('S2');
    Editor.Lines.Add('O');
    Editor.Lines.Add('B162,40,0,2,3,6,37,B,"'+SgDados.Cells[0,L]+'"');
    Editor.Lines.Add('B396,40,0,2,3,6,37,B,"'+SgDados.Cells[0,L]+'"');
    Editor.Lines.Add('B626,38,0,2,3,6,37,B,"'+SgDados.Cells[0,L]+'"');
    Editor.Lines.Add('A130,24,0,1,1,1,N,"'+Trim(Copy(SgDados.Cells[1,L],1,19))+'"');
    Editor.Lines.Add('A364,26,0,1,1,1,N,"'+Trim(Copy(SgDados.Cells[1,L],1,19))+'"');
    Editor.Lines.Add('A600,24,0,1,1,1,N,"'+Trim(Copy(SgDados.Cells[1,L],1,19))+'"');
    Editor.Lines.Add('A332,24,1,1,1,1,N,"'+Trim(Copy(SgDados.Cells[1,L],20,20))+'"');
    Editor.Lines.Add('A566,24,1,1,1,1,N,"'+Trim(Copy(SgDados.Cells[1,L],20,20))+'"');
    Editor.Lines.Add('A800,24,1,1,1,1,N,"'+Trim(Copy(SgDados.Cells[1,L],20,20))+'"');
    // Cálculo para imprimir a qtd de etiquetas certo
    if Frac(StrToFloat(SgDados.Cells[2,L])/3) = 0.00 then
      vQtd := StrToFloat(SgDados.Cells[2,L])/3
    else vQtd := (StrToint(FormatFloat('0000',StrToFloat(SgDados.Cells[2,L]))) div 3) + 1;
    Editor.Lines.Add('P1,'+FloatToStr(vQtd));
  end;
  Editor.Lines.SaveToFile(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'etiqueta.txt')));
{  AssignFile(Arq,'Texto.txt');
  Erase(Arq);
  Rewrite(Arq);
  Writeln(Arq,Editor.Text);}
//    WinExec('C:\Arquivos de programas\saef\bin\print.bat',sw_ShowNormal);
  WinExec(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'print.bat')),sw_ShowNormal);
  if not FileExists('Print.bat') then
    ShowMessage('Não foi encontrado o arquivo Print.bat');
  Application.OnMessage := FormPrincipal.ProcessaMsg;
  Limpar_Tela;
  RgOpcoes.ItemIndex := 0;
  Messagedlg('Impressão ok!', mtInformation, [mbOk], 0);
end;

procedure TFrmPrincipalPreVenda.ImprimeEtiquetasPipelaine;
var L,J : integer;
    Arq : TextFile;
    vQtd : real;
    List_cdBarras,List_nm1,List_nm2,List_vlPreco,List_Codigo : TStringList;
begin
    //if not CamposObrigatoriosPreenchidos(FrmPrincipalPreVenda) then exit;
  if SgDados.Cells[0,1] = '' then begin
     Messagedlg('Não foi lançado nenhum item para impressão das etiquetas!', mtWarning, [mbOk], 0);
     EdtConsulta.SetFocus;
     exit;
  end;
  if (Trim(EdtCdCliente.Text)<> '') and (Trim(EdtCdNome.Text) <> '') then
     SalvaEtiquetas;
  if MessageDlg('Clique "Sim" para LITORAL 655 e "Não" para PIPELINE!',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    nmEmpresa:= 'PIPELINE'
  else nmEmpresa:= 'LITORAL655';
  List_cdBarras:= TStringList.Create;
  List_nm1:= TStringList.Create;
  List_nm2:= TStringList.Create;
  List_vlPreco:= TStringList.Create;
  List_Codigo:= TStringList.Create;
  //Cria uma lista com todos as etiquetas
  for L:= 1 to SgDados.RowCount - 1 do begin
    if SgDados.Cells[0,L] = '' then Break;
    for J:= 1 to (StrToint(FormatFloat('0000',StrToFloat(SgDados.Cells[2,L])))) do begin
      List_nm1.Add(Trim(Copy(SgDados.Cells[1,L],1,30)));
      List_nm2.Add(Trim(Copy(SgDados.Cells[1,L],30,40)));
      List_vlPreco.Add(VirgPonto(SgDados.Cells[3,L]));
      List_cdBarras.Add(SgDados.Cells[6,L]);
      List_Codigo.Add(SgDados.Cells[0,L]);
      //Editor2.Lines.Add(Trim(Copy(SgDados.Cells[1,L],1,30)) + ' ' + Copy(SgDados.Cells[1,L],30,40) + ' '+
      //                       PontoVirg(SgDados.Cells[3,L]) + ' '+ SgDados.Cells[6,L] + ' '+ SgDados.Cells[0,L]);
    end;
  end;
  //Editor2.Lines.SaveToFile('C:\Arquivos de programas\saef\bin\teste.txt');
  Editor.Lines.Clear;
  if Frac(List_nm1.count/2) <> 0.00 then begin
    List_nm1.Add('');
    List_nm2.Add('');
    List_vlPreco.Add('');
    List_cdBarras.Add('');
    List_Codigo.Add('');
  end;
  J := 0;
  for L := 0 to StrToint(FormatFloat('0000',(List_nm1.count/2))) - 1 do begin // Salvando os itens da pré-venda.
    Editor.Lines.Add('');
    Editor.Lines.Add('');
    Editor.Lines.Add('Q559,019');
    Editor.Lines.Add('q831');
    Editor.Lines.Add('rN');
    Editor.Lines.Add('S1');
    Editor.Lines.Add('D7');
    Editor.Lines.Add('ZT');
    Editor.Lines.Add('JB');
    Editor.Lines.Add('OD');
    Editor.Lines.Add('R56,0');
    Editor.Lines.Add('N');
    Editor.Lines.Add('B304,341,2,E30,2,4,61,B,"'+List_cdBarras[j+1]+'"');
    Editor.Lines.Add('B318,148,2,E30,2,4,61,B,"'+List_cdBarras[j+1]+'"');
    Editor.Lines.Add('B651,340,2,E30,2,4,61,B,"'+List_cdBarras[j]+'"');
    Editor.Lines.Add('B666,148,2,E30,2,4,61,B,"'+List_cdBarras[j]+'"');
    Editor.Lines.Add('A200,29,2,2,1,1,N,"Cod. '+List_Codigo[j+1]+'"');
    Editor.Lines.Add('A340,500,2,1,3,3,N,"'+nmEmpresa+'"');
    Editor.Lines.Add('A537,31,2,2,1,1,N,"Cod. '+List_Codigo[j]+'"');
    Editor.Lines.Add('A328,373,2,1,1,1,N,"'+List_nm2[j+1]+'"');
    Editor.Lines.Add('A680,500,2,1,3,3,N,"'+nmEmpresa+'"');
    Editor.Lines.Add('A676,372,2,1,1,1,N,"'+List_nm2[j]+'"');
    Editor.Lines.Add('A329,401,2,1,1,1,N,"'+List_nm1[j+1]+'"');
    Editor.Lines.Add('A330,222,2,1,1,1,N,"'+Copy(vendereco,1,30)+'"');
    Editor.Lines.Add('A679,220,2,1,1,1,N,"'+Copy(vendereco,1,30)+'"');
    Editor.Lines.Add('A676,400,2,1,1,1,N,"'+List_nm1[j]+'"');
    Editor.Lines.Add('A315,55,2,2,1,1,N,"R$ '+List_vlPreco[j+1]+'"');
    Editor.Lines.Add('A655,60,2,2,1,1,N,"R$ '+List_vlPreco[j]+'"');
    Editor.Lines.Add('P1');
    J := J + 2;
  end;
  Editor.Lines.SaveToFile(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'etiqueta.txt')));
  WinExec(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'print.bat')),sw_ShowNormal);
//  WinExec('c:\Arquiv~1\Saef\bin\print.bat',sw_ShowNormal);
  if not FileExists('Print.bat') then
    ShowMessage('Não foi encontrado o arquivo Print.bat');
  Application.OnMessage := FormPrincipal.ProcessaMsg;
  Limpar_Tela;
  RgOpcoes.ItemIndex := 0;
  Messagedlg('Impressão ok!', mtInformation, [mbOk], 0);
end;

procedure TFrmPrincipalPreVenda.SalvaEtiquetas;
var L,vTeste : Integer;
begin
  // COMENTEI PARA NÃO SALVAR PREVENDA AO IMPRIMIR ORÇAMENTO 
//  With ADOQrySalvar do begin
//    try
//      DModulo.Conexao.BeginTrans;
//      if RgOpcoes.ItemIndex = 1 then begin //Se for alteração de um orçamento
//        Sql.Text := 'Delete From Orcamento Where nrOrcamento = :NRORCAMENTO';
//        Parameters.ParamByName('NRORCAMENTO').Value := EdtLancto.Text;
//        ExecSql;
//        Sql.Text := 'Delete From MemoOrcamento Where nrOrcamento = :NRORCAMENTO ';
//        Parameters.ParamByName('NRORCAMENTO').Value := EdtLancto.Text;
//        ExecSql;
//      end;
//      if (RgOpcoes.ItemIndex = 0) or (RgOpcoes.ItemIndex = 2) then begin // Se for salvar um orçamento
//        UltimoLancamento;
//        Sql.Text := 'Update Sequencial Set nrPedidos = nrPedidos + 1 Where cdCodigo = 1 ';
//        ExecSql;
//      end;
//      // dados do orcamento
//      Sql.Text := 'Insert Into Orcamento (nrOrcamento,cdPessoa,dsFlag,'+
//                  'dtEmissao,nrDesconto,dsImpresso,cdCliente,vlvalor) '+
//                  'Values (:nrOrcamento,:cdPessoa,''C'',              '+
//                  ':DATA,:nrDesconto,:tipo,:cdCliente,:vlvalor)       ';
//      Parameters.ParamByName('nrOrcamento').Value := EdtLancto.Text;
//      Parameters.ParamByName('cdPessoa').Value    := EdtCdNome.Text;
//      Parameters.ParamByName('nrDesconto').Value  := StrToFloat(EdtDesconto.Text);
//      Parameters.ParamByName('cdCliente').Value   := EdtCdCliente.Text;
//      Parameters.ParamByName('vlvalor').Value     := StrToFloat(EdtSubTotal.Text);
//      Parameters.ParamByName('DATA').Value        := vdata_banco;
//      case RgOpcoes.ItemIndex of
//        0: Parameters.ParamByName('tipo').Value  := 'N';
//        1: Parameters.ParamByName('tipo').Value  := vOrcamento; // Se for alterar pode continuar orcamento ou virar pré-venda
//        2: Parameters.ParamByName('tipo').Value  := 'O';
//      end;
//      ExecSql;
//      for L := 1 to SgDados.RowCount - 1 do begin // Salvando os itens da pré-venda.
//        if SgDados.Cells[0,L] = '' then Break;
//        Sql.Text := 'Insert Into IteOrcamento (cdIteLcto,nrOrcamento,'+
//                    'cdProduto,nrQtd,vlPreco,dsSituacao,vlDesconto)  '+
//                    'Values ( :CDITELCTO ,:NRORCAMENTO ,:CDPRODUTO,  '+
//                    ':NRQTD,:VLPRECO,:DSSITUACAO,:vlDesconto)        ';
//        Parameters.ParamByName('CDITELCTO').Value   := IntToStr(L);
//        Parameters.ParamByName('NRORCAMENTO').Value := EdtLancto.Text;
//        Parameters.ParamByName('CDPRODUTO').Value   := SgDados.Cells[0,L];
//        Parameters.ParamByName('NRQTD').Value       := SgDados.Cells[2,L];
//        Parameters.ParamByName('VLPRECO').Value     := SgDados.Cells[3,L];
//        Parameters.ParamByName('DSSITUACAO').Value  := '';
//        Parameters.ParamByName('vlDesconto').Value  := SgDados.Cells[9,L];
//        ExecSql;
//      end;
//      DModulo.Conexao.CommitTrans;
//    Except
//      on ER: EDBEngineError do begin
//        DModulo.Conexao.RollbackTrans;
//        Salvar_erro(vData_Banco + ' | ' + pegaHoraBanco, 'PREVENDA', 'TFrmPrincipalPreVenda.SalvaEtiquetas', ER.Message);
//        vTeste := 2; // o orcamento nao foi salvo
//        vSalvar := vSalvar + 1;
//        if vSalvar <= 4 then BtnConfirmarClick(Self)
//        else begin
//          Messagedlg('Não foi possível salvar esta Pré Venda \ Orçamento!', mterror, [mbOk], 0);
//          vSalvar := 0;
//        end;
//      end;
//      on E: Exception do begin
//        DModulo.Conexao.RollbackTrans;
//        Salvar_erro(vData_Banco + ' | ' + pegaHoraBanco, 'PREVENDA', 'TFrmPrincipalPreVenda.SalvaEtiquetas', e.Message);
//        vTeste  := 2; // o orcamento nao foi salvo
//        // Altero o sequencial pois estava dando muito erro pra salvar por causa do sequencial
//        Sql.Text := 'Update Sequencial Set nrPedidos = nrPedidos + 1 Where cdCodigo = 1 ';
//        ExecSql;
//        vSalvar := vSalvar + 1;
//        if vSalvar <= 4 then BtnConfirmarClick(Self)
//        else begin
//          Messagedlg('Não foi possível salvar esta Pré Venda \ Orçamento!', mterror, [mbOk], 0);
//          vSalvar := 0;
//        end;
//      end;
//    end; // except
//  end;   // QqryCaixa
end;

procedure TFrmPrincipalPreVenda.ImprimeEtiquetasBijouArtsZebra;
var L : integer;
    Arq : TextFile;
    vQtd : real;
begin
  //if not CamposObrigatoriosPreenchidos(FrmPrincipalPreVenda) then exit;
  if SgDados.Cells[0,1] = '' then begin
    Messagedlg('Não foi lançado nenhum item para impressão das etiquetas!', mtWarning, [mbOk], 0);
    EdtConsulta.Setfocus;
    exit;
  end;
  if (Trim(EdtCdCliente.Text)<> '') and (Trim(EdtCdNome.Text) <> '') then
    SalvaEtiquetas;
  Editor.Lines.Clear;
  for L := 1 to SgDados.RowCount - 1 do begin // Salvando os itens da pré-venda.
    if SgDados.Cells[0,L] = '' then Break;
    Editor.Lines.Add('');
    Editor.Lines.Add('');
    Editor.Lines.Add('^XA~TA000~JSN^LT0^MMT^MNW^MTT^PON^PMN^LH0,0^JMA^PR4,4^MD0^JUS^LRN^CI0^XZ');
    Editor.Lines.Add('^XA^LL0160');
    Editor.Lines.Add('^PW831');
    Editor.Lines.Add('^FT596,57^ABN,11,7^FH\^FD'+Trim(Copy(SgDados.Cells[1,L],21,40))+'^FS');
    Editor.Lines.Add('^FT322,56^ABN,11,7^FH\^FD'+Trim(Copy(SgDados.Cells[1,L],21,40))+'^FS');
    Editor.Lines.Add('^FT595,41^ABN,11,7^FH\^FD'+Trim(Copy(SgDados.Cells[1,L],1,20))+'^FS');
    Editor.Lines.Add('^FT51,56^ABN,11,7^FH\^FD'+Trim(Copy(SgDados.Cells[1,L],21,40))+'^FS');
    Editor.Lines.Add('^FT321,40^ABN,11,7^FH\^FD'+Trim(Copy(SgDados.Cells[1,L],1,20))+'^FS');
    Editor.Lines.Add('^FT50,40^ABN,11,7^FH\^FD'+Trim(Copy(SgDados.Cells[1,L],1,20))+'^FS');
    Editor.Lines.Add('^BY3,3,45^FT587,109^BCN,,Y,N');
    Editor.Lines.Add('^FD>;0'+SgDados.Cells[0,L]+'^FS');
    Editor.Lines.Add('^BY3,3,43^FT313,107^BCN,,Y,N');
    Editor.Lines.Add('^FD>;0'+SgDados.Cells[0,L]+'^FS');
    Editor.Lines.Add('^BY3,3,49^FT37,110^BCN,,Y,N');
    Editor.Lines.Add('^FD>;0'+SgDados.Cells[0,L]+'^FS');
    // Cálculo para imprimir a qtd de etiquetas certo
    if Frac(StrToFloat(SgDados.Cells[2,L])/3) = 0.00 then
      vQtd := StrToFloat(SgDados.Cells[2,L])/3
    else vQtd := (StrToint(FormatFloat('0000',StrToFloat(SgDados.Cells[2,L]))) div 3) + 1;
    Editor.Lines.Add('^PQ'+FloatToStr(vQtd)+',0,1,Y^XZ');
  end;
  Editor.Lines.SaveToFile(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'etiqueta.txt')));
  WinExec(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'print.bat')),sw_ShowNormal);
  if not FileExists('Print.bat') then
    ShowMessage('Não foi encontrado o arquivo Print.bat');
  Application.OnMessage := FormPrincipal.ProcessaMsg;
  Limpar_Tela;
  RgOpcoes.ItemIndex := 0;
  Messagedlg('Impressão ok!', mtInformation, [mbOk], 0);
end;

procedure TFrmPrincipalPreVenda.ImprimeEtiquetasBijouArtsOS214;
var L : integer;
    Arq : TextFile;
    vQtd : real;
begin
  //if not CamposObrigatoriosPreenchidos(FrmPrincipalPreVenda) then exit;
  if SgDados.Cells[0,1] = '' then begin
    Messagedlg('Não foi lançado nenhum item para impressão das etiquetas!', mtWarning, [mbOk], 0);
    EdtConsulta.Setfocus;
    exit;
  end;
  if (Trim(EdtCdCliente.Text)<> '') and (Trim(EdtCdNome.Text) <> '') then
    SalvaEtiquetas;
  Editor.Lines.Clear;
  for L := 1 to SgDados.RowCount - 1 do begin // Salvando os itens da pré-venda.
    if SgDados.Cells[0,L] = '' then Break;
    Editor.Lines.Add('');
    Editor.Lines.Add('');
    Editor.Lines.Add('c0000');
    Editor.Lines.Add('KI503');
    Editor.Lines.Add('O0220');
    Editor.Lines.Add('f220');
    Editor.Lines.Add('KW0410');
    Editor.Lines.Add('KI7');
    Editor.Lines.Add('V0');
    Editor.Lines.Add('L');
    Editor.Lines.Add('H09');
    Editor.Lines.Add('PC');
    Editor.Lines.Add('A2');
    Editor.Lines.Add('D11');
    Editor.Lines.Add('1D8401500130013'+SgDados.Cells[0,L]+'');
    Editor.Lines.Add('1D8401400140127'+SgDados.Cells[0,L]+'');
    Editor.Lines.Add('1D8401400130248'+SgDados.Cells[0,L]+'');
    Editor.Lines.Add('191100100460013'+Trim(Copy(SgDados.Cells[1,L],1,19))+'');
    Editor.Lines.Add('121100000100013'+SgDados.Cells[0,L]+'');
    Editor.Lines.Add('191100100370013'+Trim(Copy(SgDados.Cells[1,L],20,20))+'');
    Editor.Lines.Add('121100000110126'+SgDados.Cells[0,L]+'');
    Editor.Lines.Add('121100000110247'+SgDados.Cells[0,L]+'');
    Editor.Lines.Add('191100100460127'+Trim(Copy(SgDados.Cells[1,L],1,19))+'');
    Editor.Lines.Add('191100100370127'+Trim(Copy(SgDados.Cells[1,L],20,20))+'');
    Editor.Lines.Add('191100100470248'+Trim(Copy(SgDados.Cells[1,L],1,19))+'');
    Editor.Lines.Add('191100100380248'+Trim(Copy(SgDados.Cells[1,L],20,20))+'');
    // Cálculo para imprimir a qtd de etiquetas certo
    if Frac(StrToFloat(SgDados.Cells[2,L])/3) = 0.00 then
      vQtd := StrToFloat(SgDados.Cells[2,L])/3
    else vQtd := (StrToint(FormatFloat('0000',StrToFloat(SgDados.Cells[2,L]))) div 3) + 1;
    Editor.Lines.Add('^'+FormatFloat('00',vQtd));
    Editor.Lines.Add('Q'+FormatFloat('0000',vQtd));
    Editor.Lines.Add('E');
  end;
  Editor.Lines.SaveToFile(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'etiqueta.txt')));
  WinExec(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'print.bat')),sw_ShowNormal);
  if not FileExists('Print.bat') then
    ShowMessage('Não foi encontrado o arquivo Print.bat');
  Application.OnMessage := FormPrincipal.ProcessaMsg;
  Limpar_Tela;
  RgOpcoes.ItemIndex := 0;
  Messagedlg('Impressão ok!', mtInformation, [mbOk], 0);
end;

procedure TFrmPrincipalPreVenda.ImprimeEtiquetasPipelaineShopping;
var L,J : integer;
    Arq : TextFile;
    vQtd : real;
    List_cdBarras,List_nm1,List_nm2,List_vlPreco,List_Codigo : TStringList;
begin
 //if not CamposObrigatoriosPreenchidos(FrmPrincipalPreVenda) then exit;
  if SgDados.Cells[0,1] = '' then begin
    Messagedlg('Não foi lançado nenhum item para impressão das etiquetas!', mtWarning, [mbOk], 0);
    EdtConsulta.SetFocus;
    exit;
  end;
  if (Trim(EdtCdCliente.Text)<> '') and (Trim(EdtCdNome.Text) <> '') then
    SalvaEtiquetas;
  if MessageDlg('Clique "Sim" para Shopping e "Não" para Rua de Geru!',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    vendereco := 'SHOPPING JARDINS LJ 145'
  else vendereco := 'RUA GERU, 226 CENTRO';
  nmEmpresa := 'LITORAL655';
  List_cdBarras := TStringList.Create;
  List_nm1      := TStringList.Create;
  List_nm2      := TStringList.Create;
  List_vlPreco  := TStringList.Create;
  List_Codigo   := TStringList.Create;
  // Cria uma lista com todos as etiquetas
  for L := 1 to SgDados.RowCount - 1 do begin
    if SgDados.Cells[0,L] = '' then Break;
    for J := 1 to (StrToint(FormatFloat('0000',StrToFloat(SgDados.Cells[2,L])))) do begin
      List_nm1.Add(Trim(Copy(SgDados.Cells[1,L],1,30)));
      List_nm2.Add(Trim(Copy(SgDados.Cells[1,L],30,40)));
      List_vlPreco.Add(VirgPonto(SgDados.Cells[3,L]));
      List_cdBarras.Add(SgDados.Cells[6,L]);
      List_Codigo.Add(SgDados.Cells[0,L]);
      //Editor2.Lines.Add(Trim(Copy(SgDados.Cells[1,L],1,30)) + ' ' + Copy(SgDados.Cells[1,L],30,40) + ' '+
      //                       PontoVirg(SgDados.Cells[3,L]) + ' '+ SgDados.Cells[6,L] + ' '+ SgDados.Cells[0,L]);
    end;
  end;
  //Editor2.Lines.SaveToFile('C:\Arquivos de programas\saef\bin\teste.txt');
  Editor.Lines.Clear;
  if Frac(List_nm1.count/2) <> 0.00 then begin
    List_nm1.Add('');
    List_nm2.Add('');
    List_vlPreco.Add('');
    List_cdBarras.Add('');
    List_Codigo.Add('');
  end;
  J := 0;
  for L := 0 to StrToint(FormatFloat('0000',(List_nm1.count/2))) - 1 do begin // Salvando os itens da pré-venda.
    Editor.Lines.Add('');
    Editor.Lines.Add('');
    Editor.Lines.Add('Q559,019');
    Editor.Lines.Add('q831');
    Editor.Lines.Add('rN');
    Editor.Lines.Add('S1');
    Editor.Lines.Add('D7');
    Editor.Lines.Add('ZT');
    Editor.Lines.Add('JB');
    Editor.Lines.Add('OD');
    Editor.Lines.Add('R56,0');
    Editor.Lines.Add('N');
    Editor.Lines.Add('B304,341,2,E30,2,4,61,B,"'+List_cdBarras[j+1]+'"');
    Editor.Lines.Add('B318,148,2,E30,2,4,61,B,"'+List_cdBarras[j+1]+'"');
    Editor.Lines.Add('B651,340,2,E30,2,4,61,B,"'+List_cdBarras[j]+'"');
    Editor.Lines.Add('B666,148,2,E30,2,4,61,B,"'+List_cdBarras[j]+'"');
    Editor.Lines.Add('A200,29,2,2,1,1,N,"Cod. '+List_Codigo[j+1]+'"');
    Editor.Lines.Add('A340,500,2,1,3,3,N,"'+nmEmpresa+'"');
    Editor.Lines.Add('A537,31,2,2,1,1,N,"Cod. '+List_Codigo[j]+'"');
    Editor.Lines.Add('A328,373,2,1,1,1,N,"'+List_nm2[j+1]+'"');
    Editor.Lines.Add('A680,500,2,1,3,3,N,"'+nmEmpresa+'"');
    Editor.Lines.Add('A676,372,2,1,1,1,N,"'+List_nm2[j]+'"');
    Editor.Lines.Add('A329,401,2,1,1,1,N,"'+List_nm1[j+1]+'"');
    Editor.Lines.Add('A330,222,2,1,1,1,N,"'+Copy(vendereco,1,30)+'"');
    Editor.Lines.Add('A679,220,2,1,1,1,N,"'+Copy(vendereco,1,30)+'"');
    Editor.Lines.Add('A676,400,2,1,1,1,N,"'+List_nm1[j]+'"');
    Editor.Lines.Add('A315,55,2,2,1,1,N,"R$ '+List_vlPreco[j+1]+'"');
    Editor.Lines.Add('A655,60,2,2,1,1,N,"R$ '+List_vlPreco[j]+'"');
    Editor.Lines.Add('P1');
    J := J + 2;
  end;
  Editor.Lines.SaveToFile(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'etiqueta.txt')));
  WinExec(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'print.bat')),sw_ShowNormal);
  if not FileExists('Print.bat') then
    ShowMessage('Não foi encontrado o arquivo Print.bat');
  Application.OnMessage := FormPrincipal.ProcessaMsg;
  Limpar_Tela;
  RgOpcoes.ItemIndex := 0;
  Messagedlg('Impressão ok!', mtInformation, [mbOk], 0);
end;

procedure TFrmPrincipalPreVenda.ImprimeEtiquetasPontoDasTintas;
begin
  FrmEtiquetaPontoDasTintas := TFrmEtiquetaPontoDasTintas.Create(Application);
  FrmEtiquetaPontoDasTintas.ShowModal;
end;

procedure TFrmPrincipalPreVenda.ImprimeEtiquetasSaoJose;
var L : integer;
    Arq : TextFile;
    vQtd : real;
begin
  //if not CamposObrigatoriosPreenchidos(FrmPrincipalPreVenda) then exit;
  if SgDados.Cells[0,1] = '' then begin
    Messagedlg('Não foi lançado nenhum item para impressão das etiquetas!', mtWarning, [mbOk], 0);
    EdtConsulta.Setfocus;
    exit;
  end;
  if (Trim(EdtCdCliente.Text)<> '') and (Trim(EdtCdNome.Text) <> '') then
    SalvaEtiquetas;
  Editor.Lines.Clear;
  for L := 1 to SgDados.RowCount - 1 do begin // Salvando os itens da pré-venda.
    if SgDados.Cells[0,L] = '' then Break;
    Editor.Lines.Add('^Q25,3');
    Editor.Lines.Add('^W100');
    Editor.Lines.Add('^H19');
    vQtd := StrToint(FormatFloat('0',StrToFloat(SgDados.Cells[2,L])));
    Editor.Lines.Add('^P'+FormatFloat('0',vQtd));
    Editor.Lines.Add('^S2');
    Editor.Lines.Add('^AD');
    Editor.Lines.Add('^C1');
    Editor.Lines.Add('^R0');
    Editor.Lines.Add('~Q+0');
    Editor.Lines.Add('^O0');
    Editor.Lines.Add('^D0');
    Editor.Lines.Add('^E10');
    Editor.Lines.Add('~R200');
    Editor.Lines.Add('^L');
    Editor.Lines.Add('Dy2-me-dd');
    Editor.Lines.Add('Th:m:s');
    Editor.Lines.Add('AC,24,22,1,1,0,0,COD. '+SgDados.Cells[0,L]+' - '+Copy(SgDados.Cells[1,L],1,38));
    Editor.Lines.Add('AC,22,62,1,1,0,0,'+Copy(SgDados.Cells[1,L],39,60));
    Editor.Lines.Add('AC,22,80,2,3,0,0,'+SgDados.Cells[10,L]+' - R$ '+SgDados.Cells[3,L]);
    Editor.Lines.Add('E');
  end;
  Editor.Lines.SaveToFile(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'etiqueta.txt')));
  WinExec(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'print2.bat')),sw_ShowNormal);
  if not FileExists('Print2.bat') then
    ShowMessage('Não foi encontrado o arquivo Print2.bat');
  Application.OnMessage := FormPrincipal.ProcessaMsg;
  Limpar_Tela;
  RgOpcoes.ItemIndex := 0;
  Messagedlg('Impressão ok!', mtInformation, [mbOk], 0);
end;

procedure TFrmPrincipalPreVenda.EdtUsuarioChange(Sender: TObject);
begin
  limparDadosDoUsuario;
end;

procedure TFrmPrincipalPreVenda.EdtUsuarioExit(Sender: TObject);
var vSenha : String[06];
i,J,x : integer;
begin
//  if (Length(edtusuario.Text) > 0) then
//  begin
//    if (cbxUsuario.Text = '')or(cbxUsuario.ItemIndex < 0) then
//    begin
//      Application.OnMessage := FormPrincipal.NaoProcessaMsg;
//      MessageDlg ('Selecione um usuário da lista!',mtWarning,[mbOk],0);
//      cbxUsuario.setfocus;
//      Application.OnMessage := FormPrincipal.ProcessaMsg;
//      Exit;
//    end
//    else
//    if edtUsuario.Text = '' then begin
//      Application.OnMessage := FormPrincipal.NaoProcessaMsg;
//      MessageDlg ('Digite a senha!',mtWarning,[mbOk],0);
//      edtUsuario.setfocus;
//      Application.OnMessage := FormPrincipal.ProcessaMsg;
//      Exit;
//    end
//    else
//    begin
      for I := 1 to 900 do
        for J := 1 to 7 do
          vVetor[I,J] := '';
      if Edtusuario.Text <> '' then begin
        I := 1; // índice do vetor
        vSenha := Senha(Edtusuario.Text,'C');
        with Dmodulo.ADOQuery1 do
        begin
          Sql.Text := 'Select UPPER(F.nmFuncionario) AS nmPessoa, S.cdPessoa, F.vlDesconto '+
                      'FROM senha S WITH (NOLOCK) '+
                      '   INNER JOIN Funcionario F WITH (NOLOCK) '+
                      '       on S.cdPessoa = F.cdpessoa '+
                      'WHERE S.dsnome = :DSNOME and S.dsSenha = :SENHA ';
          Parameters.ParamByName('DSNOME').Value := cbxUsuario.Text;
          parameters.ParamByName('SENHA').value := vSenha;
          Open;
          if recordcount = 0 then
          begin
            Application.OnMessage :=  FrmPrincipalPreVenda.NaoProcessaMsg;
            MessageDlg('Senha inválida. Tente novamente!' + ' ',mtWarning,[mbOk],0);

            limparDadosDoUsuario;
            ADOQryNome.Close;

            edtusuario.SelectAll;
            edtusuario.SetFocus;
            Application.OnMessage := FrmPrincipalPreVenda.ProcessaMsg;
            exit;
          end
          else
          begin
            //if prevenda.vendedor = nil then
             //  prevenda.vendedor:= TFuncionario.Create();
            //if RgOpcoes.ItemIndex <> 1 then begin
              //prevenda.vendedor.codigo:= Dmodulo.ADOQuery1.fieldbyname('cdPessoa').AsInteger;
              //prevenda.vendedor.nome:= Dmodulo.ADOQuery1.FieldByName('nmPessoa').AsString;
              edtcdnome.text:= Dmodulo.ADOQuery1.fieldbyname('cdPessoa').AsString;
              CbxNome.Text:= Dmodulo.ADOQuery1.FieldByName('nmPessoa').AsString;
              vcdVendedor := Dmodulo.ADOQuery1.fieldbyname('cdPessoa').AsString;
              vnmVendedor := Dmodulo.ADOQuery1.FieldByName('nmPessoa').AsString;
              if frmConferencia <> nil then begin
                frmConferencia.edtcdFuncionario.text := vcdVendedor;
                frmConferencia.edtcdFuncionarioExit(self);
              end;
           // end
           // else begin
          //    prevenda.vendedor.codigo:= StrToInt(EdtCdNome.Text);
           //   prevenda.vendedor.nome:= CbxNome.Text;
           // end;
            vlDescontoVendedor:= Dmodulo.ADOQuery1.FieldbyName('vlDesconto').AsFloat;
          end;
        end;
        with ADOQuery1 do
        begin
          Sql.Text := 'Select * From Permissao WITH (NOLOCK) '+
                      'Where  dsnome = :DSNOME and dsSenha = :dssenha ';
          Parameters.ParamByName('DSNOME').Value := cbxUsuario.Text;
          Parameters.ParamByName('dsSenha').Value := vSenha;
          Open;
          // Monta Vetor
          while not Eof do begin
            vVetor[i,1] := ADOQuery1.FieldByName('nrTag').AsString;
            vVetor[I,2] := ADOQuery1.FieldByName('dsIncluir').AsString;
            vVetor[I,3] := ADOQuery1.FieldByName('dsAlterar').AsString;
            vVetor[I,4] := ADOQuery1.FieldByName('dsExcluir').AsString;
            vVetor[I,5] := ADOQuery1.FieldByName('dsVisualizar').AsString;
            vVetor[I,6] := ADOQuery1.FieldByName('dsImprimir').AsString;
            vVetor[I,7] := ADOQuery1.FieldByName('dsBaixa').AsString;
            I := I + 1;
            ADOQuery1.Next;
          end;  // while
          x := 1;
        end;   // with
      end;
//    end;
//  end
//  else
//    limparDadosDoUsuario;
  if not((StrToFloatDef(EdtQtd.Text,0) > 0) and (UPPERCASE(vEmpresa)='TREVO')) then begin
    if (RgOpcoes.ItemIndex in [0,2,4]) or ((transformarOrcamentoPrevenda = true) and (RgOpcoes.ItemIndex = 1)) then
      CbxCliente.SetFocus
    else
      edtLancto.SetFocus;
  end
  else begin
    if EdtDescUnit.Enabled = True then
      EdtDescUnit.SetFocus
    else if EdtPreco.Enabled = true then
      EdtPreco.SetFocus;
  end;
end;

procedure TFrmPrincipalPreVenda.limparDadosDoUsuario;
begin
  if RgOpcoes.itemindex <> 1 then begin
    CbxNome.ItemIndex := -1;
    CbxNome.Text      := '';
    edtcdnome.text    := '';
  end;
end;


procedure TFrmPrincipalPreVenda.EdtUsuarioKeyPress(Sender: TObject;
  var Key: Char);
begin
  //ValidarNumero(Key);
  if (Key = Char(27)) then
    BtnCancelar.Click;
end;

procedure TFrmPrincipalPreVenda.SgDadosClick(Sender: TObject);
var produto : TDOMProduto;
begin
  if (SgDados.Row > SgDados.RowCount-1) or (SgDados.Row = 0) then
  begin
    //SgDados.Row:= SgDados.RowCount -2;
    Exit;
  end;
  produto:= TNEGProduto.buscarProduto(StrtointDef(SgDados.Cells[0,SgDados.Row],-1));
  if (vDestacarItensOcupados) and ((RgOpcoes.ItemIndex = 0)or((transformarOrcamentoPrevenda = true) and (RgOpcoes.ItemIndex = 1))) then begin
    if (SgDados.Cells[0,SgDados.Row]<>'')and(vEstqNegativo <> 'S') and
     (((qtdInsuficienteParaPrevend(StrToInt(SgDados.Cells[0,SgDados.Row]), strToFloatDef(SgDados.Cells[2,SgDados.Row],0)) > 0)and(produto.tipoComposicao <> composto))
     or ((produto.tipoComposicao = composto)and(TNEGProduto.getEstoquePossivelProdutoComposto(produto.cdproduto,1)<=0))) then
    begin
      exibirExclamacao;
     // if (UpperCase(vEmpresa) <> 'DISCABOS') and (UpperCase(vEmpresa) <> 'SANTANA') then   // LIBERA P ALTERAR A QUANTIDADE NO PRODUTO DIRETO NA GRID
     //   btnMensagemClick(self);
    end
    else
      ocultarExclamacao;
  end;
  if SgDados.Col >= 3 then
     EdtConsulta.SetFocus;
end;

procedure TFrmPrincipalPreVenda.ImprimeEtiquetasDisCabos;
var L : integer;
    Arq : TextFile;
    vQtd : real;
begin
  //if not CamposObrigatoriosPreenchidos(FrmPrincipalPreVenda) then exit;
  if SgDados.Cells[0,1] = '' then begin
    Messagedlg('Não foi lançado nenhum item para impressão das etiquetas!', mtWarning, [mbOk], 0);
    EdtConsulta.Setfocus;
    exit;
  end;
  if (Trim(EdtCdCliente.Text)<> '') and (Trim(EdtCdNome.Text) <> '') then
    SalvaEtiquetas;
  Editor.Lines.Clear;
  for L := 1 to SgDados.RowCount - 1 do begin // Salvando os itens da pré-venda.
    if SgDados.Cells[0,L] = '' then Break;
    Editor.Lines.Add('');
    Editor.Lines.Add('');
    Editor.Lines.Add('c0000');
    Editor.Lines.Add('KI503');
    Editor.Lines.Add('O0220');
    Editor.Lines.Add('f220');
    Editor.Lines.Add('KW0475');
    Editor.Lines.Add('KI7');
    Editor.Lines.Add('V0');
    Editor.Lines.Add('L');
    Editor.Lines.Add('H09');
    Editor.Lines.Add('PC');
    Editor.Lines.Add('A2');
    Editor.Lines.Add('D11');
    Editor.Lines.Add('1F2201500180011'+SgDados.Cells[6,L]+'');
    Editor.Lines.Add('121100000540010'+Trim(Copy(SgDados.Cells[1,L],1,19))+'');
    Editor.Lines.Add('111100000070009'+SgDados.Cells[0,L]+'');
    Editor.Lines.Add('121100000440010'+Trim(Copy(SgDados.Cells[1,L],20,20))+'');
    Editor.Lines.Add('411100000230008DISCABOS');
    Editor.Lines.Add('121100000550150'+Trim(Copy(SgDados.Cells[1,L],1,19))+'');
    Editor.Lines.Add('111100000080149'+SgDados.Cells[0,L]+'');
    Editor.Lines.Add('121100000450150'+Trim(Copy(SgDados.Cells[1,L],20,20))+'');
    Editor.Lines.Add('411100000220145DISCABOS');
    Editor.Lines.Add('121100000550293'+Trim(Copy(SgDados.Cells[1,L],1,19))+'');
    Editor.Lines.Add('111100000070292'+SgDados.Cells[0,L]+'');
    Editor.Lines.Add('121100000450293'+Trim(Copy(SgDados.Cells[1,L],20,20))+'');
    Editor.Lines.Add('411100000210288DISCABOS');
    Editor.Lines.Add('1F2201500170150'+SgDados.Cells[6,L]+'');
    Editor.Lines.Add('1F2201500170294'+SgDados.Cells[6,L]+'');
    // Cálculo para imprimir a qtd de etiquetas certo
    if Frac(StrToFloat(SgDados.Cells[2,L])/3) = 0.00 then
      vQtd := StrToFloat(SgDados.Cells[2,L])/3
    else vQtd := (StrToint(FormatFloat('0000',StrToFloat(SgDados.Cells[2,L]))) div 3) + 1;
    Editor.Lines.Add('^'+FormatFloat('00',vQtd));
    Editor.Lines.Add('Q'+FormatFloat('0000',vQtd));
    Editor.Lines.Add('E');
  end;
  Editor.Lines.SaveToFile(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'etiqueta.txt')));
  WinExec(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'print.bat')),sw_ShowNormal);
  if not FileExists('Print.bat') then
    ShowMessage('Não foi encontrado o arquivo Print.bat');
  Application.OnMessage := FormPrincipal.ProcessaMsg;
  Limpar_Tela;
  RgOpcoes.ItemIndex := 0;
  Messagedlg('Impressão ok!', mtInformation, [mbOk], 0);
end;

procedure TFrmPrincipalPreVenda.ImprimeEtiquetaLayeVictor;
var L : integer;
    Arq : TextFile;
    vQtd : real;
begin
  //if not CamposObrigatoriosPreenchidos(FrmPrincipalPreVenda) then exit;
  if SgDados.Cells[0,1] = '' then begin
    Messagedlg('Não foi lançado nenhum item para impressão das etiquetas!', mtWarning, [mbOk], 0);
    EdtConsulta.Setfocus;
    exit;
  end;
  if (Trim(EdtCdCliente.Text)<> '') and (Trim(EdtCdNome.Text) <> '') then
    SalvaEtiquetas;
  Editor.Lines.Clear;
  for L := 1 to SgDados.RowCount - 1 do begin // Salvando os itens da pré-venda.
    if SgDados.Cells[0,L] = '' then Break;
    Editor.Lines.Add('');
    Editor.Lines.Add('');
    Editor.Lines.Add('N');
    Editor.Lines.Add('q834');
    Editor.Lines.Add('Q338,24');
    Editor.Lines.Add('JB');
    Editor.Lines.Add('D9');
    Editor.Lines.Add('S2');
    Editor.Lines.Add('O');
    //Editor.Lines.Add('B36,40,0,2,3,6,37,B,"'+SgDados.Cells[0,L]+'"');
    //Editor.Lines.Add('B320,36,0,2,3,6,37,B,"'+SgDados.Cells[0,L]+'"');  // Cod. Produto
    //Editor.Lines.Add('B594,38,0,2,3,6,37,B,"'+SgDados.Cells[0,L]+'"');
    Editor.Lines.Add('A14,34,0,1,1,1,N,"'+Trim(Copy(SgDados.Cells[1,L],1,19))+'"');
    Editor.Lines.Add('A296,34,0,1,1,1,N,"'+Trim(Copy(SgDados.Cells[1,L],1,19))+'"');  //Cod. Barra
    Editor.Lines.Add('A578,34,0,1,1,1,N,"'+Trim(Copy(SgDados.Cells[1,L],1,19))+'"');
    Editor.Lines.Add('A228,32,1,1,1,1,N,"'+Trim(Copy(SgDados.Cells[1,L],20,20))+'"');
    Editor.Lines.Add('A512,34,1,1,1,1,N,"'+Trim(Copy(SgDados.Cells[1,L],20,20))+'"'); // Descricao part 1
    Editor.Lines.Add('A796,34,1,1,1,1,N,"'+Trim(Copy(SgDados.Cells[1,L],20,20))+'"');
    Editor.Lines.Add('A16,124,0,1,2,3,N,"'+'R$ '+SgDados.Cells[3,L]+'"');
    Editor.Lines.Add('A298,126,0,1,2,3,N,"'+'R$ '+SgDados.Cells[3,L]+'"'); // Descricao part 2
    Editor.Lines.Add('A580,124,0,1,2,3,N,"'+'R$ '+SgDados.Cells[3,L]+'"');
    Editor.Lines.Add('B8,52,0,E30,2,4,55,B,"'+ SgDados.Cells[6,L]+'"');
    Editor.Lines.Add('B292,52,0,E30,2,4,55,B,"'+ SgDados.Cells[6,L]+'"');  // Preco de Venda
    Editor.Lines.Add('B576,50,0,E30,2,4,55,B,"'+ SgDados.Cells[6,L]+'"');
    // Cálculo para imprimir a qtd de etiquetas certo
    if Frac(StrToFloat(SgDados.Cells[2,L])/3) = 0.00 then
      vQtd := StrToFloat(SgDados.Cells[2,L])/3
    else vQtd := (StrToint(FormatFloat('0000',StrToFloat(SgDados.Cells[2,L]))) div 3) + 1;
    Editor.Lines.Add('P1,'+FloatToStr(vQtd));
  end;
  Editor.Lines.SaveToFile(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'etiqueta.txt')));
  WinExec(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'print2.bat')),sw_ShowNormal);
  if not FileExists('Print2.bat') then
    ShowMessage('Não foi encontrado o arquivo Print2.bat');
  Application.OnMessage := FormPrincipal.ProcessaMsg;
  Limpar_Tela;
  RgOpcoes.ItemIndex := 0;
  Messagedlg('Impressão ok!', mtInformation, [mbOk], 0);
end;

function TFrmPrincipalPreVenda.MessageDlgDef(const Msg, MyCaption: string;
  AType: TMsgDlgType; AButtons: TMsgDlgButtons;
  DefButton : TModalResult; HelpCtx: Longint): Word;
var
  i : Integer;
begin
  with CreateMessageDialog(Msg,AType,AButtons) do begin
    try
      Caption := MyCaption;
      HelpContext := HelpCtx;
      for i := 0 to ComponentCount - 1 do begin
        if (Components[i] is TButton) and (TButton(Components[i]).ModalResult = DefButton) then
          ActiveControl := TButton(Components[i]);
        if Components[i] is TButton then begin
          with TButton(Components[i]) do begin
            case ModalResult of
              mrYes    : Caption := 'Imprima';
              mrNo     : Caption := 'Não imprima';
              mrOK     : Caption := 'Pequena';
              mrCancel : Caption := 'Grande';
              mrAbort  : Caption := 'Abortada';
              mrRetry  : Caption := 'Tente Novamente';
              mrIgnore : Caption := 'Nada';
            end;
          end;
        end;
      end;
      Result := ShowModal;
    finally
      Free;
    end;
  end;
end;

procedure TFrmPrincipalPreVenda.MiCadastroAmbientesClick(Sender: TObject);
begin
  FrmCdAmbiente := TFrmCdAmbiente.Create(Application);
  FrmCdAmbiente.Showmodal;
  MontaComboAmbiente;
end;

procedure TFrmPrincipalPreVenda.consultarUltimasVendasDoProdutoAoCliente;
var
  produto: TDOMProduto;
  codigoCliente: integer;
  cliente: TCliente;
begin

  // crio e preencho a lista de produtos q será passada para o form
  if (ADOSPConsulta.Active) and (ADOSPConsulta.RecordCount>0) then
    produto:= TDOMProduto.Create(ADOSPConsulta.FieldByName('CÓDIGO').AsInteger, ADOSPConsulta.FieldByName('DESCRIÇÃO').AsString)
  else
  begin
    MessageDlg('Selecione um produto.', mtInformation, [mbOk], 0);
    Exit;
  end;
  if TryStrToInt(copy_campo(CbxCliente.Text,'|',2),codigoCliente) then
  begin
    cliente:= TCliente.Create;
    cliente.codigo:= codigoCliente;
    cliente.nome:= copy_campo(CbxCliente.Text,'|',1);
  end
  else
  begin
    FreeAndNil(produto);
    MessageDlg('Selecione um cliente.', mtInformation, [mbOk], 0);
    CbxCliente.SetFocus;
    Exit;
  end;
  frmUltimasVendasDoProdutoAoCliente:= TfrmUltimasVendasDoProdutoAoCliente.Create(self, produto, cliente);
  frmUltimasVendasDoProdutoAoCliente.ShowModal;
  EdtConsulta.setFocus;
end;

procedure TFrmPrincipalPreVenda.consultarProdutosVendidosJunto;
var
  produtos: TList<TDOMProduto>;
  produtoResultado: TDOMProduto;
  i, codigoProduto: integer;
  descricaoProduto: string;
  cliente: TCliente;
begin

  // crio e preencho a lista de produtos q será passada para o form
  produtos:= TList<TDOMProduto>.Create;
  for i := 1 to (SgDados.RowCount-1) do
    if TryStrToInt(SgDados.Cells[0, i],codigoProduto) then
    begin
      descricaoProduto:= SgDados.Cells[1, i];
      produtos.Add(TDOMProduto.Create(codigoProduto, descricaoProduto));
    end
    else
      Break;
  if (Produtos.Count > 0) then
  begin
    cliente:= TCliente.Create;
    cliente.isAtacado:= (vAtacadoVarejo = 'A');
    cliente.descontoPercentual:= (1-TNEGCliente.getPercentualDoPrecoComDescontoDecimal(StrtoIntDef(EdtCdCliente.Text,0)))*100;
    formComprouJunto:= TformComprouJunto.Create(self, produtos, cliente, produtoResultado);
    formComprouJunto.ShowModal;
    if (produtoResultado <> nil) then
    begin
      case RadioGroup1.ItemIndex of
        0: edtConsulta.Text:= IntToStr(produtoResultado.cdProduto);
        1: edtConsulta.Text:= produtoResultado.descricao;
      else
        RadioGroup1.ItemIndex:= 0;
        edtConsulta.Text:= IntToStr(produtoResultado.cdProduto);
      end;
      EdtConsultaChange(Self);
      EdtConsulta.setFocus;
    end;
  end
  else
  begin
    freeAndNil(produtos);
    Showmessage('Não existem produtos nesta prevenda.');
  end;
end;

procedure TFrmPrincipalPreVenda.Consultarprvendas1Click(Sender: TObject);
begin
  Consulta_prevenca := TConsulta_prevenca.Create(Application);
  try
    FrmPrincipalPreVenda.Enabled := False;
    Consulta_prevenca.Show;
  except
    Consulta_prevenca.Free;
    FrmPrincipalPreVenda.Enabled:= True;
  end;
end;

procedure TFrmPrincipalPreVenda.miProdutosVendidosJuntoClick(Sender: TObject);
begin
  consultarProdutosVendidosJunto;
end;

procedure TFrmPrincipalPreVenda.miÚltimasVendasDoProdutoAoClienteClick(
  Sender: TObject);
begin
  consultarUltimasVendasDoProdutoAoCliente;
end;

procedure TFrmPrincipalPreVenda.MontaComboAmbiente;
begin
  MontaComboListADO(adoambiente,CbxAmbiente);
end;

procedure TFrmPrincipalPreVenda.ImprimeEtiquetaGrandeLayeVictor;
var L : integer;
    Arq : TextFile;
    vQtd : real;
begin
  //if not CamposObrigatoriosPreenchidos(FrmPrincipalPreVenda) then exit;
  if SgDados.Cells[0,1] = '' then begin
    Messagedlg('Não foi lançado nenhum item para impressão das etiquetas!', mtWarning, [mbOk], 0);
    EdtConsulta.Setfocus;
    exit;
  end;
  if (Trim(EdtCdCliente.Text)<> '') and (Trim(EdtCdNome.Text) <> '') then
    SalvaEtiquetas;
  Editor.Lines.Clear;
  for L := 1 to SgDados.RowCount - 1 do begin // Salvando os itens da pré-venda.
    if SgDados.Cells[0,L] = '' then Break;
    Editor.Lines.Add('');
    Editor.Lines.Add('');
    Editor.Lines.Add('N');
    Editor.Lines.Add('q1142');
    Editor.Lines.Add('Q460,24');
    Editor.Lines.Add('JB');
    Editor.Lines.Add('D7');
    Editor.Lines.Add('S2');
    Editor.Lines.Add('O');
    Editor.Lines.Add('B240,224,2,E30,2,4,43,B,"'+SgDados.Cells[6,L]+'"');
    Editor.Lines.Add('A204,362,2,2,1,1,N,"'+nmEmpresa+'"');
    Editor.Lines.Add('B238,116,2,E30,2,4,55,B,"'+SgDados.Cells[6,L]+'"');
    Editor.Lines.Add('A264,342,2,2,1,1,N,"'+'Ref: '+SgDados.Cells[7,L]+'"');
    Editor.Lines.Add('A262,320,2,2,1,1,N,"'+Trim(Copy(SgDados.Cells[1,L],1,19))+'"');
    Editor.Lines.Add('A262,282,2,3,2,2,N,"'+'R$'+SgDados.Cells[3,L]+'"');
    Editor.Lines.Add('B514,218,2,E30,2,4,43,B,"'+SgDados.Cells[6,L]+'"');
    Editor.Lines.Add('A486,356,2,2,1,1,N,"'+nmEmpresa+'"');
    Editor.Lines.Add('B512,110,2,E30,2,4,55,B,"'+SgDados.Cells[6,L]+'"');
    Editor.Lines.Add('A546,336,2,2,1,1,N,"'+'Ref: '+SgDados.Cells[7,L]+'"');
    Editor.Lines.Add('A544,314,2,2,1,1,N,"'+Trim(Copy(SgDados.Cells[1,L],1,19))+'"');
    Editor.Lines.Add('A544,276,2,3,2,2,N,"'+'R$'+SgDados.Cells[3,L]+'"');
    Editor.Lines.Add('B796,218,2,E30,2,4,43,B,"'+SgDados.Cells[6,L]+'"');
    Editor.Lines.Add('A770,356,2,2,1,1,N,"'+nmEmpresa+'"');
    Editor.Lines.Add('B794,110,2,E30,2,4,55,B,"'+SgDados.Cells[6,L]+'"');
    Editor.Lines.Add('A820,336,2,2,1,1,N,"'+'Ref: '+SgDados.Cells[7,L]+'"');
    Editor.Lines.Add('A818,314,2,2,1,1,N,"'+Trim(Copy(SgDados.Cells[1,L],1,19))+'"');
    Editor.Lines.Add('A818,276,2,3,2,2,N,"'+'R$'+SgDados.Cells[3,L]+'"');
    Editor.Lines.Add('A262,302,2,2,1,1,N,"'+Trim(Copy(SgDados.Cells[1,L],20,20))+'"');
    Editor.Lines.Add('A544,296,2,2,1,1,N,"'+Trim(Copy(SgDados.Cells[1,L],20,20))+'"');
    Editor.Lines.Add('A818,296,2,2,1,1,N,"'+Trim(Copy(SgDados.Cells[1,L],20,20))+'"');
    // Cálculo para imprimir a qtd de etiquetas certo
    if Frac(StrToFloat(SgDados.Cells[2,L])/3) = 0.00 then
      vQtd := StrToFloat(SgDados.Cells[2,L])/3
    else vQtd := (StrToint(FormatFloat('0000',StrToFloat(SgDados.Cells[2,L]))) div 3) + 1;
    Editor.Lines.Add('P1,'+FloatToStr(vQtd));
  end;
  Editor.Lines.SaveToFile(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'etiqueta.txt')));
  WinExec(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'print2.bat')),sw_ShowNormal);
  if not FileExists('Print2.bat') then
    ShowMessage('Não foi encontrado o arquivo Print2.bat');
  Application.OnMessage := FormPrincipal.ProcessaMsg;
  Limpar_Tela;
  RgOpcoes.ItemIndex := 0;
  Messagedlg('Impressão ok!', mtInformation, [mbOk], 0);
end;

procedure TFrmPrincipalPreVenda.montaComboLote;
var
  query : TADOQuery;
  cdProduto, banco_deposito: string;
begin
  cbLote.clear;
  cdproduto:= ADOSPConsulta.FieldByName('Código').AsString;
  if Length(cdproduto) = 0  then
     exit;
  query := TADOQuery.Create(self);
  with query do
  begin
    Connection := DModulo.Conexao;
    SQL.Text := 'SELECT DSOCULTARLOTE FROM PRODUTO WITH (NOLOCK) WHERE CDPRODUTO = :CDPRODUTO';
    Parameters.ParamByName('CDPRODUTO').Value := cdProduto;
    Open;
    if FieldByName('dsOcultarLote').AsString = '1' then
    begin
      FreeAndNil(query);
      exit;
    end;
    Close;
//    if (UpperCase(vEmpresa) = 'PBFARMA') then
//    begin
//      Connection := DModulo.ADODeposito;
//      SQL.Text := 'SELECT DB_NAME() AS DataBaseName';
//      Open;
//      banco_deposito := '[' + fieldbyname('DataBaseName').asString + ']' + '.dbo.';
//      Connection := DModulo.Conexao;
//      SQL.Text := 'select LOTES.lote lote, LOTES.validade strValidade, sum(LOTES.nrqtd) nrqtd, LOTES.cdFabricante, LOTES.validade '+
//                  'from (select 	NRLOTE lote,                                                                 '+
//                  '	CONVERT(VARCHAR(10),VALIDADE,103) strvalidade,                                             '+
//                  '	nrqtd, cdFabricante,                                                                                    '+
//                  '	validade                                                                                   '+
//                  'FROM ITELOTE where cdproduto = :CODIGO1 and nrqtd > 0                                       '+
//                  'union all                                                                                   '+
//                  'select 	NRLOTE lote,                                                                       '+
//                  '	CONVERT(VARCHAR(10),                                                                       '+
//                  '	VALIDADE,103) strvalidade,                                                                 '+
//                  '	nrqtd, cdFabricante,                                                                                    '+
//                  '	validade                                                                                   '+
//                  'FROM '+ banco_deposito +'ITELOTE where cdproduto = :CODIGO2 and nrqtd > 0) as LOTES         '+
//                  'group by LOTES.lote, LOTES.validade, LOTES.cdFabricante                                                         '+
//                  'order by validade                                                                           ';
//      Parameters.ParamByName('CODIGO1').Value:= cdproduto;
//      Parameters.ParamByName('CODIGO2').Value:= cdproduto;
//    end
//    else
    begin
      Connection := DModulo.Conexao;
      SQL.Text := 'select 	NRLOTE lote,                              '+
                  '	CONVERT(VARCHAR(10),VALIDADE,103) validade,       '+
                  '	CONVERT(VARCHAR(10),SUM(isnull(NRQTD,0))) nrqtd, '+
                  '	cdFabricante fabricante,                          '+
                  '	validade                                          '+
                  'FROM ITELOTE WITH (NOLOCK)                         '+
                  'where (cdproduto=:CODIGO)                          '+
                  'group by ITELOTE.nrLote, ITELOTE.validade,         '+
                  'ITELOTE.cdFabricante, ITELOTE.validade             '+
                  'having (SUM(nrqtd) > 0)                            '+
                  'order by 5                                         ';
      Parameters.ParamByName('CODIGO').Value:= cdproduto;
    end;
    MontaComboListComposto(query,cbLote,4);
    cbLote.Enabled:= True;
    cbLote.ItemIndex:= -1;
    cbLote.text:= '';
  end;
  freeandnil(query);
  setLabel23(QuantidadeDispEmLotes(strToIntDef(cdproduto,-1)));
end;

function TFrmPrincipalPreVenda.QuantidadeDispEmLotes(cdProduto:integer):real;
var
  query : TADOQuery;
  banco_deposito: string;
  resultado: real;
  i: integer;
begin
  resultado:= 0;
  query := TADOQuery.Create(self);
  with query do
  begin
//    if (UpperCase(vEmpresa) = 'PBFARMA') then
//    begin
//      Connection := DModulo.ADODeposito;
//      SQL.Text := 'SELECT DB_NAME() AS DataBaseName';
//      Open;
//      banco_deposito := '[' + fieldbyname('DataBaseName').asString + ']';
//      Connection := DModulo.Conexao;
//      SQL.Text := 'select 	NRLOTE lote, cdFabricante cdFabricanteLote   '+
//                  'FROM ITELOTE where (cdproduto = :CODIGO1) and (nrqtd > 0) '+
//                  'union                                                 '+
//                  'select 	NRLOTE lote, cdFabricante cdFabricanteLote '+
//                  'FROM '+ banco_deposito +'.dbo.ITELOTE                 '+
//                  'where (cdproduto = :CODIGO2) and (nrqtd > 0)          ';
//      Parameters.ParamByName('CODIGO1').Value:= cdproduto;
//      Parameters.ParamByName('CODIGO2').Value:= cdproduto;
//    end
//    else
    begin
      Connection := DModulo.Conexao;
      SQL.Text := 'select distinct NRLOTE lote, cdFabricante cdFabricanteLote       '+
                  'FROM ITELOTE WITH (NOLOCK) where (cdproduto =:CODIGO) and (nrqtd > 0) ';
      Parameters.ParamByName('CODIGO').Value:= cdproduto;
    end;
    Open;
    for i:= 0 to (RecordCount-1) do
    begin
      resultado:= resultado + QuantidadeDispNoLote(FieldByName('lote').AsString,cdProduto, FieldByName('cdFabricanteLote').AsInteger);
      next;
    end;
  end;
  freeandnil(query);
  result:= resultado;
end;

procedure TFrmPrincipalPreVenda.Monta_Combo;
begin
  With ADOQryCliente do
  begin // monta a combo dos clientes
{    Sql.Text := 'SELECT P.nmPessoa,P.cdPessoa,E.nmLogradouro,E.dsUF,T.dsNaturalidade as Apelido,C.dsPreVenda,       '+
                'C.vlDescVista,C.vlDescPrazo,C.dsVista,C.DSLIMCREDITO        '+
                'FROM P_Fisica T WITH (NOLOCK) INNER JOIN Endereco E WITH (NOLOCK) ON T.cdPessoa = E.cdPessoa INNER '+
                'JOIN Pessoa P WITH (NOLOCK) ON T.cdPessoa = P.cdPessoa INNER JOIN Cliente C WITH (NOLOCK)           '+
                'ON C.cdPessoa = P.cdPessoa AND E.cdPessoa = P.cdPessoa Where P.ser = ''C'' and P.dsAtivo = ''S''    ';
                if ((UpperCase(vEmpresa) = 'CAMARATUBA')or(UpperCase(vEmpresa) = 'CARDOSOACESSORIOS')) then
                  SQL.Add('and C.cdCodigo <> 2 ');
                SQL.Add('union ');
                SQL.Add('SELECT P.nmPessoa,P.cdPessoa,E.nmLogradouro,E.dsUF,T.nmContato as Apelido,C.dsPreVenda,          ');
                SQL.Add('C.vlDescVista,C.vlDescPrazo,C.dsVista,C.DSLIMCREDITO ');
                SQL.Add('FROM P_Juridica T WITH (NOLOCK) INNER JOIN Endereco E WITH (NOLOCK) ON T.cdPessoa = E.cdPessoa   ');
                SQL.Add('INNER JOIN Pessoa P WITH (NOLOCK) ON T.cdPessoa = P.cdPessoa INNER JOIN Cliente C WITH (NOLOCK)  ');
                SQL.Add('ON C.cdPessoa = P.cdPessoa AND E.cdPessoa = P.cdPessoa Where P.ser = ''C'' and P.dsAtivo = ''S'' ');
                if (UpperCase(vEmpresa) = 'CAMARATUBA')or(UpperCase(vEmpresa) = 'CARDOSOACESSORIOS') then
                  SQL.Add('and C.cdCodigo <> 2 ');
                SQL.Add('Order By P.nmPessoa ');}
    Sql.Text := 'SELECT P.nmPessoa,P.cdPessoa,E.nmLogradouro,E.dsUF,C.dsPreVenda,  '+
                'C.vlDescVista,C.vlDescPrazo,C.dsVista,C.DSLIMCREDITO,             '+
                'case P.Existir                                                    '+
                '  when ''F'' then PF.dsNaturalidade                               '+
                '  when ''J'' then PJ.nmContato                                    '+
                'end as Apelido                                                    '+
                'FROM Pessoa P WITH (NOLOCK) Inner Join Endereco E WITH (NOLOCK) ON P.cdPessoa = E.cdPessoa '+
                'INNER JOIN Cliente C WITH (NOLOCK)                                '+
                'ON P.cdPessoa = C.cdPessoa                                        '+
                'Left Join P_Fisica PF WITH (NOLOCK) ON P.cdpessoa = PF.cdPessoa   '+
                'Left Join P_Juridica PJ WITH (NOLOCK) ON P.cdpessoa = PJ.cdPessoa '+
                'Where P.ser = ''C'' and P.dsAtivo = ''S'' ';
                if (UpperCase(vEmpresa) = 'CAMARATUBA')or(UpperCase(vEmpresa) = 'CARDOSOACESSORIOS') then
                  SQL.Add('and C.cdCodigo <> 2 ');
                SQL.Add('Order By P.nmPessoa ');
    MontaComboListComposto(ADOQryCliente,CbxCliente,2);
  end;

// claudio 10-09-2015
//  With ADOQryNome do begin     // monta a combo dos funcionarios
//    Sql.Text := 'Select UPPER(P.nmPessoa) AS nmPessoa,P.cdPessoa,F.vlDesconto From Pessoa '+
//                'P WITH (NOLOCK),Funcionario F WITH (NOLOCK),Cargo C WITH (NOLOCK)        '+
//                'Where P.cdPessoa = F.cdPessoa and F.cdCargo = C.cdCargo                  '+
//                'and P.ser = ''U'' and P.dsAtivo = ''S'' and C.nmCargo in                 '+
//                '(''Vendedor'',''BALCONISTA'',''TÉCNICO'',''CHEFE CPD'',''FARMACEUTICA'') '+
//                'Order By P.nmPessoa                                                      ';
//    MontaComboListBoolADO(ADOQryNome,CbxNome);
//  end;
end;

function TFrmPrincipalPreVenda.PegaDatabanco: TDateTime;
begin
  PegaDatabanco := StrToDate(vData_Banco);
end;

function TFrmPrincipalPreVenda.pegaHoraBanco: String;
begin
  With DModulo.ADOQuery1 do
  begin
    Sql.Text := 'Select CONVERT(CHAR(8),GETDATE(),14) as hora';
    Open;
    pegaHoraBanco := Fieldbyname('hora').AsString;
  end;
end;

procedure TFrmPrincipalPreVenda.SalvaLogEventos(dsEvento: String;
  dtEvento: TDateTime; hrEvento, dsLancamento, dsDocumento: String;
  vlvalor: real; cdUsuario: integer; cdOpcao: String);
begin
  With DModulo.ADOQuery1 do
  begin
    Sql.Text := 'INSERT INTO LogEventos(dtEvento,hrEvento,dsEvento,dsLancamento,  '+
	             'dsDocumento,vlValor,cdUsuario,cdOpcao)                            '+
                'VALUES (:dtEvento,:hrEvento,:dsEvento,:dsLancamento,:dsDocumento,'+
                ':vlValor,:cdUsuario,:cdOpcao)                                    ';
    Parameters.parambyname('dtEvento').Value := dtEvento;
    Parameters.parambyname('hrEvento').Value := hrEvento;
    Parameters.parambyname('dsEvento').Value := Copy(dsEvento,1,50);
    Parameters.parambyname('dsLancamento').Value := Copy(dsLancamento,1,12);
    Parameters.parambyname('dsDocumento').Value  := Copy(dsDocumento,1,12);
    Parameters.parambyname('vlValor').Value      := vlValor;
    Parameters.parambyname('cdUsuario').Value    := cdUsuario;
    Parameters.parambyname('cdOpcao').Value      := cdOpcao;
    ExecSql;
  end;
end;

procedure TFrmPrincipalPreVenda.CadastrodeEscola1Click(Sender: TObject);
begin
  FrmCadEscola := TFrmCadEscola.Create(Application);
  CadastrodeEscola1.enabled := false;
  FrmCadEscola.Show;
end;

procedure TFrmPrincipalPreVenda.CadastrodeSrie1Click(Sender: TObject);
begin
  FrmCadSerieEscola := TFrmCadSerieEscola.Create(Application);
  CadastrodeSrie1.enabled := false;
  FrmCadSerieEscola.Show;
end;

procedure TFrmPrincipalPreVenda.CadastrodeLista1Click(Sender: TObject);
begin
//  Application.CreateForm(TFrmCadLista,FrmCadLista);
//  FrmCadLista.FormStyle := fsStayOnTop;
  if trim(copy_campo(CbxCliente.Text,'|',2)) = '' then begin
    Application.MessageBox('Selecione um cliente antes de abrir o cadastro de lista!','Atenção',mb_ok + MB_ICONWARNING + MB_APPLMODAL);
    CbxCliente.SetFocus;
    exit;
  end;
  FrmCadLista := TFrmCadLista.Create(Application);
  CadastrodeLista1.enabled := false;
  FrmCadLista.Vform :='C';
  FrmCadLista.Show;
end;

procedure TFrmPrincipalPreVenda.ConsultarListas1Click(Sender: TObject);
begin
  FrmCadLista := TFrmCadLista.Create(Application);
  FrmCadLista.Show;
end;

procedure TFrmPrincipalPreVenda.ConsultarporCdigoAdicional1Click(
  Sender: TObject);
begin
  RadioGroup1.ItemIndex := 6;
end;

procedure TFrmPrincipalPreVenda.SgDadosDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  //if not (gdSelected in state) then
  //begin

    if (ARow <> 0) and (SgDados.Cells[2,ARow] <> '') and (SgDados.Cells[8,ARow] <> '') then
    begin
     //   if (SgDados.Cells[0,SgDados.Row]<>'')and(vEstqNegativo <> 'S') and (qtdInsuficienteParaPrevend(StrToInt(SgDados.Cells[0,SgDados.Row]), strToFloatDef(SgDados.Cells[2,SgDados.Row],0)) > 0) then BEGIN
          if ArraylinhasDestacadas[ARow] then begin
            SgDados.Canvas.brush.Color := clYellow;
            SgDados.Canvas.Font.Color := clBlack;
            SgDados.Canvas.FillRect(rect);
            SgDados.canvas.TextOut(Rect.Left,Rect.Top,SgDados.Cells[ACol,ARow]);
          end
          else begin
            SgDados.Canvas.brush.Color := clWhite;
            SgDados.Canvas.Font.Color := clBlack;
            SgDados.Canvas.FillRect(rect);
            SgDados.canvas.TextOut(Rect.Left,Rect.Top,SgDados.Cells[ACol,ARow]);
          end;
     //   END;


      //comentei para não pintar mais de vermelho quando o estoque estiver menor q a quantidade lançada
 {     if (StrToFloat(SgDados.Cells[2,ARow]) > StrToFloat(SgDados.Cells[8,ARow])) then
      begin
          SgDados.Canvas.Font.Color := clRed;
          DrawText(SgDados.Canvas.Handle,PAnsichar(SgDados.Cells[ACol,ARow]), - 1, Rect, DT_VCENTER or DT_LEFT or DT_SINGLELINE);
      end
      else
      if (StrToFloat(SgDados.Cells[2,ARow]) > StrToFloat(SgDados.Cells[8,ARow])) then
      begin
          SgDados.Canvas.Font.Color := clBlack;
          DrawText(SgDados.Canvas.Handle,PAnsichar(SgDados.Cells[ACol,ARow]), - 1, Rect, DT_VCENTER or DT_LEFT or DT_SINGLELINE);
      end;
    }
    end;
    
  //end;
end;

procedure TFrmPrincipalPreVenda.SalvarPreVenda(prevenda: TPrevenda);
var
  msg : string;
  sucesso : Boolean;
begin
  With ADOQrySalvar do begin
    try
      Try
        DModulo.Conexao.BeginTrans;
        sucesso := False;
        if RgOpcoes.ItemIndex = 1 then begin // Se for alteração de um orçamento
          if TNEGPrevenda.isSimplesRemessa(prevenda.numeroPrevenda) then
            prevenda.simplesRemessa := 1
          else
            prevenda.simplesRemessa := 0;
          TNEGPrevenda.excluirPrevenda(prevenda.numeroPrevenda);
        end;
        if not liberaDigitacaoLancamento then
          if (RgOpcoes.ItemIndex = 0)
            or (RgOpcoes.ItemIndex = 2)
                or ((RgOpcoes.ItemIndex = 3)and((UpperCase( vEmpresa ) = 'AMBIENTAR')or(UpperCase( vEmpresa ) = 'PBFARMA')))
                      or (RgOpcoes.ItemIndex = 4) then begin // Se for salvar um orçamento
            UltimoLancamentoBloqueandoTabela;
            Sql.Text := 'Update Sequencial Set nrPedidos = nrPedidos + 1 Where cdCodigo = 1 ';
            ExecSql;
          end;
        if ((UPPERCASE(vEmpresa) = 'COPYART') and (possuiLivro = true)) then begin
          nrOrcamentoDia := TNEGLoja.getMaxSequencialLivros;
          possuiLivro := false;
          prevenda.turno := turno;
          prevenda.tipoForracao := tipoForro;
          prevenda.nrOrcamentoDia := nrOrcamentoDia;
        end;
//        if prevenda <> nil then begin
//          prevenda.Destroy;
//          prevenda:= nil;
//        end;
//        prevenda:= TPrevenda.Create();
        if vOrcamento = 'O' then
          prevenda.isOrcamento := True
        else
          prevenda.isOrcamento := False;
        prevenda.conferida := false;
        prevenda.numeroPrevenda:= StrtoInt(EdtLancto.Text);
        prevenda.dataEmissao:= DtLancto.Date;
        prevenda.vendedor := TNEGFuncionario.getFuncionario(StrtoInt(EdtCdNome.Text));
        if vcdAutorizador > 0 then
          prevenda.Autorizador := TNEGFuncionario.getFuncionario(vcdAutorizador)
        else
          prevenda.Autorizador := TNEGFuncionario.getFuncionario(StrtoInt(EdtCdNome.Text));
        prevenda.Cliente  := TNEGCliente.getCliente(StrToInt(Copy_Campo(CbxCliente.Text,'|',2)));
        TNEGPrevenda.inserirPrevenda(prevenda);
        DModulo.Conexao.CommitTrans;
        sucesso := True;
      except
        on E: exception do begin
          Showmessage(E.message);
          sucesso := False;
          DModulo.Conexao.RollbackTrans;
        end;
      End;
    finally
      if sucesso then begin
        Application.OnMessage := FormPrincipal.NaoProcessaMsg;
        if (UPPERCASE(vEmpresa) = 'DELUC') then
          Application.messagebox(PWideChar('Prevenda: '+EdtLancto.Text + #13#10+'Valor: R$ '+EdtSubTotal.Text),'Atenção', MB_OK + MB_ICONWARNING + MB_APPLMODAL)
        else if (UPPERCASE(vEmpresa) = 'COPYART') then begin
          if nrOrcamentoDia > 0 then
            msg := 'Pré-Venda/Orçamento salvo com sucesso! ' + #13#10 + 'Nº ' +
                      FrmPrincipalPreVenda.EdtLancto.Text + #13#10 +#13#10 +
                         'Sequencial: '+ IntToStr(nrOrcamentoDia)
          else
            msg := 'Pré-Venda/Orçamento salvo com sucesso! ' + #13#10 + 'Nº ' +
                       FrmPrincipalPreVenda.EdtLancto.Text;
          if FrmPrincipalPreVenda.vPergunta_Apos_Comprovante = '1' then begin
            if (FrmPrincipalPreVenda.vImpressao_40 = 'S') then begin
              if MessageDlg('Deseja imprimir a Pré-Venda \ Orçamento de nº '+
                            FrmPrincipalPreVenda.EdtLancto.Text+'?',
                                       mtConfirmation,[mbYes, mbNo],0) = mrYes then
                FrmPrincipalPreVenda.ImprimeComprovante(StrToInt(prevenda.codigoFormaPagamento));
              MessageDlg(msg, mtInformation,[mbOk],0);
            end;
            if FrmPrincipalPreVenda.vImpressao_80 = 'S' then begin
              if nrOrcamentoDia > 0 then begin
                if MessageDlg('Deseja imprimir a Pré-Venda \ Orçamento de nº '+
                            FrmPrincipalPreVenda.EdtLancto.Text+'?' + #13#10 +#13#10 +
                             'Sequencial: '+ IntToStr(nrOrcamentoDia),
                                       mtConfirmation,[mbYes, mbNo],0) = mrYes then
                  FrmPrincipalPreVenda.ImprimeOrcamento(StrToInt(prevenda.codigoFormaPagamento));
              end else begin
                if MessageDlg('Deseja imprimir a Pré-Venda \ Orçamento de nº '+ FrmPrincipalPreVenda.EdtLancto.Text + '?',
                    mtConfirmation,[mbYes, mbNo],0) = mrYes then
                  FrmPrincipalPreVenda.ImprimeOrcamento(StrToInt(prevenda.codigoFormaPagamento));
              end;
            end;
          end
          else begin
            if (FrmPrincipalPreVenda.vImpressao_40 = 'S') then
              FrmPrincipalPreVenda.ImprimeComprovante(StrToInt(prevenda.codigoFormaPagamento));
            if FrmPrincipalPreVenda.vImpressao_80 = 'S' then
              FrmPrincipalPreVenda.ImprimeOrcamento(StrToInt(prevenda.codigoFormaPagamento));
          end;
        end
        else begin
          if FrmPrincipalPreVenda.vPergunta_Apos_Comprovante = '1' then begin
            if (FrmPrincipalPreVenda.vImpressao_40 = 'S') or (UPPERCASE(vEmpresa) = 'PROAUTO') then begin
              if MessageDlg('Deseja imprimir a Pré-Venda \ Orçamento de nº '+ FrmPrincipalPreVenda.EdtLancto.Text + ' em 40 colunas ?',
                 mtConfirmation,[mbYes, mbNo],0) = mrYes then
                FrmPrincipalPreVenda.ImprimeComprovante(StrToInt(prevenda.codigoFormaPagamento));
            end;
            if FrmPrincipalPreVenda.vImpressao_80 = 'S' then begin
              if MessageDlg('Deseja imprimir a Pré-Venda \ Orçamento de nº '+ FrmPrincipalPreVenda.EdtLancto.Text + ' em 80 colunas ?',
                 mtConfirmation,[mbYes, mbNo],0) = mrYes then
                FrmPrincipalPreVenda.ImprimeOrcamento(StrToInt(prevenda.codigoFormaPagamento));
            end;
          end
          else begin
            if (FrmPrincipalPreVenda.vImpressao_40 = 'S') or (UPPERCASE(vEmpresa) = 'PROAUTO') then
              FrmPrincipalPreVenda.ImprimeComprovante(StrToInt(prevenda.codigoFormaPagamento));
            if FrmPrincipalPreVenda.vImpressao_80 = 'S' then
              FrmPrincipalPreVenda.ImprimeOrcamento(StrToInt(prevenda.codigoFormaPagamento));
          end;
          MessageDlg('Pré-Venda/Orçamento salvo com sucesso! ' + #13#10 + 'Nº ' + FrmPrincipalPreVenda.EdtLancto.Text, mtInformation,[mbOk],0);
        end;
        Application.OnMessage := FormPrincipal.ProcessaMsg;
        Limpar_Tela;
        //RgOpcoes.ItemIndex := 0;
        vlTotalAnterior := 0;
        liberouVenda := false;
        if vAutoLogoff then
          FrmPrincipalPreVenda.Solicitar_Login;
      end;
      EdtDesconto.ReadOnly := True;
      EdtSubTotal.ReadOnly := True;
      BtnAprazo.Enabled    := True;
      BtnConfirmar.Enabled := True;
      Alteraquantidade1.Enabled := true;
      ListBox1.Clear;
      ListBox1.Visible:=false;
    end;
  end;
end;

procedure TFrmPrincipalPreVenda.SalvaTransferencia;
var L,vTeste : Integer;
    vIdent : String;
begin
  vIdent := InputBox('Observação','Observação da transferencia', '');
  With ADOQrySalvar do begin
    Try
      DModulo.Conexao.BeginTrans;
      // tem q atualizar o sequencial da pré-venda senão n faz 2 transferencias de vez
      // verificar o por que nao esta pegando o UltimoLancamento ANDRE
      Sql.Text := 'Update Sequencial Set nrPedidos = nrPedidos + 1 Where cdCodigo = 1 ';
      ExecSql;
      Sql.Text := 'Insert Into Lancto (dsLancamento,cdPessoa,dsStatus,cdTipo,           '+
                  'dtEmissao,Dt_Efefiva_E_S,nrParcelas,vlValor,dsUf,                    '+
                  'vlDesconto,vlAcrescimo,dsCFOP,nrBaseCalculoIcms,nrValorIcms,         '+
                  'nrBaseIcmsSub,nrIcmsSub,nrAliquotaIcms,vlFrete,nrFrete,vlvalorProd,  '+
                  'CFOP_Estendido,AIDF,dsSerie,vlIpi_Nota,vlDesPAcessorias,dsEmitente,  '+
                  'cdComissao,vlComissao,dsObs,dsFlag)                                  '+
                  'Values (:dsLancamento,:cdPessoa,''L'',11,:DT1,:DT2,                  '+
                  '1,:TOTAL,:DSUF,0,0,:CFOP,:CALCULO,:VALOR,:BASE,:SUB,:VL,:FRETE,      '+
                  '''1'',:PROD,:FOP,:VAL,:SERIE,:IPI,:DESP,''P'',:NOME,:COMISSAO,:OBS,1)';
      Parameters.ParamByName('dsLancamento').Value := EdtLancto.Text;
      Parameters.ParamByName('cdPessoa').Value     := EdtCdCliente.Text;
      Parameters.ParamByName('DT1').Value     := DateToStr(dtLancto.Date);
      Parameters.ParamByName('DT2').Value     := DateToStr(dtLancto.Date);
      Parameters.ParamByName('TOTAL').Value   := StrToFloat(EdtTotal.Text);
      Parameters.ParamByName('DSUF').Value    := 'SE';
      Parameters.ParamByName('CFOP').Value    := NULL;
      Parameters.ParamByName('CALCULO').Value := 0; // EdtBaseCalculoIcms.Text;
      Parameters.ParamByName('VALOR').Value   := 0; // EdtValorIcms.Text;
      Parameters.ParamByName('BASE').Value    := 0; // EdtBaseCalcIcmsSub.Text;
      Parameters.ParamByName('SUB').Value     := 0; // EdtIcmsSub.Text;
      Parameters.ParamByName('VL').Value      := 0; // SgDados.Cells[6,1];
      Parameters.ParamByName('FRETE').Value   := 0; // FrmEntradas.EdtVlFrete.Text;
      Parameters.ParamByName('PROD').Value    := EdtTotal.Text;
      Parameters.ParamByName('FOP').Value     := NULL;
      Parameters.ParamByName('VAL').Value     := '0.00';
      Parameters.ParamByName('SERIE').Value   := NULL;
      Parameters.ParamByName('IPI').Value     := '0.00';
      Parameters.ParamByName('DESP').Value    := '0.00';
      Parameters.ParamByName('NOME').Value     := EdtCdNome.Text;
      Parameters.ParamByName('COMISSAO').Value := '0.00';
      Parameters.ParamByName('OBS').Value      := vIdent;
      ExecSql;
      for L := 1 to SgDados.RowCount - 1 do begin
        if SgDados.Cells[0,L] = '' then Break;
        Sql.Text := 'Insert Into IteLcto (cdIteLcto,cdProduto,dsLancamento,cdPessoa,dsStatus,                  '+
                    'CFOP_Estendido,vlUnitario_Desc,vlUnitario,nrQtd,dsCfop,nrNumeroItem,nrValorDesconto,      '+
                    'nrBaseCalculoIcms,nrBaseIcmsSub,nrValorIpi,nrAliquotaIcms,nrAliquotaIpi,vlUnitario_Bruto) '+
                    'Values (:cdIteLcto,:cdProduto,:dsLancamento,:cdPessoa,                                    '+
                    '''L'',:FOPEX,:VAL1,:VAL2,:VAL3,:VAL4,:VAL5,:VAL6,:VAL7,:VAL8,:VAL9,:VAL10,:VAL11,:VAL12)  ';
        Parameters.ParamByName('FOPEX').Value := NULL;
        Parameters.ParamByName('cdIteLcto').Value    := IntToStr(L);
        Parameters.ParamByName('cdProduto').Value    := SgDados.Cells[0,L];
        Parameters.ParamByName('dsLancamento').Value := EdtLancto.Text;
        Parameters.ParamByName('cdPessoa').Value     := edtcdcliente.Text;
        Parameters.ParamByName('VAL1').Value  := FormatFloatQ(vCasasPreco,(StrToFloat(SgDados.Cells[3,L])));
        Parameters.ParamByName('VAL2').Value  := FormatFloatQ(vCasasPreco,(StrToFloat(SgDados.Cells[3,L])));
        Parameters.ParamByName('VAL3').Value  := SgDados.Cells[2,L];
        Parameters.ParamByName('VAL4').Value  := SgDados.Cells[15,L];
        Parameters.ParamByName('VAL5').Value  := IntToStr(L);
        Parameters.ParamByName('VAL6').Value  := '0.00';
        Parameters.ParamByName('VAL7').Value  := '0.00';
        Parameters.ParamByName('VAL8').Value  := '0.00';
        Parameters.ParamByName('VAL9').Value  := '0.00';
        Parameters.ParamByName('VAL10').Value := '0.00';
        Parameters.ParamByName('VAL11').Value := '0.00';
        Parameters.ParamByName('VAL12').Value := FormatFloat('0.00',(StrToFloat(SgDados.Cells[3,L])));
        ExecSql;
        Sql.Text := 'Update Produto Set dsAtivo = ''S'', '+
                    'nrQtdreal = nrQtdreal - :nrQtdreal  '+ // quantidade
                    'Where cdProduto = :cdProduto        ';
        Parameters.ParamByName('nrQtdreal').Value := SgDados.Cells[2,L];
        Parameters.ParamByName('cdProduto').Value := SgDados.Cells[0,L];
        ExecSql;
      end; // for StringGrid
      DModulo.Conexao.CommitTrans;
      MessageDlg('Lançamento confirmado com sucesso!',mtInformation,[mbOk],0);
      Application.OnMessage := FormPrincipal.ProcessaMsg;
    Except
      on E: Exception do begin
        DModulo.Conexao.RollbackTrans;
        Salvar_erro(vData_Banco + ' | ' + pegaHoraBanco, 'PREVENDA', 'TFrmPrincipalPreVenda.SalvaTransferencia', e.Message,EdtLancto.Text);
        Messagedlg('Não foi possivel salvar os dados. Já existe uma transferencia com o mesmo número de lançamento!', mterror, [mbOk], 0);
      end;
    end; // except
  end;
  //ImprimeTransferencia;
  ImprimeComprovanteTransferencia;
  Application.OnMessage := FormPrincipal.ProcessaMsg;
  Limpar_Tela;
  //RgOpcoes.ItemIndex := 0;
end;

procedure TFrmPrincipalPreVenda.ImprimeComprovanteTransferencia;
var Arq : TextFile;
    vcampo_1,vcampo_2,vcampo_3,vcampo_4,vcampo_5,
    vtitulo,vformapag,vvencimento : String;
    vTotal : real;
    i,j : integer;
    Year, Month, Day : Word;
    dtVenc     : TDateTime;
    data,vtime       : String[10];
begin
  if FileExists('Texto.txt') then
  begin // Caso não encontre o arquivo.
    vQtdPrint := '1';
    for J := 1 to StrToInt(vQtdPrint) do
    begin
      vformapag := '';
      vvencimento := '';
      vTime := timetoStr(time);
      With ADOQryLocaliza do
      begin
        Sql.Text := 'Select P.nmProduto,P.dsUnidade,P.cdFabricante,P.dsReferencia,I.cdProduto,I.cdIteLcto,L.cdPessoa,'+
                    'I.nrQtd,I.vlUnitario,L.vlValor,L.vlDesconto,L.vlAcrescimo,L.dtEmissao,l.dsObs,I.nrAliquotaIpi,  '+
                    'L.dsStatus From Produto P WITH (NOLOCK),IteLcto I WITH (NOLOCK),Lancto L WITH (NOLOCK)          '+
                    'Where L.dsStatus in (''L'') and L.dsLancamento = I.dsLancamento and I.cdProduto = P.cdProduto   '+
                    'and L.dsStatus = I.dsStatus and I.dsLancamento = :dsLancamento and I.cdPessoa = :cdPessoa       ';
        Parameters.ParamByName('dsLancamento').Value := EdtLancto.Text;
        Parameters.ParamByName('cdPessoa').Value     := edtcdcliente.Text;
        Open;
      end;
      Editor.Clear;
      Editor.Lines.Add(' ');
      Editor.Lines.Add('       **S E M  V A L O R  F I S C A L**');
      Editor.Lines.Add(' ');
      Editor.Lines.Add(' ============================================');
      Editor.Lines.Add('                 TRANSFERENCIA');
      if UpperCase( vMatrizFilial ) = 'MATRIZ' THEN
        Editor.Lines.Add('   P R O A U T O    A U T O   P E C A S  (M)')
      else
        Editor.Lines.Add('   P R O A U T O    A U T O   P E C A S  (F)');
      Editor.Lines.Add(' ============================================');
      Editor.Lines.Add(' Filial:  '+ EdtcdCliente.Text + '-' +copy_campo(CbxCliente.Text,'|',1));
      Editor.Lines.Add(' '+ edtendereco.text);
      Editor.Lines.Add(' ============================================');
      Editor.Lines.Add(' Orcamento N. '+ EdtLancto.Text + ' Data: '+ DatetoStr(Date) + ' ' +vTime );
      Editor.Lines.Add(' Vendedor:    '+ CbxNome.Text);
      Editor.Lines.Add(' ============================================');
      Editor.Lines.Add(' Cod    Descricao              Qtd    V.Total');
      for i := 1 to ADOQryLocaliza.RecordCount do begin
        vcampo_1 := ADOQryLocaliza.FieldByname('cdProduto').AsString;
        while Length(vcampo_1) < 5 do vcampo_1 := vcampo_1 + ' ';
        vcampo_2 := ADOQryLocaliza.FieldByname('nmproduto').AsString;
        while Length(vcampo_2) < 38 do vcampo_2 := vcampo_2 + ' ';
        vcampo_3 := FormatFloat('000',ADOQryLocaliza.FieldByname('nrqtd').AsFloat);
        while Length(vcampo_3) < 4 do vcampo_3 := vcampo_3 + ' ';
        vcampo_4 := FormatFloat('0.00',ADOQryLocaliza.FieldByname('nrqtd').AsFloat
                                      * ADOQryLocaliza.FieldByname('vlUnitario').AsFloat);
        vTotal := vTotal + (ADOQryLocaliza.FieldByname('nrqtd').AsFloat *
                             ADOQryLocaliza.FieldByname('vlUnitario').AsFloat);
        while Length(vcampo_4) < 6 do vcampo_4 := vcampo_4 + ' ';
        vcampo_5 := ADOQryLocaliza.FieldByname('dsReferencia').AsString;
        while Length(vcampo_5) < 15 do vcampo_5 := vcampo_5 + ' ';
        Editor.Lines.Add(' '+vcampo_1 +'  '+ vcampo_2  );
        Editor.Lines.Add('        Ref.:'+vcampo_5 +'   '+ vcampo_3 +'   '+ vcampo_4);
        ADOQryLocaliza.next;
      end;
      Editor.Lines.Add(' ');
      Editor.Lines.Add(' Qtd itens: '+IntToStr(ADOQryLocaliza.RecordCount)+ '               Total:  '+ FormatFloat('0.00',vTotal)+'');
      Editor.Lines.Add(' ===========================================');
      Editor.Lines.Add(' ');
      Editor.Lines.Add(' ');
      Editor.Lines.Add('  _______________________________________');
      Editor.Lines.Add('                    Visto');
      Editor.Lines.Add(' ');
      Editor.Lines.Add(' ');
      Editor.Lines.Add('** E X I J A  S E U  C U P O M  F I S C A L **');
      Editor.Lines.Add(' ');
      Editor.Lines.Add(' ');
      Editor.Lines.Add(' ');
      Editor.Lines.Add(' ');
      Editor.Lines.Add(' ');
      Editor.Lines.Add(' ');
      Editor.Lines.Add(' ');
      Editor.Lines.Add(' ');
      try
        AssignFile(Arq,'Texto.txt');
        Erase(Arq);
        Rewrite(Arq);
        Writeln(Arq,Editor.Text);
      Finally
       CloseFile(Arq);
      end; // try
     if vPAFECF = False then
        WinExec('c:\Arquiv~1\Saef\bin\print.bat',sw_ShowNormal);
    end;
  end; // for
end;

procedure TFrmPrincipalPreVenda.ransferncia1Click(Sender: TObject);
begin
  if UPPERCASE(vEmpresa) = 'PROAUTO' then
    RgOpcoes.ItemIndex := 3;
end;

procedure TFrmPrincipalPreVenda.Consulta_Deposito;
begin
  if (UpperCase(vEmpresa) <> 'PBFARMA') and (UpperCase(vEmpresa) <> 'PTINTAS') then
    Label11.Text := '0,00'
  else
    LblReserva.Text := '0,00';
  if ADOSPConsulta.RecordCount > 0 then
  begin
    With ADOQryUltimoCodigo do
    begin   // Pega da conexão depósito
      Sql.Text := 'Select nrqtdReal From Produto WITH (NOLOCK) ';
      if (UpperCase(vEmpresa) = 'PROAUTO') then
      begin
        SQL.Add('Where dsReferencia = :REFERENCIA ');
        Parameters.ParamByName('REFERENCIA').Value := ADOSPConsulta.FieldByName('REFERÊNCIA').AsString;
      end
      else
      begin
        SQL.Add('Where cdProduto = :CDPRODUTO ');
        Parameters.ParamByName('CDPRODUTO').Value := ADOSPConsulta.FieldByName('Código').AsString;
      end;
      Open;
    end;
//    if (UpperCase(vEmpresa) = 'PTINTAS') then
//      Label15.Text := FormatFloat('0.00',ADOQryUltimoCodigo.FieldByName('nrqtdreal').AsFloat)
    if (UpperCase(vEmpresa) <> 'PBFARMA') and (UpperCase(vEmpresa) <> 'PTINTAS') then
        Label11.Text := FormatFloat('0.00',ADOQryUltimoCodigo.FieldByName('nrqtdreal').AsFloat)
    else
        LblReserva.Text := FormatFloat('0.00',ADOQryUltimoCodigo.FieldByName('nrqtdreal').AsFloat); // PBFARMA
  end
  else
    Label11.Text := '0';
  if (UpperCase(vEmpresa) = 'NACIONAL') then begin
    Label15.Text := FormatFloat('0.00',ADOSPConsultaEstoque.AsFloat - StrToFloat(LblReserva.Text) - StrToFloat(Label11.Text));
  end;
  Label11.Refresh;
  Label15.Refresh;
end;

procedure TFrmPrincipalPreVenda.CriarIniSQLDeposito;
var
  Arquivo  : TIniFile;
  Path     : String;
  ConstBd  : String;
begin
  {Procedimento para criar ou carregar configurações do BD}
  try {try finnaly}
    try
      Path    := ExtractFilePath(Application.ExeName);
      ConstBd := '';
      if not FileExists(Path + 'ConfSQLDep.ini') then begin
          ShowMessage('Configure a Conexão com o Banco SQL Server para o Depósito');
          Arquivo := TIniFile.Create(Path + 'ConfSQLDep.ini');
          DModulo.ADODeposito.ConnectionString := PromptDataSource(self.handle,
                                             'Provider=SQLOLEDB.1;Password=;' +
                                             'Persist Security Info=True;'    +
                                             'User ID=;Initial Catalog=;Data Source=');
          ConstBd := Cryptografia('C',DModulo.ADODeposito.ConnectionString);
          Arquivo.WriteString('BD','Path',ConstBd);
      end else begin
         Arquivo := TIniFile.Create(Path + 'ConfSQLDep.ini');
           ConstBd := Arquivo.ReadString('BD','Path','');
      end;
    except
      Showmessage('Erro ao carregar o arquivo de Inicialização. '+#13+
                  'Entre em contato com o Suporte do Sistema!');
    end;
  finally
    if Arquivo <> nil then
      Arquivo.Free;
  end;
  try
    with DModulo.ADODeposito do begin
      Connected        := False;
      ConnectionString := Cryptografia('D',ConstBd);
      Connected        := True;
    end;
  except
    Showmessage('Não foi possível conectar com o banco de dados.'+#13+
                '   Entre em contato com o suporte do sistema');
    Application.Terminate;  //TESTE
    FrmPrincipalPreVenda.Close;
    FrmPrincipalPreVenda := nil;
    FrmPrincipalPreVenda.Free;
    Exit;
  end;
end;

procedure TFrmPrincipalPreVenda.ConsultarCrdito1Click(Sender: TObject);
begin
  if UPPERCASE(vEmpresa) = 'PROAUTO' then
  begin
    vFlag:= '8';
    LiberaVanda;
  end;
end;

procedure TFrmPrincipalPreVenda.Especificao1Click(Sender: TObject);
begin
  RadioGroup1.ItemIndex := 5;
end;

procedure TFrmPrincipalPreVenda.Relatriodecontagem1Click(Sender: TObject);
begin
  if (UpperCase(vEmpresa) = 'NACIONAL') then begin
    FrmContagem:= TFrmContagem.Create(Application);
    FrmContagem.ShowModal;
  end else
    ShowMessage('Disponível somete para o cliente Eletrônica Nacional!');
end;

procedure TFrmPrincipalPreVenda.ImprimeEtiquetasTemdeTudoSempre;
var L : integer;
    Arq : TextFile;
    vQtd : real;
begin
  //if not CamposObrigatoriosPreenchidos(FrmPrincipalPreVenda) then exit;
  if SgDados.Cells[0,1] = '' then begin
    Messagedlg('Não foi lançado nenhum item para impressão das etiquetas!', mtWarning, [mbOk], 0);
    EdtConsulta.Setfocus;
    exit;
  end;
//  if (Trim(EdtCdCliente.Text)<> '') and (Trim(EdtCdNome.Text) <> '') then
//    SalvaEtiquetas;
  Editor.Lines.Clear;
  for L := 1 to SgDados.RowCount - 1 do begin // Salvando os itens da pré-venda.
    if SgDados.Cells[0,L] = '' then Break;
    Editor.Lines.Add('');
    Editor.Lines.Add('');
    Editor.Lines.Add('c0000');
    Editor.Lines.Add('KI503');
    Editor.Lines.Add('O0220');
    Editor.Lines.Add('f220');
    Editor.Lines.Add('KW0475');
    Editor.Lines.Add('KI7');
    Editor.Lines.Add('V0');
    Editor.Lines.Add('L');
    Editor.Lines.Add('H09');
    Editor.Lines.Add('PC');
    Editor.Lines.Add('A2');
    Editor.Lines.Add('D11');
    Editor.Lines.Add('1E1101500010010A'+SgDados.Cells[6,L]+'');     //barra
    Editor.Lines.Add('121100000570006'+Trim(Copy(SgDados.Cells[1,L],1,19))+'');     //descricao
    Editor.Lines.Add('121100000320007'+'R$'+SgDados.Cells[3,L]+'');   //valor
    Editor.Lines.Add('1E1101500010159A'+SgDados.Cells[6,L]+''); //barra
    Editor.Lines.Add('121100000580153'+Trim(Copy(SgDados.Cells[1,L],1,19))+'');   //descricao
    Editor.Lines.Add('121100000330154'+'R$'+SgDados.Cells[3,L]+'');    //valor
    Editor.Lines.Add('1E1101500010295A'+SgDados.Cells[6,L]+''); //barra
    Editor.Lines.Add('121100000570289'+Trim(Copy(SgDados.Cells[1,L],1,19))+'');   //descricao
    Editor.Lines.Add('121100000320292'+'R$'+SgDados.Cells[3,L]+'');        //preco
    Editor.Lines.Add('121100000450006'+Trim(Copy(SgDados.Cells[1,L],20,40))+'');    //descricao 2
    Editor.Lines.Add('121100000460153'+Trim(Copy(SgDados.Cells[1,L],20,40))+'');     //descricao 2
    Editor.Lines.Add('121100000450289'+Trim(Copy(SgDados.Cells[1,L],20,40))+'');   //descricao 2
    Editor.Lines.Add('121100000690006'+'Cod.'+SgDados.Cells[0,L]+''); //codigo
    Editor.Lines.Add('121100000680153'+'Cod.'+SgDados.Cells[0,L]+''); //codigo
    Editor.Lines.Add('121100000680289'+'Cod.'+SgDados.Cells[0,L]+'');        //codigo
    // Cálculo para imprimir a qtd de etiquetas certo
    if Frac(StrToFloat(SgDados.Cells[2,L])/3) = 0.00 then
      vQtd := StrToFloat(SgDados.Cells[2,L])/3
    else vQtd := (StrToint(FormatFloat('0000',StrToFloat(SgDados.Cells[2,L]))) div 3) + 1;
    Editor.Lines.Add('^'+FormatFloat('00',vQtd));
    Editor.Lines.Add('Q'+FormatFloat('0000',vQtd));
    Editor.Lines.Add('E');
  end;
  Editor.Lines.SaveToFile(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'etiqueta.txt')));
  WinExec(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'print2.bat')),sw_ShowNormal);
  if not FileExists('Print2.bat') then
    ShowMessage('Não foi encontrado o arquivo Print2.bat');
  Application.OnMessage := FormPrincipal.ProcessaMsg;
  Limpar_Tela;
  RgOpcoes.ItemIndex := 0;
  Messagedlg('Impressão ok!', mtInformation, [mbOk], 0);
end;

procedure TFrmPrincipalPreVenda.ImprimeEtiquetasVarejao;
var L : integer;
    Arq : TextFile;
    vQtd : real;
begin
  //if not CamposObrigatoriosPreenchidos(FrmPrincipalPreVenda) then exit;
  if SgDados.Cells[0,1] = '' then begin
    Messagedlg('Não foi lançado nenhum item para impressão das etiquetas!', mtWarning, [mbOk], 0);
    EdtConsulta.Setfocus;
    exit;
  end;
  //if (Trim(EdtCdCliente.Text)<> '') and (Trim(EdtCdNome.Text) <> '') then
    //SalvaEtiquetas;
  Editor.Lines.Clear;
  for L := 1 to SgDados.RowCount - 1 do begin // Salvando os itens da pré-venda.
    if SgDados.Cells[0,L] = '' then Break;
    Editor.Lines.Add('');
    Editor.Lines.Add('');
    Editor.Lines.Add('Q240,019');
    Editor.Lines.Add('q831');
    Editor.Lines.Add('rN');
    Editor.Lines.Add('S1');
    Editor.Lines.Add('D7');
    Editor.Lines.Add('ZT');
    Editor.Lines.Add('JB');
    Editor.Lines.Add('OD');
    Editor.Lines.Add('R56,0');
    Editor.Lines.Add('N');
    Editor.Lines.Add('B665,160,2,E30,3,6,116,B,"'+SgDados.Cells[6,L]+'"');       //barra
    Editor.Lines.Add('A271,88,2,2,1,1,N,"'+SgDados.Cells[0,L]+'"'); //codigo
    Editor.Lines.Add('A343,88,2,2,1,1,N,"Cod.:"');
    Editor.Lines.Add('A343,160,2,4,2,2,N,"R$ '+SgDados.Cells[3,L]+'"');
    Editor.Lines.Add('A679,208,2,4,1,1,N,"'+SgDados.Cells[1,L]+'"');
    // Cálculo para imprimir a qtd de etiquetas certo
    vQtd := StrToFloat(SgDados.Cells[2,L]);
    Editor.Lines.Add('P'+ IntToStr(Trunc(vQtd)));
  end;
  Editor.Lines.SaveToFile(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'etiqueta.txt')));
  WinExec(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'print2.bat')),sw_ShowNormal);
  if not FileExists('Print2.bat') then
    ShowMessage('Não foi encontrado o arquivo Print2.bat');
  Application.OnMessage := FormPrincipal.ProcessaMsg;
  Limpar_Tela;
  RgOpcoes.ItemIndex := 0;
  Messagedlg('Impressão ok!', mtInformation, [mbOk], 0);
end;

procedure TFrmPrincipalPreVenda.ImprimeEtiquetasGentePequena;
var L : integer;
    Arq : TextFile;
    vQtd : real;
begin
  //if not CamposObrigatoriosPreenchidos(FrmPrincipalPreVenda) then exit;
  if SgDados.Cells[0,1] = '' then begin
    Messagedlg('Não foi lançado nenhum item para impressão das etiquetas!', mtWarning, [mbOk], 0);
    EdtConsulta.Setfocus;
    exit;
  end;
  if (Trim(EdtCdCliente.Text)<> '') and (Trim(EdtCdNome.Text) <> '') then
    SalvaEtiquetas;
  Editor.Lines.Clear;
  for L := 1 to SgDados.RowCount - 1 do begin // Salvando os itens da pré-venda.
    if SgDados.Cells[0,L] = '' then Break;
    Editor.Lines.Add('I8,A,001');
    Editor.Lines.Add('');
    Editor.Lines.Add('');
    Editor.Lines.Add('Q160,024');
    Editor.Lines.Add('q831');
    Editor.Lines.Add('rN');
    Editor.Lines.Add('S4');
    Editor.Lines.Add('D7');
    Editor.Lines.Add('ZT');
    Editor.Lines.Add('JF');
    Editor.Lines.Add('OD');
    Editor.Lines.Add('R0,0');
    Editor.Lines.Add('f100');
    Editor.Lines.Add('N');
    Editor.Lines.Add('A244,91,2,4,1,1,N,"'+'R$'+SgDados.Cells[3,L]+'"');
    Editor.Lines.Add('A528,91,2,4,1,1,N,"'+'R$'+SgDados.Cells[3,L]+'"');
    Editor.Lines.Add('A823,91,2,4,1,1,N,"'+'R$'+SgDados.Cells[3,L]+'"');
    Editor.Lines.Add('B246,66,2,1,2,6,46,B,"'+(SgDados.Cells[6,L])+'"');
    Editor.Lines.Add('B530,66,2,1,2,6,46,B,"'+(SgDados.Cells[6,L])+'"');
    Editor.Lines.Add('B825,67,2,1,2,6,46,B,"'+(SgDados.Cells[6,L])+'"');
    Editor.Lines.Add('A244,126,2,1,1,2,N,"'+Trim(Copy(SgDados.Cells[1,L],20,40))+'"');
    Editor.Lines.Add('A526,126,2,1,1,2,N,"'+Trim(Copy(SgDados.Cells[1,L],20,40))+'"');
    Editor.Lines.Add('A244,153,2,1,1,2,N,"'+Trim(Copy(SgDados.Cells[1,L],1,19))+'"');
    Editor.Lines.Add('A820,127,2,1,1,2,N,"'+Trim(Copy(SgDados.Cells[1,L],20,40))+'"');
    Editor.Lines.Add('A526,153,2,1,1,2,N,"'+Trim(Copy(SgDados.Cells[1,L],1,19))+'"');
    Editor.Lines.Add('A821,154,2,1,1,2,N,"'+Trim(Copy(SgDados.Cells[1,L],1,19))+'"');
    Editor.Lines.Add('A245,18,2,2,1,1,N,"'+(SgDados.Cells[6,L])+'"');
    Editor.Lines.Add('A528,18,2,2,1,1,N,"'+(SgDados.Cells[6,L])+'"');
    Editor.Lines.Add('A822,18,2,2,1,1,N,"'+(SgDados.Cells[6,L])+'"');
    // Cálculo para imprimir a qtd de etiquetas certo
    if Frac(StrToFloat(SgDados.Cells[2,L])/3) = 0.00 then
      vQtd := StrToFloat(SgDados.Cells[2,L])/3
    else vQtd := (StrToint(FormatFloat('0',StrToFloat(SgDados.Cells[2,L]))) div 3) + 1;
    Editor.Lines.Add('P'+FloatToStr(vQtd));
  end;
  Editor.Lines.SaveToFile(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'etiqueta.txt')));
  WinExec(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'print2.bat')),sw_ShowNormal);
  if not FileExists('Print2.bat') then
    ShowMessage('Não foi encontrado o arquivo Print2.bat');
  Application.OnMessage := FormPrincipal.ProcessaMsg;
  Limpar_Tela;
  RgOpcoes.ItemIndex := 0;
  Messagedlg('Impressão ok!', mtInformation, [mbOk], 0);
end;

procedure TFrmPrincipalPreVenda.ImprimeEtiquetasGoncalves;
var L : integer;
    Arq : TextFile;
    vQtd : real;
begin
  //if not CamposObrigatoriosPreenchidos(FrmPrincipalPreVenda) then exit;
  if SgDados.Cells[0,1] = '' then begin
    Messagedlg('Não foi lançado nenhum item para impressão das etiquetas!', mtWarning, [mbOk], 0);
    EdtConsulta.Setfocus;
    exit;
  end;
  if (Trim(EdtCdCliente.Text)<> '') and (Trim(EdtCdNome.Text) <> '') then
    SalvaEtiquetas;
  Editor.Lines.Clear;
  for L := 1 to SgDados.RowCount - 1 do begin // Salvando os itens da pré-venda.
    if SgDados.Cells[0,L] = '' then Break;
    Editor.Lines.Add('I8,A,001');
    Editor.Lines.Add('');
    Editor.Lines.Add('');
    Editor.Lines.Add('Q240,024');
    Editor.Lines.Add('q863');
    Editor.Lines.Add('rN');
    Editor.Lines.Add('S3');
    Editor.Lines.Add('D7');
    Editor.Lines.Add('ZT');
    Editor.Lines.Add('JF');
    Editor.Lines.Add('O');
    Editor.Lines.Add('R32,0');
    Editor.Lines.Add('f100');
    Editor.Lines.Add('N');
    Editor.Lines.Add('A441,11,0,4,1,1,N,"Auto Peça Gonçales"');
    Editor.Lines.Add('A441,11,0,4,1,1,N,"Auto Peça Gonçales"');
    Editor.Lines.Add('A420,189,0,2,1,1,N,"Data: 14/12/2012"');
    Editor.Lines.Add('A1,189,0,2,1,1,N,"Data: 14/12/2012"');
    Editor.Lines.Add('A420,131,0,2,1,1,N,"Cod: '+ SgDados.Cells[0,L] +' Fab: 1478963"');
    Editor.Lines.Add('A420,159,0,2,1,1,N,"Prateleira: '+ SgDados.Cells[5,L] +'"');
    Editor.Lines.Add('A419,84,0,3,1,1,N,"'+ Trim(Copy(SgDados.Cells[1,L],20,40)) +'"');
    Editor.Lines.Add('A1,159,0,2,1,1,N,"Prateleira: '+ SgDados.Cells[5,L] +'"');
    Editor.Lines.Add('A1,131,0,2,1,1,N,"Cod: '+ SgDados.Cells[0,L] +' Fab: 1478963"');
    Editor.Lines.Add('A0,83,0,3,1,1,N,"'+ Trim(Copy(SgDados.Cells[1,L],20,40)) +'"');
    Editor.Lines.Add('A419,56,0,3,1,1,N,"'+ Trim(Copy(SgDados.Cells[1,L],1,19)) +'"');
    Editor.Lines.Add('A0,54,0,3,1,1,N,"'+ Trim(Copy(SgDados.Cells[1,L],1,19)) +'"');
    // Cálculo para imprimir a qtd de etiquetas certo
    if Frac(StrToFloat(SgDados.Cells[2,L])/3) = 0.00 then
      vQtd := StrToFloat(SgDados.Cells[2,L])/3
    else vQtd := (StrToint(FormatFloat('0',StrToFloat(SgDados.Cells[2,L]))) div 3) + 1;
    Editor.Lines.Add('P'+FloatToStr(vQtd));
  end;
  Editor.Lines.SaveToFile(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'etiqueta.txt')));
  WinExec(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'print2.bat')),sw_ShowNormal);
  if not FileExists('Print2.bat') then
    ShowMessage('Não foi encontrado o arquivo Print2.bat');
  Application.OnMessage := FormPrincipal.ProcessaMsg;
  Limpar_Tela;
  RgOpcoes.ItemIndex := 0;
  Messagedlg('Impressão ok!', mtInformation, [mbOk], 0);
end;

procedure TFrmPrincipalPreVenda.ImprimeEtiquetasDeluc;
var L : integer;
    Arq : TextFile;
    vQtd : real;
begin
  //if not CamposObrigatoriosPreenchidos(FrmPrincipalPreVenda) then exit;
  if SgDados.Cells[0,1] = '' then begin
    Messagedlg('Não foi lançado nenhum item para impressão das etiquetas!', mtWarning, [mbOk], 0);
    EdtConsulta.Setfocus;
    exit;
  end;
  if (Trim(EdtCdCliente.Text)<> '') and (Trim(EdtCdNome.Text) <> '') then
    SalvaEtiquetas;
  Editor.Lines.Clear;
  for L := 1 to SgDados.RowCount - 1 do begin // Salvando os itens da pré-venda.
    if SgDados.Cells[0,L] = '' then Break;
    Editor.Lines.Add('CT~~CD,~CC^~CT~');
    Editor.Lines.Add('^XA~TA000~JSN^LT0^MNW^MTT^PON^PMN^LH0,0^JMA^PR5,5~SD15^JUS^LRN^CI0^XZ');
    Editor.Lines.Add('^XA');
    Editor.Lines.Add('^MMT');
    Editor.Lines.Add('^PW830');
    Editor.Lines.Add('^LL0160');
    Editor.Lines.Add('^LS0');
    Editor.Lines.Add('^FT582,36^ABN,11,7^FH\^FD'+Trim(Copy(SgDados.Cells[1,L],20,40))+'^FS');
    Editor.Lines.Add('^FT297,36^ABN,11,7^FH\^FD'+Trim(Copy(SgDados.Cells[1,L],20,40))+'^FS');
    Editor.Lines.Add('^FT582,20^ABN,11,7^FH\^FD'+Trim(Copy(SgDados.Cells[1,L],1,19))+'^FS');
    Editor.Lines.Add('^FT9,37^ABN,11,7^FH\^FD'+Trim(Copy(SgDados.Cells[1,L],20,40))+'^FS');
    Editor.Lines.Add('^FT297,20^ABN,11,7^FH\^FD'+Trim(Copy(SgDados.Cells[1,L],1,19))+'^FS');
    Editor.Lines.Add('^FT9,21^ABN,11,7^FH\^FD'+Trim(Copy(SgDados.Cells[1,L],1,19))+'^FS');
    Editor.Lines.Add('^BY2,3,49^FT579,136^BCN,,Y,N');
    Editor.Lines.Add('^FD>;'+Copy(SgDados.Cells[7,L],1,12)+'>6'+Copy(SgDados.Cells[7,L],13,13)+'^FS');
    Editor.Lines.Add('^BY2,3,49^FT292,136^BCN,,Y,N');
    Editor.Lines.Add('^FD>;'+Copy(SgDados.Cells[7,L],1,12)+'>6'+Copy(SgDados.Cells[7,L],13,13)+'^FS');
    Editor.Lines.Add('^BY2,3,49^FT3,137^BCN,,Y,N');
    Editor.Lines.Add('^FD>;'+Copy(SgDados.Cells[7,L],1,12)+'>6'+Copy(SgDados.Cells[7,L],13,13)+'^FS');
{   antes estava pelo codigo de barras
    Editor.Lines.Add('^FD>;'+Copy(SgDados.Cells[6,L],1,12)+'>6'+Copy(SgDados.Cells[6,L],13,13)+'^FS');
    Editor.Lines.Add('^BY2,3,49^FT292,136^BCN,,Y,N');
    Editor.Lines.Add('^FD>;'+Copy(SgDados.Cells[6,L],1,12)+'>6'+Copy(SgDados.Cells[6,L],13,13)+'^FS');
    Editor.Lines.Add('^BY2,3,49^FT3,137^BCN,,Y,N');
    Editor.Lines.Add('^FD>;'+Copy(SgDados.Cells[6,L],1,12)+'>6'+Copy(SgDados.Cells[6,L],13,13)+'^FS'); }
    Editor.Lines.Add('^FT583,74^A0N,28,28^FH\^FD'+'R$'+SgDados.Cells[3,L]+'^FS');
    Editor.Lines.Add('^FT295,75^A0N,28,28^FH\^FD'+'R$'+SgDados.Cells[3,L]+'^FS');
    Editor.Lines.Add('^FT8,75^A0N,28,28^FH\^FD'+'R$'+SgDados.Cells[3,L]+'^FS');
    // Cálculo para imprimir a qtd de etiquetas certo
    if Frac(StrToFloat(SgDados.Cells[2,L])/3) = 0.00 then
      vQtd := StrToFloat(SgDados.Cells[2,L])/3
    else vQtd := (StrToint(FormatFloat('0000',StrToFloat(SgDados.Cells[2,L]))) div 3) + 1;
    Editor.Lines.Add('^PQ'+FloatToStr(vQtd)+',0,1,Y^XZ');
  end;
  Editor.Lines.SaveToFile(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'etiqueta.txt')));
  WinExec(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'print2.bat')),sw_ShowNormal);
  if not FileExists('Print2.bat') then
    ShowMessage('Não foi encontrado o arquivo Print2.bat');
  Application.OnMessage := FormPrincipal.ProcessaMsg;
  Limpar_Tela;
  RgOpcoes.ItemIndex := 0;
  Messagedlg('Impressão ok!', mtInformation, [mbOk], 0);
end;

procedure TFrmPrincipalPreVenda.atualizaEditQtdItens;
var
  i, quantidade : integer;
begin
  edtQtdItens.Clear;
  quantidade := 0;
  for I := 1 to SgDados.RowCount - 1 do begin
    if (SgDados.Cells[1,I] = '') then
       Break;
    if not item_cancelado(I) then
       Inc(quantidade);
  end;
  edtQtdItens.Text := IntToStr(quantidade);
  edtQtdItens.Repaint;
  edtQtdItens.Refresh;
end;

function TFrmPrincipalPreVenda.VendedorValido: Boolean;
begin
  result := True;
  if (trim(edtcdnome.Text) = '') then
  begin
    Application.OnMessage := FrmPrincipalPreVenda.NaoProcessaMsg;
    Showmessage('O nome do vendedor está digitado errado!!');
    cbxUsuario.SetFocus;
    Application.OnMessage := FrmPrincipalPreVenda.ProcessaMsg;
    BtnConfirmar.Enabled := True;
    Alteraquantidade1.Enabled := true;
    result := False;
  end;
end;

function TFrmPrincipalPreVenda.Vender_Proibida_Fracionado: Boolean;
var
  I : integer;
  resultado : Boolean;
begin
  resultado := False;
  if (RgOpcoes.ItemIndex = 0) then
  begin
    for i := 0 to prevenda.itens.Count -1 do begin
      if (not Verifica_Se_Produto_Fracionado(IntToStr(prevenda.itens[I].cdProduto))) and
               (Frac(prevenda.itens[I].quantidade) > 0) then begin
        Application.MessageBox(PWidechar('O produto '+ prevenda.itens[I].descricao + ' está com a quantidade zerada ou negativa.'+#13#10 + 'Para excluí-lo da pré venda dê dois cliques no item!'), 'Atenção', mb_ok + mb_iconwarning + mb_applmodal);
        resultado := True;
        Break;
      end;
    end;
  end;
  result := resultado;
end;

procedure TFrmPrincipalPreVenda.Verifica_Livro_Forracao;
var
  I : integer;
begin
  if (trim(tipoForro) = '') or (RgOpcoes.ItemIndex = 1) then begin
    tipoForro := ChamaInputBoxTipoForracao('Forração','Escolha um estilo de forro na lista abaixo:');
    while tipoForro = '' do
      tipoForro := ChamaInputBoxTipoForracao('Forração','Escolha um estilo de forro na lista abaixo:');
  end;
  if (trim(turno) = '') or (RgOpcoes.ItemIndex = 1) then
  begin
    turno := IntToStr(ChamaInputBoxturno('Turno','Escolha o turno do aluno na lista abaixo:'));
    while turno = '' do
    begin
      turno := IntToStr(ChamaInputBoxturno('Forração','Escolha o turno do aluno na lista abaixo:'));
    end;
  end;
  //verifico se possui livros no meios dos produtos, pego o ultimo sequencial + 1
  if RgOpcoes.ItemIndex = 0 then begin
    nrOrcamentoDia := 0;
    possuiLivro := false;
    for i:= 0 to prevenda.itens.Count - 1 do begin
      if prevenda.itens[i].grupo.codigo = 19 then begin //se possuir pelo menos um produtop do grupo livros salvo o numero na tabela
        possuiLivro := True;
        break;
      end;
    end;
  end
  else
    nrOrcamentoDia := prevenda.nrOrcamentoDia;
end;

function TFrmPrincipalPreVenda.Verifica_PREVENDA_SALVANOCAIXA: boolean;
begin
  // verificar se a pre-venda ja foi confirmada pelo caixa
  With DModulo.ADOQuery1 do begin
    Sql.Text := 'Select 0 '+
                'From Orcamento O WITH (NOLOCK) INNER JOIN IteOrcamento I WITH (NOLOCK) '+
                'ON O.nrOrcamento = I.nrOrcamento                                       '+
                'Where O.nrOrcamento = :LANCTO and O.dsImpresso = ''S'' ';
    Parameters.ParamByName('LANCTO').Value := FrmPrincipalPreVenda.EdtLancto.Text;
    Open;
    if DModulo.ADOQuery1.RecordCount > 0 then
      Result := false
    else
      Result := true;
  end;
end;

procedure TFrmPrincipalPreVenda.Imprimir1Click(Sender: TObject);
var
  vTexto : String[50];
  L,vRequisicao : Integer;
begin
// claudio 10-09-2015
//  if ADOQryNome.Locate('nmPessoa',CbxNome.Text,[]) then
//    EdtCdNome.Text := ADOQryNome.FieldbyName('cdPessoa').AsString
//  else
//    EdtCdNome.Clear;

  if (trim(edtcdcliente.Text) = '') or (trim(edtcdnome.Text) = '') then
  begin
    Application.OnMessage := FrmPrincipalPreVenda.NaoProcessaMsg;
    Showmessage('O nome do cliente ou do vendedor está digitado errado!!');
    CbxCliente.SetFocus;
    Application.OnMessage := FrmPrincipalPreVenda.ProcessaMsg;
    exit;
  end;
  if SgDados.Cells[0,1] = '' then
  begin
    Messagedlg('Não foi lançado nenhum item para essa pré venda \ orçamento!', mtWarning, [mbOk], 0);
    EdtDesconto.Text := '0,00000';
    EdtSubTotal.text := '0,00';
    edtQtdItens.text := '0';
    EdtTotal.text := '0,00';
    edtValorBruto.text := '0,00';
    EdtConsulta.Setfocus;
    exit;
  end;
  Application.OnMessage := NaoProcessaMsg;
  vtexto := InputBox('Impressão de requisição',
                     'Entre com o nome da empresa onde está solicitando o material!', '');
  Application.OnMessage := ProcessaMsg;
  With ADOQrySalvar do
  begin
    Try
      DModulo.Conexao.BeginTrans;
      Sql.Text := 'Select max(nrRequisicao + 1) as Lancto From requisicao';
      Open;
      vRequisicao := FieldByName('Lancto').AsInteger;
      for L := 1 to SgDados.RowCount - 1 do
      begin // Salvando os itens da pré-venda.
        if SgDados.Cells[0,L] = '' then
          Break;
        Sql.Text := 'Insert Into Requisicao (nrRequisicao,dtrequisicao,cdVendedor,cdProduto,cdCliente,dsEmpresa) '+
                    'Values (:REQ,:DATA,:CODIGO,:PROD,:CLIENTE,:EMPRESA)                                         ';
        Parameters.ParamByName('REQ').Value     := vRequisicao;
        Parameters.ParamByName('DATA').Value    := vdata_banco;
        Parameters.ParamByName('PROD').Value    := strtointDef(SgDados.Cells[0,L], 3); // default é o primeiro vendedor, segundo herbert
        Parameters.ParamByName('CODIGO').Value  := strtoint(edtcdnome.Text);
        Parameters.ParamByName('CLIENTE').Value := strtointDef(edtcdcliente.text, 1); // default é venda a consumidor
        Parameters.ParamByName('EMPRESA').Value := vtexto;
        ExecSQL;
      end;
      DModulo.Conexao.CommitTrans;
      Messagedlg('Requisição OK!', mtConfirmation, [mbOk], 0);
      ImprimirRequisicao(vtexto,vRequisicao);
    Except
      on E: Exception do
      begin
        DModulo.Conexao.RollbackTrans;
        Salvar_erro(vData_Banco + ' | ' + pegaHoraBanco, 'PREVENDA', 'TFrmPrincipalPreVenda.Imprimir1Click', e.Message,EdtLancto.Text);
        Messagedlg('Não foi possível salvar!', mterror, [mbOk], 0);
      end;
    end;  // except
  end;
  Application.OnMessage := FrmPrincipalPreVenda.ProcessaMsg;
  Limpar_Tela;
  RgOpcoes.ItemIndex   := 0;
  EdtDesconto.ReadOnly := True;
  EdtSubTotal.ReadOnly := True;
  BtnAprazo.Enabled    := True;
  if FrmPrincipalPreVenda.Enabled = true then
    RgOpcoes.ItemIndex   := 0;
end;

procedure TFrmPrincipalPreVenda.ImprimirRequisicao(vCliente: String;
  vRequisicao: Integer);
var Arq : TextFile;
    vcampo_1,vcampo_2,vcampo_3,vcampo_4,vcampo_5,
    vtitulo,vformapag,vvencimento : String;
    vTotal : real;
    i,j,L : integer;
    Year, Month, Day : Word;
    dtVenc : TDateTime;
    data   : String[10];
begin
  if FileExists('Texto.txt') then
  begin // Caso não encontre o arquivo.
     Editor.Clear;
     Editor.Lines.Add(' ');
     Editor.Lines.Add('       **S E M  V A L O R  F I S C A L**');
     Editor.Lines.Add(' ');
     Editor.Lines.Add(' ============================================');
     Editor.Lines.Add('             REQUISICAO DE COMPRA            ');
     Editor.Lines.Add('          '+ UpperCase( nmEmpresa ) );
//     Editor.Lines.Add('            CAMARATUUBA AUTO PECAS           ');
     Editor.Lines.Add(' ============================================');
     Editor.Lines.Add(' Requisicao N. '+ IntToStr(vRequisicao) + '   Data:   '+ DatetoStr(Date));
     Editor.Lines.Add(' ============================================');
     Editor.Lines.Add(' Descricao                              Qtd');
     for L := 1 to SgDados.RowCount - 1 do begin // Salvando os itens da pré-venda.
       if SgDados.Cells[0,L] = '' then Break;
       vcampo_2 := SgDados.Cells[1,L];
       while Length(vcampo_2) < 38 do vcampo_2 := vcampo_2 + ' ';
       vcampo_3 := FormatFloat('000',StrToFloat(SgDados.Cells[2,L]));
       while Length(vcampo_3) < 4 do vcampo_3 := vcampo_3 + ' ';
       vcampo_4 := SgDados.Cells[7,L];
       Editor.Lines.Add(' '+vcampo_2 +'  '+ vcampo_3 );
       Editor.Lines.Add(' Ref.: '+vcampo_4 );
     end;
     Editor.Lines.Add(' ===========================================');
     Editor.Lines.Add(' ');
     Editor.Lines.Add('  _______________________________________');
     Editor.Lines.Add('                  Autorizacao');
     Editor.Lines.Add(' ');
     Editor.Lines.Add(' ');
     Editor.Lines.Add(' ');
     Editor.Lines.Add(' ');
     Editor.Lines.Add(' ');
     Editor.Lines.Add(' ');
     Editor.Lines.Add(' ');
     Editor.Lines.Add(' ');
     Editor.Lines.Add(' ');
     Editor.Lines.Add(' ');
     try
       AssignFile(Arq,'Texto.txt');
       Erase(Arq);
       Rewrite(Arq);
       Writeln(Arq,Editor.Text);
     Finally
       CloseFile(Arq);
     end; // try
     if vPAFECF = False then
       WinExec(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'print.bat')),sw_ShowNormal);
     if not FileExists('Print.bat') then   // Caso não encontre o arquivo tenta criar
       ShowMessage('Arquivo Print.bat não foi encontrado!');
  end;
end;

procedure TFrmPrincipalPreVenda.RodaScripts1;
begin
{  with DModulo.ADOCommand1 do begin
    CommandText := 'ALTER PROCEDURE SP_CON_ESTOQUE_RILDON' + #13#10 +
       '@DSATIVO VARCHAR(40) = NULL,@ATACADOVAREJO VARCHAR(1) = NULL,' + #13#10 + 
       '@OPCAO VARCHAR(40) = NULL,@CDPRODUTO VARCHAR(40) = NULL,' + #13#10 + 
       '@NMPRODUTO VARCHAR(40) = NULL,@DSREFERENCIA VARCHAR(40) = NULL,' + #13#10 + 
       '@NMGRUPO VARCHAR(40) = NULL,@NMPRODUTO2 VARCHAR(40) = NULL,' + #13#10 + 
       '@C_BARRAS VARCHAR(40) = NULL,@CDCODIGODIC VARCHAR(20) = NULL,' + #13#10 + 
       '@LANCAMENTO VARCHAR(20) = NULL, @PESSOA VARCHAR(20) = NULL' + #13#10 + 
       'AS' + #13#10 + 
       'IF @OPCAO = 0 AND @ATACADOVAREJO = ''V'' BEGIN' + #13#10 + 
    'SELECT P.CDPRODUTO    AS CÓDIGO,P.CDFABRICANTE AS CÓDIGO_BARRAS,' + #13#10 + 
           'P.DSREFERENCIA AS REFERÊNCIA,P.NMPRODUTO    AS DESCRIÇÃO,' + #13#10 + 
           'W.NMPESSOA     AS FABRICANTE,P.VLPRECO      AS PRECO,' + #13#10 + 
           'P.VLPRECO      AS VALOR,P.CDCODIGODIC,' + #13#10 + 
           'P.DSPRATELEIRA AS PRATELEIRA,P.NRQTDREAL    AS ESTOQUE,' + #13#10 + 
           'P.NRQTDCONTAB  AS PEDIDO,P.DSUNIDADE    AS UNIDADE,' + #13#10 + 
           'P.DSEMBALAGEM  AS EMBALAGEM,P.NRPESO       AS PESO,' + #13#10 + 
           'G.NMGRUPO      AS GRUPO,P.CDPESSOA     AS FORNECEDOR,' + #13#10 +
           'I.DSPROMOCAO,P.dsAtivo,P.dsCFOPD,P.dsCFOPF' + #13#10 + 
    'FROM ((GRUPO G WITH (nolock)' + #13#10 + 
         'INNER JOIN PRODUTO P WITH (nolock) ON G.CDGRUPO = P.CDGRUPO AND NOT(P.DSTIPO_ITEM IN (''07'',''08'',''10'')))' + #13#10 + 
         'INNER JOIN PESSOA W WITH (nolock) ON P.CDPESSOA_1 = W.CDPESSOA)' + #13#10 + 
         'INNER JOIN ITEPROMOCAO I WITH (nolock) ON P.CDPRODUTO = I.CDPRODUTO' + #13#10 + 
    'WHERE ( I.DSPROMOCAO <> ''S'' ) AND ( P.DSATIVO = @DSATIVO OR @DSATIVO IS NULL )' + #13#10 + 
          'AND (P.CDPRODUTO LIKE @CDPRODUTO +''%'' OR @CDPRODUTO IS NULL)' + #13#10 + 
          'AND (P.NMPRODUTO LIKE @NMPRODUTO +''%'' OR @NMPRODUTO IS NULL)' + #13#10 + 
          'AND (P.DSREFERENCIA LIKE @DSREFERENCIA +''%'' OR @DSREFERENCIA IS NULL)' + #13#10 + 
          'AND (P.CDCODIGODIC LIKE @CDCODIGODIC +''%'' OR @CDCODIGODIC IS NULL)' + #13#10 + 
          'AND (G.NMGRUPO LIKE @NMGRUPO +''%'' OR @NMGRUPO IS NULL)' + #13#10 + 
          'AND (P.NMPRODUTO LIKE ''%''+ @NMPRODUTO2 +''%'' OR @NMPRODUTO2 IS NULL)' + #13#10 + 
          'AND (P.CDFABRICANTE = @C_BARRAS OR @C_BARRAS IS NULL)' + #13#10 + 
    'UNION ALL' + #13#10 + 
    'SELECT P.CDPRODUTO    AS CÓDIGO,P.CDFABRICANTE AS CÓDIGO_BARRAS,' + #13#10 + 
           'P.DSREFERENCIA AS REFERÊNCIA,P.NMPRODUTO    AS DESCRIÇÃO,' + #13#10 + 
           'W.NMPESSOA     AS FABRICANTE,P.VLPRECO      AS PRECO,' + #13#10 + 
           'I.VLPRECO      AS VALOR,P.CDCODIGODIC,P.DSPRATELEIRA AS PRATELEIRA,' + #13#10 + 
           'P.NRQTDREAL    AS ESTOQUE,P.NRQTDCONTAB  AS PEDIDO,' + #13#10 + 
           'P.DSUNIDADE    AS UNIDADE,P.DSEMBALAGEM  AS EMBALAGEM,' + #13#10 +
           'P.NRPESO       AS PESO,G.NMGRUPO      AS GRUPO,' + #13#10 +
           'P.CDPESSOA     AS FORNECEDOR,I.DSPROMOCAO,P.dsAtivo,P.dsCFOPD,P.dsCFOPF' + #13#10 + 
    'FROM ((GRUPO G WITH (nolock)' + #13#10 + 
         'INNER JOIN PRODUTO P WITH (nolock) ON G.CDGRUPO = P.CDGRUPO AND NOT(P.DSTIPO_ITEM IN (''07'',''08'',''10'')))' + #13#10 + 
         'INNER JOIN PESSOA W WITH (nolock) ON P.CDPESSOA_1 = W.CDPESSOA)' + #13#10 + 
         'INNER JOIN ITEPROMOCAO I WITH (nolock) ON P.CDPRODUTO = I.CDPRODUTO' + #13#10 + 
    'WHERE( I.DSPROMOCAO = ''S'' ) AND ( P.DSATIVO = @DSATIVO OR @DSATIVO IS NULL )' + #13#10 + 
         'AND (P.CDPRODUTO    LIKE @CDPRODUTO +''%''    OR @CDPRODUTO IS NULL)' + #13#10 + 
         'AND (P.NMPRODUTO    LIKE @NMPRODUTO +''%''    OR @NMPRODUTO IS NULL)' + #13#10 + 
         'AND (P.DSREFERENCIA LIKE @DSREFERENCIA +''%'' OR @DSREFERENCIA IS NULL)' + #13#10 + 
         'AND (P.CDCODIGODIC LIKE @CDCODIGODIC +''%''  OR @CDCODIGODIC IS NULL)' + #13#10 + 
         'AND (G.NMGRUPO     LIKE @NMGRUPO +''%''      OR @NMGRUPO IS NULL)' + #13#10 + 
         'AND (P.NMPRODUTO   LIKE ''%''+ @NMPRODUTO2 +''%'' OR @NMPRODUTO2 IS NULL)' + #13#10 + 
         'AND (P.CDFABRICANTE = @C_BARRAS OR @C_BARRAS IS NULL)' + #13#10 + 
    'ORDER BY P.CDPRODUTO' + #13#10 + 
  'END' + #13#10 + 
  'IF (@OPCAO = 1 OR @OPCAO = 5) AND (@ATACADOVAREJO = ''V'') BEGIN' + #13#10 + 
    'SELECT P.CDPRODUTO    AS CÓDIGO,P.CDFABRICANTE AS CÓDIGO_BARRAS,' + #13#10 + 
           'P.DSREFERENCIA AS REFERÊNCIA,P.NMPRODUTO    AS DESCRIÇÃO,' + #13#10 + 
           'W.NMPESSOA     AS FABRICANTE,P.VLPRECO      AS PRECO,' + #13#10 + 
           'P.VLPRECO      AS VALOR,P.CDCODIGODIC,' + #13#10 + 
           'P.DSPRATELEIRA AS PRATELEIRA,P.NRQTDREAL    AS ESTOQUE,' + #13#10 + 
           'P.NRQTDCONTAB  AS PEDIDO,P.DSUNIDADE    AS UNIDADE,' + #13#10 + 
           'P.DSEMBALAGEM  AS EMBALAGEM,P.NRPESO       AS PESO,' + #13#10 + 
           'G.NMGRUPO      AS GRUPO,P.CDPESSOA     AS FORNECEDOR,' + #13#10 + 
           'I.DSPROMOCAO,P.dsAtivo,P.dsCFOPD,P.dsCFOPF' + #13#10 + 
    'FROM ((GRUPO G WITH (nolock)' + #13#10 + 
         'INNER JOIN PRODUTO P     WITH (nolock) ON G.CDGRUPO = P.CDGRUPO AND NOT(P.DSTIPO_ITEM IN (''07'',''08'',''10'')))' + #13#10 + 
         'INNER JOIN PESSOA W      WITH (nolock) ON P.CDPESSOA_1 = W.CDPESSOA)' + #13#10 + 
         'INNER JOIN ITEPROMOCAO I WITH (nolock) ON P.CDPRODUTO = I.CDPRODUTO' + #13#10 + 
    'WHERE( I.DSPROMOCAO <> ''S'' )' + #13#10 + 
         'AND ( P.DSATIVO = @DSATIVO OR @DSATIVO IS NULL )' + #13#10 + 
         'AND (P.CDPRODUTO    LIKE @CDPRODUTO +''%'' OR @CDPRODUTO IS NULL)' + #13#10 + 
         'AND (P.NMPRODUTO    LIKE @NMPRODUTO +''%'' OR @NMPRODUTO IS NULL)' + #13#10 + 
         'AND (P.DSESPECIFICACAO LIKE ''%''+ @DSREFERENCIA +''%'' OR @DSREFERENCIA IS NULL)' + #13#10 + 
         'AND (P.CDCODIGODIC LIKE ''%''+ @CDCODIGODIC +''%'' OR @CDCODIGODIC IS NULL)' + #13#10 + 
         'AND (G.NMGRUPO LIKE @NMGRUPO +''%'' OR @NMGRUPO IS NULL)' + #13#10 + 
         'AND (P.NMPRODUTO LIKE ''%''+ @NMPRODUTO2 +''%'' OR @NMPRODUTO2 IS NULL)' + #13#10 + 
         'AND (P.CDFABRICANTE LIKE ''%''+ @C_BARRAS +''%'' OR @C_BARRAS IS NULL)' + #13#10 +
    'UNION ALL' + #13#10 + 
    'SELECT P.CDPRODUTO    AS CÓDIGO,P.CDFABRICANTE AS CÓDIGO_BARRAS,' + #13#10 + 
           'P.DSREFERENCIA AS REFERÊNCIA,P.NMPRODUTO    AS DESCRIÇÃO,' + #13#10 + 
           'W.NMPESSOA     AS FABRICANTE,P.VLPRECO      AS PRECO,' + #13#10 + 
           'I.VLPRECO      AS VALOR,P.CDCODIGODIC,P.DSPRATELEIRA AS PRATELEIRA,' + #13#10 + 
           'P.NRQTDREAL    AS ESTOQUE,P.NRQTDCONTAB AS PEDIDO,P.DSUNIDADE AS UNIDADE,' + #13#10 + 
           'P.DSEMBALAGEM  AS EMBALAGEM,P.NRPESO    AS PESO,G.NMGRUPO     AS GRUPO,' + #13#10 + 
           'P.CDPESSOA     AS FORNECEDOR,I.DSPROMOCAO,P.dsAtivo,P.dsCFOPD,P.dsCFOPF' + #13#10 + 
    'FROM ((GRUPO G WITH (nolock)' + #13#10 + 
         'INNER JOIN PRODUTO P WITH (nolock)    ON G.CDGRUPO = P.CDGRUPO AND NOT(P.DSTIPO_ITEM IN (''07'',''08'',''10'')))' + #13#10 + 
         'INNER JOIN PESSOA W WITH (nolock)     ON P.CDPESSOA_1 = W.CDPESSOA)' + #13#10 + 
         'INNER JOIN ITEPROMOCAO I WITH (nolock) ON P.CDPRODUTO = I.CDPRODUTO' + #13#10 + 
    'WHERE( I.DSPROMOCAO = ''S'' )' + #13#10 + 
         'AND ( P.DSATIVO = @DSATIVO OR @DSATIVO IS NULL )' + #13#10 + 
         'AND (P.CDPRODUTO LIKE @CDPRODUTO +''%'' OR @CDPRODUTO IS NULL)' + #13#10 + 
         'AND (P.NMPRODUTO LIKE @NMPRODUTO +''%'' OR @NMPRODUTO IS NULL)' + #13#10 + 
         'AND (P.DSESPECIFICACAO LIKE ''%''+ @DSREFERENCIA +''%'' OR @DSREFERENCIA IS NULL)' + #13#10 + 
         'AND (P.CDCODIGODIC LIKE ''%''+ @CDCODIGODIC +''%'' OR @CDCODIGODIC IS NULL)' + #13#10 + 
         'AND (G.NMGRUPO LIKE @NMGRUPO +''%'' OR @NMGRUPO IS NULL)' + #13#10 + 
         'AND (P.NMPRODUTO LIKE ''%''+ @NMPRODUTO2 +''%'' OR @NMPRODUTO2 IS NULL)' + #13#10 + 
         'AND (P.CDFABRICANTE LIKE ''%''+ @C_BARRAS +''%'' OR @C_BARRAS IS NULL)' + #13#10 + 
    'ORDER BY P.NMPRODUTO' + #13#10 + 
  'END' + #13#10 + 
  'IF @OPCAO = 2 AND @ATACADOVAREJO = ''V'' BEGIN' + #13#10 + 
    'SELECT P.CDPRODUTO    AS CÓDIGO,P.CDFABRICANTE AS CÓDIGO_BARRAS,' + #13#10 + 
           'P.DSREFERENCIA AS REFERÊNCIA,P.NMPRODUTO    AS DESCRIÇÃO,' + #13#10 + 
           'W.NMPESSOA     AS FABRICANTE,P.VLPRECO      AS PRECO,' + #13#10 + 
           'P.VLPRECO      AS VALOR,P.CDCODIGODIC,' + #13#10 + 
           'P.DSPRATELEIRA AS PRATELEIRA,P.NRQTDREAL    AS ESTOQUE,' + #13#10 + 
           'P.NRQTDCONTAB  AS PEDIDO,P.DSUNIDADE    AS UNIDADE,' + #13#10 + 
           'P.DSEMBALAGEM  AS EMBALAGEM,P.NRPESO       AS PESO,' + #13#10 + 
           'G.NMGRUPO      AS GRUPO,P.CDPESSOA     AS FORNECEDOR,' + #13#10 + 
           'I.DSPROMOCAO,P.dsAtivo,P.dsCFOPD,P.dsCFOPF' + #13#10 + 
    'FROM ((GRUPO G WITH (nolock)' + #13#10 + 
         'INNER JOIN PRODUTO P WITH (nolock)     ON G.CDGRUPO = P.CDGRUPO AND NOT(P.DSTIPO_ITEM IN (''07'',''08'',''10'')))' + #13#10 + 
         'INNER JOIN PESSOA W WITH (nolock)      ON P.CDPESSOA_1 = W.CDPESSOA)' + #13#10 + 
         'INNER JOIN ITEPROMOCAO I WITH (nolock) ON P.CDPRODUTO = I.CDPRODUTO' + #13#10 + 
    'WHERE( I.DSPROMOCAO <> ''S'' )' + #13#10 +
         'AND ( P.DSATIVO = @DSATIVO OR @DSATIVO IS NULL )' + #13#10 + 
         'AND (P.CDPRODUTO LIKE @CDPRODUTO +''%'' OR @CDPRODUTO IS NULL)' + #13#10 + 
         'AND (P.NMPRODUTO LIKE @NMPRODUTO +''%'' OR @NMPRODUTO IS NULL)' + #13#10 + 
         'AND (P.DSREFERENCIA LIKE @DSREFERENCIA +''%'' OR @DSREFERENCIA IS NULL)' + #13#10 + 
         'AND (P.CDCODIGODIC LIKE @CDCODIGODIC +''%'' OR @CDCODIGODIC IS NULL)' + #13#10 + 
         'AND (G.NMGRUPO LIKE @NMGRUPO +''%'' OR @NMGRUPO IS NULL)' + #13#10 + 
         'AND (P.NMPRODUTO LIKE ''%''+ @NMPRODUTO2 +''%'' OR @NMPRODUTO2 IS NULL)' + #13#10 + 
         'AND (P.CDFABRICANTE = @C_BARRAS OR @C_BARRAS IS NULL)' + #13#10 + 
    'UNION ALL' + #13#10 + 
    'SELECT P.CDPRODUTO    AS CÓDIGO,P.CDFABRICANTE AS CÓDIGO_BARRAS,' + #13#10 + 
           'P.DSREFERENCIA AS REFERÊNCIA,P.NMPRODUTO    AS DESCRIÇÃO,' + #13#10 + 
           'W.NMPESSOA     AS FABRICANTE,P.VLPRECO      AS PRECO,' + #13#10 + 
           'I.VLPRECO      AS VALOR,P.CDCODIGODIC,P.DSPRATELEIRA AS PRATELEIRA,' + #13#10 + 
           'P.NRQTDREAL    AS ESTOQUE,P.NRQTDCONTAB  AS PEDIDO,' + #13#10 + 
           'P.DSUNIDADE    AS UNIDADE,P.DSEMBALAGEM  AS EMBALAGEM,' + #13#10 + 
           'P.NRPESO       AS PESO,G.NMGRUPO      AS GRUPO,' + #13#10 + 
           'P.CDPESSOA     AS FORNECEDOR,I.DSPROMOCAO,P.dsAtivo,P.dsCFOPD,P.dsCFOPF' + #13#10 + 
    'FROM ((GRUPO G WITH (nolock)' + #13#10 + 
         'INNER JOIN PRODUTO P WITH (nolock)     ON G.CDGRUPO = P.CDGRUPO AND NOT(P.DSTIPO_ITEM IN (''07'',''08'',''10'')))' + #13#10 + 
         'INNER JOIN PESSOA W WITH (nolock)      ON P.CDPESSOA_1 = W.CDPESSOA)' + #13#10 + 
         'INNER JOIN ITEPROMOCAO I WITH (nolock) ON P.CDPRODUTO = I.CDPRODUTO' + #13#10 + 
    'WHERE( I.DSPROMOCAO = ''S'' )' + #13#10 + 
         'AND ( P.DSATIVO = @DSATIVO OR @DSATIVO IS NULL )' + #13#10 + 
         'AND (P.CDPRODUTO LIKE @CDPRODUTO +''%'' OR @CDPRODUTO IS NULL)' + #13#10 + 
         'AND (P.NMPRODUTO LIKE @NMPRODUTO +''%'' OR @NMPRODUTO IS NULL)' + #13#10 + 
         'AND (P.DSREFERENCIA LIKE @DSREFERENCIA +''%'' OR @DSREFERENCIA IS NULL)' + #13#10 + 
         'AND (P.CDCODIGODIC LIKE @CDCODIGODIC +''%'' OR @CDCODIGODIC IS NULL)' + #13#10 + 
         'AND (G.NMGRUPO LIKE @NMGRUPO +''%'' OR @NMGRUPO IS NULL)' + #13#10 + 
         'AND (P.NMPRODUTO LIKE ''%''+ @NMPRODUTO2 +''%'' OR @NMPRODUTO2 IS NULL)' + #13#10 + 
         'AND (P.CDFABRICANTE = @C_BARRAS OR @C_BARRAS IS NULL)' + #13#10 + 
    'ORDER BY P.DSREFERENCIA' + #13#10 + 
  'END' + #13#10 + 
  'IF (@OPCAO = 3) AND (@ATACADOVAREJO = ''V'') BEGIN' + #13#10 + 
    'SELECT P.CDPRODUTO    AS CÓDIGO,P.CDFABRICANTE AS CÓDIGO_BARRAS,' + #13#10 + 
           'P.DSREFERENCIA AS REFERÊNCIA,P.NMPRODUTO    AS DESCRIÇÃO,' + #13#10 + 
           'W.NMPESSOA     AS FABRICANTE,P.VLPRECO      AS PRECO,' + #13#10 + 
           'P.VLPRECO      AS VALOR,P.CDCODIGODIC,' + #13#10 + 
           'P.DSPRATELEIRA AS PRATELEIRA,P.NRQTDREAL    AS ESTOQUE,' + #13#10 +
           'P.NRQTDCONTAB  AS PEDIDO,P.DSUNIDADE    AS UNIDADE,' + #13#10 + 
           'P.DSEMBALAGEM  AS EMBALAGEM,P.NRPESO       AS PESO,' + #13#10 + 
           'G.NMGRUPO      AS GRUPO,P.CDPESSOA     AS FORNECEDOR,' + #13#10 + 
           'I.DSPROMOCAO,P.dsAtivo,P.dsCFOPD,P.dsCFOPF' + #13#10 + 
    'FROM ((GRUPO G WITH (nolock)' + #13#10 + 
         'INNER JOIN PRODUTO P WITH (nolock)     ON G.CDGRUPO = P.CDGRUPO AND NOT(P.DSTIPO_ITEM IN (''07'',''08'',''10'')))' + #13#10 + 
         'INNER JOIN PESSOA W WITH (nolock)      ON P.CDPESSOA_1 = W.CDPESSOA)' + #13#10 + 
         'INNER JOIN ITEPROMOCAO I WITH (nolock) ON P.CDPRODUTO = I.CDPRODUTO' + #13#10 + 
    'WHERE (I.DSPROMOCAO <> ''S'' )' + #13#10 + 
          'AND (P.DSATIVO = @DSATIVO OR @DSATIVO IS NULL )' + #13#10 + 
          'AND (P.CDPRODUTO LIKE @CDPRODUTO +''%'' OR @CDPRODUTO IS NULL)' + #13#10 + 
          'AND (P.NMPRODUTO LIKE @NMPRODUTO +''%'' OR @NMPRODUTO IS NULL)' + #13#10 + 
          'AND (P.DSESPECIFICACAO LIKE ''%''+ @DSREFERENCIA +''%'' OR @DSREFERENCIA IS NULL)' + #13#10 + 
          'AND (P.CDCODIGODIC LIKE @CDCODIGODIC +''%'' OR @CDCODIGODIC IS NULL)' + #13#10 + 
          'AND (G.NMGRUPO LIKE @NMGRUPO +''%'' OR @NMGRUPO IS NULL)' + #13#10 + 
          'AND (P.NMPRODUTO LIKE ''%''+ @NMPRODUTO2 +''%'' OR @NMPRODUTO2 IS NULL)' + #13#10 + 
          'AND (P.CDFABRICANTE LIKE ''%''+ @C_BARRAS +''%'' OR @C_BARRAS IS NULL)' + #13#10 + 
    'UNION ALL' + #13#10 + 
    'SELECT P.CDPRODUTO    AS CÓDIGO,P.CDFABRICANTE AS CÓDIGO_BARRAS,' + #13#10 + 
           'P.DSREFERENCIA AS REFERÊNCIA,P.NMPRODUTO    AS DESCRIÇÃO,' + #13#10 + 
           'W.NMPESSOA     AS FABRICANTE,P.VLPRECO      AS PRECO,' + #13#10 + 
           'I.VLPRECO      AS VALOR,P.CDCODIGODIC,' + #13#10 + 
           'P.DSPRATELEIRA AS PRATELEIRA,P.NRQTDREAL    AS ESTOQUE,' + #13#10 + 
           'P.NRQTDCONTAB  AS PEDIDO,P.DSUNIDADE    AS UNIDADE,' + #13#10 + 
           'P.DSEMBALAGEM  AS EMBALAGEM,P.NRPESO       AS PESO,' + #13#10 + 
           'G.NMGRUPO      AS GRUPO,P.CDPESSOA     AS FORNECEDOR,' + #13#10 + 
           'I.DSPROMOCAO,P.dsAtivo,P.dsCFOPD,P.dsCFOPF' + #13#10 + 
   'FROM ((GRUPO G WITH (nolock)' + #13#10 +
        'INNER JOIN PRODUTO P WITH (nolock)     ON G.CDGRUPO = P.CDGRUPO AND NOT(P.DSTIPO_ITEM IN (''07'',''08'',''10'')))' + #13#10 + 
        'INNER JOIN PESSOA W WITH (nolock)      ON P.CDPESSOA_1 = W.CDPESSOA)' + #13#10 + 
         'INNER JOIN ITEPROMOCAO I WITH (nolock) ON P.CDPRODUTO = I.CDPRODUTO' + #13#10 + 
    'WHERE( I.DSPROMOCAO = ''S'' )' + #13#10 + 
         'AND ( P.DSATIVO = @DSATIVO OR @DSATIVO IS NULL )' + #13#10 + 
         'AND (P.CDPRODUTO LIKE @CDPRODUTO +''%'' OR @CDPRODUTO IS NULL)' + #13#10 + 
         'AND (P.NMPRODUTO LIKE @NMPRODUTO +''%'' OR @NMPRODUTO IS NULL)' + #13#10 + 
         'AND (P.DSESPECIFICACAO LIKE ''%''+ @DSREFERENCIA +''%'' OR @DSREFERENCIA IS NULL)' + #13#10 + 
         'AND (P.CDCODIGODIC LIKE @CDCODIGODIC +''%'' OR @CDCODIGODIC IS NULL)' + #13#10 + 
         'AND (G.NMGRUPO LIKE @NMGRUPO +''%'' OR @NMGRUPO IS NULL)' + #13#10 +
         'AND (P.NMPRODUTO LIKE ''%''+ @NMPRODUTO2 +''%'' OR @NMPRODUTO2 IS NULL)' + #13#10 + 
         'AND (P.CDFABRICANTE LIKE ''%''+ @C_BARRAS +''%'' OR @C_BARRAS IS NULL)' + #13#10 + 
    'ORDER BY P.CDCODIGODIC' + #13#10 + 
  'END' + #13#10 + 
  'IF @OPCAO = 4 AND @ATACADOVAREJO = ''V'' BEGIN' + #13#10 + 
    'SELECT DISTINCT P.CDPRODUTO AS CÓDIGO,' + #13#10 + 
           'P.CDFABRICANTE AS CÓDIGO_BARRAS,P.DSREFERENCIA AS REFERÊNCIA,' + #13#10 + 
           'P.NMPRODUTO    AS DESCRIÇÃO,W.NMPESSOA     AS FABRICANTE,' + #13#10 + 
           'P.VLPRECO      AS PRECO,P.VLPRECO      AS VALOR,' + #13#10 + 
           'P.CDCODIGODIC,P.DSPRATELEIRA AS PRATELEIRA,' + #13#10 + 
           'P.NRQTDREAL    AS ESTOQUE,P.NRQTDCONTAB  AS PEDIDO,' + #13#10 + 
           'P.DSUNIDADE    AS UNIDADE,P.DSEMBALAGEM  AS EMBALAGEM,' + #13#10 + 
           'P.NRPESO   AS PESO,G.NMGRUPO  AS GRUPO,' + #13#10 + 
           'P.CDPESSOA AS FORNECEDOR,I.DSPROMOCAO,' + #13#10 + 
           'P.dsAtivo,P.dsCFOPD,P.dsCFOPF' + #13#10 + 
    'FROM ((GRUPO G WITH (nolock)' + #13#10 + 
         'INNER JOIN PRODUTO P WITH (nolock) ON G.CDGRUPO = P.CDGRUPO AND NOT(P.DSTIPO_ITEM IN (''07'',''08'',''10'')))' + #13#10 + 
         'INNER JOIN PESSOA W WITH (nolock)  ON P.CDPESSOA_1 = W.CDPESSOA)' + #13#10 + 
         'INNER JOIN ITEPROMOCAO I WITH (nolock) ON P.CDPRODUTO = I.CDPRODUTO' + #13#10 + 
         'INNER JOIN CODADICIONAL C ON P.CDPRODUTO = C.CDPRODUTO' + #13#10 + 
    'WHERE (I.DSPROMOCAO <> ''S'') AND (C.CDADICIONAL LIKE @NMGRUPO + ''%'' OR @NMGRUPO IS NULL)' + #13#10 + 
    'UNION ALL' + #13#10 + 
    'SELECT DISTINCT P.CDPRODUTO AS CÓDIGO,' + #13#10 + 
           'P.CDFABRICANTE AS CÓDIGO_BARRAS,P.DSREFERENCIA AS REFERÊNCIA,' + #13#10 + 
           'P.NMPRODUTO    AS DESCRIÇÃO,W.NMPESSOA     AS FABRICANTE,' + #13#10 + 
           'P.VLPRECO      AS PRECO,I.VLPRECO      AS VALOR,P.CDCODIGODIC,' + #13#10 + 
           'P.DSPRATELEIRA AS PRATELEIRA,P.NRQTDREAL    AS ESTOQUE,' + #13#10 + 
           'P.NRQTDCONTAB  AS PEDIDO,P.DSUNIDADE    AS UNIDADE,' + #13#10 + 
           'P.DSEMBALAGEM  AS EMBALAGEM,P.NRPESO   AS PESO,' + #13#10 + 
           'G.NMGRUPO  AS GRUPO,P.CDPESSOA AS FORNECEDOR,' + #13#10 + 
           'I.DSPROMOCAO,P.dsAtivo,P.dsCFOPD,P.dsCFOPF' + #13#10 + 
    'FROM ((GRUPO G WITH (nolock)' + #13#10 + 
         'INNER JOIN PRODUTO P WITH (nolock) ON G.CDGRUPO = P.CDGRUPO AND NOT(P.DSTIPO_ITEM IN (''07'',''08'',''10'')))' + #13#10 + 
         'INNER JOIN PESSOA W WITH (nolock)  ON P.CDPESSOA_1 = W.CDPESSOA)' + #13#10 + 
         'INNER JOIN ITEPROMOCAO I WITH (nolock) ON P.CDPRODUTO = I.CDPRODUTO' + #13#10 + 
         'INNER JOIN CODADICIONAL C ON P.CDPRODUTO = C.CDPRODUTO' + #13#10 + 
    'WHERE ( I.DSPROMOCAO = ''S'' ) AND (C.CDADICIONAL LIKE @NMGRUPO + ''%'' OR @NMGRUPO IS NULL)' + #13#10 + 
    'ORDER BY  P.NMPRODUTO' + #13#10 +
  'END' + #13#10 + 
  'IF @OPCAO = 6 AND @ATACADOVAREJO = ''V'' BEGIN' + #13#10 + 
    'SELECT P.CDPRODUTO    AS CÓDIGO,P.CDFABRICANTE AS CÓDIGO_BARRAS,' + #13#10 + 
           'P.DSREFERENCIA AS REFERÊNCIA,P.NMPRODUTO    AS DESCRIÇÃO,' + #13#10 + 
           'W.NMPESSOA     AS FABRICANTE,P.VLPRECO      AS PRECO,' + #13#10 + 
           'P.VLPRECO      AS VALOR,P.CDCODIGODIC,P.DSPRATELEIRA AS PRATELEIRA,' + #13#10 + 
           'P.NRQTDREAL    AS ESTOQUE,P.NRQTDCONTAB  AS PEDIDO,P.DSUNIDADE    AS UNIDADE,' + #13#10 + 
           'P.DSEMBALAGEM  AS EMBALAGEM,P.NRPESO AS PESO,G.NMGRUPO      AS GRUPO,' + #13#10 + 
           'P.CDPESSOA     AS FORNECEDOR,I.DSPROMOCAO,P.dsAtivo,P.dsCFOPD,P.dsCFOPF' + #13#10 + 
    'FROM ((GRUPO G WITH (nolock)' + #13#10 + 
         'INNER JOIN PRODUTO P WITH (nolock) ON G.CDGRUPO = P.CDGRUPO AND NOT(P.DSTIPO_ITEM IN (''07'',''08'',''10'')))' + #13#10 + 
         'INNER JOIN PESSOA W WITH (nolock)  ON P.CDPESSOA_1 = W.CDPESSOA)' + #13#10 + 
         'INNER JOIN ITEPROMOCAO I WITH (nolock) ON P.CDPRODUTO = I.CDPRODUTO' + #13#10 + 
    'WHERE( I.DSPROMOCAO <> ''S'' ) AND (P.CDPRODUTO = @CDPRODUTO)' + #13#10 + 
         'OR (P.CDPRODUTO IN(SELECT CDSIMILAR FROM SIMILAR WHERE CDPRODUTO = @CDPRODUTO))' + #13#10 + 
         'OR (P.CDPRODUTO IN(SELECT CDPRODUTO FROM SIMILAR WHERE CDSIMILAR = @CDPRODUTO))' + #13#10 + 
    'UNION ALL' + #13#10 + 
    'SELECT P.CDPRODUTO    AS CÓDIGO,P.CDFABRICANTE AS CÓDIGO_BARRAS,' + #13#10 + 
           'P.DSREFERENCIA AS REFERÊNCIA,P.NMPRODUTO    AS DESCRIÇÃO,' + #13#10 + 
           'W.NMPESSOA     AS FABRICANTE,P.VLPRECO      AS PRECO,' + #13#10 + 
           'I.VLPRECO      AS VALOR,P.CDCODIGODIC,' + #13#10 + 
           'P.DSPRATELEIRA AS PRATELEIRA,P.NRQTDREAL    AS ESTOQUE,' + #13#10 + 
           'P.NRQTDCONTAB  AS PEDIDO,P.DSUNIDADE    AS UNIDADE,' + #13#10 + 
           'P.DSEMBALAGEM  AS EMBALAGEM,P.NRPESO       AS PESO,' + #13#10 + 
           'G.NMGRUPO      AS GRUPO,P.CDPESSOA     AS FORNECEDOR,' + #13#10 + 
           'I.DSPROMOCAO,P.dsAtivo,P.dsCFOPD,P.dsCFOPF' + #13#10 + 
    'FROM ((GRUPO G WITH (nolock)' + #13#10 + 
         'INNER JOIN PRODUTO P WITH (nolock) ON G.CDGRUPO = P.CDGRUPO AND NOT(P.DSTIPO_ITEM IN (''07'',''08'',''10'')))' + #13#10 + 
         'INNER JOIN PESSOA W       ON P.CDPESSOA_1 = W.CDPESSOA)' + #13#10 + 
         'INNER JOIN ITEPROMOCAO I ON P.CDPRODUTO = I.CDPRODUTO' + #13#10 + 
    'WHERE (I.DSPROMOCAO = ''S'' ) AND (P.CDPRODUTO = @CDPRODUTO OR @CDPRODUTO IS NULL)' + #13#10 + 
    'ORDER BY  P.NMPRODUTO' + #13#10 + 
  'END' + #13#10 + 
  'IF @OPCAO = 0 AND @ATACADOVAREJO = ''A'' BEGIN' + #13#10 + 
    'SELECT P.CDPRODUTO    AS CÓDIGO,P.CDFABRICANTE AS CÓDIGO_BARRAS,' + #13#10 + 
           'P.DSREFERENCIA AS REFERÊNCIA,P.NMPRODUTO    AS DESCRIÇÃO,' + #13#10 + 
           'W.NMPESSOA     AS FABRICANTE,P.VLATACADO    AS PRECO,' + #13#10 + 
           'P.VLATACADO    AS VALOR,P.CDCODIGODIC,P.DSPRATELEIRA AS PRATELEIRA,' + #13#10 +
           'P.NRQTDREAL    AS ESTOQUE,P.NRQTDCONTAB  AS PEDIDO,P.DSUNIDADE    AS UNIDADE,' + #13#10 + 
           'P.DSEMBALAGEM  AS EMBALAGEM,P.NRPESO   AS PESO,G.NMGRUPO  AS GRUPO,' + #13#10 + 
           'P.CDPESSOA AS FORNECEDOR,I.DSPROMOCAO,P.dsAtivo,P.dsCFOPD,P.dsCFOPF' + #13#10 + 
    'FROM ((GRUPO G WITH (nolock)' + #13#10 + 
         'INNER JOIN PRODUTO P WITH (nolock) ON G.CDGRUPO = P.CDGRUPO AND NOT(P.DSTIPO_ITEM IN (''07'',''08'',''10'')))' + #13#10 + 
         'INNER JOIN PESSOA W WITH (nolock)  ON P.CDPESSOA_1 = W.CDPESSOA)' + #13#10 + 
         'INNER JOIN ITEPROMOCAO I WITH (nolock) ON P.CDPRODUTO = I.CDPRODUTO' + #13#10 + 
    'WHERE ( I.DSPROMOCAO <> ''S'' )' + #13#10 + 
          'AND (P.DSATIVO = @DSATIVO OR @DSATIVO IS NULL )' + #13#10 + 
          'AND (P.CDPRODUTO LIKE @CDPRODUTO +''%'' OR @CDPRODUTO IS NULL)' + #13#10 + 
          'AND (P.NMPRODUTO LIKE @NMPRODUTO +''%'' OR @NMPRODUTO IS NULL)' + #13#10 + 
          'AND (P.DSREFERENCIA LIKE @DSREFERENCIA +''%'' OR @DSREFERENCIA IS NULL)' + #13#10 + 
          'AND (P.CDCODIGODIC LIKE @CDCODIGODIC +''%'' OR @CDCODIGODIC IS NULL)' + #13#10 + 
          'AND (G.NMGRUPO LIKE @NMGRUPO +''%'' OR @NMGRUPO IS NULL)' + #13#10 + 
          'AND (P.NMPRODUTO LIKE ''%''+ @NMPRODUTO2 +''%'' OR @NMPRODUTO2 IS NULL)' + #13#10 + 
         'AND (P.CDFABRICANTE = @C_BARRAS OR @C_BARRAS IS NULL)' + #13#10 + 
   'UNION ALL' + #13#10 + 
    'SELECT P.CDPRODUTO    AS CÓDIGO,P.CDFABRICANTE AS CÓDIGO_BARRAS,' + #13#10 + 
           'P.DSREFERENCIA AS REFERÊNCIA,P.NMPRODUTO    AS DESCRIÇÃO,' + #13#10 + 
           'W.NMPESSOA     AS FABRICANTE,P.VLATACADO    AS PRECO,' + #13#10 + 
           'I.VLATACADO    AS VALOR,P.CDCODIGODIC,' + #13#10 + 
           'P.DSPRATELEIRA AS PRATELEIRA,P.NRQTDREAL    AS ESTOQUE,' + #13#10 + 
           'P.NRQTDCONTAB  AS PEDIDO,P.DSUNIDADE    AS UNIDADE,' + #13#10 + 
           'P.DSEMBALAGEM  AS EMBALAGEM,P.NRPESO   AS PESO,' + #13#10 + 
           'G.NMGRUPO  AS GRUPO,P.CDPESSOA AS FORNECEDOR,' + #13#10 + 
           'I.DSPROMOCAO,P.dsAtivo,P.dsCFOPD,P.dsCFOPF' + #13#10 + 
    'FROM ((GRUPO G WITH (nolock)' + #13#10 + 
         'INNER JOIN PRODUTO P WITH (nolock) ON G.CDGRUPO = P.CDGRUPO AND NOT(P.DSTIPO_ITEM IN (''07'',''08'',''10'')))' + #13#10 + 
         'INNER JOIN PESSOA W WITH (nolock)  ON P.CDPESSOA_1 = W.CDPESSOA)' + #13#10 + 
         'INNER JOIN ITEPROMOCAO I WITH (nolock) ON P.CDPRODUTO = I.CDPRODUTO' + #13#10 + 
    'WHERE ( I.DSPROMOCAO = ''S'' )' + #13#10 + 
          'AND (P.DSATIVO = @DSATIVO OR @DSATIVO IS NULL )' + #13#10 + 
          'AND (P.CDPRODUTO LIKE @CDPRODUTO +''%'' OR @CDPRODUTO IS NULL)' + #13#10 + 
          'AND (P.NMPRODUTO LIKE @NMPRODUTO +''%'' OR @NMPRODUTO IS NULL)' + #13#10 + 
          'AND (P.DSREFERENCIA LIKE @DSREFERENCIA +''%'' OR @DSREFERENCIA IS NULL)' + #13#10 + 
          'AND (P.CDCODIGODIC LIKE @CDCODIGODIC +''%'' OR @CDCODIGODIC IS NULL)' + #13#10 + 
          'AND (G.NMGRUPO LIKE @NMGRUPO +''%'' OR @NMGRUPO IS NULL)' + #13#10 + 
          'AND (P.NMPRODUTO LIKE ''%''+ @NMPRODUTO2 +''%'' OR @NMPRODUTO2 IS NULL)' + #13#10 +
          'AND (P.CDFABRICANTE = @C_BARRAS OR @C_BARRAS IS NULL)' + #13#10 + 
    'ORDER BY  P.CDPRODUTO' + #13#10 + 
  'END' + #13#10 + 
  'IF (@OPCAO = 1 OR @OPCAO = 5) AND (@ATACADOVAREJO = ''A'') BEGIN' + #13#10 + 
    'SELECT P.CDPRODUTO    AS CÓDIGO,P.CDFABRICANTE AS CÓDIGO_BARRAS,' + #13#10 + 
           'P.DSREFERENCIA AS REFERÊNCIA,P.NMPRODUTO    AS DESCRIÇÃO,' + #13#10 + 
           'W.NMPESSOA     AS FABRICANTE,P.VLATACADO    AS PRECO,' + #13#10 + 
           'P.VLATACADO    AS VALOR,P.CDCODIGODIC,P.DSPRATELEIRA AS PRATELEIRA,' + #13#10 + 
           'P.NRQTDREAL    AS ESTOQUE,P.NRQTDCONTAB  AS PEDIDO,' + #13#10 + 
           'P.DSUNIDADE    AS UNIDADE,P.DSEMBALAGEM  AS EMBALAGEM,' + #13#10 + 
           'P.NRPESO       AS PESO,G.NMGRUPO      AS GRUPO,' + #13#10 + 
           'P.CDPESSOA     AS FORNECEDOR,I.DSPROMOCAO,P.dsAtivo,P.dsCFOPD,P.dsCFOPF' + #13#10 + 
    'FROM ((GRUPO G WITH (nolock)' + #13#10 + 
         'INNER JOIN PRODUTO P ON G.CDGRUPO = P.CDGRUPO AND NOT(P.DSTIPO_ITEM IN (''07'',''08'',''10'')))' + #13#10 + 
         'INNER JOIN PESSOA W WITH (nolock) ON P.CDPESSOA_1 = W.CDPESSOA)' + #13#10 + 
         'INNER JOIN ITEPROMOCAO I WITH (nolock) ON P.CDPRODUTO = I.CDPRODUTO' + #13#10 + 
    'WHERE ( I.DSPROMOCAO <> ''S'' )' + #13#10 + 
          'AND (P.DSATIVO = @DSATIVO OR @DSATIVO IS NULL )' + #13#10 + 
          'AND (P.CDPRODUTO LIKE @CDPRODUTO +''%'' OR @CDPRODUTO IS NULL)' + #13#10 + 
          'AND (P.NMPRODUTO LIKE @NMPRODUTO +''%'' OR @NMPRODUTO IS NULL)' + #13#10 + 
          'AND (P.DSESPECIFICACAO LIKE ''%''+ @DSREFERENCIA +''%'' OR @DSREFERENCIA IS NULL)' + #13#10 + 
          'AND (P.CDCODIGODIC LIKE @CDCODIGODIC +''%'' OR @CDCODIGODIC IS NULL)' + #13#10 + 
          'AND (G.NMGRUPO LIKE @NMGRUPO +''%'' OR @NMGRUPO IS NULL)' + #13#10 + 
          'AND (P.NMPRODUTO LIKE ''%''+ @NMPRODUTO2 +''%'' OR @NMPRODUTO2 IS NULL)' + #13#10 + 
          'AND (P.CDFABRICANTE LIKE ''%''+ @C_BARRAS +''%'' OR @C_BARRAS IS NULL)' + #13#10 + 
   'UNION ALL' + #13#10 + 
    'SELECT P.CDPRODUTO    AS CÓDIGO,P.CDFABRICANTE AS CÓDIGO_BARRAS,' + #13#10 + 
           'P.DSREFERENCIA AS REFERÊNCIA,P.NMPRODUTO    AS DESCRIÇÃO,' + #13#10 + 
           'W.NMPESSOA     AS FABRICANTE,P.VLATACADO    AS PRECO,' + #13#10 + 
           'I.VLATACADO    AS VALOR,P.CDCODIGODIC,' + #13#10 + 
           'P.DSPRATELEIRA AS PRATELEIRA,P.NRQTDREAL    AS ESTOQUE,' + #13#10 + 
           'P.NRQTDCONTAB  AS PEDIDO,P.DSUNIDADE    AS UNIDADE,' + #13#10 + 
           'P.DSEMBALAGEM  AS EMBALAGEM,P.NRPESO       AS PESO,' + #13#10 + 
           'G.NMGRUPO      AS GRUPO,P.CDPESSOA     AS FORNECEDOR,' + #13#10 + 
           'I.DSPROMOCAO,P.dsAtivo,P.dsCFOPD,P.dsCFOPF' + #13#10 + 
    'FROM ((GRUPO G WITH (nolock)' + #13#10 + 
         'INNER JOIN PRODUTO P ON G.CDGRUPO = P.CDGRUPO AND NOT(P.DSTIPO_ITEM IN (''07'',''08'',''10'')))' + #13#10 + 
         'INNER JOIN PESSOA W WITH (nolock) ON P.CDPESSOA_1 = W.CDPESSOA)' + #13#10 +
         'INNER JOIN ITEPROMOCAO I WITH (nolock) ON P.CDPRODUTO = I.CDPRODUTO' + #13#10 + 
    'WHERE ( I.DSPROMOCAO = ''S'' )' + #13#10 + 
          'AND (P.DSATIVO = @DSATIVO OR @DSATIVO IS NULL )' + #13#10 + 
          'AND (P.CDPRODUTO LIKE @CDPRODUTO +''%'' OR @CDPRODUTO IS NULL)' + #13#10 + 
          'AND (P.NMPRODUTO LIKE @NMPRODUTO +''%'' OR @NMPRODUTO IS NULL)' + #13#10 + 
          'AND (P.DSESPECIFICACAO LIKE ''%''+ @DSREFERENCIA +''%'' OR @DSREFERENCIA IS NULL)' + #13#10 + 
          'AND (P.CDCODIGODIC LIKE @CDCODIGODIC +''%'' OR @CDCODIGODIC IS NULL)' + #13#10 + 
          'AND (G.NMGRUPO LIKE @NMGRUPO +''%'' OR @NMGRUPO IS NULL)' + #13#10 + 
          'AND (P.NMPRODUTO LIKE ''%''+ @NMPRODUTO2 +''%'' OR @NMPRODUTO2 IS NULL)' + #13#10 + 
          'AND (P.CDFABRICANTE LIKE ''%''+ @C_BARRAS +''%'' OR @C_BARRAS IS NULL)' + #13#10 + 
    'ORDER BY P.NMPRODUTO' + #13#10 + 
  'END' + #13#10 + 
  'IF @OPCAO = 2 AND @ATACADOVAREJO = ''A'' BEGIN' + #13#10 + 
    'SELECT P.CDPRODUTO    AS CÓDIGO,P.CDFABRICANTE AS CÓDIGO_BARRAS,' + #13#10 + 
           'P.DSREFERENCIA AS REFERÊNCIA,P.NMPRODUTO    AS DESCRIÇÃO,' + #13#10 + 
           'W.NMPESSOA     AS FABRICANTE,P.VLATACADO    AS PRECO,' + #13#10 + 
           'P.VLATACADO    AS VALOR,P.CDCODIGODIC,' + #13#10 + 
           'P.DSPRATELEIRA AS PRATELEIRA,P.NRQTDREAL    AS ESTOQUE,' + #13#10 + 
           'P.NRQTDCONTAB  AS PEDIDO,P.DSUNIDADE    AS UNIDADE,' + #13#10 + 
           'P.DSEMBALAGEM  AS EMBALAGEM,P.NRPESO       AS PESO,' + #13#10 + 
           'G.NMGRUPO      AS GRUPO,P.CDPESSOA     AS FORNECEDOR,' + #13#10 + 
           'I.DSPROMOCAO,P.dsAtivo,P.dsCFOPD,P.dsCFOPF' + #13#10 + 
    'FROM ((GRUPO G WITH (nolock)' + #13#10 + 
         'INNER JOIN PRODUTO P WITH (nolock)     ON G.CDGRUPO = P.CDGRUPO AND NOT(P.DSTIPO_ITEM IN (''07'',''08'',''10'')))' + #13#10 + 
         'INNER JOIN PESSOA W WITH (nolock)      ON P.CDPESSOA_1 = W.CDPESSOA)' + #13#10 + 
         'INNER JOIN ITEPROMOCAO I WITH (nolock) ON P.CDPRODUTO = I.CDPRODUTO' + #13#10 + 
    'WHERE ( I.DSPROMOCAO <> ''S'' )' + #13#10 + 
          'AND( P.DSATIVO = @DSATIVO OR @DSATIVO IS NULL )' + #13#10 + 
          'AND (P.CDPRODUTO LIKE @CDPRODUTO +''%'' OR @CDPRODUTO IS NULL)' + #13#10 + 
          'AND (P.NMPRODUTO LIKE @NMPRODUTO +''%'' OR @NMPRODUTO IS NULL)' + #13#10 + 
          'AND (P.DSREFERENCIA LIKE @DSREFERENCIA +''%'' OR @DSREFERENCIA IS NULL)' + #13#10 + 
          'AND (P.CDCODIGODIC LIKE @CDCODIGODIC +''%'' OR @CDCODIGODIC IS NULL)' + #13#10 + 
          'AND (G.NMGRUPO LIKE @NMGRUPO +''%'' OR @NMGRUPO IS NULL)' + #13#10 + 
          'AND (P.NMPRODUTO LIKE ''%''+ @NMPRODUTO2 +''%'' OR @NMPRODUTO2 IS NULL)' + #13#10 + 
          'AND (P.CDFABRICANTE = @C_BARRAS OR @C_BARRAS IS NULL)' + #13#10 + 
    'SELECT P.CDPRODUTO    AS CÓDIGO,P.CDFABRICANTE AS CÓDIGO_BARRAS,' + #13#10 + 
           'P.DSREFERENCIA AS REFERÊNCIA,P.NMPRODUTO    AS DESCRIÇÃO,' + #13#10 + 
           'W.NMPESSOA     AS FABRICANTE,P.VLATACADO    AS PRECO,' + #13#10 +
           'I.VLATACADO    AS VALOR,P.CDCODIGODIC,' + #13#10 + 
           'P.DSPRATELEIRA AS PRATELEIRA,P.NRQTDREAL    AS ESTOQUE,' + #13#10 + 
           'P.NRQTDCONTAB  AS PEDIDO,P.DSUNIDADE    AS UNIDADE,' + #13#10 + 
           'P.DSEMBALAGEM  AS EMBALAGEM,P.NRPESO       AS PESO,' + #13#10 + 
           'G.NMGRUPO      AS GRUPO,P.CDPESSOA     AS FORNECEDOR,' + #13#10 + 
           'I.DSPROMOCAO,P.dsAtivo,P.dsCFOPD,P.dsCFOPF' + #13#10 + 
    'FROM ((GRUPO G WITH (nolock)' + #13#10 + 
         'INNER JOIN PRODUTO P WITH (nolock)     ON G.CDGRUPO = P.CDGRUPO AND NOT(P.DSTIPO_ITEM IN (''07'',''08'',''10'')))' + #13#10 + 
         'INNER JOIN PESSOA W WITH (nolock)      ON P.CDPESSOA_1 = W.CDPESSOA)' + #13#10 + 
         'INNER JOIN ITEPROMOCAO I WITH (nolock) ON P.CDPRODUTO = I.CDPRODUTO' + #13#10 + 
    'WHERE ( I.DSPROMOCAO = ''S'' )' + #13#10 + 
          'AND( P.DSATIVO = @DSATIVO OR @DSATIVO IS NULL )' + #13#10 + 
          'AND (P.CDPRODUTO LIKE @CDPRODUTO +''%'' OR @CDPRODUTO IS NULL)' + #13#10 + 
          'AND (P.NMPRODUTO LIKE @NMPRODUTO +''%'' OR @NMPRODUTO IS NULL)' + #13#10 + 
          'AND (P.DSREFERENCIA LIKE @DSREFERENCIA +''%'' OR @DSREFERENCIA IS NULL)' + #13#10 + 
          'AND (P.CDCODIGODIC LIKE @CDCODIGODIC +''%'' OR @CDCODIGODIC IS NULL)' + #13#10 + 
          'AND (G.NMGRUPO LIKE @NMGRUPO +''%'' OR @NMGRUPO IS NULL)' + #13#10 + 
          'AND (P.NMPRODUTO LIKE ''%''+ @NMPRODUTO2 +''%'' OR @NMPRODUTO2 IS NULL)' + #13#10 + 
          'AND (P.CDFABRICANTE = @C_BARRAS OR @C_BARRAS IS NULL)' + #13#10 + 
    'ORDER BY P.DSREFERENCIA' + #13#10 + 
  'END' + #13#10 + 
  'IF @OPCAO = 3 AND @ATACADOVAREJO = ''A'' BEGIN' + #13#10 + 
    'SELECT P.CDPRODUTO    AS CÓDIGO,P.CDFABRICANTE AS CÓDIGO_BARRAS,' + #13#10 + 
           'P.DSREFERENCIA AS REFERÊNCIA,P.NMPRODUTO    AS DESCRIÇÃO,' + #13#10 + 
           'W.NMPESSOA     AS FABRICANTE,P.VLATACADO    AS PRECO,' + #13#10 + 
           'P.VLATACADO    AS VALOR,P.CDCODIGODIC,' + #13#10 + 
           'P.DSPRATELEIRA AS PRATELEIRA,P.NRQTDREAL    AS ESTOQUE,' + #13#10 + 
           'P.NRQTDCONTAB  AS PEDIDO,P.DSUNIDADE    AS UNIDADE,' + #13#10 + 
           'P.DSEMBALAGEM  AS EMBALAGEM,P.NRPESO       AS PESO,' + #13#10 + 
           'G.NMGRUPO      AS GRUPO,P.CDPESSOA     AS FORNECEDOR,' + #13#10 + 
           'I.DSPROMOCAO,P.dsAtivo,P.dsCFOPD,P.dsCFOPF' + #13#10 + 
    'FROM ((GRUPO G WITH (nolock)' + #13#10 + 
         'INNER JOIN PRODUTO P WITH (nolock)     ON G.CDGRUPO = P.CDGRUPO AND NOT(P.DSTIPO_ITEM IN (''07'',''08'',''10'')))' + #13#10 + 
         'INNER JOIN PESSOA W WITH (nolock)      ON P.CDPESSOA_1 = W.CDPESSOA)' + #13#10 + 
         'INNER JOIN ITEPROMOCAO I WITH (nolock) ON P.CDPRODUTO = I.CDPRODUTO' + #13#10 + 
    'WHERE (I.DSPROMOCAO <> ''S'' )' + #13#10 + 
          'AND( P.DSATIVO = @DSATIVO OR @DSATIVO IS NULL )' + #13#10 + 
          'AND (P.CDPRODUTO LIKE @CDPRODUTO +''%'' OR @CDPRODUTO IS NULL)' + #13#10 +
          'AND (P.NMPRODUTO LIKE @NMPRODUTO +''%'' OR @NMPRODUTO IS NULL)' + #13#10 + 
          'AND (P.DSREFERENCIA LIKE @DSREFERENCIA +''%'' OR @DSREFERENCIA IS NULL)' + #13#10 + 
          'AND (P.CDCODIGODIC LIKE @CDCODIGODIC +''%'' OR @CDCODIGODIC IS NULL)' + #13#10 + 
          'AND (G.NMGRUPO LIKE @NMGRUPO +''%'' OR @NMGRUPO IS NULL)' + #13#10 + 
          'AND (P.NMPRODUTO LIKE ''%''+ @NMPRODUTO2 +''%'' OR @NMPRODUTO2 IS NULL)' + #13#10 + 
          'AND (P.CDFABRICANTE = @C_BARRAS OR @C_BARRAS IS NULL)' + #13#10 + 
    'SELECT P.CDPRODUTO    AS CÓDIGO,P.CDFABRICANTE AS CÓDIGO_BARRAS,' + #13#10 + 
           'P.DSREFERENCIA AS REFERÊNCIA,P.NMPRODUTO    AS DESCRIÇÃO,' + #13#10 + 
           'W.NMPESSOA     AS FABRICANTE,P.VLATACADO    AS PRECO,' + #13#10 + 
           'I.VLATACADO    AS VALOR,P.CDCODIGODIC,' + #13#10 + 
           'P.DSPRATELEIRA AS PRATELEIRA,P.NRQTDREAL    AS ESTOQUE,' + #13#10 + 
           'P.NRQTDCONTAB  AS PEDIDO,P.DSUNIDADE    AS UNIDADE,' + #13#10 + 
           'P.DSEMBALAGEM  AS EMBALAGEM,P.NRPESO       AS PESO,' + #13#10 + 
           'G.NMGRUPO      AS GRUPO,P.CDPESSOA     AS FORNECEDOR,' + #13#10 + 
           'I.DSPROMOCAO,P.dsAtivo,P.dsCFOPD,P.dsCFOPF' + #13#10 + 
    'FROM ((GRUPO G WITH (nolock)' + #13#10 + 
         'INNER JOIN PRODUTO P WITH (nolock)     ON G.CDGRUPO = P.CDGRUPO AND NOT(P.DSTIPO_ITEM IN (''07'',''08'',''10'')))' + #13#10 + 
         'INNER JOIN PESSOA W WITH (nolock)      ON P.CDPESSOA_1 = W.CDPESSOA)' + #13#10 + 
         'INNER JOIN ITEPROMOCAO I WITH (nolock) ON P.CDPRODUTO = I.CDPRODUTO' + #13#10 + 
    'WHERE (I.DSPROMOCAO = ''S'' )' + #13#10 + 
          'AND( P.DSATIVO = @DSATIVO OR @DSATIVO IS NULL )' + #13#10 + 
          'AND (P.CDPRODUTO LIKE @CDPRODUTO +''%'' OR @CDPRODUTO IS NULL)' + #13#10 + 
          'AND (P.NMPRODUTO LIKE @NMPRODUTO +''%'' OR @NMPRODUTO IS NULL)' + #13#10 + 
          'AND (P.DSREFERENCIA LIKE @DSREFERENCIA +''%'' OR @DSREFERENCIA IS NULL)' + #13#10 + 
          'AND (P.CDCODIGODIC LIKE @CDCODIGODIC +''%'' OR @CDCODIGODIC IS NULL)' + #13#10 + 
          'AND (G.NMGRUPO LIKE @NMGRUPO +''%'' OR @NMGRUPO IS NULL)' + #13#10 + 
          'AND (P.NMPRODUTO LIKE ''%''+ @NMPRODUTO2 +''%'' OR @NMPRODUTO2 IS NULL)' + #13#10 + 
          'AND (P.CDFABRICANTE = @C_BARRAS OR @C_BARRAS IS NULL)' + #13#10 + 
    'ORDER BY P.CDCODIGODIC' + #13#10 + 
  'END' + #13#10 + 
  'IF @OPCAO = 4 AND @ATACADOVAREJO = ''A'' BEGIN' + #13#10 + 
    'SELECT DISTINCT P.CDPRODUTO AS CÓDIGO,P.CDFABRICANTE AS CÓDIGO_BARRAS,' + #13#10 + 
           'P.DSREFERENCIA AS REFERÊNCIA,P.NMPRODUTO    AS DESCRIÇÃO,' + #13#10 + 
           'W.NMPESSOA     AS FABRICANTE,P.VLATACADO    AS PRECO,' + #13#10 + 
           'P.VLATACADO    AS VALOR,P.CDCODIGODIC,' + #13#10 + 
           'P.DSPRATELEIRA AS PRATELEIRA,P.NRQTDREAL    AS ESTOQUE,' + #13#10 + 
           'P.NRQTDCONTAB  AS PEDIDO,P.DSUNIDADE    AS UNIDADE,' + #13#10 + 
           'P.DSEMBALAGEM  AS EMBALAGEM,P.NRPESO       AS PESO,' + #13#10 +
           'G.NMGRUPO      AS GRUPO,P.CDPESSOA     AS FORNECEDOR,' + #13#10 + 
           'I.DSPROMOCAO,P.dsAtivo,P.dsCFOPD,P.dsCFOPF' + #13#10 + 
    'FROM ((GRUPO G WITH (nolock)' + #13#10 + 
         'INNER JOIN PRODUTO P WITH (nolock)     ON G.CDGRUPO = P.CDGRUPO AND NOT(P.DSTIPO_ITEM IN (''07'',''08'',''10'')))' + #13#10 + 
         'INNER JOIN PESSOA W WITH (nolock)      ON P.CDPESSOA_1 = W.CDPESSOA)' + #13#10 + 
         'INNER JOIN ITEPROMOCAO I WITH (nolock) ON P.CDPRODUTO = I.CDPRODUTO' + #13#10 + 
         'INNER JOIN CODADICIONAL C ON P.CDPRODUTO = C.CDPRODUTO' + #13#10 + 
    'WHERE (I.DSPROMOCAO <> ''S'') AND (C.CDADICIONAL LIKE @NMGRUPO + ''%'' OR @NMGRUPO IS NULL)' + #13#10 + 
    'UNION ALL' + #13#10 + 
    'SELECT DISTINCT P.CDPRODUTO AS CÓDIGO,P.CDFABRICANTE AS CÓDIGO_BARRAS,' + #13#10 + 
           'P.DSREFERENCIA AS REFERÊNCIA,P.NMPRODUTO    AS DESCRIÇÃO,' + #13#10 + 
           'W.NMPESSOA     AS FABRICANTE,P.VLATACADO    AS PRECO,' + #13#10 + 
           'I.VLATACADO    AS VALOR,P.CDCODIGODIC,' + #13#10 + 
           'P.DSPRATELEIRA AS PRATELEIRA,P.NRQTDREAL    AS ESTOQUE,' + #13#10 + 
           'P.NRQTDCONTAB  AS PEDIDO,P.DSUNIDADE    AS UNIDADE,' + #13#10 + 
           'P.DSEMBALAGEM  AS EMBALAGEM,P.NRPESO       AS PESO,' + #13#10 + 
           'G.NMGRUPO      AS GRUPO,P.CDPESSOA     AS FORNECEDOR,' + #13#10 + 
           'I.DSPROMOCAO,P.dsAtivo,P.dsCFOPD,P.dsCFOPF' + #13#10 + 
    'FROM ((GRUPO G WITH (nolock)' + #13#10 + 
         'INNER JOIN PRODUTO P WITH (nolock)     ON G.CDGRUPO = P.CDGRUPO AND NOT(P.DSTIPO_ITEM IN (''07'',''08'',''10'')))' + #13#10 + 
         'INNER JOIN PESSOA W WITH (nolock)      ON P.CDPESSOA_1 = W.CDPESSOA)' + #13#10 + 
         'INNER JOIN ITEPROMOCAO I WITH (nolock) ON P.CDPRODUTO = I.CDPRODUTO' + #13#10 + 
         'INNER JOIN CODADICIONAL C ON P.CDPRODUTO = C.CDPRODUTO' + #13#10 + 
    'WHERE (I.DSPROMOCAO = ''S'') AND (C.CDADICIONAL LIKE @NMGRUPO + ''%'' OR @NMGRUPO IS NULL)' + #13#10 + 
    'ORDER BY  P.NMPRODUTO' + #13#10 + 
  'END' + #13#10 + 
  'IF @OPCAO = 6 AND @ATACADOVAREJO = ''A'' BEGIN' + #13#10 + 
    'SELECT P.CDPRODUTO    AS CÓDIGO,P.CDFABRICANTE AS CÓDIGO_BARRAS,' + #13#10 + 
           'P.DSREFERENCIA AS REFERÊNCIA,P.NMPRODUTO    AS DESCRIÇÃO,' + #13#10 + 
           'W.NMPESSOA     AS FABRICANTE,P.VLATACADO    AS PRECO,' + #13#10 + 
           'P.VLATACADO    AS VALOR,P.CDCODIGODIC,' + #13#10 + 
           'P.DSPRATELEIRA AS PRATELEIRA,P.NRQTDREAL    AS ESTOQUE,' + #13#10 + 
           'P.NRQTDCONTAB  AS PEDIDO,P.DSUNIDADE    AS UNIDADE,' + #13#10 + 
           'P.DSEMBALAGEM  AS EMBALAGEM,P.NRPESO       AS PESO,' + #13#10 + 
           'G.NMGRUPO      AS GRUPO,P.CDPESSOA     AS FORNECEDOR,' + #13#10 + 
           'I.DSPROMOCAO,P.dsAtivo,P.dsCFOPD,P.dsCFOPF' + #13#10 + 
   'FROM ((GRUPO G WITH (nolock)' + #13#10 + 
         'INNER JOIN PRODUTO P WITH (nolock)     ON G.CDGRUPO = P.CDGRUPO AND NOT(P.DSTIPO_ITEM IN (''07'',''08'',''10'')))' + #13#10 +
         'INNER JOIN PESSOA W WITH (nolock)      ON P.CDPESSOA_1 = W.CDPESSOA)' + #13#10 + 
         'INNER JOIN ITEPROMOCAO I WITH (nolock) ON P.CDPRODUTO = I.CDPRODUTO' + #13#10 + 
    'WHERE (I.DSPROMOCAO <> ''S'') AND(P.CDPRODUTO = @CDPRODUTO)' + #13#10 + 
          'OR (P.CDPRODUTO IN(SELECT CDSIMILAR FROM SIMILAR WHERE CDPRODUTO = @CDPRODUTO))' + #13#10 + 
          'OR (P.CDPRODUTO IN(SELECT CDPRODUTO FROM SIMILAR WHERE CDSIMILAR = @CDPRODUTO))' + #13#10 + 
    'UNION ALL' + #13#10 + 
    'SELECT P.CDPRODUTO    AS CÓDIGO,P.CDFABRICANTE AS CÓDIGO_BARRAS,' + #13#10 + 
           'P.DSREFERENCIA AS REFERÊNCIA,P.NMPRODUTO    AS DESCRIÇÃO,' + #13#10 + 
           'W.NMPESSOA     AS FABRICANTE,P.VLATACADO    AS PRECO,' + #13#10 + 
           'I.VLATACADO    AS VALOR,P.CDCODIGODIC,' + #13#10 + 
           'P.DSPRATELEIRA AS PRATELEIRA,P.NRQTDREAL    AS ESTOQUE,' + #13#10 + 
           'P.NRQTDCONTAB  AS PEDIDO,P.DSUNIDADE    AS UNIDADE,' + #13#10 + 
           'P.DSEMBALAGEM  AS EMBALAGEM,P.NRPESO       AS PESO,' + #13#10 + 
           'G.NMGRUPO      AS GRUPO,P.CDPESSOA     AS FORNECEDOR,' + #13#10 + 
           'I.DSPROMOCAO,P.dsAtivo,P.dsCFOPD,P.dsCFOPF' + #13#10 + 
    'FROM ((GRUPO G WITH (nolock)' + #13#10 + 
         'INNER JOIN PRODUTO P WITH (nolock)     ON G.CDGRUPO = P.CDGRUPO AND NOT(P.DSTIPO_ITEM IN (''07'',''08'',''10'')))' + #13#10 + 
         'INNER JOIN PESSOA W WITH (nolock)      ON P.CDPESSOA_1 = W.CDPESSOA)' + #13#10 + 
         'INNER JOIN ITEPROMOCAO I WITH (nolock) ON P.CDPRODUTO = I.CDPRODUTO' + #13#10 + 
    'WHERE (I.DSPROMOCAO = ''S'') AND(P.CDPRODUTO = @CDPRODUTO)' + #13#10 + 
          'OR (P.CDPRODUTO IN(SELECT CDSIMILAR FROM SIMILAR WHERE CDPRODUTO = @CDPRODUTO))' + #13#10 + 
          'OR (P.CDPRODUTO IN(SELECT CDPRODUTO FROM SIMILAR WHERE CDSIMILAR = @CDPRODUTO))' + #13#10 + 
    'ORDER BY  P.NMPRODUTO' + #13#10 + 
    'END' + #13#10 + 
    'IF @OPCAO = 7' + #13#10 + 
    'BEGIN' + #13#10 + 
   'SELECT  P.CDPRODUTO AS CÓDIGO,P.CDFABRICANTE AS CÓDIGO_BARRAS,P.DSREFERENCIA AS REFERÊNCIA,' + #13#10 + 
   'P.NMPRODUTO AS DESCRIÇÃO,W.NMPESSOA AS FABRICANTE,P.VLATACADO AS VALOR,P.VLPRECO AS PRECO,P.CDCODIGODIC,' + #13#10 + 
   'P.DSPRATELEIRA AS PRATELEIRA,P.NRQTDREAL AS ESTOQUE,P.NRQTDCONTAB AS PEDIDO,' + #13#10 + 
   'P.DSUNIDADE AS UNIDADE,P.DSEMBALAGEM AS EMBALAGEM,P.NRPESO AS PESO,G.NMGRUPO AS GRUPO,' + #13#10 + 
   'P.CDPESSOA AS FORNECEDOR,P.DSPROMOCAO,P.DSPROMOCAOVAREJO,P.NRQTDPROMOCAO,P.dsAtivo,P.dsCFOPD,P.dsCFOPF' + #13#10 + 
   'FROM 	LANCTO L WITH (NOLOCK)  INNER JOIN ITELCTO I WITH (NOLOCK)' + #13#10 + 
   'ON I.DSLANCAMENTO = L.DSLANCAMENTO' + #13#10 + 
   'AND I.CDPESSOA = L.CDPESSOA' + #13#10 + 
   'INNER JOIN PRODUTO P WITH (NOLOCK) ON P.CDPRODUTO = I.CDPRODUTO AND NOT(P.DSTIPO_ITEM IN (''07'',''08'',''10''))' + #13#10 + 
   'INNER JOIN GRUPO G WITH(nolock) ON G.CDGRUPO = P.CDGRUPO' + #13#10 + 
   'INNER JOIN PESSOA W WITH (NOLOCK) ON P.CDPESSOA_1 = W.CDPESSOA' + #13#10 + 
   'WHERE 	(L.DSSTATUS IN (''E'',''F'',''X''))' + #13#10 +
   'AND (I.DSSTATUS IN (''E'',''F'',''X''))' + #13#10 + 
   'AND (L.dsCancelado is null or L.dsCancelado in (''G'',''D''))' + #13#10 + 
   'AND L.DSLANCAMENTO = @LANCAMENTO' + #13#10 + 
   'AND L.CDPESSOA = @PESSOA' + #13#10 + 
   'AND (P.CDPRODUTO LIKE @CDPRODUTO +''%'' OR @CDPRODUTO IS NULL)' + #13#10 + 
   'AND (P.NMPRODUTO LIKE @NMPRODUTO +''%'' OR @NMPRODUTO IS NULL)' + #13#10 + 
   'AND (P.DSREFERENCIA LIKE @DSREFERENCIA +''%'' OR @DSREFERENCIA IS NULL)' + #13#10 + 
   'AND (P.CDCODIGODIC LIKE @CDCODIGODIC +''%'' OR @CDCODIGODIC IS NULL)' + #13#10 + 
   'AND (G.NMGRUPO LIKE @NMGRUPO +''%'' OR @NMGRUPO IS NULL)' + #13#10 + 
   'AND (P.NMPRODUTO LIKE ''%''+ @NMPRODUTO2 +''%'' OR @NMPRODUTO2 IS NULL)' + #13#10 + 
   'AND (P.CDFABRICANTE = @C_BARRAS OR @C_BARRAS IS NULL) AND I.DSCANCELADO IS NULL' + #13#10 + 
   'ORDER BY P.CDPRODUTO' + #13#10 + 
   'END';
    Execute;
  end;       }
end;

procedure TFrmPrincipalPreVenda.ImprimeEtiquetasJALVES_Grande;
var
  L : integer;
  Arq : TextFile;
  vQtd : real;
begin
  //if not CamposObrigatoriosPreenchidos(FrmPrincipalPreVenda) then exit;
  if SgDados.Cells[0,1] = '' then begin
    Messagedlg('Não foi lançado nenhum item para impressão das etiquetas!', mtWarning, [mbOk], 0);
    EdtConsulta.Setfocus;
    exit;
  end;
  if (Trim(EdtCdCliente.Text)<> '') and (Trim(EdtCdNome.Text) <> '') then
    SalvaEtiquetas;
  Editor.Lines.Clear;
  for L := 1 to SgDados.RowCount - 1 do begin // Salvando os itens da pré-venda.
    if SgDados.Cells[0,L] = '' then Break;
    Editor.Lines.Add('');
    Editor.Lines.Add('');
    Editor.Lines.Add('c0000');
    Editor.Lines.Add('KI503');
    Editor.Lines.Add('O0220');
    Editor.Lines.Add('f220');
    Editor.Lines.Add('KW0808');
    Editor.Lines.Add('KI7');
    Editor.Lines.Add('V0');
    Editor.Lines.Add('L');
    Editor.Lines.Add('H12');
    Editor.Lines.Add('PC');
    Editor.Lines.Add('A2');
    Editor.Lines.Add('D11');
    Editor.Lines.Add('1F4407600120090'+SgDados.Cells[6,L]+'');     //barra
    Editor.Lines.Add('192300101680102'+Trim(Copy(SgDados.Cells[1,L],1,19))+'');     //descricao
    Editor.Lines.Add('191100602000139'+'R$'+FormatFloat('0.00',strtofloat(SgDados.Cells[3,L]))+'');   //valor
    Editor.Lines.Add('191100501110145'+'Cod.'+SgDados.Cells[0,L]+''); //codigo
    Editor.Lines.Add('192200202360111'+'HIPER J. ALVES'); //codigo
    Editor.Lines.Add('192300101350102'+Trim(Copy(SgDados.Cells[1,L],20,40))+'');     //descricao
    // Cálculo para imprimir a qtd de etiquetas certo
    if Frac(StrToFloat(SgDados.Cells[2,L])/3) = 0.00 then
      vQtd := StrToFloat(SgDados.Cells[2,L])/3
    else vQtd := (StrToint(FormatFloat('0000',StrToFloat(SgDados.Cells[2,L]))) div 3) + 1;
    Editor.Lines.Add('^'+FormatFloat('0',vQtd));
    Editor.Lines.Add('Q'+FormatFloat('000',vQtd));
    Editor.Lines.Add('E');
  end;
  Editor.Lines.SaveToFile(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'etiqueta.txt')));
  WinExec(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'print2.bat')),sw_ShowNormal);
  if not FileExists('Print2.bat') then
    ShowMessage('Não foi encontrado o arquivo Print2.bat');
  Application.OnMessage := FormPrincipal.ProcessaMsg;
  Limpar_Tela;
  RgOpcoes.ItemIndex := 0;
  Messagedlg('Impressão ok!', mtInformation, [mbOk], 0);
end;

procedure TFrmPrincipalPreVenda.ImprimeEtiquetasDIEGOCUNHA_GONDOLA;
var L : integer;
    Arq : TextFile;
    vQtd : real;
begin
  //if not CamposObrigatoriosPreenchidos(FrmPrincipalPreVenda) then exit;
  if SgDados.Cells[0,1] = '' then begin
    Messagedlg('Não foi lançado nenhum item para impressão das etiquetas!', mtWarning, [mbOk], 0);
    EdtConsulta.Setfocus;
    exit;
  end;
  //if (Trim(EdtCdCliente.Text)<> '') and (Trim(EdtCdNome.Text) <> '') then
    //SalvaEtiquetas;
  Editor.Lines.Clear;
  for L := 1 to SgDados.RowCount - 1 do begin // Salvando os itens da pré-venda.
    if SgDados.Cells[0,L] = '' then Break;
//    Editor.Lines.Add('N');
//    Editor.Lines.Add('R0,0');
//    Editor.Lines.Add('ZB');
//    Editor.Lines.Add('I8,0,001');
//    Editor.Lines.Add('q840');
//    Editor.Lines.Add('JY0000Kf00D11');//    Editor.Lines.Add('S3');
//    Editor.Lines.Add('O');
//    Editor.Lines.Add('JB');
//    Editor.Lines.Add('JF');
//    Editor.Lines.Add('A144,36,0,4,1,1,N,"'+SgDados.Cells[1,L]+'"'); //descricao
//    Editor.Lines.Add('A438,178,0,3,1,1,N,"R$"');
//    Editor.Lines.Add('A476,178,0,5,1,1,N,"'+formatfloat('0.00',strtofloat(SgDados.Cells[3,L]))+'"'); //valor
//    Editor.Lines.Add('Q200,0');
    Editor.Lines.Add('N');
    Editor.Lines.Add('R0,0');
    Editor.Lines.Add('ZB');
    Editor.Lines.Add('I8,0,001');
    Editor.Lines.Add('q840');
    Editor.Lines.Add('JY0000Kf00D8');    Editor.Lines.Add('S3');
    Editor.Lines.Add('O');
    Editor.Lines.Add('JB');
    Editor.Lines.Add('JF');
    Editor.Lines.Add('A114,5,0,2,1,1,N,"'+'Codigo: '+SgDados.Cells[0,L]+'"'); //codigo
    Editor.Lines.Add('A114,25,0,1,2,2,N,"'+SgDados.Cells[1,L]+'"'); //descricao
//    Editor.Lines.Add('A114,42,0,4,1,1,N,"'+SgDados.Cells[10,L]+'"'); //unidade
    Editor.Lines.Add('A333,125,0,5,1,1,N,"R$"');
    Editor.Lines.Add('A405,81,0,5,1,2,N,"'+formatfloat('0.00',strtofloat(SgDados.Cells[3,L]))+'"'); //valor
//    Editor.Lines.Add('B110,70,0,1,3,6,95,N,"'+SgDados.Cells[6,L]+'"');//codigo de barras
//    Editor.Lines.Add('A207,169,0,3,1,1,N,"'+SgDados.Cells[6,L]+'"');
    Editor.Lines.Add('Q200,24');

    vQtd := StrToFloat(SgDados.Cells[2,L]);
    Editor.Lines.Add('P1,'+FormatFloat('0000',vQtd));
  end;
  Editor.Lines.SaveToFile(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'etiqueta.txt')));
  WinExec(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'print2.bat')),sw_ShowNormal);
  if not FileExists('Print2.bat') then
    ShowMessage('Não foi encontrado o arquivo Print2.bat');
  Application.OnMessage := FormPrincipal.ProcessaMsg;
  Limpar_Tela;
  RgOpcoes.ItemIndex := 0;
  Messagedlg('Impressão ok!', mtInformation, [mbOk], 0);
end;

procedure TFrmPrincipalPreVenda.ImprimeEtiquetasDIEGOCUNHA_3COLUNAS;
var
  L : integer;
  Arq : TextFile;
  vQtd : real;
begin
  //if not CamposObrigatoriosPreenchidos(FrmPrincipalPreVenda) then exit;
  if SgDados.Cells[0,1] = '' then begin
    Messagedlg('Não foi lançado nenhum item para impressão das etiquetas!', mtWarning, [mbOk], 0);
    EdtConsulta.Setfocus;
    exit;
  end;
  //if (Trim(EdtCdCliente.Text)<> '') and (Trim(EdtCdNome.Text) <> '') then
    //SalvaEtiquetas;
  Editor.Lines.Clear;
  for L := 1 to SgDados.RowCount - 1 do begin // Salvando os itens da pré-venda.
    if SgDados.Cells[0,L] = '' then Break;
    Editor.Lines.Add('N');
    Editor.Lines.Add('R0,0');
    Editor.Lines.Add('ZB');
    Editor.Lines.Add('I8,0,001');
    Editor.Lines.Add('q856');
    Editor.Lines.Add('JY0000Kf00D11');    Editor.Lines.Add('S3');
    Editor.Lines.Add('O');
    Editor.Lines.Add('JB');
    Editor.Lines.Add('B20,61,0,1,3,6,55,N,"'+SgDados.Cells[0,L]+'"'); //codigo
    Editor.Lines.Add('A16,0,0,2,1,1,N,"'+Copy(SgDados.Cells[1,L],1,20)+'"'); //descricao
    Editor.Lines.Add('A16,30,0,2,1,1,N,"'+Copy(SgDados.Cells[1,L],21,20)+'"'); //descricao
    Editor.Lines.Add('A16,121,0,2,1,1,N,"'+SgDados.Cells[0,L]+'"'); //codigo
    Editor.Lines.Add('A16,140,0,3,1,1,N,"'+'R$ '+formatfloat('0.00',strtofloat(SgDados.Cells[3,L]))+'"'); //valor

    Editor.Lines.Add('B300,61,0,1,3,6,55,N,"'+SgDados.Cells[0,L]+'"'); //codigo
    Editor.Lines.Add('A296,0,0,2,1,1,N,"'+Copy(SgDados.Cells[1,L],1,20)+'"'); //descricao
    Editor.Lines.Add('A296,30,0,2,1,1,N,"'+Copy(SgDados.Cells[1,L],21,20)+'"'); //descricao
    Editor.Lines.Add('A296,121,0,2,1,1,N,"'+SgDados.Cells[0,L]+'"'); //codigo
    Editor.Lines.Add('A296,140,0,3,1,1,N,"'+'R$ '+formatfloat('0.00',strtofloat(SgDados.Cells[3,L]))+'"'); //valor
    Editor.Lines.Add('JF');

    Editor.Lines.Add('B579,61,0,1,3,6,55,N,"'+SgDados.Cells[0,L]+'"'); //codigo
    Editor.Lines.Add('A575,0,0,2,1,1,N,"'+Copy(SgDados.Cells[1,L],1,20)+'"'); //descricao
    Editor.Lines.Add('A575,30,0,2,1,1,N,"'+Copy(SgDados.Cells[1,L],21,20)+'"'); //descricao
    Editor.Lines.Add('A575,121,0,2,1,1,N,"'+SgDados.Cells[0,L]+'"'); //codigo
    Editor.Lines.Add('A575,140,0,3,1,1,N,"'+'R$ '+formatfloat('0.00',strtofloat(SgDados.Cells[3,L]))+'"'); //valor

    Editor.Lines.Add('Q176,24');

    // Cálculo para imprimir a qtd de etiquetas certo
    if Frac(StrToFloat(SgDados.Cells[2,L])/3) = 0.00 then
      vQtd := StrToFloat(SgDados.Cells[2,L])/3
    else
      vQtd := (StrToint(FormatFloat('0000',StrToFloat(SgDados.Cells[2,L]))) div 3) + 1;

//    vQtd := StrToFloat(SgDados.Cells[2,L]);
    Editor.Lines.Add('P1,'+FormatFloat('0000',vQtd));
  end;
  Editor.Lines.SaveToFile(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'etiqueta.txt')));
  WinExec(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'print2.bat')),sw_ShowNormal);
  if not FileExists('Print2.bat') then
    ShowMessage('Não foi encontrado o arquivo Print2.bat');
  Application.OnMessage := FormPrincipal.ProcessaMsg;
  Limpar_Tela;
  RgOpcoes.ItemIndex := 0;
  Messagedlg('Impressão ok!', mtInformation, [mbOk], 0);
end;

procedure TFrmPrincipalPreVenda.ImprimeEtiquetasAquarium;
var
  L : integer;
  Arq : TextFile;
  vQtd : real;
begin
  //if not CamposObrigatoriosPreenchidos(FrmPrincipalPreVenda) then exit;
  if SgDados.Cells[0,1] = '' then begin
    Messagedlg('Não foi lançado nenhum item para impressão das etiquetas!', mtWarning, [mbOk], 0);
    EdtConsulta.Setfocus;
    exit;
  end;
//  if (Trim(EdtCdCliente.Text)<> '') and (Trim(EdtCdNome.Text) <> '') then
//    SalvaEtiquetas;
  Editor.Lines.Clear;
  for L := 1 to SgDados.RowCount - 1 do begin // Salvando os itens da pré-venda.
    if SgDados.Cells[0,L] = '' then Break;
    Editor.Lines.Add('<xpml><page quantity=''0'' pitch=''20.0 mm''></xpml>n');
    Editor.Lines.Add('M0500');
    Editor.Lines.Add('O0220');
    Editor.Lines.Add('V0');
    Editor.Lines.Add('f220');
    Editor.Lines.Add('D');
    Editor.Lines.Add('<xpml></page></xpml><xpml><page quantity=''1'' pitch=''20.0 mm''></xpml>L');
    Editor.Lines.Add('D11');
    Editor.Lines.Add('A2');
    Editor.Lines.Add('1911A0600680015'+Copy(Trim(SgDados.Cells[1,L]),1,19));
    Editor.Lines.Add('1911A0600590015'+Copy(Trim(SgDados.Cells[1,L]),20,40));
    Editor.Lines.Add('1911A0800400015R$'+FormatFloat('0.00',strtofloat(SgDados.Cells[3,L])));
    Editor.Lines.Add('1f4202800120020'+SgDados.Cells[6,L]);
    Editor.Lines.Add('1911A0600020012'+Copy(SgDados.Cells[6,L],1,1)); //coloquei essa linha para testar o cod barras - kenneth
    Editor.Lines.Add('1911A0600020025'+Copy(SgDados.Cells[6,L],2,1));
    Editor.Lines.Add('1911A0600020032'+Copy(SgDados.Cells[6,L],3,1));
    Editor.Lines.Add('1911A0600020039'+Copy(SgDados.Cells[6,L],4,1));
    Editor.Lines.Add('1911A0600020046'+Copy(SgDados.Cells[6,L],5,1));
    Editor.Lines.Add('1911A0600020053'+Copy(SgDados.Cells[6,L],6,1));
    Editor.Lines.Add('1911A0600020060'+Copy(SgDados.Cells[6,L],7,1));
    Editor.Lines.Add('1911A0600020070'+Copy(SgDados.Cells[6,L],8,1));
    Editor.Lines.Add('1911A0600020077'+Copy(SgDados.Cells[6,L],9,1));
    Editor.Lines.Add('1911A0600020084'+Copy(SgDados.Cells[6,L],10,1));
    Editor.Lines.Add('1911A0600020091'+Copy(SgDados.Cells[6,L],11,1));
    Editor.Lines.Add('1911A0600020099'+Copy(SgDados.Cells[6,L],12,1));
    Editor.Lines.Add('1911A0600020105'+Copy(SgDados.Cells[6,L],13,1));
//    Editor.Lines.Add('1911A0600020012'+Copy(SgDados.Cells[6,L],1,1));   //comentei essa linha
    Editor.Lines.Add('1911A0600680158'+Copy(Trim(SgDados.Cells[1,L]),1,19));
    Editor.Lines.Add('1911A0600590158'+Copy(Trim(SgDados.Cells[1,L]),20,40));
    Editor.Lines.Add('1f4202800120164'+SgDados.Cells[6,L]);
    Editor.Lines.Add('1911A0600020155'+Copy(SgDados.Cells[6,L],1,1)); //coloquei
    Editor.Lines.Add('1911A0600020168'+Copy(SgDados.Cells[6,L],2,1));
    Editor.Lines.Add('1911A0600020175'+Copy(SgDados.Cells[6,L],3,1));
    Editor.Lines.Add('1911A0600020182'+Copy(SgDados.Cells[6,L],4,1));
    Editor.Lines.Add('1911A0600020190'+Copy(SgDados.Cells[6,L],5,1));
    Editor.Lines.Add('1911A0600020197'+Copy(SgDados.Cells[6,L],6,1));
    Editor.Lines.Add('1911A0600020203'+Copy(SgDados.Cells[6,L],7,1));
    Editor.Lines.Add('1911A0600020214'+Copy(SgDados.Cells[6,L],8,1));
    Editor.Lines.Add('1911A0600020221'+Copy(SgDados.Cells[6,L],9,1));
    Editor.Lines.Add('1911A0600020228'+Copy(SgDados.Cells[6,L],10,1));
    Editor.Lines.Add('1911A0600020234'+Copy(SgDados.Cells[6,L],11,1));
    Editor.Lines.Add('1911A0600020242'+Copy(SgDados.Cells[6,L],12,1));
    Editor.Lines.Add('1911A0600020249'+Copy(SgDados.Cells[6,L],13,1));
//    Editor.Lines.Add('1911A0600020155'+Copy(SgDados.Cells[6,L],1,1));  //comentei
    Editor.Lines.Add('1911A0600680299'+Copy(Trim(SgDados.Cells[1,L]),1,19));
    Editor.Lines.Add('1911A0600590299'+Copy(Trim(SgDados.Cells[1,L]),20,40));
    Editor.Lines.Add('1f4202800120308'+SgDados.Cells[6,L]);
    Editor.Lines.Add('1911A0600020299'+Copy(SgDados.Cells[6,L],1,1));//coloquei essa linha
    Editor.Lines.Add('1911A0600020312'+Copy(SgDados.Cells[6,L],2,1));
    Editor.Lines.Add('1911A0600020319'+Copy(SgDados.Cells[6,L],3,1));
    Editor.Lines.Add('1911A0600020326'+Copy(SgDados.Cells[6,L],4,1));
    Editor.Lines.Add('1911A0600020334'+Copy(SgDados.Cells[6,L],5,1));
    Editor.Lines.Add('1911A0600020340'+Copy(SgDados.Cells[6,L],6,1));
    Editor.Lines.Add('1911A0600020348'+Copy(SgDados.Cells[6,L],7,1));
    Editor.Lines.Add('1911A0600020358'+Copy(SgDados.Cells[6,L],8,1));
    Editor.Lines.Add('1911A0600020365'+Copy(SgDados.Cells[6,L],9,1));
    Editor.Lines.Add('1911A0600020371'+Copy(SgDados.Cells[6,L],10,1));
    Editor.Lines.Add('1911A0600020378'+Copy(SgDados.Cells[6,L],11,1));
    Editor.Lines.Add('1911A0600020386'+Copy(SgDados.Cells[6,L],12,1));
    Editor.Lines.Add('1911A0600020393'+Copy(SgDados.Cells[6,L],13,1));
//    Editor.Lines.Add('1911A0600020299'+Copy(SgDados.Cells[6,L],1,1)); //comentei
    Editor.Lines.Add('1911A0800400158R$'+FormatFloat('0.00',strtofloat(SgDados.Cells[3,L])));
    Editor.Lines.Add('1911A0800400300R$'+FormatFloat('0.00',strtofloat(SgDados.Cells[3,L])));
    Editor.Lines.Add('1Y1100000360060PB1');
    Editor.Lines.Add('1Y1100000360205PB1');
    Editor.Lines.Add('1Y1100000360346PB1');
    // Cálculo para imprimir a qtd de etiquetas certo
    vQtd := StrToFloat(SgDados.Cells[2,L]);
    Editor.Lines.Add('^'+FormatFloat('0',vQtd));
    Editor.Lines.Add('Q'+FormatFloat('000',vQtd));
    Editor.Lines.Add('E');
    Editor.Lines.Add('<xpml></page></xpml><xpml><end/></xpml>');
  end;
  Editor.Lines.SaveToFile(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'etiqueta.txt')));
  WinExec(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'print2.bat')),sw_ShowNormal);
  if not FileExists('Print2.bat') then
    ShowMessage('Não foi encontrado o arquivo Print2.bat');
  Application.OnMessage := FormPrincipal.ProcessaMsg;
  Limpar_Tela;
  RgOpcoes.ItemIndex := 0;
  Messagedlg('Impressão ok!', mtInformation, [mbOk], 0);
end;

procedure TFrmPrincipalPreVenda.ImprimeEtiquetasDulalar;
var
  L : integer;
  Arq : TextFile;
  vQtd : real;
begin
  //if not CamposObrigatoriosPreenchidos(FrmPrincipalPreVenda) then exit;
  if SgDados.Cells[0,1] = '' then begin
    Messagedlg('Não foi lançado nenhum item para impressão das etiquetas!', mtWarning, [mbOk], 0);
    EdtConsulta.Setfocus;
    exit;
  end;
//  if (Trim(EdtCdCliente.Text)<> '') and (Trim(EdtCdNome.Text) <> '') then
//    SalvaEtiquetas;
  Editor.Lines.Clear;
  for L := 1 to SgDados.RowCount - 1 do begin // Salvando os itens da pré-venda.
    if SgDados.Cells[0,L] = '' then Break;
    Editor.Lines.Add('');
    Editor.Lines.Add('');
    Editor.Lines.Add('c0000');
    Editor.Lines.Add('KI503');
    Editor.Lines.Add('O0220');
    Editor.Lines.Add('f220');
    Editor.Lines.Add('KW0425');
    Editor.Lines.Add('KI7');
    Editor.Lines.Add('V0');
    Editor.Lines.Add('L');
    Editor.Lines.Add('H12');
    Editor.Lines.Add('PC');
    Editor.Lines.Add('A2');
    Editor.Lines.Add('D11');
    Editor.Lines.Add('131100000810028'+Trim(SgDados.Cells[1,L])+'');     //descricao
    Editor.Lines.Add('131100000600028COD.:'+SgDados.Cells[0,L]+''); //codigo
    Editor.Lines.Add('1F4405300010209'+SgDados.Cells[6,L]+'');     //barra
    Editor.Lines.Add('141100000330028R$.:'+FormatFloat('0.00',strtofloat(SgDados.Cells[3,L]))+'');   //valor
    // Cálculo para imprimir a qtd de etiquetas certo
    vQtd := StrToFloat(SgDados.Cells[2,L]);
    Editor.Lines.Add('^'+FormatFloat('0',vQtd));
    Editor.Lines.Add('Q'+FormatFloat('000',vQtd));
    Editor.Lines.Add('E');
  end;
  Editor.Lines.SaveToFile(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'etiqueta.txt')));
  WinExec(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'print2.bat')),sw_ShowNormal);
  if not FileExists('Print2.bat') then
    ShowMessage('Não foi encontrado o arquivo Print2.bat');
  Application.OnMessage := FormPrincipal.ProcessaMsg;
  Limpar_Tela;
  RgOpcoes.ItemIndex := 0;
  Messagedlg('Impressão ok!', mtInformation, [mbOk], 0);
end;

procedure TFrmPrincipalPreVenda.ImprimeEtiquetasJALVES_Gondola;
var
  L : integer;
  Arq : TextFile;
  vQtd : real;
begin
  //if not CamposObrigatoriosPreenchidos(FrmPrincipalPreVenda) then exit;
  if SgDados.Cells[0,1] = '' then begin
    Messagedlg('Não foi lançado nenhum item para impressão das etiquetas!', mtWarning, [mbOk], 0);
    EdtConsulta.Setfocus;
    exit;
  end;
  if (Trim(EdtCdCliente.Text)<> '') and (Trim(EdtCdNome.Text) <> '') then
    SalvaEtiquetas;
  Editor.Lines.Clear;
  for L := 1 to SgDados.RowCount - 1 do begin // Salvando os itens da pré-venda.
    if SgDados.Cells[0,L] = '' then Break;
    Editor.Lines.Add('');
    Editor.Lines.Add('');
    Editor.Lines.Add('c0000');
    Editor.Lines.Add('KI503');
    Editor.Lines.Add('O0220');
    Editor.Lines.Add('f220');
    Editor.Lines.Add('KW0416');
    Editor.Lines.Add('KI7');
    Editor.Lines.Add('V0');
    Editor.Lines.Add('L');
    Editor.Lines.Add('H12');
    Editor.Lines.Add('PC');
    Editor.Lines.Add('A2');
    Editor.Lines.Add('D11');
    Editor.Lines.Add('1F3302500070118'+SgDados.Cells[6,L]+'');     //barra
    Editor.Lines.Add('191100400750034'+Trim(Copy(SgDados.Cells[1,L],1,19))+'');     //descricao
    Editor.Lines.Add('191100500410036'+'R$'+FormatFloat('0.00',strtofloat(SgDados.Cells[3,L]))+'');   //valor
    Editor.Lines.Add('191100300610035'+'Cod.'+SgDados.Cells[0,L]+''); //codigo
    Editor.Lines.Add('191100400890139'+'HIPER J. ALVES'); //codigo
    // Cálculo para imprimir a qtd de etiquetas certo
    if Frac(StrToFloat(SgDados.Cells[2,L])/3) = 0.00 then
      vQtd := StrToFloat(SgDados.Cells[2,L])/3
    else vQtd := (StrToint(FormatFloat('0000',StrToFloat(SgDados.Cells[2,L]))) div 3) + 1;
    Editor.Lines.Add('^'+FormatFloat('0',vQtd));
    Editor.Lines.Add('Q'+FormatFloat('000',vQtd));
    Editor.Lines.Add('E');
  end;
  Editor.Lines.SaveToFile(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'etiqueta.txt')));
  WinExec(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'print2.bat')),sw_ShowNormal);
  if not FileExists('Print2.bat') then
    ShowMessage('Não foi encontrado o arquivo Print2.bat');
  Application.OnMessage := FormPrincipal.ProcessaMsg;
  Limpar_Tela;
  RgOpcoes.ItemIndex := 0;
  Messagedlg('Impressão ok!', mtInformation, [mbOk], 0);
end;

procedure TFrmPrincipalPreVenda.ImprimeEtiquetasJALVES_Pequena;
var
  L : integer;
  Arq : TextFile;
  vQtd : real;
begin
  //if not CamposObrigatoriosPreenchidos(FrmPrincipalPreVenda) then exit;
  if SgDados.Cells[0,1] = '' then begin
    Messagedlg('Não foi lançado nenhum item para impressão das etiquetas!', mtWarning, [mbOk], 0);
    EdtConsulta.Setfocus;
    exit;
  end;
  if (Trim(EdtCdCliente.Text)<> '') and (Trim(EdtCdNome.Text) <> '') then
    SalvaEtiquetas;
  Editor.Lines.Clear;
  for L := 1 to SgDados.RowCount - 1 do begin // Salvando os itens da pré-venda.
    if SgDados.Cells[0,L] = '' then Break;
    Editor.Lines.Add('');
    Editor.Lines.Add('');
    Editor.Lines.Add('c0000');
    Editor.Lines.Add('KI503');
    Editor.Lines.Add('O0220');
    Editor.Lines.Add('f220');
    Editor.Lines.Add('KW0475');
    Editor.Lines.Add('KI7');
    Editor.Lines.Add('V0');
    Editor.Lines.Add('L');
    Editor.Lines.Add('H09');
    Editor.Lines.Add('PC');
    Editor.Lines.Add('A2');
    Editor.Lines.Add('D11');
    Editor.Lines.Add('1F2201500050011'+SgDados.Cells[6,L]+'');     //barra
    Editor.Lines.Add('121100000600006'+Trim(Copy(SgDados.Cells[1,L],1,19))+'');     //descricao
    Editor.Lines.Add('121100000490006'+Trim(Copy(SgDados.Cells[1,L],20,40))+'');     //descricao
    Editor.Lines.Add('121100000610150'+Trim(Copy(SgDados.Cells[1,L],1,19))+'');     //descricao
    Editor.Lines.Add('121100000510150'+Trim(Copy(SgDados.Cells[1,L],20,40))+'');     //descricao
    Editor.Lines.Add('121100000610293'+Trim(Copy(SgDados.Cells[1,L],1,19))+'');     //descricao
    Editor.Lines.Add('121100000510293'+Trim(Copy(SgDados.Cells[1,L],20,40))+'');     //descricao
    Editor.Lines.Add('1F2201500050151'+SgDados.Cells[6,L]+'');     //barra
    Editor.Lines.Add('1F2201500050295'+SgDados.Cells[6,L]+'');     //barra
    Editor.Lines.Add('121100000380005'+'R$'+FormatFloat('0.00',strtofloat(SgDados.Cells[3,L]))+'');   //valor
    Editor.Lines.Add('121100000390150'+'R$'+FormatFloat('0.00',strtofloat(SgDados.Cells[3,L]))+'');   //valor
    Editor.Lines.Add('121100000390293'+'R$'+FormatFloat('0.00',strtofloat(SgDados.Cells[3,L]))+'');   //valor
    Editor.Lines.Add('111100000300006'+'Cod.'+SgDados.Cells[0,L]+''); //codigo
    Editor.Lines.Add('111100000310150'+'Cod.'+SgDados.Cells[0,L]+''); //codigo
    Editor.Lines.Add('111100000300293'+'Cod.'+SgDados.Cells[0,L]+''); //codigo
    Editor.Lines.Add('121100000750015'+'HIPER J. ALVES'); //codigo
    Editor.Lines.Add('121100000750160'+'HIPER J. ALVES'); //codigo
    Editor.Lines.Add('121100000750304'+'HIPER J. ALVES'); //codigo
    // Cálculo para imprimir a qtd de etiquetas certo
    if Frac(StrToFloat(SgDados.Cells[2,L])/3) = 0.00 then
      vQtd := StrToFloat(SgDados.Cells[2,L])/3
    else vQtd := (StrToint(FormatFloat('0000',StrToFloat(SgDados.Cells[2,L]))) div 3) + 1;
    Editor.Lines.Add('^'+FormatFloat('0',vQtd));
    Editor.Lines.Add('Q'+FormatFloat('000',vQtd));
    Editor.Lines.Add('E');
  end;
  Editor.Lines.SaveToFile(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'etiqueta.txt')));
  WinExec(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'print2.bat')),sw_ShowNormal);
  if not FileExists('Print2.bat') then
    ShowMessage('Não foi encontrado o arquivo Print2.bat');
  Application.OnMessage := FormPrincipal.ProcessaMsg;
  Limpar_Tela;
  RgOpcoes.ItemIndex := 0;
  Messagedlg('Impressão ok!', mtInformation, [mbOk], 0);
end;

procedure TFrmPrincipalPreVenda.Visualizarapelidodocliente1Click(
  Sender: TObject);
begin
  if Length( EdtCdCliente.Text ) = 0 then
    exit;
  with DModulo.ADOQuery1 do
  begin
    Sql.Text := 'SELECT dsNaturalidade FROM P_Fisica WITH (NOLOCK) WHERE cdPessoa = :CODIGO';
    Parameters.ParamByName('CODIGO').Value := EdtCdCliente.Text;
    open;
    if (DModulo.ADOQuery1.RecordCount > 0) and (trim(DModulo.ADOQuery1.FieldByname('dsNaturalidade').AsString) <> '') then
      ShowMessage('O apelido do cliente é: '+#13#10+ DModulo.ADOQuery1.FieldByname('dsNaturalidade').AsString)
    else
    begin
      Sql.Text := 'SELECT nmContato FROM P_juridica WITH (NOLOCK) WHERE cdPessoa = :CODIGO';
      Parameters.ParamByName('CODIGO').Value := EdtCdCliente.Text;
      open;
      if (DModulo.ADOQuery1.RecordCount > 0) and (trim(DModulo.ADOQuery1.FieldByname('nmContato').AsString) <> '') then
        ShowMessage('O apelido do cliente é: '+#13#10+ DModulo.ADOQuery1.FieldByname('nmContato').AsString)
      else
        ShowMessage('O apelido do cliente não encontrado!');
    end;
  end;
end;

procedure TFrmPrincipalPreVenda.Voltarparaotemaoriginal1Click(
  Sender: TObject);
begin
  {if SkinData1.Active then
     SkinData1.Active := False
  else SkinData1.Active := True;}
end;

procedure TFrmPrincipalPreVenda.ImprimeEtiquetasCaribe;
var
  L,y : integer;
  Arq : TextFile;
  vQtd : real;
  cont : integer;
  imprimir_Com_Preco: boolean;
  qry: TAdoQuery;
  function BuscaPeso(qry: TAdoQuery; cdProduto:integer):real;
  begin
    with qry do
    begin
      sql.text := 'select nrPeso from produto with(nolock) where cdProduto = :cdProduto ';
      parameters.ParamByName('cdProduto').value := cdProduto;
      open;
      result := fieldByName('nrPeso').asFloat;
      close;
    end;
  end;
begin
  //if not CamposObrigatoriosPreenchidos(FrmPrincipalPreVenda) then exit;
  if SgDados.Cells[0,1] = '' then
  begin
    Messagedlg('Não foi lançado nenhum item para impressão das etiquetas!', mtWarning, [mbOk], 0);
    EdtConsulta.Setfocus;
    exit;
  end;
  //if (Trim(EdtCdCliente.Text)<> '') and (Trim(EdtCdNome.Text) <> '') then
  if Application.MessageBox('Imprimir etiqueta com o Preço? (SIM) ou com o Peso? (NAO)','Confirmação', MB_YESNO + MB_ICONQUESTION + MB_APPLMODAL) = id_yes then
    imprimir_Com_Preco := true;

  if not imprimir_Com_Preco then begin
    qry := TAdoQuery.create(nil);
    qry.Connection := DModulo.Conexao;
  end;
    //SalvaEtiquetas;
  cont := 0; 
  for L := 1 to SgDados.RowCount - 1 do begin // Salvando os itens da pré-venda.
    if SgDados.Cells[0,L] = '' then Break;
    cont := cont + 1;
  end;
  if Frac(cont/3) = 0.00 then
    vQtd := cont/3
  else
    vQtd := (StrToint(FormatFloat('0000',cont)) div 3) + 1;
  cont := Trunc(vQtd);
  if cont <= 0 then cont := 1;
  Editor.Lines.Clear;
  L := 1;
  for y:= 1 to cont do begin // Salvando os itens da pré-venda.
    //if SgDados.Cells[0,L] = '' then Break;

    Editor.Lines.Add('c0000');
    Editor.Lines.Add('KI503');
    Editor.Lines.Add('O0220');
    Editor.Lines.Add('f220');
    Editor.Lines.Add('KW0394');
    Editor.Lines.Add('KI7');
    Editor.Lines.Add('V0');
    Editor.Lines.Add('L');
    Editor.Lines.Add('H12');
    Editor.Lines.Add('PC');
    Editor.Lines.Add('A2');
    Editor.Lines.Add('D11');
    if SgDados.Cells[1,L+2] <> '' then
      Editor.Lines.Add('211100000540363KARIB')
    else
      Editor.Lines.Add('211100000540363');
    if SgDados.Cells[1,L+1] <> '' then
      Editor.Lines.Add('211100000540233KARIB')
    else
      Editor.Lines.Add('211100000540233KARIB');
    if SgDados.Cells[1,L+2] <> '' then begin //barras
      //Editor.Lines.Add('^BY2,3,62^FT627,149^BCB,,Y,N');
      Editor.Lines.Add('221100000600326'+formatfloat('000000',strtofloatDef(SgDados.Cells[0,L+2],0)));  //barra
      Editor.Lines.Add('4d6302300040361'+formatfloat('000000',strtofloatDef(SgDados.Cells[0,L+2],0)));  //barra
    end;
    if SgDados.Cells[1,L+2] <> '' then
      Editor.Lines.Add('1X1100000060320l00010077'); //palito

    if imprimir_Com_Preco then
      Editor.Lines.Add('421100000400313'+SgDados.Cells[3,L+2])
    else if SgDados.Cells[0,L+2] <> '' then
      Editor.Lines.Add('421100000400313'+FormatFloat('0.00',BuscaPeso(qry,StrToIntDef(SgDados.Cells[0,L+2],0))));
    Editor.Lines.Add('211100000540103KARIB');
    ADOVarejo.Close;
    ADOVarejo.Parameters.ParamByName('cdProduto').Value := StrToIntDef(SgDados.Cells[0,L+2],0);
    ADOVarejo.Open;

    if imprimir_Com_Preco then //só mostra a ref. se for imprimir com peso
      if SgDados.Cells[1,L+2] <> '' then
        Editor.Lines.Add('421100000220300REF.'+ SoNumeros(FormatFloat('0.00',strtofloatDef(ADOVarejo.fieldByName('vlAtacado').AsString,0))))
      else
        Editor.Lines.Add('421100000220300');
    if SgDados.Cells[1,L+1] <> '' then begin
      //Editor.Lines.Add('^BY2,3,62^FT371,149^BCB,,Y,N');
      Editor.Lines.Add('221100000590196'+formatfloat('000000',StrToFloatDef(SgDados.Cells[0,L+1],0)));  //barra
      Editor.Lines.Add('4d6302300040232'+formatfloat('000000',StrToFloatDef(SgDados.Cells[0,L+1],0)));  //barra
    end;
    Editor.Lines.Add('411100000030273'+Trim(Copy(SgDados.Cells[1,L+2],1,18)));
    if SgDados.Cells[1,L+1] <> '' then //palito
      Editor.Lines.Add('1X1100000060191l00010077');
    Editor.Lines.Add('411100000030282'+Trim(Copy(SgDados.Cells[1,L+2],18,18)));
    if imprimir_Com_Preco then
      Editor.Lines.Add('421100000400185'+SgDados.Cells[3,L+1])
    else if SgDados.Cells[0,L+1] <> '' then
      Editor.Lines.Add('421100000400185'+FormatFloat('0.00',BuscaPeso(qry,StrToIntDef(SgDados.Cells[0,L+1],0))));
    Editor.Lines.Add('1X1100000060060l00010077'); //palito
    ADOVarejo.Close;
    ADOVarejo.Parameters.ParamByName('cdProduto').Value := StrToIntDef(SgDados.Cells[0,L+1],0);
    ADOVarejo.Open;
    if imprimir_Com_Preco then //só mostra a ref. se for imprimir com peso
      if SgDados.Cells[1,L+1] <> '' then
        Editor.Lines.Add('421100000220172REF.'+ SoNumeros(FormatFloat('0.00',strtofloatDef(ADOVarejo.fieldByName('vlAtacado').AsString,0))))
      else
        Editor.Lines.Add('421100000220172');
    //Editor.Lines.Add('^BY2,3,62^FT107,150^BCB,,Y,N');
    Editor.Lines.Add('221100000610066'+formatfloat('000000',StrToFloatDef(SgDados.Cells[0,L],0)));  //barra
    Editor.Lines.Add('4d6302300040102'+formatfloat('000000',StrToFloatDef(SgDados.Cells[0,L],0)));  //barra
    Editor.Lines.Add('411100000030146'+Trim(Copy(SgDados.Cells[1,L+1],1,18)));
    if imprimir_Com_Preco then
      Editor.Lines.Add('421100000400054'+SgDados.Cells[3,L])
    else if SgDados.Cells[0,L] <> '' then
      Editor.Lines.Add('421100000400054'+FormatFloat('0.00',BuscaPeso(qry,StrToIntDef(SgDados.Cells[0,L],0))));
    Editor.Lines.Add('411100000030155'+Trim(Copy(SgDados.Cells[1,L+1],18,18)));
    ADOVarejo.Close;
    ADOVarejo.Parameters.ParamByName('cdProduto').Value := StrToIntDef(SgDados.Cells[0,L],0);
    ADOVarejo.Open;
    if imprimir_Com_Preco then //só mostra a ref. se for imprimir com peso
      Editor.Lines.Add('421100000220042REF.'+ SoNumeros(FormatFloat('0.00',strtofloatDef(ADOVarejo.fieldByName('vlAtacado').AsString,0))));
    Editor.Lines.Add('411100000030015'+Trim(Copy(SgDados.Cells[1,L],1,18)));
    Editor.Lines.Add('411100000030024'+Trim(Copy(SgDados.Cells[1,L],18,18)));
    //Editor.Lines.Add('^PQ1,0,1,Y^XZ');
    // Cálculo para imprimir a qtd de etiquetas certo
    if Frac(StrToFloatdef(SgDados.Cells[2,L],0)/3) = 0.00 then
      vQtd := StrToFloatdef(SgDados.Cells[2,L],0)/3
    else vQtd := (StrToint(FormatFloat('0000',StrToFloat(SgDados.Cells[2,L]))) div 3) + 1;
    Editor.Lines.Add('^01');   //FloatToStr(vQtd)  no lugar do '1'
    Editor.Lines.Add('Q0001');
    Editor.Lines.Add('E');
    L := L +3;
  end;
  Editor.Lines.SaveToFile(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'etiqueta.txt')));
  WinExec(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'print2.bat')),sw_ShowNormal);
  if not FileExists('Print2.bat') then begin
    ShowMessage('Não foi encontrado o arquivo Print.bat');
    exit;
  end;
  Application.OnMessage := FormPrincipal.ProcessaMsg;
  Limpar_Tela;
  RgOpcoes.ItemIndex := 0;
  freeandnil(qry);
  Messagedlg('Impressão ok!', mtInformation, [mbOk], 0);
end;

procedure TFrmPrincipalPreVenda.ImprimeEtiquetasCaribe2;
var
  L,y : integer;
  Arq : TextFile;
  vQtd : real;
  cont : integer;
  imprimir_Com_Preco: boolean;
  qry: TAdoQuery;
  function BuscaPeso(qry: TAdoQuery; cdProduto:integer):real;
  begin
    with qry do
    begin
      sql.text := 'select nrPeso from produto with(nolock) where cdProduto = :cdProduto ';
      parameters.ParamByName('cdProduto').value := cdProduto;
      open;
      result := fieldByName('nrPeso').asFloat;
      close;
    end;
  end;
begin
  //if not CamposObrigatoriosPreenchidos(FrmPrincipalPreVenda) then exit;
  if SgDados.Cells[0,1] = '' then
  begin
    Messagedlg('Não foi lançado nenhum item para impressão das etiquetas!', mtWarning, [mbOk], 0);
    EdtConsulta.Setfocus;
    exit;
  end;
  //if (Trim(EdtCdCliente.Text)<> '') and (Trim(EdtCdNome.Text) <> '') then
  if Application.MessageBox('Imprimir etiqueta com o Preço? (SIM) ou com o Peso? (NAO)','Confirmação', MB_YESNO + MB_ICONQUESTION + MB_APPLMODAL) = id_yes then
    imprimir_Com_Preco := true;

  if not imprimir_Com_Preco then begin
    qry := TAdoQuery.create(nil);
    qry.Connection := DModulo.Conexao;
  end;
    //SalvaEtiquetas;
  cont := 0;
  for L := 1 to SgDados.RowCount - 1 do begin // Salvando os itens da pré-venda.
    if SgDados.Cells[0,L] = '' then Break;
    cont := cont + 1;
  end;

  if cont <= 0 then cont := 1;
  Editor.Lines.Clear;
  L := 1;
  for y:= 1 to cont do begin // Salvando os itens da pré-venda.
    //if SgDados.Cells[0,L] = '' then Break;

    Editor.Lines.Add('c0000');
    Editor.Lines.Add('KI503');
    Editor.Lines.Add('O0220');
    Editor.Lines.Add('f220');
    Editor.Lines.Add('KW0219');
    Editor.Lines.Add('KI7');
    Editor.Lines.Add('V0');
    Editor.Lines.Add('L');
    Editor.Lines.Add('H12');
    Editor.Lines.Add('PC');
    Editor.Lines.Add('A2');
    Editor.Lines.Add('D11');

    //Editor.Lines.Add('^^BY2,3,42^FT87,55^BCN,,N,N');
    Editor.Lines.Add('3d6301600310091'+formatfloat('000000',StrToFloatDef(SgDados.Cells[0,L],0)));

    ADOVarejo.Close;
    ADOVarejo.Parameters.ParamByName('cdProduto').Value := StrToIntDef(SgDados.Cells[0,L],0);
    ADOVarejo.Open;
    if imprimir_Com_Preco then //só mostra a ref. se for imprimir com peso
      Editor.Lines.Add('121100000090118REF.'+ SoNumeros(FormatFloat('0.00',strtofloatDef(ADOVarejo.fieldByName('vlAtacado').AsString,0))));


    if imprimir_Com_Preco then
      Editor.Lines.Add('121100000090166R$'+SgDados.Cells[3,L])
    else if SgDados.Cells[0,L] <> '' then
      Editor.Lines.Add('121100000090166'+FormatFloat('0.00',BuscaPeso(qry,StrToIntDef(SgDados.Cells[0,L],0))));
    Editor.Lines.Add('111100000330132'+Trim(Copy(SgDados.Cells[1,L],1,18)));
    Editor.Lines.Add('111100000330042KARIB');
    Editor.Lines.Add('111100000240132'+Trim(Copy(SgDados.Cells[1,L],18,18)));
    Editor.Lines.Add('121100000030040'+formatfloat('000000',StrToFloatDef(SgDados.Cells[0,L],0)));
    vQtd := 1;
    //Editor.Lines.Add('^PQ1,0,1,Y^XZ');
    // Cálculo para imprimir a qtd de etiquetas certo
//    if Frac(StrToFloatdef(SgDados.Cells[2,L],0)/3) = 0.00 then
//      vQtd := StrToFloatdef(SgDados.Cells[2,L],0)/3
//    else vQtd := (StrToint(FormatFloat('0000',StrToFloat(SgDados.Cells[2,L]))) div 3) + 1;
    Editor.Lines.Add('^01');   //FloatToStr(vQtd)  no lugar do '1'
    Editor.Lines.Add('Q0001');
    Editor.Lines.Add('E');
    L := L +1;
  end;
  Editor.Lines.SaveToFile(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'etiqueta.txt')));
  WinExec(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'print2.bat')),sw_ShowNormal);
  if not FileExists('Print2.bat') then begin
    ShowMessage('Não foi encontrado o arquivo Print.bat');
    exit;
  end;
  Application.OnMessage := FormPrincipal.ProcessaMsg;
  Limpar_Tela;
  RgOpcoes.ItemIndex := 0;
  freeandnil(qry);
  Messagedlg('Impressão ok!', mtInformation, [mbOk], 0);
end;

procedure TFrmPrincipalPreVenda.Button1Click(Sender: TObject);
begin
  Application.Minimize;
end;

procedure TFrmPrincipalPreVenda.ImprimeEtiquetaLayeVictorOS214;
var L : integer;
    Arq : TextFile;
    vQtd : real;
begin
  //if not CamposObrigatoriosPreenchidos(FrmPrincipalPreVenda) then exit;
  if SgDados.Cells[0,1] = '' then begin
    Messagedlg('Não foi lançado nenhum item para impressão das etiquetas!', mtWarning, [mbOk], 0);
    EdtConsulta.Setfocus;
    exit;
  end;
  if (Trim(EdtCdCliente.Text)<> '') and (Trim(EdtCdNome.Text) <> '') then
    SalvaEtiquetas;
  Editor.Lines.Clear;
  for L := 1 to SgDados.RowCount - 1 do begin // Salvando os itens da pré-venda.
    if SgDados.Cells[0,L] = '' then Break;
    Editor.Lines.Add('');
    Editor.Lines.Add('');
    Editor.Lines.Add('c0000');
    Editor.Lines.Add('KI503');
    Editor.Lines.Add('O0220');
    Editor.Lines.Add('f220');
    Editor.Lines.Add('KW0485');
    Editor.Lines.Add('KI7');
    Editor.Lines.Add('V0');
    Editor.Lines.Add('L');
    Editor.Lines.Add('H12');
    Editor.Lines.Add('PC');
    Editor.Lines.Add('A2');
    Editor.Lines.Add('D11');
    Editor.Lines.Add('111100000710010'+Trim(Copy(SgDados.Cells[1,L],1,20)));
    Editor.Lines.Add('111100000710154'+Trim(Copy(SgDados.Cells[1,L],1,20))); // Descricao part 1
    Editor.Lines.Add('111100000710298'+Trim(Copy(SgDados.Cells[1,L],1,20)));
    Editor.Lines.Add('112300000050015'+'R$ '+SgDados.Cells[3,L]); // preco
    Editor.Lines.Add('1F2201700290010'+Trim(SgDados.Cells[6,L]));
    Editor.Lines.Add('1F2201700300152'+Trim(SgDados.Cells[6,L]));  //Cod. Barra
    Editor.Lines.Add('1F2201700290298'+Trim(SgDados.Cells[6,L]));
    Editor.Lines.Add('111100000610010'+Trim(Copy(SgDados.Cells[1,L],20,40)));
    Editor.Lines.Add('111100000620154'+Trim(Copy(SgDados.Cells[1,L],20,40))); // Descricao part 2
    Editor.Lines.Add('111100000620298'+Trim(Copy(SgDados.Cells[1,L],20,40)));
    Editor.Lines.Add('112300000060153'+'R$ '+SgDados.Cells[3,L]); // preco
    Editor.Lines.Add('112300000060299'+'R$ '+SgDados.Cells[3,L]);
    Editor.Lines.Add('^01');
    // Cálculo para imprimir a qtd de etiquetas certo
    if Frac(StrToFloat(SgDados.Cells[2,L])/3) = 0.00 then
      vQtd := StrToFloat(SgDados.Cells[2,L])/3
    else vQtd := (StrToint(FormatFloat('0000',StrToFloat(SgDados.Cells[2,L]))) div 3) + 1;
    Editor.Lines.Add('Q'+ FormatFloat('0000',vQtd));
    Editor.Lines.Add('E');
  end;
  Editor.Lines.SaveToFile(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'etiqueta.txt')));
  WinExec(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'print2.bat')),sw_ShowNormal);
  if not FileExists('Print2.bat') then
    ShowMessage('Não foi encontrado o arquivo Print2.bat');
  Application.OnMessage := FormPrincipal.ProcessaMsg;
  Limpar_Tela;
  RgOpcoes.ItemIndex := 0;
  Messagedlg('Impressão ok!', mtInformation, [mbOk], 0);
end;

procedure TFrmPrincipalPreVenda.EdtPrecoEnter(Sender: TObject);
begin
  if StrtoFloatDef(EdtQtd.text,0) <= 0 then begin
    Messagedlg('Digite uma quantidade maior que zero para este produto.', mtWarning, [mbOk], 0);
    EdtQtd.SetFocus;
    Exit;
  end;
  EdtDescUnit.Text := FormatFloat('0.00',StrToFloat(EdtDescUnit.Text));
  EdtPreco.Text    := FormatFloatQ(vCasasPreco,StrToFloat(EdtPreco.Text) - (StrToFloat(EdtPreco.Text) * StrToFloat(EdtDescUnit.Text)/100));
  EdtPreco.SelectAll;
end;


procedure TFrmPrincipalPreVenda.ImprimeEtiquetaSantoAntonio;
var L : integer;
    Arq : TextFile;
    vQtd : real;
begin
  //if not CamposObrigatoriosPreenchidos(FrmPrincipalPreVenda) then exit;
  if SgDados.Cells[0,1] = '' then begin
    Messagedlg('Não foi lançado nenhum item para impressão das etiquetas!', mtWarning, [mbOk], 0);
    EdtConsulta.Setfocus;
    exit;
  end;
  if (Trim(EdtCdCliente.Text)<> '') and (Trim(EdtCdNome.Text) <> '') then
    SalvaEtiquetas;
  Editor.Lines.Clear;
  for L := 1 to SgDados.RowCount - 1 do begin // Salvando os itens da pré-venda.
    if SgDados.Cells[0,L] = '' then Break;
    Editor.Lines.Add('c0000');
    Editor.Lines.Add('KI503');
    Editor.Lines.Add('O0220');
    Editor.Lines.Add('f220');
    Editor.Lines.Add('KW0375');
    Editor.Lines.Add('KI7');
    Editor.Lines.Add('V0');
    Editor.Lines.Add('L');
    Editor.Lines.Add('H09');
    Editor.Lines.Add('PC');
    Editor.Lines.Add('A2');
    Editor.Lines.Add('D11');
    Editor.Lines.Add('131100001740034COD..:'+ SgDados.Cells[0,L]);
    Editor.Lines.Add('131100001720213COD..:'+ SgDados.Cells[0,L]);
    Editor.Lines.Add('131100001560034'+ Trim(Copy(SgDados.Cells[1,L],1,20))); // Descricao part 1
    Editor.Lines.Add('131100001550214'+ Trim(Copy(SgDados.Cells[1,L],1,20))); // Descricao part 1
    Editor.Lines.Add('121100001280034REF..:'+ SgDados.Cells[7,L]);
    Editor.Lines.Add('121100001270215REF..:'+ SgDados.Cells[7,L]);
    Editor.Lines.Add('141100000970033R$ '+ SgDados.Cells[9,L]); // preco
    Editor.Lines.Add('141100000950215R$ '+ SgDados.Cells[9,L]); // preco
    Editor.Lines.Add('1E2203800320045A'+ SgDados.Cells[0,L]);
    Editor.Lines.Add('1E2203600320225A'+ SgDados.Cells[0,L]);
    Editor.Lines.Add('131100001390034'+ Trim(Copy(SgDados.Cells[1,L],20,40))); // Descricao part 2
    Editor.Lines.Add('131100001380214'+ Trim(Copy(SgDados.Cells[1,L],20,40))); // Descricao part 2
    Editor.Lines.Add('^01');
    // Cálculo para imprimir a qtd de etiquetas certo
    if Frac(StrToFloat(SgDados.Cells[2,L])/3) = 0.00 then
      vQtd := StrToFloat(SgDados.Cells[2,L])/3
    else vQtd := (StrToint(FormatFloat('0000',StrToFloat(SgDados.Cells[2,L]))) div 3) + 1;
    Editor.Lines.Add('Q'+ FormatFloat('0000',vQtd));
    Editor.Lines.Add('E');
  end;
  Editor.Lines.SaveToFile(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'etiqueta.txt')));
  WinExec(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'print2.bat')),sw_ShowNormal);
  if not FileExists('Print2.bat') then
    ShowMessage('Não foi encontrado o arquivo Print2.bat');
  Application.OnMessage := FormPrincipal.ProcessaMsg;
  Limpar_Tela;
  RgOpcoes.ItemIndex := 0;
  Messagedlg('Impressão ok!', mtInformation, [mbOk], 0);
end;

procedure TFrmPrincipalPreVenda.ImprimeEtiquetaSuperDelli;
var L : integer;
    Arq : TextFile;
    vQtd : real;
begin
  //if not CamposObrigatoriosPreenchidos(FrmPrincipalPreVenda) then exit;
  if SgDados.Cells[0,1] = '' then begin
    Messagedlg('Não foi lançado nenhum item para impressão das etiquetas!', mtWarning, [mbOk], 0);
    EdtConsulta.Setfocus;
    exit;
  end;
  //if (Trim(EdtCdCliente.Text)<> '') and (Trim(EdtCdNome.Text) <> '') then
    //SalvaEtiquetas;
  Editor.Lines.Clear;
  for L := 1 to SgDados.RowCount - 1 do begin // Salvando os itens da pré-venda.
    if SgDados.Cells[0,L] = '' then Break;
    Editor.Lines.Add('N');
    Editor.Lines.Add('R0,0');
    Editor.Lines.Add('ZT');
    Editor.Lines.Add('I8,0,001');
    Editor.Lines.Add('q840');
    Editor.Lines.Add(' JY0000Kf00D8');
    Editor.Lines.Add('S2');
    Editor.Lines.Add('O');
    Editor.Lines.Add('JB');
    Editor.Lines.Add('JF');

    Editor.Lines.Add('A61,89,0,4,1,1,N,"' + RetirarAcento(Trim(Copy(SgDados.Cells[1,L],1,45)))+'"');
    Editor.Lines.Add('B66,125,0,1,2,4,55,N,"'+SgDados.Cells[6,L]+'"');
    Editor.Lines.Add('A336,44,0,4,1,1,N,"SUPERDELLI"');
    Editor.Lines.Add('A461,154,0,5,1,1,N,"R$ '+ formatfloat('0.00',strtofloat(SgDados.Cells[3,L]))+'"');
    Editor.Lines.Add('A112,188,0,2,1,1,N,"' + SgDados.Cells[6,L] + '"');

    Editor.Lines.Add('Q24,0');
    // Cálculo para imprimir a qtd de etiquetas certo
    vQtd := StrToFloat(SgDados.Cells[2,L]);

    Editor.Lines.Add('P'+ IntToStr(Trunc(vQtd)));
  end;
  Editor.Lines.SaveToFile(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'etiqueta.txt')));
  WinExec(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'print2.bat')),sw_ShowNormal);
  if not FileExists('Print2.bat') then
    ShowMessage('Não foi encontrado o arquivo Print2.bat');
  Application.OnMessage := FormPrincipal.ProcessaMsg;
  Limpar_Tela;
  RgOpcoes.ItemIndex := 0;
  Messagedlg('Impressão ok!', mtInformation, [mbOk], 0);
end;

procedure TFrmPrincipalPreVenda.ImprimeEtiquetaSaoJudasTadeus2;
var L : integer;
    Arq : TextFile;
    vQtd : real;
begin
  //if not CamposObrigatoriosPreenchidos(FrmPrincipalPreVenda) then exit;
  if SgDados.Cells[0,1] = '' then begin
    Messagedlg('Não foi lançado nenhum item para impressão das etiquetas!', mtWarning, [mbOk], 0);
    EdtConsulta.Setfocus;
    exit;
  end;
  //if (Trim(EdtCdCliente.Text)<> '') and (Trim(EdtCdNome.Text) <> '') then
    //SalvaEtiquetas;
  Editor.Lines.Clear;
  for L := 1 to SgDados.RowCount - 1 do begin // Salvando os itens da pré-venda.
    if SgDados.Cells[0,L] = '' then Break;
    Editor.Lines.Add('c0000');
    Editor.Lines.Add('KI503');
    Editor.Lines.Add('O0220');
    Editor.Lines.Add('f220');
    Editor.Lines.Add('KW0417');
    Editor.Lines.Add('KI7');
    Editor.Lines.Add('V0');
    Editor.Lines.Add('L');
    Editor.Lines.Add('H13');
    Editor.Lines.Add('PC');
    Editor.Lines.Add('A2');
    Editor.Lines.Add('D11');

    Editor.Lines.Add('141100000670017' + RetirarAcento(Trim(Copy(SgDados.Cells[1,L],1,34))));
    Editor.Lines.Add('121100000900017Codigo:');
    Editor.Lines.Add('121100000900066'+ SgDados.Cells[0,L]);
    Editor.Lines.Add('192200600050130R$ '+ formatfloat('0.00',strtofloat(SgDados.Cells[3,L])));
    Editor.Lines.Add('141100000420017' + RetirarAcento(Trim(Copy(SgDados.Cells[1,L],35,6))));

    Editor.Lines.Add('^01');
    // Cálculo para imprimir a qtd de etiquetas certo
    vQtd := StrToFloat(SgDados.Cells[2,L]);

    Editor.Lines.Add('Q'+ IntToStr(Trunc(vQtd)));
    Editor.Lines.Add('E');
  end;
  Editor.Lines.SaveToFile(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'etiqueta.txt')));
  WinExec(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'print2.bat')),sw_ShowNormal);
  if not FileExists('Print2.bat') then
    ShowMessage('Não foi encontrado o arquivo Print2.bat');
  Application.OnMessage := FormPrincipal.ProcessaMsg;
  Limpar_Tela;
  RgOpcoes.ItemIndex := 0;
  Messagedlg('Impressão ok!', mtInformation, [mbOk], 0);
end;

procedure TFrmPrincipalPreVenda.ImprimeEtiquetaSaoMiguel;
var L : integer;
    Arq : TextFile;
    vQtd : real;
begin
  //if not CamposObrigatoriosPreenchidos(FrmPrincipalPreVenda) then exit;
  if SgDados.Cells[0,1] = '' then begin
    Messagedlg('Não foi lançado nenhum item para impressão das etiquetas!', mtWarning, [mbOk], 0);
    EdtConsulta.Setfocus;
    exit;
  end;
  Editor.Lines.Clear;
  if Application.MessageBox('Deseja imprimir o modelo grande (SIM) ou pequeno (NÃO)?', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_APPLMODAL) = ID_YES then begin //grande
    for L := 1 to SgDados.RowCount - 1 do begin // Salvando os itens da pré-venda.
      if SgDados.Cells[0,L] = '' then Break;
      Editor.Lines.Add('c0000');
      Editor.Lines.Add('KI503');
      Editor.Lines.Add('O0220');
      Editor.Lines.Add('f220');
      Editor.Lines.Add('KW0417');
      Editor.Lines.Add('KI7');
      Editor.Lines.Add('V0');
      Editor.Lines.Add('L');
      Editor.Lines.Add('H12');
      Editor.Lines.Add('PC');
      Editor.Lines.Add('A2');
      Editor.Lines.Add('D11');

      Editor.Lines.Add('1F3304500090055' + Trim(SgDados.Cells[6,L]));
      Editor.Lines.Add('131100000790064' + RetirarAcento(Trim(SgDados.Cells[1,L])));
      Editor.Lines.Add('192200500160253' + formatfloat('0.00',strtofloat(SgDados.Cells[3,L])));
      Editor.Lines.Add('192200200440213R$');

      Editor.Lines.Add('^01');
      // Cálculo para imprimir a qtd de etiquetas certo
      vQtd := StrToFloat(SgDados.Cells[2,L]);

      Editor.Lines.Add('Q'+ IntToStr(Trunc(vQtd)));
      Editor.Lines.Add('E');
    end;
  end
  else begin
    for L := 1 to SgDados.RowCount - 1 do begin // Salvando os itens da pré-venda.
      if SgDados.Cells[0,L] = '' then Break;
      Editor.Lines.Add('c0000');
      Editor.Lines.Add('KI503');
      Editor.Lines.Add('O0220');
      Editor.Lines.Add('f220');
      Editor.Lines.Add('KW0417');
      Editor.Lines.Add('KI7');
      Editor.Lines.Add('V0');
      Editor.Lines.Add('L');
      Editor.Lines.Add('H12');
      Editor.Lines.Add('PC');
      Editor.Lines.Add('A2');
      Editor.Lines.Add('D11');

      Editor.Lines.Add('1F3303000240029' + Trim(SgDados.Cells[6,L]));
      Editor.Lines.Add('131100000870029' + RetirarAcento(Trim(Copy(SgDados.Cells[1,L],1,21))));
      Editor.Lines.Add('131100000700029' + RetirarAcento(Trim(Copy(SgDados.Cells[1,L],22,21))));
      Editor.Lines.Add('192200100040124R$ ' + formatfloat('0.00',strtofloat(SgDados.Cells[3,L])));

      Editor.Lines.Add('^01');
      // Cálculo para imprimir a qtd de etiquetas certo
      vQtd := StrToFloat(SgDados.Cells[2,L]);

      Editor.Lines.Add('Q'+ IntToStr(Trunc(vQtd)));
      Editor.Lines.Add('E');
    end;
  end;
  Editor.Lines.SaveToFile(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'etiqueta.txt')));
  WinExec(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'print2.bat')),sw_ShowNormal);
  if not FileExists('Print2.bat') then
    ShowMessage('Não foi encontrado o arquivo Print2.bat');
  Application.OnMessage := FormPrincipal.ProcessaMsg;
  Limpar_Tela;
  RgOpcoes.ItemIndex := 0;
  Messagedlg('Impressão ok!', mtInformation, [mbOk], 0);
end;

function TFrmPrincipalPreVenda.Solicitar_Login(forcarLogin : String = 'N') : Boolean;
{forcarLogin = N-nao S-sim e B-vindo do clique do botao}
begin
  if (FrmPrincipalPreVenda.GetFlagEmpresa = 'TREVO') and (forcarLogin = 'N') then begin
    cbxUsuario.Text := '';
    EdtUsuario.Text := '';
    edtLogin.Text := '';
//    Application.OnMessage := FormPrincipal.ProcessaMsg;
//    CbxCliente.SelectAll;
    PostMessage(CbxCliente.Handle, WM_SETFOCUS, 0, 0);
//    CbxCliente.SetFocus;
    exit;
  end;
  if FrmPedeSenha = nil then
    if (FrmPrincipalPreVenda.GetFlagEmpresa = 'TREVO') and (forcarLogin = 'S') then
      FrmPedeSenha := TFrmPedeSenha.Create(Application, false)
    else
      FrmPedeSenha := TFrmPedeSenha.Create(Application);
  FrmPedeSenha.editUsuario.Text := cbxUsuario.Text;
  FrmPedeSenha.ShowModal;
  result := TRIM(edtLogin.Text) <> '';
end;

function TFrmPrincipalPreVenda.SoNumeros(Const Texto:String):String;
//
// Remove caracteres de uma string deixando apenas numeros
//
var
 I: integer;
 S: string;
begin
  S := '';
  for I := 1 To Length(Texto) Do begin
    if (Texto[I] in ['0'..'9']) then begin
       S := S + Copy(Texto, I, 1);
    end;
  end;
  result := S;
end;

procedure TFrmPrincipalPreVenda.ImprimeEtiquetaAliceDiniz;
var L : integer;
    Arq : TextFile;
    vQtd : real;
begin
  //if not CamposObrigatoriosPreenchidos(FrmPrincipalPreVenda) then exit;
  if SgDados.Cells[0,1] = '' then begin
    Messagedlg('Não foi lançado nenhum item para impressão das etiquetas!', mtWarning, [mbOk], 0);
    EdtConsulta.Setfocus;
    exit;
  end;
//  if (Trim(EdtCdCliente.Text)<> '') and (Trim(EdtCdNome.Text) <> '') then
//    SalvaEtiquetas;
  Editor.Lines.Clear;
  for L := 1 to SgDados.RowCount - 1 do begin // Salvando os itens da pré-venda.
    if SgDados.Cells[0,L] = '' then Break;
    Editor.Lines.Add('c0000');
    Editor.Lines.Add('KI503');
    Editor.Lines.Add('O0220');
    Editor.Lines.Add('f220');
    Editor.Lines.Add('KW0394');
    Editor.Lines.Add('KI7');
    Editor.Lines.Add('V0');
    Editor.Lines.Add('L');
    Editor.Lines.Add('H12');
    Editor.Lines.Add('PC');
    Editor.Lines.Add('A2');
    Editor.Lines.Add('D11');
    Editor.Lines.Add('191100302340013Cod.: '+SgDados.Cells[0,L]);
    Editor.Lines.Add('191100302140013'+Trim(Copy(SgDados.Cells[1,L],1,20)));
    Editor.Lines.Add('191100301960013'+Trim(Copy(SgDados.Cells[1,L],21,40)));
    Editor.Lines.Add('191100600430013R$');
    Editor.Lines.Add('1F3305401150011'+SgDados.Cells[6,L]);
    Editor.Lines.Add('1F3305401150212'+SgDados.Cells[6,L]);
    Editor.Lines.Add('191100302340217Cod.: '+SgDados.Cells[0,L]);
    Editor.Lines.Add('191100302140217'+Trim(Copy(SgDados.Cells[1,L],1,20)));
    Editor.Lines.Add('191100301960217'+Trim(Copy(SgDados.Cells[1,L],21,40)));
    Editor.Lines.Add('181100000420053'+formatfloat('0.00',strtofloat(SgDados.Cells[3,L])));
    Editor.Lines.Add('191100600430213R$');
    Editor.Lines.Add('181100000420250'+formatfloat('0.00',strtofloat(SgDados.Cells[3,L])));
    Editor.Lines.Add('191100302660055Alice Diniz');
    Editor.Lines.Add('191100302660258Alice Diniz');
    Editor.Lines.Add('^01');
    // Cálculo para imprimir a qtd de etiquetas certo
    if Frac(StrToFloat(SgDados.Cells[2,L])/3) = 0.00 then
      vQtd := StrToFloat(SgDados.Cells[2,L])/3
    else vQtd := (StrToint(FormatFloat('0000',StrToFloat(SgDados.Cells[2,L]))) div 3) + 1;
    Editor.Lines.Add('Q'+ FormatFloat('0000',vQtd));
    Editor.Lines.Add('E');
  end;
  Editor.Lines.SaveToFile(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'etiqueta.txt')));
  WinExec(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'print2.bat')),sw_ShowNormal);
  if not FileExists('Print2.bat') then
    ShowMessage('Não foi encontrado o arquivo Print2.bat');
  Application.OnMessage := FormPrincipal.ProcessaMsg;
  Limpar_Tela;
  RgOpcoes.ItemIndex := 0;
  Messagedlg('Impressão ok!', mtInformation, [mbOk], 0);
end;

procedure TFrmPrincipalPreVenda.ImprimeEtiquetaAmorBebe;
var L : integer;
    Arq : TextFile;
    vQtd : real;
begin
  //if not CamposObrigatoriosPreenchidos(FrmPrincipalPreVenda) then exit;
  if SgDados.Cells[0,1] = '' then begin
    Messagedlg('Não foi lançado nenhum item para impressão das etiquetas!', mtWarning, [mbOk], 0);
    EdtConsulta.Setfocus;
    exit;
  end;
//  if (Trim(EdtCdCliente.Text)<> '') and (Trim(EdtCdNome.Text) <> '') then
//    SalvaEtiquetas;
  Editor.Lines.Clear;
  for L := 1 to SgDados.RowCount - 1 do begin // Salvando os itens da pré-venda.
    if SgDados.Cells[0,L] = '' then Break;
    Editor.Lines.Add('c0000');
    Editor.Lines.Add('KI503');
    Editor.Lines.Add('O0220');
    Editor.Lines.Add('f220');
    Editor.Lines.Add('KW0394');
    Editor.Lines.Add('KI7');
    Editor.Lines.Add('V0');
    Editor.Lines.Add('L');
    Editor.Lines.Add('H12');
    Editor.Lines.Add('PC');
    Editor.Lines.Add('A2');
    Editor.Lines.Add('D11');
    Editor.Lines.Add('191100202230026Desc..:');
    Editor.Lines.Add('191100202220200Desc..:');
    Editor.Lines.Add('191100202100029'+ Trim(Copy(SgDados.Cells[1,L],1,20))); // Descricao part 1
    Editor.Lines.Add('191100201970029'+ Trim(Copy(SgDados.Cells[1,L],20,40))); // Descricao part 1
    Editor.Lines.Add('191100202090204'+ Trim(Copy(SgDados.Cells[1,L],1,20))); // Descricao part 1
    Editor.Lines.Add('191100201960204'+ Trim(Copy(SgDados.Cells[1,L],20,40))); // Descricao part 1
    Editor.Lines.Add('191100500040025R$ '+ SgDados.Cells[9,L]); // preco
    Editor.Lines.Add('191100001330026Data da compra');
    Editor.Lines.Add('191100001210026Prazo de troca de 30 dias.');
    Editor.Lines.Add('1E3303600310024A'+ SgDados.Cells[0,L]);
    Editor.Lines.Add('1E3303600320201A'+ SgDados.Cells[0,L]);
    Editor.Lines.Add('191100500040202R$ '+ SgDados.Cells[9,L]); // preco
    Editor.Lines.Add('191100001090026Pecas em promocao, troca apenas');
    Editor.Lines.Add('191100000970026durante o periodo promocional.');
    Editor.Lines.Add('191100001330200Data da compra');
    Editor.Lines.Add('191100001210200Prazo de troca de 30 dias.');
    Editor.Lines.Add('191100001090200Pecas em promocao, troca apenas');
    Editor.Lines.Add('191100000970200durante o periodo promocional.');
    Editor.Lines.Add('1Y1100002190316PB19');
    Editor.Lines.Add('1Y1100001300094PB20');
    Editor.Lines.Add('1E3303601460025A'+ SgDados.Cells[0,L]);
    Editor.Lines.Add('1Y1100001300300PB22');
    Editor.Lines.Add('1E3303601460200A'+ SgDados.Cells[0,L]);
    Editor.Lines.Add('1Y1100002270124PB1');
    Editor.Lines.Add('1Y1100002280290PB2');
    Editor.Lines.Add('^01');
    Editor.Lines.Add('Q0001');
    // Cálculo para imprimir a qtd de etiquetas certo
    if Frac(StrToFloat(SgDados.Cells[2,L])/3) = 0.00 then
      vQtd := StrToFloat(SgDados.Cells[2,L])/3
    else vQtd := (StrToint(FormatFloat('0000',StrToFloat(SgDados.Cells[2,L]))) div 3) + 1;
    Editor.Lines.Add('Q'+ FormatFloat('0000',vQtd));
    Editor.Lines.Add('E');
  end;
  Editor.Lines.SaveToFile(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'etiqueta.txt')));
  WinExec(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'print2.bat')),sw_ShowNormal);
  if not FileExists('Print2.bat') then
    ShowMessage('Não foi encontrado o arquivo Print2.bat');
  Application.OnMessage := FormPrincipal.ProcessaMsg;
  Limpar_Tela;
  RgOpcoes.ItemIndex := 0;
  Messagedlg('Impressão ok!', mtInformation, [mbOk], 0);
end;

procedure TFrmPrincipalPreVenda.ImprimeEtiquetaRosaMenina;
var L : integer;
    Arq : TextFile;
    vQtd : real;
begin
  //if not CamposObrigatoriosPreenchidos(FrmPrincipalPreVenda) then exit;
  if SgDados.Cells[0,1] = '' then begin
    Messagedlg('Não foi lançado nenhum item para impressão das etiquetas!', mtWarning, [mbOk], 0);
    EdtConsulta.Setfocus;
    exit;
  end;
  if (Trim(EdtCdCliente.Text)<> '') and (Trim(EdtCdNome.Text) <> '') then
    SalvaEtiquetas;
  Editor.Lines.Clear;
  for L := 1 to SgDados.RowCount - 1 do begin // Salvando os itens da pré-venda.
    if SgDados.Cells[0,L] = '' then Break;
    Editor.Lines.Add('c0000');
    Editor.Lines.Add('KI503');
    Editor.Lines.Add('O0220');
    Editor.Lines.Add('f220');
    Editor.Lines.Add('KW0354');
    Editor.Lines.Add('KI7');
    Editor.Lines.Add('V0');
    Editor.Lines.Add('L');
    Editor.Lines.Add('H12');
    Editor.Lines.Add('PC');
    Editor.Lines.Add('A2');
    Editor.Lines.Add('D11');
    Editor.Lines.Add('121100001800041'+ Trim(Copy(SgDados.Cells[1,L],1,20))); // Descricao part 1
    Editor.Lines.Add('121100001690041'+ Trim(Copy(SgDados.Cells[1,L],20,40))); // Descricao part 1
    Editor.Lines.Add('131100001120041R$ '+ SgDados.Cells[9,L]); // preco
    Editor.Lines.Add('1e2202501410041B'+ SgDados.Cells[0,L]);
    Editor.Lines.Add('1e2202500430042B'+ SgDados.Cells[0,L]);
    Editor.Lines.Add('121100000820042'+ Trim(Copy(SgDados.Cells[1,L],1,20))); // Descricao part 1
    Editor.Lines.Add('121100000700042'+ Trim(Copy(SgDados.Cells[1,L],20,40))); // Descricao part 1
    Editor.Lines.Add('121100001300041'+ SgDados.Cells[0,L]);
    Editor.Lines.Add('131100000100043R$ '+ SgDados.Cells[9,L]); // preco
    Editor.Lines.Add('121100000300043'+ SgDados.Cells[0,L]);
    Editor.Lines.Add('1e2202500440210B'+ SgDados.Cells[0,L]);
    Editor.Lines.Add('121100000830210'+ Trim(Copy(SgDados.Cells[1,L],1,20))); // Descricao part 1
    Editor.Lines.Add('121100000710210'+ Trim(Copy(SgDados.Cells[1,L],20,40))); // Descricao part 1
    Editor.Lines.Add('131100000110211R$ '+ SgDados.Cells[9,L]); // preco
    Editor.Lines.Add('121100000310211'+ SgDados.Cells[0,L]);
    Editor.Lines.Add('111100001060040Troca somente peca com defeito');
    Editor.Lines.Add('11110000099004130 dias da data da compra');
    Editor.Lines.Add('121100001800207'+ Trim(Copy(SgDados.Cells[1,L],1,20))); // Descricao part 1
    Editor.Lines.Add('121100001690207'+ Trim(Copy(SgDados.Cells[1,L],20,40))); // Descricao part 1
    Editor.Lines.Add('131100001120207R$ '+ SgDados.Cells[9,L]); // preco
    Editor.Lines.Add('1e2202501410207B'+ SgDados.Cells[0,L]);
    Editor.Lines.Add('121100001300207'+ SgDados.Cells[0,L]);
    Editor.Lines.Add('111100001060207Troca somente peca com defeito');
    Editor.Lines.Add('11110000099020830 dias da data da compra');
    Editor.Lines.Add('1Y1100001910031PB25');
    Editor.Lines.Add('1Y1100001920198PB26');
    Editor.Lines.Add('^01');
    // Cálculo para imprimir a qtd de etiquetas certo
    if Frac(StrToFloat(SgDados.Cells[2,L])/3) = 0.00 then
      vQtd := StrToFloat(SgDados.Cells[2,L])/3
    else vQtd := (StrToint(FormatFloat('0000',StrToFloat(SgDados.Cells[2,L]))) div 3) + 1;
    Editor.Lines.Add('Q'+ FormatFloat('0000',vQtd));
    Editor.Lines.Add('E');
  end;
  Editor.Lines.SaveToFile(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'etiqueta.txt')));
  WinExec(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'print2.bat')),sw_ShowNormal);
  if not FileExists('Print2.bat') then
    ShowMessage('Não foi encontrado o arquivo Print2.bat');
  Application.OnMessage := FormPrincipal.ProcessaMsg;
  Limpar_Tela;
  RgOpcoes.ItemIndex := 0;
  Messagedlg('Impressão ok!', mtInformation, [mbOk], 0);
end;

procedure TFrmPrincipalPreVenda.ImprimeEtiquetaListo;
var L : integer;
    Arq : TextFile;
    vQtd : real;
begin
  //if not CamposObrigatoriosPreenchidos(FrmPrincipalPreVenda) then exit;
  if SgDados.Cells[0,1] = '' then begin
    Messagedlg('Não foi lançado nenhum item para impressão das etiquetas!', mtWarning, [mbOk], 0);
    EdtConsulta.Setfocus;
    exit;
  end;
  if (Trim(EdtCdCliente.Text)<> '') and (Trim(EdtCdNome.Text) <> '') then
    SalvaEtiquetas;
  Editor.Lines.Clear;
  for L := 1 to SgDados.RowCount - 1 do begin // Salvando os itens da pré-venda.
    if SgDados.Cells[0,L] = '' then Break;
    Editor.Lines.Add('I8,A,001');
    Editor.Lines.Add('');
    Editor.Lines.Add('');
    Editor.Lines.Add('Q184,024');
    Editor.Lines.Add('q831');
    Editor.Lines.Add('rN');
    Editor.Lines.Add('S4');
    Editor.Lines.Add('D7');
    Editor.Lines.Add('ZT');
    Editor.Lines.Add('JF');
    Editor.Lines.Add('OD');
    Editor.Lines.Add('R16,0');
    Editor.Lines.Add('f100');
    Editor.Lines.Add('N');
    Editor.Lines.Add('A240,106,2,4,1,1,N,"R$ '+SgDados.Cells[9,L]+'"');
    Editor.Lines.Add('A787,106,2,4,1,1,N,"R$ '+SgDados.Cells[9,L]+'"');
    Editor.Lines.Add('A515,107,2,4,1,1,N,"R$ '+SgDados.Cells[9,L]+'"');
    Editor.Lines.Add('B242,80,2,1,2,6,46,B,"'+SgDados.Cells[6,L]+'"');
    Editor.Lines.Add('A784,168,2,1,1,2,N,"'+ SgDados.Cells[0,L] + '-' + Trim(Copy(SgDados.Cells[1,L],1,16))+'"'); // Descricao part 1
    Editor.Lines.Add('B515,82,2,1,2,6,46,B,"'+SgDados.Cells[6,L]+'"');
    Editor.Lines.Add('A514,169,2,1,1,2,N,"'+ SgDados.Cells[0,L] + '-' + Trim(Copy(SgDados.Cells[1,L],1,16))+'"'); // Descricao part 1
    Editor.Lines.Add('B788,81,2,1,2,6,46,B,"'+SgDados.Cells[6,L]+'"');
    Editor.Lines.Add('A240,167,2,1,1,2,N,"'+ SgDados.Cells[0,L] + '-' + Trim(Copy(SgDados.Cells[1,L],1,16))+'"'); // Descricao part 1
    Editor.Lines.Add('A240,141,2,1,1,2,N,"'+ Trim(Copy(SgDados.Cells[1,L],17,36))+'"'); // Descricao part 1
    Editor.Lines.Add('A784,142,2,1,1,2,N,"'+ Trim(Copy(SgDados.Cells[1,L],17,36))+'"'); // Descricao part 1
    Editor.Lines.Add('A514,142,2,1,1,2,N,"'+ Trim(Copy(SgDados.Cells[1,L],17,36))+'"'); // Descricao part 1
    // Cálculo para imprimir a qtd de etiquetas certo
    if Frac(StrToFloat(SgDados.Cells[2,L])/3) = 0.00 then
      vQtd := StrToFloat(SgDados.Cells[2,L])/3
    else vQtd := (StrToint(FormatFloat('0000',StrToFloat(SgDados.Cells[2,L]))) div 3) + 1;
    Editor.Lines.Add('P'+ FormatFloat('0',vQtd));
  end;
  Editor.Lines.SaveToFile(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'etiqueta.txt')));
  WinExec(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'print2.bat')),sw_ShowNormal);
  if not FileExists('Print2.bat') then
    ShowMessage('Não foi encontrado o arquivo Print2.bat');
  Application.OnMessage := FormPrincipal.ProcessaMsg;
  Limpar_Tela;
  RgOpcoes.ItemIndex := 0;
  Messagedlg('Impressão ok!', mtInformation, [mbOk], 0);
end;

procedure TFrmPrincipalPreVenda.ImprimeEtiquetasBijouArtsOS214TT;
var L : integer;
    Arq : TextFile;
    vQtd : real;
begin
  //if not CamposObrigatoriosPreenchidos(FrmPrincipalPreVenda) then exit;
  if SgDados.Cells[0,1] = '' then begin
    Messagedlg('Não foi lançado nenhum item para impressão das etiquetas!', mtWarning, [mbOk], 0);
    EdtConsulta.Setfocus;
    exit;
  end;
  if (Trim(EdtCdCliente.Text)<> '') and (Trim(EdtCdNome.Text) <> '') then
    SalvaEtiquetas;
  Editor.Lines.Clear;
  for L := 1 to SgDados.RowCount - 1 do begin // Salvando os itens da pré-venda.
    if SgDados.Cells[0,L] = '' then Break;
    Editor.Lines.Add('');
    Editor.Lines.Add('');
    Editor.Lines.Add('c0000');
    Editor.Lines.Add('KI503');
    Editor.Lines.Add('O0220');
    Editor.Lines.Add('f220');
    Editor.Lines.Add('KW0354');
    Editor.Lines.Add('KI7');
    Editor.Lines.Add('V0');
    Editor.Lines.Add('L');
    Editor.Lines.Add('H12');
    Editor.Lines.Add('PC');
    Editor.Lines.Add('A2');
    Editor.Lines.Add('D11');
    Editor.Lines.Add('111100000490025'+Trim(Copy(SgDados.Cells[1,L],1,19))+'');
    Editor.Lines.Add('111100000410025'+Trim(Copy(SgDados.Cells[1,L],20,20))+'');
    Editor.Lines.Add('1d6301800190148'+SgDados.Cells[0,L]+'');
    Editor.Lines.Add('111100000490143'+Trim(Copy(SgDados.Cells[1,L],1,19))+'');
    Editor.Lines.Add('111100000410143'+Trim(Copy(SgDados.Cells[1,L],20,20))+'');
    Editor.Lines.Add('1d6301800200267'+SgDados.Cells[0,L]+'');
    Editor.Lines.Add('111100000490261'+Trim(Copy(SgDados.Cells[1,L],1,19))+'');
    Editor.Lines.Add('111100000410261'+Trim(Copy(SgDados.Cells[1,L],20,20))+'');
    Editor.Lines.Add('1d6301800190029'+SgDados.Cells[0,L]+'');
    Editor.Lines.Add('131100000010039'+SgDados.Cells[0,L]+'');
    Editor.Lines.Add('131100000010160'+SgDados.Cells[0,L]+'');
    Editor.Lines.Add('131100000010281'+SgDados.Cells[0,L]+'');
    // Cálculo para imprimir a qtd de etiquetas certo
    if Frac(StrToFloat(SgDados.Cells[2,L])/3) = 0.00 then
      vQtd := StrToFloat(SgDados.Cells[2,L])/3
    else vQtd := (StrToint(FormatFloat('0000',StrToFloat(SgDados.Cells[2,L]))) div 3) + 1;
    Editor.Lines.Add('^'+FormatFloat('00',vQtd));
    Editor.Lines.Add('Q'+FormatFloat('0000',vQtd));
    Editor.Lines.Add('E');
  end;
  Editor.Lines.SaveToFile(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'etiqueta.txt')));
  WinExec(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'print2.bat')),sw_ShowNormal);
  if not FileExists('Print2.bat') then
    ShowMessage('Não foi encontrado o arquivo Print2.bat');
  Application.OnMessage := FormPrincipal.ProcessaMsg;
  Limpar_Tela;
  RgOpcoes.ItemIndex := 0;
  Messagedlg('Impressão ok!', mtInformation, [mbOk], 0);
end;


procedure TFrmPrincipalPreVenda.EdtCFOPKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = Char(42)) then begin   // 42 -> *
    Application.OnMessage := FormPrincipal.NaoProcessaMsg;
    //Form1.WindowState := wsMinimized;
    FrmCFOP := TFrmCFOP.Create(Application);     // Cria o formulário
    //FrmCFOP.Position := poMainFormCenter; comentei porque estava dando erro com o VCLSKIN
    FrmCFOP.Show;
    FrmCFOP.AtualizaQryConsulta;
    exit;
  end;
  ValidarInteiro(Key);
end;

function TFrmPrincipalPreVenda.SugereCFOP: string;
begin
  // pega o cfop cadastrado previamente no cadastro de produtos
  if vUF <> vUF_Cliente then begin
    if RgOpcoes.ItemIndex <> 4 then  //PBFARMA SIMPLES REMESSA
      Result := ADOSPConsultadsCFOPF.AsString
    else
      Result := '6949';
  end
  else begin
    if RgOpcoes.ItemIndex <> 4 then  //PBFARMA SIMPLES REMESSA
      Result := ADOSPConsultadsCFOPD.AsString
    else
      Result := '5949';
  end;
end;

procedure TFrmPrincipalPreVenda.btnMensagemClick(Sender: TObject);
var
  query: TADOQuery;
  i : integer;
  produto : TDOMProduto;
begin
  vExibir := NOT vExibir;
  if vExibir = False then begin
    FrmInfo.Close;
    Exit;
  end;
  produto:= TNEGProduto.buscarProduto(StrtoInt(SgDados.Cells[0,SgDados.Row]));
  if produto.tipoComposicao = composto then begin
    frmConsultaComposicao := TfrmConsultaComposicao.Create(Application);
    frmConsultaComposicao.codigoProduto := StrtoInt(SgDados.Cells[0,SgDados.Row]);
    frmConsultaComposicao.lblNome.Caption := 'Produto: ' + SgDados.Cells[1,SgDados.Row];
    frmConsultaComposicao.lblCodigo.Caption := 'Código  : ' + SgDados.Cells[0,SgDados.Row];
    frmConsultaComposicao.ShowModal;
    exit;
  end;
  FrmInfo := TFrmInfo.Create(Application);
  //FrmInfo.Parent := FrmPrincipalPreVenda;
  FrmInfo.Top := btnMensagem.ClientOrigin.Y;
  FrmInfo.Left := btnMensagem.ClientOrigin.X + btnMensagem.Width;
  FrmInfo.Show;
  query := TADOQuery.Create(Self);
  query.Connection := DModulo.Conexao;
  {memoMensagem.Text :=   'Código do produto.......: ' + SgDados.Cells[0,SgDados.Row];
  memoMensagem.Lines.Add('Faltam..........................: ' + FloatToStr(qtdInsuficienteParaPrevend(StrToInt(SgDados.Cells[0,SgDados.Row]), strToFloatDef(SgDados.Cells[2,SgDados.Row],0))));
  memoMensagem.Lines.Add('Quantidade em reserva: ' + FloatToStr(quantidadeEmReserva(StrToInt(SgDados.Cells[0,SgDados.Row]))));
  memoMensagem.Lines.Add('Prevenda | Quantidade | Data ');}
  FrmInfo.lblCodigo.Caption := SgDados.Cells[0,SgDados.Row];
  FrmInfo.lblFaltam.Caption := FloatToStr(qtdInsuficienteParaPrevend(StrToInt(SgDados.Cells[0,SgDados.Row]), strToFloatDef(SgDados.Cells[2,SgDados.Row],0)));
  FrmInfo.lblQtd.Caption := FloatToStr(quantidadeEmReserva(StrToInt(SgDados.Cells[0,SgDados.Row])));
  with query do
  begin
    Sql.Text := 'SELECT Distinct O.nrOrcamento as prevenda, O.dtEmissao as data, I.nrQtd as quantidade '+
                'FROM Orcamento O WITH (NOLOCK) INNER JOIN IteOrcamento I                              '+
                'WITH (NOLOCK) ON O.nrOrcamento = I.nrOrcamento                                        '+
                'Where I.cdproduto = :CDPRODUTO and I.dsSituacao <> ''C'' and  O.dsImpresso <> ''O'' and    ';
//    if (UpperCase(vEmpresa) = 'NACIONAL') or (UpperCase(vEmpresa) = 'REIDOFIAT') or
//       (UpperCase(vEmpresa) = 'AUTOCAR') or (UpperCase(vEmpresa) = 'TOPLINE') or
//       (UpperCase(vEmpresa) = 'TREVO') or (UpperCase(vEmpresa) = 'MECATTRON') or (UpperCase(vEmpresa) = 'LAMARAO')
//    then
    if ((vAutoPecas = 'A')OR(UpperCase(vEmpresa) = 'NACIONAL')) then
      SQL.Add('O.dsImpresso <> ''S''  ') //and O.nrObjeto <> 0 testar para ver se o sistema mostra as prevendas e os em aberto
    else
      SQL.Add('O.dsImpresso = ''N'' ');
    Parameters.ParamByName('CDPRODUTO').Value := SgDados.Cells[0,SgDados.Row];
    Open;
    for i:= 0 to RecordCount -1 do begin
      //memoMensagem.Lines.Add(Format('%-10s', [fieldbyname('prevenda').asstring]) + ' | ' + Format('%18s',[FloatToStr(fieldbyname('quantidade').AsFloat)]) + ' | ' + DateToStr(fieldbyname('data').AsDateTime));
      FrmInfo.mmInfo.Lines.Add(Format('%-12s', [fieldbyname('prevenda').asstring]) + ' | ' + Format('%20s',[FloatToStr(fieldbyname('quantidade').AsFloat)]) + ' | ' + DateToStr(fieldbyname('data').AsDateTime));
      next;
    end;
  end;
  //memoMensagem.Visible := not memoMensagem.Visible;
end;

procedure TFrmPrincipalPreVenda.exibirExclamacao;
begin
  btnMensagem.Top := SgDados.Top + ((SgDados.Row - SgDados.TopRow) * 20) + 25;
  //memoMensagem.Top := btnMensagem.Top;
  btnMensagem.Left := 2;
  btnMensagem.Visible := True;
  //memoMensagem.Visible := False;
  vExibir := False;
end;

procedure TFrmPrincipalPreVenda.ocultarExclamacao;
begin
  btnMensagem.Visible := False;
  if FrmInfo <> nil then
    FrmInfo.Close;
  //memoMensagem.Visible := False;
end;

function TFrmPrincipalPreVenda.qtdInsuficienteParaPrevend(cdProduto : Integer; qtdSolicitada : Real): Real;
var
  query : TADOQuery;
  qtdEstoque, qtdEmReserva, qtdResta, qtdFalta : Real;
begin
  query := TADOQuery.Create(Self);
  query.Connection := DModulo.Conexao;
  with query do
  begin
    SQL.Text := 'select nrqtdreal from produto WITH (NOLOCK) where cdproduto = :CODIGO';
    Parameters.ParamByName('CODIGO').Value := cdProduto;
    Open;
    if recordcount > 0 then
       qtdEstoque := fieldByName('nrqtdreal').AsFloat
    else
       qtdEstoque := 0;
  end;
  qtdEmReserva := quantidadeEmReserva(cdProduto);
  qtdResta := qtdEstoque - qtdEmReserva;
  qtdFalta := qtdSolicitada - qtdResta;
  freeandnil(query);
  if qtdFalta > 0 then
     result := qtdFalta
  else
     result := 0;
end;

procedure TFrmPrincipalPreVenda.pintarLinhaStringGrid(grid: TStringGrid; linha: integer; cor : TColor);
var
  i : Integer;
  rect : TRect;
begin
  for i := 0 to grid.ColCount - 1 do
  begin
    rect := grid.CellRect(i, linha);
    grid.Canvas.brush.Color := cor;
    grid.Canvas.FillRect(rect);
    grid.Canvas.Font.Color := grid.Font.Color;
    DrawTextW(grid.Canvas.Handle, PWidechar(grid.Cells[i, linha]), length(grid.Cells[i, linha]), rect, DT_VCENTER or DT_LEFT or DT_SINGLELINE);
  end;
end;

function TFrmPrincipalPreVenda.PossuiEstoque: Boolean;
{*** Valida o estoque desde que esteja setado tal validacao nas configuracoes do sistema}
var
  I : integer;
  resultado : Boolean;
begin
  resultado := True;
  if (RgOpcoes.ItemIndex = 0) then begin
    if (vEstqNegativo <> 'S') then begin  //***
      for i := 0 to prevenda.itens.Count -1 do begin
        if ((prevenda.itens[I].quantidade > prevenda.itens[I].nrQtdReal)and(prevenda.itens[I].tipoComposicao <> composto))
          or ((prevenda.itens[I].tipoComposicao = composto)and(TNEGProduto.getEstoquePossivelProdutoComposto(prevenda.itens[I].cdProduto,1)<=0)) then begin
          Application.MessageBox(PWideChar('O produto '+ prevenda.itens[I].descricao +' não possui estoque suficiente!'),'Atenção', MB_OK + MB_ICONWARNING + MB_APPLMODAL);
          resultado := False;
          break;
        end;
      end;
    end;
  end;
  result := resultado;
end;

procedure TFrmPrincipalPreVenda.ImprimeEtiquetaTecno;
var L : integer;
    Arq : TextFile;
    vQtd : real;
begin
  //if not CamposObrigatoriosPreenchidos(FrmPrincipalPreVenda) then exit;
  if SgDados.Cells[0,1] = '' then begin
    Messagedlg('Não foi lançado nenhum item para impressão das etiquetas!', mtWarning, [mbOk], 0);
    EdtConsulta.Setfocus;
    exit;
  end;
  if (Trim(EdtCdCliente.Text)<> '') and (Trim(EdtCdNome.Text) <> '') then
    SalvaEtiquetas;
  Editor.Lines.Clear;
  for L := 1 to SgDados.RowCount - 1 do begin // Salvando os itens da pré-venda.
    if SgDados.Cells[0,L] = '' then Break;
    Editor.Lines.Add('c0000');
    Editor.Lines.Add('KI503');
    Editor.Lines.Add('O0220');
    Editor.Lines.Add('f220');
    Editor.Lines.Add('KW0400');
    Editor.Lines.Add('KI7');
    Editor.Lines.Add('V0');
    Editor.Lines.Add('L');
    Editor.Lines.Add('H12');
    Editor.Lines.Add('PC');
    Editor.Lines.Add('A2');
    Editor.Lines.Add('D11');
    Editor.Lines.Add('191100000730007'+ Trim(Copy(SgDados.Cells[1,L],1,20))); // Descricao part 1
    Editor.Lines.Add('191100000580007'+ Trim(Copy(SgDados.Cells[1,L],20,40))); // Descricao part 1
    Editor.Lines.Add('191100300010014R$'+ SgDados.Cells[9,L]); // preco
    Editor.Lines.Add('191100300010151R$'+ SgDados.Cells[9,L]); // preco
    Editor.Lines.Add('191100300020287R$'+ SgDados.Cells[9,L]); // preco
    Editor.Lines.Add('191100000730144'+ Trim(Copy(SgDados.Cells[1,L],1,20))); // Descricao part 1
    Editor.Lines.Add('191100000580144'+ Trim(Copy(SgDados.Cells[1,L],20,40))); // Descricao part 1
    Editor.Lines.Add('191100000730281'+ Trim(Copy(SgDados.Cells[1,L],1,20))); // Descricao part 1
    Editor.Lines.Add('191100000580281'+ Trim(Copy(SgDados.Cells[1,L],20,40))); // Descricao part 1
    Editor.Lines.Add('1D4202500200013'+ SgDados.Cells[6,L]); // barra
    Editor.Lines.Add('1D4202500200150'+ SgDados.Cells[6,L]); // barra
    Editor.Lines.Add('1D4202500200287'+ SgDados.Cells[6,L]); // barra
    Editor.Lines.Add('^01');
    //Editor.Lines.Add('Q0001');
    // Cálculo para imprimir a qtd de etiquetas certo
    if Frac(StrToFloat(SgDados.Cells[2,L])/3) = 0.00 then
      vQtd := StrToFloat(SgDados.Cells[2,L])/3
    else vQtd := (StrToint(FormatFloat('0000',StrToFloat(SgDados.Cells[2,L]))) div 3) + 1;
    Editor.Lines.Add('Q'+ FormatFloat('0000',vQtd));
    Editor.Lines.Add('E');
  end;
  Editor.Lines.SaveToFile(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'etiqueta.txt')));
  WinExec(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'print2.bat')),sw_ShowNormal);
  if not FileExists('Print2.bat') then
    ShowMessage('Não foi encontrado o arquivo Print2.bat');
  Application.OnMessage := FormPrincipal.ProcessaMsg;
  Limpar_Tela;
  RgOpcoes.ItemIndex := 0;
  Messagedlg('Impressão ok!', mtInformation, [mbOk], 0);
end;


function TFrmPrincipalPreVenda.quantidadeEmReserva(cdProduto: integer):Real;
var
  query : TADOQuery;
  resultado: Real;
begin
  query := TADOQuery.Create(self);
  query.Connection := DModulo.Conexao;
  resultado := 0;
  with query do
  begin   // Vou pegar o q está reservado  ( OU SEJA NAS OS )
    Sql.Text := 'SELECT Sum(I.nrQtd) as Qtd FROM Orcamento O WITH (NOLOCK) INNER JOIN IteOrcamento I '+
                 'WITH (NOLOCK) ON O.nrOrcamento = I.nrOrcamento Where I.cdproduto = :CDPRODUTO '+
                 'and I.dsSituacao <> ''C'' and ';
//      if (UpperCase(vEmpresa) = 'NACIONAL') or (UpperCase(vEmpresa) = 'REIDOFIAT') or (UpperCase(vEmpresa) = 'AUTOCAR') then
//          SQL.Add('O.dsImpresso <> ''S'' and O.nrObjeto <> 0 ')
//      else
          SQL.Add('O.dsImpresso = ''N'' ');
    Parameters.ParamByName('CDPRODUTO').Value := cdproduto;
    Open;
    if recordCount>0 then
       resultado := FieldByName('Qtd').AsFloat;
  end;
  freeandNil(query);
  result := resultado;
end;


procedure TFrmPrincipalPreVenda.DesbloquearPrVenda1Click(Sender: TObject);
var Qry : TAdoQuery;
begin
  if EdtLancto.Text = '' then begin
    Application.MessageBox('Digite o número da Pré Venda / OS!', 'Atenção', mb_ok + MB_ICONWARNING + MB_APPLMODAL);
    EdtLancto.SetFocus;
    exit;
  end;

  Qry := TadoQuery.Create(nil);
  qry.Connection := DModulo.Conexao;

  with qry do begin
    try
      DModulo.Conexao.BeginTrans;
      sql.Text := 'Update orcamento set dsEmUso = ''N'' where nrOrcamento = :nrOrcamento ';
      parameters.ParamByName('nrOrcamento').Value := EdtLancto.Text;
      execsql;
      DModulo.Conexao.CommitTrans;
      Application.MessageBox('Pré Venda / OS desbloqueada com sucesso!', 'Informação', mb_ok + MB_ICONINFORMATION + MB_APPLMODAL);
    except
      DModulo.Conexao.RollbackTrans;    
    end;
  end;
  qry.Free;
end;

procedure TFrmPrincipalPreVenda.Declaraodedevoluodecliente1Click(
  Sender: TObject);
begin
  if Trim(cbxNome.Text) <> '' then begin
    frmdeclaracao := TfrmDeclaracao.Create(self);
    frmDeclaracao.ShowModal;
  end else
    showMessage('Selecione o vendedor corretamente!');
end;

function TFrmPrincipalPreVenda.ChamaInputBoxTipoForracao(const ACaption,
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
        cbxFornecedor.Items.Add('Personalizado');
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

function TFrmPrincipalPreVenda.ChamaInputBoxTurno(const ACaption,
  APrompt: string): integer;
var
  Form: TForm;
  Prompt: TLabel;
  cbxFornecedor: TComboBox;
  DialogUnits: TPoint;
  ButtonTop, ButtonWidth, ButtonHeight: Integer;
  Value: Integer;
  I: Integer;
  Buffer: array[0..51] of Char;
begin
  Result := 0;
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
        cbxFornecedor.Items.Add('Nenhum');
        cbxFornecedor.Items.Add('Manhã');
        cbxFornecedor.Items.Add('Tarde');
        cbxFornecedor.Items.Add('Noite');
        cbxFornecedor.Items.Add('Integral');
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
      cbxFornecedor.ItemIndex := 1;
      if ShowModal = mrOk then begin
        Value := cbxFornecedor.ItemIndex;
        Result := Value;
      end;
    finally
      Form.Free;
      Form:=nil;
    end;
  end;
end;

function TFrmPrincipalPreVenda.ChamaInputBox(const ACaption,
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
      ClientWidth := MulDiv(180, DialogUnits.X, 4);
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
        Left := Prompt.Left;
        Top := MulDiv(19, DialogUnits.Y, 8);
        Width := MulDiv(164, DialogUnits.X, 4);
        Style := csDropDownList;
        //MaxLength := 255;
        // aqui vc pode adicionar a data de como vai ser exibida no input:
        //EditMask := '99/99/9999';
        // PasswordChar := '*';
        //SelectAll;
        With FrmPrincipalPreVenda.adoEntrada do begin // monta a combo dos clientes
          Sql.Text := 'SELECT P.nmPessoa,P.cdPessoa,E.nmLogradouro,E.dsUF,T.dsNaturalidade as Apelido,C.dsPreVenda,    '+
              'C.vlDescVista,C.vlDescPrazo,C.dsVista,C.DSLIMCREDITO                                      '+
              'FROM P_Fisica T WITH (NOLOCK) INNER JOIN Endereco E WITH (NOLOCK) ON T.cdPessoa = E.cdPessoa INNER '+
              'JOIN Pessoa P WITH (NOLOCK) ON T.cdPessoa = P.cdPessoa LEFT JOIN Cliente C WITH (NOLOCK) '+
              'ON C.cdPessoa = P.cdPessoa AND E.cdPessoa = P.cdPessoa Where (P.Ser = ''F'') and P.dsAtivo = ''S'' ';
              if (UpperCase(vEmpresa) = 'CAMARATUBA')OR(UpperCase(vEmpresa) = 'CARDOSOACESSORIOS') then
                SQL.Add('and C.cdCodigo <> 2 ');
              SQL.Add('union ');
              SQL.Add('SELECT P.nmPessoa,P.cdPessoa,E.nmLogradouro,E.dsUF,T.nmRazao as Apelido,C.dsPreVenda,');
              SQL.Add('C.vlDescVista,C.vlDescPrazo,C.dsVista,C.DSLIMCREDITO                          ');
              SQL.Add('FROM P_Juridica T WITH (NOLOCK) INNER JOIN Endereco E WITH (NOLOCK) ON T.cdPessoa = E.cdPessoa  ');
              SQL.Add('INNER JOIN Pessoa P WITH (NOLOCK) ON T.cdPessoa = P.cdPessoa LEFT JOIN Cliente C WITH (NOLOCK)  ');
              SQL.Add('ON C.cdPessoa = P.cdPessoa AND E.cdPessoa = P.cdPessoa Where (P.Ser = ''F'') and P.dsAtivo = ''S'' ');
              if (UpperCase(vEmpresa) = 'CAMARATUBA')OR(UpperCase(vEmpresa) = 'CARDOSOACESSORIOS') then
                SQL.Add('and C.cdCodigo <> 2 ');
              SQL.Add('Order By P.nmPessoa ');
          MontaComboListBoolADO(FrmPrincipalPreVenda.adoEntrada,cbxFornecedor);
        end;
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
      if ShowModal = mrOk then begin
        FrmPrincipalPreVenda.adoEntrada.Open;
        if FrmPrincipalPreVenda.adoEntrada.Locate('nmPessoa',cbxFornecedor.Text,[]) then
          Value := FrmPrincipalPreVenda.adoEntrada.FieldbyName('cdPessoa').AsString
        else
          Value := '';
        Result := Value;
      end;
    finally
      Form.Free;
      Form:=nil;
    end;
  end;
end;

procedure TFrmPrincipalPreVenda.AuxiliarLanctoNFe(i: Integer);
begin
  SgDados.Cells[0,i] := ADOQryProcura.FieldByName('cdProduto').AsString;
  SgDados.Cells[1,i] := ADOQryProduto.FieldByName('nmProduto').AsString;
  SgDados.Cells[2,i] := FloatToStr(RoundTo(ADOQryProcura.FieldByName('nrQtd').AsFloat,vCasasQtd*-1));
  SgDados.Cells[3,i] := FloatToStr(RoundTo(ADOQryProcura.FieldByName('VLUNITARIO_DESC').AsFloat,vCasasPreco*-1));
  SgDados.Cells[4,i] := FloatToStr(RoundTo(ADOQryProcura.FieldByName('nrQtd').AsFloat *
    ADOQryProcura.FieldByName('VLUNITARIO_DESC').AsFloat,-2));
  EdtTotal.Text := FloatToStr(RoundTo(StrToFloat(EdtTotal.Text) + (StrToFloat(SgDados.Cells[9,i]) * StrToFloat(SgDados.Cells[2,i])),-2));
  SgDados.Cells[6,i] := ADOQryProduto.FieldByName('cdFabricante').AsString;
  SgDados.Cells[7,i] := ADOQryProduto.FieldByName('dsReferencia').AsString;
  SgDados.Cells[8,i] := ADOQryProduto.FieldByName('nrQtdReal').AsString;
  SgDados.Cells[9,i] := FloatToStr(RoundTo(ADOQryProcura.FieldByName('vlDesconto').AsFloat,vCasasPreco*-1));
  edtValorBruto.Text := FloatToStr(RoundTo(StrToFloat(edtValorBruto.Text) + (StrToFloat(SgDados.Cells[9,i])*StrToFloat(SgDados.Cells[2,i])),-2));
end;


procedure TFrmPrincipalPreVenda.Importarvendasexternas1Click(
  Sender: TObject);
begin
  if StrToFloat(EdtTotal.Text) > 0 then begin
    ShowMessage('Existe um orçamento ou uma pré-venda em andamento!');
    exit;
  end;
  FrmListaPedidos                    := TFrmListaPedidos.Create(Application);     // Cria o formulário
//  vobs_Venda_Externa := '';
  FrmListaPedidos.Position           := poMainFormCenter;
  FrmListaPedidos.DtInicial.Date     := Date;
  FrmListaPedidos.Dt_Final.DateTime  := Date;
  FrmListaPedidos.ShowModal;
end;

// quantidade do produto em um lote na StringGrid sgDados
function TFrmPrincipalPreVenda.QuantidadeNoLoteNaGrid(nrLote:string; cdProduto:integer; cdFabricanteLote:integer):real;
var
  i: integer;
  resultado: real;
begin
  resultado:= 0;
  for i:= 1 to sgDados.RowCount-1 do
  begin
    if (sgDados.Cells[13,i] = nrLote) and (sgDados.Cells[0,i] = IntToStr(cdProduto))  then //and (sgDados.Cells[16,i] = IntToStr(cdFabricanteLote))
    begin
      resultado := resultado + strToFloatDef(sgDados.Cells[2,i],0);
    end;
  end;
  result := resultado;
end;

function TFrmPrincipalPreVenda.QuantidadePositiva: Boolean;
{Verifica se algum produto esta com a quantidade a ser vendida menor que zero}
var
  I : integer;
  resultado : Boolean;
begin
  resultado := True;
  if (RgOpcoes.ItemIndex = 0) then
  begin
    for i := 0 to prevenda.itens.Count -1 do begin
      if prevenda.itens[I].quantidade <= 0 then begin
        Application.MessageBox(PWidechar('O produto '+ prevenda.itens[I].descricao + ' está com a quantidade zerada ou negativa.'+#13#10 + 'Para excluí-lo da pré venda dê dois cliques no item!'), 'Atenção', mb_ok + mb_iconwarning + mb_applmodal);
        resultado := False;
        Break;
      end;
    end;
  end;
  result := resultado;
end;

// função para calcular a quantidade disponível no lote (qtdlote - prevendas abertas - já inseridos na prevenda atual)
function TFrmPrincipalPreVenda.QuantidadeDispNoLote(nrLote:string; cdProduto:integer; cdFabricanteLote:Integer):real;
var
  query: TADOQuery;
  qtdLote, qtdPrevendas, qtdAtual, resultado: real;
  banco_deposito: string;
begin
  query:= TADOQuery.create(self);
  query.connection:= DModulo.Conexao;
  with query do
  begin
    // PEGO A QUANTIDADE NAS TABELAS ITELOTE (LOJA + DEPÓSITO)
//    if (UpperCase(vEmpresa) = 'PBFARMA') then
//    begin
//      Connection := DModulo.ADODeposito;
//      SQL.Text := 'SELECT DB_NAME() AS DataBaseName';
//      Open;
//      banco_deposito := '[' + fieldbyname('DataBaseName').asString + ']' + '.dbo.';
//      Connection := DModulo.Conexao;
//      SQL.Text:= 'select sum(LOTE.nrQtd) as nrQtd '+
//                 'from	(select nrqtd FROM ITELOTE where (cdproduto = :CODIGO1) and (nrLote =:LOTE1) and (cdFabricante=:CDFABRICANTE1) '+
//                 '	 union all '+
//                 '	 select nrqtd FROM ' + banco_deposito + 'ITELOTE where (cdproduto = :CODIGO2) and (nrLote =:LOTE2) and (cdFabricante=:CDFABRICANTE2)) as LOTE';
//      Parameters.ParamByName('CODIGO1').Value:= cdproduto;
//      Parameters.ParamByName('CODIGO2').Value:= cdproduto;
//      Parameters.ParamByName('LOTE1').Value:= nrlote;
//      Parameters.ParamByName('LOTE2').Value:= nrlote;
//      Parameters.ParamByName('CDFABRICANTE1').Value:= cdFabricanteLote;
//      Parameters.ParamByName('CDFABRICANTE2').Value:= cdFabricanteLote;
//    end
//    else

    {  }
    begin
      SQL.Text:= 'select isnull(sum(isnull(nrqtd,0)),0) nrqtd FROM ITELOTE WITH (NOLOCK) where cdproduto = :CODIGO and nrLote =:LOTE '; // cdfabricante = :cdfabricante
      Parameters.ParamByName('CODIGO').Value:= cdproduto;
      Parameters.ParamByName('LOTE').Value:= nrlote;
      //Parameters.ParamByName('cdfabricante').Value:= cdFabricanteLote;
    end;
    Open;
    qtdLote:= fieldByName('nrqtd').AsFloat;
    // DIMINUO A QUANTIDADE JÁ USADA NAS PREVENDAS
    SQL.Text:= 'select sum(i.nrqtd) as nrqtd               '+
               'from iteorcamento i WITH (NOLOCK) inner join orcamento o WITH (NOLOCK) '+
               '	on i.nrorcamento= o.nrorcamento          '+
               'where o.nrobjeto = 0                       '+
               '	and o.dsimpresso = ''N''                 '+
               '	and i.dssituacao <> ''C''                '+
               '	and i.cdproduto = :cdproduto             '+
               '	and i.nrLote = :nrLote                   ';
//               '  and i.cdpessoa = :cdfabricante ';
    Parameters.ParamByName('cdproduto').Value:= cdproduto;
    Parameters.ParamByName('nrLote').Value:= nrLote;
    //Parameters.ParamByName('cdfabricante').Value:= cdFabricanteLote;
    Open;
    qtdPrevendas:= fieldByName('nrqtd').AsFloat;
    // DIMINUO A QUANTIDADE JÁ USADA NA GRID
    qtdAtual:= QuantidadeNoLoteNaGrid(nrLote, cdProduto, cdFabricanteLote);
  end;
  freeandnil(query);
  resultado:= qtdLote - qtdPrevendas - qtdAtual;
  if resultado < 0 then
    resultado:= 0;
  result:= resultado;
end;

procedure TFrmPrincipalPreVenda.CbLoteChange(Sender: TObject);
var
  lote: string;
  cdproduto, cdFabricanteLote: integer;
begin
  lote:= copy_campo(cblote.Text,'|',1);
  cdFabricanteLote:= StrToInt(copy_campo(cblote.Text,'|',4));
  cdproduto:= ADOSPConsulta.FieldByName('Código').AsInteger;
  setLabel23(QuantidadeDispNoLote(lote, cdproduto, cdFabricanteLote));
end;

// coloca no caption do label23 a quantidade disponível no lote selecionado
procedure TFrmPrincipalPreVenda.setLabel23(quantidade:real);
begin
  label23.caption := 'Quant. disponível: ' + FloatToStr(quantidade);
end;

procedure TFrmPrincipalPreVenda.ImprimeEtiquetaLayeVictorArgoxOS214;
var L : integer;
    Arq : TextFile;
    vQtd : real;
begin
  //if not CamposObrigatoriosPreenchidos(FrmPrincipalPreVenda) then exit;
  if SgDados.Cells[0,1] = '' then begin
    Messagedlg('Não foi lançado nenhum item para impressão das etiquetas!', mtWarning, [mbOk], 0);
    EdtConsulta.Setfocus;
    exit;
  end;
  if (Trim(EdtCdCliente.Text)<> '') and (Trim(EdtCdNome.Text) <> '') then
    SalvaEtiquetas;
  Editor.Lines.Clear;
  for L := 1 to SgDados.RowCount - 1 do begin // Salvando os itens da pré-venda.
    if SgDados.Cells[0,L] = '' then Break;

    Editor.Lines.Add('c0000');
    Editor.Lines.Add('KI503');
    Editor.Lines.Add('O0220');
    Editor.Lines.Add('f220');
    Editor.Lines.Add('KW0500');
    Editor.Lines.Add('KI7');
    Editor.Lines.Add('V0');
    Editor.Lines.Add('L');
    Editor.Lines.Add('H09');
    Editor.Lines.Add('PC');
    Editor.Lines.Add('A2');
    Editor.Lines.Add('D11');
    Editor.Lines.Add('111100000640012'+Trim(Copy(SgDados.Cells[1,L],1,20)));
    Editor.Lines.Add('131100000020013'+'R$ '+SgDados.Cells[3,L]); // preco
    Editor.Lines.Add('1F2203100200011'+Trim(SgDados.Cells[6,L]));  //Cod. Barra
    Editor.Lines.Add('131100000020154'+'R$ '+SgDados.Cells[3,L]); // preco
    Editor.Lines.Add('131100000020295'+'R$ '+SgDados.Cells[3,L]); // preco
    Editor.Lines.Add('111100000640152'+Trim(Copy(SgDados.Cells[1,L],1,20)));
    Editor.Lines.Add('1F2203100200151'+Trim(SgDados.Cells[6,L]));  //Cod. Barra
    Editor.Lines.Add('111100000640294'+Trim(Copy(SgDados.Cells[1,L],1,20)));
    Editor.Lines.Add('1F2203100200293'+Trim(SgDados.Cells[6,L]));  //Cod. Barra
    Editor.Lines.Add('^01');
    // Cálculo para imprimir a qtd de etiquetas certo
    if Frac(StrToFloat(SgDados.Cells[2,L])/3) = 0.00 then
      vQtd := StrToFloat(SgDados.Cells[2,L])/3
    else vQtd := (StrToint(FormatFloat('0000',StrToFloat(SgDados.Cells[2,L]))) div 3) + 1;
    Editor.Lines.Add('Q'+ FormatFloat('0000',vQtd));
    Editor.Lines.Add('E');
  end;
  Editor.Lines.SaveToFile(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'etiqueta.txt')));
  WinExec(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'print2.bat')),sw_ShowNormal);
  if not FileExists('Print2.bat') then
    ShowMessage('Não foi encontrado o arquivo Print2.bat');
  Application.OnMessage := FormPrincipal.ProcessaMsg;
  Limpar_Tela;
  RgOpcoes.ItemIndex := 0;
  Messagedlg('Impressão ok!', mtInformation, [mbOk], 0);
end;

procedure TFrmPrincipalPreVenda.EdtCFOPExit(Sender: TObject);
var
  cfop, UF_cliente, mensagem_retorno: string;
begin
  if CbxCliente.ItemIndex <> - 1 then begin
    cfop:= EdtCFOP.Text;
    UF_cliente:= ADOQryCliente.FieldbyName('dsUF').AsString;
    if not ValidarCFOP(cfop, False, UF_cliente, mensagem_retorno, DModulo.Conexao.ConnectionString) and (cfop<>'') then
    begin
      Application.OnMessage := FormPrincipal.NaoProcessaMsg;
      MessageDlg(mensagem_retorno,mtWarning,[mbOK],0);
      Application.OnMessage := FormPrincipal.ProcessaMsg;
      edtcfop.Clear;
      edtcfop.SetFocus;
      Exit;
    end;
  end else begin
    if (trim(CbxCliente.text) = '') and (CbxCliente.enabled) then begin
      ShowMessage('Para validar o campo CFOP, é necessário selecionar um cliente na caixa acima.');
      CbxCliente.SetFocus;
    end;
  end;
end;

procedure TFrmPrincipalPreVenda.GetValorIPILiquido;
var
  thiagod : integer;
begin
  for thiagod:=0 to 10 do begin
    sleep(1);
  end;
end;

function TFrmPrincipalPreVenda.GetVersaoArq: string;
var
  VerInfoSize: DWORD;
  VerInfo: Pointer;
  VerValueSize: DWORD;
  VerValue: PVSFixedFileInfo;
  Dummy: DWORD;
  versao : String;
begin
  VerInfoSize := GetFileVersionInfoSize(PWideChar(ParamStr(0)), Dummy);
  GetMem(VerInfo, VerInfoSize);
  GetFileVersionInfo(PWidechar(ParamStr(0)), 0,VerInfoSize, VerInfo);
  VerQueryValue(VerInfo, '\', Pointer(VerValue),VerValueSize);
  with VerValue^ do begin
    versao := IntToStr(dwFileVersionMS shr 16);
    versao := versao + '.' + IntToStr(dwFileVersionMS and $FFFF);
    versao := versao + '.' + IntToStr(dwFileVersionLS shr 16);
    versao := versao + '.' + IntToStr(dwFileVersionLS and $FFFF);
  end;
  Result := (versao);
  FreeMem(VerInfo, VerInfoSize);
end;

procedure TFrmPrincipalPreVenda.salvarPosicaoColunasDbGrid1;
var
  SupportIni: TIniFile; // Variáveis que irão cahamar o support.ini
  i: integer;
begin
  SupportIni:= TIniFile.Create(ExtractFilePath(Application.ExeName)+'Support.ini');
  try
    for i:= 0 to DBGrid1.Columns.Count-1 do begin
      SupportIni.WriteString('FrmPrincipalPreVenda.dbGrid1',IntToStr(i),DBGrid1.Columns[i].FieldName);
    end;
  except
    SupportIni.Free;
    Exit;
  end;
  SupportIni.Free;
end;

{ Carrega a última posição das colunas da DBGrid1 que ficou salva no support.ini }
procedure TFrmPrincipalPreVenda.carregarPosicaoColunasDbGrid1;
var
  SupportIni: TIniFile; // Variáveis que irão cahamar o support.ini
  i, indiceAtual: integer;
  fieldName: string;
begin
  SupportIni:= TIniFile.Create(ExtractFilePath(Application.ExeName)+'Support.ini');
  for i:=0 to DBGrid1.Columns.Count - 1 do begin
    fieldName:= SupportIni.ReadString('FrmPrincipalPreVenda.dbGrid1',IntToStr(i),'');
    if fieldName <> '' then begin
      indiceAtual:= IndexOfDbGrid(DBGrid1, fieldName);
      if indiceAtual > -1 then
        trocarColunaDbGrid(DBGrid1, indiceAtual, i);
    end;
  end;
  SupportIni.Free;
end;

procedure TFrmPrincipalPreVenda.DBGrid1ColumnMoved(Sender: TObject;
  FromIndex, ToIndex: Integer);
begin
  salvarPosicaoColunasDbGrid1;
end;

procedure TFrmPrincipalPreVenda.ImprimeEtiquetaBrumar_Nova;
var L : integer;
    Arq : TextFile;
    vQtd : real;
    vetorEtiqueta : array[1..900] of integer;
    x,z,cont : integer;
begin
  //if not CamposObrigatoriosPreenchidos(FrmPrincipalPreVenda) then exit;
  if SgDados.Cells[0,1] = '' then begin
    Messagedlg('Não foi lançado nenhum item para impressão das etiquetas!', mtWarning, [mbOk], 0);
    EdtConsulta.Setfocus;
    exit;
  end;

  cont := 0;
  for x := 1 to SgDados.RowCount do begin
    if SgDados.Cells[0,x] = '' then begin
      cont := cont + 1;
      vetorEtiqueta[cont] := 99;
      //Break;
    end
    else begin
      for z := 1 to Trunc(StrtoFloat(SgDados.Cells[2,x])) do begin
        cont := cont + 1;
        vetorEtiqueta[cont] := x;
      end;
    end;
  end;
  if Frac(cont/2) = 0.00 then
     vQtd := cont/2
  else
     vQtd := (StrToint(FormatFloat('0',cont)) div 2) + 1;
  L := Trunc(vQtd);
  cont := 1;
  Editor.Lines.Clear;
  for x := 1 to L do begin // Salvando os itens da pré-venda.
    if vetorEtiqueta[cont] = 99 then Break;

    Editor.Lines.Add('c0000');
    Editor.Lines.Add('KI503');
    Editor.Lines.Add('O0220');
    Editor.Lines.Add('f220');
    Editor.Lines.Add('KW0394');
    Editor.Lines.Add('KI7');
    Editor.Lines.Add('V0');
    Editor.Lines.Add('L');
    Editor.Lines.Add('H09');
    Editor.Lines.Add('PC');
    Editor.Lines.Add('A2');
    Editor.Lines.Add('D11');

    Editor.Lines.Add('1F3303500260032'+ SgDados.Cells[6,vetorEtiqueta[cont]]); //código de barras produto
    Editor.Lines.Add('121100000910053'+ Trim(Copy(SgDados.Cells[1,vetorEtiqueta[cont]],1,20))); //descrição
//    if SgDados.Cells[7,vetorEtiqueta[cont]] <> '' then
//      Editor.Lines.Add('191100101540009REF: '+SgDados.Cells[7,vetorEtiqueta[cont]]) //referencia
//    else
//      Editor.Lines.Add('191100101540009'+SgDados.Cells[7,vetorEtiqueta[cont]]);
    Editor.Lines.Add('121100000770053'+ Trim(Copy(SgDados.Cells[1,vetorEtiqueta[cont]],21,20))); //descrição
    if SgDados.Cells[3,vetorEtiqueta[cont]] <> '' then begin
      if StrtoFloat(FormatFloat('0.00',StrtoFloat(SgDados.Cells[3,vetorEtiqueta[cont]]))) <
                  StrtoFloat(FormatFloat('0.00',PegaValorVarejo(StrtoInt(SgDados.Cells[0,vetorEtiqueta[cont]])))) then begin//esta em promocao
        Editor.Lines.Add('121100000130030De:');
        Editor.Lines.Add('121100000130047'+FormatFloat('0.00',PegaValorVarejo(StrtoInt(SgDados.Cells[0,vetorEtiqueta[cont]]))));
        Editor.Lines.Add('121100000010060Por:');
        Editor.Lines.Add('131100000010084'+FormatFloat('0.00',StrtoFloat(SgDados.Cells[3,vetorEtiqueta[cont]])));
      end
      else
        Editor.Lines.Add('141100000040039R$ '+FormatFloat('0.00',StrtoFloat(SgDados.Cells[3,vetorEtiqueta[cont]]))); //valor
    end
    else
      Editor.Lines.Add('141100000040039'+SgDados.Cells[3,vetorEtiqueta[cont]]); //valor
    Editor.Lines.Add('1F3303500260228'+SgDados.Cells[6,vetorEtiqueta[cont+1]]);  //código de barras produto
    Editor.Lines.Add('121100000910250'+ Trim(Copy(SgDados.Cells[1,vetorEtiqueta[cont+1]],1,20)));
//    if SgDados.Cells[7,vetorEtiqueta[cont+1]] <> '' then begin
//      Editor.Lines.Add('191100101540151REF:'+SgDados.Cells[7,vetorEtiqueta[cont+1]]);  //referencia
//    end
//    else
//      Editor.Lines.Add('191100101540151'+SgDados.Cells[7,vetorEtiqueta[cont+1]]);  //referencia
    Editor.Lines.Add('121100000770250'+ Trim(Copy(SgDados.Cells[1,vetorEtiqueta[cont+1]],21,20)));
    if SgDados.Cells[3,vetorEtiqueta[cont+1]] <> '' then begin
      if StrtoFloat(FormatFloat('0.00',StrtoFloat(SgDados.Cells[3,vetorEtiqueta[cont+1]]))) <
                  StrtoFloat(FormatFloat('0.00',PegaValorVarejo(StrtoInt(SgDados.Cells[0,vetorEtiqueta[cont+1]])))) then begin//esta em promocao
        Editor.Lines.Add('121100000130226De:');
        Editor.Lines.Add('121100000130243'+FormatFloat('0.00',PegaValorVarejo(strtoint(SgDados.Cells[0,vetorEtiqueta[cont+1]]))));
        Editor.Lines.Add('121100000010256Por:');
        Editor.Lines.Add('131100000010280'+FormatFloat('0.00',StrtoFloat(SgDados.Cells[3,vetorEtiqueta[cont+1]])));
      end
      else
        Editor.Lines.Add('141100000040231R$ '+FormatFloat('0.00',StrtoFloat(SgDados.Cells[3,vetorEtiqueta[cont+1]])));
    end
    else
      Editor.Lines.Add('141100000040231'+SgDados.Cells[3,vetorEtiqueta[cont+1]]);
    if SgDados.Cells[0,vetorEtiqueta[cont]] <> '' then
      Editor.Lines.Add('421100000490037Cd:'+SgDados.Cells[0,vetorEtiqueta[cont]])
    else
      Editor.Lines.Add('421100000490037'+SgDados.Cells[0,vetorEtiqueta[cont]]);
    if SgDados.Cells[0,vetorEtiqueta[cont+1]] <> '' then
      Editor.Lines.Add('421100000430232Cd:'+SgDados.Cells[0,vetorEtiqueta[cont+1]])
    else
      Editor.Lines.Add('421100000430232'+SgDados.Cells[0,vetorEtiqueta[cont+1]]);
    Editor.Lines.Add('^01');
    // Cálculo para imprimir a qtd de etiquetas certo
    Editor.Lines.Add('Q'+ FormatFloat('0000',1));
    Editor.Lines.Add('E');
    cont := cont + 2;
  end;
  Editor.Lines.SaveToFile(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'etiqueta.txt')));
  WinExec(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'print2.bat')),sw_ShowNormal);
  if not FileExists('Print2.bat') then
    ShowMessage('Não foi encontrado o arquivo Print2.bat');
  Application.OnMessage := FormPrincipal.ProcessaMsg;
  Limpar_Tela;
  RgOpcoes.ItemIndex := 0;
  Messagedlg('Impressão ok!', mtInformation, [mbOk], 0);
end;

//procedure TFrmPrincipalPreVenda.ImprimeEtiquetaParPerfeito;
//var L : integer;
//    Arq : TextFile;
//    vQtd : real;
//    vetorEtiqueta : array[1..900] of integer;
//    x,z,cont : integer;
//begin
//  //if not CamposObrigatoriosPreenchidos(FrmPrincipalPreVenda) then exit;
//  if SgDados.Cells[0,1] = '' then begin
//    Messagedlg('Não foi lançado nenhum item para impressão das etiquetas!', mtWarning, [mbOk], 0);
//    EdtConsulta.Setfocus;
//    exit;
//  end;
//
//  cont := 0;
//  for x := 1 to SgDados.RowCount do begin
//    if SgDados.Cells[0,x] = '' then begin
//      cont := cont + 1;
//      vetorEtiqueta[cont] := 99;
//      //Break;
//    end
//    else begin
//      for z := 1 to Trunc(StrtoFloat(SgDados.Cells[2,x])) do begin
//        cont := cont + 1;
//        vetorEtiqueta[cont] := x;
//      end;
//    end;
//  end;
//  if Frac(cont/3) = 0.00 then
//     vQtd := cont/3
//  else
//     vQtd := (StrToint(FormatFloat('0',cont)) div 3) + 1;
//  L := Trunc(vQtd);
//  cont := 1;
//  Editor.Lines.Clear;
//  for x := 1 to L do begin // Salvando os itens da pré-venda.
//    if vetorEtiqueta[cont] = 99 then Break;
//
//    Editor.Lines.Add('c0000');
//    Editor.Lines.Add('KI503');
//    Editor.Lines.Add('O0220');
//    Editor.Lines.Add('f220');
//    Editor.Lines.Add('KW0417');
//    Editor.Lines.Add('KI7');
//    Editor.Lines.Add('V0');
//    Editor.Lines.Add('L');
//    Editor.Lines.Add('H12');
//    Editor.Lines.Add('PC');
//    Editor.Lines.Add('A2');
//    Editor.Lines.Add('D11');
//    Editor.Lines.Add('1Y1100001720038PB1');
//
//    Editor.Lines.Add('1F2203700770018'+ SgDados.Cells[6,vetorEtiqueta[cont]]); //código de barras produto
//    Editor.Lines.Add('121100001410009'+ Trim(Copy(SgDados.Cells[1,vetorEtiqueta[cont]],1,20))); //descrição
//    if SgDados.Cells[7,vetorEtiqueta[cont]] <> '' then
//      Editor.Lines.Add('191100101540009REF: '+SgDados.Cells[7,vetorEtiqueta[cont]]) //referencia
//    else
//      Editor.Lines.Add('191100101540009'+SgDados.Cells[7,vetorEtiqueta[cont]]);
//    Editor.Lines.Add('121100001260009'+ Trim(Copy(SgDados.Cells[1,vetorEtiqueta[cont]],21,20))); //descrição
//    if SgDados.Cells[3,vetorEtiqueta[cont]] <> '' then
//      Editor.Lines.Add('141100000250014R$ '+SgDados.Cells[3,vetorEtiqueta[cont]]) //valor
//    else
//      Editor.Lines.Add('141100000250014'+SgDados.Cells[3,vetorEtiqueta[cont]]); //valor
//    Editor.Lines.Add('1F2203700770160'+SgDados.Cells[6,vetorEtiqueta[cont+1]]);  //código de barras produto
//    Editor.Lines.Add('121100001410151'+ Trim(Copy(SgDados.Cells[1,vetorEtiqueta[cont+1]],1,20)));
//    if SgDados.Cells[7,vetorEtiqueta[cont+1]] <> '' then begin
//      Editor.Lines.Add('191100101540151REF:'+SgDados.Cells[7,vetorEtiqueta[cont+1]]);  //referencia
//      Editor.Lines.Add('1Y1100001720178PB2');
//    end
//    else
//      Editor.Lines.Add('191100101540151'+SgDados.Cells[7,vetorEtiqueta[cont+1]]);  //referencia
//    Editor.Lines.Add('121100001260151'+ Trim(Copy(SgDados.Cells[1,vetorEtiqueta[cont+1]],21,20)));
//    if SgDados.Cells[3,vetorEtiqueta[cont+1]] <> '' then
//      Editor.Lines.Add('141100000250152R$ '+SgDados.Cells[3,vetorEtiqueta[cont+1]])
//    else
//      Editor.Lines.Add('141100000250152'+SgDados.Cells[3,vetorEtiqueta[cont+1]]);
//    Editor.Lines.Add('1F2203700770302'+SgDados.Cells[6,vetorEtiqueta[cont+2]]);  //código de barras produto
//    Editor.Lines.Add('121100001410293'+ Trim(Copy(SgDados.Cells[1,vetorEtiqueta[cont+2]],1,20)));
//    if SgDados.Cells[7,vetorEtiqueta[cont+2]] <> '' then begin
//      Editor.Lines.Add('191100101540293REF:'+SgDados.Cells[7,vetorEtiqueta[cont+2]]); //referencia
//      Editor.Lines.Add('1Y1100001720320PB3');
//    end
//    else
//      Editor.Lines.Add('191100101540293'+SgDados.Cells[7,vetorEtiqueta[cont+2]]); //referencia
//    Editor.Lines.Add('121100001260293'+ Trim(Copy(SgDados.Cells[1,vetorEtiqueta[cont+2]],21,20)));
//    if SgDados.Cells[3,vetorEtiqueta[cont+2]] <> '' then
//      Editor.Lines.Add('141100000250294R$ '+SgDados.Cells[3,vetorEtiqueta[cont+2]])
//    else
//      Editor.Lines.Add('141100000250294'+SgDados.Cells[3,vetorEtiqueta[cont+2]]);
//
//    Editor.Lines.Add('^01');
//    // Cálculo para imprimir a qtd de etiquetas certo
//    Editor.Lines.Add('Q'+ FormatFloat('0000',1));
//    Editor.Lines.Add('E');
//    cont := cont + 3;
//  end;
//  Editor.Lines.SaveToFile(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'etiqueta.txt')));
//  WinExec(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'print2.bat')),sw_ShowNormal);
//  if not FileExists('Print2.bat') then
//    ShowMessage('Não foi encontrado o arquivo Print2.bat');
//  Application.OnMessage := FormPrincipal.ProcessaMsg;
//  Limpar_Tela;
//  RgOpcoes.ItemIndex := 0;
//  Messagedlg('Impressão ok!', mtInformation, [mbOk], 0);
//end;

procedure TFrmPrincipalPreVenda.ImprimeEtiquetaParPerfeito;
var L : integer;
    Arq : TextFile;
    vQtd : real;
    vetorEtiqueta : array[1..900] of integer;
    x,z,cont : integer;
begin
  //if not CamposObrigatoriosPreenchidos(FrmPrincipalPreVenda) then exit;
  if SgDados.Cells[0,1] = '' then begin
    Messagedlg('Não foi lançado nenhum item para impressão das etiquetas!', mtWarning, [mbOk], 0);
    EdtConsulta.Setfocus;
    exit;
  end;

  cont := 0;
  for x := 1 to SgDados.RowCount do begin
    if SgDados.Cells[0,x] = '' then begin
      cont := cont + 1;
      vetorEtiqueta[cont] := 99;
      //Break;
    end
    else begin
      for z := 1 to Trunc(StrtoFloat(SgDados.Cells[2,x])) do begin
        cont := cont + 1;
        vetorEtiqueta[cont] := x;
      end;
    end;
  end;
  vQtd := cont / 2;
  L := Trunc(vQtd);
  cont := 1;

  Editor.Lines.Clear;
  for x := 1 to L do begin // Salvando os itens da pré-venda.
    if (vetorEtiqueta[cont] = 99) or (vetorEtiqueta[cont] = 0) then Break;

    Editor.Lines.Add('c0000');
    Editor.Lines.Add('KI503');
    Editor.Lines.Add('O0220');
    Editor.Lines.Add('f220');
    Editor.Lines.Add('KW0335');
    Editor.Lines.Add('KI7');
    Editor.Lines.Add('V0');
    Editor.Lines.Add('L');
    Editor.Lines.Add('H12');
    Editor.Lines.Add('PC');
    Editor.Lines.Add('A2');
    Editor.Lines.Add('D11');
    //Editor.Lines.Add('1Y1100002300030PB1');

    Editor.Lines.Add('1Y1100002450222PB1');
    Editor.Lines.Add('121100001150029_____/______/_______');
    Editor.Lines.Add('111100001320022* PRAZO PARA TROCA ATE 15 DIAS');
    Editor.Lines.Add('141100000380032R$ '+SgDados.Cells[3,vetorEtiqueta[cont]]);
    Editor.Lines.Add('121100001630030'+ Trim(Copy(SgDados.Cells[1,vetorEtiqueta[cont]],1,20)));
    Editor.Lines.Add('121100001480030'+ Trim(Copy(SgDados.Cells[1,vetorEtiqueta[cont]],21,20)));
    Editor.Lines.Add('191100101750030REF: '+TNEGProduto.buscarProduto(StrtoInt(SgDados.Cells[0,vetorEtiqueta[cont]])).referenciaInterna);       //codigo
    Editor.Lines.Add('1Y1100002300193PB8');
    Editor.Lines.Add('1F2203301910034'+SgDados.Cells[6,vetorEtiqueta[cont]]); // cod barras

    if Trim(Copy(SgDados.Cells[1,vetorEtiqueta[cont+1]],1,20)) <> '' then begin
      Editor.Lines.Add('121100001150192_____/______/_______');
      Editor.Lines.Add('111100001320185* PRAZO PARA TROCA ATE 15 DIAS');
      Editor.Lines.Add('141100000380195R$ '+SgDados.Cells[3,vetorEtiqueta[cont+1]]);
      Editor.Lines.Add('121100001630193'+ Trim(Copy(SgDados.Cells[1,vetorEtiqueta[cont+1]],1,20)));
      Editor.Lines.Add('121100001480193'+ Trim(Copy(SgDados.Cells[1,vetorEtiqueta[cont+1]],21,20)));
      Editor.Lines.Add('191100101750193REF: '+TNEGProduto.buscarProduto(StrtoInt(SgDados.Cells[0,vetorEtiqueta[cont+1]])).referenciaInterna);       //codigo
//      Editor.Lines.Add('1Y1100002300193PB8');
      Editor.Lines.Add('1Y1100002450056PB2');
      Editor.Lines.Add('1F2203301920199'+SgDados.Cells[6,vetorEtiqueta[cont+1]]); // cod barras
    end;

    Editor.Lines.Add('^01');
    // Cálculo para imprimir a qtd de etiquetas certo
    Editor.Lines.Add('Q'+ FormatFloat('0000',1));
    Editor.Lines.Add('E');
    cont := cont + 2;
  end;
  Editor.Lines.SaveToFile(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'etiqueta.txt')));
  WinExec(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'print2.bat')),sw_ShowNormal);
  if not FileExists('Print2.bat') then
    ShowMessage('Não foi encontrado o arquivo Print2.bat');
  Application.OnMessage := FormPrincipal.ProcessaMsg;
  Limpar_Tela;
  RgOpcoes.ItemIndex := 0;
  Messagedlg('Impressão ok!', mtInformation, [mbOk], 0);


//var L : integer;
//    Arq : TextFile;
//    vQtd : real;
//    vetorEtiqueta : array[1..900] of integer;
//    x,z,cont : integer;
//begin
//  //if not CamposObrigatoriosPreenchidos(FrmPrincipalPreVenda) then exit;
//  if SgDados.Cells[0,1] = '' then begin
//    Messagedlg('Não foi lançado nenhum item para impressão das etiquetas!', mtWarning, [mbOk], 0);
//    EdtConsulta.Setfocus;
//    exit;
//  end;
//
//  cont := 0;
//  for x := 1 to SgDados.RowCount do begin
//    if SgDados.Cells[0,x] = '' then begin
//      cont := cont + 1;
//      vetorEtiqueta[cont] := 99;
//      //Break;
//    end
//    else begin
//      for z := 1 to Trunc(StrtoFloat(SgDados.Cells[2,x])) do begin
//        cont := cont + 1;
//        vetorEtiqueta[cont] := x;
//      end;
//    end;
//  end;
////  if Frac(cont/3) = 0.00 then
////     vQtd := cont/3
////  else
////     vQtd := (StrToint(FormatFloat('0',cont)) div 3) + 1;
//  vQtd := 2;
//  L := Trunc(vQtd);
//  cont := 1;
//  Editor.Lines.Clear;
//  for x := 1 to L do begin // Salvando os itens da pré-venda.
//    if (vetorEtiqueta[cont] = 99) or (vetorEtiqueta[cont] = 0) then Break;
//
//    Editor.Lines.Add('c0000');
//    Editor.Lines.Add('KI503');
//    Editor.Lines.Add('O0220');
//    Editor.Lines.Add('f220');
//    Editor.Lines.Add('KW0335');
//    Editor.Lines.Add('KI7');
//    Editor.Lines.Add('V0');
//    Editor.Lines.Add('L');
//    Editor.Lines.Add('H12');
//    Editor.Lines.Add('PC');
//    Editor.Lines.Add('A2');
//    Editor.Lines.Add('D11');
//    Editor.Lines.Add('1Y1100002300030PB1');
//    Editor.Lines.Add('121100001150029_____/______/_______');
//    Editor.Lines.Add('111100001320022* PRAZO PARA TROCA ATE 15 DIAS');
//    Editor.Lines.Add('141100000380032R$ '+SgDados.Cells[3,vetorEtiqueta[cont]]);
//    Editor.Lines.Add('121100001630030'+ Trim(Copy(SgDados.Cells[1,vetorEtiqueta[cont]],1,20)));
//    Editor.Lines.Add('121100001480030'+ Trim(Copy(SgDados.Cells[1,vetorEtiqueta[cont]],21,20)));
//    Editor.Lines.Add('191100101750030REF: '+TNEGProduto.buscarProduto(StrtoInt(SgDados.Cells[0,vetorEtiqueta[cont]])).referenciaInterna);       //codigo
//    Editor.Lines.Add('1Y1100002300193PB8');
//    Editor.Lines.Add('1F2203301910034'+SgDados.Cells[6,vetorEtiqueta[cont]]); // cod barras
//
//
//    if Trim(Copy(SgDados.Cells[1,vetorEtiqueta[cont+1]],1,20)) <> '' then begin
//      Editor.Lines.Add('121100001150192_____/______/_______');
//      Editor.Lines.Add('111100001320185* PRAZO PARA TROCA ATE 15 DIAS');
//      Editor.Lines.Add('141100000380195R$ '+SgDados.Cells[3,vetorEtiqueta[cont+1]]);
//      Editor.Lines.Add('121100001630193'+ Trim(Copy(SgDados.Cells[1,vetorEtiqueta[cont+1]],1,20)));
//      Editor.Lines.Add('121100001480193'+ Trim(Copy(SgDados.Cells[1,vetorEtiqueta[cont+1]],21,20)));
//      Editor.Lines.Add('191100101750193REF: '+TNEGProduto.buscarProduto(StrtoInt(SgDados.Cells[0,vetorEtiqueta[cont+1]])).referenciaInterna);       //codigo
//      Editor.Lines.Add('1Y1100002300193PB8');
//      Editor.Lines.Add('1F2203301920199'+SgDados.Cells[6,vetorEtiqueta[cont+1]]); // cod barras
//    end;
//
//    Editor.Lines.Add('^01');
//    // Cálculo para imprimir a qtd de etiquetas certo
//    Editor.Lines.Add('Q'+ FormatFloat('0000',1));
//    Editor.Lines.Add('E');
//    cont := cont + 2;
//  end;
//  Editor.Lines.SaveToFile(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'etiqueta.txt')));
//  WinExec(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'print2.bat')),sw_ShowNormal);
//  if not FileExists('Print2.bat') then
//    ShowMessage('Não foi encontrado o arquivo Print2.bat');
//  Application.OnMessage := FormPrincipal.ProcessaMsg;
//  Limpar_Tela;
//  RgOpcoes.ItemIndex := 0;
//  Messagedlg('Impressão ok!', mtInformation, [mbOk], 0);
end;

procedure TFrmPrincipalPreVenda.ImprimeEtiquetaMEGA;
var L : integer;
    Arq : TextFile;
    vQtd : real;
begin
  //if not CamposObrigatoriosPreenchidos(FrmPrincipalPreVenda) then exit;
  if SgDados.Cells[0,1] = '' then begin
    Messagedlg('Não foi lançado nenhum item para impressão das etiquetas!', mtWarning, [mbOk], 0);
    EdtConsulta.Setfocus;
    exit;
  end;
  //if (Trim(EdtCdCliente.Text)<> '') and (Trim(EdtCdNome.Text) <> '') then
    //SalvaEtiquetas;
  Editor.Lines.Clear;
  for L := 1 to SgDados.RowCount - 1 do begin // Salvando os itens da pré-venda.
    if SgDados.Cells[0,L] = '' then Break;
    Editor.Lines.Add('c0000');
    Editor.Lines.Add('KI503');
    Editor.Lines.Add('O0220');
    Editor.Lines.Add('f220');
    Editor.Lines.Add('KW0236');
    Editor.Lines.Add('KI7');
    Editor.Lines.Add('V0');
    Editor.Lines.Add('L');
    Editor.Lines.Add('H12');
    Editor.Lines.Add('PC');
    Editor.Lines.Add('A2');
    Editor.Lines.Add('D11');
    Editor.Lines.Add('1Y1100000020186PB1');
    Editor.Lines.Add('1f3303900080019'+SgDados.Cells[6,L]);       //barra
    Editor.Lines.Add('121100000750018CODIGO INTERNO....:'+TNEGProduto.buscarProduto(StrtoInt(SgDados.Cells[0,L])).referenciaInterna);       //codigo
    Editor.Lines.Add('121100001000018'+copy(SgDados.Cells[1,L],1,26));    //DESCRICAO DO PRODUTO DESCRICAO DO PRODUTO
    Editor.Lines.Add('121100000870018'+copy(SgDados.Cells[1,L],27,13));    //DESCRICAO DO PRODUTO DESCRICAO DO PRODUTO
    Editor.Lines.Add('121100000620018PRATELEIRA........:'+SgDados.Cells[5,L]); //PRATILEIRA
    Editor.Lines.Add('121100000500018CODIGO FABRICANTE.:'+TNEGProduto.buscarProduto(StrtoInt(SgDados.Cells[0,L])).referenciaFabrica);

    Editor.Lines.Add('^01');
    // Cálculo para imprimir a qtd de etiquetas certo
    vQtd := StrToFloat(SgDados.Cells[2,L]);
    Editor.Lines.Add('Q'+ IntToStr(Trunc(vQtd)));
    Editor.Lines.Add('E');
  end;
  Editor.Lines.SaveToFile(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'etiqueta.txt')));
  WinExec(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'print2.bat')),sw_ShowNormal);
  if not FileExists('Print2.bat') then
    ShowMessage('Não foi encontrado o arquivo Print2.bat');
  Application.OnMessage := FormPrincipal.ProcessaMsg;
  Limpar_Tela;
  RgOpcoes.ItemIndex := 0;
  Messagedlg('Impressão ok!', mtInformation, [mbOk], 0);
end;

procedure TFrmPrincipalPreVenda.ImprimeEtiquetaPoliana;
var L : integer;
    Arq : TextFile;
    vQtd : real;
begin
  //if not CamposObrigatoriosPreenchidos(FrmPrincipalPreVenda) then exit;
  if SgDados.Cells[0,1] = '' then begin
    Messagedlg('Não foi lançado nenhum item para impressão das etiquetas!', mtWarning, [mbOk], 0);
    EdtConsulta.Setfocus;
    exit;
  end;
  //if (Trim(EdtCdCliente.Text)<> '') and (Trim(EdtCdNome.Text) <> '') then
    //SalvaEtiquetas;
  Editor.Lines.Clear;
  for L := 1 to SgDados.RowCount - 1 do begin // Salvando os itens da pré-venda.
    if SgDados.Cells[0,L] = '' then Break;
    Editor.Lines.Add('c0000');
    Editor.Lines.Add('KI503');
    Editor.Lines.Add('O0220');
    Editor.Lines.Add('f220');
    Editor.Lines.Add('KW0415');
    Editor.Lines.Add('KI7');
    Editor.Lines.Add('V0');
    Editor.Lines.Add('L');
    Editor.Lines.Add('H12');
    Editor.Lines.Add('PC');
    Editor.Lines.Add('A2');
    Editor.Lines.Add('D11');
    Editor.Lines.Add('1F2202400050022'+SgDados.Cells[6,L]);       //barra
    Editor.Lines.Add('191100100770015'+SgDados.Cells[0,L]);       //codigo
    Editor.Lines.Add('191100300370015R$ '+formatfloat('0.00',strtofloat(SgDados.Cells[3,L])));
    Editor.Lines.Add('191100100650015'+copy(SgDados.Cells[1,L],1,20));    //DESCRICAO DO PRODUTO DESCRICAO DO PRODUTO
    Editor.Lines.Add('191100100530015'+copy(SgDados.Cells[1,L],21,20));    //DESCRICAO DO PRODUTO DESCRICAO DO PRODUTO

    Editor.Lines.Add('1F2202300060159'+SgDados.Cells[6,L]);       //barra
    Editor.Lines.Add('191100100770152'+SgDados.Cells[0,L]);       //codigo
    Editor.Lines.Add('191100300370152R$ '+formatfloat('0.00',strtofloat(SgDados.Cells[3,L])));
    Editor.Lines.Add('191100100650152'+copy(SgDados.Cells[1,L],1,20));    //DESCRICAO DO PRODUTO DESCRICAO DO PRODUTO
    Editor.Lines.Add('191100100530152'+copy(SgDados.Cells[1,L],21,20));    //DESCRICAO DO PRODUTO DESCRICAO DO PRODUTO

    Editor.Lines.Add('1F2202200070298'+SgDados.Cells[6,L]);       //barra
    Editor.Lines.Add('191100100770291'+SgDados.Cells[0,L]);       //codigo
    Editor.Lines.Add('191100300370291R$ '+formatfloat('0.00',strtofloat(SgDados.Cells[3,L])));
    Editor.Lines.Add('191100100650291'+copy(SgDados.Cells[1,L],1,20));    //DESCRICAO DO PRODUTO DESCRICAO DO PRODUTO
    Editor.Lines.Add('191100100530291'+copy(SgDados.Cells[1,L],21,20));    //DESCRICAO DO PRODUTO DESCRICAO DO PRODUTO

    Editor.Lines.Add('^01');
    // Cálculo para imprimir a qtd de etiquetas certo
    vQtd := StrToFloat(SgDados.Cells[2,L]);
    Editor.Lines.Add('Q'+ IntToStr(Trunc(vQtd)));
    Editor.Lines.Add('E');
  end;
  Editor.Lines.SaveToFile(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'etiqueta.txt')));
  WinExec(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'print2.bat')),sw_ShowNormal);
  if not FileExists('Print2.bat') then
    ShowMessage('Não foi encontrado o arquivo Print2.bat');
  Application.OnMessage := FormPrincipal.ProcessaMsg;
  Limpar_Tela;
  RgOpcoes.ItemIndex := 0;
  Messagedlg('Impressão ok!', mtInformation, [mbOk], 0);
end;

procedure TFrmPrincipalPreVenda.ImprimeEtiquetaNutriMix;
var L : integer;
    Arq : TextFile;
    vQtd : real;
begin
  //if not CamposObrigatoriosPreenchidos(FrmPrincipalPreVenda) then exit;
  if SgDados.Cells[0,1] = '' then begin
    Messagedlg('Não foi lançado nenhum item para impressão das etiquetas!', mtWarning, [mbOk], 0);
    EdtConsulta.Setfocus;
    exit;
  end;
  //if (Trim(EdtCdCliente.Text)<> '') and (Trim(EdtCdNome.Text) <> '') then
    //SalvaEtiquetas;
  Editor.Lines.Clear;
  for L := 1 to SgDados.RowCount - 1 do begin // Salvando os itens da pré-venda.
    if SgDados.Cells[0,L] = '' then Break;
    Editor.Lines.Add('c0000');
    Editor.Lines.Add('KI503');
    Editor.Lines.Add('O0220');
    Editor.Lines.Add('f220');
    Editor.Lines.Add('KW0413');
    Editor.Lines.Add('KI7');
    Editor.Lines.Add('V0');
    Editor.Lines.Add('L');
    Editor.Lines.Add('H09');
    Editor.Lines.Add('PC');
    Editor.Lines.Add('A2');
    Editor.Lines.Add('D11');
    Editor.Lines.Add('131100000870075'+SgDados.Cells[1,L]);
    Editor.Lines.Add('141200000120247R$');
    Editor.Lines.Add('161200000130273'+ formatfloat('0.00',strtofloat(SgDados.Cells[3,L])));
    Editor.Lines.Add('1F3305600120067'+SgDados.Cells[6,L]);       //barra
    Editor.Lines.Add('1Y1100000070007PB1');
    Editor.Lines.Add('^01');
    // Cálculo para imprimir a qtd de etiquetas certo
    vQtd := StrToFloat(SgDados.Cells[2,L]);
    Editor.Lines.Add('Q'+ IntToStr(Trunc(vQtd)));
    Editor.Lines.Add('E');
  end;
  Editor.Lines.SaveToFile(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'etiqueta.txt')));
  WinExec(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'print2.bat')),sw_ShowNormal);
  if not FileExists('Print2.bat') then
    ShowMessage('Não foi encontrado o arquivo Print2.bat');
  Application.OnMessage := FormPrincipal.ProcessaMsg;
  Limpar_Tela;
  RgOpcoes.ItemIndex := 0;
  Messagedlg('Impressão ok!', mtInformation, [mbOk], 0);
end;

procedure TFrmPrincipalPreVenda.ImprimeEtiquetaPR;
var L : integer;
    Arq : TextFile;
    vQtd : real;
begin
  //if not CamposObrigatoriosPreenchidos(FrmPrincipalPreVenda) then exit;
  if SgDados.Cells[0,1] = '' then begin
    Messagedlg('Não foi lançado nenhum item para impressão das etiquetas!', mtWarning, [mbOk], 0);
    EdtConsulta.Setfocus;
    exit;
  end;
  //if (Trim(EdtCdCliente.Text)<> '') and (Trim(EdtCdNome.Text) <> '') then
    //SalvaEtiquetas;
  Editor.Lines.Clear;
  for L := 1 to SgDados.RowCount - 1 do begin // Salvando os itens da pré-venda.
    if SgDados.Cells[0,L] = '' then Break;
    Editor.Lines.Add('c0000');
    Editor.Lines.Add('KI503');
    Editor.Lines.Add('O0220');
    Editor.Lines.Add('f220');
    Editor.Lines.Add('KW0429');
    Editor.Lines.Add('KI7');
    Editor.Lines.Add('V0');
    Editor.Lines.Add('L');
    Editor.Lines.Add('H12');
    Editor.Lines.Add('PC');
    Editor.Lines.Add('A2');
    Editor.Lines.Add('D11');
    Editor.Lines.Add('131100000900060'+SgDados.Cells[1,L]);
    Editor.Lines.Add('1F3304400080050'+SgDados.Cells[6,L]);       //barra
    Editor.Lines.Add('161200000090265'+ formatfloat('0.00',strtofloat(SgDados.Cells[3,L])));
    Editor.Lines.Add('132200000090228R$');
    Editor.Lines.Add('131100000690060'+SgDados.Cells[10,L]);
    Editor.Lines.Add('^01');
    // Cálculo para imprimir a qtd de etiquetas certo
    vQtd := StrToFloat(SgDados.Cells[2,L]);
    Editor.Lines.Add('Q'+ IntToStr(Trunc(vQtd)));
    Editor.Lines.Add('E');
  end;
  Editor.Lines.SaveToFile(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'etiqueta.txt')));
  WinExec(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'print2.bat')),sw_ShowNormal);
  if not FileExists('Print2.bat') then
    ShowMessage('Não foi encontrado o arquivo Print2.bat');
  Application.OnMessage := FormPrincipal.ProcessaMsg;
  Limpar_Tela;
  RgOpcoes.ItemIndex := 0;
  Messagedlg('Impressão ok!', mtInformation, [mbOk], 0);
end;

procedure TFrmPrincipalPreVenda.ImprimeEtiquetaPrecoBom;
var L : integer;
    Arq : TextFile;
    vQtd : real;
begin
  //if not CamposObrigatoriosPreenchidos(FrmPrincipalPreVenda) then exit;
  if SgDados.Cells[0,1] = '' then begin
    Messagedlg('Não foi lançado nenhum item para impressão das etiquetas!', mtWarning, [mbOk], 0);
    EdtConsulta.Setfocus;
    exit;
  end;
  Editor.Lines.Clear;
  for L := 1 to SgDados.RowCount - 1 do begin // Salvando os itens da pré-venda.
    if SgDados.Cells[0,L] = '' then Break;
    Editor.Lines.Add('c0000');
    Editor.Lines.Add('KI503');
    Editor.Lines.Add('O0220');
    Editor.Lines.Add('f220');
    Editor.Lines.Add('KW0417');
    Editor.Lines.Add('KI7');
    Editor.Lines.Add('V0');
    Editor.Lines.Add('L');
    Editor.Lines.Add('H12');
    Editor.Lines.Add('PC');
    Editor.Lines.Add('A2');
    Editor.Lines.Add('D11');

    Editor.Lines.Add('1F3304500090055' + Trim(SgDados.Cells[6,L]));
    Editor.Lines.Add('131100000790064' + RetirarAcento(Trim(SgDados.Cells[1,L])));
    Editor.Lines.Add('192200500160253' + formatfloat('0.00',strtofloat(SgDados.Cells[3,L])));
    Editor.Lines.Add('192200200440213R$');

    Editor.Lines.Add('^01');
    // Cálculo para imprimir a qtd de etiquetas certo
    vQtd := StrToFloat(SgDados.Cells[2,L]);

    Editor.Lines.Add('Q'+ IntToStr(Trunc(vQtd)));
    Editor.Lines.Add('E');
  end;
  Editor.Lines.SaveToFile(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'etiqueta.txt')));
  WinExec(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'print2.bat')),sw_ShowNormal);
  if not FileExists('Print2.bat') then
    ShowMessage('Não foi encontrado o arquivo Print2.bat');
  Application.OnMessage := FormPrincipal.ProcessaMsg;
  Limpar_Tela;
  RgOpcoes.ItemIndex := 0;
  Messagedlg('Impressão ok!', mtInformation, [mbOk], 0);
end;

procedure TFrmPrincipalPreVenda.ImprimeEtiquetaMaisEconomia;
var L : integer;
    Arq : TextFile;
    vQtd : real;
begin
  //if not CamposObrigatoriosPreenchidos(FrmPrincipalPreVenda) then exit;
  if SgDados.Cells[0,1] = '' then begin
    Messagedlg('Não foi lançado nenhum item para impressão das etiquetas!', mtWarning, [mbOk], 0);
    EdtConsulta.Setfocus;
    exit;
  end;
  Editor.Lines.Clear;
  for L := 1 to SgDados.RowCount - 1 do begin // Salvando os itens da pré-venda.
    if SgDados.Cells[0,L] = '' then Break;
    Editor.Lines.Add('c0000');
    Editor.Lines.Add('KI503');
    Editor.Lines.Add('O0220');
    Editor.Lines.Add('f220');
    Editor.Lines.Add('KW0417');
    Editor.Lines.Add('KI7');
    Editor.Lines.Add('V0');
    Editor.Lines.Add('L');
    Editor.Lines.Add('H12');
    Editor.Lines.Add('PC');
    Editor.Lines.Add('A2');
    Editor.Lines.Add('D11');
    Editor.Lines.Add('1F2201200350073' + Trim(SgDados.Cells[6,L]));
    Editor.Lines.Add('131100000810053' + Copy(RetirarAcento(Trim(SgDados.Cells[1,L])),1,20));
    Editor.Lines.Add('131100000630053' + Copy(RetirarAcento(Trim(SgDados.Cells[1,L])),21,20));
    Editor.Lines.Add('192200300010102' + formatfloat('0.00',strtofloat(SgDados.Cells[3,L])));
    Editor.Lines.Add('192200200030069R$');

    Editor.Lines.Add('^01');
    // Cálculo para imprimir a qtd de etiquetas certo
    vQtd := StrToFloat(SgDados.Cells[2,L]);

    Editor.Lines.Add('Q'+ IntToStr(Trunc(vQtd)));
    Editor.Lines.Add('E');
  end;
  Editor.Lines.SaveToFile(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'etiqueta.txt')));
  WinExec(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'print2.bat')),sw_ShowNormal);
  if not FileExists('Print2.bat') then
    ShowMessage('Não foi encontrado o arquivo Print2.bat');
  Application.OnMessage := FormPrincipal.ProcessaMsg;
  Limpar_Tela;
  RgOpcoes.ItemIndex := 0;
  Messagedlg('Impressão ok!', mtInformation, [mbOk], 0);
end;

procedure TFrmPrincipalPreVenda.ImprimeEtiquetaPR_ELGIN;
var L : integer;
    Arq : TextFile;
    vQtd : real;
begin
  //if not CamposObrigatoriosPreenchidos(FrmPrincipalPreVenda) then exit;
  if SgDados.Cells[0,1] = '' then begin
    Messagedlg('Não foi lançado nenhum item para impressão das etiquetas!', mtWarning, [mbOk], 0);
    EdtConsulta.Setfocus;
    exit;
  end;
  //if (Trim(EdtCdCliente.Text)<> '') and (Trim(EdtCdNome.Text) <> '') then
    //SalvaEtiquetas;
  Editor.Lines.Clear;
  for L := 1 to SgDados.RowCount - 1 do begin // Salvando os itens da pré-venda.
    if SgDados.Cells[0,L] = '' then Break;
    Editor.Lines.Add('N');
    Editor.Lines.Add('R0,0');
    Editor.Lines.Add('ZB');
    Editor.Lines.Add('I8,0,001');
    Editor.Lines.Add('q840');
    Editor.Lines.Add('JY0000Kf00D8');    Editor.Lines.Add('S3');
    Editor.Lines.Add('O');
    Editor.Lines.Add('JB');
    Editor.Lines.Add('JF');
    Editor.Lines.Add('A114,13,0,4,1,1,N,"'+SgDados.Cells[1,L]+'"'); //descricao
    Editor.Lines.Add('A114,42,0,4,1,1,N,"'+SgDados.Cells[10,L]+'"'); //unidade
    Editor.Lines.Add('A503,110,0,5,1,1,N,"R$"');
    Editor.Lines.Add('A575,66,0,5,1,2,N,"'+formatfloat('0.00',strtofloat(SgDados.Cells[3,L]))+'"'); //valor
    Editor.Lines.Add('B110,70,0,1,3,6,95,N,"'+SgDados.Cells[6,L]+'"');//codigo de barras
    Editor.Lines.Add('A207,169,0,3,1,1,N,"'+SgDados.Cells[6,L]+'"');
    //    Editor.Lines.Add('GG204,166,"BarCode1"');
    Editor.Lines.Add('Q200,24');
    vQtd := StrToFloat(SgDados.Cells[2,L]);
    Editor.Lines.Add('P1,'+FormatFloat('0000',vQtd));
  end;
  Editor.Lines.SaveToFile(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'etiqueta.txt')));
  WinExec(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'print2.bat')),sw_ShowNormal);
  if not FileExists('Print2.bat') then
    ShowMessage('Não foi encontrado o arquivo Print2.bat');
  Application.OnMessage := FormPrincipal.ProcessaMsg;
  Limpar_Tela;
  RgOpcoes.ItemIndex := 0;
  Messagedlg('Impressão ok!', mtInformation, [mbOk], 0);
end;

procedure TFrmPrincipalPreVenda.ImprimeEtiquetaPRECINHO10;
var L : integer;
    Arq : TextFile;
    vQtd : real;
begin
  //if not CamposObrigatoriosPreenchidos(FrmPrincipalPreVenda) then exit;
  if SgDados.Cells[0,1] = '' then begin
    Messagedlg('Não foi lançado nenhum item para impressão das etiquetas!', mtWarning, [mbOk], 0);
    EdtConsulta.Setfocus;
    exit;
  end;
  //if (Trim(EdtCdCliente.Text)<> '') and (Trim(EdtCdNome.Text) <> '') then
    //SalvaEtiquetas;
  Editor.Lines.Clear;
  for L := 1 to SgDados.RowCount - 1 do begin // Salvando os itens da pré-venda.
    if SgDados.Cells[0,L] = '' then Break;
//    Editor.Lines.Add('N');
//    Editor.Lines.Add('R0,0');
//    Editor.Lines.Add('ZB');
//    Editor.Lines.Add('I8,0,001');
//    Editor.Lines.Add('q680');
//    Editor.Lines.Add('JY0000Kf00D11');//    Editor.Lines.Add('S3');
//    Editor.Lines.Add('OD');
//    Editor.Lines.Add('JB');
//    Editor.Lines.Add('JF');
//    Editor.Lines.Add('A134,159,0,3,1,1,N,"'+SgDados.Cells[0,L]+'"');
//    Editor.Lines.Add('B60,19,0,1,3,6,126,N,"'+SgDados.Cells[0,L]+'"');//codigo de barras
//
//    Editor.Lines.Add('A454,159,0,3,1,1,N,"'+SgDados.Cells[0,L]+'"');
//    Editor.Lines.Add('B380,19,0,1,3,6,126,N,"'+SgDados.Cells[0,L]+'"');//codigo de barras
//
//    Editor.Lines.Add('Q200,16');
    Editor.Lines.Add('N');
    Editor.Lines.Add('R0,0');
    Editor.Lines.Add('ZB');
    Editor.Lines.Add('I8,0,001');
    Editor.Lines.Add('q840');
    Editor.Lines.Add('JY0000Kf00D8');    Editor.Lines.Add('S3');
    Editor.Lines.Add('O');
    Editor.Lines.Add('JB');
//    Editor.Lines.Add('A104,53,0,4,1,1,N,"PRECINHO 10"');
    Editor.Lines.Add('A65,53,0,4,1,1,N,"PRECINHO 10"');
    Editor.Lines.Add('A17,118,0,2,1,1,N,"'+Copy(SgDados.Cells[1,L],1,20)+'"');
    Editor.Lines.Add('A17,146,0,2,1,1,N,"'+Copy(SgDados.Cells[1,L],21,20)+'"');
    Editor.Lines.Add('A68,347,0,4,1,1,N,"R$'+formatfloat('0.00',strtofloat(SgDados.Cells[3,L]))+'"'); //valor
    Editor.Lines.Add('A68,283,0,2,1,1,N,"'+SgDados.Cells[6,L]+'"');//codigo de barras
    Editor.Lines.Add('B17,190,0,1,2,4,80,N,"'+SgDados.Cells[6,L]+'"');//codigo de barras

//    Editor.Lines.Add('A384,53,0,4,1,1,N,"PRECINHO 10"');
    Editor.Lines.Add('A345,53,0,4,1,1,N,"PRECINHO 10"');
    Editor.Lines.Add('A297,118,0,2,1,1,N,"'+Copy(SgDados.Cells[1,L],1,20)+'"');
    Editor.Lines.Add('A297,146,0,2,1,1,N,"'+Copy(SgDados.Cells[1,L],21,20)+'"');
    Editor.Lines.Add('A348,347,0,4,1,1,N,"R$'+formatfloat('0.00',strtofloat(SgDados.Cells[3,L]))+'"'); //valor
    Editor.Lines.Add('A348,283,0,2,1,1,N,"'+SgDados.Cells[6,L]+'"');//codigo de barras
    Editor.Lines.Add('B297,190,0,1,2,4,80,N,"'+SgDados.Cells[6,L]+'"');//codigo de barras
    Editor.Lines.Add('JF');

//    Editor.Lines.Add('A663,53,0,4,1,1,N,"PRECINHO 10"');
    Editor.Lines.Add('A605,53,0,4,1,1,N,"PRECINHO 10"');
    Editor.Lines.Add('A576,118,0,2,1,1,N,"'+Copy(SgDados.Cells[1,L],1,20)+'"');
    Editor.Lines.Add('A576,146,0,2,1,1,N,"'+Copy(SgDados.Cells[1,L],21,20)+'"');
    Editor.Lines.Add('A627,347,0,4,1,1,N,"R$'+formatfloat('0.00',strtofloat(SgDados.Cells[3,L]))+'"'); //valor
    Editor.Lines.Add('A627,283,0,2,1,1,N,"'+SgDados.Cells[6,L]+'"');//codigo de barras
    Editor.Lines.Add('B576,190,0,1,2,4,80,N,"'+SgDados.Cells[6,L]+'"');//codigo de barras
    Editor.Lines.Add('JF');

    Editor.Lines.Add('Q400,16');
    vQtd := StrToFloat(SgDados.Cells[2,L]);
    Editor.Lines.Add('P1,'+FormatFloat('0000',vQtd));
  end;
  Editor.Lines.SaveToFile(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'etiqueta.txt')));
  WinExec(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'print2.bat')),sw_ShowNormal);
  if not FileExists('Print2.bat') then
    ShowMessage('Não foi encontrado o arquivo Print2.bat');
  Application.OnMessage := FormPrincipal.ProcessaMsg;
  Limpar_Tela;
  RgOpcoes.ItemIndex := 0;
  Messagedlg('Impressão ok!', mtInformation, [mbOk], 0);
end;

procedure TFrmPrincipalPreVenda.ImprimeEtiquetaBRAZNAMODA;
var L : integer;
    Arq : TextFile;
    vQtd : real;
begin
  //if not CamposObrigatoriosPreenchidos(FrmPrincipalPreVenda) then exit;
  if SgDados.Cells[0,1] = '' then begin
    Messagedlg('Não foi lançado nenhum item para impressão das etiquetas!', mtWarning, [mbOk], 0);
    EdtConsulta.Setfocus;
    exit;
  end;
  //if (Trim(EdtCdCliente.Text)<> '') and (Trim(EdtCdNome.Text) <> '') then
    //SalvaEtiquetas;
  Editor.Lines.Clear;
  for L := 1 to SgDados.RowCount - 1 do begin // Salvando os itens da pré-venda.
    if SgDados.Cells[0,L] = '' then Break;
    Editor.Lines.Add('N');
    Editor.Lines.Add('R0,0');
    Editor.Lines.Add('ZB');
    Editor.Lines.Add('I8,0,001');
    Editor.Lines.Add('q688');
    Editor.Lines.Add('JY0000Kf00D8');    Editor.Lines.Add('S3');
    Editor.Lines.Add('O');
    Editor.Lines.Add('JB');
    Editor.Lines.Add('B50,25,0,1,2,4,80,N,"'+SgDados.Cells[6,L]+'"');//codigo de barras
    Editor.Lines.Add('A71,114,0,4,1,1,N,"'+SgDados.Cells[6,L]+'"');//codigo de barras
    Editor.Lines.Add('A105,156,0,4,1,1,N,"R$ '+FormatFloat('0.00',Strtofloat(SgDados.Cells[3,L]))+'"');
    Editor.Lines.Add('JF');
    Editor.Lines.Add('B394,25,0,1,2,4,80,N,"'+SgDados.Cells[6,L]+'"');//codigo de barras
    Editor.Lines.Add('A415,114,0,4,1,1,N,"'+SgDados.Cells[6,L]+'"');//codigo de barras
    Editor.Lines.Add('A449,156,0,4,1,1,N,"R$ '+FormatFloat('0.00',Strtofloat(SgDados.Cells[3,L]))+'"');
    Editor.Lines.Add('Q200,16');
    vQtd := StrToFloat(SgDados.Cells[2,L]);
    Editor.Lines.Add('P1,'+FormatFloat('0000',vQtd));
  end;
  Editor.Lines.SaveToFile(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'etiqueta.txt')));
  WinExec(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'print2.bat')),sw_ShowNormal);
  if not FileExists('Print2.bat') then
    ShowMessage('Não foi encontrado o arquivo Print2.bat');
  Application.OnMessage := FormPrincipal.ProcessaMsg;
  Limpar_Tela;
  RgOpcoes.ItemIndex := 0;
  Messagedlg('Impressão ok!', mtInformation, [mbOk], 0);
end;

procedure TFrmPrincipalPreVenda.ImprimeEtiquetaMERCADINHOSAOJUDASTADEU18_ELGIN;
var L : integer;
    Arq : TextFile;
    vQtd : real;
begin
  //if not CamposObrigatoriosPreenchidos(FrmPrincipalPreVenda) then exit;
  if SgDados.Cells[0,1] = '' then begin
    Messagedlg('Não foi lançado nenhum item para impressão das etiquetas!', mtWarning, [mbOk], 0);
    EdtConsulta.Setfocus;
    exit;
  end;
  //if (Trim(EdtCdCliente.Text)<> '') and (Trim(EdtCdNome.Text) <> '') then
    //SalvaEtiquetas;
  Editor.Lines.Clear;
  for L := 1 to SgDados.RowCount - 1 do begin // Salvando os itens da pré-venda.
    if SgDados.Cells[0,L] = '' then Break;
    Editor.Lines.Add('N');
    Editor.Lines.Add('R0,0');
    Editor.Lines.Add('ZB');
    Editor.Lines.Add('I8,0,001');
    Editor.Lines.Add('q840');
    Editor.Lines.Add('JY0000Kf00D8');    Editor.Lines.Add('S3');
    Editor.Lines.Add('O');
    Editor.Lines.Add('JB');
    Editor.Lines.Add('JF');
    Editor.Lines.Add('A114,13,0,4,1,1,N,"'+SgDados.Cells[1,L]+'"'); //descricao
    Editor.Lines.Add('A114,42,0,4,1,1,N,"'+SgDados.Cells[10,L]+'"'); //unidade
    Editor.Lines.Add('A503,110,0,5,1,1,N,"R$"');
    Editor.Lines.Add('A575,66,0,5,1,2,N,"'+formatfloat('0.00',strtofloat(SgDados.Cells[3,L]))+'"'); //valor
    Editor.Lines.Add('B110,70,0,1,3,6,95,N,"'+SgDados.Cells[6,L]+'"');//codigo de barras
    Editor.Lines.Add('A207,169,0,3,1,1,N,"'+SgDados.Cells[6,L]+'"');
    //    Editor.Lines.Add('GG204,166,"BarCode1"');
    Editor.Lines.Add('Q200,24');
    vQtd := StrToFloat(SgDados.Cells[2,L]);
    Editor.Lines.Add('P1,'+FormatFloat('0000',vQtd));
  end;
  Editor.Lines.SaveToFile(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'etiqueta.txt')));
  WinExec(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'print2.bat')),sw_ShowNormal);
  if not FileExists('Print2.bat') then
    ShowMessage('Não foi encontrado o arquivo Print2.bat');
  Application.OnMessage := FormPrincipal.ProcessaMsg;
  Limpar_Tela;
  RgOpcoes.ItemIndex := 0;
  Messagedlg('Impressão ok!', mtInformation, [mbOk], 0);
end;

procedure TFrmPrincipalPreVenda.ImprimeEtiquetaDAYA_ELGIN;
var L : integer;
    Arq : TextFile;
    vQtd : real;
begin
  //if not CamposObrigatoriosPreenchidos(FrmPrincipalPreVenda) then exit;
  if SgDados.Cells[0,1] = '' then begin
    Messagedlg('Não foi lançado nenhum item para impressão das etiquetas!', mtWarning, [mbOk], 0);
    EdtConsulta.Setfocus;
    exit;
  end;
  //if (Trim(EdtCdCliente.Text)<> '') and (Trim(EdtCdNome.Text) <> '') then
    //SalvaEtiquetas;
  Editor.Lines.Clear;
  for L := 1 to SgDados.RowCount - 1 do begin // Salvando os itens da pré-venda.
    if SgDados.Cells[0,L] = '' then Break;
    Editor.Lines.Add('N');
    Editor.Lines.Add('R0,0');
    Editor.Lines.Add('ZB');
    Editor.Lines.Add('I8,0,001');
    Editor.Lines.Add('q840');
    Editor.Lines.Add('JY0000Kf00D8');    Editor.Lines.Add('S3');
    Editor.Lines.Add('O');
    Editor.Lines.Add('JB');
    Editor.Lines.Add('A104,53,0,4,1,1,N,"DAYA"');
    Editor.Lines.Add('A17,118,0,2,1,1,N,"'+Copy(SgDados.Cells[1,L],1,20)+'"');
    Editor.Lines.Add('A17,146,0,2,1,1,N,"'+Copy(SgDados.Cells[1,L],21,20)+'"');
    Editor.Lines.Add('A68,347,0,4,1,1,N,"R$'+formatfloat('0.00',strtofloat(SgDados.Cells[3,L]))+'"'); //valor
    Editor.Lines.Add('A68,283,0,2,1,1,N,"'+SgDados.Cells[6,L]+'"');//codigo de barras
    Editor.Lines.Add('B17,190,0,1,2,4,80,N,"'+SgDados.Cells[6,L]+'"');//codigo de barras

    Editor.Lines.Add('A384,53,0,4,1,1,N,"DAYA"');
    Editor.Lines.Add('A297,118,0,2,1,1,N,"'+Copy(SgDados.Cells[1,L],1,20)+'"');
    Editor.Lines.Add('A297,146,0,2,1,1,N,"'+Copy(SgDados.Cells[1,L],21,20)+'"');
    Editor.Lines.Add('A348,347,0,4,1,1,N,"R$'+formatfloat('0.00',strtofloat(SgDados.Cells[3,L]))+'"'); //valor
    Editor.Lines.Add('A348,283,0,2,1,1,N,"'+SgDados.Cells[6,L]+'"');//codigo de barras
    Editor.Lines.Add('B297,190,0,1,2,4,80,N,"'+SgDados.Cells[6,L]+'"');//codigo de barras
    Editor.Lines.Add('JF');

    Editor.Lines.Add('A663,53,0,4,1,1,N,"DAYA"');
    Editor.Lines.Add('A576,118,0,2,1,1,N,"'+Copy(SgDados.Cells[1,L],1,20)+'"');
    Editor.Lines.Add('A576,146,0,2,1,1,N,"'+Copy(SgDados.Cells[1,L],21,20)+'"');
    Editor.Lines.Add('A627,347,0,4,1,1,N,"R$'+formatfloat('0.00',strtofloat(SgDados.Cells[3,L]))+'"'); //valor
    Editor.Lines.Add('A627,283,0,2,1,1,N,"'+SgDados.Cells[6,L]+'"');//codigo de barras
    Editor.Lines.Add('B576,190,0,1,2,4,80,N,"'+SgDados.Cells[6,L]+'"');//codigo de barras
    Editor.Lines.Add('JF');

    Editor.Lines.Add('Q400,16');
    vQtd := StrToFloat(SgDados.Cells[2,L]);
    Editor.Lines.Add('P1,'+FormatFloat('0000',vQtd));
  end;
  Editor.Lines.SaveToFile(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'etiqueta.txt')));
  WinExec(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'print2.bat')),sw_ShowNormal);
  if not FileExists('Print2.bat') then
    ShowMessage('Não foi encontrado o arquivo Print2.bat');
  Application.OnMessage := FormPrincipal.ProcessaMsg;
  Limpar_Tela;
  RgOpcoes.ItemIndex := 0;
  Messagedlg('Impressão ok!', mtInformation, [mbOk], 0);
end;

procedure TFrmPrincipalPreVenda.ImprimeEtiquetaJetLaser;
var L : integer;
    Arq : TextFile;
    vQtd : real;
begin
  //if not CamposObrigatoriosPreenchidos(FrmPrincipalPreVenda) then exit;
  if SgDados.Cells[0,1] = '' then begin
    Messagedlg('Não foi lançado nenhum item para impressão das etiquetas!', mtWarning, [mbOk], 0);
    EdtConsulta.Setfocus;
    exit;
  end;
  //if (Trim(EdtCdCliente.Text)<> '') and (Trim(EdtCdNome.Text) <> '') then
    //SalvaEtiquetas;
  Editor.Lines.Clear;
  for L := 1 to SgDados.RowCount - 1 do begin // Salvando os itens da pré-venda.
    if SgDados.Cells[0,L] = '' then Break;
    Editor.Lines.Add('c0000');
    Editor.Lines.Add('KI503');
    Editor.Lines.Add('O0220');
    Editor.Lines.Add('f220');
    Editor.Lines.Add('KW0346');
    Editor.Lines.Add('KI7');
    Editor.Lines.Add('V0');
    Editor.Lines.Add('L');
    Editor.Lines.Add('H12');
    Editor.Lines.Add('PC');
    Editor.Lines.Add('A2');
    Editor.Lines.Add('D11');
    Editor.Lines.Add('1f2202500230060'+SgDados.Cells[6,L]);       //barra
    Editor.Lines.Add('121100000650050'+copy(PegaNomeFabricante(strtoint(SgDados.Cells[0,L])),1,20)+'.');
    Editor.Lines.Add('121100000540050'+'Ref.'+SgDados.Cells[7,L]);
    Editor.Lines.Add('131100000020059R$ '+ formatfloat('0.00',strtofloat(SgDados.Cells[3,L])));
    Editor.Lines.Add('1f2202500230231'+SgDados.Cells[6,L]);       //barra
    Editor.Lines.Add('121100000650221'+copy(PegaNomeFabricante(strtoint(SgDados.Cells[0,L])),1,20)+'.');
    Editor.Lines.Add('121100000540221'+'Ref.'+SgDados.Cells[7,L]);
    Editor.Lines.Add('131100000020230R$ '+ formatfloat('0.00',strtofloat(SgDados.Cells[3,L])));
    Editor.Lines.Add('^01');
    // Cálculo para imprimir a qtd de etiquetas certo
    vQtd := StrToFloat(SgDados.Cells[2,L]);
    Editor.Lines.Add('Q'+ IntToStr(Trunc(vQtd)));
    Editor.Lines.Add('E');
  end;
  Editor.Lines.SaveToFile(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'etiqueta.txt')));
  WinExec(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'print2.bat')),sw_ShowNormal);
  if not FileExists('Print2.bat') then
    ShowMessage('Não foi encontrado o arquivo Print2.bat');
  Application.OnMessage := FormPrincipal.ProcessaMsg;
  Limpar_Tela;
  RgOpcoes.ItemIndex := 0;
  Messagedlg('Impressão ok!', mtInformation, [mbOk], 0);
end;

procedure TFrmPrincipalPreVenda.ImprimeEtiquetaChaloc;
var L : integer;
    Arq : TextFile;
    vQtd : real;
    nomeFabricante:String;
begin
  //if not CamposObrigatoriosPreenchidos(FrmPrincipalPreVenda) then exit;
  if SgDados.Cells[0,1] = '' then begin
    Messagedlg('Não foi lançado nenhum item para impressão das etiquetas!', mtWarning, [mbOk], 0);
    EdtConsulta.Setfocus;
    exit;
  end;
  if (Trim(EdtCdCliente.Text)<> '') and (Trim(EdtCdNome.Text) <> '') then
    SalvaEtiquetas;
  Editor.Lines.Clear;
  for L := 1 to SgDados.RowCount - 1 do begin // Salvando os itens da pré-venda.
    if SgDados.Cells[0,L] = '' then Break;

    Editor.Lines.Add('c0000');
    Editor.Lines.Add('KI503');
    Editor.Lines.Add('O0220');
    Editor.Lines.Add('f220');
    Editor.Lines.Add('KW0415');
    Editor.Lines.Add('KI7');    Editor.Lines.Add('V0');
    Editor.Lines.Add('L');
    Editor.Lines.Add('H12');
    Editor.Lines.Add('PC');
    Editor.Lines.Add('A2');
    Editor.Lines.Add('D11');
    Editor.Lines.Add('121100000590002'+Trim(Copy(SgDados.Cells[1,L],1,20)));
    Editor.Lines.Add('121100000470002'+Trim(Copy(SgDados.Cells[1,L],21,20)));
    Editor.Lines.Add('121100000590144'+Trim(Copy(SgDados.Cells[1,L],1,20)));
    Editor.Lines.Add('121100000470144'+Trim(Copy(SgDados.Cells[1,L],21,20)));
    Editor.Lines.Add('121100000590284'+Trim(Copy(SgDados.Cells[1,L],1,20)));
    Editor.Lines.Add('121100000470284'+Trim(Copy(SgDados.Cells[1,L],21,20)));
    Editor.Lines.Add('121100000730002COD: '+SgDados.Cells[0,L]);
    Editor.Lines.Add('121100000730144COD: '+SgDados.Cells[0,L]);
    Editor.Lines.Add('121100000730284COD: '+SgDados.Cells[0,L]);
    Editor.Lines.Add('131100000280002R$ '+formatfloat('0.00',strtofloat(SgDados.Cells[3,L])));
    Editor.Lines.Add('131100000280144R$ '+formatfloat('0.00',strtofloat(SgDados.Cells[3,L])));
    Editor.Lines.Add('131100000280284R$ '+formatfloat('0.00',strtofloat(SgDados.Cells[3,L])));
    nomeFabricante := copy(PegaNomeFabricante(strtoint(SgDados.Cells[0,L])),1,20);
    Editor.Lines.Add('121100000170002FAB: ' + nomeFabricante); // SgDados.Cells[7,L]);
    Editor.Lines.Add('121100000170144FAB: ' + nomeFabricante);// SgDados.Cells[7,L]);
    Editor.Lines.Add('121100000170284FAB: ' + nomeFabricante); //SgDados.Cells[7,L]);

//    Editor.Lines.Add('c0000');
//    Editor.Lines.Add('KI503');
//    Editor.Lines.Add('O0220');
//    Editor.Lines.Add('f220');
//    Editor.Lines.Add('KW0415');
//    Editor.Lines.Add('KI7');//    Editor.Lines.Add('V0');
//    Editor.Lines.Add('L');
//    Editor.Lines.Add('H12');
//    Editor.Lines.Add('PC');
//    Editor.Lines.Add('A2');
//    Editor.Lines.Add('D11');
//    Editor.Lines.Add('121100000700009'+Trim(Copy(SgDados.Cells[1,L],1,20)));
//    Editor.Lines.Add('121100000580009'+Trim(Copy(SgDados.Cells[1,L],21,20)));
//    Editor.Lines.Add('121100000700152'+Trim(Copy(SgDados.Cells[1,L],1,20)));
//    Editor.Lines.Add('121100000580152'+Trim(Copy(SgDados.Cells[1,L],21,20)));
//    Editor.Lines.Add('121100000700293'+Trim(Copy(SgDados.Cells[1,L],1,20)));
//    Editor.Lines.Add('121100000580293'+Trim(Copy(SgDados.Cells[1,L],21,20)));
//    Editor.Lines.Add('121100000440010COD: '+SgDados.Cells[0,L]);
//    Editor.Lines.Add('131100000230010R$ '+formatfloat('0.00',strtofloat(SgDados.Cells[3,L])));
//    nomeFabricante := copy(PegaNomeFabricante(strtoint(SgDados.Cells[0,L])),1,20);
//    Editor.Lines.Add('121100000090010FAB: '+ nomeFabricante); // SgDados.Cells[7,L]);
//    Editor.Lines.Add('121100000440152COD: '+SgDados.Cells[0,L]);
//    Editor.Lines.Add('131100000230152R$ '+formatfloat('0.00',strtofloat(SgDados.Cells[3,L])));
//    Editor.Lines.Add('121100000090152FAB: ' + nomeFabricante);// SgDados.Cells[7,L]);
//    Editor.Lines.Add('121100000440293COD: '+SgDados.Cells[0,L]);
//    Editor.Lines.Add('131100000230293R$ '+formatfloat('0.00',strtofloat(SgDados.Cells[3,L])));
//    Editor.Lines.Add('121100000090293FAB: '+ nomeFabricante); //SgDados.Cells[7,L]);

    Editor.Lines.Add('^01');
//    if Frac(StrToFloat(SgDados.Cells[2,L])/2) = 0.00 then
//      vQtd := StrToFloat(SgDados.Cells[2,L])/2
//    else vQtd := (StrToint(FormatFloat('000',StrToFloat(SgDados.Cells[2,L]))) div 2) + 1;
    //Editor.Lines.Add('^'+FormatFloat('00',vQtd));
    vQtd := StrToFloat(SgDados.Cells[2,L]);
    Editor.Lines.Add('Q'+FormatFloat('000',vQtd));
    Editor.Lines.Add('E');

  end;
  Editor.Lines.SaveToFile(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'etiqueta.txt')));
  WinExec(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'print2.bat')),sw_ShowNormal);
  if not FileExists('Print2.bat') then
    ShowMessage('Não foi encontrado o arquivo Print.bat');
  Application.OnMessage := FormPrincipal.ProcessaMsg;
  Limpar_Tela;
  RgOpcoes.ItemIndex := 0;
  Messagedlg('Impressão ok!', mtInformation, [mbOk], 0);
end;

procedure TFrmPrincipalPreVenda.ImprimeEtiquetaChavesDeOuro;
var L : integer;
    Arq : TextFile;
    vQtd : real;
begin
  //if not CamposObrigatoriosPreenchidos(FrmPrincipalPreVenda) then exit;
  if SgDados.Cells[0,1] = '' then begin
    Messagedlg('Não foi lançado nenhum item para impressão das etiquetas!', mtWarning, [mbOk], 0);
    EdtConsulta.Setfocus;
    exit;
  end;
  //if (Trim(EdtCdCliente.Text)<> '') and (Trim(EdtCdNome.Text) <> '') then
    //SalvaEtiquetas;
  Editor.Lines.Clear;
  for L := 1 to SgDados.RowCount - 1 do begin // Salvando os itens da pré-venda.
    if SgDados.Cells[0,L] = '' then Break;
    Editor.Lines.Add('c0000');
    Editor.Lines.Add('KI503');
    Editor.Lines.Add('O0220');
    Editor.Lines.Add('f220');
    Editor.Lines.Add('KW0417');
    Editor.Lines.Add('KI7');
    Editor.Lines.Add('V0');
    Editor.Lines.Add('L');
    Editor.Lines.Add('H12');
    Editor.Lines.Add('PC');
    Editor.Lines.Add('A2');
    Editor.Lines.Add('D11');
    Editor.Lines.Add('1F2203200100022'+SgDados.Cells[6,L]);       //barra
    Editor.Lines.Add('121100000770015'+copy(SgDados.Cells[1,L],1,20));    //DESCRICAO DO PRODUTO DESCRICAO DO PRODUTO
    Editor.Lines.Add('191100100510015REF: '+SgDados.Cells[7,L]);    //Referencia interna
    //A cliente solicitou a retirada do preço. Protocolo: 31277
    //Editor.Lines.Add('121100000390016R$ '+ formatfloat('0.00',strtofloat(SgDados.Cells[3,L])));
    Editor.Lines.Add('121100000650015'+copy(SgDados.Cells[1,L],21,20));    //DESCRICAO DO PRODUTO DESCRICAO DO PRODUTO

    Editor.Lines.Add('1F2203200100158'+SgDados.Cells[6,L]);       //barra
    Editor.Lines.Add('121100000770151'+copy(SgDados.Cells[1,L],1,20));    //DESCRICAO DO PRODUTO DESCRICAO DO PRODUTO
    Editor.Lines.Add('191100100510151REF: '+SgDados.Cells[7,L]);    //Referencia Interna
    //A cliente solicitou a retirada do preço. Protocolo: 31277
    //Editor.Lines.Add('121100000390152R$ '+ formatfloat('0.00',strtofloat(SgDados.Cells[3,L])));
    Editor.Lines.Add('121100000650151'+copy(SgDados.Cells[1,L],21,20));    //DESCRICAO DO PRODUTO DESCRICAO DO PRODUTO

    Editor.Lines.Add('1F2203200110296'+SgDados.Cells[6,L]);       //barra
    Editor.Lines.Add('121100000770288'+copy(SgDados.Cells[1,L],1,20));    //DESCRICAO DO PRODUTO DESCRICAO DO PRODUTO
    Editor.Lines.Add('191100100510288REF: '+SgDados.Cells[7,L]);    //Referencia Interna
    //A cliente solicitou a retirada do preço. Protocolo: 31277
    //Editor.Lines.Add('121100000390289R$ '+ formatfloat('0.00',strtofloat(SgDados.Cells[3,L])));
    Editor.Lines.Add('121100000650288'+copy(SgDados.Cells[1,L],21,20));    //DESCRICAO DO PRODUTO DESCRICAO DO PRODUTO

    Editor.Lines.Add('^01');
    // Cálculo para imprimir a qtd de etiquetas certo
    vQtd := StrToFloat(SgDados.Cells[2,L]);
    Editor.Lines.Add('Q'+ IntToStr(Trunc(vQtd)));
    Editor.Lines.Add('E');
  end;
  Editor.Lines.SaveToFile(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'etiqueta.txt')));
  WinExec(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'print2.bat')),sw_ShowNormal);
  if not FileExists('Print2.bat') then
    ShowMessage('Não foi encontrado o arquivo Print2.bat');
  Application.OnMessage := FormPrincipal.ProcessaMsg;
  Limpar_Tela;
  RgOpcoes.ItemIndex := 0;
  Messagedlg('Impressão ok!', mtInformation, [mbOk], 0);
end;

procedure TFrmPrincipalPreVenda.ImprimeEtiquetaPS;
var L : integer;
    Arq : TextFile;
    vQtd : real;
    exibirPreco: boolean;
begin
  //if not CamposObrigatoriosPreenchidos(FrmPrincipalPreVenda) then exit;
  if SgDados.Cells[0,1] = '' then begin
    Messagedlg('Não foi lançado nenhum item para impressão das etiquetas!', mtWarning, [mbOk], 0);
    EdtConsulta.Setfocus;
    exit;
  end;
  if Application.MessageBox('Deseja exibir o preço na etiqueta?','Confirmação',MB_YESNO + MB_ICONQUESTION + MB_APPLMODAL) = ID_YES then
    exibirPreco := true
  else
    exibirPreco := false;

  //if (Trim(EdtCdCliente.Text)<> '') and (Trim(EdtCdNome.Text) <> '') then
    //SalvaEtiquetas;
  Editor.Lines.Clear;
  for L := 1 to SgDados.RowCount - 1 do begin // Salvando os itens da pré-venda.
    if SgDados.Cells[0,L] = '' then Break;
    Editor.Lines.Add('c0000');
    Editor.Lines.Add('KI503');
    Editor.Lines.Add('O0220');
    Editor.Lines.Add('f220');
    Editor.Lines.Add('KW0394');
    Editor.Lines.Add('KI7');
    Editor.Lines.Add('V0');
    Editor.Lines.Add('L');
    Editor.Lines.Add('H12');
    Editor.Lines.Add('PC');
    Editor.Lines.Add('A2');
    Editor.Lines.Add('D11');
    Editor.Lines.Add('1F2204500200085'+SgDados.Cells[6,L]);       //barra
    Editor.Lines.Add('131100000770074'+copy(SgDados.Cells[1,L],1,35));    //DESCRICAO DO PRODUTO DESCRICAO DO PRODUTO
    if exibirPreco then begin
      Editor.Lines.Add('131100000380206R$');
      Editor.Lines.Add('161100000210225'+formatfloat('0.00',strtofloat(SgDados.Cells[3,L])));
      Editor.Lines.Add('121100000600206CODIGO: '+SgDados.Cells[0,L]);    //CODIGO:
    end
    else begin
      Editor.Lines.Add('131100000380206CODIGO: '+SgDados.Cells[0,L]);
    end;
    Editor.Lines.Add('1X1100000170071b0311007900010001');
    Editor.Lines.Add('^01');

//    Editor.Lines.Add('c0000');
//    Editor.Lines.Add('KI503');
//    Editor.Lines.Add('O0220');
//    Editor.Lines.Add('f220');
//    Editor.Lines.Add('KW0417');
//    Editor.Lines.Add('KI7');
//    Editor.Lines.Add('V0');
//    Editor.Lines.Add('L');
//    Editor.Lines.Add('H12');
//    Editor.Lines.Add('PC');
//    Editor.Lines.Add('A2');
//    Editor.Lines.Add('D11');
//    Editor.Lines.Add('1F2203900310076'+SgDados.Cells[6,L]);       //barra
//    Editor.Lines.Add('131100000780073'+copy(SgDados.Cells[1,L],1,35));    //DESCRICAO DO PRODUTO DESCRICAO DO PRODUTO
//    Editor.Lines.Add('141100000420189CODIGO: '+SgDados.Cells[0,L]);    //CODIGO:
//    Editor.Lines.Add('1X1100000190056b0310008000010001');
//    Editor.Lines.Add('^01');


// etiqueta ps antigo

//    Editor.Lines.Add('c0000');
//    Editor.Lines.Add('KI503');
//    Editor.Lines.Add('O0220');
//    Editor.Lines.Add('f220');
//    Editor.Lines.Add('KW0433');
//    Editor.Lines.Add('KI7');
//    Editor.Lines.Add('V0');
//    Editor.Lines.Add('L');
//    Editor.Lines.Add('H12');
//    Editor.Lines.Add('PC');
//    Editor.Lines.Add('A2');
//    Editor.Lines.Add('D11');
//    Editor.Lines.Add('1F3304200220004'+SgDados.Cells[6,L]);       //barra
//    Editor.Lines.Add('131100000800004'+SgDados.Cells[1,L]);
//    Editor.Lines.Add('141100000260166CODIGO: '+SgDados.Cells[0,L]);
//    Editor.Lines.Add('1X1100000200001b0313007700010001');
//    Editor.Lines.Add('^01');
    // Cálculo para imprimir a qtd de etiquetas certo
    vQtd := StrToFloat(SgDados.Cells[2,L]);
    Editor.Lines.Add('Q'+ IntToStr(Trunc(vQtd)));
    Editor.Lines.Add('E');
  end;
  Editor.Lines.SaveToFile(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'etiqueta.txt')));
  WinExec(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'print2.bat')),sw_ShowNormal);
  if not FileExists('Print2.bat') then
    ShowMessage('Não foi encontrado o arquivo Print2.bat');
  Application.OnMessage := FormPrincipal.ProcessaMsg;
  Limpar_Tela;
  RgOpcoes.ItemIndex := 0;
  Messagedlg('Impressão ok!', mtInformation, [mbOk], 0);
end;

procedure TFrmPrincipalPreVenda.ImprimeEtiquetaBrumar;
var L : integer;
    Arq : TextFile;
    vQtd : real;
begin
  //if not CamposObrigatoriosPreenchidos(FrmPrincipalPreVenda) then exit;
  if SgDados.Cells[0,1] = '' then begin
    Messagedlg('Não foi lançado nenhum item para impressão das etiquetas!', mtWarning, [mbOk], 0);
    EdtConsulta.Setfocus;
    exit;
  end;
  //if (Trim(EdtCdCliente.Text)<> '') and (Trim(EdtCdNome.Text) <> '') then
    //SalvaEtiquetas;
  Editor.Lines.Clear;
  for L := 1 to SgDados.RowCount - 1 do begin // Salvando os itens da pré-venda.
    if SgDados.Cells[0,L] = '' then Break;
    Editor.Lines.Add('c0000');
    Editor.Lines.Add('KI503');
    Editor.Lines.Add('O0220');
    Editor.Lines.Add('f220');
    Editor.Lines.Add('KW0394');
    Editor.Lines.Add('KI7');
    Editor.Lines.Add('V0');
    Editor.Lines.Add('L');
    Editor.Lines.Add('H12');
    Editor.Lines.Add('PC');
    Editor.Lines.Add('A2');
    Editor.Lines.Add('D11');
    Editor.Lines.Add('1F3305200110027'+SgDados.Cells[6,L]);       //barra
    Editor.Lines.Add('121100000840037'+copy(SgDados.Cells[1,L],1,35));    //DESCRICAO DO PRODUTO DESCRICAO DO PRODUTO
    Editor.Lines.Add('131100000430208R$');    //CODIGO:
    Editor.Lines.Add('161100000150222'+formatfloat('0.00',strtofloat(SgDados.Cells[3,L])));
    Editor.Lines.Add('^01');

// etiqueta ps antigo

//    Editor.Lines.Add('c0000');
//    Editor.Lines.Add('KI503');
//    Editor.Lines.Add('O0220');
//    Editor.Lines.Add('f220');
//    Editor.Lines.Add('KW0433');
//    Editor.Lines.Add('KI7');
//    Editor.Lines.Add('V0');
//    Editor.Lines.Add('L');
//    Editor.Lines.Add('H12');
//    Editor.Lines.Add('PC');
//    Editor.Lines.Add('A2');
//    Editor.Lines.Add('D11');
//    Editor.Lines.Add('1F3304200220004'+SgDados.Cells[6,L]);       //barra
//    Editor.Lines.Add('131100000800004'+SgDados.Cells[1,L]);
//    Editor.Lines.Add('141100000260166CODIGO: '+SgDados.Cells[0,L]);
//    Editor.Lines.Add('1X1100000200001b0313007700010001');
//    Editor.Lines.Add('^01');
    // Cálculo para imprimir a qtd de etiquetas certo
    vQtd := StrToFloat(SgDados.Cells[2,L]);
    Editor.Lines.Add('Q'+ IntToStr(Trunc(vQtd)));
    Editor.Lines.Add('E');
  end;
  Editor.Lines.SaveToFile(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'etiqueta.txt')));
  WinExec(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'print2.bat')),sw_ShowNormal);
  if not FileExists('Print2.bat') then
    ShowMessage('Não foi encontrado o arquivo Print2.bat');
  Application.OnMessage := FormPrincipal.ProcessaMsg;
  Limpar_Tela;
  RgOpcoes.ItemIndex := 0;
  Messagedlg('Impressão ok!', mtInformation, [mbOk], 0);
end;

function TFrmPrincipalPreVenda.getVMudaPreco:string;
var
  query: TADOQuery;
begin
  query:= TADOQuery.Create(self);
  query.Connection:= DModulo.Conexao;
  with query do
  begin
    SQL.Text:= 'SELECT dsMudaPreco FROM configuracao WITH(NOLOCK)';
    Open;
    result:= FieldByName('dsMudaPreco').AsString;
  end;
  FreeAndNil(query);
end;

procedure TFrmPrincipalPreVenda.ImprimeEtiquetasComplemento;
var L : integer;
    Arq : TextFile;
    vQtd : real;
begin
  //if not CamposObrigatoriosPreenchidos(FrmPrincipalPreVenda) then exit;
  if SgDados.Cells[0,1] = '' then
  begin
    Messagedlg('Não foi lançado nenhum item para impressão das etiquetas!', mtWarning, [mbOk], 0);
    EdtConsulta.Setfocus;
    exit;
  end;
  if (Trim(EdtCdCliente.Text)<> '') and (Trim(EdtCdNome.Text) <> '') then
    SalvaEtiquetas;
  Editor.Lines.Clear;
  for L := 1 to SgDados.RowCount - 1 do begin // Salvando os itens da pré-venda.
    if SgDados.Cells[0,L] = '' then Break;
    Editor.Lines.Add('c0000');
    Editor.Lines.Add('KI503');
    Editor.Lines.Add('O0220');
    Editor.Lines.Add('f220');
    Editor.Lines.Add('KW0415');
    Editor.Lines.Add('KI7');    Editor.Lines.Add('V0');
    Editor.Lines.Add('L');
    Editor.Lines.Add('H12');
    Editor.Lines.Add('PC');
    Editor.Lines.Add('A2');
    Editor.Lines.Add('D11');

    Editor.Lines.Add('121100000700009'+Trim(Copy(SgDados.Cells[1,L],1,20)));
    Editor.Lines.Add('121100000580009'+Trim(Copy(SgDados.Cells[1,L],21,20)));
    Editor.Lines.Add('121100000700149'+Trim(Copy(SgDados.Cells[1,L],1,20)));
    Editor.Lines.Add('121100000580149'+Trim(Copy(SgDados.Cells[1,L],21,20)));
    Editor.Lines.Add('121100000700290'+Trim(Copy(SgDados.Cells[1,L],1,20)));
    Editor.Lines.Add('121100000580290'+Trim(Copy(SgDados.Cells[1,L],21,20)));
    Editor.Lines.Add('121100000440010COD: '+SgDados.Cells[0,L]);
    Editor.Lines.Add('131100000230010R$ '+formatfloat('0.00',strtofloat(SgDados.Cells[3,L])));
    Editor.Lines.Add('121100000090010REF FAB.'+ SgDados.Cells[7,L]);
    Editor.Lines.Add('121100000440149COD: '+SgDados.Cells[0,L]);
    Editor.Lines.Add('131100000230149R$ '+formatfloat('0.00',strtofloat(SgDados.Cells[3,L])));
    Editor.Lines.Add('121100000090010REF FAB.'+ SgDados.Cells[7,L]);
    Editor.Lines.Add('121100000090149COD: '+SgDados.Cells[0,L]);
    Editor.Lines.Add('131100000230290R$ '+formatfloat('0.00',strtofloat(SgDados.Cells[3,L])));
    Editor.Lines.Add('121100000090290REF FAB.'+ SgDados.Cells[7,L]);

    Editor.Lines.Add('^01');
    if Frac(StrToFloat(SgDados.Cells[2,L])/2) = 0.00 then
      vQtd := StrToFloat(SgDados.Cells[2,L])/2
    else vQtd := (StrToint(FormatFloat('000',StrToFloat(SgDados.Cells[2,L]))) div 2) + 1;
    //Editor.Lines.Add('^'+FormatFloat('00',vQtd));
    Editor.Lines.Add('Q'+FormatFloat('000',vQtd));
    Editor.Lines.Add('E');

//    Editor.Lines.Add('c0000');
//    Editor.Lines.Add('KI503');
//    Editor.Lines.Add('O0220');
//    Editor.Lines.Add('f220');
//    Editor.Lines.Add('KW0354');
//    Editor.Lines.Add('KI7');//    Editor.Lines.Add('V0');
//    Editor.Lines.Add('L');
//    Editor.Lines.Add('H12');
//    Editor.Lines.Add('PC');
//    Editor.Lines.Add('A2');
//    Editor.Lines.Add('D11');
//    Editor.Lines.Add('191100100270013CÓD. '+SgDados.Cells[0,L]);
//    Editor.Lines.Add('191100200140026'+formatfloat('0.00',strtofloat(SgDados.Cells[3,L])));
//    Editor.Lines.Add('191100100030013REF FAB.'+SgDados.Cells[7,L]);
//    Editor.Lines.Add('191100100150013R$');
//    Editor.Lines.Add('191100100370013'+Trim(Copy(SgDados.Cells[1,L],21,40)));
//    Editor.Lines.Add('191100100450013'+Trim(Copy(SgDados.Cells[1,L],1,20)));
//    Editor.Lines.Add('191100100280128CÓD. '+SgDados.Cells[0,L]);
//    Editor.Lines.Add('191100200150141'+formatfloat('0.00',strtofloat(SgDados.Cells[3,L])));
//    Editor.Lines.Add('191100100040128REF FAB.'+ SgDados.Cells[7,L]);
//    Editor.Lines.Add('191100100160128R$');
//    Editor.Lines.Add('191100100380128'+Trim(Copy(SgDados.Cells[1,L],21,40)));
//    Editor.Lines.Add('191100100460128'+Trim(Copy(SgDados.Cells[1,L],1,20)));
//    Editor.Lines.Add('191100100280242CÓD. '+SgDados.Cells[0,L]);
//    Editor.Lines.Add('191100200150255'+formatfloat('0.00',strtofloat(SgDados.Cells[3,L])));
//    Editor.Lines.Add('191100100040242REF FAB.'+ SgDados.Cells[7,L]);
//    Editor.Lines.Add('191100100160242R$');
//    Editor.Lines.Add('191100100380242'+Trim(Copy(SgDados.Cells[1,L],21,40)));
//    Editor.Lines.Add('191100100460242'+Trim(Copy(SgDados.Cells[1,L],1,20)));
//    Editor.Lines.Add('^01');
    // Cálculo para imprimir a qtd de etiquetas certo
//    if Frac(StrToFloat(SgDados.Cells[2,L])/2) = 0.00 then
//      vQtd := StrToFloat(SgDados.Cells[2,L])/2
//    else vQtd := (StrToint(FormatFloat('000',StrToFloat(SgDados.Cells[2,L]))) div 2) + 1;
//    //Editor.Lines.Add('^'+FormatFloat('00',vQtd));
//    Editor.Lines.Add('Q'+FormatFloat('000',vQtd));
//    Editor.Lines.Add('E');
  end;
  Editor.Lines.SaveToFile(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'etiqueta.txt')));
  WinExec(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'print2.bat')),sw_ShowNormal);
  if not FileExists('Print2.bat') then
    ShowMessage('Não foi encontrado o arquivo Print.bat');
  Application.OnMessage := FormPrincipal.ProcessaMsg;
  Limpar_Tela;
  RgOpcoes.ItemIndex := 0;
  Messagedlg('Impressão ok!', mtInformation, [mbOk], 0);
end;

procedure TFrmPrincipalPreVenda.ImprimeEtiquetasMarttina;
var L : integer;
    Arq : TextFile;
    vQtd : real;
begin
  //if not CamposObrigatoriosPreenchidos(FrmPrincipalPreVenda) then exit;
  if SgDados.Cells[0,1] = '' then begin
    Messagedlg('Não foi lançado nenhum item para impressão das etiquetas!', mtWarning, [mbOk], 0);
    EdtConsulta.Setfocus;
    exit;
  end;
  if (Trim(EdtCdCliente.Text)<> '') and (Trim(EdtCdNome.Text) <> '') then
    SalvaEtiquetas;
  Editor.Lines.Clear;
  for L := 1 to SgDados.RowCount - 1 do begin // Salvando os itens da pré-venda.
    if SgDados.Cells[0,L] = '' then Break;
    Editor.Lines.Add('c0000');
    Editor.Lines.Add('KI503');
    Editor.Lines.Add('O0220');
    Editor.Lines.Add('f220');
    Editor.Lines.Add('KW0354');
    Editor.Lines.Add('KI7');    Editor.Lines.Add('V0');
    Editor.Lines.Add('L');
    Editor.Lines.Add('H12');
    Editor.Lines.Add('PC');
    Editor.Lines.Add('A2');
    Editor.Lines.Add('D11');
    Editor.Lines.Add('131100002030076MARTINA');
    Editor.Lines.Add('131100002040227MARTINA');
    Editor.Lines.Add('121100001600041'+Trim(Copy(SgDados.Cells[1,L],1,20)));
    Editor.Lines.Add('121100001450041'+Trim(Copy(SgDados.Cells[1,L],21,40)));
    Editor.Lines.Add('121100001600198'+Trim(Copy(SgDados.Cells[1,L],1,20)));
    Editor.Lines.Add('121100001450198'+Trim(Copy(SgDados.Cells[1,L],21,40)));
    Editor.Lines.Add('121100001250041COD FAB..: '+SgDados.Cells[7,L]);
    Editor.Lines.Add('121100001100040COD PROD.: '+SgDados.Cells[0,L]);
    Editor.Lines.Add('121100001250198COD FAB..: '+SgDados.Cells[7,L]);
    Editor.Lines.Add('121100001100198COD PROD.: '+SgDados.Cells[0,L]);
    Editor.Lines.Add('131100000800041R$');
    Editor.Lines.Add('131100000800198R$');
    Editor.Lines.Add('131100000800066'+formatfloat('0.00',strtofloat(SgDados.Cells[3,L]))+'"');
    Editor.Lines.Add('131100000800219'+formatfloat('0.00',strtofloat(SgDados.Cells[3,L]))+'"');
    Editor.Lines.Add('1F2203500220212'+SgDados.Cells[6,L]);
    Editor.Lines.Add('1F2203500200055'+SgDados.Cells[6,L]);
    Editor.Lines.Add('^01');
    // Cálculo para imprimir a qtd de etiquetas certo
    if Frac(StrToFloat(SgDados.Cells[2,L])/2) = 0.00 then
      vQtd := StrToFloat(SgDados.Cells[2,L])/2
    else vQtd := (StrToint(FormatFloat('000',StrToFloat(SgDados.Cells[2,L]))) div 2) + 1;
    //Editor.Lines.Add('^'+FormatFloat('00',vQtd));
    Editor.Lines.Add('Q'+FormatFloat('000',vQtd));
    Editor.Lines.Add('E');
  end;
  Editor.Lines.SaveToFile(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'etiqueta.txt')));
  WinExec(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'print2.bat')),sw_ShowNormal);
  if not FileExists('Print2.bat') then
    ShowMessage('Não foi encontrado o arquivo Print.bat');
  Application.OnMessage := FormPrincipal.ProcessaMsg;
  Limpar_Tela;
  RgOpcoes.ItemIndex := 0;
  Messagedlg('Impressão ok!', mtInformation, [mbOk], 0);
end;

procedure TFrmPrincipalPreVenda.ImprimeEtiquetasPazone;
var L : integer;
    Arq : TextFile;
    vQtd : real;
begin
  //if not CamposObrigatoriosPreenchidos(FrmPrincipalPreVenda) then exit;
  if SgDados.Cells[0,1] = '' then begin
    Messagedlg('Não foi lançado nenhum item para impressão das etiquetas!', mtWarning, [mbOk], 0);
    EdtConsulta.Setfocus;
    exit;
  end;
  if (Trim(EdtCdCliente.Text)<> '') and (Trim(EdtCdNome.Text) <> '') then
    SalvaEtiquetas;
  Editor.Lines.Clear;
  for L := 1 to SgDados.RowCount - 1 do begin // Salvando os itens da pré-venda.
    if SgDados.Cells[0,L] = '' then Break;
    Editor.Lines.Add('N');
    Editor.Lines.Add('R0,0');
    Editor.Lines.Add('ZB');
    Editor.Lines.Add('I8,0,001');
    Editor.Lines.Add('q856');
    Editor.Lines.Add('JY0000Kf00D8');    Editor.Lines.Add('S3');
    Editor.Lines.Add('O');
    Editor.Lines.Add('JB');
    Editor.Lines.Add('JF');
    Editor.Lines.Add('A15,11,0,4,1,1,N,"'+SgDados.Cells[1,L]+'"');
    Editor.Lines.Add('B13,63,0,1,3,6,109,N,"'+SgDados.Cells[6,L]+'"');
    Editor.Lines.Add('A425,146,0,5,1,1,N,"R$"');
    Editor.Lines.Add('A503,102,0,5,1,2,N,"'+formatfloat('0.00',strtofloat(SgDados.Cells[3,L]))+'"');
    Editor.Lines.Add('A15,42,0,3,1,1,N,"Cod. '+SgDados.Cells[0,L]+'"');
    Editor.Lines.Add('A76,178,0,3,1,1,N,"'+SgDados.Cells[6,L]+'"');
    Editor.Lines.Add('Q216,8');
    // Cálculo para imprimir a qtd de etiquetas certo
   // if Frac(StrToFloat(SgDados.Cells[2,L])/2) = 0.00 then
    vQtd := StrToFloat(SgDados.Cells[2,L]);
   // else vQtd := (StrToint(FormatFloat('0000',StrToFloat(SgDados.Cells[2,L]))) div 2) + 1;
    //Editor.Lines.Add('^'+FormatFloat('00',vQtd));
    Editor.Lines.Add('P1,'+FormatFloat('0000',vQtd));
  end;
  Editor.Lines.SaveToFile(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'etiqueta.txt')));
  WinExec(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'print2.bat')),sw_ShowNormal);
  if not FileExists('Print2.bat') then
    ShowMessage('Não foi encontrado o arquivo Print.bat');
  Application.OnMessage := FormPrincipal.ProcessaMsg;
  Limpar_Tela;
  RgOpcoes.ItemIndex := 0;
  Messagedlg('Impressão ok!', mtInformation, [mbOk], 0);
end;

procedure TFrmPrincipalPreVenda.ImprimeEtiquetasSaboramil;
var L : integer;
    Arq : TextFile;
    vQtd : real;
begin
  //if not CamposObrigatoriosPreenchidos(FrmPrincipalPreVenda) then exit;
  if SgDados.Cells[0,1] = '' then begin
    Messagedlg('Não foi lançado nenhum item para impressão das etiquetas!', mtWarning, [mbOk], 0);
    EdtConsulta.Setfocus;
    exit;
  end;
  if (Trim(EdtCdCliente.Text)<> '') and (Trim(EdtCdNome.Text) <> '') then
    SalvaEtiquetas;
  Editor.Lines.Clear;
  for L := 1 to SgDados.RowCount - 1 do begin // Salvando os itens da pré-venda.
    if SgDados.Cells[0,L] = '' then Break;
    Editor.Lines.Add('N');
    Editor.Lines.Add('R0,0');
    Editor.Lines.Add('ZB');
    Editor.Lines.Add('I8,0,001');
    Editor.Lines.Add('q856');
    Editor.Lines.Add('JY0000Kf00D8');    Editor.Lines.Add('S3');
    Editor.Lines.Add('O');
    Editor.Lines.Add('JB');
    Editor.Lines.Add('JF');
    Editor.Lines.Add('A15,11,0,4,1,1,N,"'+SgDados.Cells[1,L]+'"');
    Editor.Lines.Add('B15,59,0,1,4,8,114,N,"'+SgDados.Cells[6,L]+'"');
    Editor.Lines.Add('A15,176,0,3,1,1,N,"'+SgDados.Cells[6,L]+'"');
    Editor.Lines.Add('A617,148,0,5,1,1,N,"R$"');
    Editor.Lines.Add('A700,171,0,4,1,1,N,"'+formatfloat('0.00',strtofloat(SgDados.Cells[3,L]))+'"');
    Editor.Lines.Add('A15,38,0,3,1,1,N,"Cod. '+SgDados.Cells[0,L]+'"');
    Editor.Lines.Add('Q216,8');
    // Cálculo para imprimir a qtd de etiquetas certo
    if Frac(StrToFloat(SgDados.Cells[2,L])/2) = 0.00 then
      vQtd := StrToFloat(SgDados.Cells[2,L])/2
    else vQtd := (StrToint(FormatFloat('0000',StrToFloat(SgDados.Cells[2,L]))) div 2) + 1;
    //Editor.Lines.Add('^'+FormatFloat('00',vQtd));
    Editor.Lines.Add('P1,'+FormatFloat('0000',vQtd));
  end;
  Editor.Lines.SaveToFile(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'etiqueta.txt')));
  WinExec(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'print2.bat')),sw_ShowNormal);
  if not FileExists('Print2.bat') then
    ShowMessage('Não foi encontrado o arquivo Print.bat');
  Application.OnMessage := FormPrincipal.ProcessaMsg;
  Limpar_Tela;
  RgOpcoes.ItemIndex := 0;
  Messagedlg('Impressão ok!', mtInformation, [mbOk], 0);
end;


procedure TFrmPrincipalPreVenda.ImprimeEtiquetasDalBosco;
var L : integer;
    Arq : TextFile;
    vQtd : real;
begin
  //if not CamposObrigatoriosPreenchidos(FrmPrincipalPreVenda) then exit;
  if SgDados.Cells[0,1] = '' then begin
    Messagedlg('Não foi lançado nenhum item para impressão das etiquetas!', mtWarning, [mbOk], 0);
    EdtConsulta.Setfocus;
    exit;
  end;
  if (Trim(EdtCdCliente.Text)<> '') and (Trim(EdtCdNome.Text) <> '') then
    SalvaEtiquetas;
  Editor.Lines.Clear;
  for L := 1 to SgDados.RowCount - 1 do begin // Salvando os itens da pré-venda.
    if SgDados.Cells[0,L] = '' then Break;
    Editor.Lines.Add('N');
    Editor.Lines.Add('R0,0');
    Editor.Lines.Add('ZB');
    Editor.Lines.Add('I8,0,001');
    Editor.Lines.Add('q840');
    Editor.Lines.Add('JY0000Kf00');    Editor.Lines.Add('D8');
    Editor.Lines.Add('S3');
    Editor.Lines.Add('O');
    Editor.Lines.Add('JB');
    Editor.Lines.Add('JF');
    Editor.Lines.Add('B57,78,0,1,2,4,85,N,"'+SgDados.Cells[6,L]+'"');
    Editor.Lines.Add('A34,36,0,3,1,1,N,"'+Trim(Copy(SgDados.Cells[1,L],1,25))+'"');
    Editor.Lines.Add('A245,165,0,4,1,3,N,"R$ '+formatfloat('0.00',strtofloat(SgDados.Cells[3,L]))+'"');
    Editor.Lines.Add('A34,55,0,3,1,1,N,"'+Trim(Copy(SgDados.Cells[1,L],26,40))+'"');
    Editor.Lines.Add('LO3,32,373,2');
    Editor.Lines.Add('A57,6,0,4,1,1,N,"Rancho Dalbosco"');
    Editor.Lines.Add('A666,165,0,4,1,3,N,"R$ '+formatfloat('0.00',strtofloat(SgDados.Cells[3,L]))+'"');
    Editor.Lines.Add('B480,78,0,1,2,4,85,N,"'+SgDados.Cells[6,L]+'"');
    Editor.Lines.Add('A455,57,0,3,1,1,N,"'+Trim(Copy(SgDados.Cells[1,L],26,40))+'"');
    Editor.Lines.Add('A455,36,0,3,1,1,N,"'+Trim(Copy(SgDados.Cells[1,L],1,25))+'"');
    Editor.Lines.Add('LO420,32,373,2');
    Editor.Lines.Add('A486,6,0,4,1,1,N,"Rancho Dalbosco"');
    Editor.Lines.Add('A11,207,0,2,1,1,N,"'+SgDados.Cells[6,L]+'"');
    Editor.Lines.Add('A433,205,0,2,1,1,N,"'+SgDados.Cells[6,L]+'"');
    Editor.Lines.Add('Q240,24');
    // Cálculo para imprimir a qtd de etiquetas certo
    if Frac(StrToFloat(SgDados.Cells[2,L])/2) = 0.00 then
      vQtd := StrToFloat(SgDados.Cells[2,L])/2
    else vQtd := (StrToint(FormatFloat('0000',StrToFloat(SgDados.Cells[2,L]))) div 2) + 1;
    Editor.Lines.Add('^'+FormatFloat('00',vQtd));
    Editor.Lines.Add('P1,'+FormatFloat('0000',vQtd));
  end;
  Editor.Lines.SaveToFile(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'etiqueta.txt')));
  WinExec(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'print2.bat')),sw_ShowNormal);
  if not FileExists('Print2.bat') then
    ShowMessage('Não foi encontrado o arquivo Print.bat');
  Application.OnMessage := FormPrincipal.ProcessaMsg;
  Limpar_Tela;
  RgOpcoes.ItemIndex := 0;
  Messagedlg('Impressão ok!', mtInformation, [mbOk], 0);
end;

procedure TFrmPrincipalPreVenda.ImprimeEtiquetasComercialGraca;
var L : integer;
    Arq : TextFile;
    vQtd : real;
begin
  //if not CamposObrigatoriosPreenchidos(FrmPrincipalPreVenda) then exit;
  if SgDados.Cells[0,1] = '' then begin
    Messagedlg('Não foi lançado nenhum item para impressão das etiquetas!', mtWarning, [mbOk], 0);
    EdtConsulta.Setfocus;
    exit;
  end;
  if (Trim(EdtCdCliente.Text)<> '') and (Trim(EdtCdNome.Text) <> '') then
    SalvaEtiquetas;
  Editor.Lines.Clear;
  for L := 1 to SgDados.RowCount - 1 do begin // Salvando os itens da pré-venda.
    if SgDados.Cells[0,L] = '' then Break;
    Editor.Lines.Add('N');
    Editor.Lines.Add('R0,0');
    Editor.Lines.Add('ZB');
    Editor.Lines.Add('I8,0,001');
    Editor.Lines.Add('q840');
    Editor.Lines.Add('JY0000Kf00');    Editor.Lines.Add('D8');
    Editor.Lines.Add('S3');
    Editor.Lines.Add('O');
    Editor.Lines.Add('JB');
    Editor.Lines.Add('JF');
    Editor.Lines.Add('B57,78,0,1,2,4,85,N,"'+SgDados.Cells[6,L]+'"');
    Editor.Lines.Add('A34,36,0,3,1,1,N,"'+Trim(Copy(SgDados.Cells[1,L],1,25))+'"');
    Editor.Lines.Add('A245,165,0,4,1,3,N,"R$ '+formatfloat('0.00',strtofloat(SgDados.Cells[3,L]))+'"');
    Editor.Lines.Add('A34,55,0,3,1,1,N,"'+Trim(Copy(SgDados.Cells[1,L],26,40))+'"');
    Editor.Lines.Add('LO3,32,373,2');
    Editor.Lines.Add('A57,6,0,4,1,1,N,"Comercial Graca"');
    Editor.Lines.Add('A666,165,0,4,1,3,N,"R$ '+formatfloat('0.00',strtofloat(SgDados.Cells[3,L]))+'"');
    Editor.Lines.Add('B480,78,0,1,2,4,85,N,"'+SgDados.Cells[6,L]+'"');
    Editor.Lines.Add('A455,57,0,3,1,1,N,"'+Trim(Copy(SgDados.Cells[1,L],26,40))+'"');
    Editor.Lines.Add('A455,36,0,3,1,1,N,"'+Trim(Copy(SgDados.Cells[1,L],1,25))+'"');
    Editor.Lines.Add('LO420,32,373,2');
    Editor.Lines.Add('A486,6,0,4,1,1,N,"Comercial Graca"');
    Editor.Lines.Add('A11,207,0,2,1,1,N,"'+SgDados.Cells[6,L]+'"');
    Editor.Lines.Add('A433,205,0,2,1,1,N,"'+SgDados.Cells[6,L]+'"');
    Editor.Lines.Add('Q240,24');
    // Cálculo para imprimir a qtd de etiquetas certo
    if Frac(StrToFloat(SgDados.Cells[2,L])/2) = 0.00 then
      vQtd := StrToFloat(SgDados.Cells[2,L])/2
    else vQtd := (StrToint(FormatFloat('0000',StrToFloat(SgDados.Cells[2,L]))) div 2) + 1;
    Editor.Lines.Add('^'+FormatFloat('00',vQtd));
    Editor.Lines.Add('P1,'+FormatFloat('0000',vQtd));
  end;
  Editor.Lines.SaveToFile(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'etiqueta.txt')));
  WinExec(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'print2.bat')),sw_ShowNormal);
  if not FileExists('Print2.bat') then
    ShowMessage('Não foi encontrado o arquivo Print.bat');
  Application.OnMessage := FormPrincipal.ProcessaMsg;
  Limpar_Tela;
  RgOpcoes.ItemIndex := 0;
  Messagedlg('Impressão ok!', mtInformation, [mbOk], 0);
end;

{ Indica se a prevenda ou orçamento já possui itens lançados na grid }
function TFrmPrincipalPreVenda.possuiItensLançados:boolean;
begin
  Result:= trim(SgDados.cells[0, 1]) <> '';
end;

procedure TFrmPrincipalPreVenda.ImprimeEtiquetaEmporioJardins;
var L : integer;
    Arq : TextFile;
    vQtd : real;
begin
  //if not CamposObrigatoriosPreenchidos(FrmPrincipalPreVenda) then exit;
  if SgDados.Cells[0,1] = '' then begin
    Messagedlg('Não foi lançado nenhum item para impressão das etiquetas!', mtWarning, [mbOk], 0);
    EdtConsulta.Setfocus;
    exit;
  end;
  //if (Trim(EdtCdCliente.Text)<> '') and (Trim(EdtCdNome.Text) <> '') then
    //SalvaEtiquetas;
  Editor.Lines.Clear;
  for L := 1 to SgDados.RowCount - 1 do begin // Salvando os itens da pré-venda.
    if SgDados.Cells[0,L] = '' then Break;

    Editor.Lines.Add('c0000');
    Editor.Lines.Add('KI503');
    Editor.Lines.Add('O0220');
    Editor.Lines.Add('f220');
    Editor.Lines.Add('KW0394');
    Editor.Lines.Add('KI7');
    Editor.Lines.Add('V0');
    Editor.Lines.Add('L');
    Editor.Lines.Add('H12');
    Editor.Lines.Add('PC');
    Editor.Lines.Add('A2');
    Editor.Lines.Add('D11');

    Editor.Lines.Add('1F3304500060055'+SgDados.Cells[6,L]);
    Editor.Lines.Add('131100000760064' + Trim(Copy(SgDados.Cells[1,L],1,40)));
    Editor.Lines.Add('121100000960065Codigo:');
    Editor.Lines.Add('121100000960114'+ SgDados.Cells[0,L]);
    Editor.Lines.Add('192200500210223R$'+ formatfloat('0.00',strtofloat(SgDados.Cells[3,L])));

//    Editor.Lines.Add('1F3306200060015'+SgDados.Cells[6,L]);
//    Editor.Lines.Add('191100200820024' + Trim(Copy(SgDados.Cells[1,L],1,40)));
//    Editor.Lines.Add('111100000990025Codigo:');
//    Editor.Lines.Add('111100000990059'+ SgDados.Cells[0,L]);
//    Editor.Lines.Add('192200500210183R$'+ formatfloat('0.00',strtofloat(SgDados.Cells[3,L])));

//    Editor.Lines.Add('1F2202900080128'+SgDados.Cells[6,L]);
//    Editor.Lines.Add('191100100470010' + Trim(Copy(SgDados.Cells[1,L],1,20)));
//    Editor.Lines.Add('111100000100074Cod:');
//    Editor.Lines.Add('111100000100093'+ SgDados.Cells[0,L]);
//    Editor.Lines.Add('121100000100012R$'+ formatfloat('0.00',strtofloat(SgDados.Cells[3,L])));
//    Editor.Lines.Add('111100000490131Cod:');
//    Editor.Lines.Add('111100000490151'+ SgDados.Cells[0,L]);
//    Editor.Lines.Add('111100000480199R$'+ formatfloat('0.00',strtofloat(SgDados.Cells[3,L])));
//    Editor.Lines.Add('191100100340010' + Trim(Copy(SgDados.Cells[1,L],21,20)));
//    Editor.Lines.Add('111100000230010'+ SgDados.Cells[7,L]);

    Editor.Lines.Add('^01');
    // Cálculo para imprimir a qtd de etiquetas certo
    vQtd := StrToFloat(SgDados.Cells[2,L]);
    Editor.Lines.Add('Q'+ IntToStr(Trunc(vQtd)));
    Editor.Lines.Add('E');
  end;
  Editor.Lines.SaveToFile(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'etiqueta.txt')));
  WinExec(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'print2.bat')),sw_ShowNormal);
  if not FileExists('Print2.bat') then
    ShowMessage('Não foi encontrado o arquivo Print2.bat');
  Application.OnMessage := FormPrincipal.ProcessaMsg;
  Limpar_Tela;
  RgOpcoes.ItemIndex := 0;
  Messagedlg('Impressão ok!', mtInformation, [mbOk], 0);
end;

procedure TFrmPrincipalPreVenda.ImprimeEtiquetaEmporioJardins_Pequeno;
var L : integer;
    Arq : TextFile;
    vQtd : real;
begin
  //if not CamposObrigatoriosPreenchidos(FrmPrincipalPreVenda) then exit;
  if SgDados.Cells[0,1] = '' then begin
    Messagedlg('Não foi lançado nenhum item para impressão das etiquetas!', mtWarning, [mbOk], 0);
    EdtConsulta.Setfocus;
    exit;
  end;
  //if (Trim(EdtCdCliente.Text)<> '') and (Trim(EdtCdNome.Text) <> '') then
    //SalvaEtiquetas;
  Editor.Lines.Clear;
  for L := 1 to SgDados.RowCount - 1 do begin // Salvando os itens da pré-venda.
    if SgDados.Cells[0,L] = '' then Break;

    Editor.Lines.Add('c0000');
    Editor.Lines.Add('KI503');
    Editor.Lines.Add('O0220');
    Editor.Lines.Add('f220');
    Editor.Lines.Add('KW0394');
    Editor.Lines.Add('KI7');
    Editor.Lines.Add('V0');
    Editor.Lines.Add('L');
    Editor.Lines.Add('H12');
    Editor.Lines.Add('PC');
    Editor.Lines.Add('A2');
    Editor.Lines.Add('D11');

//    Editor.Lines.Add('1F2204100080050'+SgDados.Cells[6,L]);
//    Editor.Lines.Add('131100000760055' + Trim(Copy(SgDados.Cells[1,L],1,20)));
//    Editor.Lines.Add('121100000960056Codigo:');
//    Editor.Lines.Add('121100000960101'+ SgDados.Cells[0,L]);
//    Editor.Lines.Add('192200100220168'+ formatfloat('0.00',strtofloat(SgDados.Cells[3,L])));
//    Editor.Lines.Add('131100000590055' + Trim(Copy(SgDados.Cells[1,L],21,20)));
//    Editor.Lines.Add('191100000250155R$');

    Editor.Lines.Add('131100000860055' + Trim(Copy(SgDados.Cells[1,L],1,20)));
    Editor.Lines.Add('192200400260093'+ formatfloat('0.00',strtofloat(SgDados.Cells[3,L])));
    Editor.Lines.Add('131100000690055' + Trim(Copy(SgDados.Cells[1,L],21,20)));
    Editor.Lines.Add('191100400310065R$');
    Editor.Lines.Add('191100200060090'+SgDados.Cells[6,L]);

    Editor.Lines.Add('^01');
    // Cálculo para imprimir a qtd de etiquetas certo
    vQtd := StrToFloat(SgDados.Cells[2,L]);
    Editor.Lines.Add('Q'+ IntToStr(Trunc(vQtd)));
    Editor.Lines.Add('E');
  end;
  Editor.Lines.SaveToFile(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'etiqueta.txt')));
  WinExec(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'print2.bat')),sw_ShowNormal);
  if not FileExists('Print2.bat') then
    ShowMessage('Não foi encontrado o arquivo Print2.bat');
  Application.OnMessage := FormPrincipal.ProcessaMsg;
  Limpar_Tela;
  RgOpcoes.ItemIndex := 0;
  Messagedlg('Impressão ok!', mtInformation, [mbOk], 0);
end;

procedure TFrmPrincipalPreVenda.ImprimeEtiquetaOticaSantaLuiza;
var L : integer;
    Arq : TextFile;
    vQtd : real;
begin
  //if not CamposObrigatoriosPreenchidos(FrmPrincipalPreVenda) then exit;
  if SgDados.Cells[0,1] = '' then begin
    Messagedlg('Não foi lançado nenhum item para impressão das etiquetas!', mtWarning, [mbOk], 0);
    EdtConsulta.Setfocus;
    exit;
  end;
  //if (Trim(EdtCdCliente.Text)<> '') and (Trim(EdtCdNome.Text) <> '') then
    //SalvaEtiquetas;
  Editor.Lines.Clear;
  for L := 1 to SgDados.RowCount - 1 do begin // Salvando os itens da pré-venda.
    if SgDados.Cells[0,L] = '' then Break;

    Editor.Lines.Add('c0000');
    Editor.Lines.Add('KI503');
    Editor.Lines.Add('O0220');
    Editor.Lines.Add('f220');
    Editor.Lines.Add('KW0394');
    Editor.Lines.Add('KI7');
    Editor.Lines.Add('V0');
    Editor.Lines.Add('L');
    Editor.Lines.Add('H12');
    Editor.Lines.Add('PC');
    Editor.Lines.Add('A2');
    Editor.Lines.Add('D11');

    Editor.Lines.Add('1F2202900080128'+SgDados.Cells[6,L]);
    Editor.Lines.Add('191100100470010' + Trim(Copy(SgDados.Cells[1,L],1,20)));
    Editor.Lines.Add('111100000100074Cod:');
    Editor.Lines.Add('111100000100093'+ SgDados.Cells[0,L]);
    Editor.Lines.Add('121100000100012R$'+ formatfloat('0.00',strtofloat(SgDados.Cells[3,L])));
    Editor.Lines.Add('111100000490131Cod:');
    Editor.Lines.Add('111100000490151'+ SgDados.Cells[0,L]);
    Editor.Lines.Add('111100000480199R$'+ formatfloat('0.00',strtofloat(SgDados.Cells[3,L])));
    Editor.Lines.Add('191100100340010' + Trim(Copy(SgDados.Cells[1,L],21,20)));
    Editor.Lines.Add('111100000230010'+ SgDados.Cells[7,L]);

    Editor.Lines.Add('^01');
    // Cálculo para imprimir a qtd de etiquetas certo
    vQtd := StrToFloat(SgDados.Cells[2,L]);
    Editor.Lines.Add('Q'+ IntToStr(Trunc(vQtd)));
    Editor.Lines.Add('E');
  end;
  Editor.Lines.SaveToFile(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'etiqueta.txt')));
  WinExec(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'print2.bat')),sw_ShowNormal);
  if not FileExists('Print2.bat') then
    ShowMessage('Não foi encontrado o arquivo Print2.bat');
  Application.OnMessage := FormPrincipal.ProcessaMsg;
  Limpar_Tela;
  RgOpcoes.ItemIndex := 0;
  Messagedlg('Impressão ok!', mtInformation, [mbOk], 0);
end;

function TFrmPrincipalPreVenda.MessageDlgDef2(const Msg, MyCaption: string;
  AType: TMsgDlgType; AButtons: TMsgDlgButtons; DefButton: TModalResult;
  HelpCtx: Integer): Word;
var
  i : Integer;
begin
  with CreateMessageDialog(Msg,AType,AButtons) do
  begin
    try
      Caption := MyCaption;
      HelpContext := HelpCtx;
      for i := 0 to ComponentCount - 1 do
      begin
        if (Components[i] is TButton) and (TButton(Components[i]).ModalResult = DefButton) then
          ActiveControl := TButton(Components[i]);
        if Components[i] is TButton then
        begin
          with TButton(Components[i]) do
          begin
            case ModalResult of
              mrYes : Caption:= '&Varejo';
              mrNo : Caption:= 'No';
              mrOK : Caption:= '&Atacado';
              mrCancel : Caption:= 'Cancela';
              mrAbort : Caption:= 'Abortar';
              mrRetry : Caption:= 'Tente Novamente';
              mrIgnore : Caption:= 'Ignorar';
            end;
          end;
        end;
      end;
      Result := ShowModal;
    finally
      Free;
    end;
  end;
end;

procedure TFrmPrincipalPreVenda.ImprimeEtiquetasSafiraZebra;
var L : integer;
    Arq : TextFile;
    vQtd : real;
    produto: TDOMProduto;
    esp1, esp2, esp3: string;
    i, ult: integer;
begin
  //if not CamposObrigatoriosPreenchidos(FrmPrincipalPreVenda) then exit;
  if SgDados.Cells[0,1] = '' then begin
    Messagedlg('Não foi lançado nenhum item para impressão das etiquetas!', mtWarning, [mbOk], 0);
    EdtConsulta.Setfocus;
    exit;
  end;
  Editor.Lines.Clear;
  for L := 1 to SgDados.RowCount - 1 do begin
    if SgDados.Cells[0,L] = '' then Break;
    produto := TNegProduto.BuscarProduto(strtoint(SgDados.Cells[0,L]));
    Editor.Lines.Add('I8,A,001');
    Editor.Lines.Add('');
    Editor.Lines.Add('');
    Editor.Lines.Add('Q112,024');
    Editor.Lines.Add('q831');
    Editor.Lines.Add('rN');
    Editor.Lines.Add('S4');
    Editor.Lines.Add('D7');
    Editor.Lines.Add('ZT');
    Editor.Lines.Add('JF');
    Editor.Lines.Add('OD');
    Editor.Lines.Add('R136,0');
    Editor.Lines.Add('f100');
    Editor.Lines.Add('N');
    Editor.Lines.Add('A305,37,2,1,1,1,N,"'+produto.referenciaFabrica+'"');

    Memo1.Text := produto.especificacao;

    esp1 := '';
    esp2 := '';
    esp3 := '';

    for I := 0 to Memo1.Lines.Count - 1 do begin
      if i = 0 then begin
        if Memo1.lines[i] <> '' then
          esp1 := copy(Memo1.lines[i],1,14);
      end
      else
      if i = 1 then begin
        if Memo1.lines[i] <> '' then
          esp2 := copy(Memo1.lines[i],1,14);
      end
      else
      if i = 2 then begin
        if Memo1.lines[i] <> '' then
          esp3 := copy(Memo1.lines[i],1,14);
      end;
    end;

    Editor.Lines.Add('A145,41,2,1,1,1,N,"'+esp3+'"');
    Editor.Lines.Add('A145,55,2,1,1,1,N,"'+esp2+'"');
    Editor.Lines.Add('B305,102,2,1,2,6,40,N,"'+inttostr(produto.cdProduto)+'"');
    if produto.referenciaInterna <> '' then
      Editor.Lines.Add('A145,102,2,2,1,1,N,"'+produto.referenciaInterna+'"')
    else
      Editor.Lines.Add('A145,102,2,2,1,1,N,"'+formatFloat('0.00',produto.vlPreco)+'"');
    Editor.Lines.Add('A145,69,2,1,1,1,N,"'+esp1+'"');
    Editor.Lines.Add('A252,57,2,1,1,1,N,"'+inttostr(produto.cdProduto)+'"');
    vQtd := StrToint(FormatFloat('0000',StrToFloat(SgDados.Cells[2,L])));
    Editor.Lines.Add('P'+FloatToStr(vQtd));
  end;
  Editor.Lines.SaveToFile(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'etiqueta.txt')));
  WinExec(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'print.bat')),sw_ShowNormal);
  if not FileExists('Print.bat') then
    ShowMessage('Não foi encontrado o arquivo Print.bat');
  Application.OnMessage := FormPrincipal.ProcessaMsg;
  Limpar_Tela;
  RgOpcoes.ItemIndex := 0;
  Messagedlg('Impressão ok!', mtInformation, [mbOk], 0);
end;

procedure TFrmPrincipalPreVenda.ImprimeEtiquetasSafiraArgox;
var L : integer;
    Arq : TextFile;
    vQtd : integer;
    produto: TDOMProduto;
    esp1, esp2, esp3: string;
    i, ult: integer;
begin
  //if not CamposObrigatoriosPreenchidos(FrmPrincipalPreVenda) then exit;
  if SgDados.Cells[0,1] = '' then begin
    Messagedlg('Não foi lançado nenhum item para impressão das etiquetas!', mtWarning, [mbOk], 0);
    EdtConsulta.Setfocus;
    exit;
  end;
  Editor.Lines.Clear;
  for L := 1 to SgDados.RowCount - 1 do begin
    if SgDados.Cells[0,L] = '' then Break;
    produto := TNegProduto.BuscarProduto(strtoint(SgDados.Cells[0,L]));
    Editor.Lines.Add('c0000');
    Editor.Lines.Add('KI503');
    Editor.Lines.Add('O0220');
    Editor.Lines.Add('f220');
    Editor.Lines.Add('KW0307');
    Editor.Lines.Add('KI7');
    Editor.Lines.Add('V0');
    Editor.Lines.Add('L');
    Editor.Lines.Add('H12');
    Editor.Lines.Add('PC');
    Editor.Lines.Add('A2');
    Editor.Lines.Add('D11');
//    Editor.Lines.Add('A305,37,2,1,1,1,N,"'+produto.referenciaFabrica+'"');

    Memo1.Text := produto.especificacao;

    esp1 := '';
    esp2 := '';
    esp3 := '';

    for I := 0 to Memo1.Lines.Count - 1 do begin
      if i = 0 then begin
        if Memo1.lines[i] <> '' then
          esp1 := copy(Memo1.lines[i],1,14);
      end
      else
      if i = 1 then begin
        if Memo1.lines[i] <> '' then
          esp2 := copy(Memo1.lines[i],1,14);
      end
      else
      if i = 2 then begin
        if Memo1.lines[i] <> '' then
          esp3 := copy(Memo1.lines[i],1,14);
      end;
    end;

    Editor.Lines.Add('1d6301600280019' + inttostr(produto.cdProduto));
    Editor.Lines.Add('121100000170018' + inttostr(produto.cdProduto));
    Editor.Lines.Add('121100000040018' + produto.referenciaFabrica);

//    Editor.Lines.Add('121100000360213R$'+formatFloat('0.00',produto.vlPreco));
    Editor.Lines.Add('121100000260114' + esp1);
    Editor.Lines.Add('121100000150114' + esp2);
    Editor.Lines.Add('121100000040114' + esp3);

    if produto.referenciaInterna <> '' then
      Editor.Lines.Add('121100000360114'+produto.referenciaInterna)
//      Editor.Lines.Add('A145,102,2,2,1,1,N,"'+produto.referenciaInterna+'"')
    else
      Editor.Lines.Add('121100000360114R$'+formatFloat('0.00',produto.vlPreco));
//      Editor.Lines.Add('A145,102,2,2,1,1,N,"'+formatFloat('0.00',produto.vlPreco)+'"');


    vQtd := StrToint(FormatFloat('0000',StrToFloat(SgDados.Cells[2,L])));
    Editor.Lines.Add('^01');
    Editor.Lines.Add('Q'+ IntToStr(vQtd));
    Editor.Lines.Add('E');
  end;
  Editor.Lines.SaveToFile(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'etiqueta.txt')));
  WinExec(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'print2.bat')),sw_ShowNormal);
  if not FileExists('Print2.bat') then
    ShowMessage('Não foi encontrado o arquivo Print2.bat');
  Application.OnMessage := FormPrincipal.ProcessaMsg;
  Limpar_Tela;
  RgOpcoes.ItemIndex := 0;
  Messagedlg('Impressão ok!', mtInformation, [mbOk], 0);
end;


//procedure TFrmPrincipalPreVenda.ImprimeEtiquetasSafiraArgox;
//var L : integer;
//    Arq : TextFile;
//    vQtd : integer;
//    produto: TDOMProduto;
//    esp1, esp2, esp3: string;
//    i, ult: integer;
//begin
//  //if not CamposObrigatoriosPreenchidos(FrmPrincipalPreVenda) then exit;
//  if SgDados.Cells[0,1] = '' then begin
//    Messagedlg('Não foi lançado nenhum item para impressão das etiquetas!', mtWarning, [mbOk], 0);
//    EdtConsulta.Setfocus;
//    exit;
//  end;
//  Editor.Lines.Clear;
//  for L := 1 to SgDados.RowCount - 1 do begin
//    if SgDados.Cells[0,L] = '' then Break;
//    produto := TNegProduto.BuscarProduto(strtoint(SgDados.Cells[0,L]));
//    Editor.Lines.Add('c0000');
//    Editor.Lines.Add('KI503');
//    Editor.Lines.Add('O0220');
//    Editor.Lines.Add('f220');
//    Editor.Lines.Add('KW0307');
//    Editor.Lines.Add('KI7');
//    Editor.Lines.Add('V0');
//    Editor.Lines.Add('L');
//    Editor.Lines.Add('H12');
//    Editor.Lines.Add('PC');
//    Editor.Lines.Add('A2');
//    Editor.Lines.Add('D11');
////    Editor.Lines.Add('A305,37,2,1,1,1,N,"'+produto.referenciaFabrica+'"');
//
//    Memo1.Text := produto.especificacao;
//
//    esp1 := '';
//    esp2 := '';
//    esp3 := '';
//
//    for I := 0 to Memo1.Lines.Count - 1 do begin
//      if i = 0 then begin
//        if Memo1.lines[i] <> '' then
//          esp1 := copy(Memo1.lines[i],1,14);
//      end
//      else
//      if i = 1 then begin
//        if Memo1.lines[i] <> '' then
//          esp2 := copy(Memo1.lines[i],1,14);
//      end
//      else
//      if i = 2 then begin
//        if Memo1.lines[i] <> '' then
//          esp3 := copy(Memo1.lines[i],1,14);
//      end;
//    end;
//
//    Editor.Lines.Add('1d6301600280131' + inttostr(produto.cdProduto));
//    Editor.Lines.Add('121100000170130' + inttostr(produto.cdProduto));
//    Editor.Lines.Add('121100000040130' + produto.referenciaFabrica);
//
////    Editor.Lines.Add('121100000360213R$'+formatFloat('0.00',produto.vlPreco));
//    Editor.Lines.Add('121100000260213' + esp1);
//    Editor.Lines.Add('121100000150213' + esp2);
//    Editor.Lines.Add('121100000040213' + esp3);
//
//    if produto.referenciaInterna <> '' then
//      Editor.Lines.Add('121100000360213'+produto.referenciaInterna)
////      Editor.Lines.Add('A145,102,2,2,1,1,N,"'+produto.referenciaInterna+'"')
//    else
//      Editor.Lines.Add('121100000360213R$'+formatFloat('0.00',produto.vlPreco));
////      Editor.Lines.Add('A145,102,2,2,1,1,N,"'+formatFloat('0.00',produto.vlPreco)+'"');
//
//
//    vQtd := StrToint(FormatFloat('0000',StrToFloat(SgDados.Cells[2,L])));
//    Editor.Lines.Add('^01');
//    Editor.Lines.Add('Q'+ IntToStr(vQtd));
//    Editor.Lines.Add('E');
//  end;
//  Editor.Lines.SaveToFile(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'etiqueta.txt')));
//  WinExec(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'print2.bat')),sw_ShowNormal);
//  if not FileExists('Print2.bat') then
//    ShowMessage('Não foi encontrado o arquivo Print2.bat');
//  Application.OnMessage := FormPrincipal.ProcessaMsg;
//  Limpar_Tela;
//  RgOpcoes.ItemIndex := 0;
//  Messagedlg('Impressão ok!', mtInformation, [mbOk], 0);
//end;

procedure TFrmPrincipalPreVenda.persistirFormulario;
var
  nomeFormulario, arquivo: string;
begin
  arquivo:= ExtractFilePath(Application.ExeName) + 'Support.ini';
  nomeFormulario:= Self.Name;
  persistirForm(nomeFormulario, 'chkOcultarProdutosSemEstoque.checked', BoolToStr(chkOcultarProdutosSemEstoque.checked,False), arquivo);
end;

procedure TFrmPrincipalPreVenda.persistirUltimoEstadoForm;
var
  nomeFormulario: string;
begin
  nomeFormulario:= Self.Name;
  chkOcultarProdutosSemEstoque.checked:= StrToBoolDef(ReadSupportIni(nomeFormulario,'chkOcultarProdutosSemEstoque.checked',''), False);
end;

initialization
  vLimiteCasasPreco := 0;

  //RLConsts.SetVersion(3, 71, 'B');

end.
