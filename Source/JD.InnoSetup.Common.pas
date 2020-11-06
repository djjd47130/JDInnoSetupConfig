unit JD.InnoSetup.Common;

interface

uses
  System.Classes, System.SysUtils, System.TypInfo,
  Vcl.CheckLst, Vcl.StdCtrls;

type

  TBoolDefExpression = class;

  TJDISPermission = class;

  TJDISPermissions = class;




  TBoolDef = (bdDefault, bdFalse, bdTrue);

  TJDISAttrib = (isaReadOnly, isaHidden, isaSystem, isaNotContentIndexed);
  TJDISAttribs = set of TJDISAttrib;





  TBoolDefExp = (bdeDefault, bdeFalse, bdeTrue, bdeExpression);

  ///<summary>
  ///  Represents either a boolean with a default option, or a boolean expression.
  ///</summary>
  TBoolDefExpression = class(TPersistent)
  private
    FExpression: String;
    FValue: TBoolDefExp;
    procedure SetExpression(const Value: String);
    procedure SetValue(const Value: TBoolDefExp);
  public
    constructor Create;
    destructor Destroy; override;
  published
    property Value: TBoolDefExp read FValue write SetValue default TBoolDefExp.bdeDefault;
    property Expression: String read FExpression write SetExpression;
  end;




  ///<summary>
  ///  Represents a collection of Windows permissions, associating either
  ///  users or groups with an access level. Used for files, folders, and registry.
  ///</summary>
  TJDISPermissions = class(TOwnedCollection)
  public
    constructor Create(AOwner: TPersistent); reintroduce;
    function GetFullText: String;
  end;

  TJDISPermissionAccessType = (ispaFull, ispaModify, ispaReadExec);

  ///<summary>
  ///  Represents a single Windows permission. Associates either a user
  ///  or a group with an access level. Used for files, folders, and registry.
  ///</summary>
  TJDISPermission = class(TCollectionItem)
  private
    FAccessType: TJDISPermissionAccessType;
    FIdentifier: String;
    procedure SetAccessType(const Value: TJDISPermissionAccessType);
    procedure SetIdentifier(const Value: String);
  protected
    function GetDisplayName: String; override;
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
    function GetFullText: String; virtual;
  published
    property AccessType: TJDISPermissionAccessType read FAccessType write SetAccessType;
    property Identifier: String read FIdentifier write SetIdentifier;
  end;




  TJDISCompression = (iscDefault, iscZip, iscZipVer, iscBzip, iscBzipVer, iscLzma,
    iscLzmaFast, iscLzmaNormal, iscLzmaMax, iscLzmaUltra, iscLzmaUltra64,
    iscLzma2, iscLzma2Fast, iscLzma2Normal, iscLzma2Max, iscLzma2Ultra,
    iscLzma2Ultra64, iscNone);

  TJDISInternalCompression = (isicNormal, isicZip, isicZipVer, isicBzip, isicBzipVer, isicLzma,
    isicLzmaFast, isicLzmaNormal, isicLzmaMax, isicLzmaUltra, isicLzmaUltra64,
    isicLzma2, isicLzma2Fast, isicLzma2Normal, isicLzma2Max, isicLzma2Ultra,
    isicLzma2Ultra64, isicNone);

  TJDISCompressMatchFinder = (iscmfDefault, iscmfHashChain, iscmfBinaryTree);

  TJDISCompressSeparateProcess = (iscspDefault, iscspYes, iscspNo, iscspX86);





  TJDISArchitecture = (isaX86, isaX64, isaArm64, isaIa64);
  TJDISArchitectures = set of TJDISArchitecture;

  TJDISArchitecture64 = (isa64X64, isa64Arm64, isa64Ia64);
  TJDISArchitectures64 = set of TJDISArchitecture64;

  TJDISBoolForce = (isbfDefault, isbfFalse, isbfTrue, isbfForce);

  TBoolDefAuto = (isbaDefault, isbaFalse, isbaTrue, isbaAuto);

  TJDISLanguageDetectMethod = (isldDefault, isldUILanguage, isldLocale, isldNone);

  TJDISUninstallLogMode = (isulDefault, isulAppend, isulNew, isulOverwrite);

  TJDISTouchDateTimeType = (isttDefault, isttCurrent, isttNone, isttCustom);

  TJDISPrivilegesReq = (isprDefault, isprAdmin, isprLowest);

  TJDISPrivilegesReqOverride = (ispoCommandLine, ispoDialog);
  TJDISPrivilegesReqOverrides = set of TJDISPrivilegesReqOverride;





  TJDISBackColorDir = (iscdTopToBottom, iscdLeftToRight);

  TJDISWizardStyle = (iswsClassic, iswsModern);

  TJDISWizardImageAlphaFormat = (isafNone, isafDefined, isafPreMultiplied);





  TJDISTypeFlag = (istfIsCustom);
  TJDISTypeFlags = set of TJDISTypeFlag;





  TJDISComponentFlag = (iscfCheckAbleAlone, iscfDontInheritCheck, iscfExclusive,
    iscfFixed, iscfRestart, iscfDisableNounInstallWarning);
  TJDISComponentFlags = set of TJDISComponentFlag;





  TJDISTaskFlag = (istfCheckAbleAlone, istfCheckedOnce, istfDontInheritCheck,
    istfExclusive, istfRestart, istfUnchecked);
  TJDISTaskFlags = set of TJDISTaskFlag;





  TJDISDirFlag = (isdfDeleteAfterInstall, isdfSetNTFSCompression,
    isdfUninsAlwaysUninstall, isdfUninsNeverUninstall, isdfUnsetNTFSCompression);
  TJDISDirFlags = set of TJDISDirFlag;





  TJDISIconFlag = (isifCloseOnExit, isifCreateOnlyIfFileExists, isifDontCloseOnExit,
    isifExcludeFromShowInNewInstall, isifFolderShortcut, isifPreventPinning,
    isifRunMaximized, isifRunMinimized, isifUninsNeverUninstall, isifUseAppPaths);
  TJDISIconFlags = set of TJDISIconFlag;





  TJDISIniFlag = (isinfCreateKeyIfDoesntExist, isinfUninsDeleteEntry,
    isinfUninsDeleteSection, isinfUninsDeleteSectionIfEmpty);
  TJDISIniFlags = set of TJDISIniFlag;





  TJDISInstallDeleteType = (isdtFiles, isdtFilesAndOrDirs, isdtDirIfEmpty);





  TJDISRegRoot = (isrrCurrentUser, isrrLocalMachine, isrrClassesRoot,
    isrrUsers, isrrCurrentConfig, isrrAutoUserMachine);

  TJDISRegType = (isrtNone, isrtString, isrtExpandSz, isrtMultiSz,
    isrtDword, isrtQword, isrtBinary);

  TJDISRegFlag = (isrfCreateValueIfDoesntExist, isrfDeleteKey, isrfDeleteValue,
    isrfDontCreateKey, isrfNoError, isrfPreserveStringType, isrfUninsClearValue,
    isrfUninsDeleteKey, isrfUninsDeleteKeyIfEmpty, isrfUninsDeleteValue);
  TJDISRegFlags = set of TJDISRegFlag;





  TJDISRunFlag = (isrnf32bit, isrnf64bit, isrnfHideWizard, isrnfNoWait,
    isrnfPostInstall, isrnfRunAsCurrentUser, isrnfRunAsOriginalUser,
    isrnfRunHidden, isrnfRunMaximized, isrnfRunMinimized, isrnfShellExec,
    isrnfSkipIfDoesntExist, isrnfSkipIfNotSilent, isrnfSkipIfSilent,
    isrnfUnchecked, isrnfWaitUntilIdle, isrnfWaitUntilTerminated);
  TJDISRunFlags = set of TJDISRunFlag;






  TJDISUninstallDeleteType = (isudtFiles, isudtFilesAndOrDirs, isudtDirIfEmpty);





  TJDISUninstallRunFlag = (isurf32bit, isurf64bit, isurfHideWizard,
    isurfNoWait, isurfPostInstall, isurfRunAsCurrentUser, isurfRunAsOriginalUser,
    isurfRunHidden, isurfRunMaximized, isurfRunMinimized, isurfShellExec,
    isurfSkipIfDoesntExist, isurfSkipIfNotSilent, isurfSkipIfSilent,
    isurfUnchecked, isurfWaitUntilIdle, isurfWaitUntilTerminated);
  TJDISUninstallRunFlags = set of TJDISUninstallRunFlag;







  {
  TEnumSerialize<EnumType: record> = class
  private
    class function GetEnumTypeData: PTypeData;
  public
    type SetType = Set of EnumType;
    class procedure LoadEnums(const ASet: SetType; AList: TCheckListBox);
    class procedure SaveEnums(var VSet: SetType; AList: TCheckListBox);
  end;
  }


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

