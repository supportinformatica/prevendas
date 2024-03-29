unit FrmSaida;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DB, Menus, ADODB, ExtCtrls, Buttons,
  ComCtrls;

type
  TFrmRelSaida = class(TForm)
    Label3: TPanel;
    RadioGroup1: TRadioGroup;
    PopupMenu1: TPopupMenu;
    Help1: TMenuItem;
    Banese1: TMenuItem;
    HiperCard1: TMenuItem;
    Cdigo1: TMenuItem;
    RedeCard1: TMenuItem;
    VisaNet1: TMenuItem;
    AmericanExpress1: TMenuItem;
    DescrioContendo1: TMenuItem;
    Produtossimilares1: TMenuItem;
    ConsultaClientepeloCPFouCNPJ1: TMenuItem;
    Registraperdadevemdaporestoqueinsuficiente1: TMenuItem;
    Desconto1: TMenuItem;
    ConsultaEspecificacao1: TMenuItem;
    Excluiritens1: TMenuItem;
    Limpatextoparapesquisa1: TMenuItem;
    ConsultaProduto1: TMenuItem;
    Alterarpreodoproduto1: TMenuItem;
    Cadastrodeclientes1: TMenuItem;
    Consultadecrditodocliente1: TMenuItem;
    Consultavendas1: TMenuItem;
    ADOSPConsulta: TADOStoredProc;
    DBGrid1: TDBGrid;
    LblMdConsulta: TLabel;
    EdtConsulta: TEdit;
    CheckBox1: TCheckBox;
    LblListados: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    DTinicial: TDateTimePicker;
    DTfinal: TDateTimePicker;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    LblEspecificacao: TLabel;
    Label4: TLabel;
    ADOSPConsultaCDIGO: TIntegerField;
    ADOSPConsultaCDIGO_BARRAS: TStringField;
    ADOSPConsultaREFERNCIA: TStringField;
    ADOSPConsultaDESCRIO: TStringField;
    ADOSPConsultaFABRICANTE: TStringField;
    ADOSPConsultaVALOR: TBCDField;
    ADOSPConsultaCDCODIGODIC: TStringField;
    ADOSPConsultaPRATELEIRA: TStringField;
    ADOSPConsultaESTOQUE: TFloatField;
    ADOSPConsultaPEDIDO: TFloatField;
    ADOSPConsultaUNIDADE: TStringField;
    ADOSPConsultaEMBALAGEM: TStringField;
    ADOSPConsultaPESO: TFloatField;
    ADOSPConsultaGRUPO: TStringField;
    ADOSPConsultaFORNECEDOR: TIntegerField;
    Label5: TLabel;
    DataSource1: TDataSource;
    Label30: TLabel;
    CbxCliente: TComboBox;
    EdtCdCliente: TEdit;
    Label8: TLabel;
    ADOQryCliente: TADOQuery;
    Shape2: TShape;
    Label7: TLabel;
    Label6: TLabel;
    edtcdVendedor: TEdit;
    Label9: TLabel;
    edtnmVendedor: TEdit;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure EdtConsultaChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure EdtConsultaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure EdtConsultaKeyPress(Sender: TObject; var Key: Char);
    procedure DTinicialKeyPress(Sender: TObject; var Key: Char);
    procedure Cdigo1Click(Sender: TObject);
    procedure RedeCard1Click(Sender: TObject);
    procedure VisaNet1Click(Sender: TObject);
    procedure AmericanExpress1Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure DescrioContendo1Click(Sender: TObject);
    procedure EdtCdClienteExit(Sender: TObject);
    procedure EdtCdClienteKeyPress(Sender: TObject; var Key: Char);
    procedure CbxClienteChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    Procedure AtualizaQryConsulta;
  public
    { Public declarations }
  end;

var
  FrmRelSaida: TFrmRelSaida;

implementation

uses MoPreVenda, RelEntSai, uFuncoesPadrao, CancelamentoVenda;

{$R *.dfm}

{ TFrmRelSaida }

