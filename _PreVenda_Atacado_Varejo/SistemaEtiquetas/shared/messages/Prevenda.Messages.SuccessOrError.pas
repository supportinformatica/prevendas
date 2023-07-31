unit Prevenda.Messages.SuccessOrError;

interface

uses
  Vcl.Dialogs,

  Prevenda.Constants.App;

type
  TMessageSuccessOrError = class
    private
    public
      procedure PrintedTagConfirmationMessage;
      procedure PrintFileNotFoundMessage;
  end;
implementation

{ TMessageSuccessOrError }

procedure TMessageSuccessOrError.PrintedTagConfirmationMessage;

begin

  MessageDlg('Impress�o ok no m�todo separado!', mtInformation, [mbOK], 0);

end;



procedure TMessageSuccessOrError.PrintFileNotFoundMessage;
begin

  MessageDlg('N�o foi encontrado o arquivo para executar impress�o', mtError, [mbOK], 0);

end;

end.
