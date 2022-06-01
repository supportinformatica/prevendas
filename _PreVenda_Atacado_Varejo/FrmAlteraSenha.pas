unit FrmAlteraSenha;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Buttons,Vcl.Imaging.jpeg,
  Vcl.Menus, Data.DB, Data.Win.ADODB;

type
  TFormAlteraSenha = class(TForm)
    Image1: TImage;
    Label6: TLabel;
    Shape1: TShape;
    Panel1: TPanel;
    Label10: TLabel;
    Label9: TLabel;
    Label7: TLabel;
    imgAlta: TImage;
    imgNormal: TImage;
    imgTransparente: TImage;
    lblSenha: TLabel;
    imgBaixa: TImage;
    EdtConfirma: TEdit;
    EdtNova: TEdit;
    EdtAtual: TEdit;
    CbxFun: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    BtnMdImprimir: TBitBtn;
    Label5: TLabel;
    Label8: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    LblNomeCliente: TLabel;
    PopupMenu1: TPopupMenu;
    Cancelar1: TMenuItem;
    Label11: TLabel;
    AdoUsuario: TADOQuery;
    Label17: TLabel;
    Panel2: TPanel;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    procedure FormCreate(Sender: TObject);
    procedure BtnMdSairClick(Sender: TObject);
    procedure EdtNovaChange(Sender: TObject);
    procedure Cancelar1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnMdImprimirClick(Sender: TObject);
  private
    { Private declarations }
    procedure MontaComboFuncionario;
    function verificaSenha(senha: string): string;
  public
    { Public declarations }
  end;

var
  FormAlteraSenha: TFormAlteraSenha;

implementation

{$R *.dfm}

uses uFuncoesPadrao, DataModulo, PedeSenh;

function TFormAlteraSenha.verificaSenha(senha: string): string;
begin
  if Length(senha) = 0 then begin
    Result := '';
    Image2.Picture := imgTransparente.Picture;
    Image3.Picture := imgTransparente.Picture;
    Image4.Picture := imgTransparente.Picture;
  end
  else if Length(senha) <= 4 then begin
    Result := 'Fraca';
    Image2.Picture := imgBaixa.Picture;
    Image3.Picture := imgTransparente.Picture;
    Image4.Picture := imgTransparente.Picture;
  end
  else if (SoNumeros(senha) <> '') and (Length(SoNumeros(senha)) < Length(senha))  then begin
    Result := 'Forte';
    Image2.Picture := imgTransparente.Picture;
    Image3.Picture := imgTransparente.Picture;
    Image4.Picture := imgAlta.Picture;
  end
  else if Length(senha) > 4 then begin
    Result := 'Média';
    Image2.Picture := imgTransparente.Picture;
    Image3.Picture := imgNormal.Picture;
    Image4.Picture := imgTransparente.Picture;
  end;
end;

procedure TFormAlteraSenha.BtnMdImprimirClick(Sender: TObject);
var qry: TADOQuery;
    vFlag : boolean;
begin
  if trim(CbxFun.Text) = '' then begin
    Application.MessageBox('Selecione um usuário!','Atenção', mb_ok + MB_ICONWARNING + MB_APPLMODAL);
    CbxFun.SetFocus;
    Exit;
  end;
  if trim(EdtAtual.Text) = '' then begin
    Application.MessageBox('Digite a senha atual!','Atenção', mb_ok + MB_ICONWARNING + MB_APPLMODAL);
    EdtAtual.SetFocus;
    Exit;
  end;
  if trim(EdtNova.Text) = '' then begin
    Application.MessageBox('Digite a nova senha!','Atenção', mb_ok + MB_ICONWARNING + MB_APPLMODAL);
    EdtNova.SetFocus;
    Exit;
  end;
  if trim(EdtConfirma.Text) = '' then begin
    Application.MessageBox('Digite novamente a nova senha!','Atenção', mb_ok + MB_ICONWARNING + MB_APPLMODAL);
    EdtConfirma.SetFocus;
    Exit;
  end;
  if Senha(EdtNova.Text,'C') <> Senha(EdtConfirma.Text,'C') then begin
    Application.MessageBox('A nova senha difere da confirmação da senha ou não é uma senha válida!','Atenção', mb_ok + MB_ICONWARNING + MB_APPLMODAL);
    EdtNova.SetFocus;
    exit;
  end;
  qry := TAdoQuery.Create(nil);
  qry.connection := DModulo.Conexao;
  with qry do begin
    Sql.Text := 'Select S.dsSenha From Senha S WITH (NOLOCK) Where S.dsnome = :DSNOME and S.dsSenha = :DSSENHA ';
    Parameters.ParamByName('DSNOME').Value  := CbxFun.Text;
    Parameters.ParamByName('DSSENHA').Value := Senha(EdtAtual.Text,'C');
    Open;
    if (qry.RecordCount = 0) then begin
      Application.MessageBox('A senha atual está incorreta!','Atenção', mb_ok + MB_ICONWARNING + MB_APPLMODAL);
      EdtAtual.SetFocus;
      Exit;
    end;
    try
      sql.text := 'update senha set dsSenha = :dsNovaSenha where dsNome = :dsNome and dsSenha = :dsSenhaAntiga';
      parameters.ParamByName('dsNovaSenha').Value   := Senha(EdtNova.Text,'C');
      parameters.ParamByName('dsNome').Value        := CbxFun.Text;
      parameters.ParamByName('dsSenhaAntiga').Value := Senha(EdtAtual.Text,'C');
      ExecSQL;
    finally
      FrmPedeSenha.editUsuario.Text := CbxFun.Text;
      FrmPedeSenha.EditSenha.SetFocus;
      self.close;
    end;
  end;
  FreeAndNil(qry);
end;

procedure TFormAlteraSenha.BtnMdSairClick(Sender: TObject);
begin
  close;
end;

procedure TFormAlteraSenha.Cancelar1Click(Sender: TObject);
begin
  close;
end;

procedure TFormAlteraSenha.EdtNovaChange(Sender: TObject);
begin
  lblSenha.Caption := verificaSenha(EdtNova.Text);
end;

procedure TFormAlteraSenha.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := cafree;
end;

procedure TFormAlteraSenha.FormCreate(Sender: TObject);
begin
  MontaComboFuncionario;
  LblNomeCliente.Caption := getNomeEmpresa;
end;

procedure TFormAlteraSenha.MontaComboFuncionario;
begin
  AdoUsuario.Connection := DModulo.Conexao;
  with AdoUsuario do begin
    SQL.Text := 'select dsnome from senha WITH (NOLOCK) order by dsnome ';
    MontaComboListADO(AdoUsuario,CbxFun);
  end;
//var
//  funcionario: TFuncionario;
//  listaFuncionarios: TList<TFuncionario>;
//begin
//  CbxFun.Items.Clear;
//  listaFuncionarios:= TNEGLoja.getFuncionarios();
//  for funcionario in listaFuncionarios do
//    CbxFun.Items.Add(funcionario.nome + ' | ' + IntToStr(funcionario.codigo));
//  CbxFun.ItemIndex := -1;
//  FreeAndNil(funcionario);
end;

end.
