unit JD.InnoSetup.Utils;

interface

uses
  System.Classes;

function GetSpacedList(AStrings: TStrings): String;

implementation

function GetSpacedList(AStrings: TStrings): String;
var
  X: Integer;
begin
  Result:= '';
  for X := 0 to AStrings.Count-1 do begin
    if Result <> '' then
      Result:= Result + ' ';
    Result:= Result + AStrings[X];
  end;
end;

end.
