unit ListaPedidos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, ComCtrls, DB, ADODB;

type
  TFrmListaPedidos = class(TForm)
    Label3: TLabel;
    DtInicial: TDateTimePicker;
    Label1: TLabel;
    Dt_Final: TDateTimePicker;
    RadioGroup1: TRadioGroup;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    BtnMdSair: TBitBtn;
    LblCliente: TLabel;
    ADOLancto: TADOQuery;
    ADOdsConsulta: TDataSource;
    DataSource1: TDataSource;
    ADOItens: TADOQuery;
    BtnMdAnterior: TBitBtn;
    BtnMdProximo: TBitBtn;
    LblListados: TLabel;
    LblVendedor: TLabel;
    ADOItenscdProduto: TIntegerField;
    ADOItensdsReferencia: TStringField;
    ADOItensnmProduto: TStringField;
    ADOItensnrQtd: TFloatField;
    ADOItensvlValor: TFloatField;
    ADOItensTotal: TFloatField;
    BitBtn1: TBitBtn;
    ADOLanctoLancto: TIntegerField;
    ADOLanctoEmissao: TDateTimeField;
    ADOLanctoRetorno: TDateTimeField;
    ADOLanctoValor: TFloatField;
    ADOLanctoDesconto: TFloatField;
    ADOLanctoVendedor: TIntegerField;
    ADOLanctoCliente: TIntegerField;
    procedure EdtLancamentoKeyPress(Sender: TObject; var Key: Char);
    procedure BtnMdSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DtInicialChange(Sender: TObject);
    procedure Dt_FinalChange(Sender: TObject);
    procedure EdtLancamentoChange(Sender: TObject);
    procedure EdtLancamentoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnMdProximoClick(Sender: TObject);
    procedure BtnMdAnteriorClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure RadioGroup1Click(Sender: TObject);
    procedure AtualizaLancto;
    procedure MontaItens;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure PegaCliente;
  public
    { Public declarations }
  end;

var
  FrmListaPedidos: TFrmListaPedidos;

implementation

uses uFuncoesPadrao, DateUtils, DataModulo, MoPreVenda, Math;

{$R *.dfm}

procedure TFrmListaPedidos.EdtLancamentoKeyPress(Sender: TObject; var Key: Char);
begin
  ValidarInteiro(Key);
end;

procedure TFrmListaPedidos.BtnMdSairClick(Sender: TObject);
var i,L : integer;
    vLancamentos : string;
