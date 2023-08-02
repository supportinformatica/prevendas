program PreVenda;

uses
  Forms,
  MoPreVenda in 'MoPreVenda.pas' {FrmPrincipalPreVenda},
  uFuncoesPadrao in 'uFuncoesPadrao.pas',
  DataModulo in 'DataModulo.pas' {DModulo: TDataModule},
  RelModelo in 'RelModelo.pas' {FrmMdRel},
  RelOrcamento in 'RelOrcamento.pas' {FrmRelOrcamento},
  cdConsultaProduto in 'cdConsultaProduto.pas' {FrmConsultaProduto},
  FrmConsultaEspecificacao in 'FrmConsultaEspecificacao.pas' {FrmEspecificacao},
  Sobre in 'Sobre.pas' {frmSobre},
  CancelamentoVenda in 'CancelamentoVenda.pas' {FrmCancelamentoVenda},
  Pergunta in 'Pergunta.pas' {FrmPergunta},
  RelOrcamentos in 'RelOrcamentos.pas' {frmRelOrcamentos},
  FormaPag in 'FormaPag.pas' {FrmFormaPag},
  Consulta_Prevenda in 'Consulta_Prevenda.pas' {Consulta_prevenca},
  FrmCadEstados in 'FrmCadEstados.pas' {FrmMdCadastro},
  CdCliente in 'CdCliente.pas' {FrmCdCliente},
  CdTelefone in 'CdTelefone.pas' {FrmCdTelefone},
  CdCreditoCliente in 'CdCreditoCliente.pas' {FrmCreditoCliente},
  RelEntSai in 'RelEntSai.pas' {FrmRelEntSai},
  RlEntSai in 'RlEntSai.pas' {FrmEntSaid},
  FrmSaida in 'FrmSaida.pas' {FrmRelSaida},
  frmCredito in 'frmCredito.pas' {FormCredito},
  FrmDesconto in 'FrmDesconto.pas' {FormDesconto},
  FrmRelContagem in 'FrmRelContagem.pas' {FrmContagem},
  TresEtiquetas in 'TresEtiquetas.pas' {FrmTresEtiquetas},
  AlteraDescricao in 'AlteraDescricao.pas' {FrmDescricao},
  cdCFOP in 'cdCFOP.pas' {FrmCFOP},
  Informacao in 'Informacao.pas' {FrmInfo},
  Thread_Conexao2 in 'Thread_Conexao2.pas',
  Thread_Conexao3 in 'Thread_Conexao3.pas',
  Declaracao in 'Declaracao.pas' {frmDeclaracao},
  relDeclaracao in 'relDeclaracao.pas' {frmRelDeclaracao},
  formBuscaCliente in 'formBuscaCliente.pas' {frmBuscaCliente},
  ListaPedidos in 'ListaPedidos.pas' {FrmListaPedidos},
  Thread_Atualizacao in '..\..\support\_Atacado_Varejo_2\Thread_Atualizacao.pas',
  HD in 'HD.pas' {frmChave},
  imagemAmpliadaProduto in 'imagemAmpliadaProduto.pas' {FrmImagemProduto},
  FormCdAmbiente in 'FormCdAmbiente.pas' {FrmCdAmbiente},
  relOrcamentosAmbiente in 'relOrcamentosAmbiente.pas' {frmRelOrcamentosAmbiente},
  Vcl.Themes,
  Vcl.Styles,
  cdConsultaEstoque in 'cdConsultaEstoque.pas' {FrmCdEstoque},
  FormRelListaRestante in '..\..\support\_Atacado_Varejo_2\FormRelListaRestante.pas' {FrmRelListaRestante},
  FormRelAlunosLivros in '..\..\support\_Atacado_Varejo_2\FormRelAlunosLivros.pas' {FrmRelAlunosLivros},
  UFrmcadEscola in 'UFrmcadEscola.pas' {FrmCadEscola},
  frmComprouJunto in 'frmComprouJunto.pas' {formComprouJunto},
  DOMProdutoVendidoJunto in '..\..\support\DOM\DOMProdutoVendidoJunto.pas',
  DOMCliente in '..\..\support\DOM\DOMCliente.pas',
  formUltimasVendasDoProdutoAoCliente in 'formUltimasVendasDoProdutoAoCliente.pas' {frmUltimasVendasDoProdutoAoCliente},
  DOMVendaDeProduto in '..\..\support\DOM\DOMVendaDeProduto.pas',
  NEGItemPrevenda in '..\..\support\NEG\NEGItemPrevenda.pas',
  RelOrcamentoLista in 'RelOrcamentoLista.pas' {frmRelOrcamentoLista},
  FormRelLivrosFaltamChegar in 'FormRelLivrosFaltamChegar.pas' {FrmRelLivrosFaltamChegar},
  UfrmCadLista in 'UfrmCadLista.pas' {FrmCadLista},
  FormConsultaEscolas in 'FormConsultaEscolas.pas' {FrmConsultaEscolas},
  DAOGrupo in '..\..\support\DAO\DAOGrupo.pas',
  PedeSenh in 'PedeSenh.pas' {FrmPedeSenha},
  FrmAlteraSenha in 'FrmAlteraSenha.pas' {FormAlteraSenha},
  BuscaObjetos,
  FormEtiquetaPontoDasTintas in 'FormEtiquetaPontoDasTintas.pas' {FrmEtiquetaPontoDasTintas},
  Conferencia in 'Conferencia.pas' {frmConferencia},
  FormLancaVendaPerdida in 'FormLancaVendaPerdida.pas' {FrmLancaVendaPerdida},
  ConsultaComposicao in 'ConsultaComposicao.pas' {frmConsultaComposicao},
  FormDuasEtiquetas in 'FormDuasEtiquetas.pas' {FrmDuasEtiquetas},
  Rel_Orcamentos in 'Rel_Orcamentos.pas' {FrmRel_Orcamento},
  Rel_Orcamentos_Novo.dcu in 'Rel_Orcamentos_Novo.dcu.pas' {frmRel_Orcamento_Novo},
  FrmTresEtiquetasViva in 'FrmTresEtiquetasViva.pas' {FormTresEtiquetasViva},
  FrmQuatroEtiquetas in 'FrmQuatroEtiquetas.pas' {FormQuatroEtiquetas},
  FrmTresEtiquetasRural in 'FrmTresEtiquetasRural.pas' {FormTresEtiquetasRural},
  RelOrcamentos40 in 'RelOrcamentos40.pas' {frmRelOrcamentos40},
  FormRegistroSistema in '..\..\support\_Atacado_Varejo_2\FormRegistroSistema.pas' {FrmRegistroSistema},
  uThreadBlockChave in '..\..\support\_Atacado_Varejo_2\uThreadBlockChave.pas',
  uThreadChaveAcesso in '..\..\support\_Atacado_Varejo_2\uThreadChaveAcesso.pas',
  LucroVenda in 'LucroVenda.pas' {frmLucroVenda},
  FrmConfImpresNFCe in '..\..\support\FORMS\FrmConfImpresNFCe.pas' {FormConfImpresNFCe},
  NEGACBrPosPrint in '..\..\support\NEG\NEGACBrPosPrint.pas',
  unitLogoMaker in 'unitLogoMaker.pas',
  FormInformaDataProduzidoValidade in 'FormInformaDataProduzidoValidade.pas' {FrmDataProduzidoValidade},
  AlterProdutoPosAdded in 'AlterProdutoPosAdded.pas' {frmAlterProdutoPosAdded},
  Prevenda.TagsGondola.G001 in 'SistemaEtiquetas\tags\gondolas\g001\Prevenda.TagsGondola.G001.pas',
  Prevenda.Constants.App in 'SistemaEtiquetas\shared\constants\Prevenda.Constants.App.pas',
  Prevenda.Messages.SuccessOrError in 'SistemaEtiquetas\shared\messages\Prevenda.Messages.SuccessOrError.pas',
  Prevenda.Utils.ExecutePrint in 'SistemaEtiquetas\shared\utils\Prevenda.Utils.ExecutePrint.pas',
  Prevenda.Utils.TagFileWriter in 'SistemaEtiquetas\shared\utils\Prevenda.Utils.TagFileWriter.pas',
  Prevenda.Utils.FirstImpression in 'SistemaEtiquetas\shared\utils\Prevenda.Utils.FirstImpression.pas',
  Prevenda.Utils.VerifyTagList in 'SistemaEtiquetas\shared\utils\Prevenda.Utils.VerifyTagList.pas',
  Prevenda.Utils.ConfigurationFileReader in 'SistemaEtiquetas\shared\utils\Prevenda.Utils.ConfigurationFileReader.pas',
  Prevenda.Constants.GondolaG001 in 'SistemaEtiquetas\shared\constants\Prevenda.Constants.GondolaG001.pas',
  Prevenda.Helpers.CalculateGondolaG001Axis in 'SistemaEtiquetas\shared\helpers\gondolas\g001\Prevenda.Helpers.CalculateGondolaG001Axis.pas',
  Prevenda.Helpers.CalculateGondolaG001DescriptionAxis in 'SistemaEtiquetas\shared\helpers\gondolas\g001\Prevenda.Helpers.CalculateGondolaG001DescriptionAxis.pas',
  Prevenda.Helpers.CalculateGondolaG001UnityAxis in 'SistemaEtiquetas\shared\helpers\gondolas\g001\Prevenda.Helpers.CalculateGondolaG001UnityAxis.pas',
  Prevenda.Helpers.CalculateGondolaG001BarcodeAxis in 'SistemaEtiquetas\shared\helpers\gondolas\g001\Prevenda.Helpers.CalculateGondolaG001BarcodeAxis.pas',
  Prevenda.Helpers.CalculateGondolaG001PriceAxis in 'SistemaEtiquetas\shared\helpers\gondolas\g001\Prevenda.Helpers.CalculateGondolaG001PriceAxis.pas';

{$R *.RES}
var
  I,J : integer;

begin
  Application.Initialize;
  FrmSobre := TfrmSobre.Create (Application);
  FrmSobre.Configura;
  Try
    Application.Title := 'Pré-Venda 2.0';
    Application.HelpFile := 'C:\Arquivos de programas\Saef\Bin\HELP_PREVENDA.HLP';
    Application.CreateForm(TDModulo, DModulo);
  Application.CreateForm(TFrmPrincipalPreVenda, FrmPrincipalPreVenda);
  Application.CreateForm(TFrmDataProduzidoValidade, FrmDataProduzidoValidade);
  Application.CreateForm(TfrmAlterProdutoPosAdded, frmAlterProdutoPosAdded);
  TBuscaObjeto.AbreLauncher;
    if FrmPrincipalPreVenda.GetFlagEmpresa <> 'TREVO' then
    begin
      Application.CreateForm(TFrmPedeSenha, FrmPedeSenha);
      FrmPedeSenha.ShowModal;
    end
    else
      FrmPrincipalPreVenda.CbxCliente.SetFocus;
    FrmSobre.Close;
  finally
    FrmSobre.Free;
  end;
  Application.Run;
end.
