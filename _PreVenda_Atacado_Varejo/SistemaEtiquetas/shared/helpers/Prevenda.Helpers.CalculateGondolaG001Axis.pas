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

end.