begin
  Close;
{  if ListBox1.Items.Count > 0 then begin
    Form1.CkbDuplicata.Checked := False;
    Form1.CkbDuplicata.Enabled := False;
    with ADOItens do begin
      Sql.Text := 'Select P.cdProduto as Codigo,P.nmProduto as Descricao,            '+
                  'P.dsUnidade,P.dsMercosul,P.dsreferencia as dsRef,                 '+
                  'P.cdCodigoDic as dsReferencia,P.dsSituacaoTributaria,P.nrPeso,    '+
                  'P.dsCodTributacao,P.nrIpi,I.nrqtd as Quant, I.vlUnitario as Valor,'+
                  '(I.nrQtd * I.vlUnitario) as Total                                 '+
                  'From Itelcto as I inner join Produto as P                         '+
                  'On I.cdProduto = P.cdProduto                                      '+
                  'Where I.dsStatus = ''F'' and I.cdPessoa = :CLIENTE                '; // F --> pedido
      if ListBox1.Items.Count > 0 then begin
        for i := 0 to ListBox1.Items.Count - 1 do begin
          if i = 0 then
            vLancamentos := ListBox1.Items[i]
          else
            vLancamentos := vLancamentos + ',' + ListBox1.Items[i];
        end;
          Sql.Add('and dsLancamento in ('+ vLancamentos +')');
      end;
      Sql.Add('and I.dsCancelado is null');
      Parameters.ParamByName('CLIENTE').Value    := Form1.EdtCdCliente.Text;   // codigo do cliente
      open;
    end;
    if ADOItens.RecordCount > 0 then begin  // vou preencher agora a grade com os produtos
      for i := 1 to ADOItens.RecordCount do begin
        With Form1.SgDados do begin
          if RowCount >= 2 then
            RowCount := RowCount + 1;
          Row := 1;
          For L:= Row to RowCount -1 do begin
            if Cells[0,L] = '' then begin
              Row := L;
              Break;
            end;
          end;
          Cells[1,Row]  := ADOItens.FieldByName('Codigo').AsString;     // codigo
          Form1.AdoQryImpostos.open;
          Form1.AdoQryImpostos.Locate('cdProduto',Cells[1,Row],[]);
          Cells[2,Row]  := ADOItens.FieldByName('Descricao').AsString;    // descrição
          Cells[3,Row]  := FormatFloat('0.000',ADOItens.FieldByName('Quant').AsFloat);           // quantidade
          Cells[4,Row]  := FormatFloat('0.00',ADOItens.FieldByName('Valor').AsFloat);        // preco de venda
          Cells[5,Row]  := FormatFloat('0.00',ADOItens.FieldByName('Total').AsFloat); // total
          Cells[7,Row]  := ADOItens.FieldByName('dsUnidade').AsString;
          Cells[8,Row]  := ADOItens.FieldByName('dsSituacaoTributaria').AsString;  // codigo de tributacao
          Cells[10,Row] := FormatFloat('0.000',ADOItens.FieldByName('Quant').AsFloat * ADOItens.FieldByName('nrPeso').AsFloat);  // Peso
          Cells[20,i]   := ADOItens.FieldByName('dsMercosul').ASString;      // codigo da classificacao fiscal
          Cells[21,i]   := ADOItens.FieldByName('dsreferencia').ASString;      // referencia do produto
          if Form1.CbxNatureza.ItemIndex <> 2 then
            Cells[11,Row] := '0,00'   // aliquota de ipi
          else
            Cells[11,Row] := ADOItens.FieldByName('nrIpi').AsString;   // devolução para fornecedor
          Cells[12,Row]   := FormatFloat('0.00',StrToFloat(Cells[5,Row]) * StrToFloat(Cells[11,Row])/100);  // valor do IPI
          Form1.EdtPesoBruto.Text   := FormatFloat('0.000',StrToFloat(Form1.EdtPesoBruto.text) + StrToFloat(Cells[10,Row]));
          Form1.EdtPesoLiquido.Text := Form1.EdtPesoBruto.Text;
          Form1.EdtTotal.Text := FormatFloat('0.00',StrtoFloat(Form1.EdtTotal.Text) + (StrToFloat(Cells[4,Row]) * StrToFloat(Cells[3,Row])));
          Form1.EdtTotal.Text := FormatFloat('0.00',StrtoFloat(Form1.EdtTotal.Text) + StrToFloat(Cells[12,Row]));
          Cells[15,Row]  := '0,00';       // frete
          if Form1.ADOQryImpostos.FieldByName('dsFlag').AsString = 'C' then  // indica que a aliquota é de PRODUTO (ICMS)
            Cells[0,Row] := 'I' // I -> indica que a alíquota é de ICMS
          else  // senão é serviço (ISS)
            Cells[0,Row] := 'S';  // S -> Indica que a aliquota é de ISS
          if Form1.CbxEstado.Caption = FrmPrincipal.vestado then begin  // quando o cliente é do próprio estado pega o icms do produto
            if Form1.ADOQryImpostos.FieldByName('ICMS').AsFloat > 0 then  // caso o produto não possua aliquota = 0
              Cells[6,Row] := FormatFloat('0.00',Form1.ADOQryImpostos.FieldByName('ICMS').AsFloat) // aliquota do ICMS % do produto
            else
              Cells[6,Row] := '0,00';   // aliquota de ICMS 0,00 ( II,FF,NN)
          end else begin // cliente fora do estado
            if Form1.CbxNatureza.ItemIndex = 2 then begin  // devolução fornecedor
              Cells[6,Row] := FormatFloat('0.00',Form1.vAliquota);
            end else begin
              if Trim(Form1.EdtIERG.Text) = '' then  // sem inscrição
                Cells[6,Row] := '0,00'
              else
                Cells[6,Row] := '12,00';
            end;
          end;
          Cells[13,Row] := FormatFloat('0.00',StrToFloat(Cells[5,Row]) - // base de calculo
            StrToFloat(Cells[5,Row]) * StrToFloat(Form1.EdtDesconto.Text)/100);
          Cells[16,Row] := FormatFloat('0.00',Form1.ADOQryImpostos.FieldByName('nrReducao').AsFloat);
          if Form1.ADOQryImpostos.FieldByName('nrReducao').AsFloat > 0 then begin                      // produto COM redução tributaria
            Cells[13,Row] := FormatFloat('0.00',StrToFloat(Cells[13,Row]) *  // base de calculo
              (100 - Form1.ADOQryImpostos.FieldByName('nrReducao').AsFloat)/100);
          end;
          if Cells[6,Row] = '0,00' then Cells[13,Row] := '0,00';  // base de calculo
          Cells[09,Row] := FormatFloat('0.00',StrToFloat(Cells[13,Row]) * StrToFloat(Cells[06,Row])/100); // ICMS
          Cells[14,Row] := FormatFloat('0.00',StrToFloat(Cells[5,Row]) - StrToFloat(Cells[13,Row]));  // desconto de icms
          if Cells[0,Row] = 'I' then begin // ICMS
            Form1.EdtBaseCalculoIcms.Text := FormatFloat('0.00',StrToFloat(Form1.EdtBaseCalculoIcms.Text) + StrToFloat(Cells[13,Row]));
            Form1.EdtSubTotal.Text  := FormatFloat('0.00',StrToFloat(Form1.EdtSubTotal.Text) + StrToFloat(Cells[5,Row]));  // valor total dos produtos
            Form1.EdtValorIcms.Text := FormatFloat('0.00',StrToFloat(Form1.EdtValorIcms.Text) + StrToFloat(Cells[9,Row]));  // valor do icms desta nota
            Form1.EdtTotalIpi.Text  := FormatFloat('0.00',StrToFloat(Form1.EdtTotalIpi.Text) + StrToFloat(Cells[12,Row]));
          end else if Cells[0,Row] = 'S' then begin
            if StrToFloat(Cells[6,Row]) <> 0 then  // caso a aíquota seja diferente de zero soma na base de calculo
              Form1.EdtBaseCalculoISS.Text := FormatFloat('0.00',StrToFloat(Form1.EdtBaseCalculoISS.Text)
                + (StrToFloat(Cells[5,Row]) - StrToFloat(Cells[5,Row]) * StrToFloat(Form1.EdtDesconto.Text)/100));
              Form1.EdtValorISS.Text := FormatFloat('0.00',StrToFloat(Form1.EdtBaseCalculoISS.Text) * Form1.ADOQryImpostos.FieldByName('ICMS').AsFloat /100);
          end;  // ATENÇÃO embora na linha anterior me referi ao ISS om o fieldbyname('ICMS') foi porque coloquei ICMS o as (apelido na query) do valor do imposto
        end;
        ADOItens.Next;
      end;
      Form1.EdtSubTotal.Text := Form1.EdtTotal.Text;
      if Form1.vCalculaBaseCalculo_ICMS = 'N' then begin  // cfop que não possui base de calculo
        Form1.EdtBaseCalculoIcms.Text := '0,00';
        Form1.EdtValorIcms.Text       := '0,00';
      end;
    end;
  end else begin
    Form1.CkbDuplicata.Checked := True;
    Form1.CkbDuplicata.Enabled := True;
  end;
  Close; }