procedure TFrmRelSaida.AtualizaQryConsulta;
begin
  With AdoSPConsulta do
  begin
    Close;
    Parameters.ParamByName('@DSATIVO').Value := 'S';
    if CheckBox1.Checked = false then
      Parameters.ParamByName('@DSATIVO').Value := Null;
    Parameters.ParamByName('@ATACADOVAREJO').Value := 'V';
    Case RadioGroup1.ItemIndex of
      0: begin
           Parameters.ParamByName('@CDPRODUTO').Value    := EdtConsulta.Text;
           Parameters.ParamByName('@NMPRODUTO').Value    := Null;
           Parameters.ParamByName('@DSREFERENCIA').Value := Null;
           Parameters.ParamByName('@CDCODIGODIC').Value  := Null;
           Parameters.ParamByName('@NMGRUPO').Value      := Null;
           Parameters.ParamByName('@NMPRODUTO2').Value   := Null;
           Parameters.ParamByName('@C_BARRAS').Value     := Null;
         end;
      1: begin
           Parameters.ParamByName('@CDPRODUTO').Value    := Null;
           Parameters.ParamByName('@NMPRODUTO').Value    := EdtConsulta.Text;
           Parameters.ParamByName('@DSREFERENCIA').Value := Null;
           Parameters.ParamByName('@CDCODIGODIC').Value  := Null;
           Parameters.ParamByName('@NMGRUPO').Value      := Null;
           Parameters.ParamByName('@NMPRODUTO2').Value   := Null;
           Parameters.ParamByName('@C_BARRAS').Value     := Null;
         end;
      2: begin
           Parameters.ParamByName('@CDPRODUTO').Value := Null;
           Parameters.ParamByName('@NMPRODUTO').Value := Null;
           Parameters.ParamByName('@DSREFERENCIA').Value := Null;
           Parameters.ParamByName('@CDCODIGODIC').Value  := EdtConsulta.Text;
           Parameters.ParamByName('@NMGRUPO').Value := Null;
           Parameters.ParamByName('@NMPRODUTO2').Value := Null;
           Parameters.ParamByName('@C_BARRAS').Value := Null;
         end;
      3: begin
           Parameters.ParamByName('@CDPRODUTO').Value := Null;
           Parameters.ParamByName('@NMPRODUTO').Value := Null;
           Parameters.ParamByName('@DSREFERENCIA').Value := EdtConsulta.Text;
           Parameters.ParamByName('@CDCODIGODIC').Value  := NULL;
           Parameters.ParamByName('@NMGRUPO').Value := Null;
           Parameters.ParamByName('@NMPRODUTO2').Value := Null;
           Parameters.ParamByName('@C_BARRAS').Value := Null;
         end;
      4: begin
           Parameters.ParamByName('@CDPRODUTO').Value := Null;
           Parameters.ParamByName('@NMPRODUTO').Value := Null;
           Parameters.ParamByName('@DSREFERENCIA').Value := Null;
           Parameters.ParamByName('@CDCODIGODIC').Value  := NULL;
           Parameters.ParamByName('@NMGRUPO').Value := EdtConsulta.Text;
           Parameters.ParamByName('@NMPRODUTO2').Value := Null;
           Parameters.ParamByName('@C_BARRAS').Value := Null;
         end;
      5: begin
           Parameters.ParamByName('@CDPRODUTO').Value := Null;
           Parameters.ParamByName('@NMPRODUTO').Value := Null;
           Parameters.ParamByName('@DSREFERENCIA').Value := Null;
           Parameters.ParamByName('@CDCODIGODIC').Value  := NULL;
           Parameters.ParamByName('@NMGRUPO').Value := Null;
           if LblEspecificacao.Caption <> 'Localizar especifica��o contendo: ' then
             Parameters.ParamByName('@DSREFERENCIA').Value := Copy(LblEspecificacao.Caption,35,length(LblEspecificacao.Caption))
           else
             Parameters.ParamByName('@DSREFERENCIA').Value := null;
           Parameters.ParamByName('@NMPRODUTO2').Value := EdtConsulta.Text;
           Parameters.ParamByName('@C_BARRAS').Value := Null;
         end;
    end; //case
    Case radiogroup1.ItemIndex of
      0: Parameters.ParamByName('@OPCAO').Value   := '0'; // pesqisa por codigo do produto
      1: Parameters.ParamByName('@OPCAO').Value   := '1'; // pesqisa por nome do produto OU CODIGO DE BARRAS
      2: Parameters.ParamByName('@OPCAO').Value   := '2';
      3: Parameters.ParamByName('@OPCAO').Value   := '3';
      4: Parameters.ParamByName('@OPCAO').Value   := '4';
    end;
    ADOSPConsultaValor.DisplayFormat   := '#0.00';
    ADOSPConsultaEstoque.DisplayFormat := '#0.00';
    ADOSPConsultaPedido.DisplayFormat  := '#0.00';
    Open;   // mostra os dados no dbgrid
    LblListados.Caption := 'Listados--> ' + IntToStr(ADOSPConsulta.RecordCount);
  end; // if
