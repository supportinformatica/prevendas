unit Prevenda.TagsGondola.AtacadoVarejo001_Body;

interface

uses
  System.SysUtils,

  Prevenda.Utils.TagFileWriter;

type
  TGondolaAtacadoVarejo001Body = class
    private
      TagFileWriter: TTagFileWriter;

    public
      procedure MountDescription(DescriptionAxisX, DescriptionAxisY, DescriptionItem: string);

      procedure MountUnity(UnityAxisX, UnityAxisY, UnityItem: string);

      procedure MountPriceLabel(PriceLabelAxisX, PriceLabelAxisY, PriceLabelText: string);
      procedure MountPriceValue(PriceValueAxisX, PriceValueAxisY: string; PriceValueItem: real);
  end;

implementation

{ TGondolaAtacadoVarejo001Body }

procedure TGondolaAtacadoVarejo001Body.MountDescription(DescriptionAxisX, DescriptionAxisY,
  DescriptionItem: string);

begin
  TagFileWriter := TTagFileWriter.Create;

  try

    TagFileWriter.WriteOnTagFile('A'+DescriptionAxisX+','+DescriptionAxisY+',0,4,1,2,N,"' +DescriptionItem+ '"');
    TagFileWriter.WriteOnTagFile('');

  finally

    TagFileWriter.Free;

  end;
end;



procedure TGondolaAtacadoVarejo001Body.MountUnity(UnityAxisX, UnityAxisY,
  UnityItem: string);

begin
  TagFileWriter := TTagFileWriter.Create;

  try

    TagFileWriter.WriteOnTagFile('A'+UnityAxisX+','+UnityAxisY+',0,4,1,2,N,"' +UnityItem+ '"');
    TagFileWriter.WriteOnTagFile('');

  finally

    TagFileWriter.Free;

  end;
end;




procedure TGondolaAtacadoVarejo001Body.MountPriceLabel(PriceLabelAxisX, PriceLabelAxisY,
  PriceLabelText: string);

begin
  TagFileWriter := TTagFileWriter.Create;

  try

    TagFileWriter.WriteOnTagFile('A'+PriceLabelAxisX+','+PriceLabelAxisY+',0,3,1,1,N,"' +PriceLabelText+ '"');

  finally

    TagFileWriter.Free;

  end;
end;




procedure TGondolaAtacadoVarejo001Body.MountPriceValue(PriceValueAxisX,
  PriceValueAxisY: string; PriceValueItem: real);

begin
  TagFileWriter := TTagFileWriter.Create;

  try

    TagFileWriter.WriteOnTagFile('A'+PriceValueAxisX+','+PriceValueAxisY+',0,3,2,4,N,"R$ ' +FormatFloat('0.00', PriceValueItem)+ '"');
    TagFileWriter.WriteOnTagFile('');

  finally

    TagFileWriter.Free;

  end;
end;


end.
