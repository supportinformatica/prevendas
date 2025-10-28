unit FrmConsultaEspecificacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Grids, Menus;

type
  TFrmEspecificacao = class(TForm)
    Bevel1: TBevel;
    Memo1: TMemo;
    Label57: TLabel;
    Label58: TLabel;
    Label64: TLabel;
    LblProduto: TLabel;
    LblReferencia: TLabel;
    Label59: TLabel;
    Label62: TLabel;
    LblFab: TLabel;
    LblCdBarras: TLabel;
    LblRefer: TLabel;
    LblCod: TLabel;
    Label10: TLabel;
    btnNext: TBitBtn;
    btnPrior: TBitBtn;
    Image1: TImage;
    Label69: TLabel;
    SgCodigos: TStringGrid;
    BtnMdProximo: TBitBtn;
    BtnMdAnterior: TBitBtn;
    Label1: TLabel;
    LblAtacado: TLabel;
    Label3: TLabel;
    lblVarejo: TLabel;
    PopupMenu1: TPopupMenu;
    Ampliar1: TMenuItem;
    Voltar1: TMenuItem;
    Label2: TLabel;
    Label4: TLabel;
    Bevel2: TBevel;
    Label5: TLabel;
    LblClFiscal: TLabel;
    Label6: TLabel;
    lblAquisicao: TLabel;
    Label60: TLabel;
    LblRefInterna: TLabel;
    Label7: TLabel;
    lblQtdFiscal: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    lblMinimo: TLabel;
    lblMaximo: TLabel;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Memo1KeyPress(Sender: TObject; var Key: Char);
    procedure FotoKeyPress(Sender: TObject; var Key: Char);
    procedure btnNextClick(Sender: TObject);
    procedure btnPriorClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnMdProximoClick(Sender: TObject);
    procedure BtnMdAnteriorClick(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Ampliar1Click(Sender: TObject);
    procedure Voltar1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Image1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private

  public

  end;

var
  FrmEspecificacao: TFrmEspecificacao;

implementation

uses MoPreVenda, FrmPrincipal, imagemAmpliadaProduto;

{$R *.DFM}

procedure TFrmEspecificacao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = Char(27)then
    Close;
end;

procedure TFrmEspecificacao.FormShow(Sender: TObject);
begin
  if (UpperCase( vEmpresa ) <> 'SANTANA') then
  begin
    lblAquisicao.Visible := false;
    Label6.Visible := false;
  end;
end;

procedure TFrmEspecificacao.Memo1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = Char(27) then
    Close;
end;

procedure TFrmEspecificacao.FotoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = Char(27) then
    Close;
end;

procedure TFrmEspecificacao.btnNextClick(Sender: TObject);
begin
  with FrmPrincipalPreVenda do
  begin
    BtnMdProximo.Click;
    FrmEspecificacao.Close;
    ConsultaEspecificacao1.Click;
  end;
end;

procedure TFrmEspecificacao.btnPriorClick(Sender: TObject);
begin
  with FrmPrincipalPreVenda do
  begin
    BtnMdAnterior.Click;
    FrmEspecificacao.Close;
    ConsultaEspecificacao1.Click;
  end
end;

procedure TFrmEspecificacao.FormCreate(Sender: TObject);
begin
  with SgCodigos do
  begin
    Cells[0,0] := 'Código 1';
    Cells[1,0] := 'Código 2';
    Cells[2,0] := 'Código 3';
    Cells[3,0] := 'Código 4';
    Cells[4,0] := 'Código 5';
    Cells[5,0] := 'Código 6';
    Cells[6,0] := 'Código 7';
  end; 
end;

procedure TFrmEspecificacao.BtnMdProximoClick(Sender: TObject);
begin
  with FrmPrincipalPreVenda do
  begin
    BtnMdProximo.Click;
    FrmEspecificacao.Close;
    ConsultaEspecificacao1.Click;
  end;
end;

procedure TFrmEspecificacao.BtnMdAnteriorClick(Sender: TObject);
begin
  with FrmPrincipalPreVenda do
  begin
    BtnMdAnterior.Click;
    FrmEspecificacao.Close;
    ConsultaEspecificacao1.Click;
  end;
end;


procedure TFrmEspecificacao.Image1Click(Sender: TObject);
begin
  if Image1.Picture <> nil then
  begin
    FrmImagemProduto := TFrmImagemProduto.Create(Application);
    FrmImagemProduto.Image1.Picture := Image1.Picture;
    FrmImagemProduto.ShowModal;
  end;
end;

procedure TFrmEspecificacao.Image1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
i: integer;
begin
{  for i:=1 to 2 do begin
    Image1.Left   := Image1.Left - 80;
    Image1.top    := Image1.top - 50;
    Image1.Width  := Image1.Width + 80;
    Image1.height := Image1.height + 130;
  end;
  memo1.Visible :=false;
  SgCodigos.Visible :=false;
  label64.Visible   :=false;
  label60.Visible   :=false;
  LblReferencia.Visible :=false;
  label59.Visible  :=false;
  label62.Visible  :=false;
  LblProduto.Visible :=false;
  LblCod.Visible   :=false;
  LblRefer.Visible :=false;
  LblCdBarras.Visible :=false;
  LblFab.Visible :=false;
  label3.Visible :=false;
  label1.Visible :=false;
  lblVarejo.Visible  :=false;
  LblAtacado.visible :=false;
  label69.Visible :=false;
  label58.Visible :=false;
  label57.Visible :=false; }
end;

procedure TFrmEspecificacao.Ampliar1Click(Sender: TObject);
var
i: integer;
begin
  for i:=1 to 2 do
  begin
    Image1.Left:=Image1.Left -80;
    Image1.top:=Image1.top -50;
    Image1.Width:=Image1.Width + 80;
    Image1.height:=Image1.height + 130;
  end;
  memo1.Visible:=false;
  SgCodigos.Visible:=false;
  label64.Visible:=false;
  label60.Visible:=false;
  LblReferencia.Visible:=false;
  label59.Visible:=false;
  label62.Visible:=false;
  LblProduto.Visible:=false;
  label6.Visible:=false;
  lblAquisicao.Visible:=false;
  LblCod.Visible:=false;
  LblRefInterna.Visible:=false;
  LblRefer.Visible:=false;
  LblCdBarras.Visible:=false;
  LblFab.Visible:=false;
  label3.Visible:=false;
  label1.Visible:=false;
  lblVarejo.Visible:=false;
  LblAtacado.visible:=false;
  label69.Visible:=false;
  label58.Visible:=false;
  label57.Visible:=false;
  btnPrior.Visible:=false;
  btnNext.Visible:=false;
  label10.Visible:=false;
  Label5.Visible:=False;
  LblClFiscal.Visible:=False;
end;

procedure TFrmEspecificacao.Voltar1Click(Sender: TObject);
Begin
   Image1.Left:=405;
   Image1.top:=15;
   Image1.Width:=212;
   Image1.height:=169;
   memo1.Visible:=true;
   SgCodigos.Visible:=true;
   label64.Visible:=true;
   label60.Visible:=true;
   LblReferencia.Visible:=true;
   label59.Visible:=true;
   label62.Visible:=true;
   LblProduto.Visible:=true;
   if (UpperCase( vEmpresa ) = 'SANTANA') then
   begin
     lblAquisicao.Visible := true;
     Label6.Visible := true;
   end;
   LblCod.Visible:=true;
   LblRefInterna.Visible:=true;
   LblRefer.Visible:=true;
   LblCdBarras.Visible:=true;
   LblFab.Visible:=true;
   label3.Visible:=true;
   label1.Visible:=true;
   lblVarejo.Visible:=true;
   LblAtacado.visible:=true;
   label69.Visible:=true;
   label58.Visible:=true;
   label57.Visible:=true;
   btnPrior.Visible:=true;
   btnNext.Visible:=true;
   label10.Visible:=true;
   Label5.Visible:=True;
   LblClFiscal.Visible:=True;
end;

procedure TFrmEspecificacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Application.OnMessage := FormPrincipal.ProcessaMsg;
end;

end.
