unit NotaEletronica;

interface

uses NFe_Util_2G_TLB, System.Generics.Collections, Dialogs;

/////////////////////////////////// OS VALORES ENTRE PARENTESES INDICA A OBRIGATORIEDADE DO CAMPO //////////////////////////////////////

type

  TdetPag = class

    public
      _indPag_Opc : string; { informar o indicador da forma de pagamento:
                              0 - pagamento � vista;
                              1 - pagamento � prazo.(campo novo) }
      _tPag : string;       { informar a Forma de pagamento:
                              01=Dinheiro
                              02=Cheque
                              03=Cart�o de Cr�dito
                              04=Cart�o de D�bito
                              05=Cr�dito Loja
                              10=Vale Alimenta��o
                              11=Vale Refei��o
                              12=Vale Presente
                              13=Vale Combust�vel
                              99=Outros.}
      _vPag : Currency;    // Informar o valor do Pagamento
      _tpIntegra_Opc : string;
                            { 1=Pagamento integrado com o sistema de automa��o da empresa (Ex.: equipamento TEF, Com�rcio Eletr�nico);
                              2= Pagamento n�o integrado com o sistema de automa��o da empresa (Ex.: equipamento POS); }
      _CNPJ_Opc : string; //Informar o CNPJ da Credenciadora de cart�o de cr�dito / d�bito.
                          // Obs:Os par�metros CNPJ_Opc, tBand_Opc e cAut_Opc devem ser informados em conjunto ou omitidos em conjutos, n�o � permitido informar um ou outros. Assim informe todos os 3 campos ou n�o informe nenhum deles.
      _tBand_Opc : string;
                            { 01=Visa
                              02=Mastercard
                              03=American Express
                              04=Sorocred
                              99=Outros. }
     _cAut_Opc : string; // Identifica o n�mero da autoriza��o da transa��o da opera��o com cart�o de cr�dito e/ou d�bito.


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
    _cUF : integer;	// 2	sim	informar o c�digo da UF de localiza��o do emissor da NF no padr�o do IBGE
    _AAMM : string;	// 4	sim	informar o ano e m�s de emisss�o da NF referenciada no padr�o AAMM
    _CNPJ : string;	// 14  sim informar o CNPJ do emissor da NF
    _mode :integer;	// 1 	sim	informar o modelo da NF referenciada, deve ser sempre 1.
    _serie : integer;	// 1-3	sim	informar o n�mero da s�rie da NF referenciada, informar zero se for s�rie �nica
    _nNF: integer;	// 1-6	sim	informar o n�mero da NF referenciada
    _Cmod : string; // 2	sim	Informar o c�digo do modelo do Documento Fiscal, Preencher com:
    {"2B", quando se tratar de Cupom Fiscal emitido por m�quina registradora (n�o ECF),
   "2C", quando se tratar de Cupom Fiscal PDV;
   "2D", quando se tratar de Cupom Fiscal (emitido por ECF)  }
    _nECF : integer; //	1-3	sim	Informar o n�mero de ordem seq�encial do ECF que emitiu o Cupom Fiscal vinculado � NF-e
    _nCOO :integer; //	1-6	sim	Informar o N�mero do Contador de Ordem de Opera��o - COO vinculado � NF-e

  public

    constructor Novo(tipo : integer; refNFe : string; cUF : integer;AAMM : string; CNPJ : string; mode :integer; serie : integer;
            nNF : Integer; Cmod : string; nECF : integer; nCOO :integer);
    function GetXML : WideString;

  end;

  type

  ListaReferencia = TList<TNFreferenciada>;

  TIdentificador400 = class

  public
    _cUF	: integer; //	-	(sim)	informar o c�digo da UF do emitente do Documento Fiscal, utilizar a codifica��o do IBGE (Ex. SP->35, RS->43, etc.)
    _cNF	: integer; // -	(sim)	informar o c�digo num�rico que comp�e a Chave de Acesso. N�mero aleat�rio gerado pelo emitente para cada NF-e para evitar acessos indevidos da NF-e. (tamanho do campo reduzido para 8 d�gitos)
    _natOpe : widestring; //	1-60	(sim)	informar a natureza da opera��o de que decorrer a sa�da ou a entrada, tais como: venda, compra, transfer�ncia, devolu��o, importa��o, consigna��o, remessa (para fins de demonstra��o, de industrializa��o outra), conforme previsto na al�nea 'i', inciso I, art. 19 do CONV�NIO S/N�, de 15 de dezembro de 1970.
{    _indPag : Integer; //	n�o existe mais
    0 - pagamento � vista;
    1 - pagamento � prazo;
    2 - outros.}
    _mode  : integer; //	-	(sim)	informar o c�digo do Modelo do Documento Fiscal, c�digo 55 para a NF-e.
    _serie :	integer; //	-	(sim)	informar a s�rie do Documento Fiscal, informar 0 (zero) para s�rie �nica. A emiss�o normal pode utilizar s�rie de 0-889, a emiss�o em conting�ncia SCAN deve utilizar s�rie 900-999.
    _nNF	 : integer; //	-	(sim)	informar o N�mero do Documento Fiscal.
    _dEmi  : WideString; //	-	(sim)	informar a data de emiss�o do Documento Fiscal.
    _dSaiEnt : WideString; //	-	(n�o)	informar a data de sa�da ou entrada da mercadoria ou do produto, pode ser omitido informando: Delphi: 0 (zero)
    _tpNF	 : integer; //	-	(sim)	informar o c�digo do tipo do Documento Fiscal: 0 - entrada ou 1 - sa�da
    _idDest : integer;  {informar o identificador de local de destino da opera��o:
    1 - Opera��o interna;
    2 - Opera��o interestadual;
    3 - Opera��o com exterior.}
    _cMunFG : widestring; //	7	(sim)	informar o c�digo do Munic�pio de Ocorr�ncia do Fato Gerador do ICMS, que � o local onde ocorre a entrada ou sa�da da mercacoria, utilizar a Tabela do IBGE
    _NFRef	: ListaReferencia; //	-	(n�o)	informar o grupo de informa��es NFRef dos documentos fiscais referenciados, Utilizar para referenciar um Documento Fiscal vinculado a NF-e atual. Esta informa��o ser� utilizada nas hip�teses previstas na legisla��o. (Ex.: Devolu��o de Mercadorias, Substitui��o de NF cancelada, Complementa��o de NF, etc.). Necess�rio montar o grupo XML do documento correspondente. (novas op��es de documento referenciado: CT-e, Cupom Fiscal e Nota Fiscal de Produtor)
    _tpImp	: integer; //	-	(sim)	informar o formato de impress�o do DANFE: 1-retrato ou 2-paisagem.
    _tpEmis : Integer; //	-	(sim)	informar o c�digo da forma de emiss�o:
    {1 - Normal - emiss�o normal;
    2 - Conting�ncia FS - emiss�o em conting�ncia com impress�o do DANFE em Formul�rio de Seguran�a;
    4 - Conting�ncia DPEC - emiss�o em conting�ncia com envio da Declara��o Pr�via de Emiss�o em Conting�ncia - DPEC;
    5 - Conting�ncia FS-DA - emiss�o em conting�ncia com impress�o do DANFE em Formul�rio de Seguran�a para Impress�o de Documento Auxiliar de Documento Fiscal Eletr�nico (FS-DA).}
    _cDV      :	integer; //	-	(sim)	informar o c�digo do d�gito verificador - DV da Chave de Acesso da NF-e, o DV ser� calculado com a aplica��o do algoritmo m�dulo 11 (base 2,9) da Chave de Acesso.
    _tpAmb    :	integer; //	-	(sim)	informar o c�digo de identifica��o do Ambiente: 1-Produ��o ou 2-Homologa��o
    _finNFe   : integer; // -	(sim)	infformar o c�digo da finalidade de emiss�o da NF-e: 1- NF-e normal; 2-NF-e complementar; 3 - NF-e de ajuste.
    _indFinal : integer; {nformar o indicador de opera��o com Consumidor final:
    0 - N�o;
    1 - Consumidor final;}
    _indPres  : integer; {Informar o indicador de presen�a do comprador no estabelecimento comercial no momento da opera��o:
    0 - N�o se aplica (por exemplo, Nota Fiscal complementar ou de ajuste);
    1 - Opera��o presencial;
    2 - Opera��o n�o presencial, pela Internet;
    3 - Opera��o n�o presencial, Teleatendimento;
    4 - NFC-e em opera��o com entrega a domic�lio;
    9 - Opera��o n�o presencial, outros.}
    _procEmi :	integer; //	-	(sim)	informar o c�digo de identifica��o do processo de emiss�o da NF-e: Identificador do processo de emiss�o da NF-e:
    {0 - emiss�o de NF-e com aplicativo do contribuinte;
    1 - emiss�o de NF-e avulsa pelo Fisco;
    2 - emiss�o de NF-e avulsa, pelo contribuinte com seu certificado digital, atrav�s do site do Fisco;
    3- emiss�o NF-e pelo contribuinte com aplicativo fornecido pelo Fisco.}
    _verProc :	WideString; //	1-20	(sim)	informar a vers�o do processo de emiss�o da NF-e utilizada (aplicativo emissor de NF-e).
    //Deve ser informado com um conte�do v�lido sempre que tpEmis for diferente de 1, para omitir o conte�do, quando tpEmis=1, informe:Delphi: 0 (zero)
    _dhCont  : widestring; //	-	(n�o)	informar a data e hora de entrada em conting�ncia no formato AAAA-MM-DDTHH:MM:SS (campo novo)
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

    _CNPJ : Widestring; //	14	(sim)	informar o CNPJ do emitente, sem formata��o ou m�scara
    _CPF : widestring; //	11	(sim)	informar o CPF do emitente, sem formata��o ou m�scara, utilizado apenas quando o fisco emite a nota fiscal
    _xNome : widestring; //	2-60	(sim)	informar a raz�o social do emitente
    _xFant : widestring; //	1-60	(n�o)	informar o nome fantasia do emitente, pode ser omitido
    _xLgr : widestring; //	2-60	(sim)	informar o logradouro do emitente
    _nro : widestring; //	1-60	(sim)	informar o n�mero do endere�o do emitente, campo obrigat�rio. Informar S/N ou . (ponto) ou - (tra�o) para evitar falha de schema XML quando n�o houver n�mero.
    _xCpl : widestring; //	1-60	(n�o)	informar o complemento do endere�o do emitente, pode ser omitido
    _xBairro : widestring; //	2-60	(sim)	informar o bairro do endere�o do emitente
    _cMun : widestring; //	7	(sim)	informar o c�digo do munic�pio na codifica��o do IBGE com 7 d�gitos
    _xMun : widestring; //	2-60	(sim)	informar o nome do munic�pio
    _UF : widestring; //	2	(sim)	informar a sigla da UF
    _CEP : widestring; //	8	(sim)	informar o CEP, passou a ser de informa��o obrigat�ria a partir da NT 2011/004.
    _cPais : widestring; //	4	(n�o)	informar o c�digo do pais na codifica��o do BACEN, se informado deve ser 1058
    _xPais : widestring; //	6	(n�o)	informar o nome do pa�s, se informado deve ser Brasil ou BRASIL
    _fone : widestring; //	6-14	(n�o)	informar o telefone com DDD + n�mero, sem formata��o (campo com tamanho aumentado)
    _IE : widestring; //	2-14	(sim)	informar a IE do emitente, sem formata��o ou m�scara
    _IEST : widestring; //	2-14	(n�o)	informar a IE ST, sem formata��o ou m�scara, quando praticar alguma opera��o como substituto tribut�rio
    _IM : widestring; //	1-15	(n�o)	informar a Inscri��o Municipal, sem formata��o ou m�scara, quando emitir NF conjugada (presta��o de servi�o com fornecimento de pe�as)
    _CNAE : widestring; //	7	(n�o)	informar o CNAE Fiscal, este campo deve ser informado em conjunto com o campo IM e vice-versa, a informa��o de um e omiss�o do outro resulta em falha de Schema XML
    _CRT : widestring;
  public
    constructor Novo(CNPJ : widestring;CPF : widestring;xNome : widestring;xFant : widestring;xLgr : widestring;nro : widestring;xCpl : widestring;
       xBairro : widestring;cMun : widestring;xMun : widestring;UF : widestring;CEP : widestring;cPais : widestring;xPais : widestring;fone : widestring;
       IE : widestring;IEST : widestring;IM : widestring;CNAE : widestring;CRT : widestring);
    function GetXML : WideString;
  end;

  TDestinatario2G = class

    public
    _CNPJ : widestring; //	14	(sim)	informar o CNPJ do destinat�rio, sem formata��o ou m�scara
    _CPF : widestring; //	11	(sim)	CPF do destinat�rio, sem formata��o ou m�scara
    _idEstrangeiro : widestring; //No caso de opera��o com o exterior, ou para comprador estrangeiro informar a tag "idEstrangeiro", com o n�mero do passaporte ou outro documento legal para identificar pessoa estrangeira. Nota: Campo aceita valor Nulo.
    _xLgr : widestring; //	2-60	(sim)	informar o logradouro do destinat�rio
    _nro : widestring; //	1-60	(sim)	informar o n�mero do endere�o do destinat�rio, campo obrigat�rio. Informar S/N ou . (ponto) ou - (tra�o) para evitar falha de schema XML quando n�o houver n�mero.
    _xCpl : widestring; //	1-60	(n�o)	informar o complemento do endere�o do destinat�rio, pode ser omitido
    _xBairro : widestring; //	2-60	(sim)	informar o bairro do endere�o do destinat�rio
    _cMun : widestring; //	7	(sim)	informar o c�digo do munic�pio na codifica��o do IBGE com 7 d�gitos
    _xMun : widestring; //	2-60	(sim)	informar o nome do munic�pio

    _CEP : widestring; //	8	(n�o)	informar o CEP, sem formata��o ou m�scara, pode ser omitido
    _cPais : widestring; //	4	(n�o)	informar o c�digo do pais na codifica��o do BCB, se informado deve ser 1058
    _xPais : widestring; //	6	(n�o)	informar o nome do pa�s, se informado deve ser Brasil ou BRASIL
    _fone : widestring; //	6-14	(n�o)	informar o telefone com DDD + n�mero, sem formata��o (tamanho do campo aumentado)
    _indIEDest : widestring; {Indicador da IE do Destinat�rio, informar:
                              1 - Contribuinte ICMS (informar a IE do destinat�rio);
                              2 - Contribuinte isento de Inscri��o no cadastro de Contribuintes do ICMS;
                              9 - N�o Contribuinte, que pode ou n�o possuir Inscri��o Estadual no Cadastro de Contribuintes do ICMS.
                              Nota 1: No caso de NFC-e informar indIEDest=9 e n�o informar a tag IE do destinat�rio;
                              Nota 2: No caso de opera��o com o Exterior informar indIEDest=9 e n�o informar a tag IE do destinat�rio;
                              Nota 3: No caso de Contribuinte Isento de Inscri��o (indIEDest=2), n�o informar a tag IE do destinat�rio.}

    _ISUF : widestring; //	8-9	(n�o)	informar a Inscri��o SUFRAMA do destinat�rio, sem formata��o ou m�scara, se existir.
    _IM : widestring; //Inscri��o Municipal do Tomador do Servi�o, campo opcional, pode ser informado na NF-e conjugada, com itens de produtos sujeitos ao ICMS e itens de servi�os sujeitos ao ISSQN
    _CODIGO : string;  // (n�o) codigo do destinat�rio
    _xNome : widestring; //	2-60	(sim)	informar a raz�o social do destinat�rio
    _UF : widestring; //	2	(sim)	informar a sigla da UF
    _IE : widestring; //	0-14	(sim)	informar a IE do destinat�rio, sem formata��o ou m�scara
    _observacao : string; // (n�o) armazena algum tipo de observa��o do cliente caso seja necess�rio ser impresso na NFC
