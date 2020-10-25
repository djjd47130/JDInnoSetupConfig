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
  TJDISIcons = class;
  TJDISIcon = class;
  TJDISInis = class;
  TJDISIni = class;
  TJDISInstallDeletes = class;
  TJDISInstallDelete = class;
  TJDISLanguages = class;
  TJDISLanguage = class;
  TJDISMessages = class;
  TJDISMessage = class;
  TJDISCustomMessages = class;
  TJDISCustomMessage = class;
  TJDISLangOptions = class;
  TJDISRegistry = class;
  TJDISRegistryItem = class;
  TJDISRuns = class;
  TJDISRun = class;
  TJDISUninstallDeletes = class;
  TJDISUninstallDelete = class;
  TJDISUninstallRuns = class;
  TJDISUninstallRun = class;




  TJDInnoSetupScript = class(TComponent)
  private
    FDefines: TJDISDefines;
    FCode: TStringList;
    FSetup: TJDISSetup;
    FTypes: TJDISTypes;
    FComponents: TJDISComponents;
    FTasks: TJDISTasks;
    FDirs: TJDISDirs;
    FFiles: TJDISFiles;
    FIcons: TJDISIcons;
    FIni: TJDISInis;
    FInstallDelete: TJDISInstallDeletes;
    FLanguages: TJDISLanguages;
    FMessages: TJDISMessages;
    FCustomMessages: TJDISCustomMessages;
    FLangOptions: TJDISLangOptions;
    FRegistry: TJDISRegistry;
    FRun: TJDISRuns;
    FUninstallDelete: TJDISUninstallDeletes;
    FUninstallRun: TJDISUninstallRuns;
    procedure SetDefines(const Value: TJDISDefines);
    procedure SetSetup(const Value: TJDISSetup);
    procedure SetTypes(const Value: TJDISTypes);
    procedure SetComponents(const Value: TJDISComponents);
    procedure SetTasks(const Value: TJDISTasks);
    procedure SetDirs(const Value: TJDISDirs);
    procedure SetFiles(const Value: TJDISFiles);
    procedure SetIcons(const Value: TJDISIcons);
    function GetCode: TStrings;
    procedure SetCode(const Value: TStrings);
    procedure SetCustomMessages(const Value: TJDISCustomMessages);
    procedure SetIni(const Value: TJDISInis);
    procedure SetInstallDelete(const Value: TJDISInstallDeletes);
    procedure SetLangOptions(const Value: TJDISLangOptions);
    procedure SetLanguages(const Value: TJDISLanguages);
    procedure SetMessages(const Value: TJDISMessages);
    procedure SetRegistry(const Value: TJDISRegistry);
    procedure SetRun(const Value: TJDISRuns);
    procedure SetUninstallDelete(const Value: TJDISUninstallDeletes);
    procedure SetUninstallRun(const Value: TJDISUninstallRuns);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure GetScript(AStrings: TStrings);
    procedure SaveScript(const AFilename: String);
  published
    property Defines: TJDISDefines read FDefines write SetDefines;
    property Code: TStrings read GetCode write SetCode;
    property Setup: TJDISSetup read FSetup write SetSetup;
    property Types: TJDISTypes read FTypes write SetTypes;
    property Components: TJDISComponents read FComponents write SetComponents;
    property Tasks: TJDISTasks read FTasks write SetTasks;
    property Dirs: TJDISDirs read FDirs write SetDirs;
    property Files: TJDISFiles read FFiles write SetFiles;
    property Icons: TJDISIcons read FIcons write SetIcons;
    property Ini: TJDISInis read FIni write SetIni;
    property InstallDelete: TJDISInstallDeletes read FInstallDelete write SetInstallDelete;
    property Languages: TJDISLanguages read FLanguages write SetLanguages;
    property Messages: TJDISMessages read FMessages write SetMessages;
    property CustomMessages: TJDISCustomMessages read FCustomMessages write SetCustomMessages;
    property LangOptions: TJDISLangOptions read FLangOptions write SetLangOptions;
    property Registry: TJDISRegistry read FRegistry write SetRegistry;
    property Run: TJDISRuns read FRun write SetRun;
    property UninstallDelete: TJDISUninstallDeletes read FUninstallDelete write SetUninstallDelete;
    property UninstallRun: TJDISUninstallRuns read FUninstallRun write SetUninstallRun;
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
    procedure AddToScript(AScript: TStrings);
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
    procedure AddToScript(AScript: TStrings);
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
    //property ASLRCompatible
    //property Compression
    //property CompressionThreads
    //property DEPCompatible
    //property DiskClusterSize
    //property DiskSliceSize
    //property DiskSpanning
    //property Encryption
    //property InternalCompressLevel
    //property LZMAAlgorithm
    //property LZMABlockSize
    //property LZMADictionarySize
    //property LZMAMatchFinder
    //property LZMANumBlockThreads
    //property LZMANumFastBytes
    //property LZMAUseSeparateProcess
    //property MergeDuplicateFiles
    //property Output
    //property OutputBaseFilename
    //property OutputDir
    //property OutputManifestFile
    //property ReserveBytes
    //property SignedUninstaller
    //property SignedUninstallerDir
    //property SignTool
    //property SignToolMinimumTimeBetween
    //property SignToolRetryCount
    //property SignToolRetryDelay
    //property SignToolRunMinimized
    //property SlicesPerDisk
    //property SolidCompression
    //property SourceDir
    //property TerminalServicesAware
    //property UsedUserAreasWarning
    //property UseSetupLdr
    //property VersionInfoCompany
    //property VersionInfoCopyright
    //property VersionInfoDescription
    //property VersionInfoOriginalFileName
    //property VersionInfoProductName
    //property VersionInfoProductTextVersion
    //property VersionInfoProductVersion
    //property VersionInfoTextVersion
    //property VersionInfoVersion
  end;

  TJDISSetupInstaller = class(TPersistent)
  private
    FOwner: TJDISSetup;
  public
    constructor Create(AOwner: TJDISSetup);
    destructor Destroy; override;
    //property AllowCancelDuringInstall
    //property AllowNetworkDrive
    //property AllowNoIcons
    //property AllowRootDirectory
    //property AllowUNCPath
    //property AlwaysRestart
    //property AlwaysShowComponentsList
    //property AlwaysShowDirOnReadyPage
    //property AlwaysShowGroupOnReadyPage
    //property AlwaysUsePersonalGroup
    //property AppendDefaultDirName
    //property AppendDefaultGroupName
    //property AppComments
    //property AppContact
    //property AppId
    //property AppModifyPath
    //property AppMutex
    //property AppName
    //property AppPublisher
    //property AppPublisherURL
    //property AppReadmeFile
    //property AppSupportPhone
    //property AppSupportURL
    //property AppUpdatesURL
    //property AppVerName
    //property AppVersion
    //property ArchitecturesAllowed
    //property ArchitecturesInstallIn64BitMode
    //property ChangesAssociations
    //property ChangesEnvironment
    //property CloseApplications
    //property CloseApplicationsFilter
    //property CreateAppDir
    //property CreateUninstallRegKey
    //property DefaultDialogFontName
    //property DefaultDirName
    //property DefaultGroupName
    //property DefaultUserInfoName
    //property DefaultUserInfoOrg
    //property DefaultUserInfoSerial
    //property DirExistsWarning
    //property DisableDirPage
    //property DisableFinishedPage
    //property DisableProgramGroupPage
    //property DisableReadyMemo
    //property DisableReadyPage
    //property DisableStartupPrompt
    //property DisableWelcomePage
    //property EnableDirDoesntExistWarning
    //property ExtraDiskSpaceRequired
    //property InfoAfterFile
    //property InfoBeforeFile
    //property LanguageDetectionMethod
    //property LicenseFile
    //property MinVersion
    //property OnlyBelowVersion
    //property Password
    //property PrivilegesRequired
    //property PrivilegesRequiredOverridesAllowed
    //property RestartApplications
    //property RestartIfNeededByRun
    //property SetupLogging
    //property SetupMutex
    //property ShowLanguageDialog
    //property TimeStampRounding
    //property TimeStampsInUTC
    //property TouchDate
    //property TouchTime
    //property Uninstallable
    //property UninstallDisplayIcon
    //property UninstallDisplayName
    //property UninstallDisplaySize
    //property UninstallFilesDir
    //property UninstallLogMode
    //property UninstallRestartComputer
    //property UpdateUninstallLogAppName
    //property UsePreviousAppDir
    //property UsePreviousGroup
    //property UsePreviousLanguage
    //property UsePreviousPrivigeles
    //property UsePreviousSetupType
    //property UsePreviousTasks
    //property UsePreviousUserInfo
    //property UserInfoPage
  end;

  TJDISSetupCosmetic = class(TPersistent)
  private
    FOwner: TJDISSetup;
  public
    constructor Create(AOwner: TJDISSetup);
    destructor Destroy; override;
    //property AppCopyright
    //property BackColor
    //property BackColor2
    //property BackColorDirection
    //property BackSolid
    //property FlatComponentsList
    //property SetupIconFile
    //property ShowComponentSizes
    //property ShowTasksTreeLines
    //property WindowShowCaption
    //property WindowStartMaximized
    //property WindowResizable
    //property WindowVisible
    //property WizardImageAlphaFormat
    //property WizardImageFile
    //property WizardImageStretch
    //property WizardResizable
    //property WizardSizePercent
    //property WizardSmallImageFile
    //property WizardStyle
  end;

  TJDISSetupObsolete = class(TPersistent)
  private
    FOwner: TJDISSetup;
  public
    constructor Create(AOwner: TJDISSetup);
    destructor Destroy; override;
    //property AlwaysCreateUninstallIcon
    //property DisableAppendDir
    //property DontMergeDuplicateFiles
    //property MessagesFile
    //property UninstallIconFile
    //property UninstallIconName
    //property UninstallStyle
    //property WizardImageBackColor
    //property WizardSmallImageBackColor
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

  //NOTE: This is in the form of a TPersistent instead of an Enum for the
  //  simple fact that there are too many flags to stuff inside an Enum.
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



  TJDISIcons = class(TJDISBaseCollection)
  public
    constructor Create(AOwner: TJDInnoSetupScript); reintroduce;
  end;

  TJDISIconFlag = (isifCloseOnExit, isifCreateOnlyIfFileExists, isifDontCloseOnExit,
    isifExcludeFromShowInNewInstall, isifFolderShortcut, isifPreventPinning,
    isifRunMaximized, isifRunMinimized, isifUninsNeverUninstall, isifUseAppPaths);
  TJDISIconFlags = set of TJDISIconFlag;

  TJDISIcon = class(TCollectionItem)
  private
    FFilename: String;
    FName: String;
    FIconIndex: Integer;
    FHotKey: String;
    FComment: String;
    FWorkingDir: String;
    FAppUserModelID: String;
    FIconFilename: String;
    FParameters: String;
    FFlags: TJDISIconFlags;
    procedure SetAppUserModelID(const Value: String);
    procedure SetComment(const Value: String);
    procedure SetFilename(const Value: String);
    procedure SetFlags(const Value: TJDISIconFlags);
    procedure SetHotKey(const Value: String);
    procedure SetIconFilename(const Value: String);
    procedure SetIconIndex(const Value: Integer);
    procedure SetName(const Value: String);
    procedure SetParameters(const Value: String);
    procedure SetWorkingDir(const Value: String);
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
  published
    property Name: String read FName write SetName;
    property Filename: String read FFilename write SetFilename;
    property Parameters: String read FParameters write SetParameters;
    property WorkingDir: String read FWorkingDir write SetWorkingDir;
    property HotKey: String read FHotKey write SetHotKey;
    property Comment: String read FComment write SetComment;
    property IconFilename: String read FIconFilename write SetIconFilename;
    property IconIndex: Integer read FIconIndex write SetIconIndex;
    property AppUserModelID: String read FAppUserModelID write SetAppUserModelID;
    property Flags: TJDISIconFlags read FFlags write SetFlags;
  end;



  TJDISInis = class(TJDISBaseCollection)
  public
    constructor Create(AOwner: TJDInnoSetupScript); reintroduce;
  end;

  TJDISIniFlag = (isinfCreateKeyIfDoesntExist, isinfUninsDeleteEntry,
    isinfUninsDeleteSection, isinfUninsDeleteSectionIfEmpty);
  TJDISIniFlags = set of TJDISIniFlag;

  TJDISIni = class(TCollectionItem)
  private
    FKey: String;
    FFilename: String;
    FSection: String;
    FString: String;
    FFlags: TJDISIniFlags;
    procedure SetFilename(const Value: String);
    procedure SetKey(const Value: String);
    procedure SetSection(const Value: String);
    procedure SetString(const Value: String);
    procedure SetFlags(const Value: TJDISIniFlags);
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
  published
    property Filename: String read FFilename write SetFilename;
    property Section: String read FSection write SetSection;
    property Key: String read FKey write SetKey;
    property &String: String read FString write SetString;
    property Flags: TJDISIniFlags read FFlags write SetFlags;
  end;



  TJDISInstallDeletes = class(TJDISBaseCollection)
  public
    constructor Create(AOwner: TJDInnoSetupScript); reintroduce;
  end;

  TJDISInstallDeleteType = (isdtFiles, isdtFilesAndOrDirs, isdtDirIfEmpty);

  TJDISInstallDelete = class(TCollectionItem)
  private
    FName: String;
    FType: TJDISInstallDeleteType;
    procedure SetName(const Value: String);
    procedure SetType(const Value: TJDISInstallDeleteType);
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
  published
    property &Type: TJDISInstallDeleteType read FType write SetType;
    property Name: String read FName write SetName;
  end;



  TJDISLanguages = class(TJDISBaseCollection)
  public
    constructor Create(AOwner: TJDInnoSetupScript); reintroduce;
  end;

  TJDISLanguage = class(TCollectionItem)
  private
    FMessagesFile: String;
    FName: String;
    FLicenseFile: String;
    FInfoAfterFile: String;
    FInfoBeforeFile: String;
    procedure SetInfoAfterFile(const Value: String);
    procedure SetInfoBeforeFile(const Value: String);
    procedure SetLicenseFile(const Value: String);
    procedure SetMessagesFile(const Value: String);
    procedure SetName(const Value: String);
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
  published
    property Name: String read FName write SetName;
    property MessagesFile: String read FMessagesFile write SetMessagesFile;
    property LicenseFile: String read FLicenseFile write SetLicenseFile;
    property InfoBeforeFile: String read FInfoBeforeFile write SetInfoBeforeFile;
    property InfoAfterFile: String read FInfoAfterFile write SetInfoAfterFile;
  end;



  TJDISMessages = class(TJDISBaseCollection)
  public
    constructor Create(AOwner: TJDInnoSetupScript); reintroduce;
  end;

  TJDISMessage = class(TCollectionItem)
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



  TJDISCustomMessages = class(TJDISBaseCollection)
  public
    constructor Create(AOwner: TJDInnoSetupScript); reintroduce;
  end;

  TJDISCustomMessage = class(TCollectionItem)
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



  TJDISLangOptions = class(TPersistent)
  private
    FOwner: TJDInnoSetupScript;
    FCopyrightFontSize: Integer;
    FLanguageName: String;
    FLanguageCodePage: Integer;
    FCopyrightFontName: String;
    FLanguageID: String;
    FDialogFontSize: Integer;
    FTitleFontSize: Integer;
    FWelcomeFontSize: Integer;
    FDialogFontName: String;
    FRightToLeft: Boolean;
    FTitleFontName: String;
    FWelcomeFontName: String;
    procedure SetCopyrightFontName(const Value: String);
    procedure SetCopyrightFontSize(const Value: Integer);
    procedure SetDialogFontName(const Value: String);
    procedure SetDialogFontSize(const Value: Integer);
    procedure SetLanguageCodePage(const Value: Integer);
    procedure SetLanguageID(const Value: String);
    procedure SetLanguageName(const Value: String);
    procedure SetRightToLeft(const Value: Boolean);
    procedure SetTitleFontName(const Value: String);
    procedure SetTitleFontSize(const Value: Integer);
    procedure SetWelcomeFontName(const Value: String);
    procedure SetWelcomeFontSize(const Value: Integer);
  public
    constructor Create(AOwner: TJDInnoSetupScript);
    destructor Destroy; override;
  published
    property LanguageName: String read FLanguageName write SetLanguageName;
    property LanguageID: String read FLanguageID write SetLanguageID;
    property LanguageCodePage: Integer read FLanguageCodePage write SetLanguageCodePage;
    property DialogFontName: String read FDialogFontName write SetDialogFontName;
    property DialogFontSize: Integer read FDialogFontSize write SetDialogFontSize;
    property WelcomeFontName: String read FWelcomeFontName write SetWelcomeFontName;
    property WelcomeFontSize: Integer read FWelcomeFontSize write SetWelcomeFontSize;
    property TitleFontName: String read FTitleFontName write SetTitleFontName;
    property TitleFontSize: Integer read FTitleFontSize write SetTitleFontSize;
    property CopyrightFontName: String read FCopyrightFontName write SetCopyrightFontName;
    property CopyrightFontSize: Integer read FCopyrightFontSize write SetCopyrightFontSize;
    property RightToLeft: Boolean read FRightToLeft write SetRightToLeft;
  end;




  TJDISRegistry = class(TJDISBaseCollection)
  public
    constructor Create(AOwner: TJDInnoSetupScript); reintroduce;
  end;

  TJDISRegRoot = (isrrCurrentUser, isrrLocalMachine, isrrClassesRoot,
    isrrUsers, isrrCurrentConfig, isrrAutoUserMachine);

  TJDISRegType = (isrtNone, isrtString, isrtExpandSz, isrtMultiSz,
    isrtDword, isrtQword, isrtBinary);

  TJDISRegFlag = (isrfCreateValueIfDoesntExist, isrfDeleteKey, isrfDeleteValue,
    isrfDontCreateKey, isrfNoError, isrfPreserveStringType, isrfUninsClearValue,
    isrfUninsDeleteKey, isrfUninsDeleteKeyIfEmpty, isrfUninsDeleteValue);
  TJDISRegFlags = set of TJDISRegFlag;

  TJDISRegistryItem = class(TCollectionItem)
  private
    FValueType: TJDISRegType;
    FValueData: String;
    FValueName: String;
    FRoot: TJDISRegRoot;
    FSubkey: String;
    FFlags: TJDISRegFlags;
    procedure SetFlags(const Value: TJDISRegFlags);
    procedure SetRoot(const Value: TJDISRegRoot);
    procedure SetSubkey(const Value: String);
    procedure SetValueData(const Value: String);
    procedure SetValueName(const Value: String);
    procedure SetValueType(const Value: TJDISRegType);
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
  published
    property Root: TJDISRegRoot read FRoot write SetRoot;
    property Subkey: String read FSubkey write SetSubkey;
    property ValueType: TJDISRegType read FValueType write SetValueType;
    property ValueName: String read FValueName write SetValueName;
    property ValueData: String read FValueData write SetValueData;
    //Permissions
    property Flags: TJDISRegFlags read FFlags write SetFlags;
  end;



  TJDISRuns = class(TJDISBaseCollection)
  public
    constructor Create(AOwner: TJDInnoSetupScript); reintroduce;
  end;

  TJDISRunFlag = (isrnf32bit, isrnf64bit, isrnfHideWizard, isrnfNoWait,
    isrnfPostInstall, isrnfRunAsCurrentUser, isrnfRunAsOriginalUser,
    isrnfRunHidden, isrnfRunMaximized, isrnfRunMinimized, isrnfShellExec,
    isrnfSkipIfDoesntExist, isrnfSkipIfNotSilent, isrnfSkipIfSilent,
    isrnfUnchecked, isrnfWaitUntilIdle, isrnfWaitUntilTerminated);
  TJDISRunFlags = set of TJDISRunFlag;

  TJDISRun = class(TCollectionItem)
  private
    FFilename: String;
    FRunOnceId: String;
    FVerb: String;
    FWorkingDir: String;
    FParameters: String;
    FDescription: String;
    FStatusMsg: String;
    FFlags: TJDISRunFlags;
    procedure SetDescription(const Value: String);
    procedure SetFilename(const Value: String);
    procedure SetFlags(const Value: TJDISRunFlags);
    procedure SetParameters(const Value: String);
    procedure SetRunOnceId(const Value: String);
    procedure SetStatusMsg(const Value: String);
    procedure SetVerb(const Value: String);
    procedure SetWorkingDir(const Value: String);
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
  published
    property Filename: String read FFilename write SetFilename;
    property Description: String read FDescription write SetDescription;
    property Parameters: String read FParameters write SetParameters;
    property WorkingDir: String read FWorkingDir write SetWorkingDir;
    property StatusMsg: String read FStatusMsg write SetStatusMsg;
    property RunOnceId: String read FRunOnceId write SetRunOnceId;
    property Verb: String read FVerb write SetVerb;
    property Flags: TJDISRunFlags read FFlags write SetFlags;
  end;




  TJDISUninstallDeletes = class(TJDISBaseCollection)
  public
    constructor Create(AOwner: TJDInnoSetupScript); reintroduce;
  end;

  TJDISUninstallDeleteType = (isudtFiles, isudtFilesAndOrDirs, isudtDirIfEmpty);

  TJDISUninstallDelete = class(TCollectionItem)
  private
    FName: String;
    FType: TJDISInstallDeleteType;
    procedure SetName(const Value: String);
    procedure SetType(const Value: TJDISInstallDeleteType);
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
  published
    property &Type: TJDISInstallDeleteType read FType write SetType;
    property Name: String read FName write SetName;
  end;



  TJDISUninstallRuns = class(TJDISBaseCollection)
  public
    constructor Create(AOwner: TJDInnoSetupScript); reintroduce;
  end;

  TJDISUninstallRunFlag = (isurf32bit, isurf64bit, isurfHideWizard,
    isurfNoWait, isurfPostInstall, isurfRunAsCurrentUser, isurfRunAsOriginalUser,
    isurfRunHidden, isurfRunMaximized, isurfRunMinimized, isurfShellExec,
    isurfSkipIfDoesntExist, isurfSkipIfNotSilent, isurfSkipIfSilent,
    isurfUnchecked, isurfWaitUntilIdle, isurfWaitUntilTerminated);
  TJDISUninstallRunFlags = set of TJDISUninstallRunFlag;

  TJDISUninstallRun = class(TCollectionItem)
  private
    FFilename: String;
    FRunOnceId: String;
    FVerb: String;
    FWorkingDir: String;
    FParameters: String;
    FDescription: String;
    FStatusMsg: String;
    FFlags: TJDISUninstallRunFlags;
    procedure SetDescription(const Value: String);
    procedure SetFilename(const Value: String);
    procedure SetFlags(const Value: TJDISUninstallRunFlags);
    procedure SetParameters(const Value: String);
    procedure SetRunOnceId(const Value: String);
    procedure SetStatusMsg(const Value: String);
    procedure SetVerb(const Value: String);
    procedure SetWorkingDir(const Value: String);
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
  published
    property Filename: String read FFilename write SetFilename;
    property Description: String read FDescription write SetDescription;
    property Parameters: String read FParameters write SetParameters;
    property WorkingDir: String read FWorkingDir write SetWorkingDir;
    property StatusMsg: String read FStatusMsg write SetStatusMsg;
    property RunOnceId: String read FRunOnceId write SetRunOnceId;
    property Verb: String read FVerb write SetVerb;
    property Flags: TJDISUninstallRunFlags read FFlags write SetFlags;
  end;





