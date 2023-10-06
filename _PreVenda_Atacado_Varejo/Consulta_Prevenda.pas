unit Consulta_Prevenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, DB, DBTables, Buttons,
  ComCtrls, Menus, ADODB, IniFiles, DateUtils;

type
  TConsulta_prevenca = class(TForm)
    RgTipo: TRadioGroup;
    DBGrid1: TDBGrid;
    ADOQryConsulta: TADOQuery;
    ADODsConsulta: TDataSource;
    ADOQryCupon: TADOQuery;
    ADOQrySalvar: TADOQuery;
    AdoQryQtd: TADOQuery;
    AdoQryGrupo: TADOQuery;
    Label2: TLabel;
    Label3: TLabel;
    ADOQryProcura: TADOQuery;
    SgDados: TStringGrid;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    DtIni: TDateTimePicker;
    LblEnvelope: TLabel;
    GroupBox2: TGroupBox;
    LblMdConsulta: TLabel;
    EdtConsulta: TEdit;
    Label4: TLabel;
    rbCliente: TRadioButton;
    rbProduto: TRadioButton;
    edtCodigo: TEdit;
    Label5: TLabel;
    DtFim: TDateTimePicker;
    Label6: TLabel;
    rbVendedor: TRadioButton;
    cbxVendedor: TComboBox;
    rbReferencia: TRadioButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RgTipoClick(Sender: TObject);
    procedure BtnMdProximoClick(Sender: TObject);
    procedure BtnMdSairClick(Sender: TObject);
    procedure BtnMdPrimeiroClick(Sender: TObject);
    procedure BtnMdAnteriorClick(Sender: TObject);
    procedure BtnMdUltimoClick(Sender: TObject);
    procedure DtIniChange(Sender: TObject);
    procedure EdtConsultaChange(Sender: TObject);
    procedure EdtConsultaKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure EdtConsultaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CheckBox1Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure rbClienteClick(Sender: TObject);
    procedure rbProdutoClick(Sender: TObject);
    procedure edtCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCodigoChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure rbVendedorClick(Sender: TObject);
    procedure cbxVendedorChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SgDadosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DtIniKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DtFimKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cbxVendedorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure rbClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure rbProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure rbVendedorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbxVendedorClick(Sender: TObject);
    procedure rbReferenciaClick(Sender: TObject);
    procedure rbReferenciaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cbxVendedorKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1DblClick(Sender: TObject);
  private
  procedure monta_pedidos;
  Procedure MontaProdutos;
  Procedure LimpaGrid;
  function getDescricaoProduto(codigo: integer): string;
  function getNomePessoa(codigo: integer): string;
  function getNomeVendedor(codigo:integer):string;
  procedure FixarDataFiltroPrevenda;
    { Private declarations }
  public
    { Public declarations }
    procedure MontaComboVendedor;
  end;

var
  Consulta_prevenca: TConsulta_prevenca;
  vDias : String[5];

implementation

uses uFuncoesPadrao,  DataModulo, MoPreVenda, NEGLoja, DOMFuncionario,
  System.Generics.Collections, CancelamentoVenda;

{$R *.dfm}

{ TForm1 }

procedure TConsulta_prevenca.monta_pedidos;
var i: integer;
begin
    Label1.Font.Color     := clBlack;
    Label1.Caption        := 'Pré-Vendas e Orçamentos';
    Caption               := 'Consulta Pré-Vendas e Orçamentos';
    LblMdConsulta.Caption := 'Cliente';
    // dimensões do edit
