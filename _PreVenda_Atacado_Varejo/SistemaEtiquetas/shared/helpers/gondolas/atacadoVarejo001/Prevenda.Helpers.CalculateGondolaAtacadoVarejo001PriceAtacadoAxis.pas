unit Prevenda.Helpers.CalculateGondolaAtacadoVarejo001PriceAtacadoAxis;

interface

uses
  System.SysUtils,

  Prevenda.Utils.ConfigurationFileReader;

type
  TGondolaAtacadoVarejo001PriceAtacadoCalcs = class
    private
    public
      function GetAtacadoVarejoPriceLabelXValue: string;
      function GetAtacadoVarejoPricePriceLabelYValue: string;
      function GetAtacadoVarejoPricePriceValueXValue: string;
      function GetAtacadoVarejoPricePriceValueYValue: string;
  end;

implementation

{ TGondolaAtacadoVarejo001PriceAtacadoCalcs }

uses
  Prevenda.Constants.GondolaG003;


function TGondolaAtacadoVarejo001PriceAtacadoCalcs.GetAtacadoVarejoPriceLabelXValue: string;

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



function TGondolaAtacadoVarejo001PriceAtacadoCalcs.GetAtacadoVarejoPricePriceLabelYValue: string;

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



function TGondolaAtacadoVarejo001PriceAtacadoCalcs.GetAtacadoVarejoPricePriceValueXValue: string;

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



function TGondolaAtacadoVarejo001PriceAtacadoCalcs.GetAtacadoVarejoPricePriceValueYValue: string;

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