implementation

{ TJDInnoSetupScript }

constructor TJDInnoSetupScript.Create(AOwner: TComponent);
begin
  inherited;
  FDefines:= TJDISDefines.Create(Self);
  FCode:= TStringList.Create;
  FSetup:= TJDISSetup.Create(Self);
  FTypes:= TJDISTypes.Create(Self);
  FComponents:= TJDISComponents.Create(Self);
  FTasks:= TJDISTasks.Create(Self);
  FDirs:= TJDISDirs.Create(Self);
  FFiles:= TJDISFiles.Create(Self);
  FIcons:= TJDISIcons.Create(Self);
  FIni:= TJDISInis.Create(Self);
  FInstallDelete:= TJDISInstallDeletes.Create(Self);
  FLanguages:= TJDISLanguages.Create(Self);
  FMessages:= TJDISMessages.Create(Self);
  FCustomMessages:= TJDISCustomMessages.Create(Self);
  FLangOptions:= TJDISLangOptions.Create(Self);
  FRegistry:= TJDISRegistry.Create(Self);
  FRun:= TJDISRuns.Create(Self);
  FUninstallDelete:= TJDISUninstallDeletes.Create(Self);
  FUninstallRun:= TJDISUninstallRuns.Create(Self);

end;

destructor TJDInnoSetupScript.Destroy;
begin

  FUninstallRun.Free;
  FUninstallDelete.Free;
  FRun.Free;
  FRegistry.Free;
  FLangOptions.Free;
  FCustomMessages.Free;
  FMessages.Free;
  FLanguages.Free;
  FInstallDelete.Free;
  FIni.Free;
  FIcons.Free;
  FFiles.Free;
  FDirs.Free;
  FTasks.Free;
  FComponents.Free;
  FTypes.Free;
  FSetup.Free;
  FCode.Free;
  FDefines.Free;
  inherited;
