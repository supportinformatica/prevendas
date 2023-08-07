unit Prevenda.Helpers.CalculateGondolaG002G003UnityAxis;

interface

uses
  System.SysUtils,

  Prevenda.Utils.ConfigurationFileReader;

type
  TGondolaG002G003UnityCalcs = class
    private
    public
      function GetG002G003UnityXValue: string;
      function GetG002G003UnityYValue: string;
  end;

implementation

{ TGondolaG002UnityCalcs }

uses
  Prevenda.Constants.GondolaAtacadoVarejo001;

function TGondolaG002G003UnityCalcs.GetG002G003UnityXValue: string;

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



function TGondolaG002G003UnityCalcs.GetG002G003UnityYValue: string;

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

end.
