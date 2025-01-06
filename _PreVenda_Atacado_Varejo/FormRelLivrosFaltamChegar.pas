unit FormRelLivrosFaltamChegar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RelModelo, QRExport, QRPDFFilt, Data.DB,
  Data.Win.ADODB, QRCtrls, QuickRpt, Vcl.ExtCtrls, DataModulo, System.DateUtils;

type
  TFrmRelLivrosFaltamChegar = class(TFrmMdRel)
    QRLabel12: TQRLabel;
    QrlPeriodo: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel10: TQRLabel;
    AdoQryPedidos: TADOQuery;
    ADOQryRelDadosnrOrcamento: TIntegerField;
    ADOQryRelDadosdtEmissao: TDateTimeField;
    ADOQryRelDadostipoForracao: TStringField;
    ADOQryRelDadoscdProduto: TIntegerField;
    ADOQryRelDadosnmProduto: TStringField;
    ADOQryRelDadoscdPessoa: TIntegerField;
    ADOQryRelDadosnmPessoa: TStringField;
    ADOQryRelDadostels: TStringField;
    ADOQryRelDadosApelido: TStringField;
    ADOQryRelDadosnrOrcamentoDia: TIntegerField;
    ADOQryRelDadosqtdPrevenda: TFloatField;
    AdoQryPedidosnrLancto: TIntegerField;
    AdoQryPedidosdtchegada: TWideMemoField;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    ADOQryResumo: TADOQuery;
    AdoQryPedidossolicitado: TIntegerField;
    AdoQryPedidoschegado: TIntegerField;
    QRBand2: TQRBand;
    QRLabel5: TQRLabel;
    QrlListados: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    QRDBText5: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText13: TQRDBText;
    QRBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText3: TQRDBText;
    QRGroup1: TQRGroup;
    QRDBText2: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRLblQtd: TQRLabel;
    QRLblProduto: TQRLabel;
    QRLlbCodigo: TQRLabel;
    QRLblSolicitada: TQRLabel;
    QRLblChegou: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText12: TQRDBText;
    QRLblPedido: TQRLabel;
    QRLblDataChegada: TQRLabel;
    QrlChegou: TQRLabel;
    QrlSolicitou: TQRLabel;
    QRDBText15: TQRDBText;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRMdRelBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    tot: integer;
  public

  end;

var
  FrmRelLivrosFaltamChegar: TFrmRelLivrosFaltamChegar;

implementation

uses
  UfrmCadLista;

{$R *.dfm}

procedure TFrmRelLivrosFaltamChegar.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if frmCadLista.CbxExibirProdutos.Checked then
  begin
    with AdoQryPedidos do
    begin
      sql.Text :=
      'Select P.nrLancto, L.solicitado, L.recebido as chegado,                  '+
      'CASE WHEN I.recebido < I.nrQtd THEN '' ''                                '+
      'ELSE convert(nvarchar(MAX), P.dtchegada, 103) END AS dtchegada           '+
      'From LivroPedido L with (nolock) inner join PedidoCompra P with (nolock) '+
      'on L.nrLancto = P.nrLancto                                               '+
      'inner join IteOrcamento I with (nolock) on I.nrOrcamento = L.nrOrcamento '+
      'and I.cdProduto = L.cdProduto                                            '+
      'where L.nrOrcamento = :nrOrcamento and L.cdProduto = :cdProduto          ';
      Parameters.ParamByName('nrOrcamento').Value := ADOQryRelDadosnrOrcamento.AsString;
      Parameters.ParamByName('cdProduto').Value := ADOQryRelDadoscdProduto.AsString;
      case frmCadLista.RgData.ItemIndex of
        1:
        begin
          sql.Add('and P.dtchegada between :dt1 and :dt2 ');
          Parameters.ParamByName('dt1').Value := dateOf(frmCadLista.dtInicial.Date);
          Parameters.ParamByName('dt2').Value := dateOf(frmCadLista.dtFinal.Date);
        end;
      end;
      if FrmCadLista.EdtPedido.text <> '' then
      begin
        sql.add('and L.nrLancto = :nrLancto ');
        Parameters.ParamByName('nrLancto').Value := FrmCadLista.EdtPedido.text;
      end;
      open;
    end;
  end;
end;

procedure TFrmRelLivrosFaltamChegar.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  with ADOQryResumo do
  begin
    sql.Text :=
    'Select isnull(sum(I.nrQtd),0) as Solicitado,isnull(sum(I.recebido),0) as chegado '+
    'From Iteorcamento I WITH(nolock) inner join Produto Pr WITH(nolock) on           '+
    'Pr.cdproduto = I.cdProduto and Pr.cdgrupo = 19                                   '+
    'Where I.nrOrcamento = :nrOrcamento                                               ';
    Parameters.ParamByName('nrOrcamento').Value := ADOQryRelDadosnrOrcamento.AsString;
    open;
    QrlSolicitou.Caption := FieldByName('solicitado').AsString;
    QrlChegou.Caption := FieldByName('chegado').AsString;
    close;
  end;
  inc(tot);
end;

procedure TFrmRelLivrosFaltamChegar.QRMdRelBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  inherited;
  tot := 0;
end;

procedure TFrmRelLivrosFaltamChegar.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  QrlListados.caption := IntToStr(tot);
end;

end.