end;

function TJDInnoSetupScript.GetCode: TStrings;
begin
  Result:= TStrings(FCode);
end;

procedure TJDInnoSetupScript.GetScript(AStrings: TStrings);
  procedure A(const S: String);
  begin
    AStrings.Append(S);
  end;
begin
  AStrings.Clear;

  //Header
  A('; Script generated by the JD Inno Setup Script Component.');
  A('');

  //Defines
  FDefines.AddToScript(AStrings);

  //Setup
  FSetup.AddToScript(AStrings);

  //Languages





end;

procedure TJDInnoSetupScript.SaveScript(const AFilename: String);
var
  L: TStringList;
begin
  L:= TStringList.Create;
  try
    GetScript(L);
    L.SaveToFile(AFilename);
  finally
    L.Free;
  end;
end;

procedure TJDInnoSetupScript.SetCode(const Value: TStrings);
begin
  FCode.Assign(Value);
end;

procedure TJDInnoSetupScript.SetComponents(const Value: TJDISComponents);
begin
  FComponents.Assign(Value);
end;

procedure TJDInnoSetupScript.SetCustomMessages(
  const Value: TJDISCustomMessages);
begin
  FCustomMessages.Assign(Value);
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

procedure TJDInnoSetupScript.SetIcons(const Value: TJDISIcons);
begin
  FIcons.Assign(Value);
