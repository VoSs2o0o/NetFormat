# NetFormat and Formatting Tools

Core of this collection is the NetFormat-Unit. Use it to easily format a string in Delphi.

```
test:= FStr('Hallo {0} {1:D2} {2:dd-MM-yyyy HH:mm:ss}').Params('Test', 2.2, testdate.Now)
```
Result:
```
Hallo Test 02 23.01.2024 12:00:01
```

As you can see, all Delphitypes are accepted as input, and they will be convertet to String, and replaces
the appropiate position in the String.

NetFormat.pas uses Generics, and Advanced RTTI, RegEx and shoul be running with Delphi XE or later.
It is testet in Delphi 10.3

## Simple Syntax

```
test:= FStr('Hallo').ToString()
test:= FStr('Hallo {0}').Params('Test')
test:= FStr('Hallo {0}').Params(2)
```

Result:
```
Hallo
Hallo Test
Hallo 2
```

Use {0} till {9} to specifiy the Position of Parameter.

## Complex Syntax

```
test:= FStr('Hallo {0:F2}').Params(2)
```

Result:
```
Hallo 2.00
```

Use a ':', one of the Spezifier and 'C', 'D' or 'F' followed by a number.
More about the Spezifiers below.

```
test:= FStr('Hallo {0:dd.MM.}').Params(testdate.Now)
```

Result:
```
Hallo 23.01.
```

Use the Date/Time Syntax to Format a Date and/or Time. More about the Spezifiers below.

## Format Specifiers

### Following Specifiers are available:

| Specifier  | Valid For | Length                   | Description                     | example              |
| ---------- | --------- | ------------------------ | ------------------------------- | -------------------- |
| C          | Int/Float | specifies decimals       | displays a Currency-Value       | 15    -> C2: 15.00 € |
| D          | Int/Float | leading zeros till length| number without decimals         | 9.1   -> D3: 009     |
| F          | Int/Float | specifies decimals       | float value                     | 2.457 -> F2: 2.45    |
| various    | TDateTime | <none>                   | Formates a TDateTime, see below | see below            |

### TDateTime Specifiers available:

| Specifier  | Description              | example    |
| ---------- | ------------------------ | ---------- |
| y          | Year, one/two digits     | 24 or 9    |
| yy         | Year, two digits         | 24 or 09   |
| yyyy       | Year, 4 digits           | 2024       |
| M          | Month, one/two digits    | 1 or 12    |
| MM         | Month, two digits        | 01 or 12   |
| MMM        | Month, abre.             | Jan or Dec |
| MMMM       | Month name               | January    |
| d          | Day, one/two digits      | 23 or 9    |
| dd         | Day, two digits          | 23 or 09   |
| ddd        | Weekday abre             | Tue        |
| dddd       | Weekday                  | Tuesday    |
| h / H      | Hour (12/24)  one/two dig| 12 or 9    |
| hh / HH    | Hour (12/24)  two digits | 12 or 09   |
| m          | Minute, one/two digits   | 49 or 9    |
| mm         | Minute, two digits       | 49 or 09   |
| s          | Second, one/two digits   | 49 or 9    |
| ss         | Second, two digits       | 49 or 09   |
| :,/,-      | allowed devider to format| 13:21      |

in difference to Delphis FormatDateTime 'M' means Month, and 'm' means Minute, 'h' is 12 based Hour, 'H' is 24 based Hour.
Its like Microsoft Format Specifier.

## Alternative Call NetFormat

```
test:= TNetFormat.Str('Hallo {0} {1:D2} {2:dd-MM-yyyy HH:mm:ss}', 'Test', 2.2, testdate.Now)
```

## Debug

for fast and easy debugging an TDebug.Print Funktion is added. It work like the TNetFormat.Str method.

```
test:= Debug.Print('Hallo {0} {1:D2} {2:dd-MM-yyyy HH:mm:ss}', 'Test', 2.2, testdate.Now)
```

## DateTimeHelper

This lib is not related to the rest of the code, but it is very helpfull to handle TDateTime.
Colin Johnsun, https://github.com/colinj, MIT License.
If you own Delphi 11, a TDateTimeHelper is integrated in System.DateUtils with Update 2

## Formatsettings

You can specifiy your own Formatsettings with 'fmt' (TFormatSettings or LCID):

```
test:= FStr('Hallo {0:F2}').fmt('de-DE').Params(2)
```
In the example above, FStr uses German Settings, '1,00 €' istead of '$1.00' for example.
Default is your machine standard.

## History
### 23.01.2024: Version 1.0
- first version :-)

### 25.01.2024: Version 2.0
- Old:
```
NetFormat.ToString('Hallo {0} {1:D4} {2} {3}',
                   'Welt', 55, 7.7, testdate);
```
- New: Format changed, I have found a more ellegant and slightly shorter Method:
```
TStr('Hallo {0} {1:D4} {2} {3}').
    Params('Welt', 55, 7.7, testdate);
```
- Structure changed from class to record
- some minors addes to README

### 28.01.2024: Version 3.0
- Old:
```
TStr('Hallo {0} {1:D4} {2} {3}').
    Params('Welt', 55, 7.7, testdate);
```
- New: TStr -> FStr, and old Format readded, beause some People wants a more
  Delphi-Format like command:
```
FStr('Hallo {0} {1:D4} {2} {3}').
               Params('Welt', 55, 7.7, testdate);
NetFormat.TStr('Hallo {0} {1:D4} {2} {3}',
               'Welt', 55, 7.7, testdate);
```
- Namespace VTools added to avoid conficts
- Hex-Format added ("X")
- TFormatStettings Support
- Tests added
- 'writeln' to Example added, to also have an console output
- some minors changes to README
