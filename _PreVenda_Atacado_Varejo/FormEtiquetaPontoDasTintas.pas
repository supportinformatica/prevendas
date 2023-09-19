unit FormEtiquetaPontoDasTintas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Data.Win.ADODB,
  DataModulo;

type
  TFrmEtiquetaPontoDasTintas = class(TForm)
    BtnGrande: TBitBtn;
    BtnPequeno: TBitBtn;
    BitBtn1: TBitBtn;
    BtnBoletoEmAnexo: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnGrandeClick(Sender: TObject);
    procedure BtnPequenoClick(Sender: TObject);
    procedure BtnBoletoEmAnexoClick(Sender: TObject);
  private
    { Private declarations }
    procedure ImprimeEtiquetaPontoDasTintas_Grande;
    procedure ImprimeEtiquetaPontoDasTintas_Pequeno;
    procedure ImprimeEtiquetaPontoDasTintas_BoletoEmAnexo;
  public
    { Public declarations }
  end;

var
  FrmEtiquetaPontoDasTintas: TFrmEtiquetaPontoDasTintas;

implementation

uses
  MoPreVenda;

{$R *.dfm}

procedure TFrmEtiquetaPontoDasTintas.BitBtn1Click(Sender: TObject);
begin
  close;
end;

procedure TFrmEtiquetaPontoDasTintas.BtnBoletoEmAnexoClick(Sender: TObject);
begin
  ImprimeEtiquetaPontoDasTintas_BoletoEmAnexo;
  close;
end;

procedure TFrmEtiquetaPontoDasTintas.BtnGrandeClick(Sender: TObject);
begin
  ImprimeEtiquetaPontoDasTintas_Grande;
  close;
end;

procedure TFrmEtiquetaPontoDasTintas.BtnPequenoClick(Sender: TObject);
begin
  ImprimeEtiquetaPontoDasTintas_Pequeno;
  close;
end;

procedure TFrmEtiquetaPontoDasTintas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmEtiquetaPontoDasTintas.ImprimeEtiquetaPontoDasTintas_BoletoEmAnexo;
var L: integer;
    vQtd:real;
    descricao: string;
begin
  if FrmPrincipalPreVenda.SgDados.Cells[0,1] = '' then begin
    Messagedlg('Não foi lançado nenhum item para impressão das etiquetas!', mtWarning, [mbOk], 0);
    FrmPrincipalPreVenda.EdtConsulta.Setfocus;
    exit;
  end;
  FrmPrincipalPreVenda.Editor.Lines.Clear;
  for L := 1 to FrmPrincipalPreVenda.SgDados.RowCount - 1 do begin // Salvando os itens da pré-venda.
    if FrmPrincipalPreVenda.SgDados.Cells[0,L] = '' then Break;

    FrmPrincipalPreVenda.Editor.Lines.Add('c0000');
    FrmPrincipalPreVenda.Editor.Lines.Add('KI503');
    FrmPrincipalPreVenda.Editor.Lines.Add('O0220');
    FrmPrincipalPreVenda.Editor.Lines.Add('f220');
    FrmPrincipalPreVenda.Editor.Lines.Add('KW0415');
    FrmPrincipalPreVenda.Editor.Lines.Add('KI7');
    FrmPrincipalPreVenda.Editor.Lines.Add('V0');
    FrmPrincipalPreVenda.Editor.Lines.Add('L');
    FrmPrincipalPreVenda.Editor.Lines.Add('H12');
    FrmPrincipalPreVenda.Editor.Lines.Add('PC');
    FrmPrincipalPreVenda.Editor.Lines.Add('A2');
    FrmPrincipalPreVenda.Editor.Lines.Add('D11');
    FrmPrincipalPreVenda.Editor.Lines.Add('151100000540037BOLETO'); // Descricao part 1
    FrmPrincipalPreVenda.Editor.Lines.Add('151100000190026EM ANEXO'); // Descricao part 2
    FrmPrincipalPreVenda.Editor.Lines.Add('151100000550180BOLETO'); // Descricao part 1
    FrmPrincipalPreVenda.Editor.Lines.Add('151100000200169EM ANEXO'); // Descricao part 2
    FrmPrincipalPreVenda.Editor.Lines.Add('151100000550316BOLETO'); // Descricao part 1
    FrmPrincipalPreVenda.Editor.Lines.Add('151100000200305EM ANEXO'); // Descricao part 2
    FrmPrincipalPreVenda.Editor.Lines.Add('^01');
    // Cálculo para imprimir a qtd de etiquetas certo
    if Frac(StrToFloat(FrmPrincipalPreVenda.SgDados.Cells[2,L])/3) = 0.00 then
      vQtd := StrToFloat(FrmPrincipalPreVenda.SgDados.Cells[2,L])/3
    else vQtd := (StrToint(FormatFloat('0000',StrToFloat(FrmPrincipalPreVenda.SgDados.Cells[2,L]))) div 3) + 1;
    FrmPrincipalPreVenda.Editor.Lines.Add('Q'+ FormatFloat('0000',vQtd));
    FrmPrincipalPreVenda.Editor.Lines.Add('E');
  end;
  FrmPrincipalPreVenda.Editor.Lines.SaveToFile(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'etiqueta.txt')));
  WinExec(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'print2.bat')),sw_ShowNormal);
  if not FileExists(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName) +
    'Print2.bat'))) then
    ShowMessage('Não foi encontrado o arquivo Print2.bat');
  Application.OnMessage := FrmPrincipalPreVenda.ProcessaMsg;
  FrmPrincipalPreVenda.Limpar_Tela;
  FrmPrincipalPreVenda.RgOpcoes.ItemIndex := 0;
  Messagedlg('Impressão ok!', mtInformation, [mbOk], 0);
