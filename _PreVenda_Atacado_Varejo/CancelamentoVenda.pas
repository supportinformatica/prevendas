unit CancelamentoVenda;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Db, DBTables, Menus, Variants, ADODB, System.Generics.Collections,
  Vcl.ExtCtrls, System.DateUtils;

type
  TFrmCancelamentoVenda = class(TForm)
    EdtSenha: TEdit;
    Label1: TLabel;
    PopupMenu: TPopupMenu;
    F1Ajuda1: TMenuItem;
    Label2: TLabel;
    Label3: TLabel;
    ADOQuery1: TADOQuery;
    edtUsuario: TComboBox;
    Shape1: TShape;
    tmr1: TTimer;
    procedure EdtSenhaKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure F1Ajuda1Click(Sender: TObject);
    procedure EdtUsuarioKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure tmr1Timer(Sender: TObject);
  private
    resultadoPossuiPermissao: ^Boolean;
    letraDaOperacao:string;
    procedure inserirNoLog(texto : string; valor : Real);
    Function Pesquisa_Permissao(vTag : String) : String;
  public
    PodeFechar : Boolean;
    codigoDaPermissao : string;
    constructor Create(AOwner: TComponent; codigoDaPermissao:string; letraDaOperacao:string; var possuiPermissao:Boolean); overload;
    Function Possui_Permissao(vTag:String; letraDaOperacao:string; _usuario, _senha : string; exibirMensagem : boolean = true) : boolean;
  end;

var
  FrmCancelamentoVenda: TFrmCancelamentoVenda;

implementation

uses DataModulo,uFuncoesPadrao,FrmPrincipal, MoPreVenda, FormaPag,
  CdCliente, CdCreditoCliente, frmCredito, NEGPrevenda, NEGLoja;

{$R *.DFM}

constructor TFrmCancelamentoVenda.Create(AOwner: TComponent; codigoDaPermissao:string; letraDaOperacao:string; var possuiPermissao:Boolean);
begin
  inherited Create(AOwner);
  resultadoPossuiPermissao := @possuiPermissao;
  self.codigoDaPermissao := codigoDaPermissao;
  Self.letraDaOperacao:= letraDaOperacao;
  EdtSenha.Clear;
end;

procedure TFrmCancelamentoVenda.EdtSenhaKeyPress(Sender: TObject;
  var Key: Char);
var
  List_Qtd,List_Cod : TStringList;  // codigo do produto e quantidade para estorno
  L,I,nr_Parcelas,vTeste,vSalvar : Integer;       // contador do la�o for
  vTexto,vNCupom,Buffer : string;
  F : TextFile;
  vGeraDic : String[01];
  vSenha   : String[06];
  vSimplesRemessa: Integer; // Indica se a prevenda que est� sendo alterada � simplesRemessa
begin
  Application.OnMessage := FormPrincipal.NaoProcessaMsg;
  if key = Char(27) then
  begin  //27 = ESC
    FrmPrincipalPreVenda.Enabled := True;
    if (codigoDaPermissao <> '') then
    begin
      resultadoPossuiPermissao^ := False;
      PodeFechar := True;
      FrmPrincipalPreVenda.possuiPermissaoVenderAbaixoDoCusto := False;
      if codigoDaPermissao = '614' then
        FrmPrincipalPreVenda.auxiLiberacao := False;
      Close;
