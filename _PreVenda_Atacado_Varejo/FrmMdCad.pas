unit FrmMdCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, Db, DBTables;

type
  TFrmMdCadastro = class(TForm)
    PnlMoBotoes: TPanel;
    BtnMdNovo: TBitBtn;
    BtnMdSalvar: TBitBtn;
    BtnMdAlterar: TBitBtn;
    BtnMdExcluir: TBitBtn;
    BtnMdPrimeiro: TBitBtn;
    BtnMdProximo: TBitBtn;
    BtnMdAnterior: TBitBtn;
    BtnMdUltimo: TBitBtn;
    BtnMdImprimir: TBitBtn;
    BtnMdSair: TBitBtn;
    PgCtrolMoCadastroCons: TPageControl;
    TBSheetMdCadastroConsulta: TTabSheet;
    TBSheetMdCadastroDados: TTabSheet;
    DBGrid1: TDBGrid;
    PnlMdConsulta: TPanel;
    CmbItensConsulta: TComboBox;
    EdtConsulta: TEdit;
    DsConsulta: TDataSource;
    QryConsulta: TQuery;
    TBSheetMdCdRelatorio: TTabSheet;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMdCadastro: TFrmMdCadastro;

implementation

{$R *.DFM}

procedure TFrmMdCadastro.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := Cafree;
end;

end.
