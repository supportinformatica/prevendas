unit Pergunta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TFrmPergunta = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPergunta: TFrmPergunta;

implementation

{$R *.dfm}

procedure TFrmPergunta.Button1Click(Sender: TObject);
begin
  Close;
end;

end.