//      Exit;
    end else
    begin
      if vFlag = '0' then
      begin
        FrmPrincipalPreVenda.EdtPreco.Text    := FormatFloat('0.00',FrmPrincipalPreVenda.ADOSPConsulta.FieldByName('Valor').AsFloat);
        FrmPrincipalPreVenda.EdtDescUnit.Text := '0,00';
        FrmPrincipalPreVenda.EdtDesconto.Text := '0,00';
        FrmPrincipalPreVenda.EdtDescUnit.SelectAll;
        FrmPrincipalPreVenda.EdtDescUnit.SetFocus;
        PodeFechar := True;
        Close;
      end;
      if vFlag = '1' then
      begin
        FrmPrincipalPreVenda.RgOpcoes.ItemIndex := 0;
        Application.OnMessage := FormPrincipal.ProcessaMsg;
        PodeFechar := True;
        close;
      end;
      if (vFlag = '2') or (vFlag = '5')  then
      begin
        Application.OnMessage := FormPrincipal.ProcessaMsg;
        PodeFechar := True;
        close;
      end;
      if (vFlag = '3') or (vFlag = '4') then
      begin
        Application.OnMessage := FormPrincipal.ProcessaMsg;
        PodeFechar := True;
        Close;
        FrmCdCliente.BtnMdCancelarClick(self);
      end;
      if (vFlag = '6') then
      begin
        Application.OnMessage := FormPrincipal.NaoProcessaMsg;
        if (MoPreVenda.TestaFinanceiroNaConfirmacao = false) and (FrmPrincipalPreVenda.prevenda <> nil) then
        begin
          FrmPrincipalPreVenda.prevenda.descontoPercentual:= 0;
          if MoPreVenda.vCasasPreco > MoPreVenda.vLimiteCasasPreco then
            FrmPrincipalPreVenda.EdtDesconto.Text := '0,000'
          else
            FrmPrincipalPreVenda.EdtDesconto.Text := '0,00';
          FrmPrincipalPreVenda.EdtDescontoExit(Self);
          FrmPrincipalPreVenda.EdtDesconto.Refresh;
          FrmPrincipalPreVenda.EdtSubTotal.Text := FormatFloat('0.00',TNEGPrevenda.getTotalLiquido(FrmPrincipalPreVenda.prevenda)); //FrmPrincipalPreVenda.EdtTotal.Text;
        end;
        FrmPrincipalPreVenda.EdtQtd.Text := '0';
        FrmPrincipalPreVenda.EdtDescUnit.Text := '0,00';
        FrmPrincipalPreVenda.EdtPreco.Text := FormatFloatQ(vCasasPreco, FrmPrincipalPreVenda.ADOSPConsulta.FieldByName('Valor').AsFloat);
        FrmPrincipalPreVenda.liberouVenda := False;
        vlTotalAnterior := 0;
        PodeFechar := True;
        Application.OnMessage := FormPrincipal.ProcessaMsg;
        Close;
      end;
      if (vFlag = '7') then
      begin
        Application.OnMessage := FormPrincipal.NaoProcessaMsg;
        FrmPrincipalPreVenda.enabled := true;
        FrmPrincipalPreVenda.codigoClienteAtual := '0';
        if StrToIntDef(FrmPrincipalPreVenda.codigoClienteAtual,-1) > 0 then
        begin
          FrmPrincipalPreVenda.SetarClienteNaCombo(FrmPrincipalPreVenda.codigoClienteAtual);
          if UPPERCASE(vEmpresa) = 'GIRORAPIDO' then
            if (FrmPrincipalPreVenda.tipoClienteAtual = 'A') then
            begin //Yes - varejo, Ok - atacado
              vAtacadoVarejo  := 'A';
              FrmPrincipalPreVenda.Label30.caption := 'Cliente -> Atacado';
            end else
            begin
              vAtacadoVarejo  := 'V';
              FrmPrincipalPreVenda.Label30.caption := 'Cliente -> Varejo';
            end;
        end else
        begin
  //        FrmPrincipalPreVenda.EdtCdCliente.Clear;
  //        FrmPrincipalPreVenda.CbxCliente.Text := '';
  //      FrmPrincipalPreVenda.cbxCliente.SelectAll;
  //      FrmPrincipalPreVenda.cbxCliente.SetFocus;
        end;
        Application.OnMessage := FormPrincipal.ProcessaMsg;
        PodeFechar := True;
        close;
      end;
      if (vFlag = '8') then
      begin
        Application.OnMessage := FormPrincipal.NaoProcessaMsg;
        FrmPrincipalPreVenda.enabled := true;
        if FrmPrincipalPreVenda.EdtConsulta.Enabled = True then
        begin
          FrmPrincipalPreVenda.EdtConsulta.SelectAll;
          FrmPrincipalPreVenda.EdtConsulta.SetFocus;
        end;
        Application.OnMessage := FormPrincipal.ProcessaMsg;
        PodeFechar := True;
        close;
      end;
      if (vFlag = '9') then
      begin   // formulario de forma de pagamento
        resultadoPossuiPermissao^:= False;
        PodeFechar := True;
        close;
      end;
      if (vFlag = '10') then
      begin   // formulario de forma de pagamento
        Application.OnMessage := FormPrincipal.NaoProcessaMsg;
        FrmPrincipalPreVenda.enabled := true;
        Application.OnMessage := FormPrincipal.ProcessaMsg;
        PodeFechar := True;
        close;
      end;
    end;
  end;
  if key = Char(13) then
  begin
    if (codigoDaPermissao <> '') then
    begin
      resultadoPossuiPermissao^:= Possui_Permissao(codigoDaPermissao, letraDaOperacao, edtUsuario.Text, EdtSenha.Text);
      if resultadoPossuiPermissao^ then
      begin
        FrmPrincipalPreVenda.Enabled := True;
        Application.OnMessage := FormPrincipal.ProcessaMsg;
        FrmPrincipalPreVenda.vUltimo_USUARIO := EdtUsuario.Text;
        if codigoDaPermissao = '631' then
          FrmPrincipalPreVenda.possuiPermissaoVenderAbaixoDoCusto := True;
        PodeFechar := True;
        Close;
      end else
        Exit;
    end;
    if vFlag = '0' then // LIBERA��O DE DESCONTO
    begin
      if Pesquisa_Permissao('613') <> 'N' then
      begin
        FrmPrincipalPreVenda.Enabled := True;
        Application.OnMessage := FormPrincipal.ProcessaMsg;
        FrmPrincipalPreVenda.vUltimo_USUARIO := EdtUsuario.Text;
        inserirNoLog('Desconto pr� venda at� o limite', StrToFloatDef(FrmPrincipalPreVenda.EdtDesconto.Text,0));
        FrmPrincipalPreVenda.liberouVenda := True;
        if StrToFloatDef(FrmPrincipalPreVenda.EdtQtd.Text, 0) > 0 then
          FrmPrincipalPreVenda.EnviaProdutos;
        PodeFechar := True;
        Close;
      end;
    end;
    if vFlag = '1' then  // LIBERA��O DE VENDA
    begin
      if Possui_Permissao('820','A',edtUsuario.Text, EdtSenha.Text) then // Senha para altera��o de prevenda
      begin
        FrmPrincipalPreVenda.Enabled := True;
        FrmPrincipalPreVenda.vUltimo_USUARIO := EdtUsuario.Text;
        Application.OnMessage := FormPrincipal.ProcessaMsg;
        FrmPrincipalPreVenda.Enabled := True;
        FrmPrincipalPreVenda.EdtLancto.Enabled    := True;
        FrmPrincipalPreVenda.EdtLancto.Color      := clBtnHighlight;
        FrmPrincipalPreVenda.EdtLancto.Text       := '';
        FrmPrincipalPreVenda.EdtLancto.ReadOnly   := False;
        FrmPrincipalPreVenda.EdtLancto.SetFocus;
        FrmPrincipalPreVenda.EdtCdCliente.Text    := '';
        FrmPrincipalPreVenda.CbxCliente.ItemIndex := -1;
        PodeFechar := True;
        Close;
      end;
    end;
    if vFlag = '3' then // CADASTRAR CLIENTE
    begin
      if Pesquisa_Permissao('11') = 'N' then
      begin
        Application.OnMessage := FormPrincipal.ProcessaMsg;
        PodeFechar := True;
        Close;
        FrmCdCliente.BtnMdCancelarClick(self);
        Exit;
      end;
      FrmPrincipalPreVenda.Enabled := True;
      FrmPrincipalPreVenda.vUltimo_USUARIO := EdtUsuario.Text;
      Application.OnMessage := FormPrincipal.ProcessaMsg;
      FrmCdCliente.CbxTelefone.Clear;     // limpa a combo
      FrmCdCliente.CbxEstado.Clear;
      if MontaComboListBoolAdo(FrmCdCliente.AdoQryPegaEstado,FrmCdCliente.CbxEstado) then
        FrmCdCliente.CbxEstado.Text := FrmCdCliente.CbxEstado.Items[0]; // monta a combo com todos os estados
      LimpaTodosCampos(FrmCdCliente.TbSheetMdCadastroDados);
      FrmCdCliente.AtivaCampos;
      FrmCdCliente.Label10.Caption := 'Cliente -> ';
      FrmCdCliente.CbxTelefone.Clear;     // limpa a combo
      FrmCdCliente.CbxEstado.Clear;
      if MontaComboListBoolAdo(FrmCdCliente.AdoQryPegaEstado,FrmCdCliente.CbxEstado) then
        FrmCdCliente.CbxEstado.Text := FrmCdCliente.CbxEstado.Items[0]; // monta a combo com todos os estados
      LimpaTodosCampos(FrmCdCliente.TbSheetMdCadastroDados);
      FrmCdCliente.AtivaCampos;
      FrmCdCliente.CkbAtivosD.Checked  := True;
      FrmCdCliente.CkbAtivosD.Enabled  := False;
      FrmCdCliente.CbxTelefone.Enabled := True;
      FrmCdCliente.EdtRamal.Enabled    := True;
      FrmCdCliente.EdtTipoTel.Enabled  := True;
      FrmCdCliente.EdtRamal.ReadOnly   := False;
      FrmCdCliente.EdtTipoTel.ReadOnly := False;
      FrmCdCliente.RgPessoaD.ItemIndex := 0;
      FrmCdCliente.EdtDias.text        := '0';
      FrmCdCliente.CbBtpCli.ItemIndex  := 0;
      FrmCdCliente.CbBtpCliChange(Self);
      FrmCdCliente.AdoQryUltimoCodigo.Open;  {usada para calcular o proximo codigo da tabela pessoa}
      FrmCdCliente.EdtCodigo.Text      := IntToStr(FrmCdCliente.AdoQryUltimoCodigo.FieldByName('UtCodigo').AsInteger + 1);
      FrmCdCliente.AdoQryUltimoCodigo.Close;
      FrmCdCliente.DtCadastro.Date     := Date;
      FrmCdCliente.CbxCidade.Enabled   := True;
      FrmCdCliente.EdtCidade.Visible   := False;
      FrmCdCliente.MskNascimento.Text  := DateToStr(Date);
      FrmCdCliente.EdtLimite.Text      := FormatFloat('0.00',FrmPrincipalPreVenda.vLimiteCredito);
      FrmCdCliente.EdtLimite.ReadOnly  := True;
      FrmcdCliente.Enabled := True;
      FrmCdCliente.EdtNome.SetFocus;
      PodeFechar := True;
      Close;
    end;
    if vFlag = '4' then // ALTERAR CADASTRO DO CLIENTE
    begin
      if Pesquisa_Permissao('11') = 'N' then
      begin
        Application.OnMessage := FormPrincipal.ProcessaMsg;
        PodeFechar := True;
        Close;
        FrmCdCliente.BtnMdCancelarClick(self);
        Exit;
      end;
      FrmPrincipalPreVenda.Enabled := True;
      FrmPrincipalPreVenda.vUltimo_USUARIO := EdtUsuario.Text;
      Application.OnMessage := FormPrincipal.ProcessaMsg;
      FrmCdCliente.AtivaCampos;
      if FrmCdCliente.RgPessoad.ItemIndex = 0 then
        FrmCdCliente.VauxiAlterar := 0
      else
        FrmCdCliente.VauxiAlterar := 1;
      FrmCdCliente.CbxEstado.Enabled := true;
      if FrmCdCliente.PgCtrolMdCadastro.ActivePage = FrmCdCliente.TBSheetMdCadastroDados then
      begin
         FrmcdCliente.Enabled := True;
         FrmCdCliente.EdtNome.SetFocus;
      end else
      begin
         FrmcdCliente.Enabled := True;
         FrmCdCliente.EdtDias.SetFocus;
      end;
      PodeFechar := True;
      Close;
    end;
    if vFlag = '5' then // CONSULTA DE CR�DITO DO CLIENTE
    begin
      if Pesquisa_Permissao('34') <> 'N' then
      begin
        FrmPrincipalPreVenda.Enabled := True;
        FrmPrincipalPreVenda.vUltimo_USUARIO := EdtUsuario.Text;
        FrmCreditoCliente := TFrmCreditoCliente.Create(Application);
        try
          FrmprincipalPreVenda.Enabled := False;
          FrmCreditoCliente.Show;
        except
          FrmCreditoCliente.Free;
          FrmprincipalPreVenda.Enabled := True;
        end;
        PodeFechar := True;
        Close;
      end;
    end;
    if vFlag = '6' then
    begin  // Desconto acima do limite
      if Pesquisa_Permissao('615') <> 'N' then
      begin
        Application.OnMessage := FormPrincipal.NaoProcessaMsg;
        FrmPrincipalPreVenda.Enabled := True;
        inserirNoLog('Desconto pr� venda acima do limite', StrToFloatDef(FrmPrincipalPreVenda.EdtDesconto.Text,0));
        Application.OnMessage := FormPrincipal.ProcessaMsg;
        FrmPrincipalPreVenda.liberouVenda := true;
        PodeFechar := True;
        Close;
        exit;
      end;
    end;
    if vFlag = '2' then
    begin  // Libera venda
      if Pesquisa_Permissao('614') <> 'N' then
      begin // Senha para libera��o de venda
        FrmPrincipalPreVenda.Enabled := True;
        FrmPrincipalPreVenda.vUltimo_USUARIO := EdtUsuario.Text;
        Application.OnMessage := FormPrincipal.ProcessaMsg;
        vteste := 1;  // o or�amento foi salvo
        // vSalvar := 0;  // n� de tentativas de salvar os dados
        With FrmPrincipalPreVenda.ADOQrySalvar do
        begin
          Try
            if vOrcamento = 'O' then
            begin
              if Messagedlg('Clique "Sim" para este or�amento se transformar em uma Pr� Venda?',
                 mtInformation, [mbYes, mbNo], 0) = mrYes then vOrcamento := 'N';
            end;
            DModulo.Conexao.BeginTrans;
            if FrmPrincipalPreVenda.RgOpcoes.ItemIndex = 1 then
            begin // Se for altera��o de um or�amento
              Sql.Text:= 'select simplesRemessa from orcamento with(nolock) where nrOrcamento = :NRORCAMENTO';
              Parameters.ParamByName('NRORCAMENTO').Value := FrmPrincipalPreVenda.EdtLancto.Text;
              Open;
              if FieldByName('simplesRemessa').AsBoolean then
                vSimplesRemessa:= 1
              else
                vSimplesRemessa:= 0;
              Sql.Text := 'Delete From Orcamento Where nrOrcamento = :NRORCAMENTO ';
              Parameters.ParamByName('NRORCAMENTO').Value := FrmPrincipalPreVenda.EdtLancto.Text;
              ExecSql;
              Sql.Text := 'Delete From MemoOrcamento Where nrOrcamento = :NRORCAMENTO ';
              Parameters.ParamByName('NRORCAMENTO').Value := FrmPrincipalPreVenda.EdtLancto.Text;
              ExecSql;
            end;
            if (FrmPrincipalPreVenda.RgOpcoes.ItemIndex = 0) or (FrmPrincipalPreVenda.RgOpcoes.ItemIndex = 2) then
            begin // Se for salvar um or�amento
              FrmPrincipalPreVenda.UltimoLancamentoBloqueandoTabela(FrmPrincipalPreVenda.ADOQrySalvar);
              Sql.Text := 'Update Sequencial Set nrPedidos = nrPedidos + 1 Where cdCodigo = 1 ';
              ExecSql;
            end;
            // dados do orcamento
            Sql.Text := 'Insert Into Orcamento (nrOrcamento,cdPessoa,dsFlag, '+
                        'dtEmissao,nrDesconto,dsImpresso,cdCliente,vlvalor,  '+
                        'dsFormatacao, simplesRemessa)                                       '+
                        'Values (:nrOrcamento,:cdPessoa,''C'',               '+
                        ':DATA,:nrDesconto,:tipo,:cdCliente,:vlvalor,:pag,:simplesRemessa)   ';
            Parameters.ParamByName('nrOrcamento').Value :=  FrmPrincipalPreVenda.EdtLancto.Text;
            Parameters.ParamByName('cdPessoa').Value    := FrmPrincipalPreVenda.EdtCdNome.Text;
            Parameters.ParamByName('nrDesconto').Value  := StrToFloat(FrmPrincipalPreVenda.EdtDesconto.Text);
            Parameters.ParamByName('cdCliente').Value   := FrmPrincipalPreVenda.EdtCdCliente.Text;
            Parameters.ParamByName('vlvalor').Value     :=  StrToFloat(FrmPrincipalPreVenda.EdtSubTotal.Text);
            Parameters.ParamByName('DATA').Value        :=  vdata_banco;
            if (FrmPrincipalPreVenda.RgOpcoes.ItemIndex = 4)and(UpperCase( vEmpresa ) = 'PBFARMA') then
              Parameters.ParamByName('simplesRemessa').Value  := 1 // � simples remessa
            else

            { Em caso de altera��o o status de simplesRemessa � mantido }
            if (FrmPrincipalPreVenda.RgOpcoes.ItemIndex = 1)and(UpperCase( vEmpresa ) = 'PBFARMA') then
              Parameters.ParamByName('simplesRemessa').Value  := vSimplesRemessa
            else
              Parameters.ParamByName('simplesRemessa').Value  := 0;
            case FrmPrincipalPreVenda.RgOpcoes.ItemIndex of
               0,3,4: Parameters.ParamByName('tipo').Value  := 'N';
               1: Parameters.ParamByName('tipo').Value  := vOrcamento; // Se for alterar pode continuar orcamento ou virar pr�-venda
               2: Parameters.ParamByName('tipo').Value  := 'O';
            end;
            case FrmFormaPag.RadioGroup1.ItemIndex of
              0: Parameters.ParamByName('pag').Value :=  '0';
              1: Parameters.ParamByName('pag').Value :=  '1';
              2: Parameters.ParamByName('pag').Value :=  '2';
              3: Parameters.ParamByName('pag').Value :=  '3';
              4: Parameters.ParamByName('pag').Value :=  '4';
              5: Parameters.ParamByName('pag').Value :=  '5';
              6: Parameters.ParamByName('pag').Value :=  '6';
              7: Parameters.ParamByName('pag').Value :=  '7';
            end;
            ExecSql;
            for L := 1 to FrmPrincipalPreVenda.SgDados.RowCount - 1 do
            begin  // Salvando os itens da pr�-venda.
              if FrmPrincipalPreVenda.SgDados.Cells[0,L] = '' then
                Break;
              Sql.Text := 'Insert Into IteOrcamento                                   '+
                          '(cdIteLcto,nrOrcamento, cdProduto,nrQtd,vlPreco,dsSituacao) '+
                          'Values ( :CDITELCTO , :NRORCAMENTO, :CDPRODUTO,:NRQTD,      '+
                          ':VLPRECO,:DSSITUACAO)                                      ';
              Parameters.ParamByName('CDITELCTO').Value:= IntToStr(L);
              Parameters.ParamByName('NRORCAMENTO').Value:= FrmPrincipalPreVenda.EdtLancto.Text;
              Parameters.ParamByName('CDPRODUTO').Value:= FrmPrincipalPreVenda.SgDados.Cells[0,L];
              Parameters.ParamByName('NRQTD').Value:= FrmPrincipalPreVenda.SgDados.Cells[2,L];
              Parameters.ParamByName('VLPRECO').Value:= FrmPrincipalPreVenda.SgDados.Cells[3,L];
              Parameters.ParamByName('DSSITUACAO').Value:= '';
              ExecSql;
            end;
            DModulo.Conexao.CommitTrans;
          except
            on E: Exception do
            begin
              DModulo.Conexao.RollbackTrans;
              Salvar_erro(vData_Banco + ' | ' + FrmPrincipalPreVenda.pegaHoraBanco, 'PREVENDA', 'TFrmCancelamentoVenda.EdtSenhaKeyPress', e.Message);
              vTeste  := 2; // o orcamento nao foi salvo
              vSalvar := vSalvar + 1;
              if vSalvar <= 4 then
                FrmFormaPag.BtnConfirmarClick(Self)
              else
              begin
                Messagedlg('N�o foi poss�vel salvar esta Pr� Venda \ Or�amento!', mterror, [mbOk], 0);
                vSalvar := 0;
              end;
            end;
          end;  // except
        end;    // QqryCaixa
        if vTeste = 1 then
        begin   // o lan�amento foi salvo com sucesso
          PodeFechar := True;
          Close;
          FrmPrincipalPreVenda.ImprimeComprovante(1);   // 1 a prazo
          if MessageDlg('Deseja imprimir a Pr� Venda \ Or�amento de n� '+ FrmPrincipalPreVenda.EdtLancto.Text + ' ?',
            mtConfirmation,[mbYes, mbNo],0) = mrYes then
            FrmPrincipalPreVenda.ImprimeOrcamento(1);   // 1 a prazo
          Application.OnMessage        := FormPrincipal.ProcessaMsg;
          FrmPrincipalPreVenda.Limpar_Tela;
          FrmPrincipalPreVenda.RgOpcoes.ItemIndex := 0;
        end;
        Application.OnMessage := FormPrincipal.NaoProcessaMsg;
        FrmPrincipalPreVenda.EdtDesconto.ReadOnly := True;
        FrmPrincipalPreVenda.EdtSubTotal.ReadOnly := True;
        FrmPrincipalPreVenda.BtnAprazo.Enabled    := True;
        Application.OnMessage := FormPrincipal.ProcessaMsg;
        PodeFechar := True;
        FrmFormaPag.Close;
      end;
    end;
    if vFlag = '7' then
    begin  // Libera venda
      if Pesquisa_Permissao('614') <> 'N' then
      begin
        FrmPrincipalPreVenda.auxiLiberacao := True;
        Application.OnMessage := FormPrincipal.NaoProcessaMsg;
        FrmPrincipalPreVenda.Enabled := True;
        inserirNoLog('Libera��o de restri��o financeira na pr� venda.', StrToFloatDef(FrmPrincipalPreVenda.EdtSubTotal.Text,0));
        //FrmPrincipalPreVenda.EdtConsulta.SetFocus;
        Application.OnMessage := FormPrincipal.ProcessaMsg;
        PodeFechar := True;
        Close;
      end;
    end;
    if vFlag = '9' then
    begin  // Libera venda forma de pagamento
      if Pesquisa_Permissao('614') <> 'N' then
      begin
        Application.OnMessage := FormPrincipal.NaoProcessaMsg;
        inserirNoLog('Libera��o de restri��o financeira na pr� venda.', StrToFloatDef(FrmPrincipalPreVenda.EdtSubTotal.Text,0));
        FrmPrincipalPreVenda.Enabled := True;
        Application.OnMessage := FormPrincipal.ProcessaMsg;
        FrmPrincipalPreVenda.auxiLiberacao := true;
        PodeFechar := True;
        Close;
      end;
    end;
    if vFlag = '8' then
    begin // Libera venda
      vSenha := Senha(EdtSenha.Text,'C');
      with ADOQuery1 do
      begin
        Sql.Text := 'Select S.dsNome,S.cdpessoa,W.nmPessoa From Senha S WITH (NOLOCK),'+
                    'Permissao P WITH (NOLOCK), PESSOA W WITH (NOLOCK)                '+
                    'Where S.dsNome = P.dsNome AND S.cdpessoa = W.cdPessoa and        '+
                    'P.dsnome = :dsnome and S.dsSenha = :dsSenha                      ';
        Parameters.ParamByName('dsnome').Value  := EdtUsuario.Text;
        Parameters.ParamByName('dsSenha').Value := vSenha;
        Open;
        if ADOQuery1.RecordCount = 0 then
        begin // Acesso negado
           // Localiza usu�rio
           Application.OnMessage := FrmPrincipalPreVenda.NaoProcessaMsg;
           MessageDlg('Acesso negado.',mtInformation,[mbOk],0);
           Application.OnMessage := FrmPrincipalPreVenda.ProcessaMsg;
           EdtSenha.SelectAll;
           EdtSenha.SetFocus;
           exit;
        end else
        begin
          try
            if FormCredito = nil then
              FormCredito := TFormCredito.Create(Application); // Cria o formul�rio
            FormCredito.Label3.caption := ADOQuery1.Fieldbyname('nmPessoa').asstring;
            FormCredito.cdVendedor     := ADOQuery1.Fieldbyname('cdPessoa').asInteger;
            FormCredito.monta_creditos;
            FormCredito.ShowModal;
            FreeAndNil(FormCredito);
            PodeFechar := true;
            Close;
          except
            FreeAndNil(FormCredito);
            PodeFechar := true;
            Close;
          end;
        end;
      end;
    end;
    if vFlag = '10' then
    begin
      if Pesquisa_Permissao('622') <> 'N' then
      begin
        Application.OnMessage := FormPrincipal.NaoProcessaMsg;
        FrmPrincipalPreVenda.Enabled := True;
        inserirNoLog('Liberou a altera��o de pre�o do produto na pr� venda', 0);
        //FrmPrincipalPreVenda.BtnConfirmar.SetFocus;
        Application.OnMessage := FormPrincipal.ProcessaMsg;
        MoPreVenda.vMudaPreco:= 'S';
        PodeFechar:= True;
        Close;
      end;
    end;
  end;
