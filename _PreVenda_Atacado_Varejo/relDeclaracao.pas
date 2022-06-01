unit relDeclaracao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, RLReport;

type
  TfrmRelDeclaracao = class(TForm)
    RLReport1: TRLReport;
    ADOQryConfig: TADOQuery;
    ADOQryRelDados: TADOQuery;
    ADOQryConfigdsMenPromocional: TStringField;
    ADOQryConfignmEmpresa: TStringField;
    ADOQryConfigdsPrazoOrcamento: TStringField;
    ADOQryConfigdsEndereco: TStringField;
    ADOQryConfigdsTelefone: TStringField;
    ADOQryConfigdsFax: TStringField;
    ADOQryConfigdsCgc: TStringField;
    ADOQryConfigdsInscricao: TStringField;
    ADOQryConfigdsCidade: TStringField;
    dsConfig: TDataSource;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    RLLabel10: TRLLabel;
    RLLabel11: TRLLabel;
    RLLabel12: TRLLabel;
    RLLabel13: TRLLabel;
    RLLabel14: TRLLabel;
    RLLabel15: TRLLabel;
    RLLabel16: TRLLabel;
    RLLabel17: TRLLabel;
    RLLabel18: TRLLabel;
    RLLabel19: TRLLabel;
    RLLabel20: TRLLabel;
    RLLabel21: TRLLabel;
    RLLabel22: TRLLabel;
    RLLabel23: TRLLabel;
    RLLabel24: TRLLabel;
    RLLabel25: TRLLabel;
    RLLabel26: TRLLabel;
    RLLabel27: TRLLabel;
    RLLabel28: TRLLabel;
    RLLabel29: TRLLabel;
    RLLabel30: TRLLabel;
    RLLabel31: TRLLabel;
    RLLabel32: TRLLabel;
    RLLabel33: TRLLabel;
    RLLabel34: TRLLabel;
    RLDraw1: TRLDraw;
    RLDraw2: TRLDraw;
    RLDraw3: TRLDraw;
    RLDraw4: TRLDraw;
    RLDraw5: TRLDraw;
    RLDraw6: TRLDraw;
    RLDraw7: TRLDraw;
    RLDraw8: TRLDraw;
    RLDraw9: TRLDraw;
    RLDraw10: TRLDraw;
    RLDraw11: TRLDraw;
    RLDraw12: TRLDraw;
    RLDraw13: TRLDraw;
    RlData2: TRLLabel;
    RlCupom: TRLLabel;
    RLECF: TRLLabel;
    RlSerie: TRLLabel;
    RLNota: TRLLabel;
    RlData1: TRLLabel;
    RLNome: TRLLabel;
    RLEndereco: TRLLabel;
    RlBairro: TRLLabel;
    RlCidade: TRLLabel;
    RlFone: TRLLabel;
    RLCEP: TRLLabel;
    RlRG: TRLLabel;
    RLCNPJ: TRLLabel;
    Rldia: TRLLabel;
    RlMes: TRLLabel;
    RlAno: TRLLabel;
    RLLabel38: TRLLabel;
    RLLabel35: TRLLabel;
    RLLabel36: TRLLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelDeclaracao: TfrmRelDeclaracao;

implementation

{$R *.dfm}

end.
