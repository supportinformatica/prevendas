unit RelReceber;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RelModelo, Db, Qrctrls, QuickRpt, ExtCtrls, ADODB, QRExport, QRPDFFilt;

type
  TFrmRelReceber = class(TFrmMdRel)
    QrLblSubT: TQRLabel;
    QrLblvencimeto: TQRLabel;
    QrLblDtInicial: TQRLabel;
    QRLabel2: TQRLabel;
    QrLblDtFinal: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRBand1: TQRBand;
    QRExpr9: TQRExpr;
    QRBand3: TQRBand;
    QRExpr10: TQRExpr;
    QRBand2: TQRBand;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRGroup1: TQRGroup;
    QrCodigo: TQRExpr;
    QRExpr1: TQRExpr;
    QRLblDiferenca: TQRLabel;
    QRLabel15: TQRLabel;
    QRExpr12: TQRExpr;
    QRLabel16: TQRLabel;
    QRExpr13: TQRExpr;
    QRExpr14: TQRExpr;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRExpr15: TQRExpr;
    QRExpr16: TQRExpr;
    QRLabel20: TQRLabel;
    QRExpr17: TQRExpr;
    QRExpr18: TQRExpr;
    QRExpr19: TQRExpr;
    QRExpr20: TQRExpr;
    QRExpr21: TQRExpr;
    QRExpr22: TQRExpr;
    QRExpr23: TQRExpr;
    QRLabel11: TQRLabel;
    ADOQryMontaCombo: TADOQuery;
    QREObs: TQRExpr;
    QRExpr24: TQRExpr;
    ADOQryRelDadosCdigo: TIntegerField;
    ADOQryRelDadosNome: TStringField;
    ADOQryRelDadoscdTipo: TIntegerField;
    ADOQryRelDadosdsCusto: TStringField;
    ADOQryRelDadosLanamento: TStringField;
    ADOQryRelDadosDocumento: TStringField;
    ADOQryRelDadosParcela: TStringField;
    ADOQryRelDadosValor: TBCDField;
    ADOQryRelDadosvlAmortizado: TBCDField;
    ADOQryRelDadosdsObservacao: TStringField;
    ADOQryRelDadosSaldo: TBCDField;
    ADOQryRelDadosdtVencimento: TDateTimeField;
    ADOQryRelDadosdtPagamento: TDateTimeField;
    ADOQryRelDadosdtEmissao: TDateTimeField;
    ADOQryRelDadosvlAcrescimo: TBCDField;
    ADOQryRelDadosvlDesconto: TBCDField;
    ADOQryRelDadosDiferenca: TDateTimeField;
    QrlRazao: TQRLabel;
    QrlBruto: TQRLabel;
    ADOQryRelDadosDesconto: TBCDField;
    ADOQryRelDadosTotal: TBCDField;
    ADOQryRelDadosdsBoleto: TStringField;
    procedure QRExpr7Print(sender: TObject; var Value: String);
    procedure QRB1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    vTipo : String[01]; // usada para verificar se a chamada é do cntas a pagar => 1 ou receber =>
    visualiza_Razao : Boolean;
  end;

var
  FrmRelReceber: TFrmRelReceber;

implementation

uses CdCreditoCliente, StdCtrls, FrmPrincipal,
  DataModulo, MoPreVenda, uFuncoesPadrao;

{$R *.DFM}

procedure TFrmRelReceber.QRExpr7Print(sender: TObject; var Value: String);
var //vData : TDateTime;
    i : real;