end;

procedure TFrmRelSaida.BitBtn2Click(Sender: TObject);
begin
  //FrmPrincipalPreVenda.Enabled := True;
  CLose;
end;

procedure TFrmRelSaida.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := cafree;
end;

procedure TFrmRelSaida.FormCreate(Sender: TObject);
begin
  AtualizaQryConsulta;
  With ADOQryCliente do
  begin // monta a combo dos clientes
    Sql.Text := 'SELECT P.nmPessoa,P.cdPessoa,E.nmLogradouro,T.dsNaturalidade as Apelido,C.dsPreVenda                                    '+
                'FROM P_Fisica as T WITH (nolock) INNER JOIN Endereco as E WITH (nolock) ON T.cdPessoa = E.cdPessoa INNER JOIN           '+
                'Pessoa as P WITH (nolock) ON T.cdPessoa = P.cdPessoa INNER JOIN Cliente as C WITH (nolock) ON C.cdPessoa = P.cdPessoa   '+
                'AND E.cdPessoa = P.cdPessoa                                                                                             '+
                'Where P.ser = ''C'' and P.dsAtivo = ''S''                                                                               '+
                'union                                                                                                                   '+
                'SELECT P.nmPessoa,P.cdPessoa,E.nmLogradouro,T.nmRazao as Apelido,C.dsPreVenda                                           '+
                'FROM P_Juridica as T WITH (nolock) INNER JOIN Endereco as E WITH (nolock) ON T.cdPessoa = E.cdPessoa INNER JOIN         '+
                'Pessoa as P WITH (nolock) ON T.cdPessoa = P.cdPessoa INNER JOIN Cliente as C WITH (nolock)  ON C.cdPessoa = P.cdPessoa '+
                'AND E.cdPessoa = P.cdPessoa                                                                                             '+
                'Where P.ser = ''C'' and P.dsAtivo = ''S'' Order By P.nmPessoa                                                           ';
    MontaComboListBoolADO(ADOQryCliente,CbxCliente);
    CbxCliente.items.add('  <<Todos>>');
    CbxCliente.text := '  <<Todos>>';
  end;  
  DtInicial.date := date;
  DtFinal.date   := date;
end;

procedure TFrmRelSaida.EdtConsultaChange(Sender: TObject);
begin
    AtualizaQryConsulta;
end;

procedure TFrmRelSaida.FormActivate(Sender: TObject);
begin
  if NOT (FrmCancelamentoVenda.Possui_Permissao('854','V',FrmPrincipalPreVenda.cbxUsuario.Text,FrmPrincipalPreVenda.EdtUsuario.Text,false)) then begin
    edtcdVendedor.Text := FrmPrincipalPreVenda.EdtCdNome.Text;
    edtnmVendedor.Text := FrmPrincipalPreVenda.CbxNome.Text;
  end
  else
  begin
    edtcdVendedor.text := '';
    edtnmVendedor.text := '<<TODOS>>';
  end;
  edtConsulta.setfocus;
end;

procedure TFrmRelSaida.EdtConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_Down then
  begin
    ADOSPConsulta.Next;
  end;
  if Key = VK_Up then
  begin
    ADOSPConsulta.Prior;
  end;

end;

