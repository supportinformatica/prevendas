unit formBuscaCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ufuncoesPadrao, DB, ADODB, DataModulo, Menus;

type
  TfrmBuscaCliente = class(TForm)
    cbxBusca: TComboBox;
    Shape1: TShape;
    rgBusca: TRadioGroup;
    qryBuscar: TADOQuery;
    lblTitulo: TLabel;
    popup: TPopupMenu;
    PesquisarporCNPJCPF1: TMenuItem;
    Pesquisarporapelido1: TMenuItem;
    PesquisarporCdigo1: TMenuItem;
    RazoSocial1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure rgBuscaClick(Sender: TObject);
    procedure cbxBuscaKeyPress(Sender: TObject; var Key: Char);
    procedure PesquisarporCNPJCPF1Click(Sender: TObject);
    procedure Pesquisarporapelido1Click(Sender: TObject);
    procedure PesquisarporCdigo1Click(Sender: TObject);
    procedure RazoSocial1Click(Sender: TObject);
  private
    procedure MontaApelido;
    procedure MontaCNPJ;
    procedure MontaCodigo;
    procedure MontaComboRazaoSocial;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBuscaCliente: TfrmBuscaCliente;

implementation

uses MoPreVenda;

{$R *.dfm}

procedure TfrmBuscaCliente.MontaCNPJ;
begin
  with qryBuscar do
  begin
    sql.Text := 'Select F.dsCPF as CGC, P.cdPessoa, P.nmPessoa                   '+
                'From Pessoa P WITH (NOLOCK) inner join P_Fisica F WITH (NOLOCK) '+
                'On P.cdPessoa = F.cdPessoa INNER JOIN Cliente C WITH (NOLOCK)   '+
                'ON C.cdPessoa = P.cdPessoa                                      '+
                'Where P.Ser = ''C'' and P.dsAtivo = ''S'' and len(F.dsCPF)>0     ';
                if (UpperCase(vEmpresa) = 'CAMARATUBA')OR(UpperCase(vEmpresa) = 'CARDOSOACESSORIOS') then
                   SQL.Add('and C.cdCodigo <> 2 ');
        SQL.Add('union '+
                'Select F.CGC as CGC, P.cdPessoa, P.nmPessoa '+
                'From Pessoa P WITH (NOLOCK) inner join P_Juridica F WITH (NOLOCK) '+
                'On P.cdPessoa = F.cdPessoa INNER JOIN Cliente C WITH (NOLOCK) '+
                'ON C.cdPessoa = P.cdPessoa '+
                'Where P.Ser = ''C'' and P.dsAtivo = ''S'' and len(F.CGC)>0 ');
                if (UpperCase(vEmpresa) = 'CAMARATUBA')OR(UpperCase(vEmpresa) = 'CARDOSOACESSORIOS') then
                   SQL.Add('and C.cdCodigo <> 2 ');
    MontaComboListBoolADO(qryBuscar,cbxBusca);
    Open;
  end;
end;

procedure TfrmBuscaCliente.MontaApelido;
begin
  with qryBuscar do
  begin
    sql.Text := 'Select F.DsNaturalidade as Apelido, P.cdPessoa, P.nmPessoa '+
                'From Pessoa P WITH (NOLOCK) inner join P_Fisica F WITH (NOLOCK) '+
                'On P.cdPessoa = F.cdPessoa INNER JOIN Cliente C WITH (NOLOCK) '+
                'ON C.cdPessoa = P.cdPessoa '+
                'Where P.Ser = ''C'' '+
                '	and P.dsAtivo = ''S'' and len(F.DsNaturalidade)>0 ';
    if (UpperCase(vEmpresa) = 'CAMARATUBA')OR(UpperCase(vEmpresa) = 'CARDOSOACESSORIOS') then
        SQL.Add('and C.cdCodigo <> 2 ');
        SQL.Add('union '+
                'Select F.nmcontato as Apelido, P.cdPessoa, P.nmPessoa '+
                'From Pessoa P WITH (NOLOCK) inner join P_Juridica F WITH (NOLOCK) '+
                'On P.cdPessoa = F.cdPessoa INNER JOIN Cliente C WITH (NOLOCK) '+
                'ON C.cdPessoa = P.cdPessoa '+
                'Where P.Ser = ''C'' and P.dsAtivo = ''S'' and len(F.nmcontato)>0  ');
    if (UpperCase(vEmpresa) = 'CAMARATUBA')OR(UpperCase(vEmpresa) = 'CARDOSOACESSORIOS') then
        SQL.Add('and C.cdCodigo <> 2 ');
    MontaComboListBoolADO(qryBuscar,cbxBusca);
    Open;
  end;
