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

  MessageDlg('Impressão ok no método separado!', mtInformation, [mbOK], 0);

end;



procedure TMessageSuccessOrError.PrintFileNotFoundMessage;
begin

  MessageDlg('Não foi encontrado o arquivo para executar impressão', mtError, [mbOK], 0);

end;

end.
