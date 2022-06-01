unit NotaEletronica;

interface

uses NFe_Util_2G_TLB, System.Generics.Collections, Dialogs;

/////////////////////////////////// OS VALORES ENTRE PARENTESES INDICA A OBRIGATORIEDADE DO CAMPO //////////////////////////////////////

type

  TdetPag = class

    public
      _indPag_Opc : string; { informar o indicador da forma de pagamento:
                              0 - pagamento à vista;
                              1 - pagamento à prazo.(campo novo) }
      _tPag : string;       { informar a Forma de pagamento:
                              01=Dinheiro
                              02=Cheque
                              03=Cartão de Crédito
                              04=Cartão de Débito
                              05=Crédito Loja
                              10=Vale Alimentação
                              11=Vale Refeição
                              12=Vale Presente
                              13=Vale Combustível
                              99=Outros.}
      _vPag : Currency;    // Informar o valor do Pagamento
      _tpIntegra_Opc : string;
                            { 1=Pagamento integrado com o sistema de automação da empresa (Ex.: equipamento TEF, Comércio Eletrônico);
                              2= Pagamento não integrado com o sistema de automação da empresa (Ex.: equipamento POS); }
      _CNPJ_Opc : string; //Informar o CNPJ da Credenciadora de cartão de crédito / débito.
                          // Obs:Os parâmetros CNPJ_Opc, tBand_Opc e cAut_Opc devem ser informados em conjunto ou omitidos em conjutos, não é permitido informar um ou outros. Assim informe todos os 3 campos ou não informe nenhum deles.
      _tBand_Opc : string;
                            { 01=Visa
                              02=Mastercard
                              03=American Express
                              04=Sorocred
                              99=Outros. }
     _cAut_Opc : string; // Identifica o número da autorização da transação da operação com cartão de crédito e/ou débito.


    public
      constructor Novo(indPag_Opc, tPag : string; vpag : Currency; CNPJ_Opc : string; tBand_Opc : string; cAut_Opc : string; tpIntegra_Opc : string);
      function getXML : WideString;
  end;

  Tpagamento400 = class

    public
      _detPag : WideString;        // informar o detalhe do pagamento gerado com o uso da detPag
      _vTroco_Opc : Currency;  // informar o valor do Troco caso exista.

      constructor novo(detPag : WideString; vTroco_Opc : Currency);
      function getXML : WideString;

  end;

  TNFreferenciada = class

  public
    _tipo : integer;  // tipo de referencia
    {1-NF-e
    2-A1
    3-Cupom Fiscal}
    _refNFe : string; // 44	sim	informar a chave de acesso da NF-e referenciada
    _cUF : integer;	// 2	sim	informar o código da UF de localização do emissor da NF no padrão do IBGE
    _AAMM : string;	// 4	sim	informar o ano e mês de emisssão da NF referenciada no padrão AAMM
    _CNPJ : string;	// 14  sim informar o CNPJ do emissor da NF
    _mode :integer;	// 1 	sim	informar o modelo da NF referenciada, deve ser sempre 1.
    _serie : integer;	// 1-3	sim	informar o número da série da NF referenciada, informar zero se for série única
    _nNF: integer;	// 1-6	sim	informar o número da NF referenciada
    _Cmod : string; // 2	sim	Informar o código do modelo do Documento Fiscal, Preencher com:
    {"2B", quando se tratar de Cupom Fiscal emitido por máquina registradora (não ECF),
   "2C", quando se tratar de Cupom Fiscal PDV;
   "2D", quando se tratar de Cupom Fiscal (emitido por ECF)  }
    _nECF : integer; //	1-3	sim	Informar o número de ordem seqüencial do ECF que emitiu o Cupom Fiscal vinculado à NF-e
    _nCOO :integer; //	1-6	sim	Informar o Número do Contador de Ordem de Operação - COO vinculado à NF-e

  public

    constructor Novo(tipo : integer; refNFe : string; cUF : integer;AAMM : string; CNPJ : string; mode :integer; serie : integer;
            nNF : Integer; Cmod : string; nECF : integer; nCOO :integer);
    function GetXML : WideString;

  end;

  type

  ListaReferencia = TList<TNFreferenciada>;

  TIdentificador400 = class

  public
    _cUF	: integer; //	-	(sim)	informar o código da UF do emitente do Documento Fiscal, utilizar a codificação do IBGE (Ex. SP->35, RS->43, etc.)
    _cNF	: integer; // -	(sim)	informar o código numérico que compõe a Chave de Acesso. Número aleatório gerado pelo emitente para cada NF-e para evitar acessos indevidos da NF-e. (tamanho do campo reduzido para 8 dígitos)
    _natOpe : widestring; //	1-60	(sim)	informar a natureza da operação de que decorrer a saída ou a entrada, tais como: venda, compra, transferência, devolução, importação, consignação, remessa (para fins de demonstração, de industrialização outra), conforme previsto na alínea 'i', inciso I, art. 19 do CONVÊNIO S/Nº, de 15 de dezembro de 1970.
{    _indPag : Integer; //	não existe mais
    0 - pagamento à vista;
    1 - pagamento à prazo;
    2 - outros.}
    _mode  : integer; //	-	(sim)	informar o código do Modelo do Documento Fiscal, código 55 para a NF-e.
    _serie :	integer; //	-	(sim)	informar a série do Documento Fiscal, informar 0 (zero) para série única. A emissão normal pode utilizar série de 0-889, a emissão em contingência SCAN deve utilizar série 900-999.
    _nNF	 : integer; //	-	(sim)	informar o Número do Documento Fiscal.
    _dEmi  : WideString; //	-	(sim)	informar a data de emissão do Documento Fiscal.
    _dSaiEnt : WideString; //	-	(não)	informar a data de saída ou entrada da mercadoria ou do produto, pode ser omitido informando: Delphi: 0 (zero)
    _tpNF	 : integer; //	-	(sim)	informar o código do tipo do Documento Fiscal: 0 - entrada ou 1 - saída
    _idDest : integer;  {informar o identificador de local de destino da operação:
    1 - Operação interna;
    2 - Operação interestadual;
    3 - Operação com exterior.}
    _cMunFG : widestring; //	7	(sim)	informar o código do Município de Ocorrência do Fato Gerador do ICMS, que é o local onde ocorre a entrada ou saída da mercacoria, utilizar a Tabela do IBGE
    _NFRef	: ListaReferencia; //	-	(não)	informar o grupo de informações NFRef dos documentos fiscais referenciados, Utilizar para referenciar um Documento Fiscal vinculado a NF-e atual. Esta informação será utilizada nas hipóteses previstas na legislação. (Ex.: Devolução de Mercadorias, Substituição de NF cancelada, Complementação de NF, etc.). Necessário montar o grupo XML do documento correspondente. (novas opções de documento referenciado: CT-e, Cupom Fiscal e Nota Fiscal de Produtor)
    _tpImp	: integer; //	-	(sim)	informar o formato de impressão do DANFE: 1-retrato ou 2-paisagem.
    _tpEmis : Integer; //	-	(sim)	informar o código da forma de emissão:
    {1 - Normal - emissão normal;
    2 - Contingência FS - emissão em contingência com impressão do DANFE em Formulário de Segurança;
    4 - Contingência DPEC - emissão em contingência com envio da Declaração Prévia de Emissão em Contingência - DPEC;
    5 - Contingência FS-DA - emissão em contingência com impressão do DANFE em Formulário de Segurança para Impressão de Documento Auxiliar de Documento Fiscal Eletrônico (FS-DA).}
    _cDV      :	integer; //	-	(sim)	informar o código do dígito verificador - DV da Chave de Acesso da NF-e, o DV será calculado com a aplicação do algoritmo módulo 11 (base 2,9) da Chave de Acesso.
    _tpAmb    :	integer; //	-	(sim)	informar o código de identificação do Ambiente: 1-Produção ou 2-Homologação
    _finNFe   : integer; // -	(sim)	infformar o código da finalidade de emissão da NF-e: 1- NF-e normal; 2-NF-e complementar; 3 - NF-e de ajuste.
    _indFinal : integer; {nformar o indicador de operação com Consumidor final:
    0 - Não;
    1 - Consumidor final;}
    _indPres  : integer; {Informar o indicador de presença do comprador no estabelecimento comercial no momento da operação:
    0 - Não se aplica (por exemplo, Nota Fiscal complementar ou de ajuste);
    1 - Operação presencial;
    2 - Operação não presencial, pela Internet;
    3 - Operação não presencial, Teleatendimento;
    4 - NFC-e em operação com entrega a domicílio;
    9 - Operação não presencial, outros.}
    _procEmi :	integer; //	-	(sim)	informar o código de identificação do processo de emissão da NF-e: Identificador do processo de emissão da NF-e:
    {0 - emissão de NF-e com aplicativo do contribuinte;
    1 - emissão de NF-e avulsa pelo Fisco;
    2 - emissão de NF-e avulsa, pelo contribuinte com seu certificado digital, através do site do Fisco;
    3- emissão NF-e pelo contribuinte com aplicativo fornecido pelo Fisco.}
    _verProc :	WideString; //	1-20	(sim)	informar a versão do processo de emissão da NF-e utilizada (aplicativo emissor de NF-e).
    //Deve ser informado com um conteúdo válido sempre que tpEmis for diferente de 1, para omitir o conteúdo, quando tpEmis=1, informe:Delphi: 0 (zero)
    _dhCont  : widestring; //	-	(não)	informar a data e hora de entrada em contingência no formato AAAA-MM-DDTHH:MM:SS (campo novo)
    //Importante: dhCont e xJust devem ser ambos informados ou omitidos.
    _xJust   : Widestring;

  public
    constructor Novo(cUF : integer;cNF : integer;natOpe : widestring;mode : integer;
             serie : integer;nNF : Integer;dEmi : WideString;dSaiEnt : widestring;tpNF : Integer;idDest : integer;cMunFG : widestring;
             NFref : ListaReferencia;tpImp : Integer;tpEmis : Integer;cDV : integer;tpAmb : integer;finNFe : integer;indFinal : integer;indPres : integer;procEmi : integer;
             verProc : widestring;dhCont : widestring;xJust : widestring);
    function GetXML : WideString;
  end;

  TEmitente2G = class

  public

    _CNPJ : Widestring; //	14	(sim)	informar o CNPJ do emitente, sem formatação ou máscara
    _CPF : widestring; //	11	(sim)	informar o CPF do emitente, sem formatação ou máscara, utilizado apenas quando o fisco emite a nota fiscal
    _xNome : widestring; //	2-60	(sim)	informar a razão social do emitente
    _xFant : widestring; //	1-60	(não)	informar o nome fantasia do emitente, pode ser omitido
    _xLgr : widestring; //	2-60	(sim)	informar o logradouro do emitente
    _nro : widestring; //	1-60	(sim)	informar o número do endereço do emitente, campo obrigatório. Informar S/N ou . (ponto) ou - (traço) para evitar falha de schema XML quando não houver número.
    _xCpl : widestring; //	1-60	(não)	informar o complemento do endereço do emitente, pode ser omitido
    _xBairro : widestring; //	2-60	(sim)	informar o bairro do endereço do emitente
    _cMun : widestring; //	7	(sim)	informar o código do município na codificação do IBGE com 7 dígitos
    _xMun : widestring; //	2-60	(sim)	informar o nome do município
    _UF : widestring; //	2	(sim)	informar a sigla da UF
    _CEP : widestring; //	8	(sim)	informar o CEP, passou a ser de informação obrigatória a partir da NT 2011/004.
    _cPais : widestring; //	4	(não)	informar o código do pais na codificação do BACEN, se informado deve ser 1058
    _xPais : widestring; //	6	(não)	informar o nome do país, se informado deve ser Brasil ou BRASIL
    _fone : widestring; //	6-14	(não)	informar o telefone com DDD + número, sem formatação (campo com tamanho aumentado)
    _IE : widestring; //	2-14	(sim)	informar a IE do emitente, sem formatação ou máscara
    _IEST : widestring; //	2-14	(não)	informar a IE ST, sem formatação ou máscara, quando praticar alguma operação como substituto tributário
    _IM : widestring; //	1-15	(não)	informar a Inscrição Municipal, sem formatação ou máscara, quando emitir NF conjugada (prestação de serviço com fornecimento de peças)
    _CNAE : widestring; //	7	(não)	informar o CNAE Fiscal, este campo deve ser informado em conjunto com o campo IM e vice-versa, a informação de um e omissão do outro resulta em falha de Schema XML
    _CRT : widestring;
  public
    constructor Novo(CNPJ : widestring;CPF : widestring;xNome : widestring;xFant : widestring;xLgr : widestring;nro : widestring;xCpl : widestring;
       xBairro : widestring;cMun : widestring;xMun : widestring;UF : widestring;CEP : widestring;cPais : widestring;xPais : widestring;fone : widestring;
       IE : widestring;IEST : widestring;IM : widestring;CNAE : widestring;CRT : widestring);
    function GetXML : WideString;
  end;

  TDestinatario2G = class

    public
    _CNPJ : widestring; //	14	(sim)	informar o CNPJ do destinatário, sem formatação ou máscara
    _CPF : widestring; //	11	(sim)	CPF do destinatário, sem formatação ou máscara
    _idEstrangeiro : widestring; //No caso de operação com o exterior, ou para comprador estrangeiro informar a tag "idEstrangeiro", com o número do passaporte ou outro documento legal para identificar pessoa estrangeira. Nota: Campo aceita valor Nulo.
    _xLgr : widestring; //	2-60	(sim)	informar o logradouro do destinatário
    _nro : widestring; //	1-60	(sim)	informar o número do endereço do destinatário, campo obrigatório. Informar S/N ou . (ponto) ou - (traço) para evitar falha de schema XML quando não houver número.
    _xCpl : widestring; //	1-60	(não)	informar o complemento do endereço do destinatário, pode ser omitido
    _xBairro : widestring; //	2-60	(sim)	informar o bairro do endereço do destinatário
    _cMun : widestring; //	7	(sim)	informar o código do município na codificação do IBGE com 7 dígitos
    _xMun : widestring; //	2-60	(sim)	informar o nome do município

    _CEP : widestring; //	8	(não)	informar o CEP, sem formatação ou máscara, pode ser omitido
    _cPais : widestring; //	4	(não)	informar o código do pais na codificação do BCB, se informado deve ser 1058
    _xPais : widestring; //	6	(não)	informar o nome do país, se informado deve ser Brasil ou BRASIL
    _fone : widestring; //	6-14	(não)	informar o telefone com DDD + número, sem formatação (tamanho do campo aumentado)
    _indIEDest : widestring; {Indicador da IE do Destinatário, informar:
                              1 - Contribuinte ICMS (informar a IE do destinatário);
                              2 - Contribuinte isento de Inscrição no cadastro de Contribuintes do ICMS;
                              9 - Não Contribuinte, que pode ou não possuir Inscrição Estadual no Cadastro de Contribuintes do ICMS.
                              Nota 1: No caso de NFC-e informar indIEDest=9 e não informar a tag IE do destinatário;
                              Nota 2: No caso de operação com o Exterior informar indIEDest=9 e não informar a tag IE do destinatário;
                              Nota 3: No caso de Contribuinte Isento de Inscrição (indIEDest=2), não informar a tag IE do destinatário.}

    _ISUF : widestring; //	8-9	(não)	informar a Inscrição SUFRAMA do destinatário, sem formatação ou máscara, se existir.
    _IM : widestring; //Inscrição Municipal do Tomador do Serviço, campo opcional, pode ser informado na NF-e conjugada, com itens de produtos sujeitos ao ICMS e itens de serviços sujeitos ao ISSQN
    _CODIGO : string;  // (não) codigo do destinatário
    _xNome : widestring; //	2-60	(sim)	informar a razão social do destinatário
    _UF : widestring; //	2	(sim)	informar a sigla da UF
    _IE : widestring; //	0-14	(sim)	informar a IE do destinatário, sem formatação ou máscara
    _observacao : string; // (não) armazena algum tipo de observação do cliente caso seja necessário ser impresso na NFC