begin
  inherited;
{  if vTipo = '0' then begin
    case FrmReceber.RgTipo.ItemIndex of
     0: begin // Abertos e Quitados
       if (ADOQryRelDadosdtPagamento.Value = 0)     and
          (ADOQryRelDadosdtVencimento.Value < Date) then begin
         QrExpr11.Enabled       := true;
         QrLblDiferenca.Enabled := True;
         vData := Date;
//         if
         i := ADOQryRelDadosdtVencimento.Value - Date;
         QrLblDiferenca.Caption := FloatToStr(i);
       end else begin
         QrExpr11.Enabled       := True;
//         QrLblDiferenca.Enabled := False;
        end;
      end;
     1: begin // Abertos
       QrExpr11.Enabled       := False;
       QrLblDiferenca.Enabled := True;
       if ADOQryRelDadosdtVencimento.Value > Date then begin
         QrLblDiferenca.Caption := '0';
        end else begin
         vData := Date;
         QrLblDiferenca.Caption := FloattoStr(vData - ADOQryRelDadosdtVencimento.Value);
        end;
      end;
     2: begin // Quitados
        QrExpr11.Enabled       := True;
        QrLblDiferenca.Enabled := False;
      end;
    end; // case
  end else if vTipo = '1' then begin
    case FrmPagar.RgTipo.ItemIndex of
     0: begin // Abertos e Quitados
       if (ADOQryRelDadosdtPagamento.Value = 0) and (ADOQryRelDadosdtVencimento.Value < Date) then begin
         QrExpr11.Enabled       := False;
         QrLblDiferenca.Enabled := True;
         vData := Date;
         QrLblDiferenca.Caption := FloattoStr(vData - ADOQryRelDadosdtVencimento.Value);
        end else begin
         QrExpr11.Enabled       := True;
         QrLblDiferenca.Enabled := False;
        end;
      end;
     1: begin // Abertos
       QrExpr11.Enabled       := False;
       QrLblDiferenca.Enabled := True;
       if ADOQryRelDadosdtVencimento.Value > Date then begin
         QrLblDiferenca.Caption := '0';
       end else begin
         vData := Date;
         QrLblDiferenca.Caption := FloattoStr(vData - ADOQryRelDadosdtVencimento.Value);
        end;
      end;
     2: begin // Quitados
        QrExpr11.Enabled       := True;
        QrLblDiferenca.Enabled := False;
      end;
    end; // case }
//  if (vTipo = '0') or (vTipo = '1') then begin
    if (ADOQryRelDadosdtPagamento.Value = 0) then
      i := StrToDate(vData_Banco) - ADOQryRelDadosdtVencimento.Value
    else
      i := ADOQryRelDadosdtPagamento.Value - ADOQryRelDadosdtVencimento.Value;
    QrLblDiferenca.Caption := FloatToStr(i);
    if i > 0 then
      QrLblDiferenca.Enabled := true
    else
      QrLblDiferenca.Enabled := false;
{  end else begin // Consulta de Crédito
     QrExpr11.Enabled       := False;
     QrLblDiferenca.Enabled := True;
     if ADOQryRelDadosdtVencimento.Value > Date then begin
       QrLblDiferenca.Caption := '0';
      end else begin
       vData := Date;
       QrLblDiferenca.Caption := FloattoStr(vData - ADOQryRelDadosdtVencimento.Value);
      end;
  end; }
end;

procedure TFrmRelReceber.QRB1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var vcomp,vdevolv,vTroca : real;
    i : integer;
begin
  inherited;
  if vTipo = '2' then begin
    With ADOQryMontaCombo do begin
      Sql.Text := 'Select Sum(vlCheque) as Valor From Cheque         '+
                  'Where dsStatus IN (''A'') and cdPessoa = :CODIGO  ';
      Parameters.ParamByName('CODIGO').Value  := FrmCreditoCliente.edtcdCliente.text;
      Open;
      vcomp := FieldByName('Valor').AsFloat;
      Sql.Text := 'Select Sum(vlCheque) as Valor From Cheque         '+
                  'Where dsStatus IN (''T'') and cdPessoa = :CODIGO1 '+
                  'and dtCompensacao >= GETDATE()                    ';
      Parameters.ParamByName('CODIGO1').Value := FrmCreditoCliente.edtcdCliente.Text;
      open;
      vTroca := 0;
      vTroca := vTroca + FieldByName('Valor').AsFloat;
      Sql.Text := 'Select Sum(vlCheque) as Valor From Cheque        '+
                  'Where dsStatus IN (''D'') and cdPessoa = :CODIGO ';
      Parameters.ParamByName('CODIGO').Value  := vCdPessoa;
      open;
      vdevolv := FieldByName('Valor').AsFloat;
      QRLabel2.Enabled := false;
      QrLblvencimeto.Caption := 'Cheques a compensar: R$ ' +FormatFloat('#,##0.00',vComp+vTroca) +
                                ' Cheques devolvidos: R$ ' +FormatFloat('#,##0.00',vdevolv);
    end;
  end;
end;

procedure TFrmRelReceber.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var vAux : String;
begin
  inherited;
  if vTipo = '0' then begin
    // Calcula o valor bruto da venda para a CAMARATUBA
    if UPPERCASE(vEmpresa) = 'CAMARATUBA' then begin
       vAux := FormatFloat('0.00',(1 - ((ADOQryRelDadosTotal.AsFloat - ADOQryRelDadosDesconto.AsFloat) / ADOQryRelDadosTotal.AsFloat)) * 100);
       QrlBruto.caption := FormatFloat('0.00',(ADOQryRelDadosvalor.AsFloat*100)/(100-(StrToFloat(vAux) + 0.00000001)));
    end;
  end;
  if visualiza_Razao = true then begin
    QrlRazao.Enabled := true;
    QrlRazao.Visible := true;
    QRExpr12.Enabled := False;
    QRExpr12.Visible := False;
    with DModulo.ADOQuery1 do begin
      Sql.Text := 'select J.nmRazao from p_juridica J Where cdPessoa = :CODIGO and nmRazao is not null';
      Parameters.ParamByName('CODIGO').Value := ADOQryRelDadosCdigo.AsInteger;
      open;
      if (DModulo.ADOQuery1.RecordCount > 0) and (Trim(DModulo.ADOQuery1.FieldByName('nmRazao').AsString) <> '') then
        QrlRazao.Caption := DModulo.ADOQuery1.FieldByName('nmRazao').AsString
      else
        QrlRazao.Caption := ADOQryRelDadosNome.AsString;
    end;
  end else begin
    QrlRazao.Enabled := False;
  end;
end;

end.