//    _tipoAliquotaICMS : Integer;  // 1-> aliquota do cadastro do produto, 2 -> aliquota de revenda do estado do destinatario, 3-> aliquota de revenda do estado do emitente
    _tipoDestinatario : string;  // 1-> 'PJComIE', 2-> 'PJSemIE', 3-> 'PFComIE' (Produtor Rural), 4-> 'PFSemIE'
    _tipoCliente : string;  // N�o faz parte da nfe, guarda o tipo do cliente
    _eMail : widestring;
    _codigoVendedor : string; // N�o faz parte da nfe, guarda o codigo do vendedor
    _comprarAPrazo : Boolean;
    // campos da tag det
    _indFinal : Integer; // informar o indicador de opera��o com Consumidor final: 0 - N�o; 1 - Consumidor final;
    _idDest : Integer;   // informar o identificador de local de destino da opera��o: 1 - Opera��o interna; 2 - Opera��o interestadual; 3 - Opera��o com exterior.

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

    _nAdicao : Integer; // 1-3	sim	informar o n�mero da adi��o
    _nSeqAdic : Integer; // 1-3	sim	informar o n�mero sequencial do item dentro da adi��o
    _cFabricante : widestring; // 1-60	sim	informar o c�digo do fabricante estrangeiro usado nos sistemas internos de informa��o do emitente da NF-e
    _vDescDI : Real; // 15,2	n�o	informar o valor do desconto do item da DI - adi��o

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

    _nDI : widestring; // 1-10	sim	informar o n�mero da DI, DSI, DA, etc.
    _dDI : widestring; // -	sim	informar a data da Registro da DI no formato AAAA-MM-DD
    _xLocDesemb : widestring; // 1-60	sim	informar o local de ocorr�ncia do desembara�o aduaneiro
    _UFDesmb : widestring; // 2	sim	informar a sigla da UF onde ocorreu o desembara�o aduaneiro
    _dDesemb : widestring; // -	sim	informar a data de ocorr�ncia do desembara�o aduaneiro no formato AAAA-MM-DD
    _tpViaTransp : integer;  //informar a Via de transporte internacional informada na Declara��o de Importa��o (DI) EMISSORNFE
    _vAFRMM_Opc : Real; //informar o valor da AFRMM - Adicional ao Frete para Renova��o da Marinha Mercante no caso da via de transporte mar�tima EMISSORNFE
    _tpIntermedio : integer; //informar Forma de importa��o quanto a intermedia��o EMISSORNFE
    _CNPJ_Opc : widestring; //informar obrigatoriamente o CNPJ do adquirente ou do encomendante no caso de importa��o por conta e ordem ou por encomenda EMISSORNFE
    _UFTerceiro_Opc : WideString; //informar obrigatoriamente a Sigla da UF do CNPJ do adquirente ou do encomendante no caso de importa��o por conta e ordem ou por encomenda EMISSORNFE
    _cExportador : widestring; // 1-60	sim	informar o c�digo do exportador, usado nos sistemas internos de informa��o do emitente da NF-e
    _adi : Tadi; // -	sim	informar os fragmentos XML das adi��es geradas atrav�s da adi��es da DI

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

    _cProd : widestring; //	1-60	(sim)	informar o c�digo do produto ou servi�o. Preencher com CFOP, caso se trate de itens n�o relacionados com mercadorias/produtos e que o contribuinte n�o possua codifica��o pr�pria. Formato �CFOP9999�.
    _cEAN	: widestring; //	0,8,12,13,14	(sim)	informar o GTIN (Global Trade Item Number) do produto, antigo c�digo EAN ou c�digo de barras. Preencher com o c�digo GTIN-8, GTIN-12, GTIN-13 ou GTIN-14 (antigos c�digos EAN, UPC e DUN-14), n�o informar o conte�do da TAG em caso de o produto n�o possuir este c�digo.
    _xProd : widestring; //	1-120	(sim)	informar a descri��o do produto ou servi�o.
    _NCM : widestring; //	2,8	(sim)	informar o C�digo NCM com 8 d�gitos; informar a posi��o do cap�tulo do NCM (as duas primeiras posi��es do NCM) quando a opera��o n�o for de com�rcio exterior (importa��o/ exporta��o) ou o produto n�o seja tributado pelo IPI; se for servi�os, informar 00. (campo alterado para ser obrigat�rio)
    _NVE_Opc : widestring; // (n�o) informar com a Codifica��o NVE - Nomenclatura de Valor Aduaneiro e Estat�stica, Codifica��o opcional que detalha alguns NCM
    _CEST_opc : widestring; // (n�o) informar C�digo Especificador da Substitui��o Tribut�ria - CEST, que estabelece a sistem�tica de uniformiza��o e identifica��o das mercadorias e bens pass�veis de sujei��o aos regimes de substitui��o tribut�ria e de antecipa��o de recolhimento do ICMS.
    _indEscala_Opc : WideString; // (n�o) informar o Indicador de Escala Relevante. Indicador de Produ��o em escala relevante, conforme Cl�usula 23 do Convenio ICMS 52/2017: S - Produzido em Escala Relevante; N � Produzido em Escala N�O Relevante.
    _CNPJFab_Opc : WideString; // (n�o) informar o CNPJ do Fabricante da Mercadoria, obrigat�rio para produto em escala N�O relevante.
    _cBenef_Opc : WideString; // (nao) informar o C�digo de Benef�cio Fiscal utilizado pela UF, aplicado ao item. Obs.: Deve ser utilizado o mesmo c�digo adotado na EFD e outras declara��es, nas UF que o exigem.
    _EXTIPI : widestring; //	2,3	(n�o)	informar de acordo com o c�digo EX da TIPI se houver para o NCM do produto.
    _CFOP : Integer;	// 4	(sim)	informar o CFOP - C�digo Fiscal de Opera��es e Presta��es.
    _uCOM : widestring;	// 1-6	(sim)	informar a unidade de comercializa��o do produto (Ex. pc, und, dz, kg, etc.).
    _qCOM : widestring;	// 15,4	(sim)	informar a quantidade de comercializa��o do produto j� formatado com ponto decimal. A quantidade de casas decimais pode variar de 0 a 4. (tamanho e tipo do campo alterado)
    _vUnCOM : widestring;	// 21,10	(sim)	Informar o valor unit�rio de comercializa��o do produto j� formatado com ponto decimal, campo meramente informativo, o contribuinte pode utilizar a precis�o desejada (0-10 decimais). Para efeitos de c�lculo, o valor unit�rio ser� obtido pela divis�o do valor do produto pela quantidade comercial. (tamanho e tipo do campo alterado)
    _vProd : Real;	// 15,2	(sim)	informar o valor total bruto do produto ou servi�os.
    _cEANTrib : widestring; //	0,8,12,13,14	(sim)	informar o GTIN (Global Trade Item Number) da unidade de tributa��o do produto, antigo c�digo EAN ou c�digo de barras. Preencher com o c�digo GTIN-8, GTIN-12, GTIN-13 ou GTIN-14 (antigos c�digos EAN, UPC e DUN-14), n�o informar o conte�do da TAG em caso de o produto n�o possuir este c�digo.
    _uTrib : widestring; //	1-6	(sim)	informar a unidade de tributa��o do produto (Ex. pc, und, dz, kg, etc.).
    _qTrib : widestring; //	15,4	(sim)	informar a quantidade de tributa��o do produto j� formatado com ponto decimal. A quantidade de casas decimais pode variar de 0 a 4. (tamanho e tipo do campo alterado)
    _vUnTrib : widestring; //	21,10	(sim)	Informar o valor unit�rio de tributa��o do produto j� formatado com ponto decimal, campo meramente informativo, o contribuinte pode utilizar a precis�o desejada (0-10 decimais). Para efeitos de c�lculo, o valor unit�rio ser� obtido pela divis�o do valor do produto pela quantidade tribut�vel. (tamanho e tipo do campo alterado)
    _vFrete : Real;	// 15,2	(n�o)	informar o valor do Frete, o Frete deve ser rateado entre os itens de produto.
    _vSeg : Real;	// 15,2	(n�o)	informar o valor do Seguro, o Seguro deve ser rateado entre os itens de produto.
    _vDesc : Real;	// 15,2	(n�o)	informar o valor do desconto do item de produto ou servi�o.
    _vOutro : Real;	// 15,2	(n�o)	informar o valor de outras despesas acess�rias do item de produto ou servi�o. (campo novo)
    _indTot : Integer;	// -	(sim)	Este campo dever� ser preenchido com: 0 - o valor do item (vProd) n�o comp�e o valor total da NF-e (vProd) 1 - o valor do item (vProd) comp�e o valor total da NF-e. (campo novo)
    _DI : widestring;	// -	(n�o)	informar o XML do grupo DI - dados da importa��o nas opera��es de importa��o.
    _detExport_Opc : WideString; // (n�o) informar com as informa��es do detalhamento da exporta��o
    _DetEspecifico : widestring; //	-	(n�o)	informar o XML do grupo veicProd - detalhamento de espec�fico de ve�culos novos ou com o XML do grupo med - detalhamento de espec�fico de medicamentos ou com o XML do grupo arma - detalhamento de espec�fico de armamentos ou com o XML do grupo comb - detalhamento de espec�fico de combust�veis e lubrificantes.
    _xPed : widestring; //	1-15	(n�o)	informar o n�mero do pedido de compra, o campo � de livre uso do emissor. (campo novo)
    _nItemPed : WideString;    // informar o n�mero do item do pedido de compra, o campo � de livre uso do emissor.
    _nFCI_Opc : WideString; // informar o N�mero de controle da FCI - Ficha de Conte�do de Importa��o com formata��o, ex.: B01F70AF-10BF-4B1F-848C-65FF57F616FE
    _rastro_Opc : WideString; // (n�o) informar o grupo de Detalhamento de produto sujeito a rastreabilidade.

  public
    constructor Novo(cProd : wideString;cEAN : wideString;xProd : wideString; NCM, NVE_Opc, CEST_Opc : wideString; indEscala_Opc : WideString; CNPJFab_Opc : WideString; cBenef_Opc : WideString;
       EXTIPI : wideString; CFOP : integer; uCom : wideString;qCom : widestring;vUnCom : widestring;vProd : Real;cEANTrib : wideString;uTrib : wideString;qTrib : widestring;vUnTrib : widestring;
       vFrete : Real;vSeg : Real;vDesc : Real;vOutro : Real;indTot : Integer;DI, detExport_Opc, DetEspecifico, xPed : wideString;
       nItemPed : WideString; nFCI_Opc : WideString; rastro_Opc : WideString);
    function GetXML : WideString;
  end;

  TVeicProd2G = class
  private
    _tpOp	: Integer;	//	1	(sim)	Tipo da opera��o
    {1 � Venda concession�ria
    2 � Faturamento direto para consumidor final
    3 � Venda direta para grandes consumidores (frotista, governo, ...)
    0 � Outros
    Obs. A codifica��o � em rela��o ao fabricante/importador, se o grupo for preenchido pela concession�ria/revenda, o tpOp deve ser 0 - Outros}
    _chassi	: widestring;	//	17	(sim)	Chassi do ve�culo - VIN (c�digo-identifica��o-ve�culo)
    _cCor	: widestring;	//	4	(sim)	Cor - C�digo de cada montadora
    _xCor	: widestring;	//	1-40	(sim)	Descri��o da Cor
    _pot	: widestring;	//	4	(sim)	Pot�ncia Motor (CV) - Pot�ncia m�xima do motor do ve�culo em cavalo vapor (CV). (pot�ncia-ve�culo)
    _cilin	: widestring;	//	4	(sim)	Cilindradas -Capacidade volunt�ria do motor expressa em cent�metros c�bicos (CC). (cilindradas) (campo novo)
    _pesoL	: widestring;	//	9	(sim)	Peso L�quido - em toneladas - 4 casas decimais
    _pesoB	: widestring;	//	9	(sim)	Peso Bruto - Peso Bruto Total - em tonelada - 4 casas decimais
    _nSerie	: widestring;	//	9	(sim)	Serial (s�rie)
    _tpComb	: widestring;	//	2	(sim)	Tipo de combust�vel - Utilizar Tabela RENAVAM (campo novo)
    {01-�lcool
    02-Gasolina
    03-Diesel
    (...)
    16-�lcool/Gasolina
    17-Gasolina/�lcool/GNV
    18-Gasolina/El�trico }
    _nMotor	: widestring;	//	21	(sim)	N�mero de Motor
    _CMT	: widestring;	//	9	(sim)	Capacidade M�xima de Tra��o - CMT-Capacidade M�xima de Tra��o - em Toneladas 4 casas decimais (campo novo)
    _dist	: widestring;	//	4	(sim)	Dist�ncia entre eixos
    _anoMod	: widestring;	//	4	(sim)	Ano Modelo de Fabrica��o
    _anoFab	: widestring;	//	4	(sim)	Ano de Fabrica��o
    _tpPint	: widestring;	//	1	(sim)	Tipo de Pintura
    _tpVeic	: widestring;	//	2	(sim)	Tipo de Ve�culo
    {Utilizar Tabela RENAVAM
    06-AUTOM�VEL
    14-CAMINH�O
    13-CAMINHONETA
    24-CARGA / CAM
    02-CICLOMOTO
    22-ESP / �NIBUS
    07-MICRO�NIBUS
    23-MISTO / CAM
    04-MOTOCICLO
    03-MOTONETA
    08-�NIBUS
    10-REBOQUE
    05-TRICICLO
    17-C. TRATOR
    *Lista exemplificativa.}
    _espVeic	: widestring;	//	1	(sim)	Esp�cie de Ve�culo - Utilizar Tabela RENAVAM
    {1-PASSAGEIRO
    2-CARGA
    3-MISTO
    4-CORRIDA
    5-TRA��O
    6-ESPECIAL}
    _VIN	: widestring;	//	1	(sim)	Condi��o do VIN - Informa-se o ve�culo tem VIN (chassi) remarcado.
    {R-Remarcado
    N-Normal}
    _condVeic	: widestring;	//	1	(sim)	Condi��o do Ve�culo:
    {1-Acabado;
    2-Inacabado;
    3-Semi-acabado}
    _cMod	: widestring;	//	6	(sim)	C�digo Marca Modelo - Utilizar Tabela RENAVAM
    _cCorDENATRAN	: widestring;	//	2	(sim)	C�digo da Cor - Segundo as regras de pr�-cadastro do DENATRAN (campo novo)
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
    _lota	: widestring;	//	1-3	(sim)	Capacidade m�xima de lota��o - Quantidade m�xima permitida de passageiros sentados, inclusive motorista. (campo novo)
    _tpRest	: widestring;
    {0 - N�o h�;
    1 - Aliena��o Fiduci�ria;
    2 - Arrendamento Mercantil;
    3 - Reserva de Dom�nio;
    4 - Penhor de Ve�culos;
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
    _cProdANP : widestring; //	9	sim	C�digo de produto da ANP - Utilizar a codifica��o de produtos do Sistema de Informa��es de Movimenta��o de produtos - SIMP. Informar 999999999 se o produto n�o possuir c�digo de produto ANP.
    _descANP  : widestring; // (n�o) Descri��o do produto conforme ANP (cProdANP=210203001) Utilizar a descri��o de produtos do Sistema de Informa��es de Movimenta��o de Produtos - SIMP.
    _pGLP_Opc : real;       // (n�o) Percentual do GLP derivado do petr�leo no produto GLP (cProdANP=210203001) Informar em n�mero decimal o percentual do GLP derivado de petr�leo no produto GLP. Valores de 0 a 1.
    _pGNn_Opc : real;       // (n�o) Percentual de G�s Natural Nacional � GLGNn para o produto GLP (cProdANP=210203001) Informar em n�mero decimal o percentual do G�s Natural Nacional � GLGNn para o produto GLP. Valores de 0 a 1.
    _pGNi_Opc : real;       // (n�o) Percentual de G�s Natural Importado � GLGNi para o produto GLP (cProdANP=210203001) Informar em n�mero decimal o percentual do G�s Natural Importado � GLGNi para o produto GLP. Valores de 0 a 1.
    _vPart_Opc : real;      // (n�o) Valor de partida (cProdANP=210203001) Deve ser informado neste campo o valor por quilograma sem ICMS.
    _CODIF : widestring;	// 0-21	n�o	C�digo de autoriza��o / registro do CODIF - Informar apenas quando a UF utilizar o CODIF (Sistema de Controle do Diferimento do Imposto nas Opera��es com AEAC - �lcool Et�lico Anidro Combust�vel).
    _qTemp : real;	// 16,4	n�o	Quantidade de combust�vel faturada � temperatura ambiente - Informar quando a quantidade faturada informada no campo qCom (I10) tiver sido ajustada para uma temperatura diferente da ambiente.
    _UFCons : widestring; //	2	sim	Informar a UF de consumo
    _qBCprod : real; //	15,4	n�o	BC da CIDE - Informar a BC da CIDE em quantidade
    _vAliqProd : real; //	15,4	n�o	Valor da al�quota da CIDE - nformar o valor da al�quota em reais da CIDE
    _vCIDE : real; //	15,2	n�o	Valor da CIDE - Informar o valor da CIDE
    _encerrante_Opc : WideString; // (n�o)  Informar com os dados do encerrante, informa��o exigida para emiss�o de NFC-e. NT 2015/002

  public
    constructor Novo(cProdANP, descANP : widestring; CODIF : widestring; qTemp : real; UFCons : widestring; qBCprod : real; vAliqProd : real; vCIDE : real);
    function GetXML : WideString;

  end;

  TMed400 = class

  public

    _nLote : widestring;	//	1-20	(sim)	N�mero do Lote de medicamentos ou de mat�rias-primas farmac�uticas
    _cProdANVISA : WideString; // (sim) C�digo do produto da ANVISA, utilizar o n�mero de registro da ANVISA
    _qLote : Real; //	11,3	(sim)	Quantidade de produto no Lote de medicamentos ou de mat�rias-primas farmac�uticas
    _dFab : Tdatetime; //	-	(sim)	Data de fabrica��o, informar no formato "AAAA-MM-DD"
    _dVal : Tdatetime; //	-	(sim)	Data de validade, informar no formato "AAAA-MM-DD"
    _vPMC : Real;

  public
    constructor Novo(nLote, cProdANVISA : WideString; qLote : Real; dFab : TDateTime; dVal : TDateTime; vPMC : Real);
    function GetXML : WideString;
  end;

  TInfAdProd = class

  public

    _infAdProd :	wideString; //	1-500	n�o	informar as informa��es adicionais do produto

  public
    constructor Novo(infAdProd :	wideString);
    function GetXML : WideString;
  end;

  TIcms400 = class

  public

    _orig : WideString; //	1	(sim)	informar o c�digo da origem da mercadoria:
    {0 - Nacional;
    1 - Estrangeira - importa��o direta;
    2 - Estrangeira - adquirida no mercado interno.}
    _CST	: WideString;	//	2,3	(sim)	informar o CST da opera��o:
    {00 � Tributada integralmente;
    10 - Tributada e com cobran�a do ICMS por substitui��o tribut�ria;
    20 - Com redu��o de base de c�lculo;
    30 - Isenta ou n�o tributada e com cobran�a do ICMS por substitui��o tribut�ria;
    40 - Isenta;
    41 - N�o tributada;
    50 � Suspens�o;
    51 - Diferimento;
    60 - ICMS cobrado anteriormente por substitui��o tribut�ria;
    70 - Com redu��o de base de c�lculo e cobran�a do ICMS por substitui��o tribut�ria;
    90 � Outros;
    P10 - ICMSPart com CST=10;
    P90 - ICMSPart com CST=90;
    S41 - ICMSST.
    ou
    Quando o CRT=1, informar o C�digo de Situa��o da Opera��o � Simples Nacional (CSOSN)
    101 � Tributada pelo Simples Nacional com permiss�o de cr�dito;
    102 � Tributada pelo Simples Nacional sem permiss�o de cr�dito;
    103 � Isen��o do ICMS no Simples Nacional para faixa de receita bruta;
    201 � Tributada pelo Simples Nacional com permiss�o de cr�dito e com cobran�a do ICMS por substitui��o tribut�ria;
    202 � Tributada pelo Simples Nacional sem permiss�o de cr�dito e com cobran�a do ICMS por substitui��o tribut�ria;
    203 � Isen��o do ICMS no Simples Nacional para faixa de receita bruta e com cobran�a do ICMS por substitui��o tribut�ria;
    300 � Imune;
    400 � N�o tributada pelo Simples Nacional;
    500 � ICMS cobrado anteriormente por substitui��o tribut�ria (substitu�do) ou por antecipa��o;
    900 - Outros.}
    _modBC	: integer; //	1	depende	informar a modalidade de determina��o da BC do ICMS:
    {0 - Margem Valor Agregado (%);
    1 - Pauta (valor);
    2 - Pre�o Tabelado M�ximo (valor);
    3 - Valor da Opera��o.}
    _pRedBC : Real; //	5,2	depende	informar o Percentual de redu��o da BC do ICMS da opera��o pr�pria
    _vBC	: Real; //	15,2	depende	informar o Valor da BC do ICMS do ICMS da opera��o pr�pria
    _pICMS	: Real; //	5,2	depende	informar a Al�quota do ICMS do ICMS da opera��o pr�pria
    _vICMS	: Real; //	15,2	depende	informar o Valor do ICMS do ICMS da opera��o pr�pria
    _modBCST	: integer; //	1	depende	informar a modalidade de determina��o da BC do ICMS ST:
    {0 � Pre�o tabelado ou m�ximo sugerido;
    1 - Lista Negativa (valor);
    2 - Lista Positiva (valor);
    3 - Lista Neutra (valor);
    4 - Margem Valor Agregado (%);
    5 - Pauta (valor).}
    _pMVAST : Real; //	5,2	depende	informar o Percentual da Margem de Valor Adicionado ICMS ST
    _pRedBCST : Real; //	5,2	depende	informar o Percentual de redu��o da BC ICMS ST
    _vBCST	: Real; //	15,2	depende	informar o Valor da BC do ICMS ST
    _pICMSST	: Real; //	5,2	depende	informar a Al�quota do ICMS ST
    _vICMSST	: Real; //	15,2	depende	informar o Valor do ICMS ST
    _vBCSTRet : Real; //	15,2	depende	informar o Valor da BC do ICMS ST retido (campo novo)
    _vICMSSTRet : Real; //	15,2	depende	informar o Valor do ICMS ST retido (campo novo)
    _vBCSTDest	: Real; //	15,2	depende	informar o Valor da BC do ICMS ST da UF Destino (campo novo)
    _vICMSSTDest	: Real; //	15,2	depende	informar o Valor do ICMS ST da UF destino (campo novo)
    _motDesICMS : integer; //	1	depende	informar o Motivo da desonera��o do ICMS:
    {1 � T�xi;
    2 � Deficiente F�sico;
    3 � Produtor Agropecu�rio;
    4 � Frotista/Locadora;
    5 � Diplom�tico/Consular;
    6 � Utilit�rios e Motocicletas da Amaz�nia Ocidental e �reas de Livre Com�rcio (Resolu��o 714/88 e 790/94 � CONTRAN e suas altera��es);
    7 � SUFRAMA;
    9 � outros.
    IMPORTANTE: informe zero quando a opera��o n�o tenha isen��o condicional.(campo novo)}
    _pBCOp	: Real; //	5,2	depende	informar o Percentual da BC opera��o pr�pria (campo novo)
    _UFST : WideString; //	2	depende	informar a UF para qual � devido o ICMS ST (campo novo)
    _pCredSN	: Real; //	15,2	depende	informar o Al�quota aplic�vel de c�lculo do cr�dito (Simples Nacional) (campo novo)
    _vCredICMSSN	: Real;
    _vICMSDeson : Real;  // valor ICMS Desonerado
    _vICMSOp : Real; // (Depende) informar o Valor do ICMS da opera��o que n�o ser� diferido
    _pDif : Real; // (Depende) informar o percentual do diferimento
    _vICMSDif : Real; // (Depende) informar o valor do ICMS que ser� diferido
    { DIFAL }
    _vBCFCP : Real; // (Depende) informar o Valor da Base de C�lculo do FCP
    _pFCP : Real; // (Depende) informar o Percentual do FCP. Nota: Percentual m�ximo de 2%, conforme a legisla��o
    _vFCP : Real; // (Depende) informar o Valor do FCP
    _vBCFCPST : Real; // (Depende) informar o Valor da Base de C�lculo do FCP retido por Substitui��o Tribut�ria
    _pFCPST : Real; // (Depende) informar o Percentual do FCP retido por Substitui��o Tribut�ria.  Nota: Percentual m�ximo de 2%, conforme a legisla��o
    _vFCPST : Real; // (Depende) informar o Valor do FCP retido por Substitui��o Tribut�ria.
    _vBCFCPSTRet : Real; // (Depende) informar o Valor da Base de C�lculo do FCP retido anteriormente por Substitui��o Tribut�ria.
    _pFCPSTRet : Real; // (Depende) informar o Percentual do FCP retido anteriormente por Substitui��o Tribut�ria. Nota: Percentual m�ximo de 2%, conforme a legisla��o
    _vFCPSTRet : Real; // (Depende) informar o Valor do FCP retido anteriormente por Substitui��o Tribut�ria.
    _pST : Real; // (Depende) informar Al�quota suportada pelo Consumidor Final. Deve ser informada a al�quota do c�lculo do ICMS-ST, j� incluso o FCP caso incida sobre a mercadoria. Exemplo: al�quota da mercadoria na venda ao consumidor final = 18% e 2% de FCP. A al�quota a ser informada no campo pST deve ser 20%

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

    _clEnq	: widestring; //	1-5	(n�o)	Informar a classe de enquadramento do IPI para Cigarros e Bebidas conforme Atos Normativos editados pela Receita Federal do Brasil.
    _CNPJProd : widestring; //	14	(n�o)	Informar o CNPJ do produtor da mercadoria, quando diferente do emitente nas exporta��es direta ou indireta.
    _cSelo	: widestring; //	1-60	(n�o)	Informar o c�digo do Selo de Controle do IPI conforme Atos Normativos editados pela Receita Federal do Brasil.
    _qSelo	: Real; //	15,0	(n�o)	Informar a quantidade de Selo de Controle do IPI utilizados.
    _cEnq : widestring; //	1-3	(sim)	Informar o C�digo de Enquadramento Legal do IPI, informar 999 enquanto a tabela n�o tiver sido criada pela Receita Federal do Brasil.
    _CST	: widestring; //	2	(sim)	Informar o C�digo de Situa��o Tribut�ria do IPI.
    _vBC	: Real; //	15,2	?	Informar o Valor da BC do IPI, este campo deve ser informado em caso de al�quota ad valorem.
    _pIPI : Real; //	5,2	?	Informar a al�quota percentual do IPI, este campo deve ser informado em caso de al�quota ad valorem.
    _vIPI : Real; //	15,2	(sim)	Informar o Valor do IPI
    _qUnid	: Real; //	15,4	?	Informar a quantidade total na unidade padr�o de tributa��o, este campo deve ser informado em caso de al�quota espec�fica.
    _vUnid	: Real;
    _importacao : boolean; //indica se a nota � de importa��o

  public
    constructor Novo(clEnq : widestring;CNPJProd : widestring;cSelo	: widestring;qSelo : Real;cEnq : widestring;CST	: widestring;
            vBC	: Real;pIPI : Real;vIPI : Real;qUnid : Real;vUnid	: Real; importacao : boolean);
    function GetXML : WideString;
  end;

  TII = class

  public

    _vBC : real; // 15,2	sim	Informar o Valor da BC do Imposto de Importa��o
    _vDespAdu : real; // 15,2	sim	Informar o valor das despesas aduaneiras
    _vII : real; // 15,2	sim	Informar a o valor do Imposto de Importa��o
    _vIOF : real; // 15,2	sim	Informar o Valor do IOF - Imposto sobre Opera��es Financeiras
    _isNFe : Boolean;  // gerar o grupo de tag vazio se for nfc-e

  public
    constructor Novo(vBC : Real;vDespAdu : Real;vII : Real;vIOF : real; isNFe : Boolean);
    function GetXML : WideString;

  end;

  TPIS = class

    public

      _CST : widestring; //	2	(sim)	Informar o C�digo de Situa��o Tribut�ria do PIS, para CST=05 informe o grupo PISST PISST.
      //Cabe ressaltar que a informa��o do grupo PISST n�o desobriga a informa��o do grupo PIS.
      _vBC : Real; //	15,2	?	Informar o Valor da BC do PIS, este campo deve ser informado em caso de al�quota ad valorem.
      _pPIS : Real; //	5,2	?	Informar a al�quota percentual do PIS, este campo deve ser informado em caso de al�quota ad valorem.
      _vPIS : Real; //	15,2	(sim)	Informar o Valor do PIS
      _qBCProd : Real; //	16,4	?	Informar a quantidade vendida, este campo deve ser informado em caso de al�quota espec�fica.
      _vAliqProd : Real;

    public
      constructor Novo(CST : widestring;vBC : Real;pPIS : Real;vPIS : Real;qBCProd : Real;vAliqProd : Real);
      function GetXML : WideString;
  end;

  TCOFINS = class

    public

      _CST : widestring; //	2	(sim)	Informar o C�digo de Situa��o Tribut�ria do COFINS, para CST=05 informe o grupo COFINSST COFINSST.
      //Cabe ressaltar que a informa��o do grupo COFINSST n�o desobriga a informa��o do grupo COFINS.
      _vBC : Real; //	15,2	?	Informar o Valor da BC do COFINS, este campo deve ser informado em caso de al�quota ad valorem.
      _pCOFINS : Real; //	5,2	?	Informar a al�quota percentual do COFINS, este campo deve ser informado em caso de al�quota ad valorem.
      _vCOFINS : Real; //	15,2	(sim)	Informar o Valor do COFINS
      _qBCProd : Real; //	16,4	?	Informar a quantidade vendida, este campo deve ser informado em caso de al�quota espec�fica.
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

      _vBCUFDest        : Real; // Informar o Valor da Base de C�lculo do ICMS na UF de destino.
      _vBCFCPUFDest     : Real; // informar o Valor da Base de C�lculo do FCP na UF Destino
      _pFCPUFDest       : Real; // Informar a Al�quota adotada nas opera��es internas na UF de destino para o produto / mercadoria. A al�quota do Fundo de Combate a Pobreza
      _pICMSUFDest      : Real; // Informar a Al�quota adotada nas opera��es internas na UF de destino para o prDONEo
      _pICMSInter       : Real; // Informar a Al�quota interestadual das UF envolvidas:
      _pICMSInterPart   : Real; // Informar Percentual de ICMS Interestadual para a UF de destino: 40% em 2016; 60% em 2017; 80% em 2018; 100% a partir de 2019.
      _vFCPUFDest       : Real; // Informar o Valor do ICMS relativo ao Fundo de Combate � Pobreza (FCP) da UF de destino.
      _vICMSUFDest      : Real; // Informar o Valor do ICMS Interestadual para a UF de destino, j� considerando o valor do ICMS relativo ao Fundo de Combate � Pobreza naquela UF.
      _vICMSUFRemet     : Real; // Informar o Valor do ICMS Interestadual para a UF do remetente. Nota: A partir de 2019, este valor ser� zero.

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
    _vBC	: Real; //	15,2	(sim)	informar o somat�rio da BC do ICMS (vBC) informado nos itens
    _vICMS	: Real; //	15,2	(sim)	informar o somat�rio de ICMS (vICMS) informado nos itens
    _vBCST	: Real; //	15,2	(sim)	informar o somat�rio da BC ST (vBCST) informado nos itens
    _vST	: Real; //	15,2	(sim)	informar o somat�rio do ICMS ST (vICMSST)informado nos itens
    _vProd	: Real; //	15,2	(sim)	informar o somat�rio de valor dos produtos (vProd) dos itens que tenham indicador de totaliza��o = 1 (indTot)
    //Os valores dos itens sujeitos ao ISSQN n�o devem ser acumulados neste campo.
    _vFrete : Real; //	15,2	(sim)	informar o somat�rio de valor do Frete (vFrete) informado nos itens
    _vSeg : Real; //	15,2	(sim)	informar o somat�rio valor do Seguro (vSeg) informado nos itens
    _vDesc	: Real; //	15,2	(sim)	informar o somat�rio do Desconto (vDesc) informado nos itens
    _vII	: Real; //	15,2	(sim)	informar o somat�rio de II (vII) informado nos itens
    _vIPI : Real; //	15,2	(sim)	informar o somat�rio de IPI (vIPI) informado nos itens
    _vPIS : Real; //	15,2	(sim)	informar o somat�rio de PIS (vPIS) informado nos itens sujeitos ao ICMS
    _vCOFINS	: Real; //	15,2	(sim)	informar o somat�rio de COFINS (vCOFINS) informado nos itens sujeitos ao ICMS
    _vOutro : Real; //	15,2	(sim)	informar o somat�rio de vOutro (vOutro) informado nos itens
    _vNF	: Real;
    _vTotTrib : Real;
    _vICMSDeson : Real; //informar o somat�rio do Valor do ICMS desonerado (vICMSDeson) informado nos itens.
    //Acrescentar o valor dos Servi�os informados no grupo do ISSQN
  public
    constructor Novo(vBC : Real;vICMS : Real;vBCST : Real;vST : Real;vProd : Real;vFrete : Real;vSeg : Real;vDesc : Real;vII : Real;
          vIPI : Real;vPIS : Real;vCOFINS : Real;vOutro : Real;vNF : Real;vTotTrib : Real;vICMSDeson : real);
    function GetXML : WideString;
  end;

  TtotalICMS400 = class

  public

    _vBC	: Real; //	15,2	(sim)	informar o somat�rio da BC do ICMS (vBC) informado nos itens
    _vICMS	: Real; //	15,2	(sim)	informar o somat�rio de ICMS (vICMS) informado nos itens
    _vBCST	: Real; //	15,2	(sim)	informar o somat�rio da BC ST (vBCST) informado nos itens
    _vST	: Real; //	15,2	(sim)	informar o somat�rio do ICMS ST (vICMSST)informado nos itens
    _vProd	: Real; //	15,2	(sim)	informar o somat�rio de valor dos produtos (vProd) dos itens que tenham indicador de totaliza��o = 1 (indTot)
    //Os valores dos itens sujeitos ao ISSQN n�o devem ser acumulados neste campo.
    _vFrete : Real; //	15,2	(sim)	informar o somat�rio de valor do Frete (vFrete) informado nos itens
    _vSeg : Real; //	15,2	(sim)	informar o somat�rio valor do Seguro (vSeg) informado nos itens
    _vDesc	: Real; //	15,2	(sim)	informar o somat�rio do Desconto (vDesc) informado nos itens
    _vII	: Real; //	15,2	(sim)	informar o somat�rio de II (vII) informado nos itens
    _vIPI : Real; //	15,2	(sim)	informar o somat�rio de IPI (vIPI) informado nos itens
    _vPIS : Real; //	15,2	(sim)	informar o somat�rio de PIS (vPIS) informado nos itens sujeitos ao ICMS
    _vCOFINS	: Real; //	15,2	(sim)	informar o somat�rio de COFINS (vCOFINS) informado nos itens sujeitos ao ICMS
    _vOutro : Real; //	15,2	(sim)	informar o somat�rio de vOutro (vOutro) informado nos itens
    _vNF	: Real;
    _vTotTrib : Real;
    _vICMSDeson : Real; //informar o somat�rio do Valor do ICMS desonerado (vICMSDeson) informado nos itens.
    _vICMSUFDest_Opc : Real;  // informar o somat�rio do Valor do ICMS Interestadual para a UF de destino (vICMSUFDest) informado nos itens.
    _vICMSUFRemet_Opc : Real; // informar o somat�rio do Valor total do ICMS Interestadual para a UF do remetente vICMSUFRemet) informado nos itens. Nota: A partir de 2019, este valor ser� zero.
    _vFCPUFDest_Opc : Real;   // informar o somat�rio do Valor do ICMS relativo ao Fundo de Combate � Pobreza (FCP) da UF de destino (vFCPUFDest) informado nos itens.
    _vFCP       : Real;   // (nao) informar o somat�rio do Valor do FCP (Fundo de Combate � Pobreza) (vFCP) informado nos itens.
    _vFCPST     : Real;   // (nao) informar o somat�rio do Valor do FCP retido anteriormente por Substitui��o. Corresponde ao total da soma dos campos vFCPST informado nos itens.
    _vFCPSTRet  : Real;   // (nao) informar o somat�rio do Valor do FCP retido anteriormente por Substitui��o. Corresponde ao total da soma dos campos vFCPSTRet informado nos itens
    _vIPIDevol  : Real;   // (nao) informar o somat�rio do Valor do IPI devolvido. Deve ser informado quando preenchido o Grupo Tributos Devolvidos na emiss�o de nota finNFe=4 (devolu��o) nas opera��es com n�o contribuintes do IPI. Corresponde ao total da soma dos campos vIIPIDevol do item

    //Acrescentar o valor dos Servi�os informados no grupo do ISSQN

  public
    constructor Novo(vBC : Real; vICMS : Real; vBCST : Real; vST : Real; vProd : Real; vFrete : Real; vSeg : Real; vDesc : Real; vII : Real;
          vIPI : Real; vPIS : Real; vCOFINS : Real; vOutro : Real; vNF : Real; vTotTrib : Real; vICMSDeson : real; vICMSUFDest_Opc : Real;
          vICMSUFRemet_Opc : Real; vFCPUFDest_Opc, vFCP, vFCPST, vFCPSTRet, vIPIDevol : Real);
    function GetXML : WideString;
  end;

  TTransporta = class

  public
    _CNPJ : widestring; //	14	(n�o)	informar o CNPJ do transportador, sem formata��o ou m�scara
    _CPF : widestring; //	11	(n�o)	informar o CPF do transportador, sem formata��o ou m�scara
    _xNome : widestring; //	1-60	(n�o)	informar a raz�o social do transportador
    _IE : widestring; //	0-14	(n�o)	informar a IE do transportador, sem formata��o ou m�scara.
    _xEnder : widestring; //	1-60	(n�o)	informar o endere�o completo do transportador
    _xMun : widestring; //	1-60	(n�o)	informar o nome do munic�pio
    _UF : widestring;

  public
    constructor Novo(CNPJ : widestring;CPF : widestring;xNome	: widestring;IE : widestring;xEnder : widestring;xMun : widestring;UF : widestring);
    function GetXML : WideString;
  end;

  TVeicTransp = class

  public
    _placa :	widestring; //	1-8	(sim)	informar a placa do ve�culo, somente letras e d�gitos
    _UF : widestring; //	2	(sim)	informar a sigla da UF do registro do ve�culo
    _RNTC : widestring;

  public
    constructor Novo(placa :	widestring;UF : widestring;RNTC : widestring);
    function GetXML : WideString;
  end;

  TVol = class

  public
    _qVol : Real; //	1-15	(n�o)	informar a quantidade de volume transportados
    _esp : widestring; //	1-60	(n�o)	informar a esp�cie dos volume transportados
    _marca : widestring; //	1-60	(n�o)	informar a marca dos volume transportados
    _nVol : widestring; //	1-60	(n�o)	informar a numera��o dos volume transportados
    _pesoL : Real; //	12,3	(n�o)	informar o peso l�quido em kg dos volumes transportados
    _pesoB : Real; //	12,3	(n�o)	informar o peso bruto em kg dos volumes transportados
    _lacres : widestring;

  public
    constructor Novo(qVol : Real;esp : widestring;marca	: widestring;nVol : widestring;pesoL : Real;pesoB	: Real;lacres : widestring);
    function GetXML : WideString;
  end;


  //A informa��o m�nima exigida neste grupo � a tag modFrete, que agora aceita o valor 9-sem frete que deve ser informado em uma
  //nota fiscal que n�o acoberte uma efetiva circula��o de mercadorias como � o caso da NF de Simples Faturamento, NF de complemento
  //do ICMS, etc.
  TTransportador2G = class

  public
    _modFrete : widestring; //	1	(sim)	informar a modalidade do frete:
    {0-por conta do emitente;
    1-por conta do destinat�rio;
    2-por conta de terceiros;
    9-sem frete.   }
    //(campo com novo dom�nio)
    _transporta : TTransporta; //	-	(n�o)	informar o XML com os dados do transportador
    _retTransp : widestring;   //	-	(n�o)	informar o XML com os valores dos tributos retidos do transportador
    _veicTransp : TVeicTransp; //	-	(n�o)	informar o XML com os dados do ve�culo utilizado no transporte
    _reboque : widestring;     //	-	(n�o)	informar o XML com os dados dos reboques utilizados no transporte (cardinalidade ampliada)
    _vagao : widestring;       //	-	(n�o)	informar os dados do vag�o utilizados no transporte (novo campo)
    _balsa : widestring;      //	-	(n�o)	informar os dados da balsa utilizados no transporte (novo campo)
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

    _infAdFisco : widestring; //	1-2000	(n�o)	informar as informa��es de interesse do Fisco (campo com novo tamanho)
    _infCpl : widestring; //	1-5000	(n�o)	informar as informa��es complementares de interesse do contribuite
    _obsCont	: widestring; //	-	(n�o)	informar o XML com o obsCont
    _obsFisco : widestring; //	-	(n�o)	informar o XML com o obsFisco
    _procRef	: widestring; //	-	(n�o)	informar o XML com o procRef

  public
    constructor Novo(infAdFisco : widestring;infCpl : widestring;obsCont	: widestring;obsFisco : widestring;procRef	: widestring);
    function GetXML : WideString;
    function TrimPalavra(texto : WideString) : WideString;
  end;

  TDup = class
  private

  public
    _nDup  : widestring; //	1-60	(n�o)	informar o n�mero da duplicata
    _dVenc : TDateTime; //	-	(n�o)	informar a data de vencimento da duplicata
    _vDup  : Real; //	15,2	(n�o)	informar o valor da duplicata

    constructor Novo(nDup : widestring;dVenc : TDateTime;vDup : Real);
    function GetXML : WideString;
  end;

  type
    ListaDuplicata = TList<TDup>;

  TCobr = class

  public

    _nFat  : widestring; //	1-60	(n�o)	informar o n�mero da fatura
    _vOrig : Real; //	15,2	(n�o)	informar o valor origin�rio da fatura
    _vDesc : Real; //	15,2	(n�o)	informar o valor do desconto
    _vLiq  : Real; //	15,2	(n�o)	informar o valor Liquido da fatura
    _dup   : ListaDuplicata; //	-	(n�o)	informar o XML do grupo dup de duplicatas

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
  if (_pIPI <= 0) and (_importacao = false) then //evita criar a tag de ipi sem ter ipi  a menos que seja importa��o
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
    Result := '';  // <---- SE NAO EXISTIR VEICULO ENTAO FOR�O VAZIO
  // com a vers�o do XML 4.0 caso eu informe esse grupo dar� rejei��o por isso estou enviando vazio
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
    Result := '';  // <---- SE NAO EXISTIR VOL ENTAO FOR�O VAZIO
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
    if true then // not Principal.isNFC    // grupo obrigat�rio somente para NF-e
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
  xml := Util.detPag('', _tPag, _vPag, _CNPJ_Opc, _tBand_Opc, _cAut_Opc, _tpIntegra_Opc); //_indPag_Opc ainda n�o � aceito
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
