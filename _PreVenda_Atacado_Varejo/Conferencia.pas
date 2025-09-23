unit Conferencia;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Grids, DOMPrevenda, DOMFuncionario, Data.DB, Data.Win.ADODB, Vcl.Menus;

type
  TfrmConferencia = class(TForm)
    GroupBox1: TGroupBox;
    sgitens: TStringGrid;
    edtcdBarrasProduto: TEdit;
    edtPreVenda: TEdit;
    edtcdFuncionario: TEdit;
    edtnmFuncionario: TEdit;
    GroupBox2: TGroupBox;
    btnSalvar: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    btnPesquisar: TBitBtn;
    btnCancelar: TBitBtn;
    adoSalvar: TADOQuery;
    adoItens: TADOQuery;
    PopupMenu1: TPopupMenu;
    Salvar1: TMenuItem;
    procedure edtPreVendaExit(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure edtcdBarrasProdutoExit(Sender: TObject);
    procedure sgitensDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure edtcdFuncionarioExit(Sender: TObject);
    procedure sgitensKeyPress(Sender: TObject; var Key: Char);
    procedure sgitensKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure sgitensKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtPreVendaKeyPress(Sender: TObject; var Key: Char);
    procedure Salvar1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    prevenda: TPrevenda;
    funcionario : TFuncionario;
    function codigoBalancaComPreco(codigo : string):boolean;
    function LocalizarItemGrid(cdBarras: string): Integer;
    function ConferirItem(linha: integer; qtd : Currency = 1): Boolean;
    procedure CarregarItensGrid(prevenda: TPrevenda; ponteiro: string = '');
    function buscarPrecoItem(prevenda: TPrevenda; codProduto : string):Currency;
    procedure TodosConferidos();
    procedure SalvarConferencia;
    procedure Cancelar;
  public

  end;

var
  frmConferencia: TfrmConferencia;

implementation

uses
  NEGPrevenda, uFuncoesPadrao, MoPreVenda, NEGFuncionario, DataModulo, NEGLoja, Clipbrd;

{$R *.dfm}

procedure TfrmConferencia.edtcdBarrasProdutoExit(Sender: TObject);
begin
  btnPesquisarClick(Self);
end;

procedure TfrmConferencia.edtcdFuncionarioExit(Sender: TObject);
begin
  if edtcdFuncionario.Text = '' then
    Exit;
  funcionario := TNEGFuncionario.getFuncionario(StrToInt(edtcdFuncionario.Text));
  edtnmFuncionario.Text := funcionario.nome;
end;

procedure TfrmConferencia.edtPreVendaExit(Sender: TObject);
begin
  if prevenda <> nil then
    if prevenda.numeroPrevenda = StrToIntDef(edtPreVenda.Text,0) then
      Exit
    else if (FrmPrincipalPreVenda.vConferencia = true) then
      FrmPrincipalPreVenda.DesbloqueiaAlteracaoPreVenda(prevenda.numeroPrevenda);
  if (edtPreVenda.Text = '') then
  begin
    Cancelar;
    Exit;
  end;
  try
    prevenda := TNEGPrevenda.getPrevenda(StrToInt(edtPreVenda.Text), true, true);
    if prevenda.conferida then
    begin
      Messagedlg('Pré Venda já passou pela conferência.', mtWarning, [mbOk], 0);
      Cancelar;
      edtPreVenda.SetFocus;
      Exit;
    end;
    if ((prevenda.emUso = 'S') and (FrmPrincipalPreVenda.vConferencia = true)) then
    begin
      Application.messageBox('Pré Venda/Orçamento já está em uso no caixa!','Atenção', mb_ok + MB_ICONWARNING + MB_APPLMODAL);
      FreeAndNil(prevenda);
      Cancelar;
      edtPreVenda.SetFocus;
      Exit;
    end else if FrmPrincipalPreVenda.vConferencia = true then
      FrmPrincipalPreVenda.BloqueiaAlteracaoPreVenda(StrToInt(edtPreVenda.text));
    btnSalvar.Enabled := False;
    TMenuItem(PopupMenu1.Items.Items[0]).Enabled := False;
    Limpa_Grid(sgItens);
    CarregarItensGrid(prevenda);
  except
    Messagedlg('Pré-Venda não encontrada!', mtInformation, [mbOk], 0);
    Cancelar;
    edtPreVenda.SetFocus;
  end;
end;

procedure TfrmConferencia.edtPreVendaKeyPress(Sender: TObject; var Key: Char);
begin
  ValidarInteiro(Key);
end;

procedure TfrmConferencia.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (FrmPrincipalPreVenda.vConferencia = true) and (prevenda <> nil) then
    FrmPrincipalPreVenda.DesbloqueiaAlteracaoPreVenda(prevenda.numeroPrevenda);
end;

procedure TfrmConferencia.FormCreate(Sender: TObject);
begin
  with sgitens do
  begin
    Cells[0,0] := 'Código Barras';
    Cells[1,0] := 'Descrição';
    Cells[2,0] := 'Qtd conferida';
    Cells[4,0] := 'Qtd solicitada';
  end;
  sgitens.Repaint;
  edtcdFuncionario.Text := FrmPrincipalPreVenda.vcdVendedor;
  edtcdFuncionarioExit(self);
end;

function TfrmConferencia.LocalizarItemGrid(cdBarras: string): integer;
var
  I: integer;
begin
  Result := -1;
  for i := 1 to sgitens.RowCount do
  begin
    if (cdBarras = sgitens.Cells[0, I]) then//and (sgitens.Cells[3, I] = '0') then
    begin
      sgitens.row := I;
      Result := I;
      Break;
    end;
  end;
end;

procedure TfrmConferencia.Salvar1Click(Sender: TObject);
begin
  btnSalvarClick(self);
end;

procedure TfrmConferencia.SalvarConferencia;
begin
  try
    if (FrmPrincipalPreVenda.vConferencia = true) then
      FrmPrincipalPreVenda.DesbloqueiaAlteracaoPreVenda(StrToInt(edtPreVenda.text));
    DModulo.Conexao.BeginTrans;
    with adoSalvar do
    begin
      SQL.Text := 'UPDATE ORCAMENTO SET CONFERIDO = 1 WHERE NRORCAMENTO = :NUMERO';
      Parameters.ParamByName('NUMERO').Value := edtPreVenda.Text;
      ExecSQL;
      DModulo.Conexao.CommitTrans;
      TNEGLoja.SalvaLogEventos('Realização de conferência',
            edtPreVenda.Text, '', 0, StrtoInt(edtcdFuncionario.Text), '16', '');
      MessageDlg('Conferência realizada com sucesso.', mtInformation, [mbOK], 0);
      Cancelar;
      edtPreVenda.SetFocus;
    end;
  except
    DModulo.Conexao.RollbackTrans;
    MessageDlg('Erro ao salvar a conferência.',mtError,[mbOK],0);
  end;
end;

procedure TfrmConferencia.sgitensDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  if sgitens.Cells[3, ARow] = '1' then
    sgitens.Canvas.Brush.color := clWhite//TColor($009BFF9B)  //clPaleGreen
  else
//  if (sgitens.Cells[3, ARow] = '0') and (strtoFloat(sgitens.Cells[2, ARow]) = 0) then
//    sgitens.Canvas.brush.Color := TColor($009DABF9)  //clPaleRed
//  else
  if (sgitens.Cells[3, ARow] = '0') and (strtoFloatDef(sgitens.Cells[2, ARow],0) >= 0) then
    sgitens.Canvas.brush.Color := clWhite //TColor($00FFFF)  //clWebYellow
  else
    sgitens.Canvas.brush.Color := clWhite;
  sgitens.Canvas.Font.Color := clBlack;
  sgitens.Canvas.FillRect(rect);
  sgitens.canvas.TextOut(Rect.Left,Rect.Top,sgitens.Cells[ACol,ARow]);
end;

procedure TfrmConferencia.sgitensKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_DELETE) and ((codigoBalancaComPreco(sgitens.Cells[0,sgitens.Row])) or NOT(sgitens.Col = 2) or (sgitens.Cells[0,sgitens.Row] <> '')) then
    key := VK_CANCEL;
