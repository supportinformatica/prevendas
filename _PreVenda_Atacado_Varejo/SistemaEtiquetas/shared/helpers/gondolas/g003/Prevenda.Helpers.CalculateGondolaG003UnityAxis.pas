unit Prevenda.Helpers.CalculateGondolaG003UnityAxis;

interface

uses
  System.SysUtils,

  Prevenda.Utils.ConfigurationFileReader;

type
  TGondolaG00UnityCalcs = class
    private
    public
      function GetG003UnityXValue: string;
      function GetG003UnityYValue: string;
  end;

implementation

{ TGondolaG00UnityCalcs }

uses
  Prevenda.Constants.GondolaG002;


function TGondolaG00UnityCalcs.GetG003UnityXValue: string;

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


function TGondolaG00UnityCalcs.GetG003UnityYValue: string;

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
