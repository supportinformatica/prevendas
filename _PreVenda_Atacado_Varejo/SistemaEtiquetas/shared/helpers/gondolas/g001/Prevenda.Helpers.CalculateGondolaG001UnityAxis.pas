unit Prevenda.Helpers.CalculateGondolaG001UnityAxis;

interface

uses
  System.SysUtils,

  Prevenda.Utils.ConfigurationFileReader;

type
  TGondolaG001UnityCalcs = class
    private
    public
      function GetG001UnityXValue: string;
      function GetG001UnityYValue: string;

  end;

implementation

{ TGondolaG001UnityCalcs }

uses
  Prevenda.Constants.GondolaG001;


function TGondolaG001UnityCalcs.GetG001UnityXValue: string;

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





function TGondolaG001UnityCalcs.GetG001UnityYValue: string;

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
