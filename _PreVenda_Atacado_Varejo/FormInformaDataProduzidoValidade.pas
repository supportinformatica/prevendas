unit FormInformaDataProduzidoValidade;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls;

type
  TFrmDataProduzidoValidade = class(TForm)
    DtProduzido: TDateTimePicker;
    LblDateProduzido: TLabel;
    DtValidade: TDateTimePicker;
    LblDateValidade: TLabel;
    BtnConfirmar: TButton;
    procedure BtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmDataProduzidoValidade: TFrmDataProduzidoValidade;

implementation

{$R *.dfm}

procedure TFrmDataProduzidoValidade.BtnConfirmarClick(Sender: TObject);
begin
  FrmDataProduzidoValidade.Close;
end;

end.