end;

procedure TfrmConferencia.sgitensKeyPress(Sender: TObject; var Key: Char);
begin
  if (codigoBalancaComPreco(sgitens.Cells[0,sgitens.Row])) then
    ValidarNumero(Key)
  else if NOT(sgitens.Col = 2) or (sgitens.Cells[0,sgitens.Row] <> '') then //tem cod barra
    Key := #0
  else
    ValidarNumero(Key);
end;

procedure TfrmConferencia.sgitensKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  TodosConferidos();
end;

procedure TfrmConferencia.TodosConferidos;
var
  x : integer;
  resultado : Boolean;
begin
  resultado := true;
  for x := 1 to sgitens.RowCount do
  begin
    if sgitens.Cells[1,x] = '' then
      continue;
    if not (strtoFloatDef(sgitens.Cells[4, x],0) = strtoFloatDef(sgitens.Cells[2, x],0)) then
    begin
      resultado := false;
      break;
    end;
  end;
  if resultado = true then
  begin
    btnSalvar.Enabled := True;
    TMenuItem(PopupMenu1.Items.Items[0]).Enabled := True;
  end else
  begin
    btnSalvar.Enabled := False;
    TMenuItem(PopupMenu1.Items.Items[0]).Enabled := False;
  end;
end;

procedure TfrmConferencia.btnSalvarClick(Sender: TObject);
begin
  SalvarConferencia;
