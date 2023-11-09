unit FormaPag;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  NEGCliente, DOMPrevenda,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Menus, Db, ADODB, Vcl.Grids,
  System.Math, System.DateUtils, System.ImageList, Vcl.ImgList;

type
  TFrmFormaPag = class(TForm)
    BtnConfirmar: TBitBtn;
    RadioGroup1: TRadioGroup;
    BtnCancelar: TBitBtn;
    ADOSPLiberacao1: TADOStoredProc;
    ADOSPLiberacao2: TADOStoredProc;
    ADOSPLiberacao3: TADOStoredProc;
    ADOSPLiberacao4: TADOStoredProc;
    PopupMenu1: TPopupMenu;
    Consultadecrditodocliente1: TMenuItem;
    Label1: TLabel;
    Memo1: TMemo;
    Cancelar1: TMenuItem;
    CBXSelecionaProfissionais: TCheckBox;
    CBXProfissional: TComboBox;
    EdtCdProfissional: TEdit;
    AdoQryProfissional: TADOQuery;
    ADOQryProcura: TADOQuery;
    edtEspecie: TEdit;
    edtAcresCartao: TEdit;
    edtVolume: TEdit;
    edtNumero: TEdit;
    edtParcelas: TEdit;
    gridParcelas: TStringGrid;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    chkbxEnviarCopiaEmail: TCheckBox;
    pnlAguardaEnvioEmail: TPanel;
    ImageList1: TImageList;
    lblDifal: TLabel;
    edtDifal: TEdit;
    procedure BtnConfirmarClick(Sender: TObject);
    procedure BtnConfirmarKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnCancelarKeyPress(Sender: TObject; var Key: Char);
    procedure BtnCancelarClick(Sender: TObject);
    procedure Consultadecrditodocliente1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Memo1Enter(Sender: TObject);
    procedure Memo1Exit(Sender: TObject);
    procedure Cancelar1Click(Sender: TObject);
    procedure CBXSelecionaProfissionaisClick(Sender: TObject);
    procedure CBXProfissionalChange(Sender: TObject);
    procedure Memo1KeyPress(Sender: TObject; var Key: Char);
    procedure edtParcelasExit(Sender: TObject);
    procedure edtVolumeKeyPress(Sender: TObject; var Key: Char);
    procedure edtNumeroKeyPress(Sender: TObject; var Key: Char);
    procedure edtParcelasKeyPress(Sender: TObject; var Key: Char);
    procedure RadioGroup1Click(Sender: TObject);
    procedure gridParcelasDblClick(Sender: TObject);
    procedure gridParcelasDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure gridParcelasMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    vSalvar: integer;
    function obrigarProfissional(cnpj: string): Boolean;
    function verificaLimieteCredito: Boolean;
    function ConsultaFinanceiro: Boolean;
    procedure preencherGridParcelas(numParcelas: integer; valor: Real; tipo : string);
    procedure atualizarLinhasGridParcelas;
    procedure reordenarGridParcelas;
    procedure desabilitarFinanceiro;
    procedure alterarLarguraForm(width_: integer);
    procedure habilitarFinanceiro;
    function getObservacoesAdicionais: string;
    function ValidarCliente: Boolean;
    function ValidarDesconto(prevenda: TPrevenda): Boolean;
    function ValidarDesconto_PROAUTO: Boolean;
    function getCodigoFormaPagamento: string;
  public
    { Public declarations }
  end;

var
  FrmFormaPag: TFrmFormaPag;

implementation

uses MoPreVenda, DataModulo, uFuncoesPadrao, CancelamentoVenda, UItemPrevenda, NEGPrevenda;

{$R *.dfm}

{ Retorna as parcelas, espécie, marca, volume, número que são impressos na prevenda }
function TFrmFormaPag.getCodigoFormaPagamento: string;
begin
  case RadioGroup1.ItemIndex of
    0:
      Result := '0'; // a vista
    1:
      Result := '1'; // a prazo
    2:
      Result := '2'; // Cartão a Vista
    3:
      Result := '3'; // Cartão Parcelado
    4:
      Result := '4'; // Cheque Pré
    5:
      Result := '5'; // Entrada + Prazo
    6:
      Result := '6'; // Entrada + Cartao
    7:
      Result := '7'; // Entrada + Cheque Pré
    8:
      Result := '12'; // Cheque a Vista
    9:
      Result := '13'; // Cartão Débito
    10:
      Result := '14'; // Depósito em Conta
    11:
      Result := '15'; // Boleto Bancário
  end;
end;

function TFrmFormaPag.getObservacoesAdicionais: string;
var
  resultado: AnsiString;
  i: integer;
begin
  resultado := '';
  for i := 1 to (gridParcelas.RowCount - 1) do
  begin
    if Trim(gridParcelas.Cells[1, i]) = '' then
      Break;
    if Trim(resultado) = '' then
      resultado := 'Boleto: Vct. ' + StringReplace(gridParcelas.Cells[3, i],
        '/', '.', [rfReplaceAll]) + ' '
    else
      resultado := resultado + '/ ' + StringReplace(gridParcelas.Cells[3, i],
        '/', '.', [rfReplaceAll]) + ' ';
  end;
  if Trim(resultado) <> '' then
    resultado := resultado + #13#10;
  resultado := resultado + 'Espécie: ' + edtEspecie.text + '  Marca: ' +
    edtAcresCartao.text + '  Volume: ' + edtVolume.text + '  Número: ' +
    edtNumero.text;
  Result := resultado;