end;

procedure TFrmListaPedidos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FrmPrincipalPrevenda.EdtConsulta.SetFocus;
  Action := caFree;
end;

procedure TFrmListaPedidos.AtualizaLancto;
var i : integer;
    vLancamentos : string;
begin
  with ADOLancto do begin
    Sql.Text := 'Select nrOrcamento as Lancto,dtEmissao as Emissao,dtRetorno     '+
                'as Retorno,vlValor as Valor,nrDesconto as Desconto,cdVendedor   '+
                'as Vendedor,cdPessoa as Cliente From OrcamentoR WITH (NOLOCK)   '+
                'Where dtEmissao between :DTINICIAL and :DTFINAL and nrOrcamento '+
                'not in (Select nrOrcamentoR From Orcamento WITH (NOLOCK)        '+
                'Where nrOrcamentoR is not null)                                 ';
    Parameters.ParamByName('DTINICIAL').Value := DateToStr( DtInicial.Date );
    Parameters.ParamByName('DTFINAL').Value   := DateToStr( Dt_Final.Date );
    case RadioGroup1.ItemIndex of
      0 : Sql.Add('Order by nrOrcamento');
      1 : Sql.Add('Order by dtEmissao  ');
    end;
    open;
    ADOLanctovalor.DisplayFormat    := '#0.00';
    ADOLanctoDesconto.DisplayFormat := '#0.00';
    LblListados.Caption := 'Listados --> ' + IntToStr(ADOLancto.RecordCount);
    if ADOLancto.RecordCount > 0 then begin
      MontaItens;
      PegaCliente;
    end else begin
      LblCliente.Caption  := 'Cliente --> ';
      LblVendedor.Caption := 'Cliente --> ';
    end;
  end;
