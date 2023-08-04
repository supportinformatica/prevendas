unit Prevenda.TagsGondola.G001_Body;

interface

uses
  System.SysUtils,

  Prevenda.Utils.TagFileWriter;

type
  TGondolaG001Body = class
    private
      TagFileWriter: TTagFileWriter;

    public
      procedure MountDescription(DescriptionAxisX, DescriptionAxisY, DescriptionItem: string);

      procedure MountUnity(UnityAxisX, UnityAxisY, UnityItem: string);

      procedure MountPriceSymbol(PriceSymbolAxisX, PriceSymbolAxisY, PriceSymbolText: string);
      procedure MountPriceValue(PriceValueAxisX, PriceValueAxisY: string; PriceValueItem: real);

      procedure MountBarcodeSymbol(BarcodeSymbolAxisX, BarcodeSymbolAxisY, BarcodeSymbolValue: string);
      procedure MountBarcodeValue(BarcodeValueAxisX, BarcodeValueAxisY, BarcodeValueText: string);
  end;

implementation

{ TGondolaG001Body }

procedure TGondolaG001Body.MountDescription(DescriptionAxisX, DescriptionAxisY,
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




procedure TGondolaG001Body.MountUnity(UnityAxisX, UnityAxisY,
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




procedure TGondolaG001Body.MountPriceSymbol(PriceSymbolAxisX, PriceSymbolAxisY,
  PriceSymbolText: string);

begin
  TagFileWriter := TTagFileWriter.Create;

  try

    TagFileWriter.WriteOnTagFile('A'+PriceSymbolAxisX+','+PriceSymbolAxisY+',0,3,1,1,N,"' +PriceSymbolText+ '"');

  finally

    TagFileWriter.Free;

  end;
end;


procedure TGondolaG001Body.MountPriceValue(PriceValueAxisX,
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



procedure TGondolaG001Body.MountBarcodeSymbol(BarcodeSymbolAxisX,
  BarcodeSymbolAxisY, BarcodeSymbolValue: string);

begin
  TagFileWriter := TTagFileWriter.Create;

  try

    TagFileWriter.WriteOnTagFile('B'+BarcodeSymbolAxisX+','+BarcodeSymbolAxisY+',0,1,3,6,48,N,"'+BarcodeSymbolValue+'"');

  finally

    TagFileWriter.Free;

  end;
end;


procedure TGondolaG001Body.MountBarcodeValue(BarcodeValueAxisX,
  BarcodeValueAxisY, BarcodeValueText: string);

begin
  TagFileWriter := TTagFileWriter.Create;

  try

    TagFileWriter.WriteOnTagFile('A'+BarcodeValueAxisX+','+BarcodeValueAxisY+',0,1,1,2,N,"'+BarcodeValueText+'"');
    TagFileWriter.WriteOnTagFile('');

  finally

    TagFileWriter.Free;

  end;
end;

end.
