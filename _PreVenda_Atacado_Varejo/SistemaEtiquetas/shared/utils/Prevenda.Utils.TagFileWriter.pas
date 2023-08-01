unit Prevenda.Utils.TagFileWriter;

interface

uses
  System.SysUtils,
  Vcl.Dialogs,
  Prevenda.Constants.App;


type
  TTagFileWriter = class
    private
    public
      procedure WriteOnTagFile(AComand: string);
  end;
implementation

{ TTagFileWriter }

uses
  Prevenda.Utils.FirstImpression;

procedure TTagFileWriter.WriteOnTagFile(AComand: string);

var
  LOGICAL_TAG_FILE: TextFile;

begin
  assignfile(LOGICAL_TAG_FILE, GetCurrentDir+ '\' +PHYSICAL_TAG_FILE);

  if not FileExists(PHYSICAL_TAG_FILE) or (isFirstImpression = true) then  begin
    rewrite(LOGICAL_TAG_FILE);

    isFirstImpression := false;
  end else begin
    append(LOGICAL_TAG_FILE);
  end;


  writeln(LOGICAL_TAG_FILE, AComand);

  close(LOGICAL_TAG_FILE);
end;

end.
