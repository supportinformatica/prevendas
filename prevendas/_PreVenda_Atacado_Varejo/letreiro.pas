unit letreiro;

interface

uses
  Windows, Messages, SysUtils, Classes, Controls, StdCtrls, ExtCtrls;

type
  Tletreiro = class(TStaticText)
  private
    { Private declarations }
    FTimer : TTimer;
    procedure UpdateText(Sender : TObject);
    function GetActive: boolean;
    function GetDelay: Cardinal;
    procedure SetActive(const Value: boolean);
    procedure SetDelay(const Value: Cardinal);
  protected
    { Protected declarations }
  public
    { Public declarations }
    constructor Create(AOwner : TComponent);override;
  published
    { Published declarations }
    property Active : boolean read GetActive write SetActive default true;
    property Delay : Cardinal read GetDelay write SetDelay default 200;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Aprendendo Delphi 7', [Tletreiro]);
end;

{ Tletreiro }

constructor Tletreiro.Create(AOwner: TComponent);
begin
  inherited;
  FTimer := TTimer.Create(AOwner);
  FTimer.Enabled := true;
  FTimer.Interval := 200;
  FTimer.OnTimer := UpdateText;
end;

function Tletreiro.GetActive: boolean;
begin
  Result := FTimer.Enabled;
end;

function Tletreiro.GetDelay: Cardinal;
begin
  Result := FTimer.Interval;
end;

procedure Tletreiro.SetActive(const Value: boolean);
begin
  if (Value <> FTimer.Enabled) then
    FTimer.Enabled := Value;
end;

procedure Tletreiro.SetDelay(const Value: Cardinal);
begin
  if (Value <> FTimer.Interval) then
    FTimer.Interval := Value;
end;

procedure Tletreiro.UpdateText(Sender: TObject);
begin
  caption := copy(caption,2,length(caption))+caption[1];
end;

end.
