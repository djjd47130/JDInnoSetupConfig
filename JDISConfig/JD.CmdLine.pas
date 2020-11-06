unit JD.CmdLine;

(*
  Command Line Parser
  by Jerry Dodge

  Class: TCmdLine
  - Parses out a command line into individual name/value pairs
  - Concatenates name/value pairs into a command line string
  - Property "ModuleFilename" for the current executable path
  - Property "OpenFilename" for the file to be opened, if any
  - Default property "Values" to read/write name/value pairs
*)

interface

uses
  System.Classes, System.SysUtils;

type
  TCmdLine = class(TObject)
  private
    FItems: TStringList;
    FModuleFilename: String;
    FOpenFilename: String;
    function GetAsString: String;
    procedure SetAsString(const Value: String);
    procedure SetModuleFilename(const Value: String);
    procedure SetOpenFilename(const Value: String);
    function GetValue(const Name: String): String;
    procedure SetValue(const Name, Value: String);
    function GetName(const Index: Integer): String;
  public
    constructor Create;
    destructor Destroy; override;
    function Count: Integer;
    function Exists(const N: String; const IgnoreCase: Boolean = False): Boolean;
    property ModuleFilename: String read FModuleFilename write SetModuleFilename;
    property OpenFilename: String read FOpenFilename write SetOpenFilename;
    property AsString: String read GetAsString write SetAsString;
    property Names[const Index: Integer]: String read GetName;
    property Values[const Name: String]: String read GetValue write SetValue; default;
  end;

implementation

{ TCmdLine }

constructor TCmdLine.Create;
begin
  FItems:= TStringList.Create;
end;

destructor TCmdLine.Destroy;
begin
  FItems.Free;
  inherited;
end;

function TCmdLine.Count: Integer;
begin
  Result:= FItems.Count;
end;

function TCmdLine.Exists(const N: String; const IgnoreCase: Boolean = False): Boolean;
var
  X: Integer;
begin
  Result:= False;
  for X := 0 to FItems.Count-1 do begin
    if IgnoreCase then begin
      if SameText(N, FItems.Names[X]) then begin
        Result:= True;
        Break;
      end;
    end else begin
      if N = FItems.Names[X] then begin
        Result:= True;
        Break;
      end;
    end;
  end;
end;

procedure TCmdLine.SetModuleFilename(const Value: String);
begin
  FModuleFilename:= Value;
end;

procedure TCmdLine.SetOpenFilename(const Value: String);
begin
  FOpenFilename:= Value;
end;

function TCmdLine.GetValue(const Name: String): String;
begin
  Result:= FItems.Values[Name];
end;

procedure TCmdLine.SetValue(const Name, Value: String);
begin
  FItems.Values[Name]:= Value;
end;

function TCmdLine.GetAsString: String;
var
  X: Integer;
  Cmd: String;
  Val: String;
begin
  Result:= '"'+FModuleFilename+'"';
  if Trim(FOpenFilename) <> '' then
    Result:= Result + ' "'+FOpenFilename+'"';
  for X := 0 to FItems.Count-1 do begin
    Cmd:= FItems.Names[X];
    Val:= FItems.Values[Cmd];
    Result:= Result + ' -'+Cmd;
    if Trim(Val) <> '' then begin
      Result:= Result + ' ';
      if Pos(' ', Val) > 0 then
        Result:= Result + '"'+Val+'"'
      else
        Result:= Result + Val;
    end;
  end;
end;

function TCmdLine.GetName(const Index: Integer): String;
begin
  Result:= FItems.Names[Index];
end;

procedure TCmdLine.SetAsString(const Value: String);
var
  Str: String;
  Tmp: String;
  Cmd: String;
  Val: String;
  P: Integer;
begin
  FItems.Clear;
  FModuleFilename:= '';
  FOpenFilename:= '';
  Str:= Trim(Value) + ' ';

  //Extract module filename
  P:= Pos('"', Str);
  if P = 1 then begin
    //Module filename is wrapped in ""
    Delete(Str, 1, 1);
    P:= Pos('"', Str);
    Tmp:= Copy(Str, 1, P-1);
    Delete(Str, 1, P);
    FModuleFilename:= Tmp;
  end else begin
    //Module filename is not wrapped in ""
    P:= Pos(' ', Str);
    Tmp:= Copy(Str, 1, P-1);
    Delete(Str, 1, P);
    FModuleFilename:= Tmp;
  end;

  Str:= Trim(Str) + ' ';

  //Extract open filename
  P:= Pos('"', Str);
  if P = 1 then begin
    //Open filename is wrapped in ""
    Delete(Str, 1, 1);
    P:= Pos('"', Str);
    Tmp:= Copy(Str, 1, P-1);
    Delete(Str, 1, P);
    FOpenFilename:= Tmp;
  end else begin
    //Open filename is not wrapped in ""
    P:= Pos('-', Str);
    if P < 1 then
      P:= Pos('/', 'Str');
    if P < 1 then begin
      //Param does not have switch name
      P:= Pos(' ', Str);
      Tmp:= Copy(Str, 1, P-1);
      Delete(Str, 1, P);
      FOpenFilename:= Tmp;
    end;
  end;

  Str:= Trim(Str) + ' ';

  //Extract remaining param switches/values
  while Length(Trim(Str)) > 0 do begin
    P:= Pos('-', Str);
    if P < 1 then
      P:= Pos('/', 'Str');
    if P > 0 then begin
      //Param switch prefix found
      Delete(Str, 1, 1);
      P:= Pos(' ', Str);
      Tmp:= Trim(Copy(Str, 1, P-1)); //Switch name
      Delete(Str, 1, P);
      Cmd:= Tmp;
      Str:= Trim(Str) + ' ';

      if (Pos('-', Str) <> 1) and  (Pos('/', Str) <> 1) then begin
        //This parameter has a value associated with it
        P:= Pos('"', Str);
        if P = 1 then begin
          //Value is wrapped in ""
          Delete(Str, 1, 1);
          P:= Pos('"', Str);
          Tmp:= Copy(Str, 1, P-1);
          Delete(Str, 1, P);
        end else begin
          //Value is not wrapped in ""
          P:= Pos(' ', Str);
          Tmp:= Copy(Str, 1, P-1);
          Delete(Str, 1, P);
        end;
        Val:= Tmp;
      end else begin
        Val:= '';
      end;
      //If blank, add space to ensure at least name gets added
      if Val = '' then
        Val:= ' ';
      FItems.Values[Cmd]:= Val;
    end else begin
      Str:= '';
      raise Exception.Create('Command line parameters malformed ('+Str+')');
    end;
    Str:= Trim(Str) + ' ';
  end;
end;

end.