end;

procedure TFrmFormaPag.BtnConfirmarClick(Sender: TObject);
var
  L, vTeste, i: integer;
  vSimplesRemessa: integer;
  acrescimoCartao : Real;
begin
  try
    BtnConfirmar.Enabled := False;
    if (obrigarProfissional(SoNumeros(FrmPrincipalPreVenda.dsCGC))) and
      (EdtCdProfissional.text = '') then
    begin
      Application.MessageBox('Obrigatório selecionar um profissional', 'Atenção',
        MB_OK + MB_ICONWARNING + MB_APPLMODAL);
      BtnConfirmar.Enabled := True;
      exit;
    end;
    if not FrmPrincipalPreVenda.requisitosAtendidos then
    begin
      BtnConfirmar.Enabled := True;
      exit;
    end;
    if not ValidarCliente then
    begin
      BtnConfirmar.Enabled := True;
      exit;
    end;
    if not ValidarDesconto_PROAUTO then
    begin
      BtnConfirmar.Enabled := True;
      exit;
    end;
    if not ValidarDesconto(FrmPrincipalPreVenda.prevenda) then
    begin
      BtnConfirmar.Enabled := True;
      exit;
    end;
    vMemo := Memo1;
    vTime := FrmPrincipalPreVenda.getHoraServidor;
    if (FrmPrincipalPreVenda.RgOpcoes.ItemIndex = 1) and  // Se for alteração de um orçamento
       (FrmPrincipalPreVenda.Verifica_PREVENDA_SALVANOCAIXA = False) then
    begin
      MessageDlg('Esta pre-venda já está confirmada no caixa então não será possível salva-la!',
        mtWarning, [mbOk], 0);
      BtnConfirmar.Enabled := True;
      exit;
    end;
    if StrToCurrDef(edtAcresCartao.Text, 0) > StrToCurr(FrmPrincipalPreVenda.EdtSubTotal.Text) then
    begin
      FrmPrincipalPreVenda.EdtSubTotal.Text := edtAcresCartao.Text;
      FrmPrincipalPreVenda.EdtSubTotal.Refresh;
      // como alteramos o valor por conta das parcelas do cartão,
      // tenho que mudar essa proproedade para reclacular o acrescimo desses items que tiveram desconto no valor
      for i := 0 to FrmPrincipalPreVenda.prevenda.itens.Count - 1 do
      begin
        FrmPrincipalPreVenda.prevenda.itens[i].Promocao_desconto_Item := False;
      end;
      FrmPrincipalPreVenda.Recalcula_Desconto;
    end;
    if vOrcamento = 'O' then
      FrmPrincipalPreVenda.prevenda.isOrcamento := True
    else
      FrmPrincipalPreVenda.prevenda.isOrcamento := False;
    FrmPrincipalPreVenda.formaPagamentoImp := RadioGroup1.Items.Strings
      [RadioGroup1.ItemIndex];
    FrmPrincipalPreVenda.prevenda.codigoFormaPagamento := getCodigoFormaPagamento;
    FrmPrincipalPreVenda.prevenda.codigoDoProfissional :=
      StrToIntDef(EdtCdProfissional.text, 0);
    FrmPrincipalPreVenda.prevenda.observacao := Memo1.text;
    FrmPrincipalPreVenda.SalvarPreVenda(FrmPrincipalPreVenda.prevenda,
      chkbxEnviarCopiaEmail.Checked);
    Application.OnMessage := FrmPrincipalPreVenda.ProcessaMsg;
  finally
    BtnConfirmar.Enabled := true;
  end;
  Close;
end;

procedure TFrmFormaPag.BtnConfirmarKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = Char(27) then
  begin
    FrmPrincipalPreVenda.EdtPreco.text :=
      FormatFloat('0.00', FrmPrincipalPreVenda.ADOSPConsulta.FieldByName
      ('Valor').AsFloat);
    FrmPrincipalPreVenda.EdtConsulta.SetFocus;
    Application.OnMessage := FrmPrincipalPreVenda.ProcessaMsg;
    Close;
  end;
end;

procedure TFrmFormaPag.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // if FrmPrincipalPreVenda.CbxCliente.Enabled = true then begin
  // if vEmpresa = 'VAREJAO' then
  // FrmPrincipalPreVenda.CbxCliente.SetFocus
  // else begin
  // FrmPrincipalPreVenda.CbxCliente.SetFocus; // thiago
  // {FrmPrincipalPreVenda.CbxCliente.ItemIndex := 0;
  // FrmPrincipalPreVenda.CbxClienteChange(Self);
  /// /      FrmPrincipalPreVenda.CbxCliente.SetFocus;
  // FrmPrincipalPreVenda.EdtUsuario.SelectAll;
  // FrmPrincipalPreVenda.EdtUsuario.SetFocus;}
  // end;
  // end;
  Application.OnMessage := FrmPrincipalPreVenda.ProcessaMsg;
  Action := cafree;
end;

procedure TFrmFormaPag.BtnCancelarKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = Char(27) then
  begin
    FrmPrincipalPreVenda.EdtPreco.text :=
      FormatFloat('0.00', FrmPrincipalPreVenda.ADOSPConsulta.FieldByName
      ('Valor').AsFloat);
    FrmPrincipalPreVenda.EdtConsulta.SetFocus;
    Application.OnMessage := FrmPrincipalPreVenda.ProcessaMsg;
    Close;
  end;
