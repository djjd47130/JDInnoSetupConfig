unit JD.InnoSetup;

(*
  JD Inno Setup Script Generator for Delphi

  The component TJDInnoSetupScript is the base component which is installed.
  From here, you can configure everything for an Inno Setup script, just
  as documented for Inno Setup. In the end, this component can produce
  an Inno Setup script file (.iss) to be further compiled.

  NOTE: This is created based on Inno Setup version 6.0.5 (Unicode).
*)

interface

uses
  System.Classes, System.SysUtils, System.Generics.Collections;

type
  TJDInnoSetupScript = class;
  TJDISBaseCollection = class;
  TJDISDefines = class;
  TJDISDefine = class;
  TJDISSetup = class;
  TJDISSetupCompiler = class;
  TJDISSetupInstaller = class;
  TJDISSetupCosmetic = class;
  TJDISSetupObsolete = class;
  TJDISTypes = class;
  TJDISType = class;
  TJDISComponents = class;
  TJDISComponent = class;
  TJDISTasks = class;
  TJDISTask = class;
  TJDISDirs = class;
  TJDISDir = class;
  TJDISFiles = class;
  TJDISFile = class;
  TJDISFileFlags = class;



  TJDInnoSetupScript = class(TComponent)
  private
    FDefines: TJDISDefines;
    FSetup: TJDISSetup;
    FTypes: TJDISTypes;
    FComponents: TJDISComponents;
    FTasks: TJDISTasks;
    FDirs: TJDISDirs;
    FFiles: TJDISFiles;
    procedure SetDefines(const Value: TJDISDefines);
    procedure SetSetup(const Value: TJDISSetup);
    procedure SetTypes(const Value: TJDISTypes);
    procedure SetComponents(const Value: TJDISComponents);
    procedure SetTasks(const Value: TJDISTasks);
    procedure SetDirs(const Value: TJDISDirs);
    procedure SetFiles(const Value: TJDISFiles);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property Defines: TJDISDefines read FDefines write SetDefines;
    property Setup: TJDISSetup read FSetup write SetSetup;
    property Types: TJDISTypes read FTypes write SetTypes;
    property Components: TJDISComponents read FComponents write SetComponents;
    property Tasks: TJDISTasks read FTasks write SetTasks;
    property Dirs: TJDISDirs read FDirs write SetDirs;
    property Files: TJDISFiles read FFiles write SetFiles;
  end;


  TJDISBaseCollection = class(TOwnedCollection)
  private
    FOwner: TJDInnoSetupScript;
  public
    constructor Create(AOwner: TJDInnoSetupScript;
      ItemClass: TCollectionItemClass);
  end;



  TJDISDefines = class(TJDISBaseCollection)
  public
    constructor Create(AOwner: TJDInnoSetupScript); reintroduce;
  end;

  TJDISDefine = class(TCollectionItem)
  private
    FName: String;
    FValue: String;
    procedure SetName(const Value: String);
    procedure SetValue(const Value: String);
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
  published
    property Name: String read FName write SetName;
    property Value: String read FValue write SetValue;
  end;



  TJDISSetup = class(TPersistent)
  private
    FOwner: TJDInnoSetupScript;
    FCompiler: TJDISSetupCompiler;
    FInstaller: TJDISSetupInstaller;
    FCosmetic: TJDISSetupCosmetic;
    FObsolete: TJDISSetupObsolete;
    procedure SetCompiler(const Value: TJDISSetupCompiler);
    procedure SetCosmetic(const Value: TJDISSetupCosmetic);
    procedure SetInstaller(const Value: TJDISSetupInstaller);
    procedure SetObsolete(const Value: TJDISSetupObsolete);
  public
    constructor Create(AOwner: TJDInnoSetupScript);
    destructor Destroy; override;
  published
    property Compiler: TJDISSetupCompiler read FCompiler write SetCompiler;
    property Installer: TJDISSetupInstaller read FInstaller write SetInstaller;
    property Cosmetic: TJDISSetupCosmetic read FCosmetic write SetCosmetic;
    property Obsolete: TJDISSetupObsolete read FObsolete write SetObsolete;
  end;

  TJDISSetupCompiler = class(TPersistent)
  private
    FOwner: TJDISSetup;
  public
    constructor Create(AOwner: TJDISSetup);
    destructor Destroy; override;
  end;

  TJDISSetupInstaller = class(TPersistent)
  private
    FOwner: TJDISSetup;
  public
    constructor Create(AOwner: TJDISSetup);
    destructor Destroy; override;

  end;

  TJDISSetupCosmetic = class(TPersistent)
  private
    FOwner: TJDISSetup;
  public
    constructor Create(AOwner: TJDISSetup);
    destructor Destroy; override;

  end;

  TJDISSetupObsolete = class(TPersistent)
  private
    FOwner: TJDISSetup;
  public
    constructor Create(AOwner: TJDISSetup);
    destructor Destroy; override;

  end;




  TJDISTypes = class(TJDISBaseCollection)
  public
    constructor Create(AOwner: TJDInnoSetupScript); reintroduce;
  end;

  TJDISTypeFlag = (istfIsCustom);
  TJDISTypeFlags = set of TJDISTypeFlag;

  TJDISType = class(TCollectionItem)
  private
    FName: String;
    FDescription: String;
    FFlags: TJDISTypeFlags;
    procedure SetDescription(const Value: String);
    procedure SetFlags(const Value: TJDISTypeFlags);
    procedure SetName(const Value: String);
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
  published
    property Name: String read FName write SetName;
    property Description: String read FDescription write SetDescription;
    property Flags: TJDISTypeFlags read FFlags write SetFlags;
  end;



  TJDISComponents = class(TJDISBaseCollection)
  public
    constructor Create(AOwner: TJDInnoSetupScript); reintroduce;
  end;

  TJDISComponentFlag = (iscfCheckAbleAlone, iscfDontInheritCheck, iscfExclusive,
    iscfFixed, iscfRestart, iscfDisableNounInstallWarning);
  TJDISComponentFlags = set of TJDISComponentFlag;

  TJDISComponent = class(TCollectionItem)
  private
    FName: String;
    FExtraDiskSpaceRequired: Integer;
    FDescription: String;
    FFlags: TJDISComponentFlags;
    procedure SetDescription(const Value: String);
    procedure SetExtraDiskSpaceRequired(const Value: Integer);
    procedure SetFlags(const Value: TJDISComponentFlags);
    procedure SetName(const Value: String);
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
  published
    property Name: String read FName write SetName;
    property Description: String read FDescription write SetDescription;
    //Types
    property ExtraDiskSpaceRequired: Integer read FExtraDiskSpaceRequired write SetExtraDiskSpaceRequired;
    property Flags: TJDISComponentFlags read FFlags write SetFlags;
  end;



  TJDISTasks = class(TJDISBaseCollection)
  public
    constructor Create(AOwner: TJDInnoSetupScript); reintroduce;
  end;

  TJDISTaskFlag = (istfCheckAbleAlone, istfCheckedOnce, istfDontInheritCheck,
    istfExclusive, istfRestart, istfUnchecked);
  TJDISTaskFlags = set of TJDISTaskFlag;

  TJDISTask = class(TCollectionItem)
  private
    FName: String;
    FGroupDescription: String;
    FDescription: String;
    FFlags: TJDISTaskFlags;
    procedure SetDescription(const Value: String);
    procedure SetFlags(const Value: TJDISTaskFlags);
    procedure SetGroupDescription(const Value: String);
    procedure SetName(const Value: String);
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
  published
    property Name: String read FName write SetName;
    property Description: String read FDescription write SetDescription;
    property GroupDescription: String read FGroupDescription write SetGroupDescription;
    //Components
    property Flags: TJDISTaskFlags read FFlags write SetFlags;
  end;



  TJDISDirs = class(TJDISBaseCollection)
  public
    constructor Create(AOwner: TJDInnoSetupScript); reintroduce;
  end;

  TJDISDirAttrib = (isdaReadOnly, isdaHidden, isdaSystem, isdaNotContentIndexed);
  TJDISDirAttribs = set of TJDISDirAttrib;

  TJDISDirFlag = (isdfDeleteAfterInstall, isdfSetNTFSCompression,
    isdfUninsAlwaysUninstall, isdfUninsNeverUninstall, isdfUnsetNTFSCompression);
  TJDISDirFlags = set of TJDISDirFlag;

  TJDISDir = class(TCollectionItem)
  private
    FName: String;
    FAttribs: TJDISDirAttribs;
    FFlags: TJDISDirFlags;
    procedure SetAttribs(const Value: TJDISDirAttribs);
    procedure SetFlags(const Value: TJDISDirFlags);
    procedure SetName(const Value: String);
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
  published
    property Name: String read FName write SetName;
    property Attribs: TJDISDirAttribs read FAttribs write SetAttribs;
    //Permissions
    property Flags: TJDISDirFlags read FFlags write SetFlags;
  end;



  TJDISFiles = class(TJDISBaseCollection)
  public
    constructor Create(AOwner: TJDInnoSetupScript); reintroduce;
  end;

  TJDISFile = class(TCollectionItem)
  private
    FSource: String;
    FExternalSize: Int64;
    FStrongAssemblyName: String;
    FDestName: String;
    FDestDir: String;
    FExcludes: String;
    FFlags: TJDISFileFlags;
    procedure SetDestDir(const Value: String);
    procedure SetDestName(const Value: String);
    procedure SetExcludes(const Value: String);
    procedure SetExternalSize(const Value: Int64);
    procedure SetSource(const Value: String);
    procedure SetStrongAssemblyName(const Value: String);
    procedure SetFlags(const Value: TJDISFileFlags);
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
  published
    property Source: String read FSource write SetSource;
    property DestDir: String read FDestDir write SetDestDir;
    property DestName: String read FDestName write SetDestName;
    property Excludes: String read FExcludes write SetExcludes;
    property ExternalSize: Int64 read FExternalSize write SetExternalSize;
    //CopyMode: Obsolete
    //Attribs
    //Permissions
    //FontInstall
    property StrongAssemblyName: String read FStrongAssemblyName write SetStrongAssemblyName;
    property Flags: TJDISFileFlags read FFlags write SetFlags;
  end;

  TJDISFileFlags = class(TPersistent)
  private
    FOwner: TJDISFile;
    FDontCopy: Boolean;
    FAllowUnsafeFiles: Boolean;
    FDontVerifyChecksum: Boolean;
    FCompareTimestamp: Boolean;
    FIs32bit: Boolean;
    FCreateAllSubdirs: Boolean;
    FExternal: Boolean;
    FIs64bit: Boolean;
    FConfirmOverwrite: Boolean;
    FDeleteAfterInstall: Boolean;
    FRecurseSubdirs: Boolean;
    FSolidBreak: Boolean;
    FSignOnce: Boolean;
    FNoEncryption: Boolean;
    FSign: Boolean;
    FOnlyIfDestFileExists: Boolean;
    FIsReadme: Boolean;
    FGacInstall: Boolean;
    FRegServer: Boolean;
    FSetNTFSCompression: Boolean;
    FNoRegError: Boolean;
    FOnlyIfDoesntExists: Boolean;
    FNoCompression: Boolean;
    FSkipIfSourceDoesntExist: Boolean;
    FSharedFile: Boolean;
    FRegTypeLib: Boolean;
    FPromptIfOlder: Boolean;
    FReplaceSameVersion: Boolean;
    FRestartReplace: Boolean;
    FIgnoreVersion: Boolean;
    FOverwriteReadOnly: Boolean;
    FFontIsntTrueType: Boolean;
    FTouch: Boolean;
    FUninsNoSharedFilePrompt: Boolean;
    FSortFileByName: Boolean;
    FUninsRestartDelete: Boolean;
    FUnsetNTFSCompression: Boolean;
    FUninsRemoveReadOnly: Boolean;
    FSortFileByExtension: Boolean;
    FUninsNeverUninstall: Boolean;
    procedure SetAllowUnsafeFiles(const Value: Boolean);
    procedure SetCompareTimestamp(const Value: Boolean);
    procedure SetConfirmOverwrite(const Value: Boolean);
    procedure SetCreateAllSubdirs(const Value: Boolean);
    procedure SetDeleteAfterInstall(const Value: Boolean);
    procedure SetDontCopy(const Value: Boolean);
    procedure SetDontVerifyChecksum(const Value: Boolean);
    procedure SetExternal(const Value: Boolean);
    procedure SetIs32bit(const Value: Boolean);
    procedure SetIs64bit(const Value: Boolean);
    procedure SetFontIsntTrueType(const Value: Boolean);
    procedure SetGacInstall(const Value: Boolean);
    procedure SetIgnoreVersion(const Value: Boolean);
    procedure SetIsReadme(const Value: Boolean);
    procedure SetNoCompression(const Value: Boolean);
    procedure SetNoEncryption(const Value: Boolean);
    procedure SetNoRegError(const Value: Boolean);
    procedure SetOnlyIfDestFileExists(const Value: Boolean);
    procedure SetOnlyIfDoesntExists(const Value: Boolean);
    procedure SetOverwriteReadOnly(const Value: Boolean);
    procedure SetPromptIfOlder(const Value: Boolean);
    procedure SetRecurseSubdirs(const Value: Boolean);
    procedure SetRegServer(const Value: Boolean);
    procedure SetRegTypeLib(const Value: Boolean);
    procedure SetReplaceSameVersion(const Value: Boolean);
    procedure SetRestartReplace(const Value: Boolean);
    procedure SetSetNTFSCompression(const Value: Boolean);
    procedure SetSharedFile(const Value: Boolean);
    procedure SetSign(const Value: Boolean);
    procedure SetSignOnce(const Value: Boolean);
    procedure SetSkipIfSourceDoesntExist(const Value: Boolean);
    procedure SetSolidBreak(const Value: Boolean);
    procedure SetSortFileByExtension(const Value: Boolean);
    procedure SetSortFileByName(const Value: Boolean);
    procedure SetTouch(const Value: Boolean);
    procedure SetUninsNeverUninstall(const Value: Boolean);
    procedure SetUninsNoSharedFilePrompt(const Value: Boolean);
    procedure SetUninsRemoveReadOnly(const Value: Boolean);
    procedure SetUninsRestartDelete(const Value: Boolean);
    procedure SetUnsetNTFSCompression(const Value: Boolean);
  public
    constructor Create(AOwner: TJDISFile);
  published
    property Is32bit: Boolean read FIs32bit write SetIs32bit;
    property Is64bit: Boolean read FIs64bit write SetIs64bit;
    property AllowUnsafeFiles: Boolean read FAllowUnsafeFiles write SetAllowUnsafeFiles;
    property CompareTimestamp: Boolean read FCompareTimestamp write SetCompareTimestamp;
    property ConfirmOverwrite: Boolean read FConfirmOverwrite write SetConfirmOverwrite;
    property CreateAllSubdirs: Boolean read FCreateAllSubdirs write SetCreateAllSubdirs;
    property DeleteAfterInstall: Boolean read FDeleteAfterInstall write SetDeleteAfterInstall;
    property DontCopy: Boolean read FDontCopy write SetDontCopy;
    property DontVerifyChecksum: Boolean read FDontVerifyChecksum write SetDontVerifyChecksum;
    property External: Boolean read FExternal write SetExternal;
    property FontIsntTrueType: Boolean read FFontIsntTrueType write SetFontIsntTrueType;
    property GacInstall: Boolean read FGacInstall write SetGacInstall;
    property IgnoreVersion: Boolean read FIgnoreVersion write SetIgnoreVersion;
    property IsReadme: Boolean read FIsReadme write SetIsReadme;
    property NoCompression: Boolean read FNoCompression write SetNoCompression;
    property NoEncryption: Boolean read FNoEncryption write SetNoEncryption;
    property NoRegError: Boolean read FNoRegError write SetNoRegError;
    property OnlyIfDestFileExists: Boolean read FOnlyIfDestFileExists write SetOnlyIfDestFileExists;
    property OnlyIfDoesntExists: Boolean read FOnlyIfDoesntExists write SetOnlyIfDoesntExists;
    property OverwriteReadOnly: Boolean read FOverwriteReadOnly write SetOverwriteReadOnly;
    property PromptIfOlder: Boolean read FPromptIfOlder write SetPromptIfOlder;
    property RecurseSubdirs: Boolean read FRecurseSubdirs write SetRecurseSubdirs;
    property RegServer: Boolean read FRegServer write SetRegServer;
    property RegTypeLib: Boolean read FRegTypeLib write SetRegTypeLib;
    property ReplaceSameVersion: Boolean read FReplaceSameVersion write SetReplaceSameVersion;
    property RestartReplace: Boolean read FRestartReplace write SetRestartReplace;
    property SetNTFSCompression: Boolean read FSetNTFSCompression write SetSetNTFSCompression;
    property SharedFile: Boolean read FSharedFile write SetSharedFile;
    property Sign: Boolean read FSign write SetSign;
    property SignOnce: Boolean read FSignOnce write SetSignOnce;
    property SkipIfSourceDoesntExist: Boolean read FSkipIfSourceDoesntExist write SetSkipIfSourceDoesntExist;
    property SolidBreak: Boolean read FSolidBreak write SetSolidBreak;
    property SortFileByExtension: Boolean read FSortFileByExtension write SetSortFileByExtension;
    property SortFileByName: Boolean read FSortFileByName write SetSortFileByName;
    property Touch: Boolean read FTouch write SetTouch;
    property UninsNoSharedFilePrompt: Boolean read FUninsNoSharedFilePrompt write SetUninsNoSharedFilePrompt;
    property UninsRemoveReadOnly: Boolean read FUninsRemoveReadOnly write SetUninsRemoveReadOnly;
    property UninsRestartDelete: Boolean read FUninsRestartDelete write SetUninsRestartDelete;
    property UninsNeverUninstall: Boolean read FUninsNeverUninstall write SetUninsNeverUninstall;
    property UnsetNTFSCompression: Boolean read FUnsetNTFSCompression write SetUnsetNTFSCompression;
  end;