end;

procedure TFrmCancelamentoVenda.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  qry : TADOQuery;
begin
  if codigoDaPermissao = '' then
  case StrToInt(vFlag) of
    3,4: FrmcdCliente.Enabled := True;
  end;
  EdtSenha.Clear;
  // no caso do usu�rio pressionar ESC
  if FrmPrincipalPreVenda.idLiberacaoRestrincaoVenda > 0 then
  begin
    qry := TADOQuery.Create(nil);
    qry.Connection := DModulo.Conexao;
    try
      DModulo.Conexao.BeginTrans;
      with qry do
      begin
        sql.Text := 'Delete liberacaoVenda Where id = :numero';
        Parameters.ParamByName('numero').Value := FrmPrincipalPreVenda.idLiberacaoRestrincaoVenda;
        ExecSQL;
      end;
      DModulo.Conexao.CommitTrans;
      FrmPrincipalPreVenda.idLiberacaoRestrincaoVenda := 0;
    except
      DModulo.Conexao.RollbackTrans;
      FrmPrincipalPreVenda.idLiberacaoRestrincaoVenda := 0;
    end;
    FreeAndNil(qry);
  end;
  Action := caFree;
end;

procedure TFrmCancelamentoVenda.F1Ajuda1Click(Sender: TObject);
begin
  Application.HelpContext(0);