end;

procedure TFrmEtiquetaPontoDasTintas.ImprimeEtiquetaPontoDasTintas_Grande;
var L: integer;
    vQtd:real;
    qry: TAdoquery;
    tel, descricao:string;
begin
  if FrmPrincipalPreVenda.SgDados.Cells[0,1] = '' then begin
    Messagedlg('Não foi lançado nenhum item para impressão das etiquetas!', mtWarning, [mbOk], 0);
    FrmPrincipalPreVenda.EdtConsulta.Setfocus;
    exit;
  end;
  qry := TADOQuery.Create(Application);
  qry.Connection := DModulo.Conexao;
  with qry do begin
    sql.Text := 'select dsTelefone from Configuracao with(nolock) ';
    open;
    tel := FieldByName('dsTelefone').AsString;
    Close;
  end;
  FreeAndNil(qry);
//  if (Trim(EdtCdCliente.Text)<> '') and (Trim(EdtCdNome.Text) <> '') then
//    SalvaEtiquetas;
  FrmPrincipalPreVenda.Editor.Lines.Clear;
  for L := 1 to FrmPrincipalPreVenda.SgDados.RowCount - 1 do begin // Salvando os itens da pré-venda.
    if FrmPrincipalPreVenda.SgDados.Cells[0,L] = '' then Break;

    repeat
      descricao := inputbox('Descrição do produto', 'Digite a descrição do produto', FrmPrincipalPreVenda.SgDados.Cells[1,L]);
    until descricao <> '';

    FrmPrincipalPreVenda.Editor.Lines.Add('c0000');
    FrmPrincipalPreVenda.Editor.Lines.Add('KI503');
    FrmPrincipalPreVenda.Editor.Lines.Add('O0220');
    FrmPrincipalPreVenda.Editor.Lines.Add('f220');
    FrmPrincipalPreVenda.Editor.Lines.Add('KW0417');
    FrmPrincipalPreVenda.Editor.Lines.Add('KI7');
    FrmPrincipalPreVenda.Editor.Lines.Add('V0');
    FrmPrincipalPreVenda.Editor.Lines.Add('L');
    FrmPrincipalPreVenda.Editor.Lines.Add('H12');
    FrmPrincipalPreVenda.Editor.Lines.Add('PC');
    FrmPrincipalPreVenda.Editor.Lines.Add('A2');
    FrmPrincipalPreVenda.Editor.Lines.Add('D11');
    FrmPrincipalPreVenda.Editor.Lines.Add('1F3305200140229'+ FrmPrincipalPreVenda.SgDados.Cells[6,L]); //Codigo de Barras
    FrmPrincipalPreVenda.Editor.Lines.Add('141100001030013'+ Trim(descricao)); // Descricao part 1
//    FrmPrincipalPreVenda.Editor.Lines.Add('141100000850018'+ Trim(Copy(FrmPrincipalPreVenda.SgDados.Cells[1,L],21,40))); // Descricao part 2
    FrmPrincipalPreVenda.Editor.Lines.Add('131100001770237TEL: '+tel ); // telefone
    FrmPrincipalPreVenda.Editor.Lines.Add('121100000280018* TESTE ANTES DE USAR');
    FrmPrincipalPreVenda.Editor.Lines.Add('121100000120019* NAO TROCAMOS TINTA PREPARADA');
    FrmPrincipalPreVenda.Editor.Lines.Add('1Y1100001460035PB1'); //imagem
    FrmPrincipalPreVenda.Editor.Lines.Add('^01');
    // Cálculo para imprimir a qtd de etiquetas certo
    if Frac(StrToFloat(FrmPrincipalPreVenda.SgDados.Cells[2,L])/3) = 0.00 then
      vQtd := StrToFloat(FrmPrincipalPreVenda.SgDados.Cells[2,L])/3
    else vQtd := (StrToint(FormatFloat('0000',StrToFloat(FrmPrincipalPreVenda.SgDados.Cells[2,L]))) div 3) + 1;
    FrmPrincipalPreVenda.Editor.Lines.Add('Q'+ FormatFloat('0000',vQtd));
    FrmPrincipalPreVenda.Editor.Lines.Add('E');
  end;
  FrmPrincipalPreVenda.Editor.Lines.SaveToFile(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'etiqueta.txt')));
  WinExec(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'print2.bat')),sw_ShowNormal);
  if not FileExists(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName) +
    'Print2.bat'))) then
    ShowMessage('Não foi encontrado o arquivo Print2.bat');
  Application.OnMessage := FrmPrincipalPreVenda.ProcessaMsg;
  FrmPrincipalPreVenda.Limpar_Tela;
  FrmPrincipalPreVenda.RgOpcoes.ItemIndex := 0;
  Messagedlg('Impressão ok!', mtInformation, [mbOk], 0);
