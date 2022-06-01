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
    QRGroup1: TQRGroup;
    QRBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText3: TQRDBText;
    QRLblQtd: TQRLabel;
    QRLblProduto: TQRLabel;
    QRLlbCodigo: TQRLabel;
    QRLblSolicitada: TQRLabel;
    QRLblChegou: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText12: TQRDBText;
    QRLblPedido: TQRLabel;
    QRLblDataChegada: TQRLabel;
    QRSubDetail1: TQRSubDetail;
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
    QRDBText5: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText14: TQRDBText;
    AdoQryPedidosnrLancto: TIntegerField;
    AdoQryPedidossolicitado: TFloatField;
    AdoQryPedidoschegado: TFloatField;
    QRDBText13: TQRDBText;
    AdoQryPedidosdtchegada: TWideMemoField;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QrlChegou: TQRLabel;
    QrlSolicitou: TQRLabel;
    ADOQryResumo: TADOQuery;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
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
  if frmCadLista.CbxExibirProdutos.Checked then begin
    with AdoQryPedidos do
    begin
      sql.Text := 'Select P.nrLancto, I.nrQtd as solicitado, I.recebido as chegado,          '+
                  '  CASE WHEN I.recebido < I.nrQtd THEN '' ''                               '+
                  '       ELSE convert(nvarchar(MAX), P.dtchegada, 103) END AS dtchegada     '+
                  'from LivroPedido L with (nolock) inner join PedidoCompra P with (nolock)  '+
                  'on L.nrLancto = P.nrLancto                                                '+
                  'inner join IteOrcamento I with (nolock) on I.nrOrcamento = L.nrOrcamento  '+
                  'and I.cdProduto = L.cdProduto                                             '+
                  'where L.nrOrcamento = :nrOrcamento and L.cdProduto = :cdProduto           ';

      Parameters.ParamByName('nrOrcamento').Value := ADOQryRelDadosnrOrcamento.AsString;
      Parameters.ParamByName('cdProduto').Value := ADOQryRelDadoscdProduto.AsString;

//      case frmCadLista.RgData.ItemIndex of
//        1: begin
//          sql.Add('and P.dtchegada between :dt1 and :dt2 ');
//          Parameters.ParamByName('dt1').Value := dateOf(frmCadLista.dtInicial.Date);
//          Parameters.ParamByName('dt2').Value := dateOf(frmCadLista.dtFinal.Date);
//        end;
//      end;

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
    sql.Text := 'select isnull(sum(I.nrQtd),0) as Solicitado,isnull(sum(I.recebido),0) as chegado '+
                'from Iteorcamento I inner join Produto Pr on                                     '+
                'Pr.cdproduto = I.cdProduto and Pr.cdgrupo = 19                                   '+
                'where I.nrOrcamento = :nrOrcamento                                               ';
    Parameters.ParamByName('nrOrcamento').Value := ADOQryRelDadosnrOrcamento.AsString;
//    case FrmCadLista.CbxFiltrarLivrosSolicitados.ItemIndex of
//      1: begin
//        sql.Add('and I.RECEBIDO = I.nrQtd'); //CHEGARAM
//      end;
//      2: begin
//        sql.Add('and I.nrQtd > I.RECEBIDO'); //FALTA CHEGAR
//      end;
//    end;
    open;
    QrlSolicitou.Caption := FieldByName('solicitado').AsString;
    QrlChegou.Caption := FieldByName('chegado').AsString;
    close;
  end;
end;

end.



