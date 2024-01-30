unit FStrTests;

interface

uses
  DUnitX.TestFramework;

type

  TObjTest = class(TObject)
  public
      function ToString(): string; override;
  end;

  [TestFixture]
  TFStrTests = class
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    // Sample Methods
    // Simple single Test
    [Test]
    [TestCase('SimpleString, general', 'Formated String,Formated String')]
    [TestCase('SimpleString, with unspecified Param', 'Formated String {0},Formated String ')]
    procedure Test_SimpleString(const msg, _Result: string);

    [Test]
    [TestCase('Currency 1 Param', 'Formated String {0:C2};15.0;Formated String 15,00 €', ';')]
    [TestCase('Currency Fraction', 'Formated String {0:C2};15.15;Formated String 15,15 €', ';')]
    procedure Test_Currency_1P(const msg: string; val1: double; _Result: string);

    [Test]
    [TestCase('Currency 2 Param', 'Formated String {0:C3}, {1:C3};15.0;20.0;Formated String 15,000 €, 20,000 €', ';')]
    procedure Test_Currency_2P(const msg: string; val1: double; val2: double; _Result: string);

    [Test]
    [TestCase('Number, general','Formated String {0},1,Formated String 1')]
    [TestCase('Number, formatted','Formated String {0:D4},1,Formated String 0001')]
    procedure Test_Number(const msg: string; val1: integer; _Result: string);


    [Test]
    [TestCase('Float, general', 'Formated String {0:F2};15.0;Formated String 15,00', ';')]
    procedure Test_Float(const msg: string; val1: double; _Result: string);

    [Test]
    [TestCase('Hex, general', 'Formated HexString {0:X4},27,Formated HexString 001B')]
    procedure Test_Hex(const msg: string; val1: integer; _Result: string);

    [Test]
    [TestCase('DateTime, general', 'Formated Date {0},2024-01-15 13:20:22,Formated Date 15.01.2024')]
    [TestCase('DateTime Full', 'Formated Date {0:yyyy-MM-dd HH:mm:ss},2024-01-15 13:20:22,Formated Date 2024-01-15 13:20:22')]
    [TestCase('Time only', 'Formated Date {0:HH:mm:ss},2024-01-15 13:20:22,Formated Date 13:20:22')]
    procedure Test_DateTime(const msg: string; val1: TDateTime; _Result: string);

    [Test]
    [TestCase('Test_Object', 'Formated String {0},TObjTest,Formated String obj Test ok')]
    procedure Test_Object(msg: string; rawval1: string; _Result: string);
  end;

implementation
uses VoTools.FStr, System.Classes;

procedure TFStrTests.Setup;
begin
end;

procedure TFStrTests.TearDown;
begin
end;

procedure TFStrTests.Test_SimpleString(const msg, _Result: string);
var
  R: string;
begin
  R:= FStr(msg).fmt('de-DE').ToString();
  Assert.AreEqual(R, _Result);
end;

procedure TFStrTests.Test_Currency_1P(const msg: string; val1: double; _Result: string);
var
  R: string;
begin
  R:= FStr(msg).fmt('de-DE').Params(val1);
  Assert.AreEqual(R, _Result);
end;

procedure TFStrTests.Test_Currency_2P(const msg: string; val1: double; val2: double; _Result: string);
var
  R: string;
begin
  R:= FStr(msg).fmt('de-DE').Params(val1, val2);
  Assert.AreEqual(R, _Result);
end;

procedure TFStrTests.Test_Number(const msg: string; val1: integer; _Result: string);
var
  R: string;
begin
  R:= FStr(msg).fmt('de-DE').Params(val1);
  Assert.AreEqual(R, _Result);
end;


procedure TFStrTests.Test_Float(const msg: string; val1: double; _Result: string);
var
  R: string;
begin
  R:= FStr(msg).fmt('de-DE').Params(val1);
  Assert.AreEqual(R, _Result);
end;

procedure TFStrTests.Test_Hex(const msg: string; val1: integer; _Result: string);
var
  R: string;
begin
  R:= FStr(msg).fmt('de-DE').Params(val1);
  Assert.AreEqual(R, _Result);
end;

procedure TFStrTests.Test_DateTime(const msg: string; val1: TDateTime; _Result: string);
var
  R: string;
begin
  R:= FStr(msg).fmt('de-DE').Params(val1);
  Assert.AreEqual(R, _Result);
end;

procedure TFStrTests.Test_Object(msg: string; rawval1: string; _Result: string);
var
  val1A: TObjTest;
  R: string;
begin

  if rawval1 = 'TObjTest' then
  begin
     val1A:= TObjTest.Create();
     R:= FStr(msg).fmt('de-DE').Params(val1A);
     Assert.AreEqual(R, _Result);
  end;

end;

function TObjTest.ToString(): string;
begin
   result:= 'obj Test ok';
end;

initialization
  TDUnitX.RegisterTestFixture(TFStrTests);
end.

