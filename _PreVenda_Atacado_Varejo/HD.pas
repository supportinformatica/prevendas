unit HD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB, jpeg, ExtCtrls, Menus;

type
  TfrmChave = class(TForm)
    btnChave: TButton;
    qryChave: TADOQuery;
    btnCancelar: TButton;
    Image1: TImage;
    GroupBox1: TGroupBox;
    Lbl1: TLabel;
    LblMsg: TLabel;
    edtChave1: TEdit;
    lbSerial: TLabel;
    edtCodigo1: TEdit;
    lbCodigo: TLabel;
    procedure btnChaveClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtChave1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure MontaSerial;
    procedure VerificaDataExpiracao;
    procedure AnimaMensagem;
  public
    { Public declarations }
    Dia, Mes, Ano : Word;
    DiaCh,MesCh :string;
    function GeraTamanho(valor:string;tam:integer):string;
  end;

var
  frmChave: TfrmChave;
  PodeUsar: Boolean;

implementation

uses DateUtils, uFuncoesPadrao, DataModulo, MoPreVenda;

{$R *.dfm}

Procedure TfrmChave.btnChaveClick(Sender: TObject);
var Data  : TDateTime;
    ChaveMestre,ChaveTeste : String;
    Qtd   : integer;
    Sit   : String[1];
//    vdata : String[10];
    j,vSoma,vSomaTotal : Integer;
    vDigito,vMult,vResult,vCod : String;
    
begin
  if trim(edtChave1.Text) = '' then begin
    Application.MessageBox('Digite a chave de acesso!', 'Atenção', mb_ok + MB_ICONWARNING + MB_SYSTEMMODAL);
    edtChave1.setFocus;
    exit;
  end;
  if ((length(trim(edtChave1.Text)) < edtChave1.MaxLength)) then begin
    Application.MessageBox('A chave de acesso está incompleta!', 'Atenção', mb_ok + MB_ICONWARNING + MB_SYSTEMMODAL);
    edtChave1.setFocus;
    exit;
  end;
  if ((PodeUsar) and (Trim(EdtChave1.Text) = '1111111111')) then begin
    Application.MessageBox('Só é permitido utilizar chave de emergência quando o sistema estiver completamente inacessível!', 'Atenção', mb_ok + MB_ICONWARNING + MB_SYSTEMMODAL);
    close;
    exit;
  end
  else begin
    ChaveMestre := Copy(EdtCodigo1.Text,11,2) +  // Retorno o código de tras pra frente dividindo de dois em dois
                   Copy(EdtCodigo1.Text,9,2)+
                   Copy(EdtCodigo1.Text,7,2)+
                   Copy(EdtCodigo1.Text,5,2)+
                   Copy(EdtCodigo1.Text,3,2)+
                   Copy(EdtCodigo1.Text,1,2);
    // Calculo o dígito verificador pra mais na frente testar se as chaves são iguais
    vMult := '313131313131';
    j := 0;
    vSomaTotal := 0;
    vCod  := EdtCodigo1.Text;//ChaveMestre;
    Qtd   := StrToInt(Copy(EdtChave1.Text,4,3));
    for j := 12 downto 1 do begin
      vSoma      := StrToInt(Copy(vCod,J,1)) * StrToInt(Copy(vMult,J,1));
      vSomaTotal := vSomaTotal + vSoma;
    end;
    vResult    := IntToStr(vSomaTotal);
    vSomaTotal := StrToInt(Copy(vResult,Length(vResult),1));
    if vSomaTotal = 0 then vDigito := '0';
    if vSomaTotal = 1 then vDigito := IntToStr((vSomaTotal + 9) - vSomaTotal);
    if vSomaTotal = 2 then vDigito := IntToStr((vSomaTotal + 8) - vSomaTotal);
    if vSomaTotal = 3 then vDigito := IntToStr((vSomaTotal + 7) - vSomaTotal);
    if vSomaTotal = 4 then vDigito := IntToStr((vSomaTotal + 6) - vSomaTotal);
    if vSomaTotal = 5 then vDigito := IntToStr((vSomaTotal + 5) - vSomaTotal);
    if vSomaTotal = 6 then vDigito := IntToStr((vSomaTotal + 4) - vSomaTotal);
    if vSomaTotal = 7 then vDigito := IntToStr((vSomaTotal + 3) - vSomaTotal);
    if vSomaTotal = 8 then vDigito := IntToStr((vSomaTotal + 2) - vSomaTotal);
    if vSomaTotal = 9 then vDigito := IntToStr((vSomaTotal + 1) - vSomaTotal);
    // Para testar se a chave é correta, monta-se da mesma forma sem a quantidade de dias. O q vai definir é o digiton verificador
    ChaveTeste := Copy(vCod,9,2)+ vDigito + Copy(vCod,4,2) + Copy(vCod,1,2);
    vResult    := Copy(EdtChave1.Text,1,3)+Copy(EdtChave1.Text,7,4); // Chave digitada para comparar com a chave teste
    QryChave.Sql.Text := 'SELECT dtExpiraCopia,dsPorta FROM CONFIGURACAO';
    QryChave.Open;
    Data       := QryChave.FieldByName('dtExpiraCopia').AsDateTime; //Pegando data do BD para incrementar depois
    sit        := QryChave.FieldByName('dsPorta').AsString; // Pegando situação do BD
    QryChave.Sql.Text := 'SELECT nrVlAvulso FROM sequencial';
    QryChave.Open;
    Data := FloatToDateTime(QryChave.FieldByName('nrVlAvulso').AsInteger); //Pegando data do BD para incrementar depois

    //showMessage(datetostr(data));
    if ((Trim(EdtChave1.Text) = '1111111111') and  (sit = 'U')) then begin
      Application.MessageBox('Já foi realizada a liberação de emergencia. Entre com uma chave válida!', 'Erro', mb_ok + MB_ICONERROR+ MB_SYSTEMMODAL);