//    EdtConsulta.Width       := 334;
//    EdtConsulta.Height      := 24;
//    RgTipo.Enabled          := True;
//    DateTimePicker1.Visible := True;
  if rbCliente.Checked then
  begin
    with ADOQryConsulta do
    begin
      Sql.Text := 'Select O.nrOrcamento as Lancamento,O.dtEmissao as Data,    '+
                  'REPLACE(CAST(O.vlValor AS VARCHAR),''.'','','') AS Valor,  '+
                  'P.nmPessoa as Cliente,                                     '+
                  'case O.dsFormatacao                                        '+
                  'when ''0'' then ''À Vista''                                '+
                  'when ''1'' then ''A Prazo''                                '+
                  'when ''2'' then ''Cartão a Vista''                         '+
                  'when ''3'' then ''Cartão Parcelado''                       '+
                  'when ''4'' then ''Cheque Pré''                             '+
                  'when ''5'' then ''Entrada + a Prazo''                      '+
                  'when ''6'' then ''Entrada + Cartão''                       '+
                  'when ''7'' then ''Entrada + Cheque Pré''                   '+
                  'End as ''Forma Pagamento'',                                '+
                  'P.cdPessoa as Codigo, O.dsReferencia AS Referência         '+
                  'From Orcamento O WITH (NOLOCK),Pessoa P WITH (NOLOCK)      '+
                  'Where P.cdPessoa = O.cdCliente and dtEmissao between :DATA1 AND :DATA2 ';
      if NOT (FrmCancelamentoVenda.Possui_Permissao('854','V',FrmPrincipalPreVenda.cbxUsuario.Text,FrmPrincipalPreVenda.EdtUsuario.Text,false)) then begin
        Sql.Add('AND O.cdPessoa = :VENDEDOR');
        Parameters.ParamByName('VENDEDOR').Value := FrmPrincipalPreVenda.vcdVendedor;
      end;
      case RgTipo.ItemIndex of
        0: Sql.Add('and dsImpresso = ''N'' ');
        1: Sql.Add('and dsImpresso = ''S'' ');
        2: Sql.Add('and dsImpresso = ''O'' ');
        3: Sql.Add('and dsImpresso in (''O'',''N'',''S'')');
      end;
      Sql.Add('and P.nmPessoa like '+ QuotedStr(EdtConsulta.Text+'%') +' ');
      Sql.Add('and O.vlvalor > 0  ');
      Sql.Add('Order by O.nrOrcamento desc,O.dtEmissao desc');
      Prepared;
      Parameters.ParamByName('DATA1').Value := DateOf(DtIni.Date);  // - StrToInt(vDias)
      Parameters.ParamByName('DATA2').Value := DateOf(DtFim.Date);  // - StrToInt(vDias)
      Open;
      MontaProdutos;
      DbGrid1.Columns[1].Width      := 61;
      DbGrid1.Columns[2].Width      := 60;
      DbGrid1.Columns[3].Width      := 230;
      DbGrid1.Columns[2].Font.color := clRed;
    end;
  end
  else if rbProduto.Checked then
  begin
    with ADOQryConsulta do
    begin
      Sql.Text := 'Select O.nrOrcamento as Lancamento,O.dtEmissao as Data,    '+
                  'REPLACE(CAST(O.vlValor AS VARCHAR),''.'','','') AS Valor,  '+
                  'P.nmPessoa as Cliente,                                     '+
                  'case O.dsFormatacao                                        '+
                  'when ''0'' then ''À Vista''                                '+
                  'when ''1'' then ''A Prazo''                                '+
                  'when ''2'' then ''Cartão a Vista''                         '+
                  'when ''3'' then ''Cartão Parcelado''                       '+
                  'when ''4'' then ''Cheque Pré''                             '+
                  'when ''5'' then ''Entrada + a Prazo''                      '+
                  'when ''6'' then ''Entrada + Cartão''                       '+
                  'when ''7'' then ''Entrada + Cheque Pré''                   '+
                  'End as ''Forma Pagamento'',                                '+
                  'P.cdPessoa as Codigo,O.dsReferencia AS Referência           '+
                  'From Orcamento O WITH (NOLOCK),Pessoa P WITH (NOLOCK), iteOrcamento I, produto PROD '+
                  'Where O.cdPessoa = :VENDEDOR AND P.cdPessoa = O.cdCliente and dtEmissao between :DATA1 and :DATA2 and I.nrorcamento = O.nrOrcamento and I.cdproduto = PROD.cdproduto ';
      case RgTipo.ItemIndex of
        0: Sql.Add('and dsImpresso = ''N'' ');
        1: Sql.Add('and dsImpresso = ''S'' ');
        2: Sql.Add('and dsImpresso = ''O'' ');
        3: Sql.Add('and dsImpresso in (''O'',''N'',''S'')');
      end;
      Sql.Add('and PROD.nmproduto like '+ QuotedStr(EdtConsulta.Text+'%') +' ');
      Sql.Add('and O.vlvalor > 0  ');
      Sql.Add('Order by O.nrOrcamento desc,O.dtEmissao desc');
      Prepared;
      Parameters.ParamByName('VENDEDOR').Value := FrmPrincipalPreVenda.vcdVendedor;
      Parameters.ParamByName('DATA1').Value := DateOf(DtIni.Date);  // - StrToInt(vDias)
      Parameters.ParamByName('DATA2').Value := DateOf(DtFim.Date);  // - StrToInt(vDias)
      Open;
      MontaProdutos;
      DbGrid1.Columns[1].Width       := 61;
      DbGrid1.Columns[2].Width       := 60;
      DbGrid1.Columns[3].Width       := 230;
      DbGrid1.Columns[2].Font.color  := clRed;
    end;
  end else
  if rbVendedor.Checked then
  begin
    with ADOQryConsulta do
    begin
      Sql.Text := 'Select O.nrOrcamento as Lancamento,O.dtEmissao as Data,    '+
                  'REPLACE(CAST(O.vlValor AS VARCHAR),''.'','','') AS Valor,  '+
                  'P.nmPessoa as Cliente,                                     '+
                  'case O.dsFormatacao                                        '+
                  'when ''0'' then ''À Vista''                                '+
                  'when ''1'' then ''A Prazo''                                '+
                  'when ''2'' then ''Cartão a Vista''                         '+
                  'when ''3'' then ''Cartão Parcelado''                       '+
                  'when ''4'' then ''Cheque Pré''                             '+
                  'when ''5'' then ''Entrada + a Prazo''                      '+
                  'when ''6'' then ''Entrada + Cartão''                       '+
                  'when ''7'' then ''Entrada + Cheque Pré''                   '+
                  'End as ''Forma Pagamento'',                                '+
                  'P.cdPessoa as Codigo,O.dsReferencia AS Referência          '+
                  'From Orcamento O WITH (NOLOCK),Pessoa P WITH (NOLOCK),     '+
                  'Pessoa Func WITH(NOLOCK)                                   '+
                  'Where P.cdPessoa = O.cdCliente and Func.cdPessoa = O.cdPessoa and '+
                  'dtEmissao between :DATA1 AND :DATA2 ';
      case RgTipo.ItemIndex of
        0: Sql.Add('and dsImpresso = ''N'' ');
        1: Sql.Add('and dsImpresso = ''S'' ');
        2: Sql.Add('and dsImpresso = ''O'' ');
        3: Sql.Add('and dsImpresso in (''O'',''N'',''S'')');
      end;
      if StrToIntDef(copy_campo(cbxVendedor.Text,'|',2),-1) > 0 then
        Sql.Add('and Func.cdPessoa = '+ copy_campo(cbxVendedor.Text,'|',2) +' ');
      Sql.Add('and O.vlvalor > 0  ');
      Sql.Add('Order by O.nrOrcamento desc,O.dtEmissao desc');
      Prepared;
      Parameters.ParamByName('DATA1').Value := DateOf(DtIni.Date);  // - StrToInt(vDias)
      Parameters.ParamByName('DATA2').Value := DateOf(DtFim.Date);  // - StrToInt(vDias)
      Open;
      MontaProdutos;
      DbGrid1.Columns[1].Width      := 61;
      DbGrid1.Columns[2].Width      := 60;
      DbGrid1.Columns[3].Width      := 230;
      DbGrid1.Columns[2].Font.color := clRed;
    end;
  end else
  if rbReferencia.Checked then
  begin
    with ADOQryConsulta do
    begin
      Sql.Text := 'Select O.nrOrcamento as Lancamento,O.dtEmissao as Data,    '+
                  'REPLACE(CAST(O.vlValor AS VARCHAR),''.'','','') AS Valor,  '+
                  'P.nmPessoa as Cliente,                                     '+
                  'case O.dsFormatacao                                        '+
                  'when ''0'' then ''À Vista''                                '+
                  'when ''1'' then ''A Prazo''                                '+
                  'when ''2'' then ''Cartão a Vista''                         '+
                  'when ''3'' then ''Cartão Parcelado''                       '+
                  'when ''4'' then ''Cheque Pré''                             '+
                  'when ''5'' then ''Entrada + a Prazo''                      '+
                  'when ''6'' then ''Entrada + Cartão''                       '+
                  'when ''7'' then ''Entrada + Cheque Pré''                   '+
                  'End as ''Forma Pagamento'',                                '+
                  'P.cdPessoa as Codigo,O.dsReferencia AS Referência          '+
                  'From Orcamento O WITH (NOLOCK),Pessoa P WITH (NOLOCK)      '+
                  'Where O.cdPessoa = :VENDEDOR AND P.cdPessoa = O.cdCliente and dtEmissao between :DATA1 AND :DATA2 ';
      case RgTipo.ItemIndex of
        0: Sql.Add('and dsImpresso = ''N'' ');
        1: Sql.Add('and dsImpresso = ''S'' ');
        2: Sql.Add('and dsImpresso = ''O'' ');
        3: Sql.Add('and dsImpresso in (''O'',''N'',''S'')');
      end;
      Sql.Add('and O.dsReferencia like '+ QuotedStr(EdtConsulta.Text+'%') +' ');
      Sql.Add('and O.vlvalor > 0  ');
      Sql.Add('Order by O.nrOrcamento desc,O.dtEmissao desc');
      Prepared;
      Parameters.ParamByName('VENDEDOR').Value := FrmPrincipalPreVenda.vcdVendedor;
      Parameters.ParamByName('DATA1').Value := DateOf(DtIni.Date);  // - StrToInt(vDias)
      Parameters.ParamByName('DATA2').Value := DateOf(DtFim.Date);  // - StrToInt(vDias)
      Open;
      MontaProdutos;
      DbGrid1.Columns[1].Width      := 61;
      DbGrid1.Columns[2].Width      := 60;
      DbGrid1.Columns[3].Width      := 230;
      DbGrid1.Columns[2].Font.color := clRed;
    end;
  end;
  {abaixo se nao for do grupo LITORAL eu oculto a referencia da prevenda}
      if (FrmPrincipalPreVenda.dsCGC <> '11334892000183') and (FrmPrincipalPreVenda.dsCGC <> '09540332000133')
        and (FrmPrincipalPreVenda.dsCGC <> '02751835000109') and (FrmPrincipalPreVenda.dsCGC <> '14223073000157') then
          ADOQryConsulta.FieldByName('Referência').Visible := False;
