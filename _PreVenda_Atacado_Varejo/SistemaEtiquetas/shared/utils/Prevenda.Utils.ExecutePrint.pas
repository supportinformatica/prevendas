unit Prevenda.Utils.ExecutePrint;

interface

uses
  System.SysUtils,
  ShellApi,

  Vcl.Dialogs,

  Prevenda.Messages.SuccessOrError,
  Prevenda.Constants.App;

type
  TExecutePrint = class
    private
      Messages: TMessageSuccessOrError;

    public
      procedure Start;
  end;

implementation

{ TExecutePrint }

procedure TExecutePrint.Start;

var
  ExecuterResponseValue: integer;

begin

  Messages := TMessageSuccessOrError.Create;

  try

    ExecuterResponseValue := ShellExecute(0, 'open', PChar(GetCurrentDir+ '\' +PRINT_TAG_FILE), '', PChar(GetCurrentDir), 1);

    if (ExecuterResponseValue = 2) or (ExecuterResponseValue = 3) then
      Messages.PrintFileNotFoundMessage
    else
      Messages.PrintedTagConfirmationMessage;

  finally
    Messages.Free;
  end;

end;

end.