implementation

{ TJDInnoSetupScript }

constructor TJDInnoSetupScript.Create(AOwner: TComponent);
begin
  inherited;
  FDefines:= TJDISDefines.Create(Self);
  FSetup:= TJDISSetup.Create(Self);
  FTypes:= TJDISTypes.Create(Self);
  FComponents:= TJDISComponents.Create(Self);
  FTasks:= TJDISTasks.Create(Self);
  FDirs:= TJDISDirs.Create(Self);
  FFiles:= TJDISFiles.Create(Self);

end;

destructor TJDInnoSetupScript.Destroy;
begin

  FFiles.Free;
  FDirs.Free;
  FTasks.Free;
  FComponents.Free;
  FTypes.Free;
  FSetup.Free;
  FDefines.Free;
  inherited;
end;

procedure TJDInnoSetupScript.SetComponents(const Value: TJDISComponents);
begin
  FComponents.Assign(Value);
end;

procedure TJDInnoSetupScript.SetDefines(const Value: TJDISDefines);
begin
  FDefines.Assign(Value);
end;

procedure TJDInnoSetupScript.SetDirs(const Value: TJDISDirs);
begin
  FDIrs.Assign(Value);
end;

procedure TJDInnoSetupScript.SetFiles(const Value: TJDISFiles);
begin
  FFiles.Assign(Value);