end;

function TFrmCancelamentoVenda.Pesquisa_Permissao(vTag: String): String;
var I,J : Integer;
    vSenha     : String[06];
    vPermissao : String[01];
begin
  vPermissao := 'S';
  vSenha := Senha(EdtSenha.Text,'C');
  with ADOQuery1 do
  begin
     Sql.Text := 'Select * From Senha S WITH (NOLOCK) INNER JOIN Permissao P WITH (NOLOCK) '+
                 'ON S.dsNome = P.dsNome                                                   '+
                 'Where P.dsnome = :dsnome                                                 '+
                 'and S.dsSenha = :dsSenha                                                 '+
                 'and P.nrTag = :tag                                                       ';
     Parameters.ParamByName('dsnome').Value  := EdtUsuario.Text;
     Parameters.ParamByName('dsSenha').Value := vSenha;
     Parameters.ParamByName('tag').Value := vTag;
     Open;
     if ADOQuery1.RecordCount = 0 then
     begin // Acesso negado
       // Localiza usu�rio
       Application.OnMessage := FrmPrincipalPreVenda.NaoProcessaMsg;
       MessageDlg('Acesso negado.',mtInformation,[mbOk],0);
       Application.OnMessage := FrmPrincipalPreVenda.ProcessaMsg;
       EdtSenha.SelectAll;
       EdtSenha.SetFocus;
       Pesquisa_Permissao := 'N';
       exit;
     end;
  end; // qry1
  if ADOQuery1.RecordCount <> 0 then
  begin
    if trim(ADOQuery1.FieldByName('dsVisualizar').asString) = '' then
    begin
      vPermissao := 'N';
      EdtSenha.SelectAll;
      EdtSenha.SetFocus;
    end;
  end;
  Pesquisa_Permissao := vPermissao;