//      MessageDlg('Já foi realizada a liberação de emergencia. Entre com uma chave válida!',mtError,[mbOK],0);
      Exit;
    end
    else begin
      if(Trim(EdtChave1.Text) = '1111111111') then begin //chave de urgência
        Data := IncDay(Data,1);
        sit := 'U'; //U = Urgente
      end
      else if(vResult = ChaveTeste) then begin // compara a chave gerada com o valor digitado
        Data := IncDay(Data,Qtd); // acrescenta meses
        sit  := 'L'; //L -> Liberado
      end
      else begin
        Application.MessageBox('Chave Inválida. Tente a chave de emergencia!', 'Erro', mb_ok + MB_ICONERROR+ MB_SYSTEMMODAL);
        Exit;
      end;
    end;
    try
      DModulo.Conexao.BeginTrans;
      QryChave.SQL.Text := 'UPDATE CONFIGURACAO SET         '+
                           'dtExpiraCopia = :dtExpiraCopia, '+
                           'dsPorta       = :dsPorta        ';
      QryChave.Parameters.ParamByName('dtExpiraCopia').Value := DateToStr(Data); //atualiza data
      QryChave.Parameters.ParamByName('dsPorta').Value := sit; // atualiza data
      QryChave.ExecSQL;
      QryChave.SQL.Text := 'UPDATE SEQUENCIAL SET nrVlAvulso = :nrVlAvulso ';
      QryChave.Parameters.ParamByName('nrVlAvulso').Value := DateOF(Data); //atualiza data
      QryChave.ExecSQL;
      DModulo.Conexao.CommitTrans;
      Application.MessageBox('Sistema Atualizado com sucesso!', 'Informação', mb_ok + MB_ICONINFORMATION + MB_SYSTEMMODAL);
      QryChave.close;
      PodeUsar := true;//serve para liberar o fechamento do form
      frmChave.Close;
    except
      DModulo.Conexao.RollbackTrans;
      Application.MessageBox('Erro ao atualizar a chave de acesso!', 'Erro', mb_ok + MB_ICONERROR + MB_SYSTEMMODAL);
//      MessageDlg('Erro na atualização do Sistema!!!',mtError,[mbOK],0);
    end;  //try
  end;
end;

Function TravaTeclas (Key: integer): boolean;
begin
  Result := Odd(GetKeyState(Key)); //desabilitar o "ALT + F4"
end;

procedure TfrmChave.FormKeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
  if(TravaTeclas(VK_LMENU))and(Key = VK_F4)then
    PodeUsar := False
  else
  IF Key = Vk_Escape then
    btnCancelarClick(self); 
end;

procedure TfrmChave.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if not PodeUsar then
    Action := caNone
  else
    Action := caFree;
end;