end;

procedure TJDInnoSetupScript.SetSetup(const Value: TJDISSetup);
begin
  FSetup.Assign(Value);
end;

procedure TJDInnoSetupScript.SetTasks(const Value: TJDISTasks);
begin
  FTasks.Assign(Value);
end;

procedure TJDInnoSetupScript.SetTypes(const Value: TJDISTypes);
begin
  FTypes.Assign(Value);
end;

{ TJDISBaseCollection }

constructor TJDISBaseCollection.Create(AOwner: TJDInnoSetupScript;
  ItemClass: TCollectionItemClass);
begin
  inherited Create(AOwner, ItemClass);
  FOwner:= AOwner;
end;

{ TJDISDefines }

constructor TJDISDefines.Create(AOwner: TJDInnoSetupScript);
begin
  inherited Create(AOwner, TJDISDefine);
end;

{ TJDISDefine }

constructor TJDISDefine.Create(Collection: TCollection);
begin
  inherited;

end;

destructor TJDISDefine.Destroy;
begin

  inherited;
end;

procedure TJDISDefine.SetName(const Value: String);
begin
  FName := Value;
end;

procedure TJDISDefine.SetValue(const Value: String);
begin
  FValue := Value;
end;

{ TJDISSetup }

constructor TJDISSetup.Create(AOwner: TJDInnoSetupScript);
begin
  FOwner:= AOwner;
  FCompiler:= TJDISSetupCompiler.Create(Self);
  FInstaller:= TJDISSetupInstaller.Create(Self);
  FCosmetic:= TJDISSetupCosmetic.Create(Self);
  FObsolete:= TJDISSetupObsolete.Create(Self);