end;

procedure TConsulta_prevenca.rbReferenciaClick(Sender: TObject);
begin
  if rbReferencia.Checked = true then begin
    rbProduto.Checked := not rbReferencia.Checked;
    rbVendedor.Checked := not rbReferencia.Checked;
    EdtConsulta.Visible := rbReferencia.Checked;
    rbCliente.Checked := not rbReferencia.Checked;
    cbxVendedor.Visible := not rbReferencia.Checked;
  end;
end;

procedure TConsulta_prevenca.rbReferenciaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if VK_ESCAPE  = key then
    Close;
end;

Procedure TConsulta_prevenca.FormCreate(Sender: TObject);
var DIniQtd : TIniFile; //Variáveis que irão cahamar o support.ini para achar as qtds de casas decimais
begin
  // PEGA O Flag que testa se é para mostrar o edit (PEDIDO) ou n!
  DIniQtd := TIniFile.Create(ExtractFilePath(Application.ExeName)+'Support.ini');
  vDias := DIniQtd.ReadString('DIAS_PREVENDA','Flag','');
  if Length(vDias) = 0 then vDias := '1';
  DIniQtd.Free;
  LblEnvelope.Caption := '';
  DtIni.Date := FrmPrincipalPreVenda.PegaDatabanco;
  DtFim.Date := FrmPrincipalPreVenda.PegaDatabanco;