end;

procedure TFrmFormaPag.BtnCancelarClick(Sender: TObject);
begin
  FrmPrincipalPreVenda.EdtConsulta.SetFocus;
  Close;
end;

procedure TFrmFormaPag.Consultadecrditodocliente1Click(Sender: TObject);
begin
  if BtnConfirmar.Enabled = True then
    BtnConfirmarClick(Self);
end;

function TFrmFormaPag.ConsultaFinanceiro: Boolean;
var
  vEmAberto, vCheques, vChDevolvido, vAtraso, vteste1, vlimite: Real;
  vAuxi: Char;
begin
  ConsultaFinanceiro := False;
  if Trim(UpperCase(copy_campo(FrmPrincipalPreVenda.CbxCliente.text, '|', 1)))
    <> 'VENDA A CONSUMIDOR' then
  begin // testo somente se não for venda a consumidor
    // vauxi := 'N';
    case RadioGroup1.ItemIndex of
      1, 4, 5, 7, 10, 11:
        begin // prazo
          vteste1 := 0;
          vlimite := 0;
          vChDevolvido := 0;
          vAtraso := 0;
          With ADOSPLiberacao1 do
          begin // pega o limite de crédito do cliente
            Close;
            Parameters.ParamByName('@Codigo_Cliente').Value :=
              copy_campo(FrmPrincipalPreVenda.CbxCliente.text, '|', 2);
            open;
            vlimite := FieldByName('dsLimCredito').AsFloat;
          end;
          if FrmPrincipalPreVenda.vCliDevedor = 'S' then
          begin // Cliente em atraso
            With ADOSPLiberacao2 do
            begin
              // pega todas as contas abertas e as duplicatas em atraso
              Close;
              Parameters.ParamByName('@CODIGO_CLIENTE').Value :=
                copy_campo(FrmPrincipalPreVenda.CbxCliente.text, '|', 2);
              Parameters.ParamByName('@DATA').Value :=
                DateToStr(Date - vDtBloqueio);
              open;
              vAtraso := FieldByName('Saldo').AsFloat;
              if vAtraso > 0 then
                vAuxi := 'S';
              next;
              vteste1 := FieldByName('Saldo').AsFloat;
            end;
          end;
          if FrmPrincipalPreVenda.vLimCredito = 'S' then
          begin // Limite de crédito
            With ADOSPLiberacao3 do
            begin
              Close;
              vEmAberto := vteste1; // valor de todas as duplicatas em aberto
              Parameters.ParamByName('@CODIGO').Value :=
                copy_campo(FrmPrincipalPreVenda.CbxCliente.text, '|', 2);
              open;
              vCheques := FieldByName('Saldo2').AsFloat;
              vteste1 := vteste1 + vCheques +
                StrToFloat(FrmPrincipalPreVenda.EdtSubTotal.text);
              if vteste1 > vlimite then // verifica o limite de crédito
                vAuxi := 'S';
            end;
          end;
          if FrmPrincipalPreVenda.vCheqDev = 'S' then
          begin // Cheque devolvido
            if (UpperCase(vEmpresa) = 'DISCABOS') and
              (RadioGroup1.ItemIndex = 4) or (RadioGroup1.ItemIndex = 8) and
              (Trim(UpperCase(copy_campo(FrmPrincipalPreVenda.CbxCliente.text,
              '|', 1))) = 'VENDA A CONSUMIDOR') then
            // NA DISCABOS CHEQUE A VISTA N PRECISA TESTAR SE O CLIENTE POSSUI CHEQUE DEVOLVIDO
              // PORQ ELES USAM O CHEQUE CHEQUE
            else
            begin
              With ADOSPLiberacao4 do
              begin
                Close;
                Parameters.ParamByName('@CODIGO').Value :=
                  copy_campo(FrmPrincipalPreVenda.CbxCliente.text, '|', 2);
                open;
                vChDevolvido := FieldByName('Saldo').AsFloat;
                if vChDevolvido > 0 then
                  vAuxi := 'S';
                Close;
              end;
            end;
          end;
        end;
    end;
  end
  else
  begin
    vAuxi := 'N'; // venda a consumidor
    if RadioGroup1.ItemIndex in [1, 4, 5, 7, 10, 11] then
    begin
      ConsultaFinanceiro := True;
      MessageDlg
        ('Essa forma de pagamento só é liberado para um cliente já cadastrado!',
        mtWarning, [mbOk], 0);
      exit;
    end;
  end;
  if vAuxi = 'S' then
  begin
    ConsultaFinanceiro := True;
    Application.OnMessage := FrmPrincipalPreVenda.NaoProcessaMsg;
    vFlag := '2';
    FrmPrincipalPreVenda.LiberaVanda;
    Application.OnMessage := FrmPrincipalPreVenda.ProcessaMsg;
  end;
end;

procedure TFrmFormaPag.edtNumeroKeyPress(Sender: TObject; var Key: Char);
begin
  ValidarInteiro(Key);
end;

procedure TFrmFormaPag.edtParcelasExit(Sender: TObject);
begin
//  preencherGridParcelas(StrToInt(edtParcelas.text),
//    StrToFloat(FrmPrincipalPreVenda.EdtSubTotal.text));
end;

procedure TFrmFormaPag.edtParcelasKeyPress(Sender: TObject; var Key: Char);
begin
  ValidarInteiro(Key);
