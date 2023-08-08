unit Prevenda.TagsGondola.G001_Header;

interface

uses
  Prevenda.Utils.TagFileWriter;

type
  TGondolaG001Header = class
    private
      TagFileWriter: TTagFileWriter;

    public
      procedure Mount(CodePage, TagHeight, TagWidth, Density, PrintMode, PaperOutputMode, PrintOrientation: string);

  end;

implementation

{ TGondolaG001Header }

procedure TGondolaG001Header.Mount(CodePage, TagHeight, TagWidth, Density,
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
