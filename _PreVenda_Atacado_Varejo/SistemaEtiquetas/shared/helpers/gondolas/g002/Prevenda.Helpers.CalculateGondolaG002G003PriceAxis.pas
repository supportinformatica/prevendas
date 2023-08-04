unit Prevenda.Helpers.CalculateGondolaG002G003PriceAxis;

interface

uses
  System.SysUtils,

  Prevenda.Utils.ConfigurationFileReader;

type
  TGondolaG002G003PriceCalcs = class
    private
    public
      function GetG002G003PriceLabelXValue: string;
      function GetG002G003PriceLabelYValue: string;
      function GetG002G003PriceValueXValue: string;
      function GetG002G003PriceValueYValue: string;
  end;

implementation

{ TGondolaG002PriceCalcs }

uses
  Prevenda.Constants.GondolaG002G003;

function TGondolaG002G003PriceCalcs.GetG002G003PriceLabelXValue: string;

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

  result := (PRICE_LABEL_X_DEFAULT + ExternalOffset).ToString;

end;



function TGondolaG002G003PriceCalcs.GetG002G003PriceLabelYValue: string;

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

  result := (PRICE_LABEL_Y_DEFAULT + ExternalOffset).ToString;

end;






function TGondolaG002G003PriceCalcs.GetG002G003PriceValueXValue: string;

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

  result := (PRICE_VALUE_X_DEFAULT + ExternalOffset).ToString;

end;



function TGondolaG002G003PriceCalcs.GetG002G003PriceValueYValue: string;

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

  result := (PRICE_VALUE_Y_DEFAULT + ExternalOffset).ToString;

end;

end.