//    _tipoAliquotaICMS : Integer;  // 1-> aliquota do cadastro do produto, 2 -> aliquota de revenda do estado do destinatario, 3-> aliquota de revenda do estado do emitente
    _tipoDestinatario : string;  // 1-> 'PJComIE', 2-> 'PJSemIE', 3-> 'PFComIE' (Produtor Rural), 4-> 'PFSemIE'
    _tipoCliente : string;  // Não faz parte da nfe, guarda o tipo do cliente
    _eMail : widestring;
    _codigoVendedor : string; // Não faz parte da nfe, guarda o codigo do vendedor
    _comprarAPrazo : Boolean;
    // campos da tag det
    _indFinal : Integer; // informar o indicador de operação com Consumidor final: 0 - Não; 1 - Consumidor final;
    _idDest : Integer;   // informar o identificador de local de destino da operação: 1 - Operação interna; 2 - Operação interestadual; 3 - Operação com exterior.

    // tem dois construtores porq o primeiro tem mais campos que a dll precisa
    constructor NovoDestinatario(CNPJ : widestring; CPF : widestring;idEstrangeiro : widestring; xNome : widestring;xLgr : widestring; nro : widestring; xCpl : widestring; xBairro : widestring;
       cMun : widestring; xMun : widestring; UF : widestring; CEP : widestring;cPais : widestring; xPais : widestring; fone : widestring; indIEDest :widestring;
       IE : widestring; ISUF : widestring; IM : widestring; eMail : widestring; observacao, codigo : string; tipoDestinatario, tipoCliente, codigoVendedor : string;
       comprarNoCrediario : Boolean; indFinal, idDest : Integer);
    constructor Novo(CNPJ : widestring;CPF : widestring;idEstrangeiro : widestring;xNome : widestring;xLgr : widestring;nro : widestring;xCpl : widestring;xBairro : widestring;
       cMun : widestring;xMun : widestring;UF : widestring;CEP : widestring;cPais : widestring;xPais : widestring;fone : widestring;indIEDest :widestring;
       IE : widestring;ISUF : widestring;IM : widestring;eMail : widestring);
    function GetXML : WideString;
  end;


  Tadi = class

  public

    _nAdicao : Integer; // 1-3	sim	informar o número da adição
    _nSeqAdic : Integer; // 1-3	sim	informar o número sequencial do item dentro da adição
    _cFabricante : widestring; // 1-60	sim	informar o código do fabricante estrangeiro usado nos sistemas internos de informação do emitente da NF-e
    _vDescDI : Real; // 15,2	não	informar o valor do desconto do item da DI - adição

  public
    constructor Novo(nAdicao : Integer;nSeqAdic : Integer;cFabricante : WideString;vDescDI : Real);
    function GetXML : WideString;
  end;

  TdetExport = class

    public
      _nDraw_Opc : WideString;
      _nre       : WideString;
      _chNFe     : WideString;
      _qExport   : WideString;

    public
    constructor Novo(nDraw_Opc, nre, chNFe, qExport : WideString);
    function GetXML : WideString;

  end;

  TDI = class

  public

    _nDI : widestring; // 1-10	sim	informar o número da DI, DSI, DA, etc.
    _dDI : widestring; // -	sim	informar a data da Registro da DI no formato AAAA-MM-DD
    _xLocDesemb : widestring; // 1-60	sim	informar o local de ocorrência do desembaraço aduaneiro
    _UFDesmb : widestring; // 2	sim	informar a sigla da UF onde ocorreu o desembaraço aduaneiro
    _dDesemb : widestring; // -	sim	informar a data de ocorrência do desembaraço aduaneiro no formato AAAA-MM-DD
    _tpViaTransp : integer;  //informar a Via de transporte internacional informada na Declaração de Importação (DI) EMISSORNFE
    _vAFRMM_Opc : Real; //informar o valor da AFRMM - Adicional ao Frete para Renovação da Marinha Mercante no caso da via de transporte marítima EMISSORNFE
    _tpIntermedio : integer; //informar Forma de importação quanto a intermediação EMISSORNFE
    _CNPJ_Opc : widestring; //informar obrigatoriamente o CNPJ do adquirente ou do encomendante no caso de importação por conta e ordem ou por encomenda EMISSORNFE
    _UFTerceiro_Opc : WideString; //informar obrigatoriamente a Sigla da UF do CNPJ do adquirente ou do encomendante no caso de importação por conta e ordem ou por encomenda EMISSORNFE
    _cExportador : widestring; // 1-60	sim	informar o código do exportador, usado nos sistemas internos de informação do emitente da NF-e
    _adi : Tadi; // -	sim	informar os fragmentos XML das adições geradas através da adições da DI

  public
    constructor Novo(nDI : widestring;dDI : widestring;xLocDesemb : widestring;UFDesmb : widestring;dDesemb : widestring;
         tpViaTransp : integer;vAFRMM_Opc : Real;tpIntermedio : integer;CNPJ_Opc : WideString;UFTerceiro_Opc : WideString;
         cExportador : widestring; adi : Tadi);  //EMISSORNFE
    function GetXML : widestring;
  end;

TRastro = class

  public

    _nLote      : WideString;
    _qLote      : Real;
    _dFab       : TDateTime;
    _dVal       : TDateTime;
    _cAgreg_Opc : WideString;

    constructor novo(nLote : WideString; qLote : Real; dFab, dVal : TDateTime; cAgreg_Opc : WideString);

    function getXML() : WideString;

end;