//  monta_pedidos;
//  MontaProdutos;
  With SgDados do begin
    Cells[0,0] := 'Descrição';
    Cells[1,0] := 'Qtd';
    Cells[2,0] := 'Valor';
  end;
  {abaixo se nao for do grupo LITORAL eu oculto a referencia da prevenda}
  if (FrmPrincipalPreVenda.dsCGC <> '11334892000183') and (FrmPrincipalPreVenda.dsCGC <> '09540332000133')
      and (FrmPrincipalPreVenda.dsCGC <> '02751835000109') and (FrmPrincipalPreVenda.dsCGC <> '14223073000157') then
    rbReferencia.Visible := False;
  if NOT(FrmCancelamentoVenda.Possui_Permissao('854','V',FrmPrincipalPreVenda.cbxUsuario.Text,FrmPrincipalPreVenda.EdtUsuario.Text,false)) then
    rbVendedor.Visible := False;
end;

procedure TConsulta_prevenca.FormShow(Sender: TObject);
begin
  //if (UPPERCASE(vEmpresa) = 'MEGA') then
  //  FixarDataFiltroPrevenda;
  Monta_pedidos;
  MontaProdutos;
  EdtConsulta.SetFocus;
end;

procedure TConsulta_prevenca.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  if FrmPrincipalPrevenda.Enabled = false then
    FrmPrincipalPrevenda.Enabled := True;
  if FrmPrincipalPrevenda.EdtLancto.Enabled = True then FrmPrincipalPrevenda.EdtLancto.SetFocus;