procedure TFrmRelSaida.BitBtn1Click(Sender: TObject);
begin
  FrmRelEntSai := TFrmRelEntSai.Create(Self);
  if RadioGroup1.ItemIndex = 6 then
  begin
    if trim(CbxCliente.Text) = '<<TODOS>>' then
    begin
      Application.MessageBox('Selecione o cliente!','Aten��o', MB_OK + MB_ICONWARNING);
      exit;
    end;
  end;
  With FrmRelEntSai.ADOQryRelDados do
  begin
    Sql.Text := 'Select L.dsLancamento,L.dtEmissao,L.Dt_Efefiva_E_S,L.dsCFOP,L.cdComissao,L.vlValor,   '+
                'L.vlDesconto,L.dsCancelado,P.cdFabricante,P.nmProduto,P.cdPessoa,I.nrQtd,I.vlUnitario,'+
                'I.vlunitario_Bruto,I.cdProduto,C.nmPessoa,P.dsReferencia,L.dsStatus,L.dsLancamento_1  '+
                'From Lancto AS L WITH (nolock),IteLcto AS I WITH (nolock),Produto AS P WITH (nolock), '+
                'Pessoa AS C WITH (nolock), Grupo as G                                                 '+
                'Where L.dsLancamento = I.dsLancamento and L.cdPessoa = I.cdPessoa                     '+
                'and L.dsstatus = I.dsStatus and C.cdPessoa = L.cdPessoa                               '+
                'and P.cdGrupo = G.cdGrupo and L.dtEmissao BETWEEN :DTE1 and :DTE2                     '+
                'and I.dsCancelado is Null and I.dsstatus IN (''E'',''X'',''F'') and (L.dsCancelado    '+
                'not in (''S'',''D'') or L.dsCancelado is null) and I.cdProduto = P.cdProduto          ';
    if RadioGroup1.ItemIndex <> 6 then
    begin
      if (ADOSPConsulta.fieldbyname('c�digo').AsString <> '') and (ADOSPConsulta.RecordCount > 0) then begin
        Sql.Add('and I.cdProduto = :CDPRODUTO ');
        Parameters.ParamByName('CDPRODUTO').Value := ADOSPConsulta.fieldbyname('C�digo').AsString;
      end;
    end;
    if NOT (FrmCancelamentoVenda.Possui_Permissao('854','V',FrmPrincipalPreVenda.cbxUsuario.Text,FrmPrincipalPreVenda.EdtUsuario.Text,false)) then begin
      Sql.Add('and L.cdComissao = :CDCOMISSAO');
      Parameters.ParamByName('CDCOMISSAO').Value := FrmPrincipalPreVenda.vcdVendedor;
    end;
    if trim(edtcdcliente.Text) <> '' then
    begin
      Sql.Add('and L.cdPessoa = :CDPESSOA  ');
      Parameters.ParamByName('CDPESSOA').Value  := edtcdcliente.text;
    end;
    Sql.Add('UNION Select L.dsLancamento,L.dtEmissao,L.Dt_Efefiva_E_S,L.dsCFOP,L.cdComissao,       ');
    Sql.Add('L.vlValor,L.vlDesconto,L.dsCancelado,P.cdFabricante,P.nmProduto,P.cdPessoa,I.nrQtd,   ');
    Sql.Add('I.vlUnitario,I.vlunitario_Bruto,I.cdProduto,C.nmPessoa,P.dsReferencia,L.dsStatus,     ');
    Sql.Add('L.dsLancamento_1                                                                      ');
    Sql.Add('From Lancto AS L  WITH (nolock),IteLcto AS I WITH (nolock),Produto AS P WITH (nolock),');
    Sql.Add('Pessoa AS C WITH (nolock), Grupo as G WITH (nolock)                                   ');
    Sql.Add('Where L.dsLancamento = I.dsLancamento and L.cdPessoa = I.cdPessoa                     ');
    Sql.Add('and L.dsstatus = I.dsStatus and C.cdPessoa = L.cdPessoa and P.cdGrupo = G.cdGrupo     ');
    Sql.Add('and L.dtEmissao BETWEEN :DTE11 and :DTE21 and ((I.dsstatus IN                         ');
    Sql.Add('(''G'',''Q'',''K'',''H'') and L.Aidf = ''0.00'')or(I.dsstatus = ''L'')) and I.cdProduto = P.cdProduto          ');
    if RadioGroup1.ItemIndex <> 6 then
    begin
      if (ADOSPConsulta.fieldbyname('c�digo').AsString <> '') and (ADOSPConsulta.RecordCount > 0) then
      begin
        Sql.Add('and I.cdProduto = :CDPRODUTO1 ');
        Parameters.ParamByName('CDPRODUTO1').Value := ADOSPConsulta.fieldbyname('C�digo').AsString;
      end;
    end;
    if NOT (FrmCancelamentoVenda.Possui_Permissao('854','V',FrmPrincipalPreVenda.cbxUsuario.Text,FrmPrincipalPreVenda.EdtUsuario.Text,false)) then begin
      Sql.Add('and L.cdComissao = :CDCOMISSAO1');
      Parameters.ParamByName('CDCOMISSAO1').Value := FrmPrincipalPreVenda.vcdVendedor;
    end;
    if trim(edtcdcliente.Text) <> '' then
    begin
      Sql.Add('and L.cdPessoa = :CDPESSOA1   ');
      Parameters.ParamByName('CDPESSOA1').Value  := edtcdcliente.text;
    end;
    Sql.Add('Order by L.dtEmissao, L.dsLancamento, C.nmPessoa ');
    Parameters.ParamByName('DTE1').Value  := DtInicial.Date;
    Parameters.ParamByName('DTE2').Value  := DtFinal.Date;
    Parameters.ParamByName('DTE11').Value := DtInicial.Date;
    Parameters.ParamByName('DTE21').Value := DtFinal.Date;
    Open;
    FrmRelEntSai.QRGroup1.Expression  := 'ADOQryRelDados.dsLancamento+ADOQryRelDados.dsStatus';
    FrmRelEntSai.QRLblSelecao.Caption := 'Produto-> '+ADOSPConsulta.fieldbyname('Descri��o').AsString;
    FrmRelEntSai.QRLblTitulo.Caption  := 'Sa�das';
    FrmRelEntSai.QRLblPeriodo.Caption :=  DateToStr(DtInicial.date)+' � '+DateToStr(DtFinal.date);
    FrmRelEntSai.QRLblSelecao.Caption := '';
    FrmRelEntSai.QRLblSelec.Caption   := '';
    FrmRelEntSai.QRMdRel.Preview;
    FrmRelEntSai.Free;
  end;