TProduto400 = class

  public

    _cProd : widestring; //	1-60	(sim)	informar o código do produto ou serviço. Preencher com CFOP, caso se trate de itens não relacionados com mercadorias/produtos e que o contribuinte não possua codificação própria. Formato ”CFOP9999”.
    _cEAN	: widestring; //	0,8,12,13,14	(sim)	informar o GTIN (Global Trade Item Number) do produto, antigo código EAN ou código de barras. Preencher com o código GTIN-8, GTIN-12, GTIN-13 ou GTIN-14 (antigos códigos EAN, UPC e DUN-14), não informar o conteúdo da TAG em caso de o produto não possuir este código.
    _xProd : widestring; //	1-120	(sim)	informar a descrição do produto ou serviço.
    _NCM : widestring; //	2,8	(sim)	informar o Código NCM com 8 dígitos; informar a posição do capítulo do NCM (as duas primeiras posições do NCM) quando a operação não for de comércio exterior (importação/ exportação) ou o produto não seja tributado pelo IPI; se for serviços, informar 00. (campo alterado para ser obrigatório)
    _NVE_Opc : widestring; // (não) informar com a Codificação NVE - Nomenclatura de Valor Aduaneiro e Estatística, Codificação opcional que detalha alguns NCM
    _CEST_opc : widestring; // (não) informar Código Especificador da Substituição Tributária - CEST, que estabelece a sistemática de uniformização e identificação das mercadorias e bens passíveis de sujeição aos regimes de substituição tributária e de antecipação de recolhimento do ICMS.
    _indEscala_Opc : WideString; // (não) informar o Indicador de Escala Relevante. Indicador de Produção em escala relevante, conforme Cláusula 23 do Convenio ICMS 52/2017: S - Produzido em Escala Relevante; N – Produzido em Escala NÃO Relevante.
    _CNPJFab_Opc : WideString; // (não) informar o CNPJ do Fabricante da Mercadoria, obrigatório para produto em escala NÃO relevante.
    _cBenef_Opc : WideString; // (nao) informar o Código de Benefício Fiscal utilizado pela UF, aplicado ao item. Obs.: Deve ser utilizado o mesmo código adotado na EFD e outras declarações, nas UF que o exigem.
    _EXTIPI : widestring; //	2,3	(não)	informar de acordo com o código EX da TIPI se houver para o NCM do produto.
    _CFOP : Integer;	// 4	(sim)	informar o CFOP - Código Fiscal de Operações e Prestações.
    _uCOM : widestring;	// 1-6	(sim)	informar a unidade de comercialização do produto (Ex. pc, und, dz, kg, etc.).
    _qCOM : widestring;	// 15,4	(sim)	informar a quantidade de comercialização do produto já formatado com ponto decimal. A quantidade de casas decimais pode variar de 0 a 4. (tamanho e tipo do campo alterado)
    _vUnCOM : widestring;	// 21,10	(sim)	Informar o valor unitário de comercialização do produto já formatado com ponto decimal, campo meramente informativo, o contribuinte pode utilizar a precisão desejada (0-10 decimais). Para efeitos de cálculo, o valor unitário será obtido pela divisão do valor do produto pela quantidade comercial. (tamanho e tipo do campo alterado)
    _vProd : Real;	// 15,2	(sim)	informar o valor total bruto do produto ou serviços.
    _cEANTrib : widestring; //	0,8,12,13,14	(sim)	informar o GTIN (Global Trade Item Number) da unidade de tributação do produto, antigo código EAN ou código de barras. Preencher com o código GTIN-8, GTIN-12, GTIN-13 ou GTIN-14 (antigos códigos EAN, UPC e DUN-14), não informar o conteúdo da TAG em caso de o produto não possuir este código.
    _uTrib : widestring; //	1-6	(sim)	informar a unidade de tributação do produto (Ex. pc, und, dz, kg, etc.).
    _qTrib : widestring; //	15,4	(sim)	informar a quantidade de tributação do produto já formatado com ponto decimal. A quantidade de casas decimais pode variar de 0 a 4. (tamanho e tipo do campo alterado)
    _vUnTrib : widestring; //	21,10	(sim)	Informar o valor unitário de tributação do produto já formatado com ponto decimal, campo meramente informativo, o contribuinte pode utilizar a precisão desejada (0-10 decimais). Para efeitos de cálculo, o valor unitário será obtido pela divisão do valor do produto pela quantidade tributável. (tamanho e tipo do campo alterado)
    _vFrete : Real;	// 15,2	(não)	informar o valor do Frete, o Frete deve ser rateado entre os itens de produto.
    _vSeg : Real;	// 15,2	(não)	informar o valor do Seguro, o Seguro deve ser rateado entre os itens de produto.
    _vDesc : Real;	// 15,2	(não)	informar o valor do desconto do item de produto ou serviço.
    _vOutro : Real;	// 15,2	(não)	informar o valor de outras despesas acessórias do item de produto ou serviço. (campo novo)
    _indTot : Integer;	// -	(sim)	Este campo deverá ser preenchido com: 0 - o valor do item (vProd) não compõe o valor total da NF-e (vProd) 1 - o valor do item (vProd) compõe o valor total da NF-e. (campo novo)
    _DI : widestring;	// -	(não)	informar o XML do grupo DI - dados da importação nas operações de importação.
    _detExport_Opc : WideString; // (não) informar com as informações do detalhamento da exportação
    _DetEspecifico : widestring; //	-	(não)	informar o XML do grupo veicProd - detalhamento de específico de veículos novos ou com o XML do grupo med - detalhamento de específico de medicamentos ou com o XML do grupo arma - detalhamento de específico de armamentos ou com o XML do grupo comb - detalhamento de específico de combustíveis e lubrificantes.
    _xPed : widestring; //	1-15	(não)	informar o número do pedido de compra, o campo é de livre uso do emissor. (campo novo)
    _nItemPed : WideString;    // informar o número do item do pedido de compra, o campo é de livre uso do emissor.
    _nFCI_Opc : WideString; // informar o Número de controle da FCI - Ficha de Conteúdo de Importação com formatação, ex.: B01F70AF-10BF-4B1F-848C-65FF57F616FE
    _rastro_Opc : WideString; // (não) informar o grupo de Detalhamento de produto sujeito a rastreabilidade.

  public
    constructor Novo(cProd : wideString;cEAN : wideString;xProd : wideString; NCM, NVE_Opc, CEST_Opc : wideString; indEscala_Opc : WideString; CNPJFab_Opc : WideString; cBenef_Opc : WideString;
       EXTIPI : wideString; CFOP : integer; uCom : wideString;qCom : widestring;vUnCom : widestring;vProd : Real;cEANTrib : wideString;uTrib : wideString;qTrib : widestring;vUnTrib : widestring;
       vFrete : Real;vSeg : Real;vDesc : Real;vOutro : Real;indTot : Integer;DI, detExport_Opc, DetEspecifico, xPed : wideString;
       nItemPed : WideString; nFCI_Opc : WideString; rastro_Opc : WideString);
    function GetXML : WideString;
  end;

  TVeicProd2G = class
  private
    _tpOp	: Integer;	//	1	(sim)	Tipo da operação
    {1 – Venda concessionária
    2 – Faturamento direto para consumidor final
    3 – Venda direta para grandes consumidores (frotista, governo, ...)
    0 – Outros
    Obs. A codificação é em relação ao fabricante/importador, se o grupo for preenchido pela concessionária/revenda, o tpOp deve ser 0 - Outros}
    _chassi	: widestring;	//	17	(sim)	Chassi do veículo - VIN (código-identificação-veículo)
    _cCor	: widestring;	//	4	(sim)	Cor - Código de cada montadora
    _xCor	: widestring;	//	1-40	(sim)	Descrição da Cor
    _pot	: widestring;	//	4	(sim)	Potência Motor (CV) - Potência máxima do motor do veículo em cavalo vapor (CV). (potência-veículo)
    _cilin	: widestring;	//	4	(sim)	Cilindradas -Capacidade voluntária do motor expressa em centímetros cúbicos (CC). (cilindradas) (campo novo)
    _pesoL	: widestring;	//	9	(sim)	Peso Líquido - em toneladas - 4 casas decimais
    _pesoB	: widestring;	//	9	(sim)	Peso Bruto - Peso Bruto Total - em tonelada - 4 casas decimais
    _nSerie	: widestring;	//	9	(sim)	Serial (série)
    _tpComb	: widestring;	//	2	(sim)	Tipo de combustível - Utilizar Tabela RENAVAM (campo novo)
    {01-Álcool
    02-Gasolina
    03-Diesel
    (...)
    16-Álcool/Gasolina
    17-Gasolina/Álcool/GNV
    18-Gasolina/Elétrico }
    _nMotor	: widestring;	//	21	(sim)	Número de Motor
    _CMT	: widestring;	//	9	(sim)	Capacidade Máxima de Tração - CMT-Capacidade Máxima de Tração - em Toneladas 4 casas decimais (campo novo)
    _dist	: widestring;	//	4	(sim)	Distância entre eixos
    _anoMod	: widestring;	//	4	(sim)	Ano Modelo de Fabricação
    _anoFab	: widestring;	//	4	(sim)	Ano de Fabricação
    _tpPint	: widestring;	//	1	(sim)	Tipo de Pintura
    _tpVeic	: widestring;	//	2	(sim)	Tipo de Veículo
    {Utilizar Tabela RENAVAM
    06-AUTOMÓVEL
    14-CAMINHÃO
    13-CAMINHONETA
    24-CARGA / CAM
    02-CICLOMOTO
    22-ESP / ÔNIBUS
    07-MICROÔNIBUS
    23-MISTO / CAM
    04-MOTOCICLO
    03-MOTONETA
    08-ÔNIBUS
    10-REBOQUE
    05-TRICICLO
    17-C. TRATOR
    *Lista exemplificativa.}
    _espVeic	: widestring;	//	1	(sim)	Espécie de Veículo - Utilizar Tabela RENAVAM
    {1-PASSAGEIRO
    2-CARGA
    3-MISTO
    4-CORRIDA
    5-TRAÇÃO
    6-ESPECIAL}
    _VIN	: widestring;	//	1	(sim)	Condição do VIN - Informa-se o veículo tem VIN (chassi) remarcado.
    {R-Remarcado
    N-Normal}
    _condVeic	: widestring;	//	1	(sim)	Condição do Veículo:
    {1-Acabado;
    2-Inacabado;
    3-Semi-acabado}
    _cMod	: widestring;	//	6	(sim)	Código Marca Modelo - Utilizar Tabela RENAVAM
    _cCorDENATRAN	: widestring;	//	2	(sim)	Código da Cor - Segundo as regras de pré-cadastro do DENATRAN (campo novo)
    {01-AMARELO
    02-AZUL
    03-BEGE
    04-BRANCA
    05-CINZA
    06-DOURADA
    07-GRENA
    08-LARANJA
    09-MARROM
    10-PRATA
    11-PRETA
    12-ROSA
    13-ROXA
    14-VERDE
    15-VERMELHA
    16-FANTASIA}
    _lota	: widestring;	//	1-3	(sim)	Capacidade máxima de lotação - Quantidade máxima permitida de passageiros sentados, inclusive motorista. (campo novo)
    _tpRest	: widestring;
    {0 - Não há;
    1 - Alienação Fiduciária;
    2 - Arrendamento Mercantil;
    3 - Reserva de Domínio;
    4 - Penhor de Veículos;
    9 - outras. (campo novo)}
  public
    constructor Novo(tpOp	: Integer;chassi	: widestring;cCor	: widestring;xCor	: widestring;pot : widestring;
          cilin : widestring;pesoL : widestring;pesoB : widestring;nSerie	: widestring;tpComb	: widestring;nMotor	: widestring;
          CMT : widestring;dist	: widestring;anoMod	: widestring;anoFab	: widestring;tpPint	: widestring;tpVeic	: widestring;
          espVeic : widestring;VIN : widestring;condVeic	: widestring;cMod	: widestring;cCorDENATRAN	: widestring;lota	: widestring;
          tpRest	: widestring);
    function GetXML : WideString;
  end;

  TComb = class

  private
    _cProdANP : widestring; //	9	sim	Código de produto da ANP - Utilizar a codificação de produtos do Sistema de Informações de Movimentação de produtos - SIMP. Informar 999999999 se o produto não possuir código de produto ANP.
    _descANP  : widestring; // (não) Descrição do produto conforme ANP (cProdANP=210203001) Utilizar a descrição de produtos do Sistema de Informações de Movimentação de Produtos - SIMP.
    _pGLP_Opc : real;       // (não) Percentual do GLP derivado do petróleo no produto GLP (cProdANP=210203001) Informar em número decimal o percentual do GLP derivado de petróleo no produto GLP. Valores de 0 a 1.
    _pGNn_Opc : real;       // (não) Percentual de Gás Natural Nacional – GLGNn para o produto GLP (cProdANP=210203001) Informar em número decimal o percentual do Gás Natural Nacional – GLGNn para o produto GLP. Valores de 0 a 1.
    _pGNi_Opc : real;       // (não) Percentual de Gás Natural Importado – GLGNi para o produto GLP (cProdANP=210203001) Informar em número decimal o percentual do Gás Natural Importado – GLGNi para o produto GLP. Valores de 0 a 1.
    _vPart_Opc : real;      // (não) Valor de partida (cProdANP=210203001) Deve ser informado neste campo o valor por quilograma sem ICMS.
    _CODIF : widestring;	// 0-21	não	Código de autorização / registro do CODIF - Informar apenas quando a UF utilizar o CODIF (Sistema de Controle do Diferimento do Imposto nas Operações com AEAC - Álcool Etílico Anidro Combustível).
    _qTemp : real;	// 16,4	não	Quantidade de combustível faturada à temperatura ambiente - Informar quando a quantidade faturada informada no campo qCom (I10) tiver sido ajustada para uma temperatura diferente da ambiente.
    _UFCons : widestring; //	2	sim	Informar a UF de consumo
    _qBCprod : real; //	15,4	não	BC da CIDE - Informar a BC da CIDE em quantidade
    _vAliqProd : real; //	15,4	não	Valor da alíquota da CIDE - nformar o valor da alíquota em reais da CIDE
    _vCIDE : real; //	15,2	não	Valor da CIDE - Informar o valor da CIDE
    _encerrante_Opc : WideString; // (não)  Informar com os dados do encerrante, informação exigida para emissão de NFC-e. NT 2015/002

  public
    constructor Novo(cProdANP, descANP : widestring; CODIF : widestring; qTemp : real; UFCons : widestring; qBCprod : real; vAliqProd : real; vCIDE : real);
    function GetXML : WideString;

  end;

  TMed400 = class

  public

    _nLote : widestring;	//	1-20	(sim)	Número do Lote de medicamentos ou de matérias-primas farmacêuticas
    _cProdANVISA : WideString; // (sim) Código do produto da ANVISA, utilizar o número de registro da ANVISA
    _qLote : Real; //	11,3	(sim)	Quantidade de produto no Lote de medicamentos ou de matérias-primas farmacêuticas
    _dFab : Tdatetime; //	-	(sim)	Data de fabricação, informar no formato "AAAA-MM-DD"
    _dVal : Tdatetime; //	-	(sim)	Data de validade, informar no formato "AAAA-MM-DD"
    _vPMC : Real;

  public
    constructor Novo(nLote, cProdANVISA : WideString; qLote : Real; dFab : TDateTime; dVal : TDateTime; vPMC : Real);
    function GetXML : WideString;
  end;

  TInfAdProd = class

  public

    _infAdProd :	wideString; //	1-500	não	informar as informações adicionais do produto

  public
    constructor Novo(infAdProd :	wideString);
    function GetXML : WideString;
  end;

  TIcms400 = class

  public

    _orig : WideString; //	1	(sim)	informar o código da origem da mercadoria:
    {0 - Nacional;
    1 - Estrangeira - importação direta;
    2 - Estrangeira - adquirida no mercado interno.}
    _CST	: WideString;	//	2,3	(sim)	informar o CST da operação:
    {00 – Tributada integralmente;
    10 - Tributada e com cobrança do ICMS por substituição tributária;
    20 - Com redução de base de cálculo;
    30 - Isenta ou não tributada e com cobrança do ICMS por substituição tributária;
    40 - Isenta;
    41 - Não tributada;
    50 – Suspensão;
    51 - Diferimento;
    60 - ICMS cobrado anteriormente por substituição tributária;
    70 - Com redução de base de cálculo e cobrança do ICMS por substituição tributária;
    90 – Outros;
    P10 - ICMSPart com CST=10;
    P90 - ICMSPart com CST=90;
    S41 - ICMSST.
    ou
    Quando o CRT=1, informar o Código de Situação da Operação – Simples Nacional (CSOSN)
    101 – Tributada pelo Simples Nacional com permissão de crédito;
    102 – Tributada pelo Simples Nacional sem permissão de crédito;
    103 – Isenção do ICMS no Simples Nacional para faixa de receita bruta;
    201 – Tributada pelo Simples Nacional com permissão de crédito e com cobrança do ICMS por substituição tributária;
    202 – Tributada pelo Simples Nacional sem permissão de crédito e com cobrança do ICMS por substituição tributária;
    203 – Isenção do ICMS no Simples Nacional para faixa de receita bruta e com cobrança do ICMS por substituição tributária;
    300 – Imune;
    400 – Não tributada pelo Simples Nacional;
    500 – ICMS cobrado anteriormente por substituição tributária (substituído) ou por antecipação;
    900 - Outros.}
    _modBC	: integer; //	1	depende	informar a modalidade de determinação da BC do ICMS:
    {0 - Margem Valor Agregado (%);
    1 - Pauta (valor);
    2 - Preço Tabelado Máximo (valor);
    3 - Valor da Operação.}
    _pRedBC : Real; //	5,2	depende	informar o Percentual de redução da BC do ICMS da operação própria
    _vBC	: Real; //	15,2	depende	informar o Valor da BC do ICMS do ICMS da operação própria
    _pICMS	: Real; //	5,2	depende	informar a Alíquota do ICMS do ICMS da operação própria
    _vICMS	: Real; //	15,2	depende	informar o Valor do ICMS do ICMS da operação própria
    _modBCST	: integer; //	1	depende	informar a modalidade de determinação da BC do ICMS ST:
    {0 – Preço tabelado ou máximo sugerido;
    1 - Lista Negativa (valor);
    2 - Lista Positiva (valor);
    3 - Lista Neutra (valor);
    4 - Margem Valor Agregado (%);
    5 - Pauta (valor).}
    _pMVAST : Real; //	5,2	depende	informar o Percentual da Margem de Valor Adicionado ICMS ST
    _pRedBCST : Real; //	5,2	depende	informar o Percentual de redução da BC ICMS ST
    _vBCST	: Real; //	15,2	depende	informar o Valor da BC do ICMS ST
    _pICMSST	: Real; //	5,2	depende	informar a Alíquota do ICMS ST
    _vICMSST	: Real; //	15,2	depende	informar o Valor do ICMS ST
    _vBCSTRet : Real; //	15,2	depende	informar o Valor da BC do ICMS ST retido (campo novo)
    _vICMSSTRet : Real; //	15,2	depende	informar o Valor do ICMS ST retido (campo novo)
    _vBCSTDest	: Real; //	15,2	depende	informar o Valor da BC do ICMS ST da UF Destino (campo novo)
    _vICMSSTDest	: Real; //	15,2	depende	informar o Valor do ICMS ST da UF destino (campo novo)
    _motDesICMS : integer; //	1	depende	informar o Motivo da desoneração do ICMS:
    {1 – Táxi;
    2 – Deficiente Físico;
    3 – Produtor Agropecuário;
    4 – Frotista/Locadora;
    5 – Diplomático/Consular;
    6 – Utilitários e Motocicletas da Amazônia Ocidental e Áreas de Livre Comércio (Resolução 714/88 e 790/94 – CONTRAN e suas alterações);
    7 – SUFRAMA;
    9 – outros.
    IMPORTANTE: informe zero quando a operação não tenha isenção condicional.(campo novo)}
    _pBCOp	: Real; //	5,2	depende	informar o Percentual da BC operação própria (campo novo)
    _UFST : WideString; //	2	depende	informar a UF para qual é devido o ICMS ST (campo novo)
    _pCredSN	: Real; //	15,2	depende	informar o Alíquota aplicável de cálculo do crédito (Simples Nacional) (campo novo)
    _vCredICMSSN	: Real;
    _vICMSDeson : Real;  // valor ICMS Desonerado
    _vICMSOp : Real; // (Depende) informar o Valor do ICMS da operação que não será diferido
    _pDif : Real; // (Depende) informar o percentual do diferimento
    _vICMSDif : Real; // (Depende) informar o valor do ICMS que será diferido
    { DIFAL }
    _vBCFCP : Real; // (Depende) informar o Valor da Base de Cálculo do FCP
    _pFCP : Real; // (Depende) informar o Percentual do FCP. Nota: Percentual máximo de 2%, conforme a legislação
    _vFCP : Real; // (Depende) informar o Valor do FCP
    _vBCFCPST : Real; // (Depende) informar o Valor da Base de Cálculo do FCP retido por Substituição Tributária
    _pFCPST : Real; // (Depende) informar o Percentual do FCP retido por Substituição Tributária.  Nota: Percentual máximo de 2%, conforme a legislação
    _vFCPST : Real; // (Depende) informar o Valor do FCP retido por Substituição Tributária.
    _vBCFCPSTRet : Real; // (Depende) informar o Valor da Base de Cálculo do FCP retido anteriormente por Substituição Tributária.
    _pFCPSTRet : Real; // (Depende) informar o Percentual do FCP retido anteriormente por Substituição Tributária. Nota: Percentual máximo de 2%, conforme a legislação
    _vFCPSTRet : Real; // (Depende) informar o Valor do FCP retido anteriormente por Substituição Tributária.
    _pST : Real; // (Depende) informar Alíquota suportada pelo Consumidor Final. Deve ser informada a alíquota do cálculo do ICMS-ST, já incluso o FCP caso incida sobre a mercadoria. Exemplo: alíquota da mercadoria na venda ao consumidor final = 18% e 2% de FCP. A alíquota a ser informada no campo pST deve ser 20%

  public
    constructor Novo(orig : WideString;CST : WideString;modBC : integer;pRedBC : Real;vBC : Real;pICMS : Real;vICMS : Real;
             modBCST : integer;pMVAST : Real;pRedBCST : Real;vBCST : Real;pICMSST : Real;vICMSST : Real;vBCSTRet : Real;
             vICMSSTRet : Real;vBCSTDest : Real;vICMSSTDest : Real;motDesICMS : integer;pBCOp : Real;UFST : WideString;
             pCredSN : Real; vCredICMSSN : Real; vICMSDeson : Real;
             vBCFCP, pFCP, vFCP, vBCFCPST, pFCPST, vFCPST, vBCFCPSTRet, pFCPSTRet, vFCPSTRet, pST : Real );
    function GetXML : WideString;
  end;

  TIPI = class

  public

    _clEnq	: widestring; //	1-5	(não)	Informar a classe de enquadramento do IPI para Cigarros e Bebidas conforme Atos Normativos editados pela Receita Federal do Brasil.
    _CNPJProd : widestring; //	14	(não)	Informar o CNPJ do produtor da mercadoria, quando diferente do emitente nas exportações direta ou indireta.
    _cSelo	: widestring; //	1-60	(não)	Informar o código do Selo de Controle do IPI conforme Atos Normativos editados pela Receita Federal do Brasil.
    _qSelo	: Real; //	15,0	(não)	Informar a quantidade de Selo de Controle do IPI utilizados.
    _cEnq : widestring; //	1-3	(sim)	Informar o Código de Enquadramento Legal do IPI, informar 999 enquanto a tabela não tiver sido criada pela Receita Federal do Brasil.
    _CST	: widestring; //	2	(sim)	Informar o Código de Situação Tributária do IPI.
    _vBC	: Real; //	15,2	?	Informar o Valor da BC do IPI, este campo deve ser informado em caso de alíquota ad valorem.
    _pIPI : Real; //	5,2	?	Informar a alíquota percentual do IPI, este campo deve ser informado em caso de alíquota ad valorem.
    _vIPI : Real; //	15,2	(sim)	Informar o Valor do IPI
    _qUnid	: Real; //	15,4	?	Informar a quantidade total na unidade padrão de tributação, este campo deve ser informado em caso de alíquota específica.
    _vUnid	: Real;
    _importacao : boolean; //indica se a nota é de importação

  public
    constructor Novo(clEnq : widestring;CNPJProd : widestring;cSelo	: widestring;qSelo : Real;cEnq : widestring;CST	: widestring;
            vBC	: Real;pIPI : Real;vIPI : Real;qUnid : Real;vUnid	: Real; importacao : boolean);
    function GetXML : WideString;
  end;

  TII = class

  public

    _vBC : real; // 15,2	sim	Informar o Valor da BC do Imposto de Importação
    _vDespAdu : real; // 15,2	sim	Informar o valor das despesas aduaneiras
    _vII : real; // 15,2	sim	Informar a o valor do Imposto de Importação
    _vIOF : real; // 15,2	sim	Informar o Valor do IOF - Imposto sobre Operações Financeiras
    _isNFe : Boolean;  // gerar o grupo de tag vazio se for nfc-e

  public
    constructor Novo(vBC : Real;vDespAdu : Real;vII : Real;vIOF : real; isNFe : Boolean);
    function GetXML : WideString;

  end;

  TPIS = class

    public

      _CST : widestring; //	2	(sim)	Informar o Código de Situação Tributária do PIS, para CST=05 informe o grupo PISST PISST.
      //Cabe ressaltar que a informação do grupo PISST não desobriga a informação do grupo PIS.
      _vBC : Real; //	15,2	?	Informar o Valor da BC do PIS, este campo deve ser informado em caso de alíquota ad valorem.
      _pPIS : Real; //	5,2	?	Informar a alíquota percentual do PIS, este campo deve ser informado em caso de alíquota ad valorem.
      _vPIS : Real; //	15,2	(sim)	Informar o Valor do PIS
      _qBCProd : Real; //	16,4	?	Informar a quantidade vendida, este campo deve ser informado em caso de alíquota específica.
      _vAliqProd : Real;

    public
      constructor Novo(CST : widestring;vBC : Real;pPIS : Real;vPIS : Real;qBCProd : Real;vAliqProd : Real);
      function GetXML : WideString;
  end;

  TCOFINS = class

    public

      _CST : widestring; //	2	(sim)	Informar o Código de Situação Tributária do COFINS, para CST=05 informe o grupo COFINSST COFINSST.
      //Cabe ressaltar que a informação do grupo COFINSST não desobriga a informação do grupo COFINS.
      _vBC : Real; //	15,2	?	Informar o Valor da BC do COFINS, este campo deve ser informado em caso de alíquota ad valorem.
      _pCOFINS : Real; //	5,2	?	Informar a alíquota percentual do COFINS, este campo deve ser informado em caso de alíquota ad valorem.
      _vCOFINS : Real; //	15,2	(sim)	Informar o Valor do COFINS
      _qBCProd : Real; //	16,4	?	Informar a quantidade vendida, este campo deve ser informado em caso de alíquota específica.
      _vAliqProd : Real;

    public
      constructor Novo(CST : widestring;vBC : Real;pCOFINS : Real;vCOFINS : Real;qBCProd : Real;vAliqProd : Real);
      function GetXML : WideString;
  end;

  TImposto2G = class

  private
    _vTotTrib : Real;
    _ICMS     : TIcms400;
    _IPI      : TIPI;
    _PIS      : TPIS;
    _COFINS   : TCOFINS;
    _II       : TII;
  public
    constructor Novo(vTotTrib : Real; ICMS : TIcms400; IPI : TIPI; PIS : TPIS; COFINS : TCOFINS; II : TII);
    function GetXML : WideString;
  end;

  { DONE -oHerbertH -c : colocar no emissor granja 23/12/2015 11:35:08 }
  TFundoCombPobreza = class

    public

      _vBCUFDest        : Real; // Informar o Valor da Base de Cálculo do ICMS na UF de destino.
      _vBCFCPUFDest     : Real; // informar o Valor da Base de Cálculo do FCP na UF Destino
      _pFCPUFDest       : Real; // Informar a Alíquota adotada nas operações internas na UF de destino para o produto / mercadoria. A alíquota do Fundo de Combate a Pobreza
      _pICMSUFDest      : Real; // Informar a Alíquota adotada nas operações internas na UF de destino para o prDONEo
      _pICMSInter       : Real; // Informar a Alíquota interestadual das UF envolvidas:
      _pICMSInterPart   : Real; // Informar Percentual de ICMS Interestadual para a UF de destino: 40% em 2016; 60% em 2017; 80% em 2018; 100% a partir de 2019.
      _vFCPUFDest       : Real; // Informar o Valor do ICMS relativo ao Fundo de Combate à Pobreza (FCP) da UF de destino.
      _vICMSUFDest      : Real; // Informar o Valor do ICMS Interestadual para a UF de destino, já considerando o valor do ICMS relativo ao Fundo de Combate à Pobreza naquela UF.
      _vICMSUFRemet     : Real; // Informar o Valor do ICMS Interestadual para a UF do remetente. Nota: A partir de 2019, este valor será zero.

    public
      constructor Novo(vBCUFDest, vBCFCPUFDest, pFCPUFDest, pICMSUFDest, pICMSInter, pICMSInterPart, vFCPUFDest, vICMSUFDest, vICMSUFRemet : Real);
      function GetXML : WideString;
  end;

  { DONE -oHerbertH -c : colocar no emissor granja 23/12/2015 11:35:08 }
  TimpostoNT2015003 = class

  public

    _vTotTrib : Real;
    _ICMS     : TIcms400;
    _IPI      : TIPI;
    _PIS      : TPIS;
    _COFINS   : TCOFINS;
    _II       : TII;
    _FCP      : TFundoCombPobreza;

  public
    constructor Novo(vTotTrib : Real; ICMS : TIcms400; IPI : TIPI; PIS : TPIS; COFINS : TCOFINS; II : TII; FCP : TFundoCombPobreza);
    function GetXML : WideString;
  end;

  TTotalICMS = class

  private
    _vBC	: Real; //	15,2	(sim)	informar o somatório da BC do ICMS (vBC) informado nos itens
    _vICMS	: Real; //	15,2	(sim)	informar o somatório de ICMS (vICMS) informado nos itens
    _vBCST	: Real; //	15,2	(sim)	informar o somatório da BC ST (vBCST) informado nos itens
    _vST	: Real; //	15,2	(sim)	informar o somatório do ICMS ST (vICMSST)informado nos itens
    _vProd	: Real; //	15,2	(sim)	informar o somatório de valor dos produtos (vProd) dos itens que tenham indicador de totalização = 1 (indTot)
    //Os valores dos itens sujeitos ao ISSQN não devem ser acumulados neste campo.
    _vFrete : Real; //	15,2	(sim)	informar o somatório de valor do Frete (vFrete) informado nos itens
    _vSeg : Real; //	15,2	(sim)	informar o somatório valor do Seguro (vSeg) informado nos itens
    _vDesc	: Real; //	15,2	(sim)	informar o somatório do Desconto (vDesc) informado nos itens
    _vII	: Real; //	15,2	(sim)	informar o somatório de II (vII) informado nos itens
    _vIPI : Real; //	15,2	(sim)	informar o somatório de IPI (vIPI) informado nos itens
    _vPIS : Real; //	15,2	(sim)	informar o somatório de PIS (vPIS) informado nos itens sujeitos ao ICMS
    _vCOFINS	: Real; //	15,2	(sim)	informar o somatório de COFINS (vCOFINS) informado nos itens sujeitos ao ICMS
    _vOutro : Real; //	15,2	(sim)	informar o somatório de vOutro (vOutro) informado nos itens
    _vNF	: Real;
    _vTotTrib : Real;
    _vICMSDeson : Real; //informar o somatório do Valor do ICMS desonerado (vICMSDeson) informado nos itens.
    //Acrescentar o valor dos Serviços informados no grupo do ISSQN
  public
    constructor Novo(vBC : Real;vICMS : Real;vBCST : Real;vST : Real;vProd : Real;vFrete : Real;vSeg : Real;vDesc : Real;vII : Real;
          vIPI : Real;vPIS : Real;vCOFINS : Real;vOutro : Real;vNF : Real;vTotTrib : Real;vICMSDeson : real);
    function GetXML : WideString;
  end;

  TtotalICMS400 = class

  public

    _vBC	: Real; //	15,2	(sim)	informar o somatório da BC do ICMS (vBC) informado nos itens
    _vICMS	: Real; //	15,2	(sim)	informar o somatório de ICMS (vICMS) informado nos itens
    _vBCST	: Real; //	15,2	(sim)	informar o somatório da BC ST (vBCST) informado nos itens
    _vST	: Real; //	15,2	(sim)	informar o somatório do ICMS ST (vICMSST)informado nos itens
    _vProd	: Real; //	15,2	(sim)	informar o somatório de valor dos produtos (vProd) dos itens que tenham indicador de totalização = 1 (indTot)
    //Os valores dos itens sujeitos ao ISSQN não devem ser acumulados neste campo.
    _vFrete : Real; //	15,2	(sim)	informar o somatório de valor do Frete (vFrete) informado nos itens
    _vSeg : Real; //	15,2	(sim)	informar o somatório valor do Seguro (vSeg) informado nos itens
    _vDesc	: Real; //	15,2	(sim)	informar o somatório do Desconto (vDesc) informado nos itens
    _vII	: Real; //	15,2	(sim)	informar o somatório de II (vII) informado nos itens
    _vIPI : Real; //	15,2	(sim)	informar o somatório de IPI (vIPI) informado nos itens
    _vPIS : Real; //	15,2	(sim)	informar o somatório de PIS (vPIS) informado nos itens sujeitos ao ICMS
    _vCOFINS	: Real; //	15,2	(sim)	informar o somatório de COFINS (vCOFINS) informado nos itens sujeitos ao ICMS
    _vOutro : Real; //	15,2	(sim)	informar o somatório de vOutro (vOutro) informado nos itens
    _vNF	: Real;
    _vTotTrib : Real;
    _vICMSDeson : Real; //informar o somatório do Valor do ICMS desonerado (vICMSDeson) informado nos itens.
    _vICMSUFDest_Opc : Real;  // informar o somatório do Valor do ICMS Interestadual para a UF de destino (vICMSUFDest) informado nos itens.
    _vICMSUFRemet_Opc : Real; // informar o somatório do Valor total do ICMS Interestadual para a UF do remetente vICMSUFRemet) informado nos itens. Nota: A partir de 2019, este valor será zero.
    _vFCPUFDest_Opc : Real;   // informar o somatório do Valor do ICMS relativo ao Fundo de Combate à Pobreza (FCP) da UF de destino (vFCPUFDest) informado nos itens.
    _vFCP       : Real;   // (nao) informar o somatório do Valor do FCP (Fundo de Combate à Pobreza) (vFCP) informado nos itens.
    _vFCPST     : Real;   // (nao) informar o somatório do Valor do FCP retido anteriormente por Substituição. Corresponde ao total da soma dos campos vFCPST informado nos itens.
    _vFCPSTRet  : Real;   // (nao) informar o somatório do Valor do FCP retido anteriormente por Substituição. Corresponde ao total da soma dos campos vFCPSTRet informado nos itens
    _vIPIDevol  : Real;   // (nao) informar o somatório do Valor do IPI devolvido. Deve ser informado quando preenchido o Grupo Tributos Devolvidos na emissão de nota finNFe=4 (devolução) nas operações com não contribuintes do IPI. Corresponde ao total da soma dos campos vIIPIDevol do item

    //Acrescentar o valor dos Serviços informados no grupo do ISSQN

  public
    constructor Novo(vBC : Real; vICMS : Real; vBCST : Real; vST : Real; vProd : Real; vFrete : Real; vSeg : Real; vDesc : Real; vII : Real;
          vIPI : Real; vPIS : Real; vCOFINS : Real; vOutro : Real; vNF : Real; vTotTrib : Real; vICMSDeson : real; vICMSUFDest_Opc : Real;
          vICMSUFRemet_Opc : Real; vFCPUFDest_Opc, vFCP, vFCPST, vFCPSTRet, vIPIDevol : Real);
    function GetXML : WideString;
  end;

  TTransporta = class

  public
    _CNPJ : widestring; //	14	(não)	informar o CNPJ do transportador, sem formatação ou máscara
    _CPF : widestring; //	11	(não)	informar o CPF do transportador, sem formatação ou máscara
    _xNome : widestring; //	1-60	(não)	informar a razão social do transportador
    _IE : widestring; //	0-14	(não)	informar a IE do transportador, sem formatação ou máscara.
    _xEnder : widestring; //	1-60	(não)	informar o endereço completo do transportador
    _xMun : widestring; //	1-60	(não)	informar o nome do município
    _UF : widestring;

  public
    constructor Novo(CNPJ : widestring;CPF : widestring;xNome	: widestring;IE : widestring;xEnder : widestring;xMun : widestring;UF : widestring);
    function GetXML : WideString;
  end;

  TVeicTransp = class

  public
    _placa :	widestring; //	1-8	(sim)	informar a placa do veículo, somente letras e dígitos
    _UF : widestring; //	2	(sim)	informar a sigla da UF do registro do veículo
    _RNTC : widestring;

  public
    constructor Novo(placa :	widestring;UF : widestring;RNTC : widestring);
    function GetXML : WideString;
  end;

  TVol = class

  public
    _qVol : Real; //	1-15	(não)	informar a quantidade de volume transportados
    _esp : widestring; //	1-60	(não)	informar a espécie dos volume transportados
    _marca : widestring; //	1-60	(não)	informar a marca dos volume transportados
    _nVol : widestring; //	1-60	(não)	informar a numeração dos volume transportados
    _pesoL : Real; //	12,3	(não)	informar o peso líquido em kg dos volumes transportados
    _pesoB : Real; //	12,3	(não)	informar o peso bruto em kg dos volumes transportados
    _lacres : widestring;

  public
    constructor Novo(qVol : Real;esp : widestring;marca	: widestring;nVol : widestring;pesoL : Real;pesoB	: Real;lacres : widestring);
    function GetXML : WideString;
  end;


  //A informação mínima exigida neste grupo é a tag modFrete, que agora aceita o valor 9-sem frete que deve ser informado em uma
  //nota fiscal que não acoberte uma efetiva circulação de mercadorias como é o caso da NF de Simples Faturamento, NF de complemento
  //do ICMS, etc.
  TTransportador2G = class

  public
    _modFrete : widestring; //	1	(sim)	informar a modalidade do frete:
    {0-por conta do emitente;
    1-por conta do destinatário;
    2-por conta de terceiros;
    9-sem frete.   }
    //(campo com novo domínio)
    _transporta : TTransporta; //	-	(não)	informar o XML com os dados do transportador
    _retTransp : widestring;   //	-	(não)	informar o XML com os valores dos tributos retidos do transportador
    _veicTransp : TVeicTransp; //	-	(não)	informar o XML com os dados do veículo utilizado no transporte
    _reboque : widestring;     //	-	(não)	informar o XML com os dados dos reboques utilizados no transporte (cardinalidade ampliada)
    _vagao : widestring;       //	-	(não)	informar os dados do vagão utilizados no transporte (novo campo)
    _balsa : widestring;      //	-	(não)	informar os dados da balsa utilizados no transporte (novo campo)
    _vol : TVol;

  public
    constructor Novo(modFrete : widestring;transporta : TTransporta;retTransp	: widestring;veicTransp : TVeicTransp;reboque	: widestring;
          vagao	: widestring;balsa : widestring;vol : TVol);
    function GetXML : WideString;
  end;

  TProduto = class

  public
    _detalhe : TProduto400;
    _imposto : TimpostoNT2015003;
    _infAdProd : TInfAdProd;
    _pDevol_Opc : Real;
    _vIPIDevol_Opc : Real;

  public
    constructor Novo(detalhe : TProduto400; imposto : TimpostoNT2015003; infAdProd : TInfAdProd; pDevol_Opc, vIPIDevol_Opc : Real);
    function GetXML : WideString;
  end;

  type

  ListaProdutos = TList<TProduto>;

  TautXML = class

    public

      _cnpj : WideString;
      _cpf  : WideString;
      constructor Novo(cnpj, cpf : WideString);
      function getXml : WideString;
  end;

  TInfAdic2G = class

  public

    _infAdFisco : widestring; //	1-2000	(não)	informar as informações de interesse do Fisco (campo com novo tamanho)
    _infCpl : widestring; //	1-5000	(não)	informar as informações complementares de interesse do contribuite
    _obsCont	: widestring; //	-	(não)	informar o XML com o obsCont
    _obsFisco : widestring; //	-	(não)	informar o XML com o obsFisco
    _procRef	: widestring; //	-	(não)	informar o XML com o procRef

  public
    constructor Novo(infAdFisco : widestring;infCpl : widestring;obsCont	: widestring;obsFisco : widestring;procRef	: widestring);
    function GetXML : WideString;
    function TrimPalavra(texto : WideString) : WideString;
  end;

  TDup = class
  private

  public
    _nDup  : widestring; //	1-60	(não)	informar o número da duplicata
    _dVenc : TDateTime; //	-	(não)	informar a data de vencimento da duplicata
    _vDup  : Real; //	15,2	(não)	informar o valor da duplicata

    constructor Novo(nDup : widestring;dVenc : TDateTime;vDup : Real);
    function GetXML : WideString;
  end;

  type
    ListaDuplicata = TList<TDup>;

  TCobr = class

  public

    _nFat  : widestring; //	1-60	(não)	informar o número da fatura
    _vOrig : Real; //	15,2	(não)	informar o valor originário da fatura
    _vDesc : Real; //	15,2	(não)	informar o valor do desconto
    _vLiq  : Real; //	15,2	(não)	informar o valor Liquido da fatura
    _dup   : ListaDuplicata; //	-	(não)	informar o XML do grupo dup de duplicatas

  public
    constructor Novo(nFat : widestring;vOrig : Real;vDesc : Real;vLiq : Real;dup : ListaDuplicata);
    function GetXML : WideString;
  end;

  TNota = class

    public
      _versao         : WideString;
      _id            : WideString;
      _identificador : TIdentificador400;
      _emitente      : TEmitente2G;
      _destinatario  : TDestinatario2G;
      _produto       : ListaProdutos;
      _totalICMS     : TtotalICMS400;
      _transporte    : TTransportador2G;
      _infAdic       : TInfAdic2G;
      _cobr          : TCobr;
      _autXML        : TautXML;
      _pag           : string;
      _rastro        : TRastro;
      _medicamento   : TMed400;

    private
      function getProdutos : WideString;
      function versao : string;

    public
      constructor Novo(id : WideString; identificador : TIdentificador400; emitente : TEmitente2G; destinatario : TDestinatario2G; produto : ListaProdutos;
           totalICMS : TtotalICMS400; transporte : TTransportador2G; infAdic : TInfAdic2G; cobr : TCobr; pag : string; autXML : TautXML);
      function GetXML : WideString;
  end;