end;

procedure TJDInnoSetupScript.SetIni(const Value: TJDISInis);
begin
  FIni.Assign(Value);
end;

procedure TJDInnoSetupScript.SetInstallDelete(const Value: TJDISInstallDeletes);
begin
  FInstallDelete.Assign(Value);
end;

procedure TJDInnoSetupScript.SetLangOptions(const Value: TJDISLangOptions);
begin
  FLangOptions.Assign(Value);
end;

procedure TJDInnoSetupScript.SetLanguages(const Value: TJDISLanguages);
begin
  FLanguages.Assign(Value);
end;

procedure TJDInnoSetupScript.SetMessages(const Value: TJDISMessages);
begin
  FMessages.Assign(Value);
end;

procedure TJDInnoSetupScript.SetRegistry(const Value: TJDISRegistry);
begin
  FRegistry.Assign(Value);
end;

procedure TJDInnoSetupScript.SetRun(const Value: TJDISRuns);
begin
  FRun.Assign(Value);
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

procedure TJDInnoSetupScript.SetUninstallDelete(
  const Value: TJDISUninstallDeletes);
begin
  FUninstallDelete.Assign(Value);
end;

procedure TJDInnoSetupScript.SetUninstallRun(const Value: TJDISUninstallRuns);
begin
  FUninstallRun.Assign(Value);
