unit Inf_Cliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TFrmInf_Cliente = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    LblNome: TLabel;
    LblRua: TLabel;
    LblNumero: TLabel;
    LblBairro: TLabel;
    LblUF: TLabel;
    LblCidade: TLabel;
    LblTelefone: TLabel;
    Lblcpl: TLabel;
    LblComplemento: TLabel;
    Label9: TLabel;
    LblCEP: TLabel;
    Label10: TLabel;
    LblEmail: TLabel;
    LblcdPessoa: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    vlinha : integer;
    Thread_End : Boolean;
    procedure Carrega_Dados;
    { Public declarations }
  end;

var
  FrmInf_Cliente: TFrmInf_Cliente;

implementation

uses CdCliente, FrmCadEstados, MaskUtils, uFuncoesPadrao,
  Thread_Comando_Sql;

{$R *.dfm}

procedure TFrmInf_Cliente.Carrega_Dados;
var
  ThreadConexao : TComando_SQL;
begin
  LblcdPessoa.Caption := FrmCdCliente.DBGrid1.Fields[0].AsString;
  LblNome.Caption := FrmCdCliente.DBGrid1.Fields[1].AsString;
  LblRua.Caption := FrmCdCliente.DBGrid1.Fields[4].AsString;
  LblNumero.Caption := FrmCdCliente.DBGrid1.Fields[20].AsString;
  LblBairro.Caption := FrmCdCliente.DBGrid1.Fields[5].AsString;
  LblUF.Caption := FrmCdCliente.DBGrid1.Fields[18].AsString;
  LblCidade.Caption := FrmCdCliente.DBGrid1.Fields[6].AsString;
  LblTelefone.Caption := 'Pesquisando...';
  LblComplemento.Caption := FrmCdCliente.DBGrid1.Fields[16].AsString;
  LblCEP.Caption := FrmCdCliente.DBGrid1.Fields[17].AsString;
  LblEmail.Caption := FrmCdCliente.DBGrid1.Fields[7].AsString;
  if vLinha = -2 then begin
    vLinha := 99;
    FrmInf_Cliente.Thread_End := True;
  end;
  if (LblcdPessoa.Caption <> '') and (FrmInf_Cliente.Thread_End = True) then begin
    ThreadConexao := nil;
    ThreadConexao := TComando_SQL.Create(True);
    ThreadConexao.ComandoSQL := 'Select top 1 isnull(nmTelefone,''Indisponível'') from Telefone WITH (NOLOCK) where cdpessoa = '+QuotedStr(LblcdPessoa.Caption);
    ThreadConexao.Tela := 'FrmInf_Cliente';
    ThreadConexao.FreeOnTerminate:=True;
    ThreadConexao.Resume;
    //vlinha := FrmCdCliente.Linha;
  end;
end;

procedure TFrmInf_Cliente.FormCreate(Sender: TObject);
var
 region : hrgn;
begin
  with FrmCdCliente.ClientToScreen(Point(0,0)) do begin
    Left := X + FrmCdCliente.Width;
    Top  := (Y + (FrmCdCliente.Height - Height))-30;
  end;
  vLinha := -2;
  //region:= CreateRoundRectRgn(0, 0, width, height, 20, 20);
  //setwindowrgn(handle, region, true);
end;

procedure TFrmInf_Cliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if FrmCdCliente <> nil then FrmCdCliente.Linha := -9;
  FrmInf_Cliente := nil;
end;

procedure TFrmInf_Cliente.FormMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  //ReleaseCapture;
  //PostMessage(Handle,WM_SYSCOMMAND,$F012,0);
end;

end.
