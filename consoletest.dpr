program consoletest;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Application in 'Application.pas',
  NetFormat in 'NetFormat.pas',
  Debug in 'Debug.pas',
  DateTimeHelper in 'DateTimeHelper.pas';

begin

  try
    { TODO -oUser -cConsole Main : Code hier einfügen }
    Application.Run();
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
