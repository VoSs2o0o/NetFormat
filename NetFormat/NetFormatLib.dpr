program NetFormatLib;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  ExampleApp in 'ExampleApp.pas',
  VoTools.Debug in 'VoTools.Debug.pas',
  DateTimeHelper in '3rd\DateTimeHelper.pas',
  VoTools.FStr in 'VoTools.FStr.pas',
  VoTools.NetFormat in 'VoTools.NetFormat.pas';

begin

  try
    { TODO -oUser -cConsole Main : Code hier einfügen }
    exampleApp.Run();
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
