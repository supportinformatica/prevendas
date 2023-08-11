unit Prevenda.TagsGondola.G001_Footer;

interface

uses
  System.SysUtils,

  Prevenda.Utils.TagFileWriter;

type
  TGondolaG001Footer = class
    private
      TagFileWriter: TTagFileWriter;

    public
      procedure Mount(ItemQuantity: string);
  end;

implementation

{ TGondolaG001Footer }


procedure TGondolaG001Footer.Mount(ItemQuantity: string);

begin
  TagFileWriter := TTagFileWriter.Create;

  try

    TagFileWriter.WriteOnTagFile('P' +FormatFloat('0', StrToFloat(ItemQuantity)));

  finally

    TagFileWriter.Free;

  end;
end;

end.
