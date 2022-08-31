unit CdCreditoCliente;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FrmCadEstados, Db,  ExtCtrls, StdCtrls, Grids, DBGrids,
  ComCtrls, Buttons, ImgList, Menus, ADODB, System.ImageList;

type
  TFrmCreditoCliente = class(TFrmMdCadastro)
    RgConsulta: TRadioGroup;
    EdtValor: TEdit;
    Label1: TLabel;
    Relaodeitens1: TMenuItem;
    Label24: TLabel;
    Lblend: TLabel;
    LblBairro: TLabel;
    LblCPF: TLabel;
    LblRG: TLabel;
    LblRazao: TLabel;
    Label3: TLabel;
    EdtQtdCompras: TEdit;
    Label4: TLabel;
    EdtValorCompras: TEdit;
    Label5: TLabel;
    EdtTicketMedio: TEdit;
    Label6: TLabel;
    EdtChCompensar: TEdit;
    Label7: TLabel;
    EdtReceber: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    EdtRecebimentos: TEdit;
    Label10: TLabel;
    EdtChCompensados: TEdit;
    Label11: TLabel;
    EdtAtraso: TEdit;
    RadioGroup1: TRadioGroup;
    Bevel3: TBevel;
    BitBtn1: TBitBtn;
    ProgressBar1: TProgressBar;
    Label2: TLabel;
    Edit1: TEdit;
    EdtCdCliente: TEdit;
    SBtnTelefone: TSpeedButton;
    SpeedButton1: TSpeedButton;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    edtUltimaCompra: TEdit;
    edtMaiorCompra: TEdit;
    Label15: TLabel;
    LocalizaLanamento1: TMenuItem;
    ImprimeRecibodaParcelaSelecionada1: TMenuItem;
    Label16: TLabel;
    Edit2: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CmbConsultaChange(Sender: TObject);
    procedure RgConsultaClick(Sender: TObject);
    procedure Relaodeitens1Click(Sender: TObject);
    procedure CBCodigoCliKeyPress(Sender: TObject; var Key: Char);
    procedure Help1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure CBCodigoCliChange(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure EdtCdClienteExit(Sender: TObject);
    procedure SBtnTelefoneClick(Sender: TObject);
    procedure BtnMdImprimirClick(Sender: TObject);
    procedure EdtCdClienteKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton1Click(Sender: TObject);
    procedure LocalizaLanamento1Click(Sender: TObject);
    procedure ImprimeRecibodaParcelaSelecionada1Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure EdtCdClienteEnter(Sender: TObject);
  private
    vcheque,vtotal : Real;
    { Private declarations }
    Procedure AtualizaQryConsulta;
    procedure CarregarValores;
    procedure LimpaCampos;


  public
    { Public declarations }
  end;

var
  FrmCreditoCliente: TFrmCreditoCliente;
  vCdPessoa:String[06];
implementation

uses MoPreVenda, uFuncoesPadrao, RelEntSai, DataModulo, CdTelefone,
  RelReceber, RelRecibo2, System.DateUtils;

{$R *.DFM}

procedure TFrmCreditoCliente.AtualizaQryConsulta;
var
  vData,vDataAtual : String[10];
  VALOR : STRING[50];
  TAM   : INTEGER;
begin  // a variavel vDtBloqueio ven do create do frmprincipal
  vData := DateToStr(Date - vDtBloqueio);
  vDataAtual := DateToStr(Date);
  vtotal := 0;
  vcheque := 0;
  SubstituiTexto(EdtValor.Text,'.');
  SubstituiTexto(EdtConsulta.Text,'.');
  LblCmbConsulta.Caption := 'Saldo';
  With ADOQryExcluir do  // rotina para pegar o limite de credito do cliente
  begin
    Open;
    Locate('cdPessoa',EdtcdCliente.Text,[]);
    EdtConsulta.Text := FormatFloat('0.00',FieldByName('Credito').AsFloat);
    vCdPessoa        := FieldByName('cdPessoa').AsString;
    Close;
  end;
  ProgressBar1.Position := 40;
  With ADOQryConsulta do begin
    case RgConsulta.ItemIndex of
      1: begin     // em atraSo
        Sql.Text := 'Select DISTINCT P.dsLancamento as Lançamento,                                                  '+
                    'P.dsDocumento as Documento,L.dtemissao as Emissao,dtVencimento as Vencimento,REPLACE( ''R$ ''+ '+
                    'CAST(((P.VLVALOR + P.VLACRESCIMO)-(P.VLDESCONTO + P.VLAMORTIZADO))                             '+
                    'AS VARCHAR),''.'','','') AS Saldo,L.dsLancamento_1 as NF,                                      '+
                    'DATEDIFF(DD,P.dtVencimento,GETDATE()) as Dias_Atraso From Parcela as P WITH (nolock)           '+
                    'INNER JOIN LANCTO as L WITH (nolock) ON (P.dsLancamento = L.dsLancamento and                   '+
                    'P.cdPessoa = L.cdPessoa and P.dsStatus = L.dsStatus)                                           '+
                    'Where P.cdPessoa = :cdPessoa and L.cdconvenio is null and                                      '+
                    '((P.vlValor + P.vlAcrescimo)-(P.vlDesconto + P.vlAmortizado)) > 0                              '+
                    'and P.dtVencimento <= :dtVencimento and L.dsCancelado is null                                  '+
                    'and L.dsStatus <> ''Y''                                                                        '+
                    'Order By P.dtVencimento                                                                        ';
        Parameters.ParamByName('dtVencimento').Value := (Date - vDtBloqueio);
        Parameters.ParamByName('cdPessoa').Value := vCdPessoa;
      end;
      2: begin // limite de crédito
        //LblCmbConsulta.Caption := 'Saldo + Cheques P';
        SQL.Text := 'Select Sum(vlCheque) as Saldo From Cheque WITH (nolock) '+
                    'Where dsStatus = ''A'' and cdPessoa = :cdPessoa ';
        Parameters.ParamByName('cdPessoa').Value := vCdPessoa;
        open;
        vcheque := FieldByName('Saldo').AsFloat;
        edtChCompensar.Text := FormatFloat('#,##0.00',vcheque);
        Sql.Text := 'Select Sum(vlCheque) as Saldo From Cheque WITH (nolock) '+
                    'Where dsStatus = ''D'' and dsSitCheque = ''N'' '+
                    'and cdPessoa = :cdPessoa                       ';
        Parameters.ParamByName('cdPessoa').Value := vCdPessoa;
        open;
        vcheque := FieldByName('Saldo').AsFloat;
        edit2.Text := FormatFloat('#,##0.00',vcheque);
        SQL.Text := 'SELECT DISTINCT P.DSLANCAMENTO AS Lançamento,                                             '+
                    'P.DSDOCUMENTO AS Documento,L.DtEmissao as Emissao,                                        '+
                    'P.DTVENCIMENTO AS Vencimento,REPLACE( ''R$ ''+                                            '+
                    'CAST(((P.VLVALOR + P.VLACRESCIMO)-(P.VLDESCONTO + P.VLAMORTIZADO))                        '+
                    'AS VARCHAR),''.'','','')AS Saldo,L.dsLancamento_1 as NF,P.dsObservacao as Observação,     '+
                    'P.cdPessoa                                                                                '+
                    'FROM PARCELA P WITH (nolock) INNER JOIN LANCTO as L WITH (nolock) ON                      '+
                    '(P.dsLancamento = L.dsLancamento and P.cdPessoa = L.cdPessoa and P.dsStatus = L.dsStatus) '+
                    'WHERE L.cdPessoa = :cdPessoa and L.cdconvenio is null and L.dsCancelado is null           '+
                    'and ((P.VLVALOR + P.VLACRESCIMO)-(P.VLDESCONTO + P.VLAMORTIZADO)) > 0                     '+
                    'and L.dsStatus <> ''Y''                                                                   '+
                    'ORDER BY P.DTVENCIMENTO                                                                   ';
        Parameters.ParamByName('cdPessoa').Value := vCdPessoa;
      end;
      3: begin          // Crédito
        //LblCmbConsulta.Caption := 'Saldo + Cheques P ';
        SQL.Text := 'Select Sum(vlCheque) as Saldo From Cheque WITH (nolock) '+
                    'Where dsStatus = ''A'' and cdPessoa = :cdPessoa ';
        Parameters.ParamByName('cdPessoa').Value := vCdPessoa;
        open;
        vcheque := FieldByName('Saldo').AsFloat;
        SQL.Text := 'SELECT DISTINCT P.DSLANCAMENTO AS Lançamento,                                             '+
                    'P.DSDOCUMENTO AS Documento,L.dtEmissao as Emissao,                                        '+
                    'P.DTVENCIMENTO AS Vencimento,REPLACE( ''R$ ''+                                            '+
                    'CAST(((P.VLVALOR + P.VLACRESCIMO)-(P.VLDESCONTO + P.VLAMORTIZADO))                        '+
                    'AS VARCHAR),''.'','','')AS Saldo,P.dsObservacao as Observação                             '+
                    'FROM PARCELA P WITH (nolock) INNER JOIN LANCTO as L WITH (nolock) ON                      '+
                    '(P.dsLancamento = L.dsLancamento and P.cdPessoa = L.cdPessoa and P.dsStatus = L.dsStatus) '+
                    'WHERE L.cdPessoa = :cdPessoa and L.cdconvenio is null and L.dsCancelado is null           '+
                    'and ((P.VLVALOR + P.VLACRESCIMO)-(P.VLDESCONTO + P.VLAMORTIZADO)) > 0                     '+
                    'and L.dsStatus = ''Y''                                                                    '+
                    'ORDER BY P.DTVENCIMENTO                                                                   ';
        Parameters.ParamByName('cdPessoa').Value := vCdPessoa;
      end;
      0: begin
        Sql.Text := 'Select DISTINCT B.nmBanco as Banco,C.dsCheque as Cheque,             '+
                    'C.dtCadastro as Cadastro,C.dtCompensacao as Data,C.vlCheque as Saldo,'+
                    'DATEDIFF(DD,C.dtCompensacao,GETDATE()) as Dias_Atraso                '+
                    'From Cheque AS C WITH (nolock) INNER JOIN Banco B  WITH (nolock)     '+
                    'ON B.cdBanco = C.cdBanco                                             '+
                    'Where C.dsStatus = ''D'' and C.cdPessoa = :cdPessoa                  '+
                    'and C.dsSitCheque = ''N''                                            '+
                    'Order By C.dtCompensacao                                             ';
        Parameters.ParamByName('cdPessoa').Value := vCdPessoa;
      end;
    end;  // case
    Open;
    ProgressBar1.Position := 90;
    DBGrid1.Columns[4].Width := 70; //Ajustando o tamanho da coluna SALDO
    DBGrid1.Columns[2].Width := 70;
    DBGrid1.Columns[3].Width := 70;
    While not ADOQryConsulta.Eof do begin
      if (RgConsulta.ItemIndex = 0) then
        vtotal := vtotal + FieldByName('Saldo').AsFloat
      else begin // retirar o "R$ " da coluna SALDO para efetuar a soma
        VALOR  := FieldByName('Saldo').AsString;
        TAM    := LENGTH(VALOR);
        vtotal := vtotal + strtofloat(Copy(VALOR,3,TAM));
      end;
      ADOQryConsulta.Next;
    end;
    First;  // primeiro registro
    EdtValor.Text    := FormatFloat('#,##0.00',vTotal);
    EdtConsulta.Text := FormatFloat('#,##0.00',StrToFloat(EdtConsulta.Text));
  end; // with qry...
  ProgressBar1.Position := 0;
  if RgConsulta.ItemIndex = 2 then begin
    if UPPERCASE(vEmpresa) = 'RILDON' then
      Edit1.Text := FormatFloat('#,##0.00',StrToFloat(SubstituiTexto(EdtConsulta.Text,'.')) -
                    (StrToFloat(SubstituiTexto(EdtValor.Text,'.')) +
                    //StrToFloat(SubstituiTexto(edit2.Text,'.')) +
                    StrToFloat(SubstituiTexto(EdtChCompensar.Text,'.'))))
      else Edit1.Text := FormatFloat('#,##0.00',StrToFloat(SubstituiTexto(EdtConsulta.Text,'.')) - StrToFloat(SubstituiTexto(EdtValor.Text,'.')))
  end
  else
    Edit1.Text := '0,00';
  if StrToFloat(SubstituiTexto(EdtValor.Text,'.')) < 0 then
    Edit1.Font.Color := clRed
  else
    Edit1.Font.Color := clBlack;
end;

procedure TFrmCreditoCliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FrmprincipalPreVenda.Enabled := True;
end;

procedure TFrmCreditoCliente.FormActivate(Sender: TObject);
begin
  inherited;
//  CmbConsulta.SetFocus;
  EdtcdCliente.SetFocus;
end;

procedure TFrmCreditoCliente.FormCreate(Sender: TObject);
begin
  inherited;
  With AdoQryExcluir do begin
{    Sql.Text := 'Select P.nmPessoa as Devedor,P.cdPessoa                                                   '+
                'FROM (Pessoa  P INNER JOIN (P_Fisica W INNER JOIN Endereco E ON W.cdPessoa = E.cdPessoa)   '+
                'ON (P.cdPessoa = W.cdPessoa) AND                                                           '+
                '(P.cdPessoa = E.cdPessoa)) INNER JOIN Cliente C ON P.cdPessoa = C.cdPessoa                 '+
                'Where P.ser in (''C'',''U'')                                                               '+
                'union                                                                                      '+
                'Select P.nmPessoa as Devedor,P.cdPessoa '+
                'FROM (Pessoa  P INNER JOIN (P_Juridica W INNER JOIN Endereco E ON W.cdPessoa = E.cdPessoa) '+
                'ON (P.cdPessoa = W.cdPessoa) AND                                                           '+
                '(P.cdPessoa = E.cdPessoa)) INNER JOIN Cliente C ON P.cdPessoa = C.cdPessoa                 '+
                'Where P.ser in (''C'',''U'') Order by 1                                                    ';
    MontaComboListBoolAdo(AdoQryExcluir,CmbConsulta); }
    Sql.Text := 'Select P.nmPessoa as Devedor,P.cdPessoa as cdPessoa,P.Existir as Existir,E.nmLogradouro as Logradouro, '+
                'E.dsComplemento as Complemento,E.dsCEP as CEP,C.dsLimCredito as Credito,                               '+
                'E.dsBairro as Bairro,E.dsCidade as Cidade,E.dsUF as UF,W.dsIdentidade as Razao,                        '+
                'W.dsCPF as CPF, W.dsInscricaoEstadual as RG,P.dtCadastro                                               '+
                'FROM (Pessoa P WITH (nolock) INNER JOIN (P_Fisica W WITH (nolock) INNER JOIN Endereco E WITH (nolock) ON W.cdPessoa = E.cdPessoa) '+
                'ON (P.cdPessoa = W.cdPessoa) AND                                                                       '+
                '(P.cdPessoa = E.cdPessoa)) INNER JOIN Cliente C WITH (nolock) ON P.cdPessoa = C.cdPessoa               '+
                'Where P.ser in (''C'',''U'')                                                                           '+
                'union                                                                                                  '+
                'Select P.nmPessoa as Devedor,P.cdPessoa as cdPessoa,P.Existir as Existir,E.nmLogradouro as Logradouro, '+
                'E.dsComplemento as Complemento,E.dsCEP as CEP,C.dsLimCredito as Credito,                               '+
                'E.dsBairro as Bairro,E.dsCidade as Cidade,E.dsUF as UF,W.nmRazao as Razao,                             '+
                'W.CGC as CPF, W.dsInscricaoEstadual as RG,P.dtCadastro                                                 '+
                'FROM (Pessoa P WITH (nolock) INNER JOIN (P_Juridica W WITH (nolock) INNER JOIN Endereco E WITH (nolock) ON W.cdPessoa = E.cdPessoa) '+
                'ON (P.cdPessoa = W.cdPessoa) AND                                                                       '+
                '(P.cdPessoa = E.cdPessoa)) INNER JOIN Cliente C WITH (nolock) ON P.cdPessoa = C.cdPessoa               '+
                'Where P.ser in (''C'',''U'') Order by 1                                                                ';
//    MontaComboListBoolAdo(AdoQryExcluir,CmbConsulta);
    MontaComboListComposto(AdoQryExcluir, CmbConsulta, 2); // tbsDados
  end;
  CmbConsulta.ItemIndex := -1;
  EdtCdCliente.Clear;
end;

procedure TFrmCreditoCliente.CmbConsultaChange(Sender: TObject);
begin
//  if CmbConsulta.ItemIndex <> -1 then
//  begin
//    AdoQryExcluir.Open;
//    if AdoQryExcluir.Locate('Devedor',CmbConsulta.Text,[]) then
//      EdtCdCliente.Text := AdoQryExcluir.FieldByName('cdPessoa').AsString
//    else
//      EdtCdCliente.Clear;
//  end;
  if CmbConsulta.ItemIndex <> -1 then
    EdtCdCliente.Text := copy_campo(CmbConsulta.Text,'|',2)
  else
    EdtCdCliente.Clear;
  LimpaCampos;
  CarregarValores;
end;

procedure TFrmCreditoCliente.RgConsultaClick(Sender: TObject);
begin
  inherited;
  if CmbConsulta.ItemIndex <> -1 then AtualizaQryConsulta;
  if (rgconsulta.ItemIndex = 2) or (rgconsulta.ItemIndex = 3) then
    BtnMdImprimir.Enabled := true
  else
    BtnMdImprimir.Enabled := False;
end;

procedure TFrmCreditoCliente.Relaodeitens1Click(Sender: TObject);
var  List_Lancamentos : TStringList;
     i : Integer;
     vLancamentos: String;
begin
  inherited;
  if RgConsulta.ItemIndex <> 0 then
  begin
    List_Lancamentos := TStringList.Create;
    vLancamentos := '';
    ADOQryConsulta.First;
    For i := 1 to ADOQryConsulta.RecordCount do
    begin
       List_Lancamentos.Add(ADOQryConsulta.FieldByName('Lançamento').AsString);
       ADOQryConsulta.Next;
    end;
    for i := 0 to List_Lancamentos.Count - 1 do
    begin //adiciono os codigos na variavel tipo string
      if i = 0 then
        vLancamentos := '''' + List_Lancamentos[i] + ''''
      else
        vLancamentos := vLancamentos + ',''' + List_Lancamentos[i] + '''';
    end;
    FrmRelEntSai := TFrmRelEntSai.Create(Self);
    With FrmRelEntSai.ADOQryRelDados do
    begin
     Sql.Text := 'Select L.dsLancamento,L.cdpessoa cdCliente, L.dtEmissao,L.Dt_Efefiva_E_S,L.dsCFOP,       '+
                 'L.cdComissao,L.dsCancelado,L.vlValor,L.vlDesconto,                 '+
                 'P.cdFabricante,P.nmProduto,P.dsReferencia,I.nrQtd,I.vlUnitario,    '+
                 'I.nrAliquotaICMS,I.nrAliquotaIPI,                                 '+
                 'I.vlUnitario_Bruto,I.cdProduto,C.nmPessoa,C.cdPessoa,L.dsStatus,L.dsLancamento_1    '+
                 'From Lancto AS L WITH (nolock),IteLcto AS I WITH (nolock),Produto AS P WITH (nolock),Pessoa AS C WITH (nolock),Grupo as G WITH (nolock) '+
                 'Where L.dsLancamento = I.dsLancamento and L.cdPessoa = I.cdPessoa         '+
                 'and L.dsstatus = I.dsStatus and C.cdPessoa = L.cdPessoa                   '+
                 'and P.cdGrupo = G.cdGrupo and I.dsCancelado IS null                       '+
                 'and L.dsLancamento in ('+ vLancamentos + ')                               '+
                 'and L.dsStatus in (''E'',''X'',''F'') and I.cdProduto  = P.cdProduto      '+
                 'and L.cdPessoa = :CD                                                      '+
                 'Order by I.dsLancamento,L.dtEmissao,C.nmPessoa                            ';
//      Parameters.ParamByName('dsLancamento').Value := vLancamentos;
      FrmRelEntSai.QRGroup1.Expression := 'AdoQryRelDados.dsLancamento';
      parameters.parambyname('CD').value := ADOQryConsulta.FieldByName('cdpessoa').AsString;
      Open;
    end;
    FrmRelEntSai.QRLblTitulo.Caption := 'Cliente :' + CmbConsulta.Text;
    FrmRelEntSai.QRLblPeriodo.Caption :=  '';
    FrmRelEntSai.QRLblSelecao.Visible := False;
    FrmRelEntSai.QRLblSelecao.Enabled := False;
    FrmRelEntSai.QRLblSelec.Enabled := False;
    FrmRelEntSai.QRLblSelecao.Visible := False;
    FrmRelEntSai.QRMdRel.Preview;
    FrmRelEntSai.Free;
  end;
end;

procedure TFrmCreditoCliente.CarregarValores;
begin
  if EdtCdCliente.text <> '' then begin
    AdoQryExcluir.Open;
    AdoQryExcluir.Locate('cdPessoa',EdtcdCliente.Text,[]);
    LblEnd.Caption    := 'Endereço.......:  '   + AdoQryExcluir.FieldByName('Logradouro').AsString;
    LblBairro.Caption := 'Bairro...........:  ' + AdoQryExcluir.FieldByName('Bairro').AsString;
    if (Length(AdoQryExcluir.FieldByName('Razao').AsString) > 0) and (AdoQryExcluir.FieldByName('Existir').AsString = 'J') then begin
      LblRazao.Caption := AdoQryExcluir.FieldByName('Razao').AsString;
      LblCPF.Caption   := 'CPF / CNPJ....:  '   + AdoQryExcluir.FieldByName('CPF').AsString + ' Cadastrado em: '+ AdoQryExcluir.FieldByName('dtCadastro').AsString;
      LblRG.Caption    := 'RG / I.E..........:  ' + AdoQryExcluir.FieldByName('RG').AsString;
    end else begin
      LblRazao.Caption := 'Razao..........: ';
      LblCPF.Caption   := 'CPF / CNPJ....:  '   + AdoQryExcluir.FieldByName('CPF').AsString+ ' Cadastrado em: '+ AdoQryExcluir.FieldByName('dtCadastro').AsString;
      LblRG.Caption    := 'RG / I.E........:  ' + AdoQryExcluir.FieldByName('Razao').AsString;
    end;
    AdoQryExcluir.Close;
    AtualizaQryConsulta; // caso seja escolhido um cliente
  end;
end;

procedure TFrmCreditoCliente.CBCodigoCliKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  ValidarInteiro(Key);
end;

procedure TFrmCreditoCliente.Help1Click(Sender: TObject);
begin
  inherited;
  Application.HelpContext(92);
end;

procedure TFrmCreditoCliente.BitBtn1Click(Sender: TObject);
var
  i,vDiasAtraso : integer;
begin
  inherited;
  LimpaCampos;
  // calculo das compras do cliente
  ProgressBar1.Position := 10;
  with ADOQryExistir do
  begin
    SQL.Text :=
      'Select Count(L.dslancamento) as lancamentos,              '+
      'Max(L.dtEmissao) Emissao,                                 '+
      'Max(L.vlvalor + L.vlacrescimo - L.vlDesconto) MaiorCompra,'+
      'Sum(L.vlvalor + L.vlacrescimo - L.vlDesconto) Valor       '+
      'FROM Lancto AS L WITH (nolock)                            '+
      'Where L.dsStatus IN (''E'',''X'',''F'') and L.dsCancelado is null  '+
      'and L.cdPessoa = :CODIGO and L.DTEMISSAO between :DATA2 and :DATA1 ';
//    'Select Count(L.dslancamento) as lancamentos ,Sum(L.vlvalor + L.vlacrescimo - L.vlDesconto)  ' +
//                'AS Valor FROM Lancto AS L WITH (nolock) Where L.dsStatus IN (''E'',''X'',''F'') and L.dsCancelado is null ' +
//                'and L.cdPessoa = :CODIGO and CONVERT(CHAR(07),L.DTEMISSAO,126) <= :DATA1                    ' +
//                'and CONVERT(CHAR(07),L.DTEMISSAO,126) >= :DATA2                                             ';
    Parameters.ParamByName('CODIGO').Value := vCdPessoa;
    Parameters.ParamByName('DATA1').Value  := dateOf(Now);
    case RadioGroup1.ItemIndex of
      0: Parameters.ParamByName('DATA2').Value := dateOf(Incmonth(Date,-3));
      1: Parameters.ParamByName('DATA2').Value := dateOf(Incmonth(Date,-6));
      2: Parameters.ParamByName('DATA2').Value := dateOf(Incmonth(Date,-12));
    end;
    Open;
    ProgressBar1.Position := 20;
    if ADOQryExistir.recordcount > 0 then
    begin
      EdtValorCompras.Text := FormatFloat('#,##0.00',FieldByName('Valor').AsFloat);
      EdtQtdCompras.Text   := IntToStr( FieldByName('lancamentos').AsInteger );
      if EdtQtdCompras.Text <> '0' then
        EdtTicketMedio.Text :=  FormatFloat('#,##0.00',FieldByName('Valor').AsFloat / FieldByName('lancamentos').AsInteger)
      else
        EdtTicketMedio.Text := '0,00';
      EdtMaiorCompra.Text := FormatFloat('#,##0.00', FieldByName('MaiorCompra').AsFloat);
    end;
    // Maior Compra
//    SQL.Text := 'Select Top 1 (L.vlvalor + L.vlacrescimo - L.vlDesconto)                                     '+
//                'AS Valor FROM Lancto AS L WITH (nolock) Where L.dsStatus IN (''E'',''X'',''F'') and L.dsCancelado is null '+
//                'and L.cdPessoa = :CODIGO and CONVERT(CHAR(07),L.DTEMISSAO,126) <= :DATA1                    '+
//                'and CONVERT(CHAR(07),L.DTEMISSAO,126) >= :DATA2 order by 1 desc                             ';
//    Parameters.ParamByName('CODIGO').Value := vCdPessoa;
//    Parameters.ParamByName('DATA1').Value  := FormatDateTime('yyyy-mm',Date);
//    case RadioGroup1.ItemIndex of
//      0: Parameters.ParamByName('DATA2').Value := FormatDateTime('yyyy-mm',Incmonth(Date,-3));
//      1: Parameters.ParamByName('DATA2').Value := FormatDateTime('yyyy-mm',Incmonth(Date,-6));
//      2: Parameters.ParamByName('DATA2').Value := FormatDateTime('yyyy-mm',Incmonth(Date,-12));
//    end;
//    Open;
//    ProgressBar1.Position := 30;
//    if ADOQryExistir.recordcount > 0 then
//      edtMaiorCompra.Text := FormatFloat('#,##0.00',FieldByName('Valor').AsFloat);
    // Última Compra
    SQL.Text := 'Select Top 1 L.dtemissao,(L.vlvalor + L.vlacrescimo - L.vlDesconto) Valor '+
                'FROM Lancto AS L WITH (nolock) Where L.dsStatus IN (''E'',''X'',''F'') and L.dsCancelado is null '+
                'and L.cdPessoa = :CODIGO and L.DTEMISSAO between :DATA2 and :DATA1        '+
                'Order by 1 desc';
    Parameters.ParamByName('CODIGO').Value := vCdPessoa;
    Parameters.ParamByName('DATA1').Value  := dateOf(Now);
    case RadioGroup1.ItemIndex of
      0: Parameters.ParamByName('DATA2').Value := dateOf(Incmonth(Date,-3));
      1: Parameters.ParamByName('DATA2').Value := dateOf(Incmonth(Date,-6));
      2: Parameters.ParamByName('DATA2').Value := dateOf(Incmonth(Date,-12));
    end;
    Open;
    ProgressBar1.Position := 35;
    if ADOQryExistir.recordcount > 0 then
    begin
      edtUltimaCompra.Text := FormatFloat('#,##0.00',FieldByName('Valor').AsFloat);
      Label15.caption      := 'Última compra: ' + FieldByName('dtemissao').AsString;
    end;
    // Média de dias de atraso
    Sql.Text := 'Select DATEDIFF(DD,P.dtVencimento,GETDATE()) as Dias_Atraso, '+
                'DATEDIFF(DD,P.dtVencimento,P.dtpagamento) as Dias_PagoAtraso '+
                'From Parcela as P WITH (nolock)                              '+
                'INNER JOIN LANCTO as L WITH (nolock) ON (P.dsLancamento = L.dsLancamento '+
                'and P.cdPessoa = L.cdPessoa and P.dsStatus = L.dsStatus)     '+
                'Where P.cdPessoa = :CODIGO and L.cdconvenio is null and      '+
                'P.dtVencimento < getdate() and L.dsStatus                    '+
                'in (''E'',''X'',''F'',''B'') and L.dsCancelado is null       '+
                'and L.cdConvenio is null Order By P.dtVencimento             ';
    Parameters.ParamByName('CODIGO').Value := vCdPessoa;
    Open;
    ProgressBar1.Position := 50;
    vDiasAtraso           := 0;
    if ADOQryExistir.recordcount > 0 then
    begin
       for i := 1 to ADOQryExistir.recordcount do
       begin
         IF FieldByName('Dias_PagoAtraso').AsInteger > 0 THEN
           //vDiasAtraso := vDiasAtraso + FieldByName('Dias_Atraso').AsInteger
           vDiasAtraso := vDiasAtraso + FieldByName('Dias_PagoAtraso').AsInteger; //ELSE 
         Next;
       end;
       Label12.caption := 'Média dias atraso: ' + FormatFloat('0.00',(vDiasAtraso / ADOQryExistir.recordcount));
    end;
    // cheques a compensar
    SQL.Text := 'Select Sum(vlCheque) as Valor From Cheque WITH (nolock) '+
                'Where dsStatus IN (''A'') and cdPessoa = :CODIGO  '+
                'UNION ALL                                         '+
                'Select Sum(vlCheque) as Valor From Cheque WITH (nolock) '+
                'Where dsStatus IN (''T'') and cdPessoa = :CODIGO1 '+
                'and dtCompensacao >= GETDATE()                    ';
    Parameters.ParamByName('CODIGO').Value  := vCdPessoa;
    Parameters.ParamByName('CODIGO1').Value := vCdPessoa;
    open;
    ProgressBar1.Position := 60;
    for i := 1 to ADOQryExistir.RecordCount do
    begin
      EdtChCompensar.Text := FormatFloat('0.00',StrToFloat(EdtChCompensar.Text) + FieldByName('Valor').AsFloat);
      next;
    end;
    EdtChCompensar.Text := FormatFloat('#,##0.00',StrToFloat(EdtChCompensar.Text));
    // cheques compensados
    SQL.Text := 'Select Sum(vlCheque) Valor From Cheque WITH (nolock) '+
                'Where dsStatus = ''P'' and cdPessoa = :CODIGO '+
                'and DTBomPara between :DATA2 and :DATA1       ';
    Parameters.ParamByName('CODIGO').Value := vCdPessoa;
    Parameters.ParamByName('DATA1').Value  := dateOf(Now);
    case RadioGroup1.ItemIndex of
      0: Parameters.ParamByName('DATA2').Value := dateOf(Incmonth(Date,-3));
      1: Parameters.ParamByName('DATA2').Value := dateOf(Incmonth(Date,-6));
      2: Parameters.ParamByName('DATA2').Value := dateOf(Incmonth(Date,-12));
    end;
    open;
    ProgressBar1.Position := 70;
    EdtChCompensados.Text := FormatFloat('#,##0.00',FieldByName('Valor').AsFloat);
    // CONTAS A PAGAR
    SQL.Text :=
      'SELECT SUM((P.VLVALOR + P.VLACRESCIMO)-(P.VLDESCONTO + P.VLAMORTIZADO)) '+
      'AS Valor FROM PARCELA P WITH (nolock)                                   '+
      'Inner Join Lancto L with (nolock)                                       '+
      'ON L.cdPessoa = P.cdPessoa and L.dsstatus = P.dsStatus and L.dslancamento = P.dslancamento '+
      'WHERE P.cdPessoa = :CODIGO and                                          '+
      '((P.VLVALOR + P.VLACRESCIMO)-(P.VLDESCONTO + P.VLAMORTIZADO)) > 0       '+
      'and L.dsStatus <> ''Y'' and L.cdConvenio is null                        ';
    Parameters.ParamByName('CODIGO').Value := vCdPessoa;
    open;
    ProgressBar1.Position := 80;
    EdtReceber.Text := FormatFloat('#,##0.00',FieldByName('Valor').AsFloat);
    // DUPLICATAS EM ATRASO
    Sql.Text :=
      'Select SUM(((P.VLVALOR + P.VLACRESCIMO) - (P.VLDESCONTO + P.VLAMORTIZADO)))  '+
      'AS Valor From Parcela P WITH (nolock)                                        '+
      'Inner Join Lancto L with (nolock)                                            '+
      'ON L.cdPessoa = P.cdPessoa and L.dsstatus = P.dsStatus and L.dslancamento = P.dslancamento '+
      'Where L.cdPessoa = :CODIGO and                                               '+
      '((P.vlValor + P.vlAcrescimo) - (P.vlDesconto + P.vlAmortizado)) > 0          '+
      'and P.dtVencimento <= :DATA1 and L.dsStatus <> ''Y'' and L.cdConvenio is null';
    Parameters.ParamByName('DATA1').Value  := (Date - vDtBloqueio);
    Parameters.ParamByName('CODIGO').Value := vCdPessoa;
    open;
    ProgressBar1.Position := 90;
    EdtAtraso.Text := FormatFloat('#,##0.00',FieldByName('Valor').AsFloat);
    // Recebimentos
    Sql.Text := 'SELECT Sum(I.vlpagamento) Valor                                      '+
                'FROM Recibo R WITH (nolock) INNER JOIN IteRecibo I WITH (nolock) ON R.nrRecibo = I.nrRecibo '+
                'Where R.dtEmissao between :DATA2 and :DATA1 and R.cdPessoa = :CODIGO ';
//    Prepared;
    Parameters.ParamByName('CODIGO').Value := vCdPessoa;
    Parameters.ParamByName('DATA1').Value  := dateOf(Now);
    case RadioGroup1.ItemIndex of
      0: Parameters.ParamByName('DATA2').Value := dateOf(Incmonth(Date,-3));
      1: Parameters.ParamByName('DATA2').Value := dateOf(Incmonth(Date,-6));
      2: Parameters.ParamByName('DATA2').Value := dateOf(Incmonth(Date,-12));
    end;
    open;
    ProgressBar1.Position := 110;
    EdtRecebimentos.Text := FormatFloat('#,##0.00',FieldByName('Valor').AsFloat);
  end;
  ProgressBar1.Position := 0;
end;

procedure TFrmCreditoCliente.LimpaCampos;
begin
  EdtQtdCompras.Text    := '0';
  EdtValorCompras.Text  := '0,00';
  EdtChCompensados.Text := '0,00';
  EdtChCompensar.Text   := '0,00';
  EdtRecebimentos.Text  := '0,00';
  EdtAtraso.Text        := '0,00';
  EdtReceber.Text       := '0,00';
  EdtTicketMedio.Text   := '0,00';
  edtMaiorCompra.Text   := '0,00';
  edtUltimaCompra.Text  := '0,00';
  Label12.Caption       := 'Média dias atraso: 0';
  Label15.Caption       := 'Última compra: ';
  BtnMdImprimir.Enabled := True;
end;

procedure TFrmCreditoCliente.CBCodigoCliChange(Sender: TObject);
begin
  inherited;
  LimpaCampos;
end;

procedure TFrmCreditoCliente.RadioGroup1Click(Sender: TObject);
begin
  inherited;
  LimpaCampos;
end;

procedure TFrmCreditoCliente.EdtCdClienteEnter(Sender: TObject);
begin
  inherited;
  Application.OnMessage := FrmprincipalPreVenda.ProcessaMsg;
end;

procedure TFrmCreditoCliente.EdtCdClienteExit(Sender: TObject);
var i : Integer;
begin
  inherited;
  if (Length(EdtCdCliente.Text) > 0) then
  begin
    AdoQryExcluir.Open;
    if (AdoQryExcluir.Locate('cdPessoa',EdtCdCliente.Text,[]))  then
    begin
      CmbConsulta.Text := AdoQryExcluir.FieldByName('Devedor').AsString;
      LimpaCampos;
      for i := 0 to CmbConsulta.Items.Count do
      begin   // coloca o nome do grupo na combo
        if CmbConsulta.Items[i] = AdoQryExcluir.FieldByName('Devedor').AsString then
        begin
          CmbConsulta.ItemIndex := i;
          break;
        end;
      end;
      CarregarValores;
    end else
      CmbConsulta.Clear;
  end else begin
    CmbConsulta.ItemIndex := -1;
    CmbConsulta.Text := '';
  end;
end;

procedure TFrmCreditoCliente.SBtnTelefoneClick(Sender: TObject);
begin
  inherited;
  if (Length(EdtCdCliente.Text) > 0) and (CmbConsulta.ItemIndex <> -1) then begin
    FrmCdTelefone.FormQueChamamouC(EdtCdCliente.Text);
    FrmCdTelefone.FormQueChamamouN(CmbConsulta.Text);
    FrmCdTelefone := TFrmCdTelefone.Create(Application);
    FrmCdTelefone.Show;
  end else
    ShowMessage('Selecione um cliente!!!');
end;

procedure TFrmCreditoCliente.BtnMdImprimirClick(Sender: TObject);
begin
  inherited;
  if (length(EdtCdCliente.Text) <= 0) then
  begin
    ShowMessage('Selecione o cliente corretamente!');
    exit;
  end;
  FrmRelReceber := TFrmRelReceber.Create(Self);
  FrmRelReceber.vTipo := '2';
  FrmRelReceber.QRLblTitulo.Caption    := ' Relatório contas a receber';
  FrmRelReceber.QrLblDtInicial.Enabled := False;
  FrmRelReceber.QrLblDtFinal.Enabled   := False;
  With FrmRelReceber.AdoQryRelDados do
  begin
    Sql.Text := 'Select P.cdPessoa as Código,P.nmPessoa as Nome,T.cdTipo,T.dsCusto,       '+
                'A.dsLancamento as Lançamento,A.dsDocumento as Documento,                 '+
                'CONVERT(char(02),A.nrParcelas) +''/''+ CONVERT(char(02),L.nrParcelas)    '+
                'as Parcela,A.vlValor as Valor,A.vlAmortizado,A.dsObservacao,L.cdComissao,'+
                '(A.vlValor + A.vlAcrescimo - A.vlDesconto - A.vlAmortizado) as Saldo,    '+
                'A.dtVencimento,A.dtPagamento,L.dtEmissao,A.vlAcrescimo,A.vlDesconto      '+
                ',L.vlDesconto as Desconto,L.vlValor as Total                             '+
                ',(GETDATE() - A.dtVencimento) as Diferenca,A.dsBoleto                    '+  // abertos
                'From Pessoa P WITH (nolock),Lancto L WITH (nolock),Parcela A WITH (nolock),TpLancto T WITH (nolock),Cliente C WITH (nolock) ';
    // Filtro de Pessoa, Cartão ou Centro de Custo
    Sql.Add('Where T.dsStatus = ''C'' and L.dsCancelado is null and P.cdPessoa = L.cdPessoa and L.dsStatus = A.dsStatus ');     //
    if RgConsulta.ItemIndex = 2 then
    begin// mostra as contas em aberto ou os creditos dos clientes
       FrmRelReceber.QRLblTitulo.Caption := 'Relatório de Contas a Receber';
       Sql.Add('and L.dsStatus <> ''Y''');
    end else
    begin
       Sql.Add('and L.dsStatus = ''Y''');
       FrmRelReceber.QRLblTitulo.Caption := 'Relatório de Créditos';
    end;
    Sql.Add('and P.ser in (''C'',''I'') ');
    Sql.Add('and P.cdPessoa = '+ EdtCdCliente.Text +' ');
    Sql.Add('and L.cdConvenio is null ');
    FrmRelReceber.QRLabel13.Caption := '';
    FrmRelReceber.QRLabel14.Caption := '';
    Sql.Add('and L.dsLancamento = A.dsLancamento ');
    Sql.Add('and L.cdPessoa = A.cdPessoa and L.cdTipo = T.cdTipo '); //
    Sql.Add('and C.cdpessoa = L.cdPessoa ');
    // Filtro do Status dos Títulos
    Sql.Add('and (A.vlValor + A.vlAcrescimo) > (A.vlDesconto + A.vlAmortizado) ');
    FrmRelReceber.QrLblSubT.Caption := '<< Em Aberto >>';
    // Filtro de Ordenação
    Sql.Add('and A.dtVencimento >= :Dt_Inicial and A.dtVencimento <= :Dt_Final ');
    Sql.Add('Order By P.nmPessoa,A.dtVencimento'); // Analítico - Cabeçalho Data
    FrmRelReceber.QrCodigo.Expression := 'AdoQryRelDados.Código'; // 'Código ou Data'
    FrmRelReceber.QRLabel1.Caption    := 'Cód.'; // 'Cód. ou Data'
    FrmRelReceber.QRLabel9.Caption    := 'Vencto'; // 'Título Primeira Data'
    FrmRelReceber.QRLabel10.Caption   := 'Pgto'; // 'Segunda Data'
    FrmRelReceber.QrExpr1.Expression  := 'AdoQryRelDados.Nome'; // 'Campo do Cabeçalho'
    FrmRelReceber.QrGroup1.Expression := 'AdoQryRelDados.Nome'; // 'Campo do Cabeçalho da Banda'
    FrmRelReceber.QrExpr7.Expression  := 'AdoQryRelDados.dtVencimento'; // 'Campo da Primeira Data'
    FrmRelReceber.QrExpr8.Expression  := 'AdoQryRelDados.dtPagamento'; // 'Campo da Segunda Data'
    FrmRelReceber.QrExpr12.Enabled    := False; // 'Oculta Nome no Detail'
    FrmRelReceber.QrExpr1.Enabled     := True;  // 'Mosta Nome no Cabeçalho'
    Parameters.ParamByName('Dt_Inicial').Value := DateToStr(Date - 6000);
    Parameters.ParamByName('Dt_Final').Value   := DateToStr(Date + 6000);
    Open;
  end;
  FrmRelReceber.QRMdRel.PreviewModal;
  FreeAndNil(FrmRelReceber);
  BtnMdImprimir.Enabled := True;
