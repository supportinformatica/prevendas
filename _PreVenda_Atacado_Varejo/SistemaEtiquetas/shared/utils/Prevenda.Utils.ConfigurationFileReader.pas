unit Prevenda.Utils.ConfigurationFileReader;

interface

uses
  System.IniFiles,
  System.SysUtils,

  Prevenda.Constants.App;

type
  TConfigurationFileReader = class
    private
    public
      function ReadFlagFromConfigurationFile: string;
      function ReadOffsetXFromConfigurationFile: integer;
      function ReadOffsetYFromConfigurationFile: integer;

  end;
implementation

{ TConfigurationFileReader }

function TConfigurationFileReader.ReadFlagFromConfigurationFile: string;

var
  LOGICAL_CONFIG_FILE: TIniFile;
  FlagValue: string;

begin
  LOGICAL_CONFIG_FILE := TIniFile.Create(GetCurrentDir+ '\' +PHYSICAL_CONFIG_FILE);

  try

    FlagValue := LOGICAL_CONFIG_FILE.ReadString('Etiqueta', 'Flag', FlagValue);

  finally

    LOGICAL_CONFIG_FILE.Free;

  end;

  result := FlagValue;

end;



function TConfigurationFileReader.ReadOffsetXFromConfigurationFile: integer;

var
  LOGICAL_CONFIG_FILE: TIniFile;
  AxisXValue: integer;

begin
  LOGICAL_CONFIG_FILE := TIniFile.Create(GetCurrentDir+ '\' +PHYSICAL_CONFIG_FILE);

  try

    AxisXValue := LOGICAL_CONFIG_FILE.ReadInteger('Etiqueta', 'OffsetX', AxisXValue);

  finally

    LOGICAL_CONFIG_FILE.Free;

  end;

  result := AxisXValue;

end;




function TConfigurationFileReader.ReadOffsetYFromConfigurationFile: integer;

var
  LOGICAL_CONFIG_FILE: TIniFile;
  AxisYValue: integer;

begin
  LOGICAL_CONFIG_FILE := TIniFile.Create(GetCurrentDir+ '\' +PHYSICAL_CONFIG_FILE);

  try

    AxisYValue := LOGICAL_CONFIG_FILE.ReadInteger('Etiqueta', 'OffsetY', AxisYValue);

  finally

    LOGICAL_CONFIG_FILE.Free;

  end;

  result := AxisYValue;

end;

end.
