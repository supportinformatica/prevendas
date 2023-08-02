unit Prevenda.Helpers.CalculateGondolaG002UnityAxis;

interface

uses
  System.SysUtils,

  Prevenda.Utils.ConfigurationFileReader;

type
  TGondolaG002UnityCalcs = class
    private
    public
      function GetG002UnityXValue: string;
      function GetG002UnityYValue: string;
  end;

implementation

{ TGondolaG002UnityCalcs }

uses
  Prevenda.Constants.GondolaG002;

function TGondolaG002UnityCalcs.GetG002UnityXValue: string;

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



function TGondolaG002UnityCalcs.GetG002UnityYValue: string;

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
