unit Prevenda.Helpers.CalculateGondolaG003PriceVarejoAxis;

interface

uses
  System.SysUtils,

  Prevenda.Utils.ConfigurationFileReader;

type
  TGondolaG003PriceVarejoCalcs = class
    private
    public
      function GetG003PriceLabelXValue: string;
      function GetG003PriceLabelYValue: string;
      function GetG003PriceValueXValue: string;
      function GetG003PriceValueYValue: string;
  end;

implementation

{ TGondolaG003PriceCalcs }

uses
  Prevenda.Constants.GondolaG003;


function TGondolaG003PriceVarejoCalcs.GetG003PriceLabelXValue: string;

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

  result := (PRICE_VAREJO_LABEL_X_DEFAULT + ExternalOffset).ToString;

end;



function TGondolaG003PriceVarejoCalcs.GetG003PriceLabelYValue: string;

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

  result := (PRICE_VAREJO_LABEL_Y_DEFAULT + ExternalOffset).ToString;

end;



function TGondolaG003PriceVarejoCalcs.GetG003PriceValueXValue: string;

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

  result := (PRICE_VAREJO_VALUE_X_DEFAULT + ExternalOffset).ToString;

end;



function TGondolaG003PriceVarejoCalcs.GetG003PriceValueYValue: string;

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

  result := (PRICE_VAREJO_VALUE_Y_DEFAULT + ExternalOffset).ToString;

end;

end.