end;

procedure TConsulta_prevenca.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
//
end;

procedure TConsulta_prevenca.RgTipoClick(Sender: TObject);
begin
  if (UPPERCASE(vEmpresa) = 'MEGA_OLD') then begin
    if RgTipo.ItemIndex = 1 then begin
      DtIni.Enabled := True;
      DtFim.Enabled := True;
    end
    else begin
      DtIni.Enabled := False;
      DtFim.Enabled := False;
      FixarDataFiltroPrevenda;
    end;
  end;
  monta_pedidos;
  MontaProdutos;
  if rbVendedor.Checked = true then
    cbxVendedor.SetFocus
  else
     EdtConsulta.SetFocus;
end;


procedure TConsulta_prevenca.SgDadosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if VK_ESCAPE  = key then
    Close;
end;

procedure TConsulta_prevenca.BtnMdProximoClick(Sender: TObject);
begin
  ADOQryConsulta.Next;
end;

procedure TConsulta_prevenca.BtnMdSairClick(Sender: TObject);
begin
  Application.OnMessage := FrmPrincipalPreVenda.NaoProcessaMsg;
  FrmPrincipalPreVenda.Enabled := true;
  if FrmPrincipalPreVenda.EdtLancto.Text = '*' then
    FrmPrincipalPreVenda.EdtLancto.Clear;
  Application.OnMessage := FrmPrincipalPreVenda.ProcessaMsg;
  Close;
end;

procedure TConsulta_prevenca.BtnMdPrimeiroClick(Sender: TObject);
begin
  ADOQryConsulta.First; // Primeiro registro
//  if FrmCupom.vauxi = '1' then
   // EdtDesconto.Text := FormatFloat('0.00',ADOQryConsulta.FieldByName('Desconto').AsFloat);
end;

procedure TConsulta_prevenca.BtnMdAnteriorClick(Sender: TObject);
begin
  ADOQryConsulta.Prior; // Registro Anterior
//  if FrmCupom.vauxi = '1' then
   // EdtDesconto.Text := FormatFloat('0.00',ADOQryConsulta.FieldByName('Desconto').AsFloat);
end;

procedure TConsulta_prevenca.BtnMdUltimoClick(Sender: TObject);
begin
  ADOQryConsulta.Last; // Ultimo registro
//  if FrmCupom.vauxi = '1' then
   // EdtDesconto.Text := FormatFloat('0.00',ADOQryConsulta.FieldByName('Desconto').AsFloat);
end;

procedure TConsulta_prevenca.cbxVendedorChange(Sender: TObject);
begin
  monta_pedidos;
end;

procedure TConsulta_prevenca.cbxVendedorClick(Sender: TObject);
begin
  cbxVendedor.SelStart := 0;
end;

procedure TConsulta_prevenca.cbxVendedorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if VK_ESCAPE  = key then
    Close;
end;

procedure TConsulta_prevenca.cbxVendedorKeyPress(Sender: TObject;
  var Key: Char);
begin
//
end;

procedure TConsulta_prevenca.DtFimKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if VK_ESCAPE  = key then
    Close;
end;

procedure TConsulta_prevenca.DtIniChange(Sender: TObject);
begin
  monta_pedidos;
end;

procedure TConsulta_prevenca.DtIniKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if VK_ESCAPE  = key then
    Close;
end;

Procedure TConsulta_prevenca.EdtConsultaChange(Sender: TObject);
begin
//  edtCodigo.Clear;
  
  monta_pedidos;
//  MontaProdutos;
end;

function TConsulta_Prevenca.getDescricaoProduto(codigo:integer):string;
var
  query : TADOQuery;
begin
  query := TADOQuery.Create(self);
  query.Connection := DModulo.Conexao;
  with query do
  begin
    SQL.Text := 'select nmproduto as descricao from produto where cdproduto = :codigo';
    parameters.parambyname('codigo').value := codigo;
    open;
    if recordcount > 0 then
       result := fieldbyname('descricao').AsString
    else
       result := '';
  end;
  freeandnil(query);
end;

function TConsulta_Prevenca.getNomePessoa(codigo:integer):string;
var
  query : TADOQuery;