end;

function TfrmConferencia.buscarPrecoItem(prevenda: TPrevenda;
  codProduto: string): Currency;
var
  i : integer;
begin
  for i := 0 to prevenda.itens.Count -1 do
  begin
    if prevenda.itens[i].codigoBarras = codProduto then
      Result := prevenda.itens[i].precoVenda;
  end;
end;

procedure TfrmConferencia.BitBtn2Click(Sender: TObject);
begin
  if MessageDlg('Deseja realmente sair da tela de conferência?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
  begin
    if (FrmPrincipalPreVenda.vConferencia = true) and (prevenda <> nil) then
      FrmPrincipalPreVenda.DesbloqueiaAlteracaoPreVenda(prevenda.numeroPrevenda);
    close;
  end;
end;

procedure TfrmConferencia.btnCancelarClick(Sender: TObject);
begin
  if MessageDlg('Deseja realmente cancelar esta conferência?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
  begin
    Cancelar;
    edtPreVenda.SetFocus;
  end;
end;

procedure TfrmConferencia.btnPesquisarClick(Sender: TObject);
var
  codigoBarras : string;
  qtd : Currency;
begin
  if edtcdBarrasProduto.Text <> '' then
  begin
    if (Length(edtcdBarrasProduto.Text) > 6) and (copy(edtcdBarrasProduto.Text, 1, 1) = '2') then // balança
    begin
      codigoBarras := copy(edtcdBarrasProduto.Text, 1, 7);
      if FrmPrincipalPreVenda.vTipoCodigoBalanca = 1 then // calcula pelo preço
      begin
        // como ele pode alterar o preço no cadastro de produto, vou deixa para ele digitar a quantidade
        qtd := 0;
//        qtd := StrToCurr(FormatCurr('0.00',
//              (strtofloat(copy(edtcdBarrasProduto.Text, 8, 2) + ',' +
//              copy(edtcdBarrasProduto.Text, 10, 3)) / buscarPrecoItem(prevenda, codigoBarras)) * 10));
      end else // calcula pelo peso
      begin
        qtd := StrToCurr(FormatFloatQ(vCasasQtd, strtoCurr(copy(edtcdBarrasProduto.Text, 8, 2)
               + ',' + copy(edtcdBarrasProduto.Text, 10, 3))));
      end;
    end else
    begin
      codigoBarras := edtcdBarrasProduto.Text;
      qtd := 1;
    end;
    ConferirItem(LocalizarItemGrid(codigoBarras), qtd);
    edtcdBarrasProduto.Clear;
    edtcdBarrasProduto.SetFocus;
    sgitens.Repaint;
  end;
  TodosConferidos();
end;

procedure TfrmConferencia.Cancelar;
begin
  if (FrmPrincipalPreVenda.vConferencia = true) and (prevenda <> nil) then
    FrmPrincipalPreVenda.DesbloqueiaAlteracaoPreVenda(prevenda.numeroPrevenda);
  FreeAndNil(funcionario);
  FreeAndNil(prevenda);
  edtPreVenda.Clear;
  edtcdBarrasProduto.Clear;
  Limpa_Grid(sgitens);
  btnSalvar.Enabled := false;
  TMenuItem(PopupMenu1.Items.Items[0]).Enabled := False;
end;

procedure TfrmConferencia.CarregarItensGrid(prevenda: TPrevenda; ponteiro: string = '');
var
  I: integer;
  ordemImpressao : integer;
begin
  adoItens.SQL.Text :=
  'SELECT I.cdProduto,T.nmproduto,T.cdFabricante,T.dsReferencia,T.dsPrateleira,MIN(I.cdIteLcto),SUM(I.nrQtd) Qtd' + #13#10 +
  'FROM Orcamento O WITH (NOLOCK) left join memoOrcamento M WITH (NOLOCK) on O.nrOrcamento = M.nrOrcamento,' + #13#10 +
  'Pessoa P WITH (NOLOCK),' + #13#10 +
  'Pessoa CLI WITH(NOLOCK),' + #13#10 +
  'Produto T WITH (NOLOCK),' + #13#10 +
  'IteOrcamento I WITH (NOLOCK)' + #13#10 +
  'WHERE P.cdPessoa = O.cdPessoa and T.cdProduto = I.cdProduto' + #13#10 +
  'AND O.cdCliente = CLI.cdPessoa' + #13#10 +
  'AND I.dsSituacao not in (''C'',''T'') and O.nrOrcamento = I.nrOrcamento and O.nrOrcamento = :nrOrcamento' + #13#10 +
  'AND O.nrobjeto = 0' + #13#10 +
  'GROUP BY I.cdProduto,T.nmProduto,T.cdFabricante,T.dsPrateleira,T.dsReferencia';
  adoItens.Parameters.ParamByName('NRORCAMENTO').Value := prevenda.numeroPrevenda;
  ordemImpressao := TNEGLoja.getConfiguracaoOrdemImpressaoPreVenda;
  case ordemImpressao of
    0: adoItens.SQL.Add('ORDER BY I.cdProduto');
    1: adoItens.SQL.Add('ORDER BY T.nmProduto');
    2: adoItens.SQL.Add('ORDER BY T.dsReferencia');
    3: adoItens.SQL.Add('ORDER by T.dsPrateleira,T.nmProduto');
    4: adoItens.SQL.Add('ORDER BY MIN(I.cdIteLcto)');
  end;
  adoItens.Open;
  adoItens.First;
  for I := 0 to adoItens.recordCount -1 do//prevenda.itens.Count - 1 do
  begin
    with sgItens do
    begin
      Cells[0, I + 1] := adoItens.FieldByName('cdFabricante').AsString; // codigoBarras;
      Cells[1, I + 1] := adoItens.FieldByName('nmProduto').AsString;    // descricao;
      Cells[2, I + 1] := '0';                                           //
      Cells[3, I + 1] := '0';
      Cells[4, I + 1] := FormatCurr('0.00', adoItens.FieldByName('Qtd').AsCurrency); // qtd Prevenda
    end;
    adoItens.Next;
  end;
  if (adoItens.recordCount + 1) = 1 then
    sgItens.RowCount := 2
  else
    sgItens.RowCount := adoItens.recordCount + 1;//prevenda.itens.Count + 1;
end;

function TfrmConferencia.codigoBalancaComPreco(codigo: string): boolean;
begin
  if (Length(codigo) > 6) and (copy(codigo, 1, 1) = '2')
      and (FrmPrincipalPreVenda.vTipoCodigoBalanca = 1) then
    Result := True
  else
    Result := False;
end;

function TfrmConferencia.ConferirItem(linha: integer; qtd : Currency = 1): boolean;
begin
  if linha <= 0 then
  begin
    Messagedlg('Produto não encontrado.', mtWarning, [mbOk], 0);
    Result := False;
    Exit;
  end;
  sgitens.Cells[2, linha] := FloatToStr(strtoFloat(sgitens.Cells[2, linha]) + qtd);
  if strtoFloat(sgitens.Cells[4, linha]) = strtoFloat(sgitens.Cells[2, linha]) then
    sgitens.Cells[3, linha] := '1' //bateu igual
  else
    sgitens.Cells[3, linha] := '0';
  Result := True;
end;

end.