implementation

uses DateUtils, SysUtils, uFuncoesPadrao, FrmPrincipal;

{ TIdentificador2G }

function TIdentificador400.GetXML: WideString;
var
  Util : NFe_Util_2G_Interface;
//  lista : TNFreferenciada;
  xml : WideString;
  ref : WideString;
  x : Integer;
begin
  if _NFRef <> nil then
  begin
    for x := 0 to _NFRef.count -1 do  // _NFRef lista de referenciamento
    begin
      if _NFRef[x] <> nil then
        ref := ref + _NFRef[x].GetXML;
    end;
  end else
    ref := '';
  Util := CoUtil.Create;
  xml  := Util.identificador400(_cUF, _cNF, _natOpe, _mode, _serie, _nNF, _dEmi, _dSaiEnt, _tpNF, _idDest, _cMunFG, ref, _tpImp,
                _tpEmis, _cDV, _tpAmb, _finNFe, _indFinal, _indPres, _procEmi, _verProc, _dhCont, _xJust);
  Util := nil;
  Result := xml;
end;

constructor TIdentificador400.Novo(cUF, cNF: integer; natOpe: widestring;
  mode, serie, nNF: Integer; dEmi ,dSaiEnt: widestring;
  tpNF: Integer; idDest : integer; cMunFG: widestring;
  NFref: ListaReferencia; tpImp, tpEmis, cDV, tpAmb, finNFe, indFinal, indPres,
  procEmi: integer; verProc: widestring; dhCont: widestring;
  xJust: widestring);
