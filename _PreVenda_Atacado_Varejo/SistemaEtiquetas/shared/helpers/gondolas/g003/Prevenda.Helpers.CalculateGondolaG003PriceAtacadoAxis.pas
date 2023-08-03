unit Prevenda.Helpers.CalculateGondolaG003PriceAtacadoAxis;

interface

uses
  System.SysUtils,

  Prevenda.Utils.ConfigurationFileReader;

type
  TGondolaG003PriceAtacadoCalcs = class
    private
    public
      function GetG003PriceLabelXValue: string;
      function GetG003PriceLabelYValue: string;
      function GetG003PriceValueXValue: string;
      function GetG003PriceValueYValue: string;
  end;

implementation

{ TGondolaG003PriceAtacadoCalcs }

uses
  Prevenda.Constants.GondolaG003;


function TGondolaG003PriceAtacadoCalcs.GetG003PriceLabelXValue: string;

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



function TGondolaG003PriceAtacadoCalcs.GetG003PriceLabelYValue: string;

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



function TGondolaG003PriceAtacadoCalcs.GetG003PriceValueXValue: string;

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



function TGondolaG003PriceAtacadoCalcs.GetG003PriceValueYValue: string;

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