end;

{ TJDISBaseCollection }

constructor TJDISBaseCollection.Create(AOwner: TJDInnoSetupScript;
  ItemClass: TCollectionItemClass);
begin
  inherited Create(AOwner, ItemClass);
  FOwner:= AOwner;
end;

{ TJDISDefines }

procedure TJDISDefines.AddToScript(AScript: TStrings);
var
  I: TJDISDefine;
  X: Integer;
begin
  if Count > 0 then begin
    for X := 0 to Count-1 do begin
      I:= TJDISDefine(Items[X]);
      AScript.Append('#define '+I.Name+' "'+I.Value+'"');
    end;
    AScript.Append('');
  end;
end;

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

procedure TJDISSetup.AddToScript(AScript: TStrings);
begin
  //TODO: Add setup section to script file...



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

{ TJDISIcons }

constructor TJDISIcons.Create(AOwner: TJDInnoSetupScript);
begin
  inherited Create(AOwner, TJDISIcon);
end;

{ TJDISIcon }

constructor TJDISIcon.Create(Collection: TCollection);
begin
  inherited;

end;

destructor TJDISIcon.Destroy;
begin

  inherited;
end;

procedure TJDISIcon.SetAppUserModelID(const Value: String);
begin
  FAppUserModelID := Value;
end;

