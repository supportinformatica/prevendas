unit FrmTresEtiquetasViva;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Menus;

type
  TFormTresEtiquetasViva = class(TForm)
    BtnGondolaGrande: TBitBtn;
    BtnGondolaPequena: TBitBtn;
    Btn3Colunas: TBitBtn;
    PopupMenu1: TPopupMenu;
    Gndolagrande1: TMenuItem;
    _BtnGondolaPequena: TMenuItem;
    btn: TMenuItem;
    procedure btnClick(Sender: TObject);
    procedure BtnGondolaGrandeClick(Sender: TObject);
    procedure BtnGondolaPequenaClick(Sender: TObject);
    procedure Btn3ColunasClick(Sender: TObject);
    procedure Gndolagrande1Click(Sender: TObject);
    procedure _BtnGondolaPequenaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormTresEtiquetasViva: TFormTresEtiquetasViva;

implementation

{$R *.dfm}

procedure TFormTresEtiquetasViva.Btn3ColunasClick(Sender: TObject);
begin
//
end;

procedure TFormTresEtiquetasViva.btnClick(Sender: TObject);
begin
  Btn3ColunasClick(self);
end;

procedure TFormTresEtiquetasViva.BtnGondolaGrandeClick(Sender: TObject);
begin
//
end;

procedure TFormTresEtiquetasViva.BtnGondolaPequenaClick(Sender: TObject);
begin
//
end;

procedure TFormTresEtiquetasViva.Gndolagrande1Click(Sender: TObject);
begin
  BtnGondolaGrandeClick(self);
end;

procedure TFormTresEtiquetasViva._BtnGondolaPequenaClick(Sender: TObject);
begin
  BtnGondolaPequenaClick(self);
end;

end.
