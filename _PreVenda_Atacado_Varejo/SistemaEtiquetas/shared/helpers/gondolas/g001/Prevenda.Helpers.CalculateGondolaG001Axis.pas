unit Prevenda.Helpers.CalculateGondolaG001Axis;

interface

uses
  System.SysUtils,

  Prevenda.Utils.ConfigurationFileReader;

type
  TGondolaG001Calcs = class
    private
    public
      function GetG001DescriptionXValue: string;
      function GetG001DescriptionYValue: string;

      function GetG001UnityXValue: string;
      function GetG001UnityYValue: string;

      function GetG001BarcodeSymbolXValue: string;
      function GetG001BarcodeSymbolYValue: string;
      function GetG001BarcodeValueXValue: string;
      function GetG001BarcodeValueYValue: string;

      function GetG001PriceSymbolXValue: string;
      function GetG001PriceSymbolYValue: string;
      function GetG001PriceValueXValue: string;
      function GetG001PriceValueYValue: string;
  end;

implementation

{ TGondolaG001Calcs }

uses
  Prevenda.Constants.GondolaG001;


function TGondolaG001Calcs.GetG001DescriptionXValue: string;

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

  result := (DESCRIPTION_X_DEFAULT + ExternalOffset).ToString;
end;


function TGondolaG001Calcs.GetG001DescriptionYValue: string;

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

  result := (DESCRIPTION_Y_DEFAULT + ExternalOffset).ToString;
end;




function TGondolaG001Calcs.GetG001UnityXValue: string;

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

  result := (UNITY_X_DEFAULT + ExternalOffset).ToString;
end;



function TGondolaG001Calcs.GetG001UnityYValue: string;

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

  result := (UNITY_Y_DEFAULT + ExternalOffset).ToString;
end;




function TGondolaG001Calcs.GetG001BarcodeSymbolXValue: string;

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

  result := (BARCODE_SYMBOL_X_DEFAULT + ExternalOffset).ToString;
end;



function TGondolaG001Calcs.GetG001BarcodeSymbolYValue: string;


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

  result := (BARCODE_SYMBOL_Y_DEFAULT + ExternalOffset).ToString;
end;





function TGondolaG001Calcs.GetG001BarcodeValueXValue: string;

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

  result := (BARCODE_VALUE_X_DEFAULT + ExternalOffset).ToString;
end;



function TGondolaG001Calcs.GetG001BarcodeValueYValue: string;

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

  result := (BARCODE_VALUE_Y_DEFAULT + ExternalOffset).ToString;
end;





function TGondolaG001Calcs.GetG001PriceSymbolXValue: string;

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



function TGondolaG001Calcs.GetG001PriceSymbolYValue: string;

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





function TGondolaG001Calcs.GetG001PriceValueXValue: string;

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

function TGondolaG001Calcs.GetG001PriceValueYValue: string;

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