end;

destructor TJDISSetup.Destroy;
begin
  FObsolete.Free;
  FCosmetic.Free;
  FInstaller.Free;
  FCompiler.Free;
  inherited;
end;

procedure TJDISSetup.SetCompiler(const Value: TJDISSetupCompiler);
begin
  FCompiler.Assign(Value);
end;

procedure TJDISSetup.SetCosmetic(const Value: TJDISSetupCosmetic);
begin
  FCosmetic.Assign(Value);
end;

procedure TJDISSetup.SetInstaller(const Value: TJDISSetupInstaller);
begin
  FInstaller.Assign(Value);
end;

procedure TJDISSetup.SetObsolete(const Value: TJDISSetupObsolete);
begin
  FObsolete.Assign(Value);
end;

{ TJDISSetupCompiler }

constructor TJDISSetupCompiler.Create(AOwner: TJDISSetup);
begin
  FOwner:= AOwner;

end;

destructor TJDISSetupCompiler.Destroy;
begin

  inherited;
end;

{ TJDISSetupInstaller }

constructor TJDISSetupInstaller.Create(AOwner: TJDISSetup);
begin
  FOwner:= AOwner;

end;

destructor TJDISSetupInstaller.Destroy;
begin

  inherited;
end;

{ TJDISSetupCosmetic }

