unit Prevenda.TagsGondola.G002G003_Footer;

interface

uses
  System.SysUtils,

  Prevenda.Utils.TagFileWriter;

type
  TGondolaG002G003Footer = class
    private
      TagFileWriter: TTagFileWriter;

    public
      procedure Mount(ItemQuantity: string);
  end;

implementation

{ TGondolaG002G003Footer }

procedure TGondolaG002G003Footer.Mount(ItemQuantity: string);

begin
  TagFileWriter := TTagFileWriter.Create;

  try

    TagFileWriter.WriteOnTagFile('P' +FormatFloat('0', StrToFloat(ItemQuantity)));

  finally

    TagFileWriter.Free;

  end;
end;

end.
