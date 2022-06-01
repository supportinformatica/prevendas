unit Informacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Vcl.Menus;

type
  TFrmInfo = class(TForm)
    Label1: TLabel;
    lblCodigo: TLabel;
    lblFaltam: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lblQtd: TLabel;
    Label4: TLabel;
    mmInfo: TMemo;
    PopupMenu1: TPopupMenu;
    Cancelar1: TMenuItem;
    procedure Cancelar1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmInfo: TFrmInfo;

implementation

uses MoPreVenda;

{$R *.dfm}


procedure TFrmInfo.Cancelar1Click(Sender: TObject);
begin
  FrmPrincipalPreVenda.SgDados.SetFocus;
  close;
end;

end.