end;

procedure TfrmBuscaCliente.MontaCodigo;
begin
  with qryBuscar do begin
    sql.Text := 'Select P.cdPessoa, P.nmPessoa                                  '+
                'From Pessoa P WITH (NOLOCK) INNER JOIN Cliente C WITH (NOLOCK) '+
                'ON C.cdPessoa = P.cdPessoa                                     '+
                'Where P.Ser = ''C'' and P.dsAtivo = ''S''                      ';
    if (UpperCase(vEmpresa) = 'CAMARATUBA')OR(UpperCase(vEmpresa) = 'CARDOSOACESSORIOS') then
        SQL.Add('and C.cdCodigo <> 2 ');
    SQL.Add('order by P.cdpessoa ');
    MontaComboListBoolADO(qryBuscar,cbxBusca);
    Open;
  end;
end;

procedure TfrmBuscaCliente.MontaComboRazaoSocial;
begin
  with qryBuscar do begin
    sql.Text := 'select PJ.nmRazao, P.cdPessoa, P.nmPessoa                          '+
                'from p_juridica PJ WITH (NOLOCK) inner join Pessoa P WITH (NOLOCK) '+
                'on PJ.cdPessoa = P.cdPessoa                                        '+
                'INNER JOIN Cliente C WITH (NOLOCK) ON C.cdPessoa = P.cdPessoa      '+
                'where P.dsAtivo = ''S'' and P.Ser = ''C'' and PJ.nmRazao <> ''''   '+
                'order by 1                                                         ';
    MontaComboListBoolADO(qryBuscar,cbxBusca);
    Open;
  end;
end;

procedure TfrmBuscaCliente.FormCreate(Sender: TObject);
begin
  MontaCNPJ;
end;

procedure TfrmBuscaCliente.rgBuscaClick(Sender: TObject);
begin
  cbxBusca.Clear;
  case rgBusca.ItemIndex of
    0: begin
         lblTitulo.Caption := 'CNPJ/CPF';
         MontaCNPJ;
       end;
    1: begin
         lblTitulo.Caption := 'Apelido';
         MontaApelido;
       end;
    2: begin
         lblTitulo.Caption := 'Código';
         MontaCodigo;
       end;
    3: begin
         lblTitulo.Caption := 'Razão Social';
         MontaComboRazaoSocial;
       end;
  end;
  cbxBusca.SetFocus;
end;

procedure TfrmBuscaCliente.cbxBuscaKeyPress(Sender: TObject;
  var Key: Char);
var
  encontrado : Boolean;
begin
  if key = #13 then
  begin
    encontrado := false;
    case rgBusca.ItemIndex of
      0: if qryBuscar.Locate('CGC', cbxBusca.Text, []) then
            encontrado := True;
      1: if qryBuscar.Locate('Apelido', cbxBusca.Text, []) then
            encontrado := True;
      2: if qryBuscar.Locate('cdPessoa', cbxBusca.Text,[]) then
            encontrado := True;
      3: if qryBuscar.Locate('nmRazao', cbxBusca.Text,[]) then
            encontrado := True;
    end;
    if encontrado then
    begin
      FrmPrincipalPreVenda.CbxCliente.ItemIndex := FrmPrincipalPreVenda.CbxCliente.Items.IndexOf(qryBuscar.FieldByName('nmpessoa').AsString + ' | ' + qryBuscar.FieldByName('cdpessoa').AsString);
      FrmPrincipalPreVenda.CbxClienteChange(FrmPrincipalPreVenda.CbxCliente);
      Close;
      FrmPrincipalPreVenda.CbxClienteExit(FrmPrincipalPreVenda.CbxCliente);
    end
    else
      MessageDlg('Cliente não encontrado!', mtInformation,[mbOk], 0);
  end
  else
  if key = #27 then
  begin
    Close;
  end;
end;

procedure TfrmBuscaCliente.PesquisarporCNPJCPF1Click(Sender: TObject);
begin
  rgBusca.ItemIndex := 0;
end;

procedure TfrmBuscaCliente.RazoSocial1Click(Sender: TObject);
begin
  rgBusca.ItemIndex := 3;
end;

procedure TfrmBuscaCliente.Pesquisarporapelido1Click(Sender: TObject);
begin
  rgBusca.ItemIndex := 1;
end;

procedure TfrmBuscaCliente.PesquisarporCdigo1Click(Sender: TObject);
begin
  rgBusca.ItemIndex := 2;
end;

end.
