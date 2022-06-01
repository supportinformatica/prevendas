unit RelCliente;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RelModelo, Db,  Qrctrls, QuickRpt, ExtCtrls, ADODB, QRExport, QRPDFFilt;

type
  TFrmRelCliente = class(TFrmMdRel)
    QrLblPessoa: TQRLabel;
    QrLblPubPriv: TQRLabel;
    QrLblAtivo: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRBand3: TQRBand;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRBand1: TQRBand;
    QRLabel8: TQRLabel;
    QRExpr7: TQRExpr;
    QRExpr1: TQRExpr;
    QRLabel9: TQRLabel;
    QRLblTelefone: TQRLabel;
    QRLabel10: TQRLabel;
    QRLbldtNascimento: TQRLabel;
    QrLblFJ: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLblCnjCpf: TQRLabel;
    QRLblIERG: TQRLabel;
    ADoQryCnpIe: TADOQuery;
    AdoQryLocaliza: TADOQuery;
    ADOQryRelDadosCdigo: TIntegerField;
    ADOQryRelDadosCliente: TStringField;
    ADOQryRelDadosLimite_Crdito: TBCDField;
    ADOQryRelDadosdsEmail: TStringField;
    ADOQryRelDadosSer: TStringField;
    ADOQryRelDadosExistir: TStringField;
    ADOQryRelDadosdsHomePage: TStringField;
    ADOQryRelDadosDtCadastro: TDateTimeField;
    ADOQryRelDadosDsAtivo: TStringField;
    ADOQryRelDadosDsPublicoPrivado: TStringField;
    ADOQryRelDadosExcluir: TStringField;
    ADOQryRelDadosEndereo: TStringField;
    ADOQryRelDadosComplemento: TStringField;
    ADOQryRelDadosBairro: TStringField;
    ADOQryRelDadosCidade: TStringField;
    ADOQryRelDadosCEP: TStringField;
    ADOQryRelDadosEstado: TStringField;
    QRExpr8: TQRExpr;
    QRLabel13: TQRLabel;
    ADOQryRelDadosNRNUMERO: TStringField;
    QRGroup1: TQRGroup;
    ADOQryRelDadosdsMemo: TStringField;
    qrlblCEP: TQRLabel;
    qrxprCEP: TQRExpr;
    qrlblA1: TQRLabel;
    qrlblAVendedor: TQRLabel;
    ADOQryRelDadoscdPessoa_1: TIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QRExpr6Print(sender: TObject; var Value: String);
    procedure QRExpr2Print(sender: TObject; var Value: String);
    procedure QRExpr1Print(sender: TObject; var Value: string);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelCliente: TFrmRelCliente;

implementation

uses CdCliente, DataModulo;

{$R *.DFM}

procedure TFrmRelCliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FrmCdCliente.BtnMdImprimir.Enabled := True;
end;

procedure TFrmRelCliente.QRExpr6Print(sender: TObject; var Value: String);
begin
  inherited;
  // Monta Telefones
  QRLblTelefone.Caption := '';
  // Localiza Telefone
  With AdoQryLocaliza do
  begin
    Sql.Text := 'Select T.NmTelefone as Fone, T.dsRamal From Telefone T WITH (NOLOCK) '+
                'Where T.cdPessoa = :CODIGO ';
    Parameters.parambyname('CODIGO').Value := AdoQryRelDados.fieldbyName('código').AsInteger;
    Open;
  end;  // with QryTelefone
  While not AdoQryLocaliza.Eof do
  begin
    if QRLblTelefone.Caption = '' then
      QRLblTelefone.Caption := AdoQryLocaliza.FieldByName('Fone').AsString
    else
      QRLblTelefone.Caption := QRLblTelefone.Caption + ' * ' + AdoQryLocaliza.FieldByName('Fone').AsString;
    AdoQryLocaliza.Next;
  end;
  // Monta Data Nascimento
//  if frmCdCliente.RgPessoa.ItemIndex = 1 then // Pessoa Física
//    QRLbldtNascimento.Caption := AdoQryRelDados.FieldByName('dtNascimento').AsString;
end;

procedure TFrmRelCliente.QRExpr1Print(sender: TObject; var Value: string);
var
  qry : TADOQuery;
begin
  inherited;
  qry := TADOQuery.Create(nil);
  With qry do
  begin
    Connection := DModulo.Conexao;
    Sql.Text := 'select P.nmPessoa From Pessoa P with (nolock) '+
                'Inner Join Cliente C with (nolock)            '+
                'On P.cdPessoa = C.cdPessoa_1                  '+
                'Where C.cdPessoa = :CODIGO                    ';
    Parameters.parambyname('CODIGO').Value := AdoQryRelDados.fieldbyName('código').AsInteger;
    Open;
    qrlblAVendedor.Caption := qry.FieldByName('nmPessoa').AsString;
  end;
end;

procedure TFrmRelCliente.QRExpr2Print(sender: TObject; var Value: String);
begin
  inherited;
  with AdoQryCnpIe do
  begin
    if AdoQryRelDados.FieldByName('Existir').AsString = 'F' then
      Sql.Text := 'Select dsCpf,dsIdentidade from P_Fisica F WITH (NOLOCK)'
    else
      Sql.Text := 'Select CGC,dsInscricaoEstadual from P_Juridica F WITH (NOLOCK)';
    Sql.Add(', Pessoa P Where F.cdPessoa = P.cdPessoa and P.cdPessoa = :CODIGO ');
    Parameters.parambyname('CODIGO').Value := AdoQryRelDados.fieldbyName('código').AsInteger;
    Open;
    if AdoQryRelDados.FieldByName('Existir').AsString = 'F' then
    begin
      if Length(AdoQryCnpIe.fieldbyName('dsCpf').AsString) > 0 then
        QRLblCnjCpf.Caption := AdoQryCnpIe.fieldbyName('dsCpf').AsString
      else
        QRLblCnjCpf.Caption := '';
      if Length(AdoQryCnpIe.fieldbyName('dsIdentidade').AsString) > 0 then
        QRLblIERG.Caption   := AdoQryCnpIe.fieldbyName('dsIdentidade').AsString
      else
        QRLblIERG.Caption   := '';
    end else
    begin
      if Length(AdoQryCnpIe.fieldbyName('CGC').AsString) > 0 then
        QRLblCnjCpf.Caption := AdoQryCnpIe.fieldbyName('CGC').AsString
      else
        QRLblCnjCpf.Caption := '';
      if Length(AdoQryCnpIe.fieldbyName('dsInscricaoEstadual').AsString) > 0 then
        QRLblIERG.Caption   := AdoQryCnpIe.fieldbyName('dsInscricaoEstadual').AsString
      else
        QRLblIERG.Caption   := '';
    end;
  end;
end;

end.