end;


function TFrmCancelamentoVenda.Possui_Permissao(vTag,
  letraDaOperacao: string;  _usuario, _senha : string; exibirMensagem : boolean = true): boolean;
var
  I,J : Integer;
  vSenha     : String[06];
  vPermissao : Boolean;
  qry : TADOQuery;
begin
  qry := TADOQuery.Create(nil);
  qry.Connection := DModulo.Conexao;
  vSenha := Senha(_senha,'C');
  with qry do
  begin
    Sql.Text := 'Select * From Senha S WITH (NOLOCK) INNER JOIN Permissao P WITH (NOLOCK) '+
                 'ON S.dsNome = P.dsNome                                                  '+
                 'Where P.dsnome = :dsnome and S.dsSenha = :dsSenha and P.nrTag = :tag    ';
    Parameters.ParamByName('dsnome').Value  := _usuario;
    Parameters.ParamByName('dsSenha').Value := vSenha;
    Parameters.ParamByName('tag').Value := vTag;
    Open;
    if (qry.RecordCount = 0) or
       ((letraDaOperacao = 'N')and(trim(FieldByName('dsIncluir').asString) = ''))or // criar Novo
       ((letraDaOperacao = 'A')and(trim(FieldByName('dsAlterar').asString) = ''))or // Alterar
       ((letraDaOperacao = 'E')and(trim(FieldByName('dsExcluir').asString) = ''))or // Excluir
       ((letraDaOperacao = 'I')and(trim(FieldByName('dsImprimir').asString) = ''))or // Imprimir
       ((letraDaOperacao = 'B')and(trim(FieldByName('dsBaixa').asString) = ''))or   // dar Baixa
       ((letraDaOperacao = 'V')and(trim(FieldByName('dsVisualizar').asString) = ''))   // visualizar
    then
    begin
      if exibirMensagem = true then
      begin
        Application.OnMessage:= FrmPrincipalPreVenda.NaoProcessaMsg;
        MessageDlg('Acesso negado.',mtInformation,[mbOk],0);
        Application.OnMessage:= FrmPrincipalPreVenda.ProcessaMsg;
      end;
      vPermissao:= False;
    end
    else
      vPermissao := True;
    FrmPrincipalPreVenda.vcdAutorizador := FieldByName('cdPessoa').asInteger;
  end;
  FreeAndNil(qry);
  Result := vPermissao;