procedure TJDISIcon.SetComment(const Value: String);
begin
  FComment := Value;
end;

procedure TJDISIcon.SetFilename(const Value: String);
begin
  FFilename := Value;
end;

procedure TJDISIcon.SetFlags(const Value: TJDISIconFlags);
begin
  FFlags := Value;
end;

procedure TJDISIcon.SetHotKey(const Value: String);
begin
  FHotKey := Value;
end;

procedure TJDISIcon.SetIconFilename(const Value: String);
begin
  FIconFilename := Value;
end;

procedure TJDISIcon.SetIconIndex(const Value: Integer);
begin
  FIconIndex := Value;
end;

procedure TJDISIcon.SetName(const Value: String);
begin
  FName := Value;
end;

procedure TJDISIcon.SetParameters(const Value: String);
begin
  FParameters := Value;
end;

procedure TJDISIcon.SetWorkingDir(const Value: String);
begin
  FWorkingDir := Value;
end;

{ TJDISInis }

constructor TJDISInis.Create(AOwner: TJDInnoSetupScript);
begin
  inherited Create(AOwner, TJDISIni);
end;

{ TJDISIni }

constructor TJDISIni.Create(Collection: TCollection);
begin
  inherited;

end;

destructor TJDISIni.Destroy;
begin

  inherited;
