unit FrmRelContagem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, CheckLst, DB, ADODB;

type
  TFrmContagem = class(TForm)
    Label2: TLabel;
    Label5: TLabel;
    CheckBox10: TCheckBox;
    CheckBox11: TCheckBox;
    CheckListBox1: TCheckListBox;
    RadioGroup2: TRadioGroup;
    CheckBox12: TCheckBox;
    CheckBox14: TCheckBox;
    CheckBox15: TCheckBox;
    RadioGroup5: TRadioGroup;
    BtnLista: TBitBtn;
    BtnMdImprimir: TBitBtn;
    BtnMdSair: TBitBtn;
    ADOQryGrupo: TADOQuery;
    CheckBox1: TCheckBox;
    procedure BtnListaClick(Sender: TObject);
    procedure BtnMdSairClick(Sender: TObject);
    procedure BtnMdImprimirClick(Sender: TObject);
    procedure RadioGroup2Click(Sender: TObject);
    procedure CheckListBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmContagem: TFrmContagem;

implementation

uses uFuncoesPadrao, RelContagem;

{$R *.dfm}

procedure TFrmContagem.BtnListaClick(Sender: TObject);
var i : Integer;
    vTexto : String;
begin
  With ADOQryGrupo do begin
    Sql.Clear;
    case RadioGroup2.ItemIndex of
      0: begin  // agrupar por grupo
        CheckListBox1.Sorted := True;
        Sql.Add('Select G.nmGrupo as Nomgrupo,G.cdGrupo as CodGrupo From Grupo G ');
        Sql.Add('Where G.nmGrupo <> ''Serviços'' Order By G.nmGrupo ');
        Open;
        CheckListBox1.Clear;
        CheckListBox1.Items.Add(' Marca/Desm. Todos');
        for i := 1 to RecordCount do begin  // monto os ítens da lista
           CheckListBox1.Items.Add(FieldByName('Nomgrupo').AsString);
           next;
        end;
      end;
      1: begin  // fabricante
        CheckListBox1.Sorted := True;
        Sql.Add('Select G.nmPessoa as Nomgrupo,G.cdPessoa as CodGrupo From Pessoa G ');
        Sql.Add('Inner Join Fornecedor F On G.cdPessoa = F.cdPessoa ');
        Sql.Add('Where F.dsFlag = ''S'' Order By G.nmPessoa ');
        Open;
        CheckListBox1.Clear;
        CheckListBox1.Items.Add(' Marca/Desm. Todos');
        for i := 1 to RecordCount do begin  // monto os ítens da lista
           CheckListBox1.Items.Add(FieldByName('Nomgrupo').AsString);
           next;
        end;
      end;
      2: Begin
         CheckListBox1.Sorted := False;
         Sql.Add('Select nmProduto, cdProduto from Produto ');
         Sql.Add('Order By 1                               ');
         Open;
         CheckListBox1.Clear;
         CheckListBox1.Items.Add(' Marca/Desm. Todos');
         for i := 1 to RecordCount do begin  // monto os ítens da lista
           vTexto := FieldByName('nmProduto').AsString;
           CheckListBox1.Items.Add(PreencheComSpace(vTexto,40) + ' - ' +
                               FormatFloat('00000',FieldByName('cdProduto').AsInteger));
           next;
        end;
      end;
      3: begin
         CheckListBox1.Sorted := True;
         Sql.Text := 'select distinct dsprateleira from produto '+
                     'where dsprateleira <> ltrim('''')         '+
                     'group by dsprateleira                     ';
         Open;
         CheckListBox1.Clear;
         CheckListBox1.Items.Add(' Marca/Desm. Todos');
         for i := 1 to RecordCount do begin  // monto os ítens da lista
            CheckListBox1.Items.Add(FieldByName('dsprateleira').AsString);
            next;
         end;
      end;
    end;
  end;
end;

procedure TFrmContagem.BtnMdSairClick(Sender: TObject);
begin
 Close;
end;

procedure TFrmContagem.BtnMdImprimirClick(Sender: TObject);
var
  L : integer;
  List_Cod_Grupo  : TStringList;
  vAspas : String[2];
  Grupos_Selecionados  : String; // armazena o codigo dos grupos selecionados na ListBox
  Grupos_Selecionados1 : String; // armazena o codigo dos grupos selecionados na ListBox
  Grupos_Selecionados2 : String; // armazena o codigo dos grupos selecionados na ListBox
  Grupos_Selecionados3 : String; // armazena o codigo dos grupos selecionados na ListBox

begin
  BtnMdImprimir.Enabled := False;
  with ADOQryGrupo do begin
    Sql.Clear;
    case RadioGroup2.ItemIndex of
      0: Sql.Text := 'Select G.nmGrupo as Nomgrupo,G.cdGrupo as CodGrupo From Grupo G ' +
                     'Where G.nmGrupo <> ''Serviços'' Order By G.nmGrupo '; //por grupo
      1: Sql.Text := 'Select G.nmPessoa,G.cdPessoa From Pessoa G ' + //fabricante
                     'Inner Join Fornecedor F On G.cdPessoa = F.cdPessoa  '+
                     'Where F.dsFlag = ''S'' Order By G.nmPessoa          ';
      2: Sql.Text := 'Select nmProduto, cdProduto from Produto Order By 2 ';
      3: Sql.Text := 'Select nmProduto, cdProduto from Produto Order By 1 ';
    end;
    Open;
  end;
  List_Cod_Grupo := TStringList.Create;
  for L := 0 to CheckListBox1.Items.Count -1 do begin
    if (L > 0) and (CheckListBox1.Checked[L] = True) then begin  // o indice 0 é a opção de marcar e desmarcar todos os grupos
      case RadioGroup2.ItemIndex of
        0: begin // grupo
          ADOQryGrupo.Locate('Nomgrupo',trim(CheckListBox1.items[L]),[]);    // localizo pelo nome do grupo que está na lista
          List_Cod_Grupo.Add(ADOQryGrupo.FieldByName('CodGrupo').AsString); // pego o codigo do grupo e adiciono na variavel de lista
        end;
        1: begin  // fabricante
          ADOQryGrupo.Locate('nmPessoa',Trim(CheckListBox1.items[L]),[]);    // localizo pelo nome do grupo que está na lista
          List_Cod_Grupo.Add(ADOQryGrupo.FieldByName('cdPessoa').AsString); // pego o codigo do grupo e adiciono na variavel de lista
        end;
        2: begin
          List_Cod_Grupo.Add(Copy(CheckListBox1.Items[L],44,5)); // Pega só o código do produto da linha da ListBox.
        end;
        3: begin
          List_Cod_Grupo.Add(CheckListBox1.Items[L]);
        end;
      end;
    end;
  end;
  ADOQryGrupo.Close;
  Grupos_Selecionados := '';  // limpo a variavel
  Grupos_Selecionados1 := '';  // limpo a variavel
  Grupos_Selecionados2 := '';  // limpo a variavel
  Grupos_Selecionados3 := '';  // limpo a variavel
  vAspas := '''';
  for L := 0 to 4999 do begin
    if L >= List_Cod_Grupo.Count then break;
    if L = 0 then begin
      if RadioGroup2.ItemIndex <> 3 then
        Grupos_Selecionados := List_Cod_Grupo[L]
        else Grupos_Selecionados := vAspas +List_Cod_Grupo[L] + vAspas;
    end
    else
     begin
      if RadioGroup2.ItemIndex <> 3 then
       Grupos_Selecionados := Grupos_Selecionados + ',' + List_Cod_Grupo[L]
       else Grupos_Selecionados := Grupos_Selecionados +','+ vAspas + List_Cod_Grupo[L] + vAspas;
    end;
  end;
  vAspas := '''';
  for L := 5000 to 9999 do begin
    if L >= List_Cod_Grupo.Count then break;
    if L = 5000 then begin
      if RadioGroup2.ItemIndex <> 3 then
        Grupos_Selecionados1 := List_Cod_Grupo[L]
        else Grupos_Selecionados1 := vAspas +List_Cod_Grupo[L] + vAspas;
    end
    else
     begin
      if RadioGroup2.ItemIndex <> 3 then
       Grupos_Selecionados1 := Grupos_Selecionados1 + ',' + List_Cod_Grupo[L]
       else Grupos_Selecionados1 := Grupos_Selecionados1 +','+ vAspas + List_Cod_Grupo[L] + vAspas;
    end;
  end;
  vAspas := '''';
  for L := 10000 to 14999 do begin
    if L >= List_Cod_Grupo.Count then break;
    if L = 10000 then begin
      if RadioGroup2.ItemIndex <> 3 then
        Grupos_Selecionados2 := List_Cod_Grupo[L]
        else Grupos_Selecionados2 := vAspas +List_Cod_Grupo[L] + vAspas;
    end
    else
     begin
      if RadioGroup2.ItemIndex <> 3 then
       Grupos_Selecionados2 := Grupos_Selecionados2 + ',' + List_Cod_Grupo[L]
       else Grupos_Selecionados2 := Grupos_Selecionados2 +','+ vAspas + List_Cod_Grupo[L] + vAspas;
    end;
  end;
  vAspas := '''';
  for L := 15000 to 20000 do begin
    if L >= List_Cod_Grupo.Count then break;
    if L = 15000 then begin
      if RadioGroup2.ItemIndex <> 3 then
        Grupos_Selecionados3 := List_Cod_Grupo[L]
        else Grupos_Selecionados3 := vAspas +List_Cod_Grupo[L] + vAspas;
    end
    else
     begin
      if RadioGroup2.ItemIndex <> 3 then
       Grupos_Selecionados3 := Grupos_Selecionados1 + ',' + List_Cod_Grupo[L]
       else Grupos_Selecionados3 := Grupos_Selecionados3 +','+ vAspas + List_Cod_Grupo[L] + vAspas;
    end;
  end;
  // verifica se existem grupos selecionados
  if Length(Grupos_Selecionados) = 0 then begin
    ShowMessage('Não existem grupos, fabricantes ou produtos selecionados!');
    exit;
  end;
  case RadioGroup2.ItemIndex of
    0: begin  // grupo
      RelContagemEstoque := TRelContagemEstoque.Create(Self);
      RelContagemEstoque.QRGroup2.Expression := 'AdoQryRelDados.nmGrupo';
      RelContagemEstoque.QREcdGrupo.Expression := 'AdoQryRelDados.nmGrupo';
      RelContagemEstoque.QRExpr10.Expression  := 'AdoQryRelDados.dsPrateleira';
      RelContagemEstoque.QRLabel10.Caption := 'Prateleira';
      With RelContagemEstoque.ADOQryRelDados do begin
        Sql.Text := 'Select Distinct P.cdProduto,P.cdFabricante,P.dsReferencia,P.NmProduto, '+
        'G.nmGrupo,P.dsEmbalagem,P.dsUnidade,P.dsPrateleira,                                '+
        'P.nrQtdReal,P.nrQtdMInima,S.nmPessoa,P.vlPreco as Preco                            '+
        'FROM Grupo G INNER JOIN (Produto P INNER JOIN Pessoa S ON                          '+
        'P.cdPessoa_1 = S.cdPessoa) ON G.cdgrupo = P.cdgrupo                                '+
        'Where P.cdGrupo in ('+Grupos_Selecionados+')                                       ';
        // Parameters.ParamByName('cdGrupo').Value := Grupos_Selecionados;
        if CheckBox11.Checked = true then
          Sql.Add('and P.dsAtivo = ''S'' ');
        if RadioGroup5.ItemIndex = 0 then
           Sql.Add('Order by G.nmGrupo, P.cdProduto')
          else
           Sql.Add('Order by G.nmGrupo, P.nmProduto')
      end;
    end;
    1: begin  // Fabricante
      RelContagemEstoque := TRelContagemEstoque.Create(Self);
      RelContagemEstoque.QRGroup2.Expression   := 'AdoQryRelDados.nmPessoa';
      RelContagemEstoque.QREcdGrupo.Expression := 'AdoQryRelDados.nmPessoa';
      RelContagemEstoque.QRExpr10.Expression   := 'AdoQryRelDados.dsPrateleira';
      RelContagemEstoque.QRLabel10.Caption     := 'Prateleira';
      With RelContagemEstoque.ADOQryRelDados do begin
        Sql.Text := 'Select Distinct P.cdProduto,P.cdFabricante,P.dsReferencia,P.NmProduto,            '+
                    'P.dsEmbalagem,P.dsUnidade,P.dsPrateleira,P.nrQtdReal,P.nrQtdMInima,S.nmPessoa,    '+
                    'P.vlPreco as Preco,G.nmGrupo                                                      '+
                    'FROM Pessoa S INNER JOIN (Grupo G INNER JOIN Produto P                            '+
                    'ON G.cdgrupo = P.cdgrupo) ON S.cdPessoa = P.cdPessoa_1                            '+
                    'Where P.cdPessoa_1 in ('+Grupos_Selecionados+')                                   ';
        if CheckBox11.Checked = true then
          Sql.Add('and P.dsAtivo = ''S'' ');
        if RadioGroup5.ItemIndex = 0 then
           Sql.Add('Order by S.nmPessoa, P.cdProduto')
          else
           Sql.Add('Order by S.nmPessoa, P.nmProduto')
      end;
    end;
    2: begin // Produtos
      RelContagemEstoque := TRelContagemEstoque.Create(Self);
      RelContagemEstoque.QRGroup2.Expression   := '';
      RelContagemEstoque.QREcdGrupo.Expression := '';
      RelContagemEstoque.QRExpr10.Expression   := 'AdoQryRelDados.dsPrateleira';
      RelContagemEstoque.QRLabel10.Caption     := 'Prateleira';
//        RelContagemEstoque := TRelContagemEstoque.Create(Self);
      if (List_Cod_Grupo.Count > 0) or (List_Cod_Grupo.Count <= 4999) then begin
          With RelContagemEstoque.ADOQryRelDados do begin
            Sql.Text := 'Select Distinct P.cdProduto,P.cdFabricante,P.dsReferencia,P.NmProduto, ' +
                        'P.dsEmbalagem,P.dsUnidade,P.dsPrateleira,                              ' +
                        'P.nrQtdReal,P.nrQtdMInima,S.nmPessoa,P.vlPreco as Preco,G.nmGrupo      ' +
                        'FROM Pessoa S INNER JOIN (Grupo G INNER JOIN Produto P                 ' +
                        'ON G.cdgrupo = P.cdgrupo) ON S.cdPessoa = P.cdPessoa_1                 ' +
                        'Where P.cdProduto in ('+Grupos_Selecionados+')                         ';
            if CheckBox11.Checked = true then
              Sql.Add('and  P.dsAtivo = ''S''');
            if RadioGroup5.ItemIndex = 0 then
               Sql.Add('Order by P.cdProduto')
              else
               Sql.Add('Order by P.nmProduto')
          end;
          RelContagemEstoque.ADOQryRelDados.open;
          if CheckBox10.Checked = true then
            RelContagemEstoque.QRExpr3.Enabled := true
          else
            RelContagemEstoque.QRExpr3.Enabled := False;
          if CheckBox14.Checked = true then
            RelContagemEstoque.QRExpr7.Enabled := true
          else
            RelContagemEstoque.QRExpr7.Enabled := False;
          if CheckBox15.Checked = true then
            RelContagemEstoque.QRExpr10.Enabled := true
          else
            RelContagemEstoque.QRExpr10.Enabled := false;
          RelContagemEstoque.ADOQryRelDados.Active := True;
          RelContagemEstoque.QRMdRel.Preview;
          RelContagemEstoque.Free;
        end;
        if (List_Cod_Grupo.Count >= 5000) or (List_Cod_Grupo.Count <= 9999)then begin
          RelContagemEstoque := TRelContagemEstoque.Create(Self);
          RelContagemEstoque.QRGroup2.Expression   := '';
          RelContagemEstoque.QREcdGrupo.Expression := '';
          RelContagemEstoque.QRExpr10.Expression   := 'AdoQryRelDados.dsPrateleira';
          RelContagemEstoque.QRLabel10.Caption     := 'Prateleira';
          With RelContagemEstoque.ADOQryRelDados do begin
            Sql.Text := 'Select Distinct P.cdProduto,P.cdFabricante,P.dsReferencia,P.NmProduto,' +
            'P.dsEmbalagem,P.dsUnidade,P.dsPrateleira,' +
            'P.nrQtdReal,P.nrQtdMInima,S.nmPessoa,P.vlPreco as Preco,G.nmGrupo ' +
            'FROM Pessoa S INNER JOIN (Grupo G INNER JOIN Produto P ' +
            'ON G.cdgrupo = P.cdgrupo) ON S.cdPessoa = P.cdPessoa_1 ' +
            'Where P.cdProduto in ('+Grupos_Selecionados1+') ';
            if CheckBox11.Checked = true then
              Sql.Add('and  P.dsAtivo = ''S''');
            if RadioGroup5.ItemIndex = 0 then
               Sql.Add('Order by P.cdProduto')
              else
               Sql.Add('Order by P.nmProduto')
          end;
          RelContagemEstoque.ADOQryRelDados.open;
          if CheckBox10.Checked = true then
            RelContagemEstoque.QRExpr3.Enabled := true
          else
            RelContagemEstoque.QRExpr3.Enabled := False;
          if CheckBox14.Checked = true then
            RelContagemEstoque.QRExpr7.Enabled := true
          else
            RelContagemEstoque.QRExpr7.Enabled := False;
          if CheckBox15.Checked = true then
            RelContagemEstoque.QRExpr10.Enabled := true
          else
            RelContagemEstoque.QRExpr10.Enabled := false;
          RelContagemEstoque.ADOQryRelDados.Active := True;
          RelContagemEstoque.QRMdRel.Preview;
          RelContagemEstoque.Free;
        end;
        if (List_Cod_Grupo.Count >= 10000) or (List_Cod_Grupo.Count <= 14999)  then begin
          RelContagemEstoque := TRelContagemEstoque.Create(Self);
          RelContagemEstoque.QRGroup2.Expression   := '';
          RelContagemEstoque.QREcdGrupo.Expression := '';
          RelContagemEstoque.QRExpr10.Expression   := 'AdoQryRelDados.dsPrateleira';
          RelContagemEstoque.QRLabel10.Caption     := 'Prateleira';
          With RelContagemEstoque.ADOQryRelDados do begin
            Sql.Text := 'Select Distinct P.cdProduto,P.cdFabricante,P.dsReferencia,P.NmProduto,' +
            'P.dsEmbalagem,P.dsUnidade,P.dsPrateleira,' +
            'P.nrQtdReal,P.nrQtdMInima,S.nmPessoa,P.vlPreco as Preco,G.nmGrupo ' +
            'FROM Pessoa S INNER JOIN (Grupo G INNER JOIN Produto P ' +
            'ON G.cdgrupo = P.cdgrupo) ON S.cdPessoa = P.cdPessoa_1 ' +
            'Where P.cdProduto in ('+Grupos_Selecionados2+') ';
            if CheckBox11.Checked = true then
              Sql.Add('and  P.dsAtivo = ''S''');
            if RadioGroup5.ItemIndex = 0 then
               Sql.Add('Order by P.cdProduto')
              else
               Sql.Add('Order by P.nmProduto')
          end;
          RelContagemEstoque.ADOQryRelDados.open;
          if CheckBox10.Checked = true then
            RelContagemEstoque.QRExpr3.Enabled := true
          else
            RelContagemEstoque.QRExpr3.Enabled := False;
          if CheckBox14.Checked = true then
            RelContagemEstoque.QRExpr7.Enabled := true
          else
            RelContagemEstoque.QRExpr7.Enabled := False;
          if CheckBox15.Checked = true then
            RelContagemEstoque.QRExpr10.Enabled := true
          else
            RelContagemEstoque.QRExpr10.Enabled := false;
          RelContagemEstoque.ADOQryRelDados.Active := True;
          RelContagemEstoque.QRMdRel.Preview;
          RelContagemEstoque.Free;
        end;
        if  (List_Cod_Grupo.Count >= 15000) and (List_Cod_Grupo.Count <= 20000) then begin
          RelContagemEstoque := TRelContagemEstoque.Create(Self);
          RelContagemEstoque.QRGroup2.Expression   := '';
          RelContagemEstoque.QREcdGrupo.Expression := '';
          RelContagemEstoque.QRExpr10.Expression   := 'AdoQryRelDados.dsPrateleira';
          RelContagemEstoque.QRLabel10.Caption     := 'Prateleira';
          With RelContagemEstoque.ADOQryRelDados do begin
            Sql.Text := 'Select Distinct P.cdProduto,P.cdFabricante,P.dsReferencia,P.NmProduto, ' +
                        'P.dsEmbalagem,P.dsUnidade,P.dsPrateleira,                              ' +
                        'P.nrQtdReal,P.nrQtdMInima,S.nmPessoa,P.vlPreco as Preco,G.nmGrupo      ' +
                        'FROM Pessoa S INNER JOIN (Grupo G INNER JOIN Produto P                 ' +
                        'ON G.cdgrupo = P.cdgrupo) ON S.cdPessoa = P.cdPessoa_1                 ' +
                        'Where P.cdProduto in ('+Grupos_Selecionados3+')                        ';
            if CheckBox11.Checked = true then
              Sql.Add('and  P.dsAtivo = ''S''');
            if RadioGroup5.ItemIndex = 0 then
               Sql.Add('Order by P.cdProduto')
              else
               Sql.Add('Order by P.nmProduto')
          end;
          RelContagemEstoque.ADOQryRelDados.open;
          if CheckBox10.Checked = true then
            RelContagemEstoque.QRExpr3.Enabled := true
          else
            RelContagemEstoque.QRExpr3.Enabled := False;

          if CheckBox14.Checked = true then
            RelContagemEstoque.QRExpr7.Enabled := true
          else
            RelContagemEstoque.QRExpr7.Enabled := False;
          if CheckBox15.Checked = true then
            RelContagemEstoque.QRExpr10.Enabled := true
          else
            RelContagemEstoque.QRExpr10.Enabled := false;
          RelContagemEstoque.ADOQryRelDados.Active := True;
          RelContagemEstoque.QRMdRel.Preview;
          RelContagemEstoque.Free;
        end;
    end;
    3: begin    // prateleira
      RelContagemEstoque := TRelContagemEstoque.Create(Self);
      RelContagemEstoque.QRGroup2.Expression   := 'AdoQryRelDados.dsPrateleira';
      RelContagemEstoque.QREcdGrupo.Expression := 'AdoQryRelDados.dsPrateleira';
      RelContagemEstoque.QRExpr10.Expression   := 'AdoQryRelDados.dsPrateleira';
      RelContagemEstoque.QRLabel10.Caption     := 'Prateleira';
      With RelContagemEstoque.ADOQryRelDados do begin
        Sql.Text := 'Select Distinct P.cdProduto,P.cdFabricante,P.dsReferencia,P.NmProduto,' +
        'P.dsEmbalagem,P.dsUnidade,P.dsPrateleira,                             ' +
        'P.nrQtdReal,P.nrQtdMInima,S.nmPessoa,P.vlPreco as Preco,G.nmGrupo     ' +
        'FROM Pessoa S INNER JOIN (Grupo G INNER JOIN Produto P                ' +
        'ON G.cdgrupo = P.cdgrupo) ON S.cdPessoa = P.cdPessoa_1                ' +
        'Where P.dsPrateleira in ('+Grupos_Selecionados+')                     ';
        if CheckBox11.Checked = True then
          Sql.Add('and P.dsAtivo = ''S'' ');
        Sql.Add('Order by P.dsPrateleira,S.nmPessoa, P.nmProduto ');
      end;
    end;
  end;
  if RadioGroup2.ItemIndex <> 2 then begin
    RelContagemEstoque.ADOQryRelDados.open;
    if CheckBox10.Checked = true then
      RelContagemEstoque.QRExpr3.Enabled := true
    else
      RelContagemEstoque.QRExpr3.Enabled := False;
    if CheckBox14.Checked = true then
      RelContagemEstoque.QRExpr7.Enabled  := true
    else
      RelContagemEstoque.QRExpr7.Enabled  := False;
    if CheckBox15.Checked = true then
      RelContagemEstoque.QRExpr10.Enabled := true
    else
      RelContagemEstoque.QRExpr10.Enabled    := false;
    RelContagemEstoque.ADOQryRelDados.Active := True;
    RelContagemEstoque.QRMdRel.Preview;
    RelContagemEstoque.Free;
  end;
  BtnMdImprimir.Enabled := True;
end;

procedure TFrmContagem.RadioGroup2Click(Sender: TObject);
begin
  BtnLista.Click;
end;

procedure TFrmContagem.CheckListBox1Click(Sender: TObject);
var
  i : integer;
begin
  if CheckListBox1.ItemIndex = 0 then begin  // verifica se o click foi no primeiro elemento da lista
    if CheckListBox1.Checked[0] = True then begin  // verifica se o primeiro elemento da lista está marcado
      for i := 1 to CheckListBox1.Items.Count - 1 do
        CheckListBox1.Checked[i] := True; // marca o elemento da lista
    end else begin
      for i := 1 to CheckListBox1.Items.Count - 1 do
        CheckListBox1.Checked[i] := False; // desmarca o elemento da lista
    end;
  end;
end;

end.
