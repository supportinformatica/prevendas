unit Prevenda.TagsGondola.G002G003_Header;

interface

uses
  Prevenda.Utils.TagFileWriter;

type
  TGondolaG002G003Header = class
    private
      TagFileWriter: TTagFileWriter;

    public
      procedure Mount(CodePage, TagHeight, TagWidth, Density, PrintMode, PaperOutputMode, PrintOrientation: string);

  end;

implementation

{ TGondolaG002G003Header }

procedure TGondolaG002G003Header.Mount(CodePage, TagHeight, TagWidth, Density,
  PrintMode, PaperOutputMode, PrintOrientation: string);

begin
  TagFileWriter := TTagFileWriter.Create;

  try
    TagFileWriter.WriteOnTagFile(CodePage);
    TagFileWriter.WriteOnTagFile('');

    TagFileWriter.WriteOnTagFile(TagHeight);
    TagFileWriter.WriteOnTagFile(TagWidth);
    TagFileWriter.WriteOnTagFile('');

    TagFileWriter.WriteOnTagFile(Density);
    TagFileWriter.WriteOnTagFile('');

    TagFileWriter.WriteOnTagFile(PrintMode);
    TagFileWriter.WriteOnTagFile('');

    TagFileWriter.WriteOnTagFile(PaperOutputMode);
    TagFileWriter.WriteOnTagFile('');

    TagFileWriter.WriteOnTagFile('WN');
    TagFileWriter.WriteOnTagFile('');

    TagFileWriter.WriteOnTagFile(PrintOrientation);
    TagFileWriter.WriteOnTagFile('');

    TagFileWriter.WriteOnTagFile('N');
    TagFileWriter.WriteOnTagFile('');

  finally

    TagFileWriter.Free;

  end;
end;

end.
