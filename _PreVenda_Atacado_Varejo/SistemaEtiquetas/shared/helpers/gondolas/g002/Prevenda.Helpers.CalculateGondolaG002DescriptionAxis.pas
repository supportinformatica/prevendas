unit Prevenda.Helpers.CalculateGondolaG002DescriptionAxis;

interface

uses
  System.SysUtils,

  Prevenda.Utils.ConfigurationFileReader;

type
  TGondolaG002DescriptionCalcs = class
    private
    public
      function GetG002DescriptionXValue: string;
      function GetG002DescriptionYValue: string;
  end;
implementation

{ TGondolaG002DescriptionCalcs }


uses
  Prevenda.Constants.GondolaG002;


function TGondolaG002DescriptionCalcs.GetG002DescriptionXValue: string;

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



function TGondolaG002DescriptionCalcs.GetG002DescriptionYValue: string;

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