procedure PopulateEnumCheckList(TypeInfo: PTypeInfo; Lst: TCheckListBox);
var
  D: PTypeData;
  I: Integer;
begin
  Lst.Items.Clear;
  D:= GetTypeData(TypeInfo);
  for I := D.MinValue to D.MaxValue do begin
    Lst.Items.Add(GetEnumName(TypeInfo, I));
  end;
end;

{ TBoolDefExpression }

constructor TBoolDefExpression.Create;
begin

end;

destructor TBoolDefExpression.Destroy;
begin

  inherited;
end;

procedure TBoolDefExpression.SetExpression(const Value: String);
begin
  FExpression := Value;
  FValue:= bdeExpression;
end;

procedure TBoolDefExpression.SetValue(const Value: TBoolDefExp);
begin
  FValue := Value;
end;

{ TJDISPermissions }

constructor TJDISPermissions.Create(AOwner: TPersistent);
begin
  inherited Create(AOwner, TJDISPermission);
end;

function TJDISPermissions.GetFullText: String;
var
  X: Integer;
  P: TJDISPermission;
begin
  Result:= '';
  for X := 0 to Count-1 do begin
    P:= TJDISPermission(Items[X]);
    if Result <> '' then
      Result:= Result + ' ';
    Result:= Result + P.GetFullText;
  end;
