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
    Shape1: TShape;
    imgAlta: TImage;
    imgNormal: TImage;
    imgTransparente: TImage;
    lblSenha: TLabel;
    imgBaixa: TImage;
    EdtConfirma: TEdit;
    EdtNova: TEdit;
    EdtAtual: TEdit;
    CbxFun: TComboBox;
    Label16: TLabel;
    PopupMenu1: TPopupMenu;
    Cancelar1: TMenuItem;
    AdoUsuario: TADOQuery;
    Panel2: TPanel;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
    Image10: TImage;
    Image11: TImage;
    Image12: TImage;
    Image13: TImage;
    Image14: TImage;
    Image15: TImage;
    Image16: TImage;
    procedure FormCreate(Sender: TObject);
    procedure BtnMdSairClick(Sender: TObject);
    procedure EdtNovaChange(Sender: TObject);
    procedure Cancelar1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Image7Click(Sender: TObject);
    procedure Image8Click(Sender: TObject);
    procedure Image15Click(Sender: TObject);
    procedure Image15MouseEnter(Sender: TObject);
    procedure Image15MouseLeave(Sender: TObject);
    procedure Image7MouseLeave(Sender: TObject);
    procedure Image7MouseEnter(Sender: TObject);
  private
    procedure MontaComboFuncionario;
    function verificaSenha(senha: string): string;
  public

  end;

var
  FormAlteraSenha: TFormAlteraSenha;

implementation

{$R *.dfm}

uses uFuncoesPadrao, DataModulo, PedeSenh, Winapi.ShellAPI;

function TFormAlteraSenha.verificaSenha(senha: string): string;
begin
  if Length(senha) = 0 then
  begin
    Result := '';
    Image2.Picture := imgTransparente.Picture;
    Image3.Picture := imgTransparente.Picture;
    Image4.Picture := imgTransparente.Picture;
  end
  else if Length(senha) <= 4 then
  begin
    Result := 'Fraca';
    Image2.Picture := imgBaixa.Picture;
    Image3.Picture := imgTransparente.Picture;
    Image4.Picture := imgTransparente.Picture;
  end
  else if (SoNumeros(senha) <> '') and (Length(SoNumeros(senha)) < Length(senha)) then
  begin
    Result := 'Forte';
    Image2.Picture := imgTransparente.Picture;
    Image3.Picture := imgTransparente.Picture;
    Image4.Picture := imgAlta.Picture;
  end
  else if Length(senha) > 4 then
  begin
    Result := 'Média';
    Image2.Picture := imgTransparente.Picture;
    Image3.Picture := imgNormal.Picture;
    Image4.Picture := imgTransparente.Picture;
  end;
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
end;

procedure TFormAlteraSenha.Image15Click(Sender: TObject);
begin
  ShellExecute(Application.Handle, nil, PChar('https://supportinformatica.net/'), nil, nil, sw_hide);
end;

procedure TFormAlteraSenha.Image15MouseEnter(Sender: TObject);
begin
  Image15.Cursor := crHandPoint;
end;

procedure TFormAlteraSenha.Image15MouseLeave(Sender: TObject);
begin
  Image15.Cursor := crDefault;
end;

procedure TFormAlteraSenha.Image7Click(Sender: TObject);
var qry: TADOQuery;
    vFlag : boolean;
begin
  if trim(CbxFun.Text) = '' then
  begin
    Application.MessageBox('Selecione um usuário!','Atenção', mb_ok + MB_ICONWARNING + MB_APPLMODAL);
    CbxFun.SetFocus;
    Exit;
  end;
  if trim(EdtAtual.Text) = '' then
  begin
    Application.MessageBox('Digite a senha atual!','Atenção', mb_ok + MB_ICONWARNING + MB_APPLMODAL);
    EdtAtual.SetFocus;
    Exit;
  end;
  if trim(EdtNova.Text) = '' then
  begin
    Application.MessageBox('Digite a nova senha!','Atenção', mb_ok + MB_ICONWARNING + MB_APPLMODAL);
    EdtNova.SetFocus;
    Exit;
  end;
  if trim(EdtConfirma.Text) = '' then
  begin
    Application.MessageBox('Digite novamente a nova senha!','Atenção', mb_ok + MB_ICONWARNING + MB_APPLMODAL);
    EdtConfirma.SetFocus;
    Exit;
  end;
  if Senha(EdtNova.Text,'C') <> Senha(EdtConfirma.Text,'C') then
  begin
    Application.MessageBox('A nova senha difere da confirmação da senha ou não é uma senha válida!','Atenção', mb_ok + MB_ICONWARNING + MB_APPLMODAL);
    EdtNova.SetFocus;
    exit;
  end;
  qry := TAdoQuery.Create(nil);
  qry.connection := DModulo.Conexao;
  with qry do
  begin
    Sql.Text := 'Select S.dsSenha From Senha S WITH (NOLOCK) Where S.dsnome = :DSNOME and S.dsSenha = :DSSENHA ';
    Parameters.ParamByName('DSNOME').Value  := CbxFun.Text;
    Parameters.ParamByName('DSSENHA').Value := Senha(EdtAtual.Text,'C');
    Open;
    if (qry.RecordCount = 0) then
    begin
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

procedure TFormAlteraSenha.Image7MouseEnter(Sender: TObject);
begin
  Image7.Cursor := crHandPoint;
end;

procedure TFormAlteraSenha.Image7MouseLeave(Sender: TObject);
begin
  Image7.Cursor := crDefault;
end;

procedure TFormAlteraSenha.Image8Click(Sender: TObject);
begin
  close;
end;

procedure TFormAlteraSenha.MontaComboFuncionario;
begin
  AdoUsuario.Connection := DModulo.Conexao;
  with AdoUsuario do
  begin
    SQL.Text := 'select dsnome from senha WITH (NOLOCK) order by dsnome ';
    MontaComboListADO(AdoUsuario,CbxFun);
  end;
end;

end.