constructor TJDISSetupCosmetic.Create(AOwner: TJDISSetup);
begin
  FOwner:= AOwner;

end;

destructor TJDISSetupCosmetic.Destroy;
begin

  inherited;
end;

{ TJDISSetupObsolete }

constructor TJDISSetupObsolete.Create(AOwner: TJDISSetup);
begin
  FOwner:= AOwner;

end;

destructor TJDISSetupObsolete.Destroy;
begin

  inherited;
end;

{ TJDISTypes }

constructor TJDISTypes.Create(AOwner: TJDInnoSetupScript);
begin
  inherited Create(AOwner, TJDISType);
end;

{ TJDISType }

constructor TJDISType.Create(Collection: TCollection);
begin
  inherited;

end;

destructor TJDISType.Destroy;
begin

  inherited;
end;

procedure TJDISType.SetDescription(const Value: String);
begin
  FDescription := Value;
end;

procedure TJDISType.SetFlags(const Value: TJDISTypeFlags);
begin
  FFlags := Value;
end;

procedure TJDISType.SetName(const Value: String);
begin
  FName := Value;
end;

{ TJDISComponents }

constructor TJDISComponents.Create(AOwner: TJDInnoSetupScript);
begin
  inherited Create(AOwner, TJDISComponent);
end;