end;

procedure TFrmListaPedidos.MontaItens;
begin
  if ADOLancto.RecordCount = 0 then
    exit; 
  with ADOItens do begin
    Sql.Text := 'Select I.cdProduto,P.dsReferencia,P.nmProduto,I.nrQtd,I.vlValor,'+
                '(I.nrQtd * I.vlValor) as Total                                  '+
                'From iteOrcamentoR I WITH (NOLOCK) INNER JOIN Produto P WITH (NOLOCK) '+
                'On I.cdProduto = P.cdProduto INNER JOIN OrcamentoR O WITH (NOLOCK) '+
                'ON O.nrOrcamento = I.nrOrcamento and O.cdPessoa = I.cdPessoa    '+
                'Where I.nrOrcamento = :ORCAMENTO and I.cdPessoa = :CLIENTE and  '+
                'O.cdVendedor = :VENDEDOR                                        ';
    Parameters.ParamByName('CLIENTE').Value   := ADOLancto.FieldByName('Cliente').AsInteger;             // codigo do cliente
    Parameters.ParamByName('ORCAMENTO').Value := ADOLancto.FieldByName('Lancto').AsString; // codigo do cliente
    Parameters.ParamByName('VENDEDOR').Value  := ADOLancto.FieldByName('Vendedor').AsInteger;    // codigo do cliente
    open;
    ADOItensnrQtd.DisplayFormat   := '#0.000';
    ADOItensvlValor.DisplayFormat := '#0.00';
    ADOItensTotal.DisplayFormat   := '#0.00';
  end;
end;

procedure TFrmListaPedidos.DtInicialChange(Sender: TObject);
begin
  AtualizaLancto;
end;

procedure TFrmListaPedidos.Dt_FinalChange(Sender: TObject);
begin
  AtualizaLancto;
end;

procedure TFrmListaPedidos.EdtLancamentoChange(Sender: TObject);
begin
  AtualizaLancto;
end;

procedure TFrmListaPedidos.EdtLancamentoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_Down then
    BtnMdProximoClick(Self);
  if Key = VK_Up then
    BtnMdAnteriorClick(Self);
end;

procedure TFrmListaPedidos.BtnMdProximoClick(Sender: TObject);
begin
  ADOLancto.Next;
  if ADOLancto.RecordCount > 0 then
    MontaItens;
end;

procedure TFrmListaPedidos.BtnMdAnteriorClick(Sender: TObject);
begin
  ADOLancto.Prior;
  if ADOLancto.RecordCount > 0 then
    MontaItens;
end;

procedure TFrmListaPedidos.DBGrid1CellClick(Column: TColumn);
begin
//  DtInicial.SetFocus;
  MontaItens;
end;

procedure TFrmListaPedidos.RadioGroup1Click(Sender: TObject);
begin
  AtualizaLancto;
end;

