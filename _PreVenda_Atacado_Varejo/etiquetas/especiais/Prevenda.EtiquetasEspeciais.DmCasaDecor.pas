unit Prevenda.EtiquetasEspeciais.DmCasaDecor;

interface

uses
  Windows,

  System.SysUtils,

  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Grids,

  Produto;

type
  TEtiquetaDmCasaDecor = class
    private
    public
      procedure ImprimeEtiqueta(aDataList: TStringGrid);
  end;

implementation

uses
  MoPreVenda;

{ TEtiquetaDmCasaDecor }

procedure TEtiquetaDmCasaDecor.ImprimeEtiqueta(aDataList: TStringGrid);

var
  L, y, cont: integer;
  vqtd: real;
  produto: TDOMProduto;
begin
  if aDataList.Cells[0, 1] = '' then
  begin
    MessageDlg('Não foi lançado nenhum item para impressão das etiquetas!',
      mtWarning, [mbOK], 0);
    FrmPrincipalPreVenda.EdtConsulta.Setfocus;
    exit;
  end;

  cont := 0;

  for L := 1 to aDataList.RowCount - 1 do
  begin
    if aDataList.Cells[0, L] = '' then
      Break;
    cont := cont + 1;
  end;

  if Frac(cont / 2) = 0.00 then
    vqtd := cont / 2
  else
    vqtd := (StrToInt(FormatFloat('0000', cont)) div 2) + 1;
  cont := Trunc(vqtd);

  if cont <= 0 then
    cont := 1;
  FrmPrincipalPreVenda.Editor.Lines.Clear;

  L := 1;

  for y := 1 to cont do
  begin
    with FrmPrincipalPreVenda do begin
      Editor.Lines.Add('I8,1,001');
      Editor.Lines.Add('');
      Editor.Lines.Add('Q240,25');
      Editor.Lines.Add('q831');
      Editor.Lines.Add('');
      Editor.Lines.Add('D6');
      Editor.Lines.Add('');
      Editor.Lines.Add('O');
      Editor.Lines.Add('');
      Editor.Lines.Add('JF');
      Editor.Lines.Add('');
      Editor.Lines.Add('WN');
      Editor.Lines.Add('');
      Editor.Lines.Add('ZB');
      Editor.Lines.Add('');
      Editor.Lines.Add('N');
      Editor.Lines.Add('');
      Editor.Lines.Add('A82,21,0,2,1,1,N,"'+Copy(aDataList.Cells[1, L], 1, 20)+'"');
      Editor.Lines.Add('A82,42,0,2,1,1,N,"'+Copy(aDataList.Cells[1, L], 21, 10)+'"');
      Editor.Lines.Add('');
      Editor.Lines.Add('B102,148,0,1,2,4,44,N,"' +aDataList.Cells[6, L]+ '"');
      Editor.Lines.Add('A142,201,0,1,1,1,N,"' +aDataList.Cells[6, L]+ '"');
      Editor.Lines.Add('');
      Editor.Lines.Add('A125,91,0,2,1,1,N,"R$"');
      Editor.Lines.Add('A170,89,0,1,2,2,N,"' +FormatFloat('0.00', StrToFloat(aDataList.Cells[3, L]))+ '"');
      Editor.Lines.Add('');
      Editor.Lines.Add('');
      if SgDados.Cells[0,L+1] <> '' then begin
        Editor.Lines.Add('A506,21,0,2,1,1,N,"'+Copy(aDataList.Cells[1, L], 1, 20)+'"');
        Editor.Lines.Add('A506,42,0,2,1,1,N,"'+Copy(aDataList.Cells[1, L], 21, 10)+'"');
        Editor.Lines.Add('');
        Editor.Lines.Add('B526,148,0,1,2,4,44,N,"' +aDataList.Cells[6, L]+ '"');
        Editor.Lines.Add('A566,201,0,1,1,1,N,"' +aDataList.Cells[6, L]+ '"');
        Editor.Lines.Add('');
        Editor.Lines.Add('A549,91,0,2,1,1,N,"R$"');
        Editor.Lines.Add('A594,89,0,1,2,2,N,"' +FormatFloat('0.00', StrToFloat(aDataList.Cells[3, L]))+ '"');
        Editor.Lines.Add('');
      end;

      Editor.Lines.Add('P1');
      L := L + 2;

    end;
  end;

  FrmPrincipalPreVenda.Editor.Lines.SaveToFile
    (PAnsichar(AnsiString(ExtractFilePath(Application.ExeName) +
    'etiqueta.txt')));
  WinExec(PAnsichar(AnsiString(ExtractFilePath(Application.ExeName) +
    'print2.bat')), sw_ShowNormal);
  if not FileExists('Print2.bat') then
  begin
    ShowMessage('Não foi encontrado o arquivo Print.bat');
    exit;
  end;

  Application.OnMessage := FrmPrincipalPreVenda.ProcessaMsg;
  FrmPrincipalPreVenda.Limpar_Tela;
  FrmPrincipalPreVenda.RgOpcoes.ItemIndex := 0;
  MessageDlg('Impressão ok!', mtInformation, [mbOK], 0);
end;

end.