end;

procedure TFrmCancelamentoVenda.tmr1Timer(Sender: TObject);
var
  qry : TADOQuery;
begin
  if FrmPrincipalPreVenda.idLiberacaoRestrincaoVenda > 0 then
  begin
    qry := TADOQuery.Create(nil);
    qry.Connection := DModulo.Conexao;
    with qry do
    begin
      sql.Text := 'Select id From LiberacaoVenda Where id = :id and liberado = 1';
      Parameters.ParamByName('id').Value := FrmPrincipalPreVenda.idLiberacaoRestrincaoVenda;
      Open;
      if qry.RecordCount > 0 then
      begin
        if codigoDaPermissao = '614' then  // restri��o financeiro
        begin
          FrmPrincipalPreVenda.idLiberacaoRestrincaoVenda := -1;
          FrmPrincipalPreVenda.Enabled := True;
          FrmPrincipalPreVenda.auxiLiberacao := True;
          PodeFechar := True;
          FreeAndNil(qry);
          FrmCancelamentoVenda.Close;
        end else if codigoDaPermissao = '631' then  // venda abaixo do pre�o de custo
        begin
          FrmPrincipalPreVenda.idLiberacaoRestrincaoVenda := -1;
          FrmPrincipalPreVenda.possuiPermissaoVenderAbaixoDoCusto := True;
          FrmPrincipalPreVenda.Enabled := True;
          PodeFechar := True;
          FreeAndNil(qry);
          FrmCancelamentoVenda.Close;
        end else if (codigoDaPermissao = '831') or (codigoDaPermissao = '820') then  // transformar or�amento em pre-venda / alterar pre-venda
        begin
          FrmPrincipalPreVenda.idLiberacaoRestrincaoVenda := -1;
          FrmPrincipalPreVenda.Enabled := True;
          PodeFechar := True;
          resultadoPossuiPermissao^ := True;
          FreeAndNil(qry);
          FrmCancelamentoVenda.Close;
        end else
        begin
          case StrToIntDef(vFlag, 0) of
            0 : // 'Desconto at� o limite';
            begin
              FrmPrincipalPreVenda.idLiberacaoRestrincaoVenda := -1;
              FrmPrincipalPreVenda.Enabled := True;
//              FrmPrincipalPreVenda.liberouVenda := True;
              resultadoPossuiPermissao^ := True;
              if StrToFloatDef(FrmPrincipalPreVenda.EdtQtd.Text, 0) > 0 then
                FrmPrincipalPreVenda.EnviaProdutos;
              PodeFechar := True;
              FreeAndNil(qry);
              FrmCancelamentoVenda.Close;
            end;
            6 : // 'Desconto acima do limite';
            begin
              FrmPrincipalPreVenda.idLiberacaoRestrincaoVenda := -1;
              FrmPrincipalPreVenda.Enabled := True;
              FrmPrincipalPreVenda.liberouVenda := True;
              resultadoPossuiPermissao^ := True;
              PodeFechar := True;
              Application.OnMessage := FormPrincipal.ProcessaMsg;
              FreeAndNil(qry);
              FrmCancelamentoVenda.Close;
            end;
          end;
        end;
      end;
    end;
  end;