procedure TFrmListaPedidos.BitBtn1Click(Sender: TObject);
var i : integer;
begin
  if ADOLancto.RecordCount = 0 then exit;
    With FrmPrincipalPrevenda.ADOQryProcura do begin
{      SQL.Text := 'Select * From MemoOrcamentoR WITH (NOLOCK) Where nrOrcamento = :LANCTO ';
      Parameters.ParamByName('LANCTO').Value := ADOLancto.FieldByName('Lancto').asString;
      Open;
      if FrmPrincipalPrevenda.ADOQryProcura.recordCount > 0 then
        FrmPrincipalPrevenda.vobs_Venda_Externa := FrmPrincipalPrevenda.ADOQryProcura.FieldByName('dsMemo').AsString
      else
        FrmPrincipalPrevenda.vobs_Venda_Externa := ''; }
      Sql.Text := 'Select O.cdVendedor,O.nrOrcamento,O.cdPessoa,I.cdProduto,   '+
                  'O.dtEmissao,I.NrQtd,I.vlValor                               '+
                  'From OrcamentoR O WITH (NOLOCK) INNER JOIN IteOrcamentoR I WITH (NOLOCK) ON '+
                  'O.nrOrcamento = I.nrOrcamento Where O.nrOrcamento = :LANCTO ';
      Parameters.ParamByName('LANCTO').Value := ADOLancto.FieldByName('Lancto').asString;
      Open;
      if Recordcount = 0 then begin // caso o lancamento não seja encontrado
        Messagedlg('Pré-Venda não encontrada!', mtInformation, [mbOk], 0);
        dtInicial.SetFocus;
        Exit;
      end;
      // pega o vendedor
//      vnrOrcamentoR                        := ADOLancto.FieldByName('Lancto').asString;
      FrmPrincipalPrevenda.EdtCdNome.Text  := FrmPrincipalPrevenda.ADOQryProcura.FieldByName('cdVendedor').AsString;
      FrmPrincipalPrevenda.EdtUsuario.text := FrmPrincipalPrevenda.ADOQryProcura.FieldByName('cdVendedor').AsString;
      FrmPrincipalPrevenda.EdtCdNome.Refresh;
      FrmPrincipalPrevenda.EdtCdNomeExit(Sender);
      // Pega o cliente
      FrmPrincipalPrevenda.EdtCdCliente.Text := FieldByName('cdPessoa').AsString;
      FrmPrincipalPrevenda.EdtCdCliente.Refresh;
      FrmPrincipalPrevenda.ADOQryCliente.Open;
      FrmPrincipalPrevenda.ADOQryCliente.Locate('cdPessoa',FrmPrincipalPrevenda.EdtCdCliente.Text,[]);
      FrmPrincipalPrevenda.CbxCliente.Text   := FrmPrincipalPrevenda.ADOQryCliente.FieldbyName('nmPessoa').AsString;
      FrmPrincipalPrevenda.LblVista.caption  := FormatFloat('0.00',FrmPrincipalPrevenda.ADOQryCliente.Fieldbyname('vldescVista').AsFloat);
      FrmPrincipalPrevenda.LblPrazo.caption  := FormatFloat('0.00',FrmPrincipalPrevenda.ADOQryCliente.Fieldbyname('vldescPrazo').AsFloat);
      FrmPrincipalPrevenda.LblVista.Refresh;
      FrmPrincipalPrevenda.LblPrazo.Refresh;
      FrmPrincipalPrevenda.PegaClienteAtacadoVarejo;
      // Montar a grid dos produtos
      FrmPrincipalPrevenda.ADOQryProcura.Prior;
      FrmPrincipalPrevenda.EdtDesconto.Text      := FormatFloat('0.00',ADOLanctoDesconto.AsFloat);
      FrmPrincipalPrevenda.EdtTotal.Text         := '0,00';
//      FrmPrincipalPrevenda.EdtTotalPromocao.Text := '0,00';
      FrmPrincipalPrevenda.EdtSubTotal.Text      := '0,00';
      FrmPrincipalPrevenda.label18.caption       := '0,00';
      FrmPrincipalPrevenda.Label15.Text       := '0,00';
      FrmPrincipalPrevenda.LblReserva.Text    := '0,00';
      FrmPrincipalPrevenda.SgDados.RowCount      := FrmPrincipalPrevenda.ADOQryProcura.RecordCount + 1;  // adiciona linhas a string