end;

procedure TFrmRelSaida.EdtConsultaKeyPress(Sender: TObject; var Key: Char);
begin
  if key = Char(27) then
  begin
     FrmPrincipalPreVenda.Enabled := True;
     Close;
  end;
end;

procedure TFrmRelSaida.DTinicialKeyPress(Sender: TObject; var Key: Char);
begin
  if key = Char(27) then
  begin
     FrmPrincipalPreVenda.Enabled := True;
     Close;
  end;
end;

procedure TFrmRelSaida.Cdigo1Click(Sender: TObject);
begin
  RadioGroup1.ItemIndex := 0;
end;

procedure TFrmRelSaida.RedeCard1Click(Sender: TObject);
begin
  RadioGroup1.ItemIndex := 1;
end;

procedure TFrmRelSaida.VisaNet1Click(Sender: TObject);
begin
  RadioGroup1.ItemIndex := 2;
end;

procedure TFrmRelSaida.AmericanExpress1Click(Sender: TObject);
begin
 RadioGroup1.ItemIndex := 3;
end;

procedure TFrmRelSaida.RadioGroup1Click(Sender: TObject);
var vIdent : String[20];
    I : Integer;
begin
  if RadioGroup1.ItemIndex = 5 then
  begin
    Application.OnMessage := FrmPrincipalPreVenda.NaoProcessaMsg;
    vIdent := InputBox('Localizar tamb�m pela especifica��o', 'Entre com o texto para pesquisa, ou pressione enter para cotinuar!', '');
    Application.OnMessage := FrmPrincipalPreVenda.ProcessaMsg;
    if LblEspecificacao.Caption <> 'Localizar especifica��o contendo: ' then
    begin
      LblEspecificacao.Visible := true;
      LblEspecificacao.Caption := 'Localizar especifica��o contendo: ' + vIdent;
    end else
    begin
      LblEspecificacao.Caption := 'Localizar especifica��o contendo: ';
      LblEspecificacao.Visible := False;
    end;
  end else
    LblEspecificacao.Visible := False;

  if RadioGroup1.ItemIndex = 6 then
    DBGrid1.Enabled := false
  else
    DBGrid1.Enabled := True;
  EdtConsulta.Clear;
  EdtConsulta.SelectAll;
  EdtConsulta.SetFocus;
end;

procedure TFrmRelSaida.DescrioContendo1Click(Sender: TObject);
begin
  RadioGroup1.ItemIndex := 4;
end;

procedure TFrmRelSaida.EdtCdClienteExit(Sender: TObject);
begin
  if (Length(EdtCdCliente.Text) > 0) then
  begin
    ADOQryCliente.Open;
    if (ADOQryCliente.Locate('cdPessoa',EdtCdCliente.Text,[]))  then
      cbxCliente.Text := ADOQryCliente.FieldByName('nmPessoa').AsString
    else
      cbxCliente.Clear;
  end else
  begin
    cbxCliente.ItemIndex := -1;
    cbxCliente.Text := '';
  end;
end;

procedure TFrmRelSaida.EdtCdClienteKeyPress(Sender: TObject;
  var Key: Char);
begin
  ValidarInteiro(key);
end;

procedure TFrmRelSaida.CbxClienteChange(Sender: TObject);
begin
  ADOQryCliente.Open;
  if ADOQryCliente.Locate('nmPessoa',CbxCliente.Text,[]) then
    EdtCdCliente.Text := ADOQryCliente.FieldbyName('cdPessoa').AsString
  else
    EdtCdCliente.clear;
end;

end.
