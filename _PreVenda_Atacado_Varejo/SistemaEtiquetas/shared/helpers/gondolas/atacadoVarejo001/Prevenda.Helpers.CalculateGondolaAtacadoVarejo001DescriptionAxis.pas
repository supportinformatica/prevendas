unit Prevenda.Helpers.CalculateGondolaAtacadoVarejo001DescriptionAxis;

interface

uses
  System.SysUtils,

  Prevenda.Utils.ConfigurationFileReader;

type
  TGondolaAtacadoVarejo001DescriptionCalcs = class
    private
    public
      function GetDescriptionValueDataX: string;
      function GetDescriptionValueDataY: string;
  end;

implementation

{ TGondolaAtacadoVarejo001DescriptionCalcs }


uses
  Prevenda.Constants.GondolaAtacadoVarejo001;


function TGondolaAtacadoVarejo001DescriptionCalcs.GetDescriptionValueDataX: string;

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



function TGondolaAtacadoVarejo001DescriptionCalcs.GetDescriptionValueDataY: string;

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
