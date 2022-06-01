unit FrmPrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, jpeg, ComCtrls, ToolWin, Menus, StdCtrls, Buttons, ImgList, Db,
  DBTables,MoPreVenda, System.ImageList;

// Vetor com espaços para 7 colunas (TAG,N,A,E,V,I,B) e 60 opções do menu
type
  VetorPermissao = Array[1..70,1..7] of String;

type
  TFormPrincipal = class(TForm)
    TBarFrmPrincpal: TToolBar;
    StBPrincipal: TStatusBar;
    MmPrincipal: TMainMenu;
    Mi: TMenuItem;
    MiMovimento: TMenuItem;
    MiConsultas: TMenuItem;
    MiRelatorios: TMenuItem;
    MiJanela: TMenuItem;
    MiAjuda: TMenuItem;
    MiParametros: TMenuItem;
    MiGrupos: TMenuItem;
    MiEstados: TMenuItem;
    MiCustos: TMenuItem;
    N1: TMenuItem;
    MiFornecedores: TMenuItem;
    MiFuncio: TMenuItem;
    N2: TMenuItem;
    MiProdutos: TMenuItem;
    N3: TMenuItem;
    MiSair: TMenuItem;
    MiEntradas: TMenuItem;
    MiSaidas: TMenuItem;
    N4: TMenuItem;
    MiUtilitrios: TMenuItem;
    MiPagar: TMenuItem;
    MiReceber: TMenuItem;
    N5: TMenuItem;
    MiControle: TMenuItem;
    MiConFinanceiro: TMenuItem;
    MiEntrada: TMenuItem;
    MiSaida: TMenuItem;
    N7: TMenuItem;
    MiExCliente: TMenuItem;
    miGerenciais: TMenuItem;
    MiComissoes: TMenuItem;
    MiLLHorizontalmente: TMenuItem;
    MiLLVerticalmente1: TMenuItem;
    MiCascata: TMenuItem;
    MiSenhas: TMenuItem;
    MiAumento: TMenuItem;
    N9: TMenuItem;
    MiCaixa: TMenuItem;
    ImgListPrincipal: TImageList;
    TButonCliente: TToolButton;
    TButonFornecedor: TToolButton;
    ToolButton3: TToolButton;
    TButonEntrada: TToolButton;
    TButonSaida: TToolButton;
    ToolButton7: TToolButton;
    TButonPrecos: TToolButton;
    TButonProdutos: TToolButton;
    MiClientes: TMenuItem;
    MiCargos: TMenuItem;
    MiCartao: TMenuItem;
    MiCheque: TMenuItem;
    Sobre1: TMenuItem;
    ToolButton1: TToolButton;
    MiComparativo: TMenuItem;
    MiFiliais: TMenuItem;
    N6: TMenuItem;
    MiBancos: TMenuItem;
    MiContas: TMenuItem;
    BtnSair: TToolButton;
    ToolButton4: TToolButton;
    MiUsuario: TMenuItem;
    ToolButton6: TToolButton;
    N8: TMenuItem;
    miBancario: TMenuItem;
    MiCancelamento: TMenuItem;
    MiAniversario: TMenuItem;
    N10: TMenuItem;
    MiEstFin: TMenuItem;
    MiOrcamentos: TMenuItem;
    N11: TMenuItem;
    Mietiqueta: TMenuItem;
    ToolButton2: TToolButton;
    N12: TMenuItem;
    MiEstPeriodo: TMenuItem;
    N15: TMenuItem;
    MiPedidoCompra: TMenuItem;
    MiConsignacao: TMenuItem;
    MiUtGerenciais: TMenuItem;
    miCredito: TMenuItem;
    ToolButton9: TToolButton;
    MiReimpressao: TMenuItem;
    N13: TMenuItem;
    miRelDinamica: TMenuItem;
    miABC: TMenuItem;
    MiManuCadastro: TMenuItem;
    MiConfigurar: TMenuItem;
    MiRecibo: TMenuItem;
    N14: TMenuItem;
    Midespesas: TMenuItem;
    MiReceitas: TMenuItem;
    MiSaidasA: TMenuItem;
    MiSaidasS: TMenuItem;
    MiImpChe: TMenuItem;
    ToolButton8: TToolButton;
    miGeraArqTexto: TMenuItem;
    BtnCheque: TToolButton;
    BtnOrcamento: TToolButton;
    MiDuplicata: TMenuItem;
    miBloquete: TMenuItem;
    MiLucratividade: TMenuItem;
    MiAliquotas: TMenuItem;
    N16: TMenuItem;
    BtnCaixa: TToolButton;
    MiOrcamento: TMenuItem;
    MiOrcamentoC: TMenuItem;
    MiLancto: TMenuItem;
    MiTipodeCliente: TMenuItem;
    ToolButton10: TToolButton;
    MiConPedido: TMenuItem;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    MiTelemarketing: TMenuItem;
    ToolButton5: TToolButton;
    MiNotas: TMenuItem;
    ToolButton13: TToolButton;
    MiTransportadora: TMenuItem;
    MiProjeodevendas1: TMenuItem;
    MiRelContador: TMenuItem;
    MiSintegraDIC: TMenuItem;
    MiPisCofins: TMenuItem;
    miCdEquipamento: TMenuItem;
    MiOrdemServico: TMenuItem;
    miRequisicao: TMenuItem;
    procedure MiSairClick(Sender: TObject);
    procedure MiLLHorizontalmenteClick(Sender: TObject);
    procedure MiLLVerticalmente1Click(Sender: TObject);
    procedure MiCascataClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ProcessaMsg (var Msg: Tmsg; var Handled: Boolean);
    procedure NaoProcessaMsg (var Msg: Tmsg; var Handled: Boolean);
    procedure MiOrcamentosClick(Sender: TObject);
    procedure DisplayHint(Sender: TObject);
    { usada para ativar a tecla enter nos formularios como tab }
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPrincipal: TFormPrincipal;
// variáveis de configuração do sistema.  Usadas no FrmPedeSenha
  vLimiteCredito: Real;   // pega o limite de credito padrao para o cadastro de cliente
  cdOperador: String[04];  // codigo na tabela de pessoa do funcionario que loga
  vdtBloqueio:Integer;  // data para bloquear as documentos vencidos
  vJurosCobrado,vPorcDesconto:Real; // porcentagem padrao de juros cobrado & pega a porcentagem padrao de desconto
  vEscolheProduto : String[01];  // verifica se abilita a combo da descrição dos produtos
  vSenhaLiberacao:String[08];  // pega a senha para liberação das vendas
  vEstqNegativo:String[01];  // vender com estoque negativo ?
  vLimCredito:String[01];  // vender com teste do limite de credito ?
  vCheqDev:String[01];  // vender a clientes com cheques devolvidos ?
  vImprimePedido : String[01];  // impressao de pedido após a venda
  vVetor: VetorPermissao;
  vPROXY : string;  // proxy usado na dll se tiver
  vUsuarioProxy : string; // usuario usado na dll se tiver
  vSenhaProxy : string; // senha usado na dll se tiver
  vCidade:String[30];     // pega o nome da cidade para utilizar no recibo
  vAidfEmpresa : string[09];  // n° da AIDF da própria empresa
  vMudaPreco : String[01];   // saso seja S o preço de venda é liberado para alteração no ato da venda
  vData_Banco  : String[10];
  vIpFTP, vDsUsuarioFTP, vDsSenhaFTP: String;
  bloquearChave, finalizouThreadBloqueio: Boolean;

