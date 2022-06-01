unit RelContagem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RelModelo, Db, Qrctrls, QuickRpt, ExtCtrls, ADODB;

type
  TRelContagemEstoque = class(TFrmMdRel)
    QRLabel1: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QrlValor: TQRLabel;
    QRLabel7: TQRLabel;
    QRGroup2: TQRGroup;
    QREcdGrupo: TQRExpr;
    QRBand2: TQRBand;
    QRLabel6: TQRLabel;
    QRExpr5: TQRExpr;
    QRBand1: TQRBand;
    QRExpr4: TQRExpr;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr6: TQRExpr;
    QRLabel4: TQRLabel;
    QRExpr7: TQRExpr;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRExpr10: TQRExpr;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    ADOQryRelDadoscdProduto: TIntegerField;
    ADOQryRelDadoscdFabricante: TStringField;
    ADOQryRelDadosdsReferencia: TStringField;
    ADOQryRelDadosNmProduto: TStringField;
    ADOQryRelDadosnmGrupo: TStringField;
    ADOQryRelDadosdsEmbalagem: TStringField;
    ADOQryRelDadosdsUnidade: TStringField;
    ADOQryRelDadosdsPrateleira: TStringField;
    ADOQryRelDadosnrQtdReal: TFloatField;
    ADOQryRelDadosnrQtdMInima: TFloatField;
    ADOQryRelDadosnmPessoa: TStringField;
    ADOQryRelDadosPreco: TBCDField;
    LblOs: TQRLabel;
    LblDep: TQRLabel;
    LblBalcao: TQRLabel;
    QRExpr3: TQRExpr;
    ADOQuery1: TADOQuery;
    ADOQryUltimoCodigo: TADOQuery;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RelContagemEstoque: TRelContagemEstoque;

implementation

{$R *.DFM}

procedure TRelContagemEstoque.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  with ADOQuery1 do begin   // Vou pegar o q está na oficina
   Sql.Text := 'SELECT Sum(I.nrQtd) as Qtd FROM Orcamento O INNER JOIN IteOrcamento I    '+
               'ON O.nrOrcamento = I.nrOrcamento Where I.cdproduto = :CDPRODUTO          '+
               'and I.dsSituacao <> ''C'' and O.dsImpresso <> ''S''  and O.nrObjeto <> 0 ';
   Parameters.ParamByName('CDPRODUTO').Value := ADOQryRelDados.FieldByName('cdProduto').AsString;
   open;
   if FieldByName('Qtd').AsString = '' then begin
     LblOS.Caption := '0';
   end else   LblOs.Caption := FormatFloat('0.00',FieldByName('Qtd').AsFloat);
  end;
  With ADOQryUltimoCodigo do begin   // Pega da conexão depósito
   Sql.Text := 'Select nrqtdReal             '+
               'From Produto                 '+
               'Where cdProduto = :CDPRODUTO ';
   Parameters.ParamByName('CDPRODUTO').Value := ADOQryRelDados.FieldByName('cdProduto').AsString;
   Open;
  end;
  LblBalcao.Caption := FormatFloat('0.00',(ADOQryRelDados.FieldByName('nrQtdReal').AsFloat
                                        - ADOQryUltimoCodigo.FieldByName('nrqtdreal').AsFloat)
                                        - StrToFloat(LblOS.Caption));
  lbldep.Caption := FormatFloat('0.00',ADOQryUltimoCodigo.FieldByName('nrqtdreal').AsFloat);

end;

end.