begin
  _cUF := cUF;
  _cNF := cNF;
  _natOpe := RetirarAcento(natOpe);
  _mode	:= mode;
  _serie := serie;
  _nNF := nNF;
  _dEmi := dEmi;
  _dSaiEnt := dSaiEnt;
  _tpNF	:= tpNF;
  _cMunFG := cMunFG;
  _NFRef := NFRef;
  _tpImp := tpImp;
  _tpEmis := tpEmis;
  _cDV := cDV;
  _tpAmb := tpAmb;
  _finNFe := finNFe;
  _procEmi := procEmi;
  _verProc := verProc;
  _dhCont := dhCont;
  _xJust := RetirarAcento(xJust);
  _idDest := idDest;
  _indFinal := indFinal;
  _indPres := indPres;
end;

{ TEmitente2G }

function TEmitente2G.GetXML: WideString;
var
  Util : NFe_Util_2G_Interface;
  xml : WideString;
begin
  Util := CoUtil.Create;
  xml  := Util.emitente2G(_CNPJ,_CPF,_xNome,_xFant,_xLgr,_nro,_xCpl,_xBairro,_cMun,_xMun,_UF,_CEP,_cPais,_xPais,_fone,_IE,_IEST,_IM,_CNAE,_CRT);
  Util := nil;
  Result := xml;
