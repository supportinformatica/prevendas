unit FrmDesconto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls;

type
  TFormDesconto = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Editor: TRichEdit;
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit1Exit(Sender: TObject);
  private
    { Private declarations }
    function calcularValorDisponivel : boolean;
    procedure SalvaResgate;
    procedure ImprimeComprovante;
  public
    { Public declarations }
  end;

var
  FormDesconto: TFormDesconto;

implementation

uses uFuncoesPadrao, FrmPrincipal, frmCredito, DataModulo, MoPreVenda;

{$R *.DFM}

function TFormDesconto.calcularValorDisponivel: boolean;
var vCredito,vDebito : real;
begin
  calcularValorDisponivel := True;
  with FormCredito.ADOQrySalvar do begin
    Sql.Text := 'Select Sum(vlValor) as Total From credito_vendedor WITH (NOLOCK) '+
                'Where dsStatus = ''C'' and cdPessoa = :CDPESSOA    ';
    Parameters.ParamByName('CDPESSOA').Value := FormCredito.cdVendedor;
    open;
    vCredito := FieldbyName('Total').AsFloat;
    Sql.Text := 'Select Sum(vlValor) as Total From credito_vendedor WITH (NOLOCK) '+
                'Where dsStatus = ''D'' and cdPessoa = :CDPESSOA    ';
    Parameters.ParamByName('CDPESSOA').Value := FormCredito.cdVendedor;
    open;
    vDebito := FieldbyName('Total').AsFloat;
    //if StrToFloat(edit1.text) > (vCredito-vDebito) * 0.8 then
    if StrToFloat(edit1.text) > (vCredito-vDebito)then
      calcularValorDisponivel := false;
  end;
end;

procedure TFormDesconto.Edit1KeyPress(Sender: TObject; var Key: Char);
var
  vdesconto : real;
begin
  if Trim(Edit1.Text) = '' then
    Edit1.Text := '0,00';
  if (key = Char(13)) and (StrToFloat(Edit1.Text) > 0) then
  begin
    Edit1.Text := FormatFloat('0.000',StrToFloat(Edit1.Text));
    if not calcularValorDisponivel then
    begin
      Application.OnMessage := FormPrincipal.NaoProcessaMsg;
      ShowMessage('Saldo indisponível para resgate!');
      Edit1.SelectAll;
      Edit1.SetFocus;
      Application.OnMessage := FormPrincipal.ProcessaMsg;
      exit;
    end;
    if MessageDlg('Tem certeza que deseja fazer um resgate no valor de R$ '+edit1.Text+' ?',mtWarning,[mbYes,mbNo],0) = mrYes then
    begin
      SalvaResgate;
      close;
      FormCredito.Enabled   := True;
      FormCredito.dtInicial.SetFocus;
      Application.OnMessage := FormPrincipal.ProcessaMsg;
      exit;
    end else
    begin
      Edit1.SelectAll;
      Edit1.SetFocus;
      Application.OnMessage := FormPrincipal.ProcessaMsg;
    end;
  end;
  if key = Char(27) then
  begin
    close;
    FormCredito.Enabled   := True;
    FormCredito.dtInicial.SetFocus;
    Application.OnMessage := FormPrincipal.ProcessaMsg;
    exit;
  end;
  ValidarNumero(Key);
end;

procedure TFormDesconto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFormDesconto.Edit1Exit(Sender: TObject);
begin
   if Trim(Edit1.Text) = '' then Edit1.Text := '0,00';
   Edit1.Text := FormatFloat('0.000',StrToFloat(Edit1.Text));
end;

procedure TFormDesconto.SalvaResgate;
begin
  With DModulo.ADOQuery1 do
  begin
    Try
     DModulo.Conexao.BeginTrans;
     Sql.Text := 'INSERT INTO Credito_Vendedor(dsLancamento,cdpessoa,vlvalorvenda,vlDesconto,           '+
                 'dsStatus,vlValor,dtData)                                                              '+
                 'VALUES (:dsLancamento,:cdpessoa,:vlvalorvenda,:vlDesconto,:dsStatus,:vlValor,:dtdata) ';
     Parameters.parambyname('dsLancamento').Value := 'RESGATE';
     Parameters.parambyname('cdpessoa').Value     := FormCredito.cdVendedor;
     Parameters.parambyname('vlvalorvenda').Value := 0.00;
     Parameters.parambyname('vlDesconto').Value   := 0.00;
     Parameters.parambyname('dsStatus').Value     := 'D';
     Parameters.parambyname('vlValor').Value      := edit1.text;
     Parameters.parambyname('dtdata').Value       := vdata_banco;
     ExecSql;
     DModulo.Conexao.CommitTrans;
     Messagedlg('Resgate de crédito lançado com sucesso!', mtConfirmation, [mbOk], 0);
     ImprimeComprovante;
    Except
      on E: Exception do
      begin
        DModulo.Conexao.RollbackTrans;
        Salvar_erro(vData_Banco + ' | ' + FrmPrincipalPreVenda.pegaHoraBanco, 'PREVENDA', 'TFormDesconto.SalvaResgate', e.Message);
        Messagedlg('Não foi possível salvar este resgate!', mterror, [mbOk], 0);
      end;
    end;  // except
  end;
end;

procedure TFormDesconto.ImprimeComprovante;
var Arq : TextFile;
begin
   Editor.Clear;
   Editor.Lines.Add(' ');
   Editor.Lines.Add('       **R E S G A T E DE C R E D I T O**');
   Editor.Lines.Add(' ');
   Editor.Lines.Add(' ============================================');
   Editor.Lines.Add(' ');
   if vMatrizFilial = 'MATRIZ' THEN
     Editor.Lines.Add('   P R O A U T O    A U T O   P E C A S  (M)')
   else
     Editor.Lines.Add('   P R O A U T O    A U T O   P E C A S  (F)');
   Editor.Lines.Add(' ============================================');
   Editor.Lines.Add(' Vendedor:    '+ FloatToStr(FormCredito.cdVendedor));
   Editor.Lines.Add(' ');
   Editor.Lines.Add(' Valor R$:    '+ edit1.text);
   Editor.Lines.Add(' ============================================');
   Editor.Lines.Add(' ');
   Editor.Lines.Add(' ');
   Editor.Lines.Add(' ');
   Editor.Lines.Add('  _______________________________________');
   Editor.Lines.Add('                Assinatura');
   Editor.Lines.Add(' ');
   Editor.Lines.Add(' ');
   Editor.Lines.Add(' ');
   Editor.Lines.Add(' ');
   Editor.Lines.Add(' ');
   Editor.Lines.Add(' ');
   Editor.Lines.Add(' ');
   Editor.Lines.Add(' ');
   Editor.Lines.Add(' ');
   Editor.Lines.Add(' ');
   try
     AssignFile(Arq,'Texto.txt');
     Erase(Arq);
     Rewrite(Arq);
     Writeln(Arq,Editor.Text);
   Finally
     CloseFile(Arq);
   end; // try
   WinExec('c:\Arquiv~1\Saef\bin\print.bat',sw_ShowNormal);
end;

end.