//      FrmPrincipalPrevenda.AtualizaCombProduto;  // pega o nome do produto
      FrmPrincipalPrevenda.AdoQrySimilar.Sql.Clear;
      FrmPrincipalPrevenda.AdoQrySimilar.Sql.Text := 'Select vlpreco from produto WITH (NOLOCK) where cdproduto = :CDPRODUTO';
      FrmPrincipalPrevenda.AdoQrySimilar.Parameters.ParamByName('CDPRODUTO').Value := FrmPrincipalPrevenda.ADOQryProcura.FieldByName('cdProduto').AsString;
      FrmPrincipalPrevenda.AdoQrySimilar.Open;
      for i := 1 to FrmPrincipalPrevenda.ADOQryProcura.RecordCount do begin
        FrmPrincipalPrevenda.ADOQryProduto.Locate('cdproduto',FrmPrincipalPrevenda.ADOQryProcura.FieldByName('cdProduto').AsFloat,[]);
        if (FrmPrincipalPrevenda.ADOQryProcura.FieldByName('nrQtd').AsFloat > FrmPrincipalPrevenda.ADOQryProduto.FieldByName('nrqtdreal').AsInteger)
        and (vEstqNegativo <> 'S') then
          ShowMessage('O Produto '+FrmPrincipalPrevenda.ADOQryProduto.FieldByName('dsReferencia').AsString+' possui '+
                       FormatFloat('0.00',FrmPrincipalPrevenda.ADOQryProduto.FieldByName('nrqtdreal').AsFloat) +' no estoque, portanto está sem quantidade suficiente para realizar essa venda!');
        FrmPrincipalPrevenda.SgDados.Cells[0,i] := FrmPrincipalPrevenda.ADOQryProcura.FieldByName('cdProduto').AsString;
        FrmPrincipalPrevenda.SgDados.Cells[1,i] := FrmPrincipalPrevenda.ADOQryProduto.FieldByName('nmProduto').AsString;
        FrmPrincipalPrevenda.SgDados.Cells[2,i] := FormatFloat('0.00',FrmPrincipalPrevenda.ADOQryProcura.FieldByName('nrQtd').AsFloat);
        //Vem o valor cheio sem o desconto. Para resolver o problema na hora da alteraração
        FrmPrincipalPrevenda.SgDados.Cells[3,i] := FormatFloat('0.00',FrmPrincipalPrevenda.ADOQryProcura.FieldByName('vlValor').AsFloat);
        FrmPrincipalPrevenda.SgDados.Cells[9,i] := FormatFloat('0.00',FrmPrincipalPrevenda.ADOQryProcura.FieldByName('vlvalor').AsFloat);        //SgDados.Cells[3,i];
        FrmPrincipalPrevenda.SgDados.Cells[10,i] := FormatFloat('0.00',FrmPrincipalPrevenda.ADOQryProcura.FieldByName('vlvalor').AsFloat);
        FrmPrincipalPrevenda.SgDados.Cells[4,i] := FormatFloat('0.00',(FrmPrincipalPrevenda.ADOQryProcura.FieldByName('nrQtd').AsFloat *
          FrmPrincipalPrevenda.ADOQryProcura.FieldByName('vlvalor').AsFloat));
        FrmPrincipalPrevenda.SgDados.Refresh;
        FrmPrincipalPrevenda.EdtTotal.Text := FormatFloat('0.00',StrToFloat(FrmPrincipalPrevenda.EdtTotal.Text) +
                                                                 StrToFloat(FrmPrincipalPrevenda.SgDados.Cells[4,i]));
{        if FrmPrincipalPrevenda.ADOQryProduto.FieldByName('dsPromocao').AsString = 'S' then
           FrmPrincipalPrevenda.EdtTotalPromocao.Text := FormatFloat('0.00',StrToFloat(FrmPrincipalPrevenda.EdtTotalPromocao.Text)
                                                                            + StrToFloat(FrmPrincipalPrevenda.SgDados.Cells[4,i])); }
        FrmPrincipalPrevenda.SgDados.Cells[6,i] := FormatFloat('0.00',FrmPrincipalPrevenda.ADOQryProcura.FieldByName('vlValor').AsFloat);
        FrmPrincipalPrevenda.SgDados.Cells[7,i] := 'N'; //Primeiro recebe 'N'
{        if FrmPrincipalPrevenda.vAtacadoVarejo = 'A' then begin //Se for promocao de atacado o nome do campo é diferente do de varejo
          if FrmPrincipalPrevenda.ADOSPConsulta.FieldByName('dsPromocao').AsString = 'S' then
            FrmPrincipalPrevenda.SgDados.Cells[7,i] := FrmPrincipalPrevenda.ADOQryProduto.FieldByName('dsPromocao').AsString;
        end else if vAtacadoVarejo = 'V' then
          FrmPrincipalPrevenda.SgDados.Cells[7,i] := FrmPrincipalPrevenda.ADOQryProduto.FieldByName('dsPromocaoVarejo').AsString;}
        FrmPrincipalPrevenda.SgDados.Cells[8,i] := FrmPrincipalPrevenda.ADOQryProduto.FieldByName('dsReferencia').AsString;
        FrmPrincipalPrevenda.SgDados.Refresh;
        FrmPrincipalPrevenda.Label15.Text    := FormatFloat('0.00',StrToFloat(FrmPrincipalPrevenda.Label15.Text) +
                                                                      FrmPrincipalPrevenda.ADOQryProcura.FieldByName('nrQtd').AsFloat
                                                                      *  FrmPrincipalPrevenda.ADOQryProcura.FieldByName('vlValor').AsFloat);
        FrmPrincipalPrevenda.lblReserva.Text := FormatFloat('0.00',StrToFloat(FrmPrincipalPrevenda.lblReserva.Text)
                                                                      + StrToFloat(FrmPrincipalPrevenda.SgDados.Cells[4,i]));
        FrmPrincipalPrevenda.ADOQryProcura.Next;
      end;
      FrmPrincipalPrevenda.EdtSubTotal.Text   := FrmPrincipalPrevenda.EdtTotal.Text;
      FrmPrincipalPrevenda.Label18.caption    := FrmPrincipalPrevenda.edtSubTotal.Text;
      FrmPrincipalPrevenda.CbxCliente.Enabled := False;
      BtnMdSair.Click;
{      FrmPrincipalPrevenda.EdtConsulta.SetFocus;
      FrmListaPedidos.Close; }
    end;