end;

procedure TFrmCancelamentoVenda.EdtUsuarioKeyPress(Sender: TObject;
  var Key: Char);
begin
  TeclaNaoNumerica(key);
  if key = Char(27) then
  begin
    FrmPrincipalPreVenda.Enabled := True;
    if (codigoDaPermissao <> '') then
    begin
      resultadoPossuiPermissao^ := False;
      PodeFechar := True;
      if codigoDaPermissao = '614' then
        FrmPrincipalPreVenda.auxiLiberacao := False;
      Close;
//      Exit;
    end else
    begin
      case StrToInt(vFlag) of
        0:
        begin
          FrmPrincipalPreVenda.EdtPreco.Text    := FormatFloat('0.00',FrmPrincipalPreVenda.ADOSPConsulta.FieldByName('Valor').AsFloat);
          FrmPrincipalPreVenda.EdtDescUnit.Text := '0,00';
          FrmPrincipalPreVenda.EdtDesconto.Text := '0,00';
          FrmPrincipalPreVenda.EdtDescUnit.SelectAll;
          FrmPrincipalPreVenda.EdtDescUnit.SetFocus;
          PodeFechar := True;
          Close;
        end;
        1:
        begin
          Application.OnMessage := FormPrincipal.NaoProcessaMsg;
          FrmPrincipalPreVenda.RgOpcoes.ItemIndex := 0;
          Application.OnMessage := FormPrincipal.ProcessaMsg;
          PodeFechar := True;
          close;
        end;
        3,4:
        begin
          FrmcdCliente.Enabled := True;
          PodeFechar := True;
          Close;
          FrmCdCliente.BtnMdCancelarClick(self);
        end;
        5,2,9:
        begin
          PodeFechar := True;
          Close;
        end;
        6:
        begin
          Application.OnMessage := FormPrincipal.NaoProcessaMsg;
          if (MoPreVenda.TestaFinanceiroNaConfirmacao = false) and (FrmPrincipalPreVenda.prevenda <> nil) then
          begin
            FrmPrincipalPreVenda.prevenda.descontoPercentual:= 0;
            if MoPreVenda.vCasasPreco > MoPreVenda.vLimiteCasasPreco then
              FrmPrincipalPreVenda.EdtDesconto.Text := '0,000'
            else
              FrmPrincipalPreVenda.EdtDesconto.Text := '0,00';
            FrmPrincipalPreVenda.EdtDescontoExit(Self);
            FrmPrincipalPreVenda.EdtDesconto.Refresh;
            FrmPrincipalPreVenda.EdtSubTotal.Text := FormatFloat('0.00',TNEGPrevenda.getTotalLiquido(FrmPrincipalPreVenda.prevenda)); //FrmPrincipalPreVenda.EdtTotal.Text;
          end;
          FrmPrincipalPreVenda.EdtQtd.Text := '0';
          FrmPrincipalPreVenda.EdtDescUnit.Text := '0,00';
          FrmPrincipalPreVenda.EdtPreco.Text := FormatFloatQ(vCasasPreco, FrmPrincipalPreVenda.ADOSPConsulta.FieldByName('Valor').AsFloat);
          FrmPrincipalPreVenda.liberouVenda := false;
          vlTotalAnterior := 0;
          PodeFechar := True;
          Application.OnMessage := FormPrincipal.ProcessaMsg;
          Close;
        end;
        7:
        begin
          Application.OnMessage := FormPrincipal.NaoProcessaMsg;
          FrmPrincipalPreVenda.enabled := true;
          FrmPrincipalPreVenda.codigoClienteAtual := '0';
          if StrToIntDef(FrmPrincipalPreVenda.codigoClienteAtual,-1) > 0 then
          begin
            FrmPrincipalPreVenda.SetarClienteNaCombo(FrmPrincipalPreVenda.codigoClienteAtual);
            if UPPERCASE(vEmpresa) = 'GIRORAPIDO' then
              if (FrmPrincipalPreVenda.tipoClienteAtual = 'A') then
              begin //Yes - varejo, Ok - atacado
                vAtacadoVarejo  := 'A';
                FrmPrincipalPreVenda.Label30.caption := 'Cliente -> Atacado';
              end else
              begin
                vAtacadoVarejo  := 'V';
                FrmPrincipalPreVenda.Label30.caption := 'Cliente -> Varejo';
              end;
          end
          else
          begin
  //        FrmPrincipalPreVenda.EdtCdCliente.Clear;
  //        FrmPrincipalPreVenda.CbxCliente.Text := '';
    //      FrmPrincipalPreVenda.cbxCliente.SelectAll;
    //      FrmPrincipalPreVenda.cbxCliente.SetFocus;
          end;
          Application.OnMessage := FormPrincipal.ProcessaMsg;
          PodeFechar := True;
          close;
        end;
        8:
        begin
          Application.OnMessage := FormPrincipal.NaoProcessaMsg;
          FrmPrincipalPreVenda.enabled := true;
          if FrmPrincipalPreVenda.EdtConsulta.Enabled = True then
          begin
            FrmPrincipalPreVenda.EdtConsulta.SelectAll;
            FrmPrincipalPreVenda.EdtConsulta.SetFocus;
          end;
          Application.OnMessage := FormPrincipal.ProcessaMsg;
          PodeFechar := True;
          close;
        end;
        10:
        begin
          Application.OnMessage := FormPrincipal.NaoProcessaMsg;
          FrmPrincipalPreVenda.enabled := true;
          Application.OnMessage := FormPrincipal.ProcessaMsg;
          PodeFechar := True;
          close;
        end;
      end;
    end;
  end;
end;

procedure TFrmCancelamentoVenda.FormCreate(Sender: TObject);
var
  qry : TADOQuery;
  descricao : string;
  desconto, valor : Currency;