end;

procedure TFrmCreditoCliente.EdtCdClienteKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  ValidarInteiro(Key);
end;

procedure TFrmCreditoCliente.SpeedButton1Click(Sender: TObject);
var vIdent : String[20];
//  I : Integer;
begin
  // inherited;
  vIdent := InputBox('Localizar cliente', 'Entre com o número do CPF/CNPJ ou código do cliente para pesquisa!', '');
  vIdent := SubstituiTexto(vIdent,'.');
  vIdent := SubstituiTexto(vIdent,',');
  vIdent := SubstituiTexto(vIdent,'-');
  vIdent := SubstituiTexto(vIdent,'/');
  vIdent := SubstituiTexto(vIdent,'\');
  if Length(vIdent) = 11 then begin
    with ADOQryExistir do begin
       Sql.Text := 'Select P.cdPessoa,nmPessoa,F.dsCPF From Pessoa P, P_Fisica F ' +
                   'Where P.cdPessoa = F.cdPessoa and F.dsCPF = :CPF  and P.Ser = ''C''';
       Parameters.ParamByName('CPF').Value := vIdent;
       Open;
       if ADOQryExistir.RecordCount = 0 then begin
         ShowMessage('CPF não encontrado... Tente novamente!');
         exit;
       end else begin
         EdtCdCliente.Text := ADOQryExistir.FieldByName('cdpessoa').AsString;
         //CmbConsulta.Text  := ADOQryExistir.FieldByName('nmpessoa').AsString;
         EdtCdClienteExit(Self);
       end;
    end; // with
  end else if Length(vIdent) = 14 then begin
    with ADOQryExistir do begin
       Sql.Text := 'Select P.cdPessoa,nmPessoa,F.CGC From Pessoa P, P_Juridica F ' +
                   'Where P.cdPessoa = F.cdPessoa and F.CGC = :CNPJ  and P.Ser = ''C''';
       Parameters.ParamByName('CNPJ').Value := vIdent;
       Open;
       if ADOQryExistir.RecordCount = 0 then begin
         ShowMessage('CNPJ não encontrado... Tente novamente!');
         exit;
       end else begin
         EdtCdCliente.Text := ADOQryExistir.FieldByName('cdpessoa').AsString;
         EdtCdClienteExit(Self);
       end;
    end; // with
  end;
end;

procedure TFrmCreditoCliente.LocalizaLanamento1Click(Sender: TObject);
var
  vIdent : String;
begin
 if RgConsulta.ItemIndex <> 0 then begin
    vIdent := InputBox('Pesquisar lançamento', 'Entre com o número do lançamento para pesquisa!', '');
    if Length(vIdent) > 0 then
      AdoQryConsulta.Locate('Lançamento',vIdent,[]);// Pesquisa o lançamento
 end;
end;

procedure TFrmCreditoCliente.ImprimeRecibodaParcelaSelecionada1Click(
  Sender: TObject);
var
  i,w,j : Integer;
  Lancamentos_Selecionados : String;
  Lancamento, Documento : Array[1..30] of string;
  VALOR : STRING[50];
  TAM : INTEGER;
  Documentos, Lancamentos: string;
begin
  if (RgConsulta.ItemIndex <> 2) then begin
    ShowMessage('Rotina disponível somente quando você selecionar a opção Limite de Crédito!');
    exit;
  end;
  // isso só funciona se clicar na coluna Nome...
  if DBGrid1.SelectedRows.Count > 1 then begin
     DbGrid1.DataSource.DataSet.First;
     for i:=0 to DBGrid1.SelectedRows.Count -1 do begin
         if (DbGrid1.SelectedField.FieldName = 'Lançamento') then begin
            DbGrid1.DataSource.Dataset.Bookmark := DbGrid1.SelectedRows[i];
            Lancamento[I+1]:= DbGrid1.DataSource.DataSet.FieldByName('Lançamento').AsString ;
            Documento [I+1]:= DbGrid1.DataSource.DataSet.FieldByName('Documento').AsString ;
            DbGrid1.DataSource.DataSet.Next;
         end; // if
     end; //for
     w := 2;
  end // if
  else begin
     if MessageDlg('Imprimir o recibo somente da(s) parcela(s) selecionada(s)?',mtConfirmation,[mbYes,mbNo],0) = mrYes then begin
        w := 0;    // imprime a selecionada
        Lancamentos_Selecionados := ADOQryConsulta.FieldByName('Documento').AsString;
     end // if
     else begin
        w := 1;  // imprime todas
        AdoQryConsulta.First;
        vtotal := 0;
        for i := 1 to ADOQryConsulta.RecordCount do begin
          vtotal := vtotal + StrToFloat( SubstituiTexto(ADOQryConsulta.FieldByName('Saldo').AsString,'R$'));
          next;
        end; // for
     end; // else
  end; // else
  FrmRel_Recibo2 := TFrmRel_Recibo2.Create(Self);
  with FrmRel_Recibo2 do begin
    QRLblNr.Enabled     := False;
    QrlRestante.Enabled := False;
    QRLabel13.Caption   := FrmPrincipalPreVenda.vCidade;
    if w = 0 then
      QRLblValor.Caption :=  FormatFloat('0.00',StrToFloat( SubstituiTexto(ADOQryConsulta.FieldByName('Saldo').AsString,'R$')))
     else begin
       if w = 1 then begin
         vtotal := 0;
        While not ADOQryConsulta.Eof do begin
          VALOR  := ADOQryConsulta.FieldByName('Saldo').AsString;
          TAM    := LENGTH(VALOR);
          vtotal := vtotal + strtofloat(Copy(VALOR,3,TAM));
          ADOQryConsulta.Next;
        end; // while
        QRLblValor.Caption :=  FormatFloat('0.00',vTotal);
       end; // if
    end; // else
    QRLblData.Caption  := DatetoStr(Date);
    case Length(QRLblValor.Caption) of
      3  : QREExtenso.Lines.Add(Extenso('         ' + QRLblValor.Caption));
      4  : QREExtenso.Lines.Add(Extenso('        ' + QRLblValor.Caption));
      5  : QREExtenso.Lines.Add(Extenso('       ' + QRLblValor.Caption));
      6  : QREExtenso.Lines.Add(Extenso('      ' + QRLblValor.Caption));
      7  : QREExtenso.Lines.Add(Extenso('     ' + QRLblValor.Caption));
      8  : QREExtenso.Lines.Add(Extenso('    ' + QRLblValor.Caption));
      9  : QREExtenso.Lines.Add(Extenso('   ' + QRLblValor.Caption));
      10 : QREExtenso.Lines.Add(Extenso('  ' + QRLblValor.Caption));
      11 : QREExtenso.Lines.Add(Extenso(' ' + QRLblValor.Caption));
      12 : QREExtenso.Lines.Add(Extenso(QRLblValor.Caption));
    end;
    QRETexto.Lines.Clear;
    QRLblAssinante.Caption      := QRlblEmpresa.Caption;
    QRLblCGCAssinante.Caption   := QRLblCgc.Caption;
    QRLblEndAssinante.Visible   := False;
    QRETexto.Lines.Add('Recebi(emos) de(a) ' + CmbConsulta.Text +
      'a importância líquida acima discriminada. Correpondente à Recebimento,  '+
      'de Título(s), para clareza firmo o presente.                            ');
    with FrmRel_Recibo2.ADOQryRelDados do begin
      Sql.Text := 'Select A.dsLancamento as dsLancamento,A.dsDocumento as dsDocumento,            '+
                  'A.dtVencimento as dtVencimento_Doc,L.dtEmissao as dtEmissao_Doc,A.dtVencimento '+
                  'as dtVencimento,L.dtEmissao as Emissao,((A.vlValor + A.vlAcrescimo) -          '+
                  '(A.vlAmortizado + A.vlDesconto)) as vlPagamento                                '+
                  'FROM TpLancto T WITH (nolock) INNER JOIN ((Pessoa P WITH (nolock) INNER JOIN Lancto L WITH (nolock) '+
                  'ON P.cdPessoa = L.cdPessoa) INNER JOIN Parcela A WITH (nolock)                 '+
                  'ON (P.cdPessoa = A.cdPessoa) AND (L.dsstatus = A.dsstatus)                     '+
                  'AND (L.cdPessoa = A.cdPessoa) AND (L.dslancamento = A.dslancamento))           '+
                  'ON T.cdTipo = L.cdTipo                                                         '+
                  'Where T.dsStatus = ''C'' and L.dsCancelado is null and L.dsStatus <> ''Y''     '+
                  'and ((A.vlValor + A.vlAcrescimo) - (A.vlAmortizado + A.vlDesconto)) > 0        '+
                  'and P.cdPessoa = :CLIENTE and L.cdConvenio is null                             ';
      Parameters.ParamByName('CLIENTE').Value    := EdtCdCliente.Text;
      if w = 0 then begin
        Sql.Add('and A.dsDocumento in (:DOCUMENTOS)');
        Parameters.ParamByName('DOCUMENTOS').Value := Lancamentos_Selecionados;
      end else
           if w = 2 then begin
              for i:=0 to DBGrid1.SelectedRows.Count -1 do begin
                  if i = 0 then
                     Documentos := ''''+Documento[I+1] +''''
                  else
                     Documentos := Documentos + ','''+ Documento[I+1]+ '''';
              end;
              Sql.Add('and A.dsDocumento in ('+DOCUMENTOS+')');
           end;
      Open;
      vtotal := 0;
      While not FrmRel_Recibo2.ADOQryRelDados.Eof do begin
        vtotal := vtotal + FrmRel_Recibo2.ADOQryRelDados.FieldByName('vlPagamento').asFloat;
        FrmRel_Recibo2.ADOQryRelDados.Next;
      end;
      QRLblValor.Caption := FormatFloat('0.00',vTotal);
      QRLblData.Caption  := DatetoStr(Date);
      case Length(QRLblValor.Caption) of
        3  : QREExtenso.Lines.Add(Extenso('         ' + QRLblValor.Caption));
        4  : QREExtenso.Lines.Add(Extenso('        ' + QRLblValor.Caption));
        5  : QREExtenso.Lines.Add(Extenso('       ' + QRLblValor.Caption));
        6  : QREExtenso.Lines.Add(Extenso('      ' + QRLblValor.Caption));
        7  : QREExtenso.Lines.Add(Extenso('     ' + QRLblValor.Caption));
        8  : QREExtenso.Lines.Add(Extenso('    ' + QRLblValor.Caption));
        9  : QREExtenso.Lines.Add(Extenso('   ' + QRLblValor.Caption));
        10 : QREExtenso.Lines.Add(Extenso('  ' + QRLblValor.Caption));
        11 : QREExtenso.Lines.Add(Extenso(' ' + QRLblValor.Caption));
        12 : QREExtenso.Lines.Add(Extenso(QRLblValor.Caption));
      end;
    end;
    QRMdRel.Preview;
    Free;
  end;
end;

procedure TFrmCreditoCliente.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
 //
end;

end.
