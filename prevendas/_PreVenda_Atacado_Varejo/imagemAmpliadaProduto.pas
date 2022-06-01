unit imagemAmpliadaProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls;

type
  TFrmImagemProduto = class(TForm)
    Image1: TImage;
    procedure Image1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmImagemProduto: TFrmImagemProduto;

implementation

{$R *.dfm}

procedure TFrmImagemProduto.Image1Click(Sender: TObject);
begin
  Close;
end;

end.