{ TJDISComponent }

constructor TJDISComponent.Create(Collection: TCollection);
begin
  inherited;

end;

destructor TJDISComponent.Destroy;
begin

  inherited;
end;

procedure TJDISComponent.SetDescription(const Value: String);
begin
  FDescription := Value;
end;

procedure TJDISComponent.SetExtraDiskSpaceRequired(const Value: Integer);
begin
  FExtraDiskSpaceRequired := Value;
end;

procedure TJDISComponent.SetFlags(const Value: TJDISComponentFlags);
begin
  FFlags := Value;
end;

procedure TJDISComponent.SetName(const Value: String);
begin
  FName := Value;
end;

{ TJDISTasks }

constructor TJDISTasks.Create(AOwner: TJDInnoSetupScript);
begin
  inherited Create(AOwner, TJDISTask);
end;

{ TJDISTask }

constructor TJDISTask.Create(Collection: TCollection);
begin
  inherited;

end;

destructor TJDISTask.Destroy;
begin

  inherited;
end;

procedure TJDISTask.SetDescription(const Value: String);
begin
  FDescription := Value;
end;

procedure TJDISTask.SetFlags(const Value: TJDISTaskFlags);
begin
  FFlags := Value;
end;

procedure TJDISTask.SetGroupDescription(const Value: String);
begin
  FGroupDescription := Value;
