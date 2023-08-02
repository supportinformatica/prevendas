unit Prevenda.Helpers.CalculateGondolaG002PriceAxis;

interface

uses
  System.SysUtils,

  Prevenda.Utils.ConfigurationFileReader;

type
  TGondolaG002PriceCalcs = class
    private
    public
      function GetG002PriceLabelXValue: string;
      function GetG002PriceLabelYValue: string;
      function GetG002PriceValueXValue: string;
      function GetG002PriceValueYValue: string;
  end;

implementation

{ TGondolaG002PriceCalcs }

uses
  Prevenda.Constants.GondolaG002;

function TGondolaG002PriceCalcs.GetG002PriceLabelXValue: string;

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



function TGondolaG002PriceCalcs.GetG002PriceLabelYValue: string;

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






function TGondolaG002PriceCalcs.GetG002PriceValueXValue: string;

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



function TGondolaG002PriceCalcs.GetG002PriceValueYValue: string;

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
