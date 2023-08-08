unit Prevenda.Helpers.CalculateGondolaG003DescriptionAxis;

interface

uses
  System.SysUtils,

  Prevenda.Utils.ConfigurationFileReader;

type
  TGondolaG003DescriptionCalcs = class
    private
    public
      function GetG003DescriptionXValue: string;
      function GetG003DescriptionYValue: string;

  end;

implementation

{ TGondolaG003DescriptionCalcs }

uses
  Prevenda.Constants.GondolaG003;



function TGondolaG003DescriptionCalcs.GetG003DescriptionXValue: string;

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



function TGondolaG003DescriptionCalcs.GetG003DescriptionYValue: string;

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

end.