end;

procedure TJDISTask.SetName(const Value: String);
begin
  FName := Value;
end;

{ TJDISDirs }

constructor TJDISDirs.Create(AOwner: TJDInnoSetupScript);
begin
  inherited Create(AOwner, TJDISDir);
end;

{ TJDISDir }

constructor TJDISDir.Create(Collection: TCollection);
begin
  inherited;

end;

destructor TJDISDir.Destroy;
begin

  inherited;
end;

procedure TJDISDir.SetAttribs(const Value: TJDISDirAttribs);
begin
  FAttribs := Value;
end;

procedure TJDISDir.SetFlags(const Value: TJDISDirFlags);
begin
  FFlags := Value;
end;

procedure TJDISDir.SetName(const Value: String);
begin
  FName := Value;
end;

{ TJDISFiles }

constructor TJDISFiles.Create(AOwner: TJDInnoSetupScript);
begin
  inherited Create(AOwner, TJDISFile);
end;

{ TJDISFile }

constructor TJDISFile.Create(Collection: TCollection);
begin
  inherited;
  FFlags:= TJDISFileFlags.Create(Self);
end;

destructor TJDISFile.Destroy;
begin
  FFlags.Free;
  inherited;
end;

procedure TJDISFile.SetDestDir(const Value: String);
begin
  FDestDir := Value;
end;

procedure TJDISFile.SetDestName(const Value: String);
begin
  FDestName := Value;
end;

procedure TJDISFile.SetExcludes(const Value: String);
begin
  FExcludes := Value;
end;

procedure TJDISFile.SetExternalSize(const Value: Int64);
begin
  FExternalSize := Value;
end;

procedure TJDISFile.SetFlags(const Value: TJDISFileFlags);
begin
  FFlags.Assign(Value);
end;

procedure TJDISFile.SetSource(const Value: String);
begin
  FSource := Value;
end;

procedure TJDISFile.SetStrongAssemblyName(const Value: String);
begin
  FStrongAssemblyName := Value;
end;

{ TJDISFileFlags }

constructor TJDISFileFlags.Create(AOwner: TJDISFile);
begin
  FOwner:= AOwner;

end;

procedure TJDISFileFlags.SetAllowUnsafeFiles(const Value: Boolean);
begin
  FAllowUnsafeFiles := Value;
end;

procedure TJDISFileFlags.SetCompareTimestamp(const Value: Boolean);
begin
  FCompareTimestamp := Value;
end;

procedure TJDISFileFlags.SetConfirmOverwrite(const Value: Boolean);
begin
  FConfirmOverwrite := Value;
end;

procedure TJDISFileFlags.SetCreateAllSubdirs(const Value: Boolean);
begin
  FCreateAllSubdirs := Value;
end;

procedure TJDISFileFlags.SetDeleteAfterInstall(const Value: Boolean);
begin
  FDeleteAfterInstall := Value;
end;

procedure TJDISFileFlags.SetDontCopy(const Value: Boolean);
begin
  FDontCopy := Value;
end;

procedure TJDISFileFlags.SetDontVerifyChecksum(const Value: Boolean);
begin
  FDontVerifyChecksum := Value;
end;

procedure TJDISFileFlags.SetExternal(const Value: Boolean);
begin
  FExternal := Value;
end;

procedure TJDISFileFlags.SetFontIsntTrueType(const Value: Boolean);
begin
  FFontIsntTrueType := Value;
end;

procedure TJDISFileFlags.SetGacInstall(const Value: Boolean);
begin
  FGacInstall := Value;