begin
  query := TADOQuery.Create(self);
  query.Connection := DModulo.Conexao;
  with query do
  begin
    SQL.Text := 'select nmpessoa as nome from pessoa where cdpessoa = :codigo';
    parameters.parambyname('codigo').value := codigo;
    open;
    if recordcount > 0 then
       result := fieldbyname('nome').AsString
    else
       result := '';
  end;
  freeandnil(query);
end;

function TConsulta_Prevenca.getNomeVendedor(codigo:integer):string;
var
  query : TADOQuery;
begin
  query := TADOQuery.Create(self);
  query.Connection := DModulo.Conexao;
  with query do
  begin
    SQL.Text := 'select nmpessoa as nome from pessoa where cdpessoa = :codigo';
    parameters.parambyname('codigo').value := codigo;
    open;
    if recordcount > 0 then
       result := fieldbyname('nome').AsString
    else
       result := '';
  end;
  freeandnil(query);
end;


Procedure TConsulta_Prevenca.EdtConsultaKeyPress(Sender: TObject;
  var Key: Char);
begin
  edtcodigo.clear;
  if (Key = Char(13)) and (ADOQryConsulta.RecordCount > 0) then begin   // enter
    FrmPrincipalPreVenda.Enabled := True;
    Application.OnMessage := FrmPrincipalPreVenda.NaoProcessaMsg;
    FrmPrincipalPreVenda.Enabled := True;
    ativa := 'T';
    FrmPrincipalPreVenda.EdtLancto.Text := ADOQryConsulta.FieldByName('Lancamento').AsString;  // pega o nº do lançamento
    FrmPrincipalPreVenda.EdtLancto.SetFocus;
    FrmPrincipalPreVenda.EdtLancto.SelectAll;
    Application.OnMessage := FrmPrincipalPreVenda.ProcessaMsg;
    close;
  end;
  if Key = Char(27) then begin   // ESC
    FrmPrincipalPreVenda.Enabled := True;
    if FrmPrincipalPreVenda.EdtLancto.Text = '*' then
      FrmPrincipalPreVenda.EdtLancto.Clear;
    Application.OnMessage := FrmPrincipalPreVenda.ProcessaMsg;
    close;
  end;
end;

procedure TConsulta_prevenca.FixarDataFiltroPrevenda;
var
  query : TADOQuery;
begin
    DtIni.Enabled := False;
    DtFim.Enabled := False;
    query := TADOQuery.Create(self);
    query.Connection := DModulo.Conexao;
    with query do
    begin
      SQL.Text := 'SELECT CAST(CAST(YEAR(GETDATE()) AS VARCHAR) + ''-'' + CAST(MONTH(GETDATE()) AS VARCHAR)+ '+
           ' ''-1'' AS DATETIME) DTINI, GETDATE() DTFIM';
      open;
      DtIni.Date := FieldByName('DTINI').AsDateTime;
      DtFim.Date := FieldByName('DTFIM').AsDateTime;
    end;
    freeandnil(query);
end;

procedure TConsulta_prevenca.FormActivate(Sender: TObject);
begin
  EdtConsulta.SetFocus;
end;

procedure TConsulta_prevenca.EdtConsultaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_Down then
    BtnMdProximoClick(Self);
  if Key = VK_Up then
    BtnMdAnteriorClick(Self);
  MontaProdutos;  
end;

procedure TConsulta_prevenca.CheckBox1Click(Sender: TObject);
begin
  monta_pedidos;
  MontaProdutos;
end;

procedure TConsulta_Prevenca.MontaProdutos;
var I : Integer;
begin
  if AdoQryConsulta.RecordCount > 0 then begin
    With ADOQryProcura do begin
      Sql.Text := 'Select O.cdPessoa,O.nrOrcamento,O.cdCliente,O.dsImpresso,P.nmProduto, '+
                  'I.cdProduto,O.dtEmissao,I.NrQtd,I.vlPreco,O.nrDesconto,O.dsChave, Vendedor.nmPessoa '+
                  'From Orcamento O WITH (NOLOCK),IteOrcamento I WITH (NOLOCK),Produto P WITH (NOLOCK), Pessoa Vendedor WITH(NOLOCK) '+
                  'Where O.nrOrcamento = :LANCTO               '+
                  'and I.dsSituacao <> ''C''                                            '+
                  'and O.nrOrcamento = I.nrOrcamento and I.cdproduto = P.cdProduto      '+
                  'and O.cdPessoa = Vendedor.cdPessoa ';
      Parameters.ParamByName('LANCTO').Value := AdoQryConsulta.FieldByName('Lancamento').asString;
      case RgTipo.ItemIndex of
        0: Sql.Add('and dsImpresso = ''N'' ');
        1: Sql.Add('and dsImpresso = ''S'' ');
        2: Sql.Add('and dsImpresso = ''O'' ');
        3: Sql.Add('and dsImpresso in (''O'',''N'',''S'')');
      end;
      Open;