end;

procedure TFrmFormaPag.edtVolumeKeyPress(Sender: TObject; var Key: Char);
begin
  ValidarInteiro(Key);
end;

procedure TFrmFormaPag.alterarLarguraForm(width_: integer);
begin
  Self.Width := width_;
end;

procedure TFrmFormaPag.desabilitarFinanceiro;
begin
  edtEspecie.Clear;
  edtEspecie.Enabled := False;
  edtAcresCartao.Clear;
  edtAcresCartao.Enabled := False;
  edtVolume.Clear;
  edtVolume.Enabled := False;
  edtNumero.Clear;
  edtNumero.Enabled := False;
  edtParcelas.Clear;
  edtParcelas.Enabled := False;
  Limpa_Grid(gridParcelas);
  gridParcelas.Enabled := False;
end;

procedure TFrmFormaPag.habilitarFinanceiro;
begin
  edtEspecie.Clear;
  edtEspecie.Enabled := True;
  edtAcresCartao.Clear;
  edtAcresCartao.Enabled := True;
  edtVolume.Clear;
  edtVolume.Enabled := True;
  edtNumero.Clear;
  edtNumero.Enabled := True;
  edtParcelas.Clear;
  edtParcelas.Enabled := True;
  Limpa_Grid(gridParcelas);
  gridParcelas.Enabled := True;
end;

procedure TFrmFormaPag.FormCreate(Sender: TObject);
var
  texto: string;
begin
  if (UpperCase(vEmpresa) = 'TRESLEOES') then
  begin
    lblDifal.Visible := True;
    edtDifal.Visible := True;
    edtDifal.Text := FrmPrincipalPreVenda.calcularDIFAL;
  end;
  if obrigarProfissional(FrmPrincipalPreVenda.dsCGC) then
    CBXSelecionaProfissionais.Checked := True;
  preencherGridParcelas(1, StrToCurrDef(FrmPrincipalPreVenda.EdtSubTotal.Text, 0), '');
  if FrmPrincipalPreVenda.selecionarParcelasCartao then
  begin
    RadioGroup1.ItemIndex := 0;
    edtAcresCartao.Text := FrmPrincipalPreVenda.EdtSubTotal.Text;
    edtParcelas.Text := '1x';
  end
  else
  begin
    desabilitarFinanceiro;
    alterarLarguraForm(370); // width normal = 686
    BtnConfirmar.Left := 94;
    BtnCancelar.Left := 183;
  end;
  if (UpperCase(vEmpresa) = 'JNUNES') then
  begin
    chkbxEnviarCopiaEmail.Visible := True;
  end;
  texto := FrmPrincipalPreVenda.ADOQryProcura.SQL.text;
  if FrmPrincipalPreVenda.RgOpcoes.ItemIndex = 1 then
  begin // alteracao de prevenda
    if Length(FrmPrincipalPreVenda.prevenda.codigoFormaPagamento) > 0 then
      RadioGroup1.ItemIndex :=
        StrToInt(FrmPrincipalPreVenda.prevenda.codigoFormaPagamento)
    else
      RadioGroup1.ItemIndex := 0;
  end;
  if vObs <> '' then
    Memo1.text := vObs
  else if (UpperCase(vEmpresa) = 'SEMPRE') then
  begin // SOMENTE PARA SEMPRE MATERIAIS DE CONSTRUÇÃO E CAMARATUBA
    with DModulo.ADOQuery1 do
    begin
      SQL.text :=
        'Select dsMemo From Pessoa P with (nolock) Where cdPessoa = :CODIGO';
      Parameters.ParamByName('CODIGO').Value :=
        FrmPrincipalPreVenda.EdtCdCliente.text;
      open;
      Memo1.text := DModulo.ADOQuery1.FieldByName('dsMemo').AsString;
      DModulo.ADOQuery1.Close;
    end;
  end else
  begin
    with DModulo.ADOQuery1 do
    begin
      SQL.text := 'Select dsPreVenda From cliente with (nolock) Where cdPessoa = :CODIGO';
      Parameters.ParamByName('CODIGO').Value := FrmPrincipalPreVenda.EdtCdCliente.text;
      open;
      if RecordCount > 0 then
        Memo1.lines.Add(DModulo.ADOQuery1.FieldByName('dsPreVenda').AsString);
      DModulo.ADOQuery1.Close;
    end;
  end;
  // montando a combo dos profissionais
  with AdoQryProfissional do
  begin
    SQL.text :=
      'select P.nmPessoa, Pr.cdPessoa from pessoa P WITH (NOLOCK) inner join ' +
      'Profissional PR WITH (NOLOCK)  on P.cdPessoa = PR.cdPessoa where P.dsAtivo = ''S''';
  end;
  MontaComboListBoolADO(AdoQryProfissional, CBXProfissional);
  if FrmPrincipalPreVenda.prevenda.codigoDoProfissional > 0 then
  begin
    CBXSelecionaProfissionais.Checked := True;
    EdtCdProfissional.Text := IntToStr(FrmPrincipalPreVenda.prevenda.codigoDoProfissional);
    CBXProfissional.Text   := TNEGPrevenda.getNomeProfissional(FrmPrincipalPreVenda.prevenda.numeroPrevenda);
  end;
end;

