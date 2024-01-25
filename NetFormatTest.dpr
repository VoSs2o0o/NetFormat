program NetFormatTest;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Application in 'Application.pas',
  Debug in 'Debug.pas',
  DateTimeHelper in 'DateTimeHelper.pas',
  NetFormat in 'NetFormat.pas';

begin

  try
    { TODO -oUser -cConsole Main : Code hier einfügen }
    Application.Run();
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