//      FrmPrincipalPreVenda.ADOQryNome.Open;
//      FrmPrincipalPreVenda.ADOQryNome.Locate('cdPessoa',ADOQryProcura.FieldByName('cdPessoa').AsString,[]);
      Label4.caption := 'Vendedor : ' + FieldByName('nmPessoa').AsString;
      LimpaGrid;
      for i := 1 to ADOQryProcura.RecordCount do begin
        SgDados.Cells[0,i] := ADOQryProcura.FieldByName('nmProduto').AsString;
        SgDados.Cells[1,i] := FormatFloat('0.00',ADOQryProcura.FieldByName('nrQtd').AsFloat);
        SgDados.Cells[2,i] := FormatFloat('0.00',(ADOQryProcura.FieldByName('nrQtd').AsFloat *
          ADOQryProcura.FieldByName('vlPreco').AsFloat));
        ADOQryProcura.Next;
      end;
    end;
  end
  else
  begin
      Label4.caption := 'Vendedor : ';
      LimpaGrid;
  end;
end;

procedure TConsulta_prevenca.LimpaGrid;
var I,C: Integer;
begin
  For I := 1 to SgDados.RowCount do //limpa grid Pecas
    for C := 0 to SgDados.ColCount do
      SgDados.Cells[C,I] := '';
end;

procedure TConsulta_prevenca.DBGrid1CellClick(Column: TColumn);
begin
  if rbVendedor.Checked = true then begin
    //cbxVendedor.SelectAll;
    //cbxVendedor.SetFocus;
  end
  else begin
    //EdtConsulta.SelectAll;
    //EdtConsulta.SetFocus;
  end;
  MontaProdutos;
end;

procedure TConsulta_prevenca.DBGrid1DblClick(Sender: TObject);
begin
  if (ADOQryConsulta.RecordCount > 0) then begin   // enter
    FrmPrincipalPreVenda.Enabled := True;
    Application.OnMessage := FrmPrincipalPreVenda.NaoProcessaMsg;
    FrmPrincipalPreVenda.Enabled := True;
    ativa := 'T';
    FrmPrincipalPreVenda.EdtLancto.Text := ADOQryConsulta.FieldByName('Lancamento').AsString;  // pega o nº do lançamento
    FrmPrincipalPreVenda.EdtLancto.SetFocus;
    FrmPrincipalPreVenda.EdtLancto.SelectAll;
    Application.OnMessage := FrmPrincipalPreVenda.ProcessaMsg;
    close;
  end;
end;

procedure TConsulta_prevenca.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if VK_ESCAPE  = key then
    Close;
  if (Shift = [SsCtrl]) and (key = 46) then
    key := 0;
end;

procedure TConsulta_prevenca.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  edtcodigo.clear;
  if (Key = Char(13)) and (ADOQryConsulta.RecordCount > 0) then
  begin   // enter
    FrmPrincipalPreVenda.Enabled := True;
    Application.OnMessage := FrmPrincipalPreVenda.NaoProcessaMsg;
    FrmPrincipalPreVenda.Enabled := True;
    ativa := 'T';
    FrmPrincipalPreVenda.EdtLancto.Text := ADOQryConsulta.FieldByName('Lancamento').AsString;  // pega o nº do lançamento
    FrmPrincipalPreVenda.EdtLancto.SetFocus;
    FrmPrincipalPreVenda.EdtLancto.SelectAll;
    Application.OnMessage := FrmPrincipalPreVenda.ProcessaMsg;
    close;
  end;
  if Key = Char(27) then
  begin   // ESC
    FrmPrincipalPreVenda.Enabled := True;
    if FrmPrincipalPreVenda.EdtLancto.Text = '*' then
      FrmPrincipalPreVenda.EdtLancto.Clear;
    Application.OnMessage := FrmPrincipalPreVenda.ProcessaMsg;
    close;
  end;
end;

procedure TConsulta_prevenca.DBGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key in [VK_DOWN,VK_UP,VK_LEFT,VK_RIGHT] then
    MontaProdutos;