end;

constructor TEmitente2G.Novo(CNPJ, CPF, xNome, xFant, xLgr, nro,
  xCpl, xBairro, cMun, xMun, UF, CEP, cPais, xPais, fone, IE, IEST, IM,
  CNAE, CRT: widestring);
begin
  _CNPJ := Trim(SoNumeros(CNPJ));
  _CPF := Trim(SoNumeros(CPF));
  _xNome := RetirarAcento(xNome);
  _xFant := RetirarAcento(xFant);
  _xLgr := RetirarAcento(xLgr);
  _nro := nro;
  _xCpl := RetirarAcento(xCpl);
  _xBairro := RetirarAcento(xBairro);
  _cMun := cMun;
  _xMun := RetirarAcento(xMun);
  _UF := UF;
  _CEP := CEP;
  _cPais := cPais;
  _xPais := RetirarAcento(xPais);
  _fone := fone;
  _IE := Trim(SoNumeros(IE));
  _IEST := Trim(SoNumeros(IEST));
  _IM := Trim(SoNumeros(IM));
  _CNAE := CNAE;
  _CRT := CRT;
end;

{ TDestinatario2G }

function TDestinatario2G.GetXML: WideString;
var
  Util : NFe_Util_2G_Interface;
  xml : WideString;
begin
  Util := CoUtil.Create;
  xml  := Util.destinatario310(_CNPJ,_CPF,_idEstrangeiro,_xNome,_xLgr,_nro,_xCpl,_xBairro,_cMun,_xMun,_UF,_CEP,_cPais,_xPais,_fone,_indIEDest,_IE,_ISUF,_IM,_eMail);
  Util := nil;
  Result := xml;
end;

constructor TDestinatario2G.Novo(CNPJ, CPF, idEstrangeiro, xNome, xLgr, nro,
  xCpl, xBairro, cMun, xMun, UF, CEP, cPais, xPais, fone, indIEDest, IE, ISUF,
  IM, eMail: widestring);
begin
  _CNPJ := Trim(SoNumeros(CNPJ));
  _CPF := Trim(SoNumeros(CPF));
  _idEstrangeiro := idEstrangeiro;
  _xNome := RetirarAcento(xNome);
  _xLgr := RetirarAcento(xLgr);
  _nro := nro;
  _xCpl := RetirarAcento(xCpl);
  _xBairro := RetirarAcento(xBairro);
  _cMun := cMun;
  _xMun := RetirarAcento(xMun);
  _UF := UF;
  _CEP := CEP;
  _cPais := cPais;
  _xPais := RetirarAcento(xPais);
  _fone := Trim(SoNumeros(fone));
  _indIEDest := indIEDest;
  _IE := Trim(SoNumeros(IE));
  _ISUF := ISUF;
  _IM := Trim(SoNumeros(IM));;
  _eMail := eMail;
end;

constructor TDestinatario2G.NovoDestinatario(CNPJ, CPF, idEstrangeiro, xNome, xLgr, nro,
  xCpl, xBairro, cMun, xMun, UF, CEP, cPais, xPais, fone, indIEDest, IE, ISUF, IM,
  eMail: widestring; observacao, codigo : string; tipoDestinatario, tipoCliente, codigoVendedor : string;
  comprarNoCrediario : Boolean; indFinal, idDest : Integer);  //tipoAliquotaICMS : Integer;
begin
  _CNPJ := Trim(SoNumeros(CNPJ));
  _CPF := Trim(SoNumeros(CPF));
  _idEstrangeiro := idEstrangeiro;
  _xNome := RetirarAcento(xNome);
  _xLgr := RetirarAcento(xLgr);
  _nro := nro;
  _xCpl := RetirarAcento(xCpl);
  _xBairro := RetirarAcento(xBairro);
  _cMun := cMun;
  _xMun := RetirarAcento(xMun);
  _UF := UF;
  _CEP := CEP;
  _cPais := cPais;
  _xPais := RetirarAcento(xPais);
  _fone := Trim(SoNumeros(fone));
  _indIEDest := indIEDest;
  _IE := Trim(SoNumeros(IE));
  _ISUF := ISUF;
  _IM := Trim(SoNumeros(IM));;
  _eMail := eMail;
  _observacao := observacao;
  _CODIGO := codigo;
//  _tipoAliquotaICMS := tipoAliquotaICMS;
  _tipoDestinatario := tipoDestinatario;
  _tipoCliente := tipoCliente;
  _codigoVendedor := codigoVendedor;
  _comprarAPrazo := comprarNoCrediario;
  _indFinal := indFinal;
  _idDest := idDest;
end;

{ TProduto400 }

function TProduto400.GetXML: WideString;
var
  Util : NFe_Util_2G_Interface;
  xml : WideString;
begin
  Util := CoUtil.Create;
  xml  := Util.produto400(_cProd, _cEAN, _xProd, _NCM, _NVE_Opc, _CEST_Opc, _indEscala_Opc, _CNPJFab_Opc, _cBenef_Opc, _EXTIPI, _CFOP, _uCom, _qCom, _vUnCom, _vProd,
                  _cEANTrib, _uTrib, _qTrib, _vUnTrib, _vFrete, _vSeg,
                  _vDesc, _vOutro, _indTot, _DI, _detExport_Opc, _DetEspecifico, _xPed, _nItemPed, _nFCI_Opc, _rastro_Opc);

{  xml  := Util.produtoNT2015003(_cProd, _cEAN, _xProd, _NCM, _NVE_Opc, _CEST_Opc, _EXTIPI, _CFOP, _uCom, _qCom, _vUnCom, _vProd,
                  _cEANTrib, _uTrib, _qTrib, _vUnTrib, _vFrete, _vSeg,
                  _vDesc, _vOutro, _indTot, _DI, _detExport_Opc, _DetEspecifico, _xPed, _nItemPed, _nFCI_Opc);}
{  xml  := Util.produto310(_cProd, _cEAN, _xProd, _NCM, _NVE_Opc, _EXTIPI, _CFOP, _uCom, _qCom, _vUnCom, _vProd,
                  _cEANTrib, _uTrib, _qTrib, _vUnTrib, _vFrete, _vSeg,
                  _vDesc, _vOutro, _indTot, _DI, _detExport_Opc, _DetEspecifico, _xPed, _nItemPed, _nFCI_Opc); }
  Util := nil;
  Result := xml;
end;

constructor TProduto400.Novo(cProd, cEAN, xProd, NCM, NVE_Opc, CEST_Opc,
  indEscala_Opc, CNPJFab_Opc, cBenef_Opc,
  EXTIPI: wideString; CFOP: integer; uCom, qCom, vUnCom: widestring;
  vProd: Real; cEANTrib, uTrib, qTrib, vUnTrib: widestring; vFrete, vSeg,
  vDesc, vOutro: Real; indTot: Integer; DI, detExport_Opc, DetEspecifico,
  xPed: wideString; nItemPed: WideString; nFCI_Opc, rastro_Opc : WideString);
begin
  _cProd := cProd;
  _cEAN := cEAN;
  _xProd := RetirarAcento(xProd);
  _NCM := Trim(SoNumeros(NCM));
  _NVE_Opc := NVE_Opc;
  _CEST_Opc := CEST_Opc;
  _indEscala_Opc :=  indEscala_Opc;
  _CNPJFab_Opc := CNPJFab_Opc;
  _cBenef_Opc := cBenef_Opc;
  _EXTIPI := EXTIPI;
  _CFOP := CFOP;
  _uCOM := uCOM;
  _qCOM := qCOM;
  _vUnCOM := vUnCOM;
  _vProd := vProd;
  _cEANTrib := cEANTrib;
  _uTrib := uTrib;
  _qTrib := qTrib;
  _vUnTrib := vUnTrib;
  _vFrete := vFrete;
  _vSeg := vSeg;
  _vDesc := StrToFloat(formatFloat('0.00',vDesc));
  _vOutro := vOutro;
  _indTot := indTot;
  _DI := DI;
  _detExport_Opc := detExport_Opc;
  _DetEspecifico := DetEspecifico;
  _xPed := xPed;
  _nItemPed := nItemPed;
  _nFCI_Opc := nFCI_Opc;
  _rastro_Opc := rastro_Opc;
end;

{ TNota }

function TNota.GetXML: WideString;
var
  Util : NFe_Util_2G_Interface;
  xml  : WideString;
begin
  Util := CoUtil.Create;
  xml  := Util.NFe310(_versao, _id, _identificador.GetXML, _emitente.GetXML, '', _destinatario.GetXML, '', '', getProdutos, _totalICMS.GetXML,
                      _transporte.GetXML, _cobr.GetXML, _pag,_infAdic.GetXML, '' , '', '', _autXML.getXml);
  Util := nil;
  Result := xml;
end;

function TNota.getProdutos: WideString;
var
  tagDet : WideString;
  x      : integer;
  Util : NFe_Util_2G_Interface;
  xml  : WideString;
begin
  for x := 0 to _produto.Count -1 do
  begin
    if _produto[x] <> nil then
    begin
      Util := CoUtil.Create;
//      tagDet := tagDet + '<det nItem="'+IntToStr(x+1)+'">' +_produto[x].GetXML + '</det>';
      tagDet := tagDet + util.detalhe310(x+1, _produto[x]._detalhe.GetXML, _produto[x]._imposto.GetXML, _produto[x]._infAdProd.GetXML, _produto[x]._pDevol_Opc, _produto[x]._vIPIDevol_Opc);
    end;
  end;
  Result := tagDet;
end;

constructor TNota.Novo(id : WideString;identificador: TIdentificador400;
  emitente: TEmitente2G; destinatario: TDestinatario2G;
  produto: ListaProdutos; totalICMS: TtotalICMS400;
  transporte: TTransportador2G; infAdic: TInfAdic2G; cobr: TCobr; pag : string; autXML : TautXML);
begin
  _versao := versao;
  _id := id;
  _identificador := identificador;
  _emitente      := emitente;
  _destinatario  := destinatario;
  _produto    := produto;
  _totalICMS  := totalICMS;
  _transporte := transporte;
  _infAdic := infAdic;
  _cobr    := cobr;
  _autXml  := autXML;
  _pag     := pag;
end;

function TNota.versao: string;
begin
  Result := '4.00';
end;

{ TProduto }

function TProduto.GetXML: WideString;
begin
  Result := GetXML;//  (_detalhe.GetXML + _imposto.GetXML + _infAdProd.GetXML);
end;

constructor TProduto.Novo(detalhe: TProduto400; imposto: TimpostoNT2015003; infAdProd : TInfAdProd; pDevol_Opc, vIPIDevol_Opc : Real);
begin
  _detalhe   := detalhe;
  _imposto   := imposto;
  _infAdProd := infAdProd;
  _pDevol_Opc := pDevol_Opc;
  _vIPIDevol_Opc := vIPIDevol_Opc;
end;

{ TVeicProd2G }

function TVeicProd2G.GetXML: WideString;
var
  Util : NFe_Util_2G_Interface;
  xml : WideString;
begin
  Util := CoUtil.Create;
  xml  := Util.veicProd2G(_tpOp,_chassi,_cCor,_xCor,_pot,_cilin,_pesoL,_pesoB,_nSerie,_tpComb,_nMotor,_CMT,_dist,_anoMod,_anoFab,
                _tpPint,_tpVeic,_espVeic,_VIN,_condVeic,_cMod,_cCorDENATRAN,_lota,_tpRest);
  Util := nil;
  Result := xml;
end;

constructor TVeicProd2G.Novo(tpOp : Integer; chassi, cCor, xCor, pot, cilin, pesoL,
  pesoB, nSerie, tpComb, nMotor, CMT, dist, anoMod, anoFab, tpPint, tpVeic,
  espVeic, VIN, condVeic, cMod, cCorDENATRAN, lota, tpRest: widestring);
begin
  _tpOp	:= tpOp;
  _chassi	:= chassi;
  _cCor	:= cCor;
  _xCor	:= xCor;
  _pot := pot;
  _cilin := cilin;
  _pesoL := pesoL;
  _pesoB := pesoB;
  _nSerie	:= nSerie;
  _tpComb	:= tpComb;
  _nMotor	:= nMotor;
  _CMT := CMT;
  _dist := dist;
  _anoMod	:= anoMod;
  _anoFab	:= anoFab;
  _tpPint	:= tpPint;
  _tpVeic	:= tpVeic;
  _espVeic := espVeic;
  _VIN := VIN;
  _condVeic	:= condVeic;
  _cMod	:= cMod;
  _cCorDENATRAN	:= cCorDENATRAN;
  _lota	:= lota;
  _tpRest	:= tpRest;
end;

{ TIcms2G }

function TIcms400.GetXML: WideString;
var
  Util : NFe_Util_2G_Interface;
  xml : WideString;
begin
  Util := CoUtil.Create;
  xml  := Util.Icms400(_orig, _CST, _modBC, _pRedBC, _vBC, _pICMS, _vICMS, _modBCST, _pMVAST, _pRedBCST, _vBCST, _pICMSST, _vICMSST, _vBCSTRet,
                       _vICMSSTRet, _vBCSTDest, _vICMSSTDest, _motDesICMS, _pBCOp, _UFST, _pCredSN, _vCredICMSSN, _vICMSDeson, 0, 0, 0, _vBCFCP,
                       _pFCP, _vFCP, _vBCFCPST, _pFCPST, _vFCPST, _vBCFCPSTRet, _pFCPSTRet, _vFCPSTRet, _pST);
  Util := nil;
  Result := xml;
