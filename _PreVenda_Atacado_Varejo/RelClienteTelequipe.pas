unit RelClienteTelequipe;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RelModelo, Db,  Qrctrls, QuickRpt, ExtCtrls, ADODB;

type
  TFrmRelClienteTelequipe = class(TFrmMdRel)
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
    ADOQryRelDadosdsMemo: TMemoField;
    ADOQryRelDadosDsPublicoPrivado: TStringField;
    ADOQryRelDadosExcluir: TStringField;
    ADOQryRelDadosEndereo: TStringField;
    ADOQryRelDadosComplemento: TStringField;
    ADOQryRelDadosBairro: TStringField;
    ADOQryRelDadosCidade: TStringField;
    ADOQryRelDadosCEP: TStringField;
    ADOQryRelDadosEstado: TStringField;
    ADOQryRelDadosdsContrato: TStringField;
    ADOQryRelDadosdtInicio: TDateTimeField;
    ADOQryRelDadosdtFim: TDateTimeField;
    ADOQryRelDadosnrVisitas: TIntegerField;
    ADOQryRelDadostpStatus: TIntegerField;
    ADOQryRelDadosdsEquipamentos: TStringField;
    ADOQryRelDadosnrRamais: TIntegerField;
    ADOQryRelDadosdsOutros: TStringField;
    ADOQryRelDadoscdTecnico: TIntegerField;
    ADOQryRelDadosnrObjeto: TIntegerField;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRExpr10: TQRExpr;
    QRExpr11: TQRExpr;
    QRExpr12: TQRExpr;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QRExpr6Print(sender: TObject; var Value: String);
    procedure QRExpr2Print(sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelClienteTelequipe: TFrmRelClienteTelequipe;

implementation

uses CdCliente, DataModulo;

{$R *.DFM}

procedure TFrmRelClienteTelequipe.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FrmCdCliente.BtnMdImprimir.Enabled := True;
end;

procedure TFrmRelClienteTelequipe.QRExpr6Print(sender: TObject; var Value: String);
begin
  inherited;
  // Monta Telefones
  QRLblTelefone.Caption := '';
  // Localiza Telefone
  With AdoQryLocaliza do begin
    Sql.Clear;
    Sql.Add('Select T.NmTelefone as Fone,T.dsRamal From Telefone T ');
    Sql.Add('Where T.cdPessoa = :CODIGO ');
    Parameters.ParamByName('CODIGO').Value := AdoQryRelDados.fieldbyName('código').AsInteger;
    Open;
  end;  // with QryTelefone
  While not AdoQryLocaliza.Eof do
  begin
    if QRLblTelefone.Caption = '' then
       QRLblTelefone.Caption := AdoQryLocaliza.FieldByName('Fone').AsString
    else
       QRLblTelefone.Caption := QRLblTelefone.Caption + ' * ' +
         AdoQryLocaliza.FieldByName('Fone').AsString;
    AdoQryLocaliza.Next;
  end;
  // Monta Data Nascimento
  if frmCdCliente.RgPessoa.ItemIndex = 1 then // Pessoa Física
     QRLbldtNascimento.Caption := AdoQryRelDados.FieldByName('Data_Nascimento').AsString;
end;

procedure TFrmRelClienteTelequipe.QRExpr2Print(Sender: TObject; var Value: String);
begin
  inherited;
  with AdoQryCnpIe do
  begin
    Sql.clear;
    if AdoQryRelDados.FieldByName('Existir').AsString = 'F' then
      Sql.Add('Select dsCpf,dsIdentidade from P_Fisica F ')
    else
      Sql.Add('Select CGC,dsInscricaoEstadual from P_Juridica F ');
    Sql.Add(', Pessoa P Where F.cdPessoa = P.cdPessoa ');
    Sql.Add('and P.cdPessoa = :CODIGO ');
    Parameters.parambyname('CODIGO').Value := AdoQryRelDados.fieldbyName('código').AsInteger;
    Open;
    if AdoQryRelDados.FieldByName('Existir').AsString = 'F' then
    begin
      if Length(AdoQryCnpIe.fieldbyName('dsCpf').AsString) > 0 then
        QRLblCnjCpf.Caption := AdoQryCnpIe.fieldbyName('dsCpf').AsString
        else QRLblCnjCpf.Caption := '';
      if Length(AdoQryCnpIe.fieldbyName('dsIdentidade').AsString) > 0 then
        QRLblIERG.Caption   := AdoQryCnpIe.fieldbyName('dsIdentidade').AsString
        else QRLblIERG.Caption   := '';
    end else
    begin
      if Length(AdoQryCnpIe.fieldbyName('CGC').AsString) > 0 then
         QRLblCnjCpf.Caption := AdoQryCnpIe.fieldbyName('CGC').AsString
         else
           QRLblCnjCpf.Caption := '';
      if Length(AdoQryCnpIe.fieldbyName('dsInscricaoEstadual').AsString) > 0 then
         QRLblIERG.Caption   := AdoQryCnpIe.fieldbyName('dsInscricaoEstadual').AsString
         else QRLblIERG.Caption   := '';
    end;
  end;
end;

end.
