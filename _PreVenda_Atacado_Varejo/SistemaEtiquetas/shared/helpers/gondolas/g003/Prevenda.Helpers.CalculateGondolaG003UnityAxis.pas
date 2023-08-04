unit Prevenda.Helpers.CalculateGondolaG003UnityAxis;

interface

uses
  System.SysUtils,

  Prevenda.Utils.ConfigurationFileReader;

type
  TGondolaG003UnityCalcs = class
    private
    public
      function GetG003UnityXValue: string;
      function GetG003UnityYValue: string;
  end;

implementation

{ TGondolaG00UnityCalcs }

uses
  Prevenda.Constants.GondolaG002G003;


function TGondolaG003UnityCalcs.GetG003UnityXValue: string;

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


function TGondolaG003UnityCalcs.GetG003UnityYValue: string;

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
