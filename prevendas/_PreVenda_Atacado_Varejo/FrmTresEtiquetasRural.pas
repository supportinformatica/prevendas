unit FrmTresEtiquetasRural;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, Vcl.Buttons;

type
  TFormTresEtiquetasRural = class(TForm)
    btn1: TBitBtn;
    btn2: TBitBtn;
    btn3: TBitBtn;
    PopupMenu1: TPopupMenu;
    Gndolagrande1: TMenuItem;
    _BtnGondolaPequena: TMenuItem;
    btn: TMenuItem;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure Gndolagrande1Click(Sender: TObject);
    procedure btnClick(Sender: TObject);
    procedure _BtnGondolaPequenaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormTresEtiquetasRural: TFormTresEtiquetasRural;

implementation

{$R *.dfm}

procedure TFormTresEtiquetasRural.btn3Click(Sender: TObject);
begin
//
end;

procedure TFormTresEtiquetasRural.btnClick(Sender: TObject);
begin
  btn3Click(Self);
end;

procedure TFormTresEtiquetasRural.btn1Click(Sender: TObject);
begin
//
end;

procedure TFormTresEtiquetasRural.btn2Click(Sender: TObject);
begin
//
end;

procedure TFormTresEtiquetasRural.Gndolagrande1Click(Sender: TObject);
begin
  btn1Click(Self);
end;

procedure TFormTresEtiquetasRural._BtnGondolaPequenaClick(Sender: TObject);
begin
  btn2Click(Self);
end;

end.