procedure TfrmChave.btnCancelarClick(Sender: TObject);
begin
  if PodeUsar then
    close
  else
    Application.Terminate;
end;

procedure TfrmChave.FormCreate(Sender: TObject);
var vBarras : String;
    DtExp :TDateTime;
begin
  MontaSerial;
  VerificaDataExpiracao;
end;

function TfrmChave.GeraTamanho(valor:string;tam:integer): string;
//acrescenta '0' no fim do valor até atingir o tamanho desejado
begin
  while length(valor) < tam do
    valor := valor + '0';
  result := valor;
end;

procedure TfrmChave.MontaSerial;
var vBarras : String;
begin
  DecodeDate(Date,Ano,Mes,Dia);
  vBarras := '';
  // montando código do cliente
  if (Length(IntToStr(Dia)) < 2) then DiaCh := '0' + IntToStr(Dia)
  else DiaCh := IntToStr(Dia);
  if (Length(IntToStr(Mes)) < 2) then MesCh := '0' + IntToStr(Mes)
  else MesCh := IntToStr(Mes);
  edtCodigo1.Text := Copy(SerialNum,1,3) + DiaCh + MesCh + IntToStr(Ano) + '9'; // Tres primeiros numeros do HD + a data atual
  vBarras := Copy(EdtCodigo1.Text,11,2) +  // Monto o código de tras pra frente dividindo de dois em dois
             Copy(EdtCodigo1.Text,9,2) +
             Copy(EdtCodigo1.Text,7,2) +
             Copy(EdtCodigo1.Text,5,2) +
             Copy(EdtCodigo1.Text,3,2) +
             Copy(EdtCodigo1.Text,1,2);
  edtCodigo1.Text := vBarras;
end;

procedure TfrmChave.VerificaDataExpiracao;
var DtExp :TDateTime;
    qry: TAdoQuery;
    diasRestantes: Integer;
begin
  qry := TADOQuery.Create(nil);
  qry.Connection := DModulo.Conexao;
  with qry do begin
    //SQL.Text := 'SELECT dtExpiraCopia FROM CONFIGURACAO WITH (NOLOCK) ';
    SQL.Text := 'SELECT nrVlAvulso FROM sequencial WITH (NOLOCK) ';
    Open;
    dtExp := FloatToDateTime(FieldByName('nrVlAvulso').AsInteger);
    diasRestantes := DaysBetween(DtExp, strtoDate(vData_Banco));
    //showMessage(datetostr(dtExp));
    if (DtExp < StrToDate(vData_Banco)) then begin  //prazo vencido
      LblMsg.Caption := 'A chave de acesso ao sistema, precisa ser renovada. '+#13#10+'Ligue 79 3302-5707 e solicite uma nova com o setor financeiro.';
      PodeUsar := false;
    end else if ((DtExp - 8) < StrToDate(vData_Banco))then begin
      if diasRestantes > 0 then
        LblMsg.Caption := 'A licença de uso do Saef irá expirar em '+ intToStr(diasRestantes) +' dia(s)!' +#13#10+
                          'Você já pode ligar para a Support Informática e solicitar a renovação da chave de acesso.'
      else
        LblMsg.Caption := 'A licença de uso do Saef irá expirar HOJE! Amanhã o sistema estará completamente inacessível.' +#13#10+
                          'Você já pode ligar para a Support Informática e solicitar a renovação da chave de acesso.';
      PodeUsar := true;
    end
    else begin
      LblMsg.Caption := 'A licença de uso do Saef irá expirar em '+ intToStr(diasRestantes) +' dia(s)!';
      PodeUsar := true;
    end;
  end;
  FreeAndNil(qry);
end;

procedure TfrmChave.FormShow(Sender: TObject);
begin
  if podeUsar then
    btnCancelar.setFocus;
end;

procedure TfrmChave.AnimaMensagem;
begin
  LblMsg.Font.Color := clRed;
  sleep(100);
  LblMsg.Font.Color := clBlack;
  sleep(100);
  LblMsg.Font.Color := clRed;
  sleep(100);
  LblMsg.Font.Color := clBlack;
  sleep(100);
  LblMsg.Font.Color := clRed;
  sleep(100);
  LblMsg.Font.Color := clBlack;
end;

procedure TfrmChave.edtChave1KeyPress(Sender: TObject; var Key: Char);
begin
  ValidarInteiro(key);
end;

end.