end;

constructor TIcms400.Novo(orig, CST: WideString; modBC: integer; pRedBC,
  vBC, pICMS, vICMS: Real; modBCST: integer; pMVAST, pRedBCST, vBCST,
  pICMSST, vICMSST, vBCSTRet, vICMSSTRet, vBCSTDest, vICMSSTDest: Real;
  motDesICMS: integer; pBCOp: Real; UFST: WideString; pCredSN,
  vCredICMSSN: Real; vICMSDeson : Real;
  vBCFCP, pFCP, vFCP, vBCFCPST, pFCPST, vFCPST, vBCFCPSTRet, pFCPSTRet, vFCPSTRet, pST : Real);
begin
  _orig := orig;
  _CST := CST;
  _modBC := modBC;
  _pRedBC := pRedBC;
  if (CST <> '51') or (vICMS > 0) then
    _vBC := vBC
  else
    _vBC := 0;
  _pICMS    := pICMS;
  _vICMS    := vICMS;
  _modBCST  := modBCST;
  _pMVAST   := pMVAST;
  _pRedBCST := pRedBCST;
  _vBCST    := vBCST;
  _pICMSST  := pICMSST;
  _vICMSST  := vICMSST;
  _UFST        := UFST;
  _pBCOp       := pBCOp;
  _vBCSTRet    := vBCSTRet;
  _vICMSSTRet  := vICMSSTRet;
  _motDesICMS  := motDesICMS;
  _vBCSTDest   := vBCSTDest;
  _vICMSSTDest := vICMSSTDest;
  _pCredSN     := pCredSN;
  _vCredICMSSN := vCredICMSSN;
  _vICMSDeson  := vICMSDeson;
  _vBCFCP   := vBCFCP;
  _pFCP     := pFCP;
  _vFCP     := vFCP;
  _vBCFCPST := vBCFCPST;
  _pFCPST   := pFCPST;
  _vFCPST   := vFCPST;
  _vBCFCPSTRet := vBCFCPSTRet;
  _pFCPSTRet   := pFCPSTRet;
  _vFCPSTRet   := vFCPSTRet;
  _pST         := pST;
end;

{ TIPI }

function TIPI.GetXML: WideString;
var
  Util : NFe_Util_2G_Interface;
  xml : WideString;
begin
  if (_pIPI <= 0) and (_importacao = false) then //evita criar a tag de ipi sem ter ipi  a menos que seja importação
    Result := ''
  else
  begin
    Util := CoUtil.Create;
    xml  := Util.IPI400(_CNPJProd,_cSelo,_qSelo,_cEnq,_CST,_vBC,_pIPI,_vIPI,_qUnid,_vUnid);
    Util := nil;
    Result := xml;
  end;
end;

constructor TIPI.Novo(clEnq, CNPJProd, cSelo: widestring; qSelo: Real;
  cEnq, CST: widestring; vBC, pIPI, vIPI, qUnid, vUnid: Real; importacao : boolean);
begin
  _clEnq := clEnq;
  _CNPJProd := CNPJProd;
  _cSelo := cSelo;
  _qSelo := qSelo;
  _cEnq := cEnq;
  _CST := CST;
  _vBC := vBC;
  _pIPI := pIPI;
  _vIPI := vIPI;
  _qUnid := qUnid;
  _vUnid := vUnid;
  _importacao := importacao;
end;

{ TPIS }

function TPIS.GetXML: WideString;
var
  Util : NFe_Util_2G_Interface;
  xml : WideString;
begin
  Util := CoUtil.Create;
  xml  := Util.PIS(_CST,_vBC,_pPIS,_vPIS,_qBCProd,_vAliqProd);
  Util := nil;
  Result := xml;
end;

constructor TPIS.Novo(CST: widestring; vBC, pPIS, vPIS, qBCProd,
  vAliqProd: Real);
begin
  _CST := CST;
  _vBC := vBC;
  _pPIS := pPIS;
  _vPIS := vPIS;
  _qBCProd := qBCProd;
end;

{ TCOFINS }

function TCOFINS.GetXML: WideString;
var
  Util : NFe_Util_2G_Interface;
  xml : WideString;
begin
  Util := CoUtil.Create;
  xml  := Util.COFINS(_CST,_vBC,_pCOFINS,_vCOFINS,_qBCProd,_vAliqProd);
  Util := nil;
  Result := xml;
end;

constructor TCOFINS.Novo(CST: widestring; vBC, pCOFINS, vCOFINS, qBCProd,
  vAliqProd: Real);
begin
  _CST := CST;
  _vBC := vBC;
  _pCOFINS := pCOFINS;
  _vCOFINS := vCOFINS;
  _qBCProd := qBCProd;
  _vAliqProd := vAliqProd;
end;

{ TImposto2G }

function TImposto2G.GetXML: WideString;
var
  Util : NFe_Util_2G_Interface;
  xml : WideString;
begin
  Util := CoUtil.Create;
  xml  := Util.imposto2GNovo(_vTotTrib, _ICMS.GetXML, _IPI.GetXML, _II.GetXML, _PIS.GetXML, '', _COFINS.GetXML, '', '');
  Util := nil;
  Result := xml;
end;

constructor TImposto2G.Novo(vTotTrib : Real; ICMS: TIcms400; IPI: TIPI; PIS: TPIS;
  COFINS: TCOFINS; II : TII);
begin
  _ICMS := ICMS;
  _IPI := IPI;
  _PIS := PIS;
  _COFINS := COFINS;
  _II := II;
  _vTotTrib := vTotTrib;
end;

{ TMed400 }

function TMed400.GetXML: WideString;
var
  Util : NFe_Util_2G_Interface;
  xml : WideString;
begin
  if _cProdANVISA = '' then
    xml := ''
  else
  begin
    Util := CoUtil.Create;
    xml  := Util.med400(_cProdANVISA, _vPMC);
    Util := nil;
  end;
  Result := xml;
end;

constructor TMed400.Novo(nLote, cProdANVISA: WideString; qLote: Real; dFab,
  dVal: TDateTime; vPMC: Real);
begin
  _nLote := RetirarAcento(nLote);
  _cProdANVISA := cProdANVISA;
  _qLote := qLote;
  _dFab := dFab;
  _dVal := dVal;
  _vPMC := vPMC;
end;

{ TTotalICMS }

function TTotalICMS.GetXML: WideString;
var
  Util : NFe_Util_2G_Interface;
  xml : WideString;
begin
  Util := CoUtil.Create;
  xml  := Util.totalICMS310(_vBC,_vICMS,_vBCST,_vST,_vProd,_vFrete,_vSeg,_vDesc,_vII,_vIPI,_vPIS,_vCOFINS,_vOutro,_vNF,_vTotTrib,_vICMSDeson);
  xml  := Util.total(xml,'','');
  Util := nil;
  Result := xml;
end;

constructor TTotalICMS.Novo(vBC, vICMS, vBCST, vST, vProd, vFrete, vSeg,
  vDesc, vII, vIPI, vPIS, vCOFINS, vOutro, vNF, vTotTrib : Real; vICMSDeson : Real);
begin
  _vBC := vBC;
  _vICMS := vICMS;
  _vBCST := vBCST;
  _vST := vST;
  _vProd := vProd;
  _vFrete := vFrete;
  _vSeg := vSeg;
  _vDesc := StrToFloat(FormatFloat('0.00',vDesc));
  _vII := vII;
  _vIPI := vIPI;
  _vPIS := vPIS;
  _vCOFINS := vCOFINS;
  _vOutro := vOutro;
  _vNF := vNF;
  _vTotTrib := vTotTrib;
  _vICMSDeson := vICMSDeson;
end;

{ TTransporta }

function TTransporta.GetXML: WideString;
var
  Util : NFe_Util_2G_Interface;
  xml : WideString;
begin
  Util := CoUtil.Create;
  xml  := Util.transporta(_CNPJ,_CPF,_xNome,_IE,_xEnder,_xMun,_UF);
  Util := nil;
  Result := xml;
end;

constructor TTransporta.Novo(CNPJ, CPF, xNome, IE, xEnder, xMun,
  UF: widestring);
begin
  _CNPJ := Trim(SoNumeros(CNPJ));
  _CPF := Trim(SoNumeros(CPF));
  _xNome := RetirarAcento(xNome);
  _IE := Trim(SoNumeros(IE));
  _xEnder := xEnder;
  _xMun := RetirarAcento(xMun);
  _UF := UF;
end;

{ TVeicTransp }

function TVeicTransp.GetXML: WideString;
var
  Util : NFe_Util_2G_Interface;
  xml : WideString;
begin
  // *ESSA FUNCIONALIDADE TEM UM ERRO, MESMO O OBJETO VAZIO ELE CRIA A TAG DE VEICTRANSP, ASSIM TENHO QUE FORCAR O RETORNO VAZIO MANUALMENTE
  Util := CoUtil.Create;
  xml  := Util.veicTransp(_placa, _UF, _RNTC);
  Util := nil;
  if _placa <> '' then
    Result := xml
  else
    Result := '';  // <---- SE NAO EXISTIR VEICULO ENTAO FORÇO VAZIO
  // com a versão do XML 4.0 caso eu informe esse grupo dará rejeição por isso estou enviando vazio
//  Result := '';
end;

constructor TVeicTransp.Novo(placa, UF, RNTC: widestring);
begin
  _placa := placa;
  _UF := UF;
  _RNTC := RNTC;
end;

{ TVol }

function TVol.GetXML: WideString;
var
  Util : NFe_Util_2G_Interface;
  xml : WideString;
begin
  // *ESSA FUNCIONALIDADE TEM UM ERRO, MESMO O OBJETO VAZIO ELE CRIA A TAG DE VOL, ASSIM TENHO QUE FORCAR O RETORNO VAZIO MANUALMENTE
  Util := CoUtil.Create;
  xml  := Util.vol(_qVol, _esp, _marca, _nVol, _pesoL, _pesoB, _lacres);
  Util := nil;
  if (_qVol > 0) or (_nVol <> '') then
    Result := xml
  else
    Result := '';  // <---- SE NAO EXISTIR VOL ENTAO FORÇO VAZIO
end;

constructor TVol.Novo(qVol: Real; esp, marca, nVol: widestring; pesoL,
  pesoB: Real; lacres: widestring);
begin
  _qVol := qVol;
  _esp := esp;
  _marca := marca;
  _nVol := nVol;
  _pesoL := pesoL;
  _pesoB := pesoB;
  _lacres := lacres;
end;

{ TTransportador2G }

function TTransportador2G.GetXML: WideString;
var
  Util : NFe_Util_2G_Interface;
  xml : WideString;
begin
  Util := CoUtil.Create;
  xml  := Util.transportador2G(_modFrete,_transporta.GetXML,_retTransp,_veicTransp.GetXML,_reboque,_vagao,_balsa,_vol.GetXML);
  Util := nil;
  Result := xml;
end;

constructor TTransportador2G.Novo(modFrete: widestring;
  transporta: TTransporta; retTransp: widestring; veicTransp: TVeicTransp;
  reboque, vagao, balsa: widestring; vol: TVol);
begin
  _modFrete := modFrete;
  _transporta := transporta;
  _retTransp := retTransp;
  _veicTransp := veicTransp;
  _reboque := reboque;
  _vagao := vagao;
  _balsa := balsa;
  _vol := vol;
end;

{ TDup }

function TDup.GetXML: WideString;
var
  Util : NFe_Util_2G_Interface;
  xml : WideString;
begin
  Util := CoUtil.Create;
  xml  := Util.dup(_nDup,_dVenc,_vDup);
  Util := nil;
  Result := xml;
end;

constructor TDup.Novo(nDup: widestring; dVenc: TDateTime; vDup: Real);
begin
  _nDup  := nDup;
  _dVenc := dVenc;
  _vDup  := vDup;
end;

{ TCobr }

function TCobr.GetXML: WideString;
var
  Util  : NFe_Util_2G_Interface;
  xml   : WideString;
//  x     : integer;
  dup   : TDup;
  duplicatas : WideString;
begin
  try
    duplicatas := '';
    if true then // not Principal.isNFC    // grupo obrigatório somente para NF-e
    begin
      for dup in _dup do
        duplicatas := duplicatas + dup.GetXML;
      Util   := CoUtil.Create;
      xml    := Util.cobr(_nFat,_vOrig,_vDesc,_vLiq, duplicatas);
      Util   := nil;
    end else
      xml := '';
    Result := xml;
  except
    Result := '';
  end;
end;

constructor TCobr.Novo(nFat: widestring; vOrig, vDesc, vLiq: Real;
  dup: ListaDuplicata);
begin
  _nFat  := nFat;
  _vOrig := vOrig;
  _vDesc := vDesc;
  _vLiq  := vLiq;
  _dup   := dup;
end;

{ TInfAdic2G }

function TInfAdic2G.GetXML: WideString;
var
  Util : NFe_Util_2G_Interface;
  xml : WideString;
begin
  Util := CoUtil.Create;
  xml  := Util.infAdic2G(_infAdFisco,_infCpl,_obsCont,_obsFisco,_procRef);
  Util := nil;
  Result := xml;
end;

constructor TInfAdic2G.Novo(infAdFisco, infCpl, obsCont, obsFisco,
  procRef: widestring);
begin
  _infAdFisco := infAdFisco;
  _infCpl := copy(trim(TrimPalavra(RetirarAcento(infCpl))), 1, 5000);
  _obsCont := obsCont;
  _obsFisco := obsFisco;
  _procRef := procRef;
end;