end;

procedure TFrmListaPedidos.PegaCliente;
begin
  with DModulo.ADOQuery1 do begin
    SQL.Text := 'Select cdPessoa,nmPessoa From Pessoa WITH (NOLOCK) Where cdPessoa = :CODIGO';
    Parameters.ParamByName('CODIGO').Value := ADOLanctoCliente.AsInteger;
    open;
    LblCliente.Caption := 'Cliente -------> ' + DModulo.ADOQuery1.FieldByName('cdPessoa').AsString + '  ' +
                                                DModulo.ADOQuery1.FieldByName('nmPessoa').AsString;
    Sql.Text := 'Select cdPessoa,nmPessoa From Pessoa WITH (NOLOCK) Where cdPessoa = :CODIGO';
    Parameters.ParamByName('CODIGO').Value := ADOLanctoVendedor.AsInteger;
    open;
    LblVendedor.Caption := 'Vendedor --> ' + DModulo.ADOQuery1.FieldByName('cdPessoa').AsString + '  ' +
                                             DModulo.ADOQuery1.FieldByName('nmPessoa').AsString;
  end;
end;

procedure TFrmListaPedidos.FormActivate(Sender: TObject);
begin
  AtualizaLancto;
end;

procedure TFrmListaPedidos.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  MontaItens;
end;

procedure TFrmListaPedidos.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  MontaItens;
end;

procedure TFrmListaPedidos.DBGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  MontaItens;
end;

end.
