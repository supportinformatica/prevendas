unit Prevenda.Utils.VerifyTagList;

interface

uses
  System.SysUtils,

  Vcl.Dialogs;

type
  TVerifyTagList = class
    private
    public
      procedure VerifyTagList;
  end;

implementation

uses
  MoPrevenda;

{ TVerifyTagList }

procedure TVerifyTagList.VerifyTagList;

begin

  if FrmPrincipalPreVenda.SgDados.Cells[0, 1] = '' then begin
    MessageDlg('Não foi lançado nenhum item para impressão das etiquetas!',
      mtWarning, [mbOK], 0);

    FrmPrincipalPreVenda.EdtConsulta.Setfocus;

    abort;
  end;

end;

end.