procedure TFrmFormaPag.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = Char(27) then
  begin
    FrmPrincipalPreVenda.EdtPreco.text :=
      FormatFloat('0.00', FrmPrincipalPreVenda.ADOSPConsulta.FieldByName
      ('Valor').AsFloat);
    FrmPrincipalPreVenda.EdtConsulta.SetFocus;
    Application.OnMessage := FrmPrincipalPreVenda.ProcessaMsg;
    Close;
  end;
end;

procedure TFrmFormaPag.gridParcelasDblClick(Sender: TObject);
begin
  edtParcelas.Text    := gridParcelas.Cells[0, gridParcelas.Row];
  edtAcresCartao.Text := gridParcelas.Cells[1, gridParcelas.Row];
  gridParcelas.Cells[3, gridParcelas.Row] := '1';
end;

procedure TFrmFormaPag.gridParcelasDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  Re: TRect;
begin
  if (Acol = 3) and (ARow > 0) then
  begin
    if gridParcelas.Cells[3, ARow] = '1' then
      ImageList1.Draw(gridParcelas.Canvas, Rect.Left + 1 , Rect.Top +2 , 0)
    else if gridParcelas.Cells[3, ARow] = ' ' then
      ImageList1.Draw(gridParcelas.Canvas, Rect.Left + 1 , Rect.Top +2 , 1);
  end;
end;

procedure TFrmFormaPag.gridParcelasMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  linha, i : integer;
begin
  if gridParcelas.Cells[3, gridParcelas.row] = '1' then
  begin
    gridParcelas.Cells[3, gridParcelas.row] := ' ';
//    edtParcelas.Text    := '2x';
//    edtAcresCartao.Text := FrmPrincipalPreVenda.EdtSubTotal.Text;
    edtParcelas.Text    := gridParcelas.Cells[0, gridParcelas.Row];
    edtAcresCartao.Text := gridParcelas.Cells[1, gridParcelas.Row];
  end else if gridParcelas.Cells[3, gridParcelas.row] = ' ' then
  begin
    gridParcelas.Cells[3, gridParcelas.row] := '1';
    edtParcelas.Text    := gridParcelas.Cells[0, gridParcelas.Row];
    edtAcresCartao.Text := gridParcelas.Cells[1, gridParcelas.Row];
    linha := gridParcelas.Row;
    for i := 1 to gridParcelas.RowCount -1 do // desmarca o checked das demais linhas
    begin
      if i <> linha then
        gridParcelas.Cells[3, i] := ' ';
    end;
  end;
end;

procedure TFrmFormaPag.Memo1Enter(Sender: TObject);
begin
  Application.OnMessage := FrmPrincipalPreVenda.NaoProcessaMsg;
end;

procedure TFrmFormaPag.Memo1Exit(Sender: TObject);
begin
  Application.OnMessage := FrmPrincipalPreVenda.ProcessaMsg;
end;

procedure TFrmFormaPag.Cancelar1Click(Sender: TObject);
begin
  Close;
end;

function TFrmFormaPag.verificaLimieteCredito: Boolean;
begin
  verificaLimieteCredito := True;
  Application.OnMessage := FrmPrincipalPreVenda.NaoProcessaMsg;
  if FrmCancelamentoVenda = nil then
    FrmCancelamentoVenda := TFrmCancelamentoVenda.Create(Application);
  // Cria o formulário
  vFlag := '7';
  FrmCancelamentoVenda.Position := poDefaULTPosOnly;
  try
    FrmCancelamentoVenda.ShowModal;
    FreeAndNil(FrmCancelamentoVenda);
  except
    FreeAndNil(FrmCancelamentoVenda);
  end;
  Application.OnMessage := FrmPrincipalPreVenda.ProcessaMsg;
end;

procedure TFrmFormaPag.CBXSelecionaProfissionaisClick(Sender: TObject);
begin
  if CBXSelecionaProfissionais.Checked then
  begin
    CBXProfissional.Visible := True;
    EdtCdProfissional.Visible := True;
  end
  else
  begin
    CBXProfissional.Visible := False;
    EdtCdProfissional.Visible := False;
    EdtCdProfissional.Clear;
  end;
end;

procedure TFrmFormaPag.CBXProfissionalChange(Sender: TObject);
begin
  if CBXProfissional.ItemIndex <> -1 then
  begin
    AdoQryProfissional.open;
    AdoQryProfissional.Locate('nmPessoa', CBXProfissional.text, []);
    EdtCdProfissional.text := AdoQryProfissional.FieldByName
      ('cdPessoa').AsString;
  end;
end;

