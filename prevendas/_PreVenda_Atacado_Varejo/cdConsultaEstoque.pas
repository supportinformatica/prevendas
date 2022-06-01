unit cdConsultaEstoque;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FrmCadEstados, Db, ExtCtrls, StdCtrls, Grids, DBGrids,
  ComCtrls, Buttons, ImgList, Menus,ADODB, vAriants, System.ImageList;

type
  TAuxDBGrid = class(TDBGrid);

type
  TFrmCdEstoque = class(TFrmMdCadastro)
    CheckBox1: TCheckBox;
    LblListados: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    LblCodigo: TLabel;
    LblBarras: TLabel;
    LblReferencia: TLabel;
    LblDescricao: TLabel;
    LblFabricante: TLabel;
    LblValor: TLabel;
    LblEstoque: TLabel;
    LblPreVenda: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    LblDisponivel: TLabel;
    RadioGroup1: TRadioGroup;
    Cdigo1: TMenuItem;
    Descrio1: TMenuItem;
    CdigodeBarras1: TMenuItem;
    Referncia1: TMenuItem;
    Grupo1: TMenuItem;
    Contendo1: TMenuItem;
    Limpatexto1: TMenuItem;
    ProcuraVendas1: TMenuItem;
    ADOSPConsulta: TADOStoredProc;
    Produtossimilares1: TMenuItem;
    Lbl2meses: TLabel;
    Lbl3meses: TLabel;
    Lbl4meses: TLabel;
    Lbl5meses: TLabel;
    Lbl6meses: TLabel;
    Lbl7meses: TLabel;
    Lbl8meses: TLabel;
    Lbl9meses: TLabel;
    Lbl10meses: TLabel;
    Lbl11meses: TLabel;
    Lbl12meses: TLabel;
    Lbl1Mes: TLabel;
    ConsultaEspecificacao1: TMenuItem;
    ADOQryEspecificacao: TADOQuery;
    Registraperdadevemdaporestoqueinsuficiente1: TMenuItem;
    ADORildon: TADOQuery;
    ReferenciadeFbrica1: TMenuItem;
    Label97: TLabel;
    CBxTpItem: TComboBox;
    Prateleira1: TMenuItem;
    Shape1: TShape;
    ADOSPConsultaCódigo: TIntegerField;
    ADOSPConsultaCódigo_Barras: TStringField;
    ADOSPConsultaReferência: TStringField;
    ADOSPConsultaDescrição: TStringField;
    ADOSPConsultaFabricante: TStringField;
    ADOSPConsultaPreco: TBCDField;
    ADOSPConsultaValor: TBCDField;
    ADOSPConsultacdcodigodic: TStringField;
    ADOSPConsultaPrateleira: TStringField;
    ADOSPConsultaEstoque: TFloatField;
    ADOSPConsultaPedido: TFloatField;
    ADOSPConsultaUnidade: TStringField;
    ADOSPConsultaEmbalagem: TStringField;
    ADOSPConsultaPeso: TFloatField;
    ADOSPConsultaGrupo: TStringField;
    ADOSPConsultaFornecedor: TIntegerField;
    ADOSPConsultadsFLAG: TStringField;
    procedure EdtConsultaChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure EdtConsultaKeyPress(Sender: TObject; var Key: Char);
    procedure CheckBox1Enter(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure PgCtrolMdCadastroChange(Sender: TObject);
    procedure BtnMdPrimeiroClick(Sender: TObject);
    procedure BtnMdAnteriorClick(Sender: TObject);
    procedure BtnMdProximoClick(Sender: TObject);
    procedure BtnMdUltimoClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BtnMdCancelarClick(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure Banese1Click(Sender: TObject);
    procedure HiperCard1Click(Sender: TObject);
    procedure RedeCard1Click(Sender: TObject);
    procedure VisaNet1Click(Sender: TObject);
    procedure AmericanExpress1Click(Sender: TObject);
    procedure Limpatextoparapesquisa1Click(Sender: TObject);
    procedure DescrioContendo1Click(Sender: TObject);
    procedure BtnMdSairClick(Sender: TObject);
    procedure Cdigo1Click(Sender: TObject);
    procedure Descrio1Click(Sender: TObject);
    procedure CdigodeBarras1Click(Sender: TObject);
    procedure Referncia1Click(Sender: TObject);
    procedure Grupo1Click(Sender: TObject);
    procedure Contendo1Click(Sender: TObject);
    procedure Limpatexto1Click(Sender: TObject);
    procedure ProcuraVendas1Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Produtossimilares1Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure ConsultaEspecificacao1Click(Sender: TObject);
    procedure Help1Click(Sender: TObject);
    procedure EdtConsultaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Registraperdadevemdaporestoqueinsuficiente1Click(
      Sender: TObject);
    procedure CBxTpItemChange(Sender: TObject);
    procedure ReferenciadeFbrica1Click(Sender: TObject);
    procedure Prateleira1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    Procedure AtualizaQryConsulta;
    procedure AtualizaDados;
  public
    vTipoForm : integer;
  end;

var
  FrmCdEstoque: TFrmCdEstoque;
  vFlag:string[01];  // 1 ==>seta o foco para o edite, 0 ==>não seta o foco para o edite

implementation

uses MoPreVenda, DataModulo, UfrmCadLista;

{$R *.DFM}

Procedure TFrmCdEstoque.AtualizaQryConsulta;
begin
  vFlag := '0';
  With AdoSPConsulta do
  begin
    Close;
    Parameters.ParamByName('@DSFLAG_S').Value := Null;
    if CheckBox1.Checked = True then
      Parameters.ParamByName('@DSATIVO').Value := 'S'
    else
      Parameters.ParamByName('@DSATIVO').Value := 'N';
    Parameters.ParamByName('@OPCAO').Value     := RadioGroup1.ItemIndex;
    if RadioGroup1.ItemIndex <> 2 then                    // diferente de codigo de barras
      Parameters.ParamByName('@PESQUISA').Value  := EdtConsulta.Text
    else
    begin
      if Copy(EdtConsulta.Text,1,1) = '2' then
        Parameters.ParamByName('@PESQUISA').Value  := Copy(EdtConsulta.Text,1,7)
      else
        Parameters.ParamByName('@PESQUISA').Value  := EdtConsulta.Text;
    end;
    Case RadioGroup1.ItemIndex of
      0: Parameters.ParamByName('@OPCAO').Value := '0'; // pesqisa por codigo do produto
      1: Parameters.ParamByName('@OPCAO').Value := '1'; // pesqisa por nome do produto OU CODIGO DE BARRAS
      3: Parameters.ParamByName('@OPCAO').Value := '3';
      4: Parameters.ParamByName('@OPCAO').Value := '4';
      5: Parameters.ParamByName('@OPCAO').Value := '5';
      2: Parameters.ParamByName('@OPCAO').Value := '2';
      6: Parameters.ParamByName('@OPCAO').Value := '7';
      7: Parameters.ParamByName('@OPCAO').Value := '8';
    end;
    case CBxTpItem.ItemIndex of
      0..11: Parameters.ParamByName('@TIPO_PRODUTO').Value := Copy(CBxTpItem.Text, 1, 2); // copy_campo(CBxTpItem.Items[CBxTpItem.ItemIndex], '-', 2);
    else
      Parameters.ParamByName('@TIPO_PRODUTO').Value := '%';
    end;
    case moPrevenda.vCasasPreco of
      1: begin
        ADOSPConsultaValor.DisplayFormat := '#0.0';
        ADOSPConsultaPreco.DisplayFormat := '#0.0';
      end;
      2: begin
        ADOSPConsultaValor.DisplayFormat := '#0.00';
        ADOSPConsultaPreco.DisplayFormat := '#0.00';
      end;
      3: begin
        ADOSPConsultaValor.DisplayFormat := '#0.000';
        ADOSPConsultaPreco.DisplayFormat := '#0.000';
      end;
      4: begin
        ADOSPConsultaValor.DisplayFormat := '#0.0000';
        ADOSPConsultaPreco.DisplayFormat := '#0.0000';
      end;
      5: begin
        ADOSPConsultaValor.DisplayFormat := '#0.00000';
        ADOSPConsultaPreco.DisplayFormat := '#0.00000';
      end;
    end; // case
    ADOSPConsultaPeso.Visible := False;
    ADOSPConsultaEstoque.DisplayFormat := '#0.000';
    Open;            // mostra os dados no dbgrid
    LblListados.Caption := 'Listados--> ' + IntToStr(RecordCount);
  end;
end;

procedure TFrmCdEstoque.AtualizaDados;
begin
  LblPreVenda.Caption := '0,00';
  LblDisponivel.Caption := '0,00';
  if ADOSPConsulta.RecordCount <> 0 then
  begin
    LblCodigo.Caption := ADOSPConsultaCódigo.AsString;
    LblBarras.Caption := ADOSPConsultaCódigo_Barras.AsString;
    LblReferencia.Caption := ADOSPConsultaReferência.AsString;
    LblDescricao.Caption := ADOSPConsultaDescrição.AsString;
    LblFabricante.Caption := ADOSPConsultaFabricante.AsString;
    lblestoque.Caption := FormatFloat('0.00',ADOSPConsultaEstoque.AsFloat);
    LblValor.Caption := FormatFloat('0.00',ADOSPConsultaValor.AsFloat);
  end
  else
  begin
    LblCodigo.Caption := '';
    LblBarras.Caption := '';
    LblReferencia.Caption := '';
    LblDescricao.Caption := '';
    LblFabricante.Caption := '';
    LblEstoque.Caption := '';
    LblValor.Caption := '0,00';
  end;
  if LblCodigo.Caption <> '' then begin // thiago estava dando erro quando nao tinha nada na grid
    with ADOQrySalvar do begin
      Sql.Text := 'SELECT Sum(I.nrQtd) as Qtd FROM Orcamento O WITH (NOLOCK) INNER JOIN IteOrcamento I WITH (NOLOCK) ' +
      'ON O.nrOrcamento = I.nrOrcamento Where I.cdproduto = :cd_codigo and ' +
      'O.dsImpresso <> ''S'' ';
//      Prepared;
      Parameters.ParamByName('cd_codigo').Value := LblCodigo.Caption;
      open;
      if ADOQrySalvar.FieldByName('Qtd').AsString = '' then begin
        LblDisponivel.Caption := '0,00';
        LblPreVenda.Caption := '0,00';
      end else begin
        LblPreVenda.Caption := FormatFloat('0.00',ADOQrySalvar.FieldByName('Qtd').AsFloat);
        LblDisponivel.Caption := FormatFloat('0.00',StrToFloat(LblEstoque.Caption) -
                                                    ADOQrySalvar.FieldByName('Qtd').AsFloat);
      end;
    end;
  end;
end;

procedure TFrmCdEstoque.EdtConsultaChange(Sender: TObject);
begin
  inherited;
  AtualizaQryConsulta;
  if DBGrid1.Color = clBtnHighlight then;
    DBGrid1.Color := clInfoBk;
end;

procedure TFrmCdEstoque.FormCreate(Sender: TObject);
begin
  inherited;
  if UPPERCASE(MoPreVenda.vEmpresa) <> 'CPF' then //exibe a coluna do pedido so para a CPF
    DBGrid1.Columns.Items[8].Visible := False
  else begin
     DBGrid1.Columns[7].Title.Caption := 'Pedido';
     DBGrid1.Columns[8].Title.Caption := 'Estoque';
  end;
  With CmbConsulta do begin // adiciona itens a combo de consulta
    Items.Add('Código');
    Items.Add('Descrição');
    Items.Add('Código de Barras');
    Items.Add('Referência Intena');
    Items.Add('Grupo');
    Items.Add('Descrição Contendo');
    Items.Add('Referência Fábrica');
    Items.Add('Prateleira');
    ItemIndex := 1;
  end;
  if UPPERCASE(moPrevenda.vEmpresa) = 'RILDON' then begin  // somente p rildon o campo da referencia de fabrica e interna são trocados p esta tela
    RadioGroup1.Items.Clear;
    RadioGroup1.Items.Add('F2 Código');
    RadioGroup1.Items.Add('F3 Descrição');
    RadioGroup1.Items.Add('F4 Código de Barras');
    RadioGroup1.Items.Add('F5 Referência Interna');
    RadioGroup1.Items.Add('F6 Cod Adicional');
    RadioGroup1.Items.Add('F7 Descrição Contendo');
    RadioGroup1.Items.Add('F9 Referência Fábrica');
  end;
  AtualizaQryConsulta;
  PgCtrolMdCadastro.ActivePage := TBSheetMdCadastroConsulta;
end;

procedure TFrmCdEstoque.FormShow(Sender: TObject);
begin
  //inherited;
  //persistirUltimoEstadoForm;
end;

procedure TFrmCdEstoque.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  case vTipoForm of
    1: // cadastro de lista escolar
    begin
      Application.OnMessage := FrmPrincipalPreVenda.ProcessaMsg;
      //FrmSaidas.WindowState := wsNormal;
      FrmCadLista.EdtCdProd.SelectAll;
      FrmCadLista.EdtCdProd.SetFocus;
    end;
  end;
end;

procedure TFrmCdEstoque.FormActivate(Sender: TObject);
begin
  inherited;
  EdtConsulta.SetFocus;
end;

procedure TFrmCdEstoque.EdtConsultaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = Char(13)) and (CmbConsulta.ItemIndex = 2) then
  begin
    vFlag := '1';
    AtualizaQryConsulta;
  end;
  if (Key = Char(13)) and (ADOSPConsulta.RecordCount > 0) then // enter
  begin
    case vTipoForm of // cadastro de lista escolar
      13:
      begin
        Application.OnMessage:= FrmPrincipalPreVenda.NaoProcessaMsg;
        FrmCadLista.EdtCdProd.Text:= ADOSPConsulta.FieldByName('Código').AsString;
        FrmCadLista.edtcdProdChange(Self);
        //FrmCadLista.CbxProduto.Text:= ADOSPConsulta.FieldByName('Descrição').AsString;
        FrmCadLista.CBxProduto.SetFocus;
        Application.OnMessage:= FrmPrincipalPreVenda.ProcessaMsg;
        close;
      end;
    end;
  end;
  if Key = Char(27) then begin   // ESC
    case vTipoForm of
      13: begin // saidas
        FrmCadLista.CbxProduto.Text:= '';
        Application.OnMessage := FrmPrincipalPreVenda.NaoProcessaMsg;
        FrmCadLista.EdtCdProd.Clear;
        FrmCadLista.EdtCdProd.SetFocus;
        Application.OnMessage := FrmPrincipalPreVenda.ProcessaMsg;
        close;
      end;
    end;
  end;
end;

procedure TFrmCdEstoque.CheckBox1Enter(Sender: TObject);
begin
  inherited;
  if vflag = '1' then
     EdtConsulta.SetFocus;
end;

procedure TFrmCdEstoque.CheckBox1Click(Sender: TObject);
begin
  inherited;
  vFlag := '0';
  EdtConsulta.SelectAll;
  EdtConsulta.SetFocus;
  AtualizaQryConsulta;
end;

procedure TFrmCdEstoque.PgCtrolMdCadastroChange(Sender: TObject);
begin
  inherited;
  if PgCtrolMdCadastro.ActivePage = TBSheetMdCadastroDados then begin
    AtualizaDados;
    BtnMdCancelar.Enabled := True;
  end else
    BtnMdCancelar.Enabled := False;
end;

procedure TFrmCdEstoque.BtnMdPrimeiroClick(Sender: TObject);
begin
//  inherited;
  ADOSPConsulta.First; // Primeiro registro
  AtualizaDados;
end;

procedure TFrmCdEstoque.BtnMdAnteriorClick(Sender: TObject);
begin
//  inherited;
  ADOSPConsulta.Prior;
  AtualizaDados;
end;

procedure TFrmCdEstoque.BtnMdProximoClick(Sender: TObject);
begin
//  inherited;
  ADOSPConsulta.Next;
  AtualizaDados;
end;

procedure TFrmCdEstoque.BtnMdUltimoClick(Sender: TObject);
begin
//  inherited;
  ADOSPConsulta.Last;
  AtualizaDados;
end;

procedure TFrmCdEstoque.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
{  PgCtrolMdCadastro.ActivePage := TBSheetMdCadastroDados;
  AtualizaDados;
  BtnMdCancelar.Enabled := True; }
end;

procedure TFrmCdEstoque.BtnMdCancelarClick(Sender: TObject);
begin
  with ADOQrySalvar do begin
    Sql.Text := 'SELECT Sum(I.nrQtd) as Qtd FROM Orcamento O WITH (NOLOCK) INNER JOIN IteOrcamento I WITH (NOLOCK) ' +
    'ON O.nrOrcamento = I.nrOrcamento Where I.cdproduto = :cd_codigo and ' +
    'O.dsFlag = ''C'' and O.dsImpresso <> ''S'' ';
//    Prepared;
    Parameters.ParamByName('cd_codigo').Value := LblCodigo.Caption;
    open;
    if ADOQrySalvar.FieldByName('Qtd').AsString = '' then begin
      LblDisponivel.Caption := '0,00';
      LblPreVenda.Caption := '0,00';
    end else begin
      LblPreVenda.Caption := FormatFloat('0.00',ADOQrySalvar.FieldByName('Qtd').AsFloat);
      LblDisponivel.Caption := FormatFloat('0.00',StrToFloat(LblEstoque.Caption) -
                                                  ADOQrySalvar.FieldByName('Qtd').AsFloat);
    end;
  end;
end;

procedure TFrmCdEstoque.RadioGroup1Click(Sender: TObject);
begin
  inherited;
  CmbConsulta.ItemIndex := RadioGroup1.ItemIndex;
  EdtConsulta.Clear;
  EdtConsulta.SelectAll;
  EdtConsulta.SetFocus;
end;

procedure TFrmCdEstoque.Banese1Click(Sender: TObject);
begin
  inherited;
  RadioGroup1.ItemIndex := 0;
end;

procedure TFrmCdEstoque.HiperCard1Click(Sender: TObject);
begin
  inherited;
  RadioGroup1.ItemIndex := 1;
end;

procedure TFrmCdEstoque.RedeCard1Click(Sender: TObject);
begin
  inherited;
  RadioGroup1.ItemIndex := 2;
end;

procedure TFrmCdEstoque.VisaNet1Click(Sender: TObject);
begin
  inherited;
  RadioGroup1.ItemIndex := 3;
end;

procedure TFrmCdEstoque.AmericanExpress1Click(Sender: TObject);
begin
  inherited;
  RadioGroup1.ItemIndex := 4;
end;

procedure TFrmCdEstoque.Limpatextoparapesquisa1Click(Sender: TObject);
begin
  inherited;
  EdtConsulta.Clear;
  EdtConsulta.SelectAll;
  EdtConsulta.SetFocus;
end;

procedure TFrmCdEstoque.DescrioContendo1Click(Sender: TObject);
begin
  inherited;
  RadioGroup1.ItemIndex := 5;
end;

procedure TFrmCdEstoque.BtnMdSairClick(Sender: TObject);
begin
  inherited;
  case vTipoForm of
    1: FrmCadLista.EdtCdProd.Clear;  // cadastro de lista escolar
  end;
end;

procedure TFrmCdEstoque.Cdigo1Click(Sender: TObject);
begin
  inherited;
  RadioGroup1.ItemIndex := 0;
end;

procedure TFrmCdEstoque.Descrio1Click(Sender: TObject);
begin
  inherited;
  RadioGroup1.ItemIndex := 1;
end;

procedure TFrmCdEstoque.CdigodeBarras1Click(Sender: TObject);
begin
  inherited;
  RadioGroup1.ItemIndex := 2;
end;

procedure TFrmCdEstoque.Referncia1Click(Sender: TObject);
begin
  inherited;
  RadioGroup1.ItemIndex := 3;
end;

procedure TFrmCdEstoque.Grupo1Click(Sender: TObject);
begin
  inherited;
  RadioGroup1.ItemIndex := 4;
end;

procedure TFrmCdEstoque.Contendo1Click(Sender: TObject);
begin
  inherited;
  RadioGroup1.ItemIndex := 5;
end;

procedure TFrmCdEstoque.Limpatexto1Click(Sender: TObject);
begin
  inherited;
  EdtConsulta.Clear;
  EdtConsulta.SelectAll;
  EdtConsulta.SetFocus;
end;

procedure TFrmCdEstoque.ProcuraVendas1Click(Sender: TObject);
//var I,vDias : Integer;
//    vDataI,vDataF : TDateTime;
//    vQtdVenda,vQtdDevol : Real;
begin
//  for I := 0 to 12 do begin
//    case I of
//      0: begin // Giro 30
//       vDataI := Date - 30;
//       vDataF := Date;
//      end;
//     1: begin // Giro 60
//       vDataI := Date - 60;
//       vDataF := Date - 29;
//      end;
//     2: begin // Giro 90
//       vDataI := Date - 90;
//       vDataF := Date - 59;
//      end;
//     3: begin // Giro de 4 meses atrás
//       vDataI := Date - 120;
//       vDataF := Date - 89;
//      end;
//     4: begin // Giro de 5 meses atrás
//       vDataI := Date - 150;
//       vDataF := Date - 119;
//      end;
//     5: begin // Giro de 6 meses atrás
//       vDataI := Date - 180;
//       vDataF := Date - 149;
//      end;
//     6: begin // Giro de 7 meses atrás
//       vDataI := Date - 210;
//       vDataF := Date - 179;
//      end;
//     7: begin // Giro de 8 meses atrás
//       vDataI := Date - 240;
//       vDataF := Date - 209;
//      end;
//     8: begin // Giro de 9 meses atrás
//       vDataI := Date - 270;
//       vDataF := Date - 239;
//      end;
//     9: begin // Giro de 10 meses atrás
//       vDataI := Date - 300;
//       vDataF := Date - 269;
//      end;
//     10: begin // Giro de 11 meses atrás
//       vDataI := Date - 330;
//       vDataF := Date - 299;
//      end;
//     11: begin // Giro de 12 meses atrás
//       vDataI := Date - 365;
//       vDataF := Date - 331;
//     end;
//    end; // case
//    // Totaliza Saídas
//    with ADOQryAlterar do begin
//      Sql.Text := 'Select Sum(I.nrQtd) as Qtd From Itelcto I WITH (NOLOCK) INNER  '+
//                  'JOIN Lancto L WITH (NOLOCK)                                    '+
//                  'ON L.dslancamento = I.dsLancamento and I.cdPessoa = L.cdPessoa '+
//                  'and L.dsStatus = I.dsStatus Where cdProduto = :cdProduto       '+
//                  'and L.dtEmissao >= :dtEmissao and L.dtEmissao <= :dtEmissao2   '+
//                  'and ((L.dsCancelado <> ''S'' and L.dsLancamento_1 is null) or  '+
//                  '(L.dscancelado is null and L.dsLancamento_1 is null))          '+
//                  'and L.dsstatus IN (''E'',''X'',''F'') and I.dsCancelado is null';
//      Parameters.ParamByName('cdProduto').Value  := ADOSPConsulta.FieldByName('Código').Value;
//      Parameters.ParamByName('dtEmissao').Value  := DateToStr(vDataI);
//      Parameters.ParamByName('dtEmissao2').Value := DateToStr(vDataF);
//      Open;
//      vQtdVenda := ADOQryAlterar.FieldByName('Qtd').AsFloat;
//      close;
//      sql.Text := 'Select sum(I.nrQtd) as Qtd                                          '+
//                  'FROM Lancto L WITH (NOLOCK)                                         '+
//                  'INNER JOIN IteLcto I WITH (NOLOCK) ON (L.dsstatus = I.dsstatus) AND '+
//                  '(L.cdPessoa = I.cdPessoa) AND (L.dslancamento = I.dslancamento)     '+
//                  'where L.dtEmissao >= :dtEmissao and L.dtEmissao <= :dtEmissao2      '+
//                  'and I.dsstatus = ''G'' and cdProduto = :cdProduto                   ';
//      Open;
//      vQtdDevol := ADOQryAlterar.FieldByName('Qtd').AsFloat;
//      Parameters.ParamByName('dtEmissao').Value  := DateToStr(vDataI);
//      Parameters.ParamByName('dtEmissao2').Value := DateToStr(vDataF);
//      Parameters.ParamByName('cdProduto').Value  := ADOSPConsulta.FieldByName('Código').Value;
//      Close;
//    end; //with
//    // Move os valores para os captions
//    case I of
//     0: begin// Giro 30
//          Lbl1Mes.Caption := FormatFloat('0.00',vQtdVenda - vQtdDevol);
//          Lbl1Mes.Hint    := DateToStr(vDataI) + ' a ' + DateToStr(vDataF);
//      end;
//     1: begin // Giro 60
//          Lbl2Meses.Caption := FormatFloat('0.00',vQtdVenda - vQtdDevol);
//          Lbl2Meses.Hint    := DateToStr(vDataI) + ' a ' + DateToStr(vDataF);
//      end;
//     2: begin // Giro 90
//          Lbl3Meses.Caption := FormatFloat('0.00',vQtdVenda - vQtdDevol);
//          Lbl3Meses.Hint    := DateToStr(vDataI) + ' a ' + DateToStr(vDataF);
//      end;
//     3: begin // Giro 90
//          Lbl4Meses.Caption := FormatFloat('0.00',vQtdVenda - vQtdDevol);
//          Lbl4Meses.Hint    := DateToStr(vDataI) + ' a ' + DateToStr(vDataF);
//      end;
//     4: begin // Giro 90
//          Lbl5Meses.Caption := FormatFloat('0.00',vQtdVenda - vQtdDevol);
//          Lbl5Meses.Hint    := DateToStr(vDataI) + ' a ' + DateToStr(vDataF);
//      end;
//     5: begin // Giro 90
//          Lbl6Meses.Caption := FormatFloat('0.00',vQtdVenda - vQtdDevol);
//          Lbl6Meses.Hint    := DateToStr(vDataI) + ' a ' + DateToStr(vDataF);
//      end;
//     6: begin // Giro 90
//          Lbl7Meses.Caption := FormatFloat('0.00',vQtdVenda - vQtdDevol);
//          Lbl7Meses.Hint    := DateToStr(vDataI) + ' a ' + DateToStr(vDataF);
//      end;
//     7: begin // Giro 90
//          Lbl8Meses.Caption := FormatFloat('0.00',vQtdVenda - vQtdDevol);
//          Lbl8Meses.Hint    := DateToStr(vDataI) + ' a ' + DateToStr(vDataF);
//      end;
//     8: begin // Giro 90
//          Lbl9Meses.Caption := FormatFloat('0.00',vQtdVenda - vQtdDevol);
//          Lbl9Meses.Hint    := DateToStr(vDataI) + ' a ' + DateToStr(vDataF);
//      end;
//     9: begin // Giro 90
//          Lbl10Meses.Caption := FormatFloat('0.00',vQtdVenda - vQtdDevol);
//          Lbl10Meses.Hint    := DateToStr(vDataI) + ' a ' + DateToStr(vDataF);
//      end;
//     10: begin // Giro 90
//          Lbl11meses.Caption := FormatFloat('0.00',vQtdVenda - vQtdDevol);
//          Lbl11Meses.Hint    := DateToStr(vDataI) + ' a ' + DateToStr(vDataF);
//      end;
//     11: begin // Giro de 12 meses atrás
//          Lbl12Meses.Caption := FormatFloat('0.00',vQtdVenda - vQtdDevol);
//          Lbl12Meses.Hint    := DateToStr(vDataI) + ' a ' + DateToStr(vDataF);
//      end;
//    end; //case}
//  end; // for
//  FrmCdEstoque.Enabled := False;
//  FrmConsultaVendas.vTipoForm := 0;
//  FormConsultaVendas := TFormConsultaVendas.Create(Application); // Cria o formulário
//  FormConsultaVendas.Show;
//  FormConsultaVendas.LblProduto.Caption := AdoSpConsulta.FieldByName('Descrição').AsString;
//  FormConsultaVendas.Lbl1.Caption       := FormatFloat('0.00',StrToFloat(Lbl1Mes.Caption));
//  FormConsultaVendas.Lbl1.hint          := Lbl1Mes.Hint;
//  FormConsultaVendas.Lbl2.Caption       := FormatFloat('0.00',StrToFloat(Lbl2Meses.Caption));
//  FormConsultaVendas.Lbl2.hint          := Lbl2Meses.Hint;
//  FormConsultaVendas.Lbl3.Caption       := FormatFloat('0.00',StrToFloat(Lbl3Meses.Caption));
//  FormConsultaVendas.Lbl3.hint          := Lbl3Meses.Hint;
//  FormConsultaVendas.Lbl4.Caption       := FormatFloat('0.00',StrToFloat(Lbl4Meses.Caption));
//  FormConsultaVendas.Lbl4.hint          := Lbl4Meses.Hint;
//  FormConsultaVendas.Lbl5.Caption       := FormatFloat('0.00',StrToFloat(Lbl5Meses.Caption));
//  FormConsultaVendas.Lbl5.hint          := Lbl5Meses.Hint;
//  FormConsultaVendas.Lbl6.Caption       := FormatFloat('0.00',StrToFloat(Lbl6Meses.Caption));
//  FormConsultaVendas.Lbl6.hint          := Lbl6Meses.Hint;
//  FormConsultaVendas.Lbl7.Caption       := FormatFloat('0.00',StrToFloat(Lbl7Meses.Caption));
//  FormConsultaVendas.Lbl7.hint          := Lbl7Meses.Hint;
//  FormConsultaVendas.Lbl8.Caption       := FormatFloat('0.00',StrToFloat(Lbl8Meses.Caption));
//  FormConsultaVendas.Lbl8.hint          := Lbl8Meses.Hint;
//  FormConsultaVendas.Lbl9.Caption       := FormatFloat('0.00',StrToFloat(Lbl9Meses.Caption));
//  FormConsultaVendas.Lbl9.hint          := Lbl9Meses.Hint;
//  FormConsultaVendas.Lbl10.Caption      := FormatFloat('0.00',StrToFloat(Lbl10Meses.Caption));
//  FormConsultaVendas.Lbl10.hint         := Lbl10Meses.Hint;
//  FormConsultaVendas.Lbl11.Caption      := FormatFloat('0.00',StrToFloat(Lbl11Meses.Caption));
//  FormConsultaVendas.Lbl11.hint         := Lbl11Meses.Hint;
//  FormConsultaVendas.Lbl12.Caption      := FormatFloat('0.00',StrToFloat(Lbl12Meses.Caption));
//  FormConsultaVendas.Lbl12.hint         := Lbl12Meses.Hint;
end;

procedure TFrmCdEstoque.DBGrid1CellClick(Column: TColumn);
begin
  inherited;
  EdtConsulta.SetFocus;
end;

procedure TFrmCdEstoque.Produtossimilares1Click(Sender: TObject);
var cod : string;
begin
  DBGrid1.Color := clBtnHighlight;
  With AdoSPConsulta do begin
    cod := ADOSPConsulta.FieldByName('código').AsString;
    Close;
    Parameters.ParamByName('@CDPRODUTO').Value := cod;
    Parameters.ParamByName('@OPCAO').Value     := '6';
    Open;
    ADOSPConsultaPeso.Visible                  := False;
    ADOSPConsultaEstoque.DisplayFormat         := '#0.000';
    LblListados.Caption := 'Listados--> ' + IntToStr(RecordCount);
  end;
end;

procedure TFrmCdEstoque.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  // Para mudar a cor da linha no DbGrid
  if (TAuxDBGrid(dbgrid1).DataLink.ActiveRecord + 1 = TAuxDBGrid(dbgrid1).Row)  or(gdSelected in State)then begin
    dbgrid1.Canvas.Brush.Color  := clSkyBlue;
    dbgrid1.Canvas.Font.Style   := dbgrid1.Canvas.Font.Style + [fsBold];
  end;
  dbgrid1.Canvas.FillRect(Rect);
  if  (dataCol < 5) or (dataCol > 7)then
    dbgrid1.Canvas.TextOut(Rect.Left + 2,Rect.Top,Column.Field.AsString)
  else dbgrid1.Canvas.TextOut(Rect.Left + 2,Rect.Top,FormatFloat('#0.00',Column.Field.AsFloat));
  if ADOSPConsultaEstoque.AsFloat <= 0 then
  begin
    DBGrid1.Canvas.Font.Color:= clRed;
    DBGrid1.Canvas.FillRect(Rect);
    DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end else begin
    DBGrid1.Canvas.Font.Color:= clBlack;
    DBGrid1.Canvas.FillRect(Rect);
    DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFrmCdEstoque.ConsultaEspecificacao1Click(Sender: TObject);
var i : Integer;
begin
//  inherited;
//  Application.OnMessage := FormPrincipal.NaoProcessaMsg;
//  FrmEspecificacao := TFrmEspecificacao.Create(Application);
//  // pegar os códigos adicionais
//  With ADOQryEspecificacao do begin
//    Sql.Text := 'Select * from CodAdicional WITH (NOLOCK) where cdproduto = '+ ADOSPConsulta.FieldByName('Código').AsString;
//    Open;
//    for i := 0 to RecordCount -1 do begin
//       FrmEspecificacao.SgCodigos.Cells[i,1] := FieldByName('cdAdicional').AsString;
//       Next;
//    end;
//  end;
//  With ADOQryEspecificacao do begin
//     Sql.Clear;
//     Sql.Text := 'Select dsEspecificacao,dsCaminho from Produto WITH (NOLOCK) '+
//                 'Where cdProduto = :CDPRODUTO                  ';
//     Parameters.ParamByName('CDPRODUTO').Value := ADOSPConsulta.FieldByName('Código').AsString;
//     Open;
//  end;
//  FrmEspecificacao.Memo1.Text := ADOQryEspecificacao.FieldByName('dsEspecificacao').AsString;
//  FrmEspecificacao.LblProduto.Caption := ADOSPConsulta.FieldByName('Descrição').AsString;
//  FrmEspecificacao.LblcdBarras.Caption := ADOSPConsulta.FieldByName('Código_Barras').AsString;
//  FrmEspecificacao.LblFab.Caption := ADOSPConsulta.FieldByName('Fabricante').AsString;
//  FrmEspecificacao.LblRefer.Caption := ADOSPConsulta.FieldByName('Referência').AsString;
//  FrmEspecificacao.Lblcod.Caption := ADOSPConsulta.FieldByName('Código').AsString;
//  try
//    FrmEspecificacao.Image1.Picture.LoadFromFile(ADOQryEspecificacao.FieldByName('dsCaminho').AsString);
//  except
//    MessageDlg('Erro ao buscar a foto!',mtInformation,[mbOK],0);
//  end;
//   // FrmEspecificacao.Position := poMainFormCenter; comentei porque estava dando erro com o VCLSKIN
////    Ativa := 'N';
//  FrmEspecificacao.Show;
end;

procedure TFrmCdEstoque.Help1Click(Sender: TObject);
begin
  inherited;
  Application.HelpContext(83);
end;

procedure TFrmCdEstoque.EdtConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//  inherited;
  if Key = VK_Down then
    BtnMdProximoClick(Self);
  if Key = VK_Up then
    BtnMdAnteriorClick(Self);
end;

procedure TFrmCdEstoque.Registraperdadevemdaporestoqueinsuficiente1Click(
  Sender: TObject);
//var
//  vTexto : String[14];
begin
//  if ( ADOSPConsulta.RecordCount = 0 ) then exit;
//  Application.OnMessage := FormPrincipal.NaoProcessaMsg;
//  vtexto := InputBox('Registro de venda perdida',
//  'Entre com a quantidade que o cliente solicitou do produto?', '');
//  Application.OnMessage := FormPrincipal.ProcessaMsg;
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
//      Parameters.ParamByName('CDPESSOA').Value :=  FrmPrincipal.cdOperador;
//      ExecSQL;
//      DModulo.Conexao.CommitTrans;
//    Except
//      on E: Exception do begin
//        DModulo.Conexao.RollbackTrans;
//        Messagedlg('Não foi possível salvar!', mterror, [mbOk], 0);
//      end;
//    end;  // except
//   end;
end;

procedure TFrmCdEstoque.CBxTpItemChange(Sender: TObject);
begin
  inherited;
  AtualizaQryConsulta;
  if DBGrid1.Color = clBtnHighlight then;
    DBGrid1.Color := clInfoBk;
  EdtConsulta.SetFocus;  
end;

procedure TFrmCdEstoque.ReferenciadeFbrica1Click(Sender: TObject);
begin
  inherited;
  RadioGroup1.ItemIndex := 6;
end;

procedure TFrmCdEstoque.Prateleira1Click(Sender: TObject);
begin
  inherited;
  RadioGroup1.ItemIndex := 7;
end;

//procedure TFrmCdEstoque.persistirFormulario;
//var
//  nomeFormulario, arquivo: string;
//begin
//  arquivo:= ExtractFilePath(Application.ExeName) + 'Support.ini';
//  nomeFormulario:= Self.Name;
//  persistirForm(nomeFormulario, 'RadioGroup1.ItemIndex', IntToStr(RadioGroup1.ItemIndex), arquivo);
//  persistirForm(nomeFormulario, 'CBxTpItem.ItemIndex', IntToStr(CBxTpItem.ItemIndex), arquivo);
//  persistirForm(nomeFormulario, 'CmbConsulta.ItemIndex', IntToStr(CmbConsulta.ItemIndex), arquivo);
//  persistirForm(nomeFormulario, 'EdtConsulta.Text', EdtConsulta.Text, arquivo);
//  persistirForm(nomeFormulario, 'CheckBox1.checked', BoolToStr(CheckBox1.checked,True), arquivo);
//  persistirForm(nomeFormulario, 'Cdproduto.setado', ADOSPConsulta.FieldByName('Código').AsString, arquivo);
//end;



//procedure TFrmCdEstoque.persistirUltimoEstadoForm;
//var
//  nomeFormulario: string;
//begin
//  nomeFormulario:= Self.Name;
//  RadioGroup1.ItemIndex:= strToIntDef(ReadSupportIni(nomeFormulario,'RadioGroup1.ItemIndex','') ,1);
//  CBxTpItem.ItemIndex:= strToIntDef(ReadSupportIni(nomeFormulario,'CBxTpItem.ItemIndex','') ,12);
//  CmbConsulta.ItemIndex:= strToIntDef(ReadSupportIni(nomeFormulario,'CmbConsulta.ItemIndex','') ,12);
//  //EdtConsulta.Text:= ReadSupportIni(nomeFormulario,'EdtConsulta.Text','');
//  CheckBox1.checked:= StrToBoolDef(ReadSupportIni(nomeFormulario,'CheckBox1.checked',''), True);
//  ADOSPConsulta.Locate('Código', strToIntDef(ReadSupportIni(nomeFormulario,'cdproduto.setado',''),-1),[]);
//end;



end.