end;

procedure TConsulta_prevenca.rbClienteClick(Sender: TObject);
begin
  if rbCliente.Checked = true then
  begin
    rbProduto.Checked := not rbCliente.Checked;
    rbVendedor.Checked := not rbCliente.Checked;
    rbReferencia.Checked := not rbCliente.Checked;
    EdtConsulta.Visible := rbCliente.Checked;
    cbxVendedor.Visible := not rbCliente.Checked;
  end;
end;

procedure TConsulta_prevenca.rbClienteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if VK_ESCAPE  = key then
    Close;
end;

procedure TConsulta_prevenca.rbProdutoClick(Sender: TObject);
begin
  if rbProduto.Checked = true then begin
    rbCliente.Checked := not rbProduto.Checked;
    rbVendedor.Checked := not rbProduto.Checked;
    rbReferencia.Checked := not rbProduto.Checked;
    EdtConsulta.Visible := rbProduto.Checked;
    cbxVendedor.Visible := not rbProduto.Checked;
  end;
end;

procedure TConsulta_prevenca.rbProdutoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if VK_ESCAPE  = key then
    Close;
end;

procedure TConsulta_prevenca.rbVendedorClick(Sender: TObject);
begin
  if rbVendedor.Checked = true then begin
    rbCliente.Checked := not rbVendedor.Checked;
    rbProduto.Checked := not rbVendedor.Checked;
    rbReferencia.Checked := not rbVendedor.Checked;
    EdtConsulta.Visible := not rbVendedor.Checked;
    cbxVendedor.Visible := rbVendedor.Checked;
    MontaComboVendedor;
    monta_pedidos;
  end;
end;

procedure TConsulta_prevenca.rbVendedorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if VK_ESCAPE  = key then
    Close;
end;

procedure TConsulta_prevenca.MontaComboVendedor;
var
  funcionario: TFuncionario;
  listaFuncionarios : TList<TFuncionario>;
begin
  cbxVendedor.Items.Clear;
  listaFuncionarios:= TNEGLoja.getFuncionarios(true);
  for funcionario in listaFuncionarios do
    cbxVendedor.Items.Add(funcionario.nome + ' | ' + IntToStr(funcionario.codigo));
  cbxVendedor.Items.Add('<<TODOS>>');
  cbxVendedor.ItemIndex := cbxVendedor.Items.Count - 1;//seleciona o ultimo (todos)
  FreeAndNil(funcionario);
end;

procedure TConsulta_prevenca.edtCodigoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = Char(13)) and (ADOQryConsulta.RecordCount > 0) then begin   // enter
    FrmPrincipalPreVenda.Enabled := True;
    Application.OnMessage := FrmPrincipalPreVenda.NaoProcessaMsg;
    FrmPrincipalPreVenda.Enabled := True;
    FrmPrincipalPreVenda.EdtLancto.Text := ADOQryConsulta.FieldByName('Lancamento').AsString;  // pega o nº do lançamento
    FrmPrincipalPreVenda.EdtLancto.SetFocus;
    FrmPrincipalPreVenda.EdtLancto.SelectAll;
    Application.OnMessage := FrmPrincipalPreVenda.ProcessaMsg;
    close;
  end;
  if Key = Char(27) then begin   // ESC
    FrmPrincipalPreVenda.Enabled := True;
    if FrmPrincipalPreVenda.EdtLancto.Text = '*' then
      FrmPrincipalPreVenda.EdtLancto.Clear;
    Application.OnMessage := FrmPrincipalPreVenda.ProcessaMsg;
    close;
  end;
  ValidarInteiro(key);
end;

procedure TConsulta_prevenca.edtCodigoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_Down then
    BtnMdProximoClick(Self);
  if Key = VK_Up then
    BtnMdAnteriorClick(Self);
  MontaProdutos;
end;

procedure TConsulta_prevenca.edtCodigoChange(Sender: TObject);
begin
  if edtcodigo.Focused then
     if rbCliente.Checked then
        EdtConsulta.Text := getNomePessoa(strToIntDef(edtCodigo.Text, -1))
     else
     if rbProduto.Checked then
        EdtConsulta.Text := getDescricaoProduto(strToIntDef(edtCodigo.Text, -1))
     else
     if rbVendedor.Checked then
        EdtConsulta.Text := getNomeVendedor(strToIntDef(edtCodigo.Text, -1));
end;

end.