begin
  Application.OnMessage := FormPrincipal.ProcessaMsg;
  if Length(FrmPrincipalPreVenda.vUltimo_USUARIO) > 0 then
    EdtUsuario.Text := FrmPrincipalPreVenda.vUltimo_USUARIO;
  EdtSenha.Clear;
  with ADOQuery1 do
  begin
    SQL.Text := 'Select dsnome From senha WITH (NOLOCK) Order by dsnome ';
    MontaComboListADO(ADOQuery1, edtUsuario);
  end;
  if (codigoDaPermissao = '631') or (codigoDaPermissao = '831') or (codigoDaPermissao = '820') or
     (codigoDaPermissao = '614') or (codigoDaPermissao = '615') or (codigoDaPermissao = '613') then
  begin
    valor    := StrToCurrDef(FrmPrincipalPreVenda.EdtSubTotal.Text, 0);
    desconto := StrToCurrDef(FrmPrincipalPreVenda.EdtDesconto.Text, 0);
    label3.Caption := 'Pressione ESC para sair ou aguarde libera��o';
    case StrToIntDef(codigoDaPermissao, 2000) of
      631: descricao := 'Libera��o de pre�o abaixo do custo final';
      831:
      begin
        descricao := 'Trnasformar or�amento em pr� venda';
        valor     := 0;
        desconto  := 0;
      end;
      820:
      begin
        descricao := 'Altera��o de pr� venda';
        desconto  := 0;
      end;
      613: descricao := 'Desconto at� o limite';
      615: descricao := 'Desconto acima do limite';
      614: descricao := 'Libera��o de restri��o financeira';
    else
      descricao := '';
    end;
    qry := TADOQuery.Create(nil);
    qry.Connection := DModulo.Conexao;
    try
      DModulo.Conexao.BeginTrans;
      with qry do
      begin
        if FrmPrincipalPreVenda.idLiberacaoRestrincaoVenda > 0 then
        begin
          sql.Text := 'Update liberacaoVenda set valor = :valor, liberado = 0 Where id = :numero';
          Parameters.ParamByName('numero').Value := FrmPrincipalPreVenda.idLiberacaoRestrincaoVenda;
          Parameters.ParamByName('valor').Value  := StrToCurrDef(FrmPrincipalPreVenda.EdtSubTotal.Text, 0);
          ExecSQL;
        end;
        sql.Text :=
        'Insert into liberacaoVenda (numero, cdPessoa, cdVendedor, data, app, descricao, valor, desconto, liberado, permissao) '+
        'Values (:numero, :cdPessoa, :cdVendedor, :data, ''Pr� Venda'', :descricao, :valor, :desconto, 0, :permissao) Select @@IDENTITY as id';
        Parameters.ParamByName('numero').Value   := FrmPrincipalPreVenda.EdtLancto.Text;
        Parameters.ParamByName('cdPessoa').Value := copy_campo(FrmPrincipalPreVenda.CbxCliente.Text, '|', 2);
        Parameters.ParamByName('cdVendedor').Value := FrmPrincipalPreVenda.EdtCdNome.Text;
        Parameters.ParamByName('data').Value := StrToDateTime(DateToStr(FrmPrincipalPreVenda.PegaDatabanco) + FrmPrincipalPreVenda.pegaHoraBanco);
        Parameters.ParamByName('descricao').Value := descricao;
        Parameters.ParamByName('valor').Value     := valor;
        Parameters.ParamByName('desconto').Value  := desconto;
        Parameters.ParamByName('permissao').Value := codigoDaPermissao;
        open;
        FrmPrincipalPreVenda.idLiberacaoRestrincaoVenda := qry.FieldByName('id').AsInteger;
      end;
      DModulo.Conexao.CommitTrans;
    except
      DModulo.Conexao.RollbackTrans;
    end;
    FreeAndNil(qry);
  end;
end;

procedure TFrmCancelamentoVenda.inserirNoLog(texto: string; valor : Real);
var
  qry : TADOQuery;
  codigo : Integer;
  vSenha : string[06];
  liberacao : TLiveracao;
begin
  qry := TADOQuery.Create(nil);
  codigo := 0;
  vSenha := Senha(EdtSenha.Text,'C');
  with ADOQuery1 do
  begin
    Sql.Text := 'Select S.cdpessoa From Senha S WITH (NOLOCK),         '+
                'Permissao P WITH (NOLOCK), PESSOA W WITH (NOLOCK)     '+
                'Where S.dsNome = P.dsNome AND S.cdpessoa = W.cdPessoa '+
                'and P.dsnome = :dsnome and S.dsSenha = :dsSenha       ';
    Parameters.ParamByName('dsnome').Value  := EdtUsuario.Text;
    Parameters.ParamByName('dsSenha').Value := vSenha;
    Open;
    if RecordCount > 0 then
      codigo := ADOQuery1.FieldByName('cdPessoa').AsInteger;
  end;
  if codigo > 0 then
  begin
    if FrmPrincipalPreVenda.listaLiberacoes = nil then
      FrmPrincipalPreVenda.listaLiberacoes := Tlist<TLiveracao>.Create;
    liberacao := TLiveracao.novo();
    liberacao._descricao := texto;
    liberacao._valor     := valor;
    liberacao._operador  := codigo;
    FrmPrincipalPreVenda.listaLiberacoes.Add(liberacao);
  end;
end;

procedure TFrmCancelamentoVenda.FormActivate(Sender: TObject);
begin
  if (codigoDaPermissao = '') then
  begin
    case StrToInt(vFlag) of
      0: FrmCancelamentoVenda.Caption := 'Desconto at� limite permitido';
      1: FrmCancelamentoVenda.Caption := 'Altera��o da pr� venda';
      2: FrmCancelamentoVenda.Caption := 'Restri��o no financeiro';
      3:
      begin
        FrmCancelamentoVenda.Caption := 'Cadastrar Cliente';
        FrmcdCliente.Label10.Caption := 'Cliente:';
        FrmcdCliente.RgTpVencimento.ItemIndex := 0;
        FrmcdCliente.Enabled := False;
      end;
      4:
      begin
        FrmCancelamentoVenda.Caption := 'Altera��o Cliente';
        FrmcdCliente.Enabled := False;
      end;
      5: FrmCancelamentoVenda.Caption := 'Consulta de cr�dito do  cliente';
      6: FrmCancelamentoVenda.Caption := 'Desconto acima do permitido';
      7,9: FrmCancelamentoVenda.Caption := 'Restri��o no financeiro';
      8: FrmCancelamentoVenda.Caption   := 'Consulta cr�dito vendedor';
      10: FrmCancelamentoVenda.Caption  := 'Libera��o do pre�o do produto';
    end;
    EdtUsuario.SelectAll;
    EdtUsuario.SetFocus;
  end;
end;

procedure TFrmCancelamentoVenda.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := PodeFechar;
end;

end.