procedure TFrmFormaPag.Memo1KeyPress(Sender: TObject; var Key: Char);
begin
  if (Memo1.Lines.Count > 5) and (Key <> #8) then // 8 é o backSpace
    Key := #0
  else
    Key := UpCase(Key);
end;

function TFrmFormaPag.obrigarProfissional(cnpj: string): Boolean;
begin
  if cnpj = '26388902000130' then
    Result := True
  else
    Result := False;
end;

procedure TFrmFormaPag.preencherGridParcelas(numParcelas: integer; valor: Real; tipo : string);
var
  valorParcela, resto: Currency;
  debito, parc1, parc2, parc3, parc4, parc5, parc6,
  parc7, parc8, parc9, parc10, parc11, parc12 : Currency;
  soma_Aliquotas : Currency;
  i: integer;
  qry : TADOQuery;
begin
  Limpa_Grid(gridParcelas);
  qry := TADOQuery.Create(nil);
  soma_Aliquotas := 0;
  with qry do
  begin
    Connection := DModulo.Conexao;
    SQL.Text :=
    'Select ISNULL(nrPgCartaoDebito, 0) Deb, ISNULL(nrPgCartao1Vez,0) umV, ISNULL(nrPgCartao2Vezes,0) doisV, ISNULL(nrPgCartao3Vezes,0) tresV, '+
    'ISNULL(nrPgCartao4Vezes,0) quatroV, ISNULL(nrPgCartao5Vezes,0) cincoV, ISNULL(nrPgCartao6Vezes,0) seisV, ISNULL(nrPgCartao7Vezes,0) seteV,'+
    'ISNULL(nrPgCartao8Vezes,0) oitoV, ISNULL(nrPgCartao9Vezes,0) noveV, ISNULL(nrPgCartao10Vezes,0) dezV, ISNULL(nrPgCartao11Vezes,0) onzeV,  '+
    'ISNULL(nrPgCartao12Vezes,0) dozeV From Configuracao with (nolock)';
    Open;
    debito := FieldByName('Deb').AsCurrency / 100;
    parc1  := FieldByName('umV').AsCurrency / 100;
    parc2  := FieldByName('doisV').AsCurrency / 100;
    parc3  := FieldByName('tresV').AsCurrency / 100;
    parc4  := FieldByName('quatroV').AsCurrency / 100;
    parc5  := FieldByName('cincoV').AsCurrency / 100;
    parc6  := FieldByName('seisV').AsCurrency / 100;
    parc7  := FieldByName('seteV').AsCurrency / 100;
    parc8  := FieldByName('oitoV').AsCurrency / 100;
    parc9  := FieldByName('noveV').AsCurrency / 100;
    parc10 := FieldByName('dezV').AsCurrency / 100;
    parc11 := FieldByName('onzeV').AsCurrency / 100;
    parc12 := FieldByName('dozeV').AsCurrency / 100;
    soma_Aliquotas := debito + parc1 + parc2 + parc3 + parc4 + parc5 + parc6 + parc7 + parc8 + parc9 + parc10 + parc11 + parc12;
  end;
  if tipo = '' then
  begin
    with gridParcelas do
    begin
      gridParcelas.RowCount := 2;
      Cells[0, 0] := 'Parc';
      Cells[1, 0] := 'Valor';
      Cells[2, 0] := 'Valor Parcela';
      Cells[0, 1] := '1x';
      Cells[1, 1] := FormatFloatQ(2, valor);
      Cells[2, 1] := FormatFloatQ(2, valor);
    end;
  end else if (tipo = 'DEBITO') and (numParcelas = 1) then
  begin
    with gridParcelas do
    begin
      RowCount := 2;
      Cells[1, 0] := 'Valor';
      Cells[2, 0] := 'Valor Parcela';
      Cells[0, 1] := 'Deb';
      Cells[1, 1] := FormatFloatQ(2, valor * (1 + debito));
      Cells[2, 1] := FormatFloatQ(2, (valor * (1 + debito)));
    end;
  end else if (tipo = 'CARTAO') and (numParcelas = 1) then
  begin
    with gridParcelas do
    begin
      RowCount := 2;
      Cells[1, 0] := 'Valor';
      Cells[2, 0] := 'Valor Parcela';
      Cells[0, 1] := '1x';
      Cells[1, 1] := FormatFloatQ(2, valor * (1 + parc1));
      Cells[2, 1] := FormatFloatQ(2, (valor * (1 + parc1)));
    end;
  end else
  begin
    with gridParcelas do
    begin
      gridParcelas.RowCount := 12;
      Cells[0, 0]  := 'Parc';
      Cells[1, 0]  := 'Valor';
      Cells[2, 0]  := 'Valor Parcela';
      Cells[0, 1]  := '2x';
      Cells[0, 2]  := '3x';
      Cells[0, 3]  := '4x';
      Cells[0, 4]  := '5x';
      Cells[0, 5]  := '6x';
      Cells[0, 6]  := '7x';
      Cells[0, 7]  := '8x';
      Cells[0, 8]  := '9x';
      Cells[0, 9]  := '10x';
      Cells[0, 10] := '11x';
      Cells[0, 11] := '12x';
    end;
    for i := 2 to numParcelas do
    begin
      if (soma_Aliquotas > 0) and ((vAtacadoVarejo = 'A') or (vAtacadoVarejo = 'V')) then // diferente de CONSTRUFORT
      begin
        with gridParcelas do
        begin
          Cells[3, i-1] := ' ';
          case i of
//            1 :  // 1v selecionar cartão a vista (vencimento)
//            begin
//              Cells[1, i] := FormatFloatQ(2, valor * (1 + parc1));
//              Cells[2, i] := FormatFloatQ(2, (valor * (1 + parc1)));
//            end;
            2 :
            begin
              Cells[1, i-1] := FormatFloatQ(2, valor * (1 + parc2));
              Cells[2, i-1] := FormatFloatQ(2, (valor * (1 + parc2))/(i));
            end;
            3 :
            begin
              Cells[1, i-1] := FormatFloatQ(2, valor * (1 + parc3));
              Cells[2, i-1] := FormatFloatQ(2, (valor * (1 + parc3))/(i));
            end;
            4 :
            begin
              Cells[1, i-1] := FormatFloatQ(2, valor * (1 + parc4));
              Cells[2, i-1] := FormatFloatQ(2, (valor * (1 + parc4))/(i));
            end;
            5 :
            begin
              Cells[1, i-1] := FormatFloatQ(2, valor * (1 + parc5));
              Cells[2, i-1] := FormatFloatQ(2, (valor * (1 + parc5))/(i));
            end;
            6 :
            begin
              Cells[1, i-1] := FormatFloatQ(2, valor * (1 + parc6));
              Cells[2, i-1] := FormatFloatQ(2, (valor * (1 + parc6))/(i));
            end;
            7 :
            begin
              Cells[1, i-1] := FormatFloatQ(2, valor * (1 + parc7));
              Cells[2, i-1] := FormatFloatQ(2, (valor * (1 + parc7))/(i));
            end;
            8 :
            begin
              Cells[1, i-1] := FormatFloatQ(2, valor * (1 + parc8));
              Cells[2, i-1] := FormatFloatQ(2, (valor * (1 + parc8))/(i));
            end;
            9 :
            begin
              Cells[1, i-1] := FormatFloatQ(2, valor * (1 + parc9));
              Cells[2, i-1] := FormatFloatQ(2, (valor * (1 + parc9))/(i));
            end;
            10 :
            begin
              Cells[1, i-1] := FormatFloatQ(2, valor * (1 + parc10));
              Cells[2, i-1] := FormatFloatQ(2, (valor * (1 + parc10))/(i));
            end;
            11 :
            begin
              Cells[1, i-1] := FormatFloatQ(2, valor * (1 + parc11));
              Cells[2, i-1] := FormatFloatQ(2, (valor * (1 + parc11))/(i));
            end;
            12 :
            begin
              Cells[1, i-1] := FormatFloatQ(2, valor * (1 + parc12));
              Cells[2, i-1] := FormatFloatQ(2, (valor * (1 + parc12))/(i));
            end;
          end;
        end;
      end else
      begin
        with gridParcelas do
        begin
          Cells[1, i-1] := FormatFloatQ(2, valor );
          Cells[2, i-1] := FormatFloatQ(2, (valor / i));
          Cells[3, i-1] := ' ';
        end;
      end;
    end;
  end;
  edtParcelas.Text    := gridParcelas.Cells[0,1]; //'1x';
  edtAcresCartao.Text := gridParcelas.Cells[1,1]; //FrmPrincipalPreVenda.EdtSubTotal.Text;
  gridParcelas.Cells[3,1] := '1';
end;

procedure TFrmFormaPag.RadioGroup1Click(Sender: TObject);
begin
  if FrmPrincipalPreVenda.selecionarParcelasCartao then
  begin
    case RadioGroup1.ItemIndex of
      0,1,4,5,7,8,10,11 :
        preencherGridParcelas(1, StrToCurrDef(FrmPrincipalPreVenda.EdtSubTotal.Text, 0), '');
      2 : preencherGridParcelas(1, StrToCurrDef(FrmPrincipalPreVenda.EdtSubTotal.Text, 0), 'CARTAO');
      9 : preencherGridParcelas(1, StrToCurrDef(FrmPrincipalPreVenda.EdtSubTotal.Text, 0), 'DEBITO');
    else
      preencherGridParcelas(12, StrToCurrDef(FrmPrincipalPreVenda.EdtSubTotal.Text, 0), 'CARTAO');
    end;
//    edtParcelas.Text    := gridParcelas.Cells[1,1]; //'1x';
//    edtAcresCartao.Text := FrmPrincipalPreVenda.EdtSubTotal.Text;
  end;
end;

{ Ordenar a gridParcelas pelo vencimento das parcelas }
procedure TFrmFormaPag.reordenarGridParcelas;
var
  i, j: integer;
  data_, dataSeguinte: TDateTime;
  strData, strValor, strDias: string;
begin
  for i := 1 to (gridParcelas.RowCount - 2) do
    for j := 1 to (gridParcelas.RowCount - 2) do
    begin
      if Trim(gridParcelas.Cells[3, j + 1]) = '' then
        continue;
      data_ := StrToDate(gridParcelas.Cells[3, j]);
      dataSeguinte := StrToDate(gridParcelas.Cells[3, j + 1]);
      if data_ > dataSeguinte then
      begin
        strDias := gridParcelas.Cells[0, j];
        strValor := gridParcelas.Cells[2, j];
        strData := gridParcelas.Cells[3, j];
        gridParcelas.Cells[0, j] := gridParcelas.Cells[0, j + 1];
        gridParcelas.Cells[2, j] := gridParcelas.Cells[2, j + 1];
        gridParcelas.Cells[3, j] := gridParcelas.Cells[3, j + 1];
        gridParcelas.Cells[0, j + 1] := strDias;
        gridParcelas.Cells[2, j + 1] := strValor;
        gridParcelas.Cells[3, j + 1] := strData;
      end;
    end;
end;

function TFrmFormaPag.ValidarCliente: Boolean;
var
  restricaoFinanceira: TListaRestricao;
  clienteComRestricaoFinanceira: Boolean;
  limiteDeCredito: currency;
  codigoCliente: integer;
begin
  // Vou testar a situação financeira do cliente  // so faz teste do financeiro se for prevenda
  if (pos('CONSUMIDOR',
    UpperCase(copy_campo(FrmPrincipalPreVenda.CbxCliente.text, '|', 1))) > 0)
    and (RadioGroup1.ItemIndex = 1) and (FrmPrincipalPreVenda.RgOpcoes.ItemIndex
    in [0, 5]) then
  begin
    MessageDlg
      ('Não é possível fazer uma venda a prazo para um cliente não cadastrado!',
      mtWarning, [mbOk], 0); // KENNETH
    exit;
  end;
  if (not(RadioGroup1.ItemIndex in [0, 2, 3, 6, 7, 9, 10])) and
    (FrmPrincipalPreVenda.ADOQryCliente.FieldByName('dsVista').AsString = 'S')
  then
  begin
    MessageDlg
      ('Está definido para este cliente em seu cadastro, para venda somente A VISTA!',
      mtWarning, [mbOk], 0);
    exit;
  end;
  codigoCliente :=
    StrToInt(copy_campo(FrmPrincipalPreVenda.CbxCliente.text, '|', 2));

  clienteComRestricaoFinanceira :=
    FrmPrincipalPreVenda.clienteComRestricaoFinanceira(restricaoFinanceira,
    FrmPrincipalPreVenda.EdtSubTotal.text);
  limiteDeCredito := TNegcliente.getLimiteCredito(codigoCliente);

  { Se tiver restrição financeira e não for a vista, pede senha }
  if ((clienteComRestricaoFinanceira) AND
    (FrmPrincipalPreVenda.auxiLiberacao = False) AND
    (RadioGroup1.ItemIndex IN [1, 5, 11]) AND
    (FrmPrincipalPreVenda.vTeste_do_Financeiro = '1')
    // testar na prevenda = 1, testar na baixa = 0
    OR ((limiteDeCredito = 0) AND (RadioGroup1.ItemIndex in [1, 5, 11]) AND
    (FrmPrincipalPreVenda.auxiLiberacao = False)) OR
    ((MoPreVenda.TestaFinanceiroNaConfirmacao) AND (RadioGroup1.ItemIndex in [1,
    5, 11]) AND (clienteComRestricaoFinanceira) AND
    (FrmPrincipalPreVenda.auxiLiberacao = False))) and
    (FrmPrincipalPreVenda.RgOpcoes.ItemIndex <> 2) // se não for orçamento
  then
  begin
    FrmFormaPag.Enabled := False;
    FrmCancelamentoVenda := TFrmCancelamentoVenda.Create(Application);
    // Cria o formulário
    vFlag := '9';
    FrmCancelamentoVenda.ShowModal;
    BtnConfirmar.Enabled := True;
  end
  else
    FrmPrincipalPreVenda.auxiLiberacao := True;
  Result := FrmPrincipalPreVenda.auxiLiberacao;
end;

function TFrmFormaPag.ValidarDesconto(prevenda: TPrevenda): Boolean;
var
  pDesconto: Real;
  item: TItemPrevenda;
begin
  if prevenda.descontoPercentual > 0 then
    pDesconto := prevenda.descontoPercentual
  else
  begin
    pDesconto := 0;
    for item in prevenda.itens do
    begin
      if item.Promocao_desconto_Item = True then
      begin
        if pDesconto < ((1 - (item.precoVenda / item.precoBruto)) * 100) then
          pDesconto := ((1 - (item.precoVenda / item.precoBruto)) * 100);
      end;
    end;
  end;
  if ((MoPreVenda.TestaFinanceiroNaConfirmacao) and
    (pDesconto > FrmPrincipalPreVenda.vPorcDesconto) and
    (FrmPrincipalPreVenda.Permissao('615', 'V') = 'N')) then
  begin
    FrmFormaPag.Enabled := False;
    FrmCancelamentoVenda := TFrmCancelamentoVenda.Create(Application);
    // Cria o formulário
    vFlag := '6';
    FrmCancelamentoVenda.ShowModal;
    BtnConfirmar.Enabled := True;
  end
  else
    FrmPrincipalPreVenda.liberouVenda := True;
  if FrmPrincipalPreVenda.liberouVenda = False then
  begin
    Close;
  end;
  Result := FrmPrincipalPreVenda.liberouVenda;
end;

function TFrmFormaPag.ValidarDesconto_PROAUTO: Boolean;
begin
  Result := True;
  if (UpperCase(vEmpresa) = 'PROAUTO') then
  begin
    case RadioGroup1.ItemIndex of
      1, 2, 3, 4, 5, 6, 7, 10, 11:
        begin
          if (StrToFloat(FrmPrincipalPreVenda.edtdesconto.text) > 0) and
            (FrmPrincipalPreVenda.vDescontoCliente = 0) then
          begin
            MessageDlg
              ('Desconto disponível somente para venda a vista. Caso queira utilizar algum desconto, utilize os seus créditos!',
              mtWarning, [mbOk], 0);
            Result := False;
          end;
        end;
    end;
  end;
end;

{
  * Após alterar a quantidade de dias em uma linha, o campo do vencimento precisa ser corrigido
  * e as parcelas reordenadas de acordo com a data de vencimento.
}
procedure TFrmFormaPag.atualizarLinhasGridParcelas;
var
  novoVencimento: TDateTime;
  qtdDias: integer;
  i: integer;
begin
  // corrijo o vencimento
  for i := 1 to (gridParcelas.RowCount - 1) do
  begin
    if Trim(gridParcelas.Cells[0, i]) = '' then
      Break;
    qtdDias := StrToInt(gridParcelas.Cells[0, i]);
    novoVencimento := incDay(Now, qtdDias);
    gridParcelas.Cells[3,  i] := DateToStr(novoVencimento);
  end;
end;

end.
