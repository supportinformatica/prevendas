unit Prevenda.Helpers.CalculateGondolaAtacadoVarejo001PriceVarejoAxis;

interface

uses
  System.SysUtils,

  Prevenda.Utils.ConfigurationFileReader;

type
  TGondolaAtacadoVarejo001PriceVarejoCalcs = class
    private
    public
      function GetSinglePriceLabelTextX: string;
      function GetSinglePriceLabelTextY: string;
      function GetSinglePriceValueDataX: string;
      function GetSinglePriceValueDataY: string;

      function GetDoublePriceLabelTextX: string;
      function GetDoublePriceLabelTextY: string;
      function GetDoublePriceValueDataX: string;
      function GetDoublePriceValueDataY: string;
  end;

implementation

{ TGondolaAtacadoVarejo001PriceVarejoCalcs }

uses
  Prevenda.Constants.GondolaAtacadoVarejo001;



function TGondolaAtacadoVarejo001PriceVarejoCalcs.GetSinglePriceLabelTextX: string;

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

  result := (SINGLE_VAREJO_PRICE_LABEL_X_DEFAULT + ExternalOffset).ToString;

end;



function TGondolaAtacadoVarejo001PriceVarejoCalcs.GetSinglePriceLabelTextY: string;

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

  result := (SINGLE_VAREJO_PRICE_LABEL_Y_DEFAULT + ExternalOffset).ToString;

end;






function TGondolaAtacadoVarejo001PriceVarejoCalcs.GetSinglePriceValueDataX: string;

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

  result := (SINGLE_VAREJO_PRICE_VALUE_X_DEFAULT + ExternalOffset).ToString;

end;



function TGondolaAtacadoVarejo001PriceVarejoCalcs.GetSinglePriceValueDataY: string;

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

  result := (SINGLE_VAREJO_PRICE_VALUE_Y_DEFAULT + ExternalOffset).ToString;

end;




function TGondolaAtacadoVarejo001PriceVarejoCalcs.GetDoublePriceLabelTextX: string;
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

  result := (DOUBLE_VAREJO_PRICE_LABEL_X_DEFAULT + ExternalOffset).ToString;

end;



function TGondolaAtacadoVarejo001PriceVarejoCalcs.GetDoublePriceLabelTextY: string;
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

  result := (DOUBLE_VAREJO_PRICE_LABEL_Y_DEFAULT + ExternalOffset).ToString;

end;




function TGondolaAtacadoVarejo001PriceVarejoCalcs.GetDoublePriceValueDataX: string;
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

  result := (DOUBLE_VAREJO_PRICE_VALUE_X_DEFAULT + ExternalOffset).ToString;

end;



function TGondolaAtacadoVarejo001PriceVarejoCalcs.GetDoublePriceValueDataY: string;

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

  result := (DOUBLE_VAREJO_PRICE_VALUE_Y_DEFAULT + ExternalOffset).ToString;

end;

end.