end;

procedure TFrmEtiquetaPontoDasTintas.ImprimeEtiquetaPontoDasTintas_Pequeno;
var L: integer;
    vQtd:real;
    descricao: string;
begin
  if FrmPrincipalPreVenda.SgDados.Cells[0,1] = '' then begin
    Messagedlg('Não foi lançado nenhum item para impressão das etiquetas!', mtWarning, [mbOk], 0);
    FrmPrincipalPreVenda.EdtConsulta.Setfocus;
    exit;
  end;
  FrmPrincipalPreVenda.Editor.Lines.Clear;
  for L := 1 to FrmPrincipalPreVenda.SgDados.RowCount - 1 do begin // Salvando os itens da pré-venda.
    if FrmPrincipalPreVenda.SgDados.Cells[0,L] = '' then Break;

    repeat
      descricao := inputbox('Descrição do produto', 'Digite a descrição do produto', FrmPrincipalPreVenda.SgDados.Cells[1,L]);
    until descricao <> '';

    FrmPrincipalPreVenda.Editor.Lines.Add('c0000');
    FrmPrincipalPreVenda.Editor.Lines.Add('KI503');
    FrmPrincipalPreVenda.Editor.Lines.Add('O0220');
    FrmPrincipalPreVenda.Editor.Lines.Add('f220');
    FrmPrincipalPreVenda.Editor.Lines.Add('KW0415');
    FrmPrincipalPreVenda.Editor.Lines.Add('KI7');
    FrmPrincipalPreVenda.Editor.Lines.Add('V0');
    FrmPrincipalPreVenda.Editor.Lines.Add('L');
    FrmPrincipalPreVenda.Editor.Lines.Add('H12');
    FrmPrincipalPreVenda.Editor.Lines.Add('PC');
    FrmPrincipalPreVenda.Editor.Lines.Add('A2');
    FrmPrincipalPreVenda.Editor.Lines.Add('D11');
    FrmPrincipalPreVenda.Editor.Lines.Add('121100000730013'+ Trim(Copy(descricao,1,20))); // Descricao part 1
    FrmPrincipalPreVenda.Editor.Lines.Add('121100000610013'+ Trim(Copy(descricao,20,40))); // Descricao part 2
    FrmPrincipalPreVenda.Editor.Lines.Add('121100000730149'+ Trim(Copy(descricao,1,20))); // Descricao part 1
    FrmPrincipalPreVenda.Editor.Lines.Add('121100000610150'+ Trim(Copy(descricao,20,40))); // Descricao part 2
    FrmPrincipalPreVenda.Editor.Lines.Add('121100000730289'+ Trim(Copy(descricao,1,20))); // Descricao part 1
    FrmPrincipalPreVenda.Editor.Lines.Add('121100000610290'+ Trim(Copy(descricao,20,40))); // Descricao part 2
    FrmPrincipalPreVenda.Editor.Lines.Add('191100500220017R$ '+ FormatFloat('0.00',StrToFloat(FrmPrincipalPreVenda.SgDados.Cells[9,L]))); // Valor
    FrmPrincipalPreVenda.Editor.Lines.Add('191100500230153R$ '+ FormatFloat('0.00',StrToFloat(FrmPrincipalPreVenda.SgDados.Cells[9,L]))); // Valor
    FrmPrincipalPreVenda.Editor.Lines.Add('191100500230292R$ '+ FormatFloat('0.00',StrToFloat(FrmPrincipalPreVenda.SgDados.Cells[9,L]))); // Valor
    FrmPrincipalPreVenda.Editor.Lines.Add('^01');
    // Cálculo para imprimir a qtd de etiquetas certo
    if Frac(StrToFloat(FrmPrincipalPreVenda.SgDados.Cells[2,L])/3) = 0.00 then
      vQtd := StrToFloat(FrmPrincipalPreVenda.SgDados.Cells[2,L])/3
    else vQtd := (StrToint(FormatFloat('0000',StrToFloat(FrmPrincipalPreVenda.SgDados.Cells[2,L]))) div 3) + 1;
    FrmPrincipalPreVenda.Editor.Lines.Add('Q'+ FormatFloat('0000',vQtd));
    FrmPrincipalPreVenda.Editor.Lines.Add('E');
  end;
  FrmPrincipalPreVenda.Editor.Lines.SaveToFile(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'etiqueta.txt')));
  WinExec(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName)+'print2.bat')),sw_ShowNormal);
  if not FileExists(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName) +
    'Print2.bat'))) then
    ShowMessage('Não foi encontrado o arquivo Print2.bat');
  Application.OnMessage := FrmPrincipalPreVenda.ProcessaMsg;
  FrmPrincipalPreVenda.Limpar_Tela;
  FrmPrincipalPreVenda.RgOpcoes.ItemIndex := 0;
  Messagedlg('Impressão ok!', mtInformation, [mbOk], 0);
end;

end.
