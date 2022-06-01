unit Sobre;

interface

uses Windows, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, jpeg, sysutils;

type
  TfrmSobre = class(TForm)
    Image1: TImage;
    Label5: TLabel;
    Label7: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    LblData: TLabel;
    Procedure Configura;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSobre: TfrmSobre;

implementation

uses uFuncoesPadrao;


{$R *.DFM}

procedure TFrmSobre.Configura;
begin
 BorderStyle := bsnone;
// Panel1.BorderWidth := 3;
 Update;
 Show;
// sleep(2500);
end;

procedure TfrmSobre.BitBtn1Click(Sender: TObject);
begin
 Close;
 frmSobre.Free;
end;

procedure TfrmSobre.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := CaFree;
end;

procedure TfrmSobre.FormCreate(Sender: TObject);
begin
  LblData.Caption := DateTimeToStr(PegaDataDoExecutavel(ExtractFileName(Application.ExeName)));
end;

end.

