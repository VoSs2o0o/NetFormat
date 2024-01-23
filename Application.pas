unit Application;

interface

procedure Run();

implementation

uses
  Winapi.Windows, Debug, System.SysUtils, DateTimeHelper;

  procedure Run();
  var
    testdate: TDateTime;
  begin
    TDebug.Print('Hallo {0} {1}', 'Test');
    TDebug.Print('Hallo {0} {1:D2}', 'Test', 2.2);
    TDebug.Print('Hallo {0} {1} {2}', 'Test', TObject.Create(), 15);

    testdate:= testdate.Now;
    //testdate.ToString('dd-MM-yyyy HH:mm:ss')
    TDebug.Print('Hallo {0:dd-MM-yyyy HH:mm:ss}', testdate);
    TDebug.Print('Hallo {0:hh}', testdate.AddHours(2));
    TDebug.Print('Hallo {0:C2}', 15);
  end;
end.

