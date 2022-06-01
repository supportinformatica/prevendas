unit FrmQuatroEtiquetas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, Vcl.Buttons;

type
  TFormQuatroEtiquetas = class(TForm)
    btnUnicaGrande: TBitBtn;
    BtnDuplaGrande: TBitBtn;
    BtnTriplaGrande: TBitBtn;
    PopupMenu1: TPopupMenu;
    Gndolagrande1: TMenuItem;
    _BtnGondolaPequena: TMenuItem;
    btn: TMenuItem;
    btnTriplaPequena: TBitBtn;
    riplaPequena1: TMenuItem;
    procedure btnUnicaGrandeClick(Sender: TObject);
    procedure BtnDuplaGrandeClick(Sender: TObject);
    procedure BtnTriplaGrandeClick(Sender: TObject);
    procedure btnTriplaPequenaClick(Sender: TObject);
    procedure Gndolagrande1Click(Sender: TObject);
    procedure _BtnGondolaPequenaClick(Sender: TObject);
    procedure btnClick(Sender: TObject);
    procedure riplaPequena1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormQuatroEtiquetas: TFormQuatroEtiquetas;

implementation

{$R *.dfm}

procedure TFormQuatroEtiquetas.btnClick(Sender: TObject);
begin
  BtnTriplaGrandeClick(Self);
end;

procedure TFormQuatroEtiquetas.BtnDuplaGrandeClick(Sender: TObject);
begin
 //
end;

procedure TFormQuatroEtiquetas.BtnTriplaGrandeClick(Sender: TObject);
begin
 //
end;

procedure TFormQuatroEtiquetas.btnTriplaPequenaClick(Sender: TObject);
begin
 //
end;

procedure TFormQuatroEtiquetas.btnUnicaGrandeClick(Sender: TObject);
begin
  //
end;

procedure TFormQuatroEtiquetas.Gndolagrande1Click(Sender: TObject);
begin
  btnUnicaGrandeClick(Self);
end;

procedure TFormQuatroEtiquetas.riplaPequena1Click(Sender: TObject);
begin
  btnTriplaPequenaClick(Self);
end;

procedure TFormQuatroEtiquetas._BtnGondolaPequenaClick(Sender: TObject);
begin
  BtnDuplaGrandeClick(Self);
end;

end.