end;

procedure TJDISFileFlags.SetIgnoreVersion(const Value: Boolean);
begin
  FIgnoreVersion := Value;
end;

procedure TJDISFileFlags.SetIs32bit(const Value: Boolean);
begin
  FIs32bit := Value;
end;

procedure TJDISFileFlags.SetIs64bit(const Value: Boolean);
begin
  FIs64bit := Value;
end;

procedure TJDISFileFlags.SetIsReadme(const Value: Boolean);
begin
  FIsReadme := Value;
end;

procedure TJDISFileFlags.SetNoCompression(const Value: Boolean);
begin
  FNoCompression := Value;
end;

procedure TJDISFileFlags.SetNoEncryption(const Value: Boolean);
begin
  FNoEncryption := Value;
end;

procedure TJDISFileFlags.SetNoRegError(const Value: Boolean);
begin
  FNoRegError := Value;
end;

procedure TJDISFileFlags.SetOnlyIfDestFileExists(const Value: Boolean);
begin
  FOnlyIfDestFileExists := Value;
end;

procedure TJDISFileFlags.SetOnlyIfDoesntExists(const Value: Boolean);
begin
  FOnlyIfDoesntExists := Value;
end;

procedure TJDISFileFlags.SetOverwriteReadOnly(const Value: Boolean);
begin
  FOverwriteReadOnly := Value;
end;

procedure TJDISFileFlags.SetPromptIfOlder(const Value: Boolean);
begin
  FPromptIfOlder := Value;
end;

procedure TJDISFileFlags.SetRecurseSubdirs(const Value: Boolean);
begin
  FRecurseSubdirs := Value;
end;

procedure TJDISFileFlags.SetRegServer(const Value: Boolean);
begin
  FRegServer := Value;
end;

procedure TJDISFileFlags.SetRegTypeLib(const Value: Boolean);
begin
  FRegTypeLib := Value;
end;

procedure TJDISFileFlags.SetReplaceSameVersion(const Value: Boolean);
begin
  FReplaceSameVersion := Value;
end;

procedure TJDISFileFlags.SetRestartReplace(const Value: Boolean);
begin
  FRestartReplace := Value;
end;

procedure TJDISFileFlags.SetSetNTFSCompression(const Value: Boolean);
begin
  FSetNTFSCompression := Value;
end;

procedure TJDISFileFlags.SetSharedFile(const Value: Boolean);
begin
  FSharedFile := Value;
end;

procedure TJDISFileFlags.SetSign(const Value: Boolean);
begin
  FSign := Value;
end;

procedure TJDISFileFlags.SetSignOnce(const Value: Boolean);
begin
  FSignOnce := Value;
end;

procedure TJDISFileFlags.SetSkipIfSourceDoesntExist(const Value: Boolean);
begin
  FSkipIfSourceDoesntExist := Value;
end;

procedure TJDISFileFlags.SetSolidBreak(const Value: Boolean);
begin
  FSolidBreak := Value;
end;

procedure TJDISFileFlags.SetSortFileByExtension(const Value: Boolean);
begin
  FSortFileByExtension := Value;
end;

procedure TJDISFileFlags.SetSortFileByName(const Value: Boolean);
begin
  FSortFileByName := Value;
end;

procedure TJDISFileFlags.SetTouch(const Value: Boolean);
begin
  FTouch := Value;
end;

procedure TJDISFileFlags.SetUninsNeverUninstall(const Value: Boolean);
begin
  FUninsNeverUninstall := Value;
end;

procedure TJDISFileFlags.SetUninsNoSharedFilePrompt(const Value: Boolean);
begin
  FUninsNoSharedFilePrompt := Value;
end;

procedure TJDISFileFlags.SetUninsRemoveReadOnly(const Value: Boolean);
begin
  FUninsRemoveReadOnly := Value;
end;

procedure TJDISFileFlags.SetUninsRestartDelete(const Value: Boolean);
begin
  FUninsRestartDelete := Value;
end;

procedure TJDISFileFlags.SetUnsetNTFSCompression(const Value: Boolean);
begin
  FUnsetNTFSCompression := Value;
end;

end.