end;

procedure TJDISIni.SetFilename(const Value: String);
begin
  FFilename := Value;
end;

procedure TJDISIni.SetFlags(const Value: TJDISIniFlags);
begin
  FFlags := Value;
end;

procedure TJDISIni.SetKey(const Value: String);
begin
  FKey := Value;
end;

procedure TJDISIni.SetSection(const Value: String);
begin
  FSection := Value;
end;

procedure TJDISIni.SetString(const Value: String);
begin
  FString := Value;
end;

{ TJDISInstallDeletes }

constructor TJDISInstallDeletes.Create(AOwner: TJDInnoSetupScript);
begin
  inherited Create(AOwner, TJDISInstallDelete);
end;

{ TJDISInstallDelete }

constructor TJDISInstallDelete.Create(Collection: TCollection);
begin
  inherited;

end;

destructor TJDISInstallDelete.Destroy;
begin

  inherited;
end;

procedure TJDISInstallDelete.SetName(const Value: String);
begin
  FName := Value;
end;

procedure TJDISInstallDelete.SetType(const Value: TJDISInstallDeleteType);
begin
  FType := Value;
end;

{ TJDISLanguages }

constructor TJDISLanguages.Create(AOwner: TJDInnoSetupScript);
begin
  inherited Create(AOwner, TJDISLanguage);
end;

{ TJDISLanguage }

constructor TJDISLanguage.Create(Collection: TCollection);
begin
  inherited;

end;

destructor TJDISLanguage.Destroy;
begin

  inherited;
end;

procedure TJDISLanguage.SetInfoAfterFile(const Value: String);
begin
  FInfoAfterFile := Value;
end;

procedure TJDISLanguage.SetInfoBeforeFile(const Value: String);
begin
  FInfoBeforeFile := Value;
end;

procedure TJDISLanguage.SetLicenseFile(const Value: String);
begin
  FLicenseFile := Value;
end;

procedure TJDISLanguage.SetMessagesFile(const Value: String);
begin
  FMessagesFile := Value;
end;

procedure TJDISLanguage.SetName(const Value: String);
begin
  FName := Value;
end;

{ TJDISMessages }

constructor TJDISMessages.Create(AOwner: TJDInnoSetupScript);
begin
  inherited Create(AOwner, TJDISMessage);
end;

{ TJDISMessage }

constructor TJDISMessage.Create(Collection: TCollection);
begin
  inherited;

end;

destructor TJDISMessage.Destroy;
begin

  inherited;
end;

procedure TJDISMessage.SetName(const Value: String);
begin
  FName := Value;
end;

procedure TJDISMessage.SetValue(const Value: String);
begin
  FValue := Value;
end;

{ TJDISCustomMessages }

constructor TJDISCustomMessages.Create(AOwner: TJDInnoSetupScript);
begin
  inherited Create(AOwner, TJDISCustomMessage);
end;

{ TJDISCustomMessage }

constructor TJDISCustomMessage.Create(Collection: TCollection);
begin
  inherited;

end;

destructor TJDISCustomMessage.Destroy;
begin

  inherited;
end;

procedure TJDISCustomMessage.SetName(const Value: String);
begin

end;

procedure TJDISCustomMessage.SetValue(const Value: String);
begin

end;

{ TJDISLangOptions }

constructor TJDISLangOptions.Create(AOwner: TJDInnoSetupScript);
begin
  FOwner:= AOwner;
end;

destructor TJDISLangOptions.Destroy;
begin

  inherited;
end;

procedure TJDISLangOptions.SetCopyrightFontName(const Value: String);
begin
  FCopyrightFontName := Value;
end;

procedure TJDISLangOptions.SetCopyrightFontSize(const Value: Integer);
begin
  FCopyrightFontSize := Value;
end;

procedure TJDISLangOptions.SetDialogFontName(const Value: String);
begin
  FDialogFontName := Value;
end;

procedure TJDISLangOptions.SetDialogFontSize(const Value: Integer);
begin
  FDialogFontSize := Value;
end;

procedure TJDISLangOptions.SetLanguageCodePage(const Value: Integer);
begin
  FLanguageCodePage := Value;
end;

procedure TJDISLangOptions.SetLanguageID(const Value: String);
begin
  FLanguageID := Value;
