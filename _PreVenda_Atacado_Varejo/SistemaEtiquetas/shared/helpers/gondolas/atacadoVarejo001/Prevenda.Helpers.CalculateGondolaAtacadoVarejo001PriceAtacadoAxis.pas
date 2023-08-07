unit Prevenda.Helpers.CalculateGondolaAtacadoVarejo001PriceAtacadoAxis;

interface

uses
  System.SysUtils,

  Prevenda.Utils.ConfigurationFileReader;

type
  TGondolaAtacadoVarejo001PriceAtacadoCalcs = class
    private
    public
      function GetPriceLabelTextX: string;
      function GetPriceLabelTextY: string;
      function GetPriceValueDataX: string;
      function GetPriceValueDataY: string;
  end;

implementation

{ TGondolaAtacadoVarejo001PriceAtacadoCalcs }

uses
  Prevenda.Constants.GondolaG003;


function TGondolaAtacadoVarejo001PriceAtacadoCalcs.GetPriceLabelTextX: string;

var
  Config: TConfigurationFileReader;

  ExternalOffset: integer;

begin
  Config := TConfigurationFileReader.Create;

  try

    ExternalOffset := Config.ReadOffsetXFromConfigurationFile;

  finally

    Config.Free;

  end;

  result := (PRICE_ATACADO_LABEL_X_DEFAULT + ExternalOffset).ToString;

end;



function TGondolaAtacadoVarejo001PriceAtacadoCalcs.GetPriceLabelTextY: string;

var
  Config: TConfigurationFileReader;

  ExternalOffset: integer;

begin
  Config := TConfigurationFileReader.Create;

  try

    ExternalOffset := Config.ReadOffsetYFromConfigurationFile;

  finally

    Config.Free;

  end;

  result := (PRICE_ATACADO_LABEL_Y_DEFAULT + ExternalOffset).ToString;

end;



function TGondolaAtacadoVarejo001PriceAtacadoCalcs.GetPriceValueDataX: string;

var
  Config: TConfigurationFileReader;

  ExternalOffset: integer;

begin
  Config := TConfigurationFileReader.Create;

  try

    ExternalOffset := Config.ReadOffsetXFromConfigurationFile;

  finally

    Config.Free;

  end;

  result := (PRICE_ATACADO_VALUE_X_DEFAULT + ExternalOffset).ToString;

end;



function TGondolaAtacadoVarejo001PriceAtacadoCalcs.GetPriceValueDataY: string;

var
  Config: TConfigurationFileReader;

  ExternalOffset: integer;

begin
  Config := TConfigurationFileReader.Create;

  try

    ExternalOffset := Config.ReadOffsetYFromConfigurationFile;

  finally

    Config.Free;

  end;

  result := (PRICE_ATACADO_VALUE_Y_DEFAULT + ExternalOffset).ToString;

end;

end.
