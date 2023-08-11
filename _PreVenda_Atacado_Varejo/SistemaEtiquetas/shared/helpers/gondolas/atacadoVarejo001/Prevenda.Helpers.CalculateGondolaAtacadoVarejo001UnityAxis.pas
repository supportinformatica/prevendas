unit Prevenda.Helpers.CalculateGondolaAtacadoVarejo001UnityAxis;

interface

uses
  System.SysUtils,

  Prevenda.Utils.ConfigurationFileReader;

type
  TGondolaAtacadoVarejo001UnityCalcs = class
    private
    public
      function GetUnityValueDataX: string;
      function GetUnityValueDataY: string;
  end;

implementation

{ TGondolaAtacadoVarejo001UnityCalcs }

uses
  Prevenda.Constants.GondolaAtacadoVarejo001;

function TGondolaAtacadoVarejo001UnityCalcs.GetUnityValueDataX: string;

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



function TGondolaAtacadoVarejo001UnityCalcs.GetUnityValueDataY: string;

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