end;

procedure TJDISLangOptions.SetLanguageName(const Value: String);
begin
  FLanguageName := Value;
end;

procedure TJDISLangOptions.SetRightToLeft(const Value: Boolean);
begin
  FRightToLeft := Value;
end;

procedure TJDISLangOptions.SetTitleFontName(const Value: String);
begin
  FTitleFontName := Value;
end;

procedure TJDISLangOptions.SetTitleFontSize(const Value: Integer);
begin
  FTitleFontSize := Value;
end;

procedure TJDISLangOptions.SetWelcomeFontName(const Value: String);
begin
  FWelcomeFontName := Value;
end;

procedure TJDISLangOptions.SetWelcomeFontSize(const Value: Integer);
begin
  FWelcomeFontSize := Value;
end;

{ TJDISRegistry }

constructor TJDISRegistry.Create(AOwner: TJDInnoSetupScript);
begin
  inherited Create(AOwner, TJDISRegistryItem);
end;

{ TJDISRegistryItem }

constructor TJDISRegistryItem.Create(Collection: TCollection);
begin
  inherited;

end;

destructor TJDISRegistryItem.Destroy;
begin

  inherited;
end;

procedure TJDISRegistryItem.SetFlags(const Value: TJDISRegFlags);
begin
  FFlags := Value;
end;

procedure TJDISRegistryItem.SetRoot(const Value: TJDISRegRoot);
begin
  FRoot := Value;
end;

procedure TJDISRegistryItem.SetSubkey(const Value: String);
begin
  FSubkey := Value;
end;

procedure TJDISRegistryItem.SetValueData(const Value: String);
begin
  FValueData := Value;
end;

procedure TJDISRegistryItem.SetValueName(const Value: String);
begin
  FValueName := Value;
end;

procedure TJDISRegistryItem.SetValueType(const Value: TJDISRegType);
begin
  FValueType := Value;
end;

{ TJDISRuns }

constructor TJDISRuns.Create(AOwner: TJDInnoSetupScript);
begin
  inherited Create(AOwner, TJDISRun);
end;

{ TJDISRun }

constructor TJDISRun.Create(Collection: TCollection);
begin
  inherited;

end;

destructor TJDISRun.Destroy;
begin

  inherited;
end;

procedure TJDISRun.SetDescription(const Value: String);
begin
  FDescription := Value;
end;

procedure TJDISRun.SetFilename(const Value: String);
begin
  FFilename := Value;
end;

procedure TJDISRun.SetFlags(const Value: TJDISRunFlags);
begin
  FFlags := Value;
end;

procedure TJDISRun.SetParameters(const Value: String);
begin
  FParameters := Value;
end;

procedure TJDISRun.SetRunOnceId(const Value: String);
begin
  FRunOnceId := Value;
end;

procedure TJDISRun.SetStatusMsg(const Value: String);
begin
  FStatusMsg := Value;
end;

procedure TJDISRun.SetVerb(const Value: String);
begin
  FVerb := Value;
end;

procedure TJDISRun.SetWorkingDir(const Value: String);
begin
  FWorkingDir := Value;
end;

{ TJDISUninstallDeletes }

constructor TJDISUninstallDeletes.Create(AOwner: TJDInnoSetupScript);
begin
  inherited Create(AOwner, TJDISUninstallDelete);
end;

{ TJDISUninstallDelete }

constructor TJDISUninstallDelete.Create(Collection: TCollection);
begin
  inherited;

end;

destructor TJDISUninstallDelete.Destroy;
begin

  inherited;
end;

procedure TJDISUninstallDelete.SetName(const Value: String);
begin

end;

procedure TJDISUninstallDelete.SetType(const Value: TJDISInstallDeleteType);
begin

end;

{ TJDISUninstallRuns }

constructor TJDISUninstallRuns.Create(AOwner: TJDInnoSetupScript);
begin
  inherited Create(AOwner, TJDISUninstallRun);
end;

{ TJDISUninstallRun }

constructor TJDISUninstallRun.Create(Collection: TCollection);
begin
  inherited;

end;

destructor TJDISUninstallRun.Destroy;
begin

  inherited;
end;

procedure TJDISUninstallRun.SetDescription(const Value: String);
begin
  FDescription := Value;
end;

procedure TJDISUninstallRun.SetFilename(const Value: String);
begin
  FFilename := Value;
end;

procedure TJDISUninstallRun.SetFlags(const Value: TJDISUninstallRunFlags);
begin
  FFlags := Value;
end;

procedure TJDISUninstallRun.SetParameters(const Value: String);
begin
  FParameters := Value;
end;

procedure TJDISUninstallRun.SetRunOnceId(const Value: String);
begin
  FRunOnceId := Value;
end;

procedure TJDISUninstallRun.SetStatusMsg(const Value: String);
begin
  FStatusMsg := Value;
end;

procedure TJDISUninstallRun.SetVerb(const Value: String);
begin
  FVerb := Value;
end;

procedure TJDISUninstallRun.SetWorkingDir(const Value: String);
begin
  FWorkingDir := Value;
end;

end.
