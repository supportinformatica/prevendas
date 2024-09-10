unit AlteraDescricao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Vcl.ExtCtrls, Vcl.Menus;

type
  TFrmDescricao = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Panel1: TPanel;
    Label1: TLabel;
    EdtDescricao: TEdit;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    btnDiv: TSpeedButton;
    btnMult: TSpeedButton;
    EdtUnidade: TEdit;
    EdtQtd: TEdit;
    EdtFator: TEdit;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    EdtQtdSai: TEdit;
    EdtUndCad: TEdit;
    pm1: TPopupMenu;
    Confirmar1: TMenuItem;
    Cancelar1: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtFatorExit(Sender: TObject);
    procedure btnMultClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure EdtQtdSaiExit(Sender: TObject);
    procedure btnDivClick(Sender: TObject);
    procedure Confirmar1Click(Sender: TObject);
    procedure Cancelar1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmDescricao: TFrmDescricao;

implementation

uses MoPreVenda;

{$R *.dfm}

procedure TFrmDescricao.FormShow(Sender: TObject);
begin
  Application.OnMessage := FrmPrincipalPreVenda.NaoProcessaMsg;
  EdtDescricao.SelectAll;
  EdtDescricao.SetFocus;
end;

procedure TFrmDescricao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Application.OnMessage := FrmPrincipalPreVenda.ProcessaMsg;
end;

procedure TFrmDescricao.Button1Click(Sender: TObject);
begin
  FrmPrincipalPreVenda.vDescricaoGama := EdtDescricao.Text;
  FrmPrincipalPreVenda.vUndGama := EdtUnidade.Text;
  if btnMult.Down then
     FrmPrincipalPreVenda.vFatorGama := strToFloat(EdtFator.Text)
  else
     FrmPrincipalPreVenda.vFatorGama := 1 / strToFloat(EdtFator.Text);
  close;
end;

procedure TFrmDescricao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    Keybd_event (VK_TAB,0,0,0);
  end;
end;

procedure TFrmDescricao.EdtFatorExit(Sender: TObject);
var
  quantidade, quantidade_saida, fator : real;
begin
  quantidade := strToFloatDef(EdtQtd.Text,0);
  EdtQtd.Text := FormatFloat('0.00000', quantidade);
  fator := strToFloatDef(EdtFator.Text,0);
  EdtFator.Text := FormatFloat('0.00000', fator);
  FrmPrincipalPreVenda.EdtQtd.Text := EdtQtd.Text;
  if btnMult.Down then
    quantidade_saida := quantidade * fator
  else
    quantidade_saida := quantidade / fator;
  EdtQtdSai.Text := FormatFloat('0.00000', quantidade_saida);
end;

procedure TFrmDescricao.btnMultClick(Sender: TObject);
begin
  EdtQtd.Text := FormatFloat('0.00000', StrToFloatDef(EdtQtd.Text,0));
  EdtQtdSai.Text := EdtQtd.Text;
  EdtFator.Text := '1,00000';
end;

procedure TFrmDescricao.Button2Click(Sender: TObject);
begin
  close;
end;

procedure TFrmDescricao.Cancelar1Click(Sender: TObject);
begin
  Button2.Click;
end;

procedure TFrmDescricao.Confirmar1Click(Sender: TObject);
begin
  Button1.Click;
end;

procedure TFrmDescricao.EdtQtdSaiExit(Sender: TObject);
var
  quantidade_saida, quantidade, fator: real;
begin
  quantidade_saida := StrToFloatDef(EdtQtdSai.Text,0);
  EdtQtdSai.Text := FormatFloat('0.00000', quantidade_saida);
  quantidade := StrToFloatDef(EdtQtd.Text,0);
  if btnMult.Down then
  begin
    try
      fator := quantidade_saida / quantidade;
      edtFator.Text := FormatFloat('0.00000', fator);
    except
      messagedlg('A quantidade não pode ser igual a zero', mtWarning, [mbOk], 0);
      btnMultClick(btnMult);
    end;
  end else
  begin
    try
      fator := quantidade / quantidade_saida;
      edtFator.Text := FormatFloat('0.00000', fator);
    except
      messagedlg('A quantidade de saída do estoque não pode ser igual a zero', mtWarning, [mbOk], 0);
      btnDivClick(btnMult);
    end;
  end;
end;

procedure TFrmDescricao.btnDivClick(Sender: TObject);
begin
  EdtQtd.Text := FormatFloat('0.00000', StrToFloatDef(EdtQtd.Text,0));
  EdtQtdSai.Text := EdtQtd.Text;
  EdtFator.Text := '1,00000';
end;

end.
