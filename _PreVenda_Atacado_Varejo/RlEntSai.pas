unit RlEntSai;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, ExtCtrls, Buttons, Db, ADODB, Variants, Menus;

type
  TFrmEntSaid = class(TForm)
    RDGSelecao: TRadioGroup;
    CBCliente: TComboBox;
    CBnmProduto: TComboBox;
    LblCliente: TLabel;
    Bevel2: TBevel;
    LblGruProd: TLabel;
    DTinicial: TDateTimePicker;
    DTfinal: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    RDGTipo: TRadioGroup;
    CBCodigoCli: TComboBox;
    Label4: TLabel;
    CBCdProduto: TComboBox;
    LblCodigo: TLabel;
    Label3: TPanel;
    Label8: TLabel;
    EdtLancamento: TEdit;
    CkbServicos: TCheckBox;
    ADOQryPessoa: TADOQuery;
    ADOQryCombFone: TADOQuery;
    CheckBox1: TCheckBox;
    PopupMenu2: TPopupMenu;
    Ajuda2: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RDGSelecaoClick(Sender: TObject);
    procedure CBCodigoCliExit(Sender: TObject);
    procedure CBClienteExit(Sender: TObject);
    procedure CBClienteChange(Sender: TObject);
    procedure CBCdProdutoExit(Sender: TObject);
    procedure CBnmProdutoChange(Sender: TObject);
    procedure Ajuda2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmEntSaid: TFrmEntSaid;

implementation

uses RelEntSai, uFuncoesPadrao, FrmPrincipal;

{$R *.DFM}

procedure TFrmEntSaid.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := Cafree;
  FormPrincipal.MiSaidasA.Enabled := True;
end;

procedure TFrmEntSaid.BitBtn2Click(Sender: TObject);
begin
   close;
end;

procedure TFrmEntSaid.BitBtn1Click(Sender: TObject);
var
  auxdata : Tdatetime;
  List_Lancamentos : TStringList;
  i : Integer;
  vLancamentos : String;
  vrel : String[01];
