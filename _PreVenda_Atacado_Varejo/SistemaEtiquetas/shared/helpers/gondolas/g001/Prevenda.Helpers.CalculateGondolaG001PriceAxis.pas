unit Prevenda.Helpers.CalculateGondolaG001PriceAxis;

interface

uses
  System.SysUtils,

  Prevenda.Utils.ConfigurationFileReader;

type
  TGondolaG001PriceCalcs = class
    private
    public
      function GetG001PriceSymbolXValue: string;
      function GetG001PriceSymbolYValue: string;
      function GetG001PriceValueXValue: string;
      function GetG001PriceValueYValue: string;
  end;

implementation

{ TGondolaG001PriceCalcs }

uses
  Prevenda.Constants.GondolaG001;

function TGondolaG001PriceCalcs.GetG001PriceSymbolXValue: string;

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

  result := (PRICE_SYMBOL_X_DEFAULT + ExternalOffset).ToString;
end;



function TGondolaG001PriceCalcs.GetG001PriceSymbolYValue: string;

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

  result := (PRICE_SYMBOL_Y_DEFAULT + ExternalOffset).ToString;
end;






function TGondolaG001PriceCalcs.GetG001PriceValueXValue: string;

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

function TGondolaG001PriceCalcs.GetG001PriceValueYValue: string;



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
