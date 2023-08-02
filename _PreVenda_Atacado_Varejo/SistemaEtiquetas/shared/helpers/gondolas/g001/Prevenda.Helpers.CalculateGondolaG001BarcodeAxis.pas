unit Prevenda.Helpers.CalculateGondolaG001BarcodeAxis;

interface

uses
  System.SysUtils,

  Prevenda.Utils.ConfigurationFileReader;

type
  TGondolaG001BarcodeCalcs = class
    private
    public
      function GetG001BarcodeSymbolXValue: string;
      function GetG001BarcodeSymbolYValue: string;
      function GetG001BarcodeValueXValue: string;
      function GetG001BarcodeValueYValue: string;

  end;

implementation

{ TGondolaG001BarcodeCalcs }

uses
  Prevenda.Constants.GondolaG001;



function TGondolaG001BarcodeCalcs.GetG001BarcodeSymbolXValue: string;

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



function TGondolaG001BarcodeCalcs.GetG001BarcodeSymbolYValue: string;


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





function TGondolaG001BarcodeCalcs.GetG001BarcodeValueXValue: string;

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



function TGondolaG001BarcodeCalcs.GetG001BarcodeValueYValue: string;

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

end.