begin
  FrmRelEntSai := TFrmRelEntSai.Create(Self);
  vrel := '1';
  if CheckBox1.Checked = true then begin
     FrmRelEntSai.QrlVendedor.Enabled := True;
     FrmRelEntSai.QrlVendedor.Transparent := True;
  end;
  List_Lancamentos := TStringList.Create;
  // testa se a opcao escolhida está preenchida
  case RDGSelecao.ItemIndex of
   1,4,5,6,7,8,9: begin
       if CBCliente.ItemIndex = -1 then begin
         if (RDGSelecao.ItemIndex = 1) or (RDGSelecao.ItemIndex = 4)
            or (RDGSelecao.ItemIndex = 5) then begin
            ShowMessage('Selecione a pessoa!');
            CBCliente.SetFocus;
            Exit;
         end else if (RDGSelecao.ItemIndex = 6) or (RDGSelecao.ItemIndex = 7) then begin
           ShowMessage('Selecione o vendedor!');
           CBCliente.SetFocus;
           Exit;
         end else if (RDGSelecao.ItemIndex = 8) or (RDGSelecao.ItemIndex = 9) then begin
           ShowMessage('Selecione o fabricante!');
           CBCliente.SetFocus;
           Exit;
         end;
       end;
       if CBnmProduto.ItemIndex = -1 then begin
          if (RDGSelecao.ItemIndex = 4) or (RDGSelecao.ItemIndex = 7)
              or (RDGSelecao.ItemIndex = 9) then begin
            ShowMessage('Selecione o produto!');
            CBnmProduto.SetFocus;
            Exit;
          end else if (RDGSelecao.ItemIndex = 5) then begin
            ShowMessage('Selecione o grupo!');
            CBnmProduto.SetFocus;
            Exit;
          end;
       end;
   end;
   2,3,10: begin
       if CBnmProduto.ItemIndex = -1 then begin
         if RDGSelecao.ItemIndex = 2 then
           ShowMessage('Selecione o produto!')
         else if RDGSelecao.ItemIndex = 3 then
           ShowMessage('Selecione o grupo!')
         else if RDGSelecao.ItemIndex = 10 then
           ShowMessage('Selecione o tipo de cliente!');
         CBnmProduto.SetFocus;
         Exit;
       end;
   end;
  end;
  With FrmRelEntSai.ADOQryRelDados do begin
    Sql.Text := 'Select I.dsLancamento,L.dtEmissao,L.Dt_Efefiva_E_S,I.cdProduto,         '+
                'P.cdFabricante,P.nmProduto,P.cdPessoa,I.nrQtd,L.vlValor,L.vlDesconto,   '+
                'I.vlUnitario,I.vlunitario_Bruto,C.nmPessoa,L.cdComissao,P.dsReferencia  '+
                'From Lancto AS L,IteLcto AS I,Produto AS P,Pessoa AS C, Grupo as G      '+
                'Where L.dsLancamento = I.dsLancamento and L.cdPessoa = I.cdPessoa       '+
                'and L.dsstatus = I.dsStatus and C.cdPessoa = L.cdPessoa                 '+
                'and P.cdGrupo = G.cdGrupo                                               '+
                'and L.dtEmissao >= :DTE1 and L.dtEmissao <= :DTE2                       ';
    Parameters.ParamByName('DTE1').Value := DateToStr(DtInicial.Date);
    Parameters.ParamByName('DTE2').Value := DateToStr(DtFinal.Date);
    SQL.Add('and I.dsCancelado is Null ');
    if CkbServicos.Checked = False then
      Sql.Add('and G.nmGrupo <> ''Serviços'' ');
    FrmRelEntSai.QRLblPeriodo.Caption :=  DateToStr(DtInicial.date)+' à '+DateToStr(DtFinal.date);
    FrmRelEntSai.QRLblSelecao.Caption := '';
    FrmRelEntSai.QRLblSelec.Caption   := '';
    case RDGSelecao.ItemIndex of
      0: begin
          FrmRelEntSai.QRGroup1.Expression  := 'ADOQryRelDados.dsLancamento';
      end;
      1: begin  // pessoa
        if CBCliente.Text <> '' then begin
          Sql.Add('and I.cdPessoa = :CDPESSOA');
          Parameters.ParamByName('CDPESSOA').Value := CBCodigoCli.Text;
          FrmRelEntSai.QRLblSelecao.Caption := 'Pessoa->';
          FrmRelEntSai.QRLblSelec.Caption   := CBCliente.Text;
          FrmRelEntSai.QRGroup1.Expression  := 'ADOQryRelDados.dsLancamento';
        end;
      end;
      2: begin // produto
        if CBnmProduto.Text <> '' then begin
          Sql.Add('and I.cdProduto = :CDPRODUTO');
          Parameters.ParamByName('CDPRODUTO').Value := CBcdProduto.Text;
          FrmRelEntSai.QRLblSelecao.Caption := 'Produto->';
          FrmRelEntSai.QRLblSelec.Caption   := CBnmProduto.Text;
          FrmRelEntSai.QRGroup1.Expression  := 'ADOQryRelDados.dsLancamento';
        end;
      end;
      3: begin // grupo
         if CBnmProduto.Text <> '' then begin
           Sql.Add('and I.cdProduto = P.cdProduto');
           Sql.Add('and P.cdGrupo = :CDGRUPO');
           Parameters.ParamByName('CDGRUPO').Value := CBcdProduto.Text;
           FrmRelEntSai.QRLblSelecao.Caption := 'Grupo->';
           FrmRelEntSai.QRLblSelec.Caption   := CBnmProduto.Text;
           FrmRelEntSai.QRGroup1.Expression  := 'ADOQryRelDados.dsLancamento';
         end;
      end;
      4: begin // pessoa & produto
         if (CBCliente.Text <> '') and (CBcdProduto.Text <> '') then begin
           Sql.Add('and L.cdPessoa = :CDPESSOA');
           Sql.Add('and I.cdProduto = :CDPRODUTO');
           Parameters.ParamByName('CDPESSOA').Value := CBCodigoCli.Text;
           Parameters.ParamByName('CDPRODUTO').Value := CBcdProduto.Text;
           FrmRelEntSai.QRLblSelecao.Caption := 'Pessoa/Produto->';
           FrmRelEntSai.QRLblSelec.Caption   := CBCliente.Text + ' / ' + CBnmProduto.Text;
           FrmRelEntSai.QRGroup1.Expression  := 'ADOQryRelDados.dsLancamento';
         end;
      end;
      5: begin // pessoa & grupo
         if (CBCodigoCli.Text <> '') and (CBnmProduto.Text <> '') then begin
           Sql.Add('and I.cdProduto = P.cdProduto ');
           Sql.Add('and L.cdPessoa = :CDPESSOA');
           Sql.Add('and P.cdGrupo = :CDGRUPO');
           Parameters.ParamByName('CDPESSOA').Value := CBCodigoCli.Text;
           Parameters.ParamByName('CDGRUPO').Value := CBcdProduto.Text;
           FrmRelEntSai.QRLblSelecao.Caption := 'Pessoa/Grupo->';
           FrmRelEntSai.QRLblSelec.Caption   := CBCliente.Text+' / ' + CBnmProduto.Text;
           FrmRelEntSai.QRGroup1.Expression  := 'ADOQryRelDados.dsLancamento';
         end;
      end;
      6: begin // vendedor
         if (CBCodigoCli.text <> '') then begin
          Sql.Add('and L.cdComissao = :CDCOMISSAO');
          Parameters.ParamByName('CDCOMISSAO').Value := CBCodigoCli.Text;
          FrmRelEntSai.QRLblSelecao.Caption := 'Vendedor->';
          FrmRelEntSai.QRLblSelec.Caption   := CBCliente.Text;
          FrmRelEntSai.QRGroup1.Expression  := 'ADOQryRelDados.dsLancamento';
         end;
      end;
      7: begin  // vendedor & produto
        Sql.Add('and L.cdComissao = :CDCOMISSAO ');
        Sql.Add('and I.cdProduto = :CDPRODUTO ');
        Parameters.ParamByName('CDCOMISSAO').Value := CBCodigoCli.Text;
        Parameters.ParamByName('CDPRODUTO').Value := CBcdProduto.Text;
         FrmRelEntSai.QRLblSelecao.Caption := 'Vendedor/Grupo->';
         FrmRelEntSai.QRLblSelec.Caption   := CBCliente.Text + ' / ' + CBnmProduto.Text;
         FrmRelEntSai.QRGroup1.Expression  := 'ADOQryRelDados.dsLancamento';
      end;
      8: begin // fabricante
        if CBCliente.Text <> '' then begin
          Sql.Add('and P.cdPessoa_1 = :CDPESSOA_1');
          Parameters.ParamByName('CDPESSOA_1').Value := CBCodigoCli.Text;
          FrmRelEntSai.QRLblSelecao.Caption := 'Fabricanate->';
          FrmRelEntSai.QRLblSelec.Caption   := CBCliente.Text;
          FrmRelEntSai.QRGroup1.Expression  := 'ADOQryRelDados.dsLancamento';
        end;
      end;
      9: begin  // fabricante e produto
         if (CBCliente.Text <> '') and (CBcdProduto.Text <> '') then begin
           Sql.Add('and I.cdProduto = :CDPRODUTO');
           Sql.Add('and P.cdPessoa_1 = :CDPESSOA_1');
           Parameters.ParamByName('CDPRODUTO').Value := CBcdProduto.Text;
           Parameters.ParamByName('CDPESSOA_1').Value := CBCodigoCli.Text;
           FrmRelEntSai.QRLblSelecao.Caption := 'Fabricante/Produto->';
           FrmRelEntSai.QRLblSelec.Caption   := CBCliente.Text+' / '+ CBnmProduto.Text;
           FrmRelEntSai.QRGroup1.Expression  := 'ADOQryRelDados.dsLancamento';
         end;
      end;
      10: begin // Tipo de cliente
         if (CBcdProduto.Text <> '') then begin
           Sql.Text := 'Select I.dsLancamento,L.dtEmissao,L.Dt_Efefiva_E_S,I.cdProduto,      '+
                       'P.cdFabricante,P.nmProduto,P.cdPessoa,I.nrQtd,                       '+
                       'I.vlUnitario,I.vlunitario_Bruto,C.nmPessoa,L.cdComissao              '+
                       'From Lancto AS L,IteLcto AS I,Produto AS P,Pessoa AS C, Cliente as T '+
                       'Where L.dsLancamento = I.dsLancamento and L.cdPessoa = I.cdPessoa    '+
                       'and L.dsstatus = I.dsStatus and C.cdPessoa = L.cdPessoa              '+
                       'and L.dtEmissao BETWEEN :DTE1 and :DTE2 and I.dsCancelado is Null    '+
                       'and L.cdPessoa = T.cdPessoa and T.cdCodigo = :CDCODIGO               ';
           Parameters.ParamByName('DTE1').Value := DateToStr(DtInicial.Date);
           Parameters.ParamByName('DTE2').Value := DateToStr(DtFinal.Date);
           Parameters.ParamByName('CDCODIGO').Value := CbCdProduto.Text ;
           FrmRelEntSai.QRLblPeriodo.Caption :=  DateToStr(DtInicial.date)+' à '+DateToStr(DtFinal.date);
           FrmRelEntSai.QRLblSelecao.Caption := 'Tipo de cliente ->';
           FrmRelEntSai.QRLblSelec.Caption   := CBnmProduto.Text;
           FrmRelEntSai.QRGroup1.Expression  := 'ADOQryRelDados.dsLancamento';
         end;
      end;
      11: begin  // vendedor & fabricante
        Sql.Add('and I.cdProduto = P.cdProduto ');
        Sql.Add('and L.cdComissao = :CDCOMISSAO');
        Sql.Add('and P.cdPessoa_1 = :CDPESSOA_1');
        Parameters.ParamByName('CDCOMISSAO').Value := CBCodigoCli.Text;
        Parameters.ParamByName('CDPESSOA_1').Value := CBcdProduto.Text;
        FrmRelEntSai.QRLblSelecao.Caption := 'Vend/Fabricante->';
        FrmRelEntSai.QRLblSelec.Caption   := CBCliente.Text + ' / ' + CBnmProduto.Text;
        FrmRelEntSai.QRGroup1.Expression  := 'ADOQryRelDados.dsLancamento';
      end;
      12: begin  // vendedor & Grupo
        Sql.Add('and I.cdProduto = P.cdProduto ');
        Sql.Add('and L.cdComissao = :CDCOMISSAO');
        Sql.Add('and P.cdGrupo = :CDGRUPO');
        Parameters.ParamByName('CDCOMISSAO').Value := CBCodigoCli.Text;
        Parameters.ParamByName('CDGRUPO').Value := CBcdProduto.Text;
        FrmRelEntSai.QRLblSelecao.Caption := 'Vendedor/Grupo->';
        FrmRelEntSai.QRLblSelec.Caption   := CBCliente.Text + ' / ' + CBnmProduto.Text;
        FrmRelEntSai.QRGroup1.Expression  := 'ADOQryRelDados.dsLancamento';
      end;
    end;
    case RDGTipo.ItemIndex of
      0: begin
        Sql.Add('and I.dsstatus IN (''E'',''X'',''F'',''M'',''H'',''I'',''J'',''K'',''H'',''S'',''6'',''-'',''3'',''L'') ');
        Sql.Add('and L.dsCancelado is null ');
        FrmRelEntSai.QRLblTitulo.Caption := 'Todas as Saídas';
      end;
      1: begin
        Sql.Add('and I.dsstatus IN (''E'',''X'') ');
        Sql.Add('and L.dsCancelado is null ');
        FrmRelEntSai.QRLblTitulo.Caption := 'Venda Nota Fiscal / Cupom Fiscal';
      end;
      2: begin
        Sql.Add('and I.dsstatus = ''F'' ');
        Sql.Add('and L.dsCancelado is null ');
        FrmRelEntSai.QRLblTitulo.Caption := 'Venda com Pedido';
      end;
      3: begin
        Sql.Add('and I.dsstatus = ''H'' ');
        Sql.Add('and L.dsCancelado is null ');
        FrmRelEntSai.QRLblTitulo.Caption := 'Saída p/Consumo';
      end;
      4: begin
        Sql.Add('and I.dsstatus = ''I'' ');
        Sql.Add('and L.dsCancelado is null ');
        FrmRelEntSai.QRLblTitulo.Caption := 'Saída p/Conserto';
      end;
      5: begin
        Sql.Add('and I.dsstatus = ''J'' ');
        Sql.Add('and L.dsCancelado is null ');
        FrmRelEntSai.QRLblTitulo.Caption := 'Saída p/ Garantia';
      end;
      6: begin
        Sql.Add('and I.dsstatus = ''L'' ');
        Sql.Add('and L.dsCancelado is null ');
        FrmRelEntSai.QRLblTitulo.Caption := 'Saída p/Transferência';
      end;
      7: begin
        Sql.Add('and I.dsstatus = ''M'' ');
        Sql.Add('and L.dsCancelado is null ');
        FrmRelEntSai.QRLblTitulo.Caption := 'Saída Devolução p/Fornecedor';
      end;
      8: begin // doacao
        Sql.Add('and I.dsstatus = ''K'' ');
        Sql.Add('and L.dsCancelado is null ');
        FrmRelEntSai.QRLblTitulo.Caption := 'Saídas p/Doações';
      end;
      9: begin // Ajuste de estoque
        Sql.Add('and I.dsstatus in (''S'',''6'',''-'') ');
        Sql.Add('and L.dsCancelado is null ');
        FrmRelEntSai.QRLblTitulo.Caption := 'Saídas Ajuste de Estoque';
      end;
      10: begin // Somente vendas
        Sql.Add('and I.dsstatus IN (''E'',''X'',''F'') ');
        Sql.Add('and L.dsCancelado is null ');
        FrmRelEntSai.QRLblTitulo.Caption := 'Vendas Todas';
      end;
      11: begin
        Sql.Add('and I.dsstatus IN (''E'',''X'',''F'') ');
        Sql.Add('and L.dsCancelado = ''S'' ');
        FrmRelEntSai.QRLblTitulo.Caption := 'Vendas canceladas';
      end;
    end;
    if Length(EdtLancamento.Text) <> 0 then begin
        Sql.Add ('and L.dsLancamento = :DSLANCAMENTO');
        Parameters.ParamByName('DSLANCAMENTO').Value := EdtLancamento.Text;
        FrmRelEntSai.QRLblTitulo.Caption := FrmRelEntSai.QRLblTitulo.Caption + ' Lancto nº - > ' + EdtLancamento.Text;
     end;
    Sql.Add('and I.cdProduto  = P.cdProduto');
    Sql.Add('order by I.dsLancamento,L.dtEmissao,C.nmPessoa');
    Open;
   {
     Vou calcluar os valores totais por fora para não dar diferença com as comissões.
     Só passará por essa rotina se não tiver nennhum fltro ou se o filtro for somente vendedor.
   }
   if (RdgSelecao.ItemIndex = 6) and (CkbServicos.Checked = True) then begin
     First;
     for i := 1 to RecordCount do begin
        List_Lancamentos.Add(FieldByName('dsLancamento').AsString);
        Next;
     end;
     for i := 0 to List_Lancamentos.Count - 1 do begin //adiciono os codigos na variavel tipo string
          if i = 0 then
            vLancamentos := '''' + List_Lancamentos[i] + ''''
          else
            vLancamentos := vLancamentos + ',''' + List_Lancamentos[i] + '''';
        end;
     if vLancamentos <> '' then begin
       With FrmRelEntSai.ADOQryLancto do begin
          Sql.Clear;
          Sql.Text := 'Select SUM(P.vlValor) as Valor                          '+
                      'From Parcela P, Lancto L                                '+
                      'Where P.dsLancamento = L.dsLancamento                   '+
                      'and P.dsStatus = L.dsStatus and P.cdPessoa = L.cdPessoa '+
                      'and L.dsLancamento in ('+vLancamentos+')                '+
                      'and L.dsCancelado is null                               '+
                      'and L.dtEmissao >= :DTE1 and L.dtEmissao <= :DTE2       ';
          case RDGTipo.ItemIndex of
            0: Sql.Add('and L.dsstatus IN (''E'',''X'',''F'',''M'',''H'',''I'',''J'',''K'',''H'',''S'',''6'',''-'',''3'',''L'') ');
            1: Sql.Add('and L.dsstatus IN (''E'',''X'') ');
            2: Sql.Add('and L.dsstatus = ''F'' ');
            3: Sql.Add('and L.dsstatus = ''H'' ');
            4: Sql.Add('and L.dsstatus = ''I'' ');
            5: Sql.Add('and L.dsstatus = ''J'' ');
            6: Sql.Add('and L.dsstatus = ''L'' ');
            7: Sql.Add('and L.dsstatus = ''M'' ');
            8: Sql.Add('and L.dsstatus = ''K'' ');
            9: Sql.Add('and L.dsstatus in (''S'',''6'') ');
            10: Sql.Add('and L.dsstatus IN (''E'',''X'',''F'') ');
          end;
          Parameters.ParamByName('DTE1').Value := DateToStr(DtInicial.Date);
          Parameters.ParamByName('DTE2').Value := DateToStr(DtFinal.Date);
          Open;
//         FrmRelEntSai.QrExpr10.Expression := 'ADOQryLancto.Valor';
        end;
      end;
    end;
    FrmRelEntSai.QRLabel2.Caption := 'Pessoa';
    FrmRelEntSai.QRMdRel.Preview;
  end;
  FrmRelEntSai.Free;
end;

procedure TFrmEntSaid.FormCreate(Sender: TObject);
begin
  DTinicial.Date := DATE;
  DTfinal.Date   := DATE;
end;

procedure TFrmEntSaid.RDGSelecaoClick(Sender: TObject);
begin
  CBCliente.Enabled   := False;
  CBCodigoCli.Enabled := False;
  CBnmProduto.Enabled := False;
  CBCdProduto.Enabled := False;
  CBCliente.Text := '';
  CBCodigoCli.Text := '';
  CBnmProduto.Text := '';
  CBCdProduto.Text := '';
  // Habilita e desabilita as combos
  case RDGSelecao.ItemIndex of
    0: begin
      CBCliente.Enabled := False;
      CBnmProduto.Enabled := False;
    end;
    1,6,8: begin
      CBCliente.Enabled := True;
    end;
    2,3,10: begin
      CBnmProduto.Enabled := True;
    end;
    4,5,7,9,11,12: begin
      CBCliente.Enabled   := True;
      CBnmProduto.Enabled := True;
    end;
  end;
  // Monta as combos
  case RDGSelecao.ItemIndex of
    1,4,5: begin
      With ADOQryPessoa do begin
        Sql.Text := 'Select nmPessoa as Cliente,cdPessoa as Codigo From Pessoa '+
                    'where Ser in (''C'',''U'',''J'',''I'') Order By nmPessoa        ';
        MontaComboListBoolADO(ADOQryPessoa,CbCliente);
        Sql.Text := 'Select cdPessoa as Código,nmPessoa as Cliente From Pessoa '+
                    'where Ser in (''C'',''U'',''J'',''I'') Order By nmPessoa        ';
        MontaComboListBoolADO(ADOQryPessoa,CbCodigoCli);
      end;
    end;
    6,7,12: begin
       With ADOQryPessoa do begin
        Sql.Text := 'Select nmPessoa as Cliente,cdPessoa as Codigo From Pessoa '+
                    'where Ser = ''U'' Order By nmPessoa                       ';
        MontaComboListBoolADO(ADOQryPessoa,CbCliente);
        Sql.Text := 'Select cdPessoa as Código,nmPessoa as Cliente From Pessoa '+
                    'where Ser = ''U'' Order By nmPessoa                       ';
        MontaComboListBoolADO(ADOQryPessoa,CbCodigoCli);
       end; 
    end;
    10: begin
      with ADOQryCombFone do begin
        LblGruProd.Caption := 'Tipo de cliente';
        Sql.Text := 'Select nmTipo,cdCodigo From TpCliente';
        MontaComboListBoolADO(ADOQryCombFone,CbnmProduto);
        Sql.Text := 'Select cdCodigo From TpCliente';
        MontaComboListBoolADO(ADOQryCombFone,CbCdProduto);
      end;
    end;
    8: begin
      with ADOQryCombFone do begin
        LblGruProd.Caption := 'Fabricante';
        Sql.Text := 'Select P.nmPessoa,P.cdPessoa From Pessoa P           '+
                    'Inner Join Fornecedor F ON (P.cdPessoa = F.cdPessoa) '+
                    'Where F.dsFlag = ''S'' Order By nmPessoa             ';
        MontaComboListBoolADO(ADOQryCombFone,CbCliente);
        Sql.Text := 'Select P.cdPessoa,P.nmPessoa From Pessoa P           '+
                    'Inner Join Fornecedor F ON (P.cdPessoa = F.cdPessoa) '+
                    'Where F.dsFlag = ''S'' Order By nmPessoa             ';
        MontaComboListBoolADO(ADOQryCombFone,CbCodigoCli);
      end;
    end;
    11: begin
      with ADOQryCombFone do begin
        LblGruProd.Caption := 'Fabricante';
        Sql.Text := 'Select P.nmPessoa,P.cdPessoa From Pessoa P           '+
                    'Inner Join Fornecedor F ON (P.cdPessoa = F.cdPessoa) '+
                    'Where F.dsFlag = ''S'' Order By nmPessoa             ';
        MontaComboListBoolADO(ADOQryCombFone,CbnmProduto);
        Sql.Text := 'Select P.cdPessoa,P.nmPessoa From Pessoa P           '+
                    'Inner Join Fornecedor F ON (P.cdPessoa = F.cdPessoa) '+
                    'Where F.dsFlag = ''S'' Order By nmPessoa             ';
        MontaComboListBoolADO(ADOQryCombFone,CbCdProduto);
      end;
    end;
  end;
  case RDGSelecao.ItemIndex of
    2,4,7,9: begin
      with ADOQryCombFone do begin
        LblGruProd.Caption := 'Produto';
        Sql.Text := 'Select cdProduto as Código, nmProduto as Descrição From Produto '+
                    'Order By nmProduto                                              ';
        MontaComboListBoolADO(ADOQryCombFone,CbCdProduto);
        Sql.Text := 'Select nmProduto as Descrição, cdProduto as Código From Produto '+
                    'Order By nmProduto                                              ';
        MontaComboListBoolADO(ADOQryCombFone,CbnmProduto);
      end;
    end;
    3,5,12: begin
      with ADOQryCombFone do begin
        LblGruProd.Caption := 'Grupo';
        Sql.Text := 'Select G.nmGrupo as Nomgrupo, G.cdGrupo as CodGrupo From Grupo G '+
                    'Order By G.nmGrupo                                               ';
        MontaComboListBoolADO(ADOQryCombFone,CbnmProduto);
        Sql.Text := 'Select G.cdGrupo as CodGrupo, G.nmGrupo as Nomgrupo From Grupo G '+
                    'Order By G.nmGrupo                                               ';
        MontaComboListBoolADO(ADOQryCombFone,CbCdProduto);
      end;
    end;
  end;
end;

procedure TFrmEntSaid.CBCodigoCliExit(Sender: TObject);
var
  vExiste:String[01];
  I:Integer;
begin
  inherited;
  vExiste := 'N';
  For i := 0 to CbCodigoCli.Items.Count do
    if CBCodigoCli.Text = CBCodigoCli.Items[i] then begin
      vExiste := 'S';
      CBCodigoCli.ItemIndex := i;
      CBCliente.ItemIndex := CBCodigoCli.ItemIndex;
    end;
  if vExiste = 'N' then Begin
    ShowMessage('Código não Cadastrado!');
    CBCodigoCli.SetFocus;
  end;
end;

procedure TFrmEntSaid.CBClienteExit(Sender: TObject);
begin
   CBCodigoCli.ItemIndex := CBCliente.ItemIndex;
end;

procedure TFrmEntSaid.CBClienteChange(Sender: TObject);
begin
   CBCodigoCli.ItemIndex := CBCliente.ItemIndex;
end;

procedure TFrmEntSaid.CBCdProdutoExit(Sender: TObject);
  var
  vExiste:String[01];
  I:Integer;
begin
  inherited;
  vExiste := 'N';
  For i := 0 to CbcdProduto.Items.Count do
    if CBCdProduto.Text = CBCdProduto.Items[i] then begin
      vExiste := 'S';
      CBCdProduto.ItemIndex := i;
      CBnmProduto.ItemIndex := CBCdProduto.ItemIndex;
    end;
  if vExiste = 'N' then Begin
    ShowMessage('Código do Produto não Cadastrado!');
    CBCodigoCli.SetFocus;
  end;
end;

procedure TFrmEntSaid.CBnmProdutoChange(Sender: TObject);
begin
  CBCdProduto.ItemIndex := CBnmProduto.ItemIndex;
end;

procedure TFrmEntSaid.Ajuda2Click(Sender: TObject);
begin
  Application.HelpContext(58);
end;

end.