function TInfAdic2G.TrimPalavra(texto: WideString): WideString;
const
  cDouble = '  ';
  cOne = ' ';
begin
 result := StringReplace(texto,cDouble,cOne,[rfReplaceAll]);
end;

{ TNFreferenciada }

function TNFreferenciada.GetXML: WideString;
var
  Util : NFe_Util_2G_Interface;
  xml : WideString;
begin
  Util := CoUtil.Create;
  case _tipo of
    1 : xml := Util.NFeRef(_refNFe); // REFERENCIA NF-e
    2 : xml := Util.NFRef(_cUF,_AAMM,_CNPJ,_mode,_serie,_nNF);  // REFERENCIA A1
    3 : xml := Util.ECFRef(_Cmod,_nECF,_nCOO); // REFERENCIA CUPOM FISCAL
  end;
  Util := nil;
  Result := xml;
end;

constructor TNFreferenciada.Novo(tipo: integer; refNFe: string;
  cUF: integer; AAMM, CNPJ: string; mode, serie, nNF: Integer;
  Cmod: string; nECF, nCOO: integer);
begin
  _tipo   := tipo;
  _refNFe := Trim(refNFe);
  _cUF    := cUF;
  _AAMM   := AAMM;
  _CNPJ   := CNPJ;
  _mode   := mode;
  _serie  := serie;
  _nNF    := nNF;
  _Cmod   := Cmod;
  _nECF   := nECF;
  _nCOO   := nCOO;
end;

{ TComb }

function TComb.GetXML: WideString;
var
  Util : NFe_Util_2G_Interface;
  xml : WideString;
begin
  Util := CoUtil.Create;
  xml  := Util.comb400(_cProdANP, _descANP, _pGLP_Opc, _pGNn_Opc, _pGNi_Opc, _vPart_Opc, _CODIF, _qTemp, _UFCons, _qBCprod, _vAliqProd, _vCIDE, _encerrante_Opc);
  Util := nil;
  Result := xml;
end;

constructor TComb.Novo(cProdANP, descANP, CODIF: widestring; qTemp: real;
  UFCons: widestring; qBCprod, vAliqProd, vCIDE: real);
begin
  _cProdANP  := cProdANP;
  _descANP   := descANP;
  _pGLP_Opc  := 0;
  _pGNn_Opc  := 0;
  _pGNi_Opc  := 0;
  _vPart_Opc := 0;
  _CODIF     := CODIF;
  _qTemp     := qTemp;
  _UFCons    := UFCons;
  _qBCprod   := qBCprod;
  _vAliqProd := vAliqProd;
  _vCIDE     := vCIDE;
  _encerrante_Opc := '';
end;

{ TInfAdProd }

function TInfAdProd.GetXML: WideString;
var
  Util : NFe_Util_2G_Interface;
  xml  : WideString;
begin
  Util   := CoUtil.Create;
  xml    := Util.infAdProd(_infAdProd);
  Util   := nil;
  Result := xml;
end;

constructor TInfAdProd.Novo(infAdProd: wideString);
begin
  _infAdProd := RetirarAcento(infAdProd);
end;

{ TDI }

function TDI.GetXML: widestring;
var
  Util : NFe_Util_2G_Interface;
  xml  : WideString;
begin
  Util := CoUtil.Create;
  xml := Util.DI310(_nDI, _dDI, _xLocDesemb, _UFDesmb, _dDesemb, _tpViaTransp, _vAFRMM_Opc, _tpIntermedio,
                    _CNPJ_Opc, _UFTerceiro_Opc, _cExportador, _adi.GetXML);
  Util := nil;
  Result := xml;
end;

constructor TDI.Novo(nDI, dDI, xLocDesemb, UFDesmb, dDesemb: widestring;
  tpViaTransp: integer; vAFRMM_Opc: Real; tpIntermedio: integer; CNPJ_Opc,
  UFTerceiro_Opc, cExportador: widestring; adi: Tadi); // EMISSORNFE
begin
  _nDI := nDI;
  _dDI := dDI;
  _xLocDesemb := xLocDesemb;
  _UFDesmb := UFDesmb;
  _dDesemb := dDesemb;
  _tpViaTransp := tpViaTransp;
  _vAFRMM_Opc := vAFRMM_Opc;
  _tpIntermedio := tpIntermedio;
  _CNPJ_Opc := CNPJ_Opc;
  _UFTerceiro_Opc := UFTerceiro_Opc;
  _cExportador := cExportador;
  _adi := adi;
end;

{ Tadi }

function Tadi.GetXML: WideString;
var
  Util : NFe_Util_2G_Interface;
  xml : WideString;
begin
  Util := CoUtil.Create;
  xml  := Util.adi(_nAdicao,_nSeqAdic,_cFabricante,_vDescDI);
  Util := nil;
  Result := xml;
end;

constructor Tadi.Novo(nAdicao, nSeqAdic: Integer; cFabricante: WideString;
  vDescDI: Real);
begin
  _nAdicao := nAdicao;
  _nSeqAdic := nSeqAdic;
  _cFabricante := cFabricante;
  _vDescDI := vDescDI;
end;

{ TII }

function TII.GetXML: WideString;
var
  Util : NFe_Util_2G_Interface;
  xml : WideString;
begin
  if (_vBC >= 0) and _isNFe then
  begin
    Util := CoUtil.Create;
    xml  := Util.II(_vBC,_vDespAdu,_vII,_vIOF);
    Util := nil;
    Result := xml;
  end else
  begin
    Result := '';
  end;
end;

constructor TII.Novo(vBC, vDespAdu, vII, vIOF: real; isNFe : Boolean);
begin
  _vBC      := vBC;
  _vDespAdu := vDespAdu;
  _vII      := vII;
  _vIOF     := vIOF;
  _isNFe    := isNFe;
end;

{ TdetExport }

function TdetExport.GetXML: WideString;
var
  Util : NFe_Util_2G_Interface;
  xml : WideString;
begin
  Util   := CoUtil.Create;
  xml    := Util.detExport(_nDraw_Opc, _nre, _chNFe, _qExport);
  Util   := nil;
  Result := xml;
end;

constructor TdetExport.Novo(nDraw_Opc, nre, chNFe, qExport: WideString);
begin
  _nDraw_Opc := nDraw_Opc;
  _nre       := nre;
  _chNFe     := chNFe;
  _qExport   := qExport;
end;

{ TFundoCombPobreza }

function TFundoCombPobreza.GetXML: WideString;
var
  Util : NFe_Util_2G_Interface;
  xml : WideString;
begin
  if (_vBCUFDest > 0.0) then //and (StrToDate(vData_Banco) > StrToDate('31/12/2015'))
  begin
    Util := CoUtil.Create;
    xml  := Util.ICMSUFDest400(_vBCUFDest, _vBCFCPUFDest, _pFCPUFDest, _pICMSUFDest, _pICMSInter,
     _pICMSInterPart, _vFCPUFDest, _vICMSUFDest, _vICMSUFRemet);
    Util   := nil;
    Result := xml;
  end else
    Result := '';
end;

constructor TFundoCombPobreza.Novo(vBCUFDest, vBCFCPUFDest, pFCPUFDest, pICMSUFDest,
  pICMSInter, pICMSInterPart, vFCPUFDest, vICMSUFDest, vICMSUFRemet: Real);
begin
  _vBCUFDest      := vBCUFDest;
  _vBCFCPUFDest   := vBCFCPUFDest;
  _pFCPUFDest     := pFCPUFDest;
  _pICMSUFDest    := pICMSUFDest;
  _pICMSInter     := pICMSInter;
  _pICMSInterPart := pICMSInterPart;
  _vFCPUFDest     := vFCPUFDest;
  _vICMSUFDest    := vICMSUFDest;
  _vICMSUFRemet   := vICMSUFRemet;
end;

{ TimpostoNT2015003 }

function TimpostoNT2015003.GetXML: WideString;
var
  Util : NFe_Util_2G_Interface;
  xml : WideString;
begin
  Util := CoUtil.Create;
  { DONE -oHerbertH -c : colocar no emissor granja 23/12/2015 11:37:06 }
  xml  := Util.impostoNT2015003(_vTotTrib, _ICMS.GetXML, _IPI.GetXML, _II.GetXML, _PIS.GetXML, '', _COFINS.GetXML, '', '', _FCP.GetXML);
  Util := nil;
  Result := xml;
end;
  { DONE -oHerbertH -c : colocar no emissor granja 23/12/2015 11:37:06 }
constructor TimpostoNT2015003.Novo(vTotTrib: Real; ICMS: TIcms400; IPI: TIPI;
  PIS: TPIS; COFINS: TCOFINS; II: TII; FCP: TFundoCombPobreza);
begin
  _ICMS := ICMS;
  _IPI := IPI;
  _PIS := PIS;
  _COFINS := COFINS;
  _II := II;
  _FCP := FCP;
  _vTotTrib := vTotTrib;
end;

{ TtotalICMS400 }

function TtotalICMS400.GetXML: WideString;
var
  Util : NFe_Util_2G_Interface;
  xml : WideString;
begin
  Util := CoUtil.Create;
  xml  := Util.totalICMS400(_vBC,_vICMS,_vBCST,_vST,_vProd,_vFrete,_vSeg,_vDesc,_vII,_vIPI,_vPIS,_vCOFINS,_vOutro,_vNF,_vTotTrib,_vICMSDeson, _vICMSUFDest_Opc,
                            _vICMSUFRemet_Opc, _vFCPUFDest_Opc, _vFCP, _vFCPST, _vFCPSTRet, _vIPIDevol);
  xml  := Util.total(xml,'','');
  Util := nil;
  Result := xml;
end;

constructor TtotalICMS400.Novo(vBC, vICMS, vBCST, vST, vProd, vFrete,
  vSeg, vDesc, vII, vIPI, vPIS, vCOFINS, vOutro, vNF, vTotTrib, vICMSDeson,
  vICMSUFDest_Opc, vICMSUFRemet_Opc, vFCPUFDest_Opc, vFCP, vFCPST, vFCPSTRet, vIPIDevol: Real);
begin
  _vBC := vBC;
  _vICMS := vICMS;
  _vBCST := vBCST;
  _vST := vST;
  _vProd := vProd;
  _vFrete := vFrete;
  _vSeg := vSeg;
  _vDesc := StrToFloat(FormatFloat('0.00',vDesc));
  _vII := vII;
  _vIPI := vIPI;
  _vPIS := vPIS;
  _vCOFINS := vCOFINS;
  _vOutro := vOutro;
  _vNF := vNF;
  _vTotTrib := vTotTrib;
  _vICMSDeson := vICMSDeson;
  _vICMSUFDest_Opc := vICMSUFDest_Opc;
  _vICMSUFRemet_Opc := vICMSUFRemet_Opc;
  _vFCPUFDest_Opc := vFCPUFDest_Opc;
  _vFCP := _vFCP;
  _vFCPST := vFCPST;
  _vFCPSTRet := vFCPSTRet;
  _vIPIDevol := vIPIDevol;

end;

{ TautXML }

function TautXML.getXml: WideString;
var
  Util : NFe_Util_2G_Interface;
  xml : WideString;
begin
  Util := CoUtil.Create;
  xml  := Util.autXML(_cnpj, _cpf);
  Util := nil;
  Result := xml;
end;

constructor TautXML.Novo(cnpj, cpf: WideString);
begin
  Self._cnpj := cnpj;
  Self._cpf := cpf;
end;

{ TdetPag }

function TdetPag.getXML: WideString;
var
  Util : NFe_Util_2G_Interface;
  xml : WideString;
begin
  Util := CoUtil.Create;
  xml := Util.detPag('', _tPag, _vPag, _CNPJ_Opc, _tBand_Opc, _cAut_Opc, _tpIntegra_Opc); //_indPag_Opc ainda não é aceito
  Util := nil;
  Result := xml;
end;

constructor TdetPag.Novo(indPag_Opc, tPag: string; vpag: Currency;
  CNPJ_Opc: string; tBand_Opc : string; cAut_Opc : string; tpIntegra_Opc : string);
begin
  _indPag_Opc := indPag_Opc;
  _tPag := tPag;
  _vPag := vpag;
  _CNPJ_Opc  := CNPJ_Opc;
  _tBand_Opc := tBand_Opc;
  _cAut_Opc  := cAut_Opc;
  _tpIntegra_Opc := tpIntegra_Opc;
end;

{ TRastro }

function TRastro.getXML: WideString;
var
  util : NFe_Util_2G_Interface;
  xml  : WideString;
begin
  util := CoUtil.Create;
  try
    xml := util.rastro(_nLote,  _qLote, _dFab, _dVal, _cAgreg_Opc);
  except on e : Exception do
      ShowMessage(e.Message);
  end;
  util := nil;
  Result := xml;
end;

constructor TRastro.novo(nLote: WideString; qLote: Real; dFab, dVal : TDateTime;
  cAgreg_Opc: WideString);
begin
  _nLote := nLote;
  _qLote := qLote;
  _dFab  := dFab;
  _dVal  := dVal;
  _cAgreg_Opc := cAgreg_Opc;
end;

{ Tpagamento400 }

function Tpagamento400.getXML: WideString;
var
  util : NFe_Util_2G_Interface;
  xml  : WideString;
begin
  util := CoUtil.Create;
  xml := util.pagamento400(_detPag, _vTroco_Opc);
  util := nil;
  Result := xml;
end;

constructor Tpagamento400.novo(detPag: WideString; vTroco_Opc: Currency);
begin
  _detPag := detPag;
  _vTroco_Opc := vTroco_Opc;
end;

end.
