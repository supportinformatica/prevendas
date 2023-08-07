unit Prevenda.Helpers.CalculateGondolaG002G003DescriptionAxis;

interface

uses
  System.SysUtils,

  Prevenda.Utils.ConfigurationFileReader;

type
  TGondolaG002G003DescriptionCalcs = class
    private
    public
      function GetG002G003DescriptionXValue: string;
      function GetG002G003DescriptionYValue: string;
  end;

implementation

{ TGondolaG002DescriptionCalcs }


uses
  Prevenda.Constants.GondolaAtacadoVarejo001;


function TGondolaG002G003DescriptionCalcs.GetG002G003DescriptionXValue: string;

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



function TGondolaG002G003DescriptionCalcs.GetG002G003DescriptionYValue: string;

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