end;

{ TJDISPermission }

constructor TJDISPermission.Create(Collection: TCollection);
begin
  inherited;

end;

destructor TJDISPermission.Destroy;
begin

  inherited;
end;

function TJDISPermission.GetDisplayName: String;
begin
  Result:= GetFullText;
end;

function TJDISPermission.GetFullText: String;
begin
  Result:= FIdentifier+'-';
  case Self.FAccessType of
    ispaFull:     Result:= Result + 'full';
    ispaModify:   Result:= Result + 'modify';
    ispaReadExec: Result:= Result + 'readexec';
  end;
end;

procedure TJDISPermission.SetAccessType(const Value: TJDISPermissionAccessType);
begin
  FAccessType := Value;
end;

procedure TJDISPermission.SetIdentifier(const Value: String);
begin
  FIdentifier := Value;
end;

{ TEnumSerialize }

{
class function TEnumSerialize<EnumType>.GetEnumTypeData: PTypeData;
var
  TI: PTypeInfo;
begin
  TI := TypeInfo(EnumType);
  if Assigned(TI) and (TI^.Kind = tkEnumeration) then
    Result := GetTypeData(TI)
  else
    Result := nil;
end;

class procedure TEnumSerialize<EnumType>.LoadEnums(const ASet: SetType; AList: TCheckListBox);
var
  TD: PTypeData;
  Value: Integer;
begin
  AList.CheckAll(cbUnchecked);

  TD := GetEnumTypeData;
  if not Assigned(TD) then Exit;

  for Value := TD^.MinValue to TD^.MaxValue do
  begin
    if EnumType(Value) in ASet then
      AList.Checked[Value] := True;
  end;
end;

class procedure TEnumSerialize<EnumType>.SaveEnums(var VSet: SetType; AList: TCheckListBox);
var
  TD: PTypeData;
  Value: Integer;
begin
  VSet := [];

  TD := GetEnumTypeData;
  if not Assigned(TD) then Exit;

  for Value := TD^.MinValue to TD^.MaxValue do
  begin
    if AList.Checked[Value] then
      Include(VSet, EnumType(Value));
  end;
end;
}

end.