implementation

uses FrmCadEstados, uFuncoesPadrao, DataModulo;
{$R *.DFM}

procedure TFormPrincipal.DisplayHint(Sender: TObject);
begin
  StbPrincipal.Panels[1].Text := GetLongHint(Application.Hint);
end;

procedure TFormPrincipal.ProcessaMsg;
begin
  if Msg.message = WM_KEYDOWN then
    if Msg.wParam = VK_RETURN then begin
      Keybd_event (VK_TAB,0,0,0);
    end;
end;

Procedure TFormPrincipal.NaoProcessaMsg;
begin
  if Msg.message = WM_KEYDOWN then
    if Msg.wParam = VK_RETURN then begin
  //  Keybd_event (VK_TAB,0,0,0);
    end;
end;

procedure TFormPrincipal.MiSairClick(Sender: TObject);
begin
  close;
end;

procedure TFormPrincipal.MiLLHorizontalmenteClick(Sender: TObject);
begin
  Tilemode:=TbHorizontal;
  Tile;
  MiLLHorizontalmente.Checked := True;
  MiLLVerticalmente1.Checked := False;
  MiCascata.Checked := False;
end;

procedure TFormPrincipal.MiLLVerticalmente1Click(Sender: TObject);
begin
  Tilemode:=TbVertical;
  Tile;
  MiLLHorizontalmente.Checked := False;
  MiLLVerticalmente1.Checked := True;
  MiCascata.Checked := False;
end;

procedure TFormPrincipal.MiCascataClick(Sender: TObject);
begin
  Cascade;
  MiLLHorizontalmente.Checked := False;
  MiLLVerticalmente1.Checked := False;
  MiCascata.Checked := True;
end;

procedure TFormPrincipal.FormCreate(Sender: TObject);
begin
  Application.OnMessage := ProcessaMsg;
  Application.OnHint := DisplayHint;
end;

procedure TFormPrincipal.MiOrcamentosClick(Sender: TObject);
begin
//  if Permissao('47','V') = 'N' then Exit;
end;

end.
