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
  System.Classes, System.SysUtils, System.Generics.Collections,
  JD.InnoSetup.Common, JD.InnoSetup.Defaults;

type
  TJDInnoSetupScript = class;
  TJDISBaseCollection = class;
  TJDISBaseCollectionItem = class;
  TJDISDefines = class;
  TJDISDefine = class;
  TJDISSetup = class;
  TJDISSetupCompression = class;
  TJDISSetupSignature = class;
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



  ///<summary>
  ///  Encapsulates an entire Inno Setup script file. Provides properties
  ///  to represent each script section, and a structure which can be
  ///  easily modified in the Object Inspector.
  ///</summary>
  ///<remarks>
  ///  Refer to the official Inno Setup documentation for help at
  ///  https://jrsoftware.org/ishelp/
  ///</remarks>
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




  TJDISBaseCollectionItemClass = class of TJDISBaseCollectionItem;

  TJDISBaseCollection = class(TOwnedCollection)
  private
    FOwner: TJDInnoSetupScript;
    FBaseItemClass: TJDISBaseCollectionItemClass;
    FXTextBefore: TStringList;
    FXTextAfter: TStringList;
    function GetXTextAfter: TStrings;
    function GetXTextBefore: TStrings;
    procedure SetXTextAfter(const Value: TStrings);
    procedure SetXTextBefore(const Value: TStrings);
  public
    constructor Create(AOwner: TJDInnoSetupScript;
      ItemClass: TCollectionItemClass); reintroduce;
    destructor Destroy; override;
    function Add: TJDISBaseCollectionItem;
    property BaseItemClass: TJDISBaseCollectionItemClass read FBaseItemClass;
    procedure AddToScript(const ASectionName: String; AScript: TStrings); virtual;
    property XTextBefore: TStrings read GetXTextBefore write SetXTextBefore;
    property XTextAfter: TStrings read GetXTextAfter write SetXTextAfter;
  end;

  TJDISBaseCollectionItem = class(TCollectionItem)
  private
    FXTextBefore: TStringList;
    FXTextAfter: TStringList;
    function GetXTextAfter: TStrings;
    function GetXTextBefore: TStrings;
    procedure SetXTextAfter(const Value: TStrings);
    procedure SetXTextBefore(const Value: TStrings);
  protected
    function GetDisplayName: String; override;
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
    function GetFullText: String; virtual;
  published
    property XTextBefore: TStrings read GetXTextBefore write SetXTextBefore;
    property XTextAfter: TStrings read GetXTextAfter write SetXTextAfter;
  end;





  TJDISDefines = class(TJDISBaseCollection)
  private
    function GetItem(Index: Integer): TJDISDefine;
    procedure SetItem(Index: Integer; const Value: TJDISDefine);
  public
    constructor Create(AOwner: TJDInnoSetupScript); reintroduce;
    function Add: TJDISDefine;
    property Items[Index: Integer]: TJDISDefine
      read GetItem write SetItem; default;
    function GetExistsByName(const AName: String): Boolean;
    function GetItemByName(const AName: String): TJDISDefine;
  end;

  TJDISDefine = class(TJDISBaseCollectionItem)
  private
    FName: String;
    FValue: String;
    procedure SetName(const Value: String);
    procedure SetValue(const Value: String);
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
    function GetFullText: String; override;
  published
    property Name: String read FName write SetName;
    property Value: String read FValue write SetValue;
  end;




  TJDISSetup = class(TPersistent)
  private
    FXTextBefore: TStringList;
    FXTextAfter: TStringList;
    FOwner: TJDInnoSetupScript;
    FCompiler: TJDISSetupCompiler;
    FInstaller: TJDISSetupInstaller;
    FCosmetic: TJDISSetupCosmetic;
    //FObsolete: TJDISSetupObsolete;
    procedure SetCompiler(const Value: TJDISSetupCompiler);
    procedure SetCosmetic(const Value: TJDISSetupCosmetic);
    procedure SetInstaller(const Value: TJDISSetupInstaller);
    //procedure SetObsolete(const Value: TJDISSetupObsolete);
    function GetXTextAfter: TStrings;
    function GetXTextBefore: TStrings;
    procedure SetXTextAfter(const Value: TStrings);
    procedure SetXTextBefore(const Value: TStrings);
  public
    constructor Create(AOwner: TJDInnoSetupScript);
    destructor Destroy; override;
    procedure AddToScript(AScript: TStrings);
  published
    property Compiler: TJDISSetupCompiler read FCompiler write SetCompiler;
    property Installer: TJDISSetupInstaller read FInstaller write SetInstaller;
    property Cosmetic: TJDISSetupCosmetic read FCosmetic write SetCosmetic;
    //property Obsolete: TJDISSetupObsolete read FObsolete write SetObsolete;
    property XTextBefore: TStrings read GetXTextBefore write SetXTextBefore;
    property XTextAfter: TStrings read GetXTextAfter write SetXTextAfter;
  end;

  TJDISSetupCompression = class(TPersistent)
  private
    FOwner: TJDISSetupCompiler;
    FCompressionVer: Integer;
    FCompression: TJDISCompression;
    FSolidCompression: TBoolDef;
    FCompressionThreads: Integer;
    FInternalCompressLevel: TJDISInternalCompression;
    FLZMAAlgorithm: Integer;
    FLZMADictionarySize: Int64;
    FLZMANumFastBytes: Integer;
    FLZMABlockSize: Int64;
    FLZMANumBlockThreads: Integer;
    FLZMAUseSeparateProcess: TJDISCompressSeparateProcess;
    FLZMAMatchFinder: TJDISCompressMatchFinder;
    procedure SetLZMAAlgorithm(const Value: Integer);
    procedure SetLZMABlockSize(const Value: Int64);
    procedure SetLZMADictionarySize(const Value: Int64);
    procedure SetLZMANumBlockThreads(const Value: Integer);
    procedure SetLZMANumFastBytes(const Value: Integer);
    function IsLZMAAlgorithmStored: Boolean;
    function IsLZMADisctionarySizeStored: Boolean;
    function IsLZMABlockSizeStored: Boolean;
    function IsLZMANumFastBytesStored: Boolean;
    procedure SetLZMAUseSeparateProcess(
      const Value: TJDISCompressSeparateProcess);
    procedure SetLZMAMatchFinder(const Value: TJDISCompressMatchFinder);
    function IsLZMAMatchFinderStored: Boolean;
  public
    constructor Create(AOwner: TJDISSetupCompiler);
    destructor Destroy; override;
    procedure AddToScript(AScript: TStrings);
    procedure SetCompression(const Value: TJDISCompression);
    procedure SetCompressionVer(const Value: Integer);
    procedure SetCompressionThreads(const Value: Integer);
    procedure SetInternalCompressLevel(const Value: TJDISInternalCompression);
    procedure SetSolidCompression(const Value: TBoolDef);
  published
    property Compression: TJDISCompression
      read FCompression write SetCompression default DEF_COMPRESSION;
    property CompressionVer: Integer
      read FCompressionVer write SetCompressionVer default DEF_COMPRESSION_VER;
    property CompressionThreads: Integer
      read FCompressionThreads write SetCompressionThreads default DEF_COMPRESSION_THREADS;
    property InternalCompressLevel: TJDISInternalCompression
      read FInternalCompressLevel write SetInternalCompressLevel default DEF_INTERNAL_COMPRESS_LEVEL;
    property LZMAAlgorithm: Integer
      read FLZMAAlgorithm write SetLZMAAlgorithm stored IsLZMAAlgorithmStored;
    property LZMABlockSize: Int64
      read FLZMABlockSize write SetLZMABlockSize stored IsLZMABlockSizeStored;
    property LZMADictionarySize: Int64
      read FLZMADictionarySize write SetLZMADictionarySize stored IsLZMADisctionarySizeStored;
    property LZMAMatchFinder: TJDISCompressMatchFinder
      read FLZMAMatchFinder write SetLZMAMatchFinder stored IsLZMAMatchFinderStored;
    property LZMANumBlockThreads: Integer
      read FLZMANumBlockThreads write SetLZMANumBlockThreads default DEF_LZMA_BLOCK_THREADS;
    property LZMANumFastBytes: Integer
      read FLZMANumFastBytes write SetLZMANumFastBytes stored IsLZMANumFastBytesStored;
    property LZMAUseSeparateProcess: TJDISCompressSeparateProcess
      read FLZMAUseSeparateProcess write SetLZMAUseSeparateProcess default DEF_LZMA_USE_SEPARATE_PROCESS;
    property SolidCompression: TBoolDef
      read FSolidCompression write SetSolidCompression default DEF_SOLID_COMPRESSION;
  end;

  TJDISSetupSignature = class(TPersistent)
  private
    FOwner: TJDISSetupCompiler;
    FSignToolRetryCount: Integer;
    FSignToolRunMinimized: TBoolDef;
    FSignToolMinimumTimeBetween: Integer;
    FSignTool: String;
    FSignedUninstaller: TBoolDef;
    FSignToolRetryDelay: Integer;
    FSignedUninstallerDir: String;
    procedure SetSignedUninstaller(const Value: TBoolDef);
    procedure SetSignedUninstallerDir(const Value: String);
    procedure SetSignTool(const Value: String);
    procedure SetSignToolMinimumTimeBetween(const Value: Integer);
    procedure SetSignToolRetryCount(const Value: Integer);
    procedure SetSignToolRetryDelay(const Value: Integer);
    procedure SetSignToolRunMinimized(const Value: TBoolDef);
    function IsSignedUninstallerStored: Boolean;
  public
    constructor Create(AOwner: TJDISSetupCompiler);
    destructor Destroy; override;
    procedure AddToScript(AScript: TStrings);
  published
    property SignedUninstaller: TBoolDef
      read FSignedUninstaller write SetSignedUninstaller stored IsSignedUninstallerStored;
    property SignedUninstallerDir: String
      read FSignedUninstallerDir write SetSignedUninstallerDir;
    property SignTool: String
      read FSignTool write SetSignTool;
    property SignToolMinimumTimeBetween: Integer
      read FSignToolMinimumTimeBetween write SetSignToolMinimumTimeBetween default DEF_SIGN_TOOL_MIN_TIME_BETWEEN;
    property SignToolRetryCount: Integer
      read FSignToolRetryCount write SetSignToolRetryCount default DEF_SIGN_TOOL_RETRY_COUNT;
    property SignToolRetryDelay: Integer
      read FSignToolRetryDelay write SetSignToolRetryDelay default DEF_SIGN_TOOL_RETRY_DELAY;
    property SignToolRunMinimized: TBoolDef
      read FSignToolRunMinimized write SetSignToolRunMinimized default DEF_SIGN_TOOL_RUN_MINIMIZED;
  end;

  TJDISSetupCompiler = class(TPersistent)
  private
    FOwner: TJDISSetup;
    FSignature: TJDISSetupSignature;
    FCompression: TJDISSetupCompression;
    FASLRCompatible: TBoolDef;
    FDEPCompatible: TBoolDef;
    FDiskClusterSize: Integer;
    FDiskSliceSize: Int64;
    FEncryption: TBoolDef;
    FDiskSpanning: TBoolDef;
    FMergeDuplicateFiles: TBoolDef;
    FOutput: TBoolDef;
    FOutputBaseFilename: String;
    FOutputManifestFile: String;
    FOutputDir: String;
    FReserveBytes: Int64;
    FSlicesPerDisk: Integer;
    FSourceDir: String;
    FTerminalServicesAware: TBoolDef;
    FUsedUserAreasWarning: TBoolDef;
    FUseSetupLdr: TBoolDef;
    FVersionInfoDescription: String;
    FVersionInfoTextVersion: String;
    FVersionInfoCopyright: String;
    FVersionInfoProductTextVersion: String;
    FVersionInfoOriginalFileName: String;
    FVersionInfoVersion: String;
    FVersionInfoProductVersion: String;
    FVersionInfoProductName: String;
    FVersionInfoCompany: String;
    procedure SetASLRCompatible(const Value: TBoolDef);
    procedure SetDEPCompatible(const Value: TBoolDef);
    procedure SetDiskClusterSize(const Value: Integer);
    procedure SetDiskSliceSize(const Value: Int64);
    procedure SetDiskSpanning(const Value: TBoolDef);
    procedure SetEncryption(const Value: TBoolDef);
    procedure SetMergeDuplicateFiles(const Value: TBoolDef);
    procedure SetOutput(const Value: TBoolDef);
    procedure SetOutputBaseFilename(const Value: String);
    procedure SetOutputDir(const Value: String);
    procedure SetOutputManifestFile(const Value: String);
    procedure SetReserveBytes(const Value: Int64);
    procedure SetSlicesPerDisk(const Value: Integer);
    procedure SetSourceDir(const Value: String);
    procedure SetTerminalServicesAware(const Value: TBoolDef);
    procedure SetUsedUserAreasWarning(const Value: TBoolDef);
    procedure SetUseSetupLdr(const Value: TBoolDef);
    procedure SetVersionInfoCompany(const Value: String);
    procedure SetVersionInfoCopyright(const Value: String);
    procedure SetVersionInfoDescription(const Value: String);
    procedure SetVersionInfoOriginalFileName(const Value: String);
    procedure SetVersionInfoProductName(const Value: String);
    procedure SetVersionInfoProductTextVersion(const Value: String);
    procedure SetVersionInfoProductVersion(const Value: String);
    procedure SetVersionInfoTextVersion(const Value: String);
    procedure SetVersionInfoVersion(const Value: String);
    procedure SetCompression(const Value: TJDISSetupCompression);
    procedure SetSignature(const Value: TJDISSetupSignature);
  public
    constructor Create(AOwner: TJDISSetup);
    destructor Destroy; override;
    procedure AddToScript(AScript: TStrings);
  published
    property ASLRCompatible: TBoolDef
      read FASLRCompatible write SetASLRCompatible default DEF_ASLR_COMPATIBLE;
    property Compression: TJDISSetupCompression
      read FCompression write SetCompression;
    property DEPCompatible: TBoolDef
      read FDEPCompatible write SetDEPCompatible default DEF_DEP_COMPATIBLE;
    property DiskClusterSize: Integer
      read FDiskClusterSize write SetDiskClusterSize default DEF_DISK_CLUSTER_SIZE;
    property DiskSliceSize: Int64
      read FDiskSliceSize write SetDiskSliceSize default DEF_DISK_SLICE_SIZE;
    property DiskSpanning: TBoolDef
      read FDiskSpanning write SetDiskSpanning default DEF_DISK_SPANNING;
    property Encryption: TBoolDef
      read FEncryption write SetEncryption default DEF_ENCRYPTION;
    property MergeDuplicateFiles: TBoolDef
      read FMergeDuplicateFiles write SetMergeDuplicateFiles default DEF_MERGE_DUPLICATE_FILES;
    property Output: TBoolDef
      read FOutput write SetOutput default DEF_OUTPUT;
    property OutputBaseFilename: String
      read FOutputBaseFilename write SetOutputBaseFilename;
    property OutputDir: String
      read FOutputDir write SetOutputDir;
    property OutputManifestFile: String
      read FOutputManifestFile write SetOutputManifestFile;
    property ReserveBytes: Int64
      read FReserveBytes write SetReserveBytes default DEF_RESERVE_BYTES;
    property Signature: TJDISSetupSignature
      read FSignature write SetSignature;
    property SlicesPerDisk: Integer
      read FSlicesPerDisk write SetSlicesPerDisk default DEF_SLICES_PER_DISK;
    property SourceDir: String
      read FSourceDir write SetSourceDir;
    property TerminalServicesAware: TBoolDef
      read FTerminalServicesAware write SetTerminalServicesAware default DEF_TERMINAL_SERVICES_AWARE;
    property UsedUserAreasWarning: TBoolDef
      read FUsedUserAreasWarning write SetUsedUserAreasWarning default DEF_USED_USER_AREA_WARNING;
    property UseSetupLdr: TBoolDef
      read FUseSetupLdr write SetUseSetupLdr default DEF_USE_SETUP_LDR;
    property VersionInfoCompany: String
      read FVersionInfoCompany write SetVersionInfoCompany;
    property VersionInfoCopyright: String
      read FVersionInfoCopyright write SetVersionInfoCopyright;
    property VersionInfoDescription: String
      read FVersionInfoDescription write SetVersionInfoDescription;
    property VersionInfoOriginalFileName: String
      read FVersionInfoOriginalFileName write SetVersionInfoOriginalFileName;
    property VersionInfoProductName: String
      read FVersionInfoProductName write SetVersionInfoProductName;
    property VersionInfoProductTextVersion: String
      read FVersionInfoProductTextVersion write SetVersionInfoProductTextVersion;
    property VersionInfoProductVersion: String
      read FVersionInfoProductVersion write SetVersionInfoProductVersion;
    property VersionInfoTextVersion: String
      read FVersionInfoTextVersion write SetVersionInfoTextVersion;
    property VersionInfoVersion: String
      read FVersionInfoVersion write SetVersionInfoVersion;
  end;

  TJDISSetupInstaller = class(TPersistent)
  private
    FOwner: TJDISSetup;
    FAllowNoIcons: TBoolDef;
    FAllowCancelDuringInstall: TBoolDef;
    FAlwaysShowGroupOnReadyPage: TBoolDef;
    FAllowNetworkDrive: TBoolDef;
    FAlwaysShowComponentsList: TBoolDef;
    FAlwaysUsePersonalGroup: TBoolDef;
    FAlwaysShowDirOnReadyPage: TBoolDef;
    FAllowRootDirectory: TBoolDef;
    FAlwaysRestart: TBoolDef;
    FAllowUNCPath: TBoolDef;
    FAppendDefaultGroupName: TBoolDef;
    FAppendDefaultDirName: TBoolDef;
    FAppUpdatesURL: String;
    FAppSupportPhone: String;
    FAppId: String;
    FAppReadmeFile: String;
    FAppModifyPath: String;
    FAppSupportURL: String;
    FAppContact: String;
    FAppPublisherURL: String;
    FAppComments: String;
    FAppMutex: String;
    FAppVersion: String;
    FAppVerName: String;
    FAppName: String;
    FAppPublisher: String;
    FArchitecturesAllowed: TJDISArchitectures;
    FArchitecturesInstallIn64BitMode: TJDISArchitectures64;
    FCreateAppDir: TBoolDef;
    FDefaultUserInfoName: String;
    FDefaultUserInfoOrg: String;
    FDefaultUserInfoSerial: String;
    FDefaultDialogFontName: String;
    FDefaultGroupName: String;
    FDefaultDirName: String;
    FDisableStartupPrompt: TBoolDef;
    FDirExistsWarning: TBoolDefAuto;
    FDisableProgramGroupPage: TBoolDefAuto;
    FDisableFinishedPage: TBoolDef;
    FDisableDirPage: TBoolDefAuto;
    FDisableReadyPage: TBoolDef;
    FDisableWelcomePage: TBoolDef;
    FDisableReadyMemo: TBoolDef;
    FEnableDirDoesntExistWarning: TBoolDef;
    FExtraDiskSpaceRequired: Int64;
    FInfoAfterFile: String;
    FInfoBeforeFile: String;
    FLicenseFile: String;
    FMinVersion: String;
    FPassword: String;
    FOnlyBelowVersion: String;
    FRestartApplications: TBoolDef;
    FSetupLogging: TBoolDef;
    FRestartIfNeededByRun: TBoolDef;
    FShowLanguageDialog: TBoolDefAuto;
    FSetupMutex: String;
    FTimeStampRounding: Integer;
    FTimeStampsInUTC: TBoolDef;
    FUpdateUninstallLogAppName: TBoolDef;
    FUsePreviousUserInfo: TBoolDef;
    FUsePreviousSetupType: TBoolDef;
    FUserInfoPage: TBoolDef;
    FUsePreviousPrivigeles: TBoolDef;
    FUsePreviousTasks: TBoolDef;
    FUsePreviousGroup: TBoolDef;
    FUsePreviousLanguage: TBoolDef;
    FUsePreviousAppDir: TBoolDef;
    FUninstallDisplayIcon: String;
    FUninstallDisplaySize: Int64;
    FUninstallFilesDir: String;
    FUninstallDisplayName: String;
    FUninstallRestartComputer: TBoolDef;
    FChangesEnvironment: TBoolDefExpression;
    FChangesAssociations: TBoolDefExpression;
    FCloseApplicationsFilter: String;
    FCloseApplications: TJDISBoolForce;
    FCreateUninstallRegKey: TBoolDefExpression;
    FLanguageDetectionMethod: TJDISLanguageDetectMethod;
    FUninstallLogMode: TJDISUninstallLogMode;
    FTouchDateValue: TDate;
    FTouchDate: TJDISTouchDateTimeType;
    FTouchTimeValue: TTime;
    FTouchTime: TJDISTouchDateTimeType;
    FUninstallable: TBoolDefExpression;
    FPrivilegesRequiredOverridesAllowed: TJDISPrivilegesReqOverrides;
    FPrivilegesRequired: TJDISPrivilegesReq;
    procedure SetAllowCancelDuringInstall(const Value: TBoolDef);
    procedure SetAllowNetworkDrive(const Value: TBoolDef);
    procedure SetAllowNoIcons(const Value: TBoolDef);
    procedure SetAllowRootDirectory(const Value: TBoolDef);
    procedure SetAllowUNCPath(const Value: TBoolDef);
    procedure SetAlwaysRestart(const Value: TBoolDef);
    procedure SetAlwaysShowComponentsList(const Value: TBoolDef);
    procedure SetAlwaysShowDirOnReadyPage(const Value: TBoolDef);
    procedure SetAlwaysShowGroupOnReadyPage(const Value: TBoolDef);
    procedure SetAlwaysUsePersonalGroup(const Value: TBoolDef);
    procedure SetAppendDefaultDirName(const Value: TBoolDef);
    procedure SetAppendDefaultGroupName(const Value: TBoolDef);
    procedure SetAppComments(const Value: String);
    procedure SetAppContact(const Value: String);
    procedure SetAppId(const Value: String);
    procedure SetAppModifyPath(const Value: String);
    procedure SetAppMutex(const Value: String);
    procedure SetAppName(const Value: String);
    procedure SetAppPublisher(const Value: String);
    procedure SetAppPublisherURL(const Value: String);
    procedure SetAppReadmeFile(const Value: String);
    procedure SetAppSupportPhone(const Value: String);
    procedure SetAppSupportURL(const Value: String);
    procedure SetAppUpdatesURL(const Value: String);
    procedure SetAppVerName(const Value: String);
    procedure SetAppVersion(const Value: String);
    procedure SetArchitecturesAllowed(const Value: TJDISArchitectures);
    procedure SetArchitecturesInstallIn64BitMode(
      const Value: TJDISArchitectures64);
    procedure SetCreateAppDir(const Value: TBoolDef);
    procedure SetDefaultDialogFontName(const Value: String);
    procedure SetDefaultDirName(const Value: String);
    procedure SetDefaultGroupName(const Value: String);
    procedure SetDefaultUserInfoName(const Value: String);
    procedure SetDefaultUserInfoOrg(const Value: String);
    procedure SetDefaultUserInfoSerial(const Value: String);
    procedure SetDirExistsWarning(const Value: TBoolDefAuto);
    procedure SetDisableDirPage(const Value: TBoolDefAuto);
    procedure SetDisableFinishedPage(const Value: TBoolDef);
    procedure SetDisableProgramGroupPage(const Value: TBoolDefAuto);
    procedure SetDisableReadyMemo(const Value: TBoolDef);
    procedure SetDisableReadyPage(const Value: TBoolDef);
    procedure SetDisableStartupPrompt(const Value: TBoolDef);
    procedure SetDisableWelcomePage(const Value: TBoolDef);
    procedure SetEnableDirDoesntExistWarning(const Value: TBoolDef);
    procedure SetExtraDiskSpaceRequired(const Value: Int64);
    procedure SetInfoAfterFile(const Value: String);
    procedure SetInfoBeforeFile(const Value: String);
    procedure SetLicenseFile(const Value: String);
    procedure SetMinVersion(const Value: String);
    procedure SetOnlyBelowVersion(const Value: String);
    procedure SetPassword(const Value: String);
    procedure SetRestartApplications(const Value: TBoolDef);
    procedure SetRestartIfNeededByRun(const Value: TBoolDef);
    procedure SetSetupLogging(const Value: TBoolDef);
    procedure SetSetupMutex(const Value: String);
    procedure SetShowLanguageDialog(const Value: TBoolDefAuto);
    procedure SetTimeStampRounding(const Value: Integer);
    procedure SetTimeStampsInUTC(const Value: TBoolDef);
    procedure SetUpdateUninstallLogAppName(const Value: TBoolDef);
    procedure SetUsePreviousAppDir(const Value: TBoolDef);
    procedure SetUsePreviousGroup(const Value: TBoolDef);
    procedure SetUsePreviousLanguage(const Value: TBoolDef);
    procedure SetUsePreviousPrivigeles(const Value: TBoolDef);
    procedure SetUsePreviousSetupType(const Value: TBoolDef);
    procedure SetUsePreviousTasks(const Value: TBoolDef);
    procedure SetUsePreviousUserInfo(const Value: TBoolDef);
    procedure SetUserInfoPage(const Value: TBoolDef);
    procedure SetUninstallDisplayIcon(const Value: String);
    procedure SetUninstallDisplayName(const Value: String);
    procedure SetUninstallDisplaySize(const Value: Int64);
    procedure SetUninstallFilesDir(const Value: String);
    procedure SetUninstallRestartComputer(const Value: TBoolDef);
    procedure SetChangesAssociations(const Value: TBoolDefExpression);
    procedure SetChangesEnvironment(const Value: TBoolDefExpression);
    procedure SetCloseApplicationsFilter(const Value: String);
    procedure SetCloseApplications(const Value: TJDISBoolForce);
    procedure SetLanguageDetectionMethod(
      const Value: TJDISLanguageDetectMethod);
    procedure SetUninstallLogMode(const Value: TJDISUninstallLogMode);
    procedure SetTouchDate(const Value: TJDISTouchDateTimeType);
    procedure SetTouchDateValue(const Value: TDate);
    procedure SetTouchTime(const Value: TJDISTouchDateTimeType);
    procedure SetTouchTimeValue(const Value: TTime);
    procedure SetUninstallable(const Value: TBoolDefExpression);
    procedure SetPrivilegesRequired(const Value: TJDISPrivilegesReq);
    procedure SetPrivilegesRequiredOverridesAllowed(
      const Value: TJDISPrivilegesReqOverrides);
    procedure SetUninstallRegKey(const Value: TBoolDefExpression);
  public
    constructor Create(AOwner: TJDISSetup);
    destructor Destroy; override;
    procedure AddToScript(AScript: TStrings);
  published
    property AllowCancelDuringInstall: TBoolDef
      read FAllowCancelDuringInstall write SetAllowCancelDuringInstall default DEF_ALLOW_CANCEL_DURING_INSTALL;
    property AllowNetworkDrive: TBoolDef
      read FAllowNetworkDrive write SetAllowNetworkDrive default DEF_ALLOW_NETWORK_DRIVE;
    property AllowNoIcons: TBoolDef
      read FAllowNoIcons write SetAllowNoIcons default DEF_ALLOW_NO_ICONS;
    property AllowRootDirectory: TBoolDef
      read FAllowRootDirectory write SetAllowRootDirectory default DEF_ALLOW_ROOT_DIRECTORY;
    property AllowUNCPath: TBoolDef
      read FAllowUNCPath write SetAllowUNCPath default DEF_ALLOW_UNC_PATH;
    property AlwaysRestart: TBoolDef
      read FAlwaysRestart write SetAlwaysRestart default DEF_ALWAYS_RESTART;
    property AlwaysShowComponentsList: TBoolDef
      read FAlwaysShowComponentsList write SetAlwaysShowComponentsList default DEF_ALWAYS_SHOW_COMP_LIST;
    property AlwaysShowDirOnReadyPage: TBoolDef
      read FAlwaysShowDirOnReadyPage write SetAlwaysShowDirOnReadyPage default DEF_ALWAYS_SHOW_DIR_ON_READY_PAGE;
    property AlwaysShowGroupOnReadyPage: TBoolDef
      read FAlwaysShowGroupOnReadyPage write SetAlwaysShowGroupOnReadyPage default DEF_ALWAYS_SHOW_GROUP_ON_READY_PAGE;
    property AlwaysUsePersonalGroup: TBoolDef
      read FAlwaysUsePersonalGroup write SetAlwaysUsePersonalGroup default DEF_ALWAYS_USE_PERSONAL_GROUP;
    property AppendDefaultDirName: TBoolDef
      read FAppendDefaultDirName write SetAppendDefaultDirName default DEF_APPEND_DEFAULT_DIR_NAME;
    property AppendDefaultGroupName: TBoolDef
      read FAppendDefaultGroupName write SetAppendDefaultGroupName default DEF_APPEND_DEFAULT_GROUP_NAME;
    property AppComments: String read FAppComments write SetAppComments;
    property AppContact: String read FAppContact write SetAppContact;
    property AppId: String read FAppId write SetAppId;
    property AppModifyPath: String read FAppModifyPath write SetAppModifyPath;
    property AppMutex: String read FAppMutex write SetAppMutex;
    property AppName: String read FAppName write SetAppName;
    property AppPublisher: String read FAppPublisher write SetAppPublisher;
    property AppPublisherURL: String read FAppPublisherURL write SetAppPublisherURL;
    property AppReadmeFile: String read FAppReadmeFile write SetAppReadmeFile;
    property AppSupportPhone: String read FAppSupportPhone write SetAppSupportPhone;
    property AppSupportURL: String read FAppSupportURL write SetAppSupportURL;
    property AppUpdatesURL: String read FAppUpdatesURL write SetAppUpdatesURL;
    property AppVerName: String read FAppVerName write SetAppVerName;
    property AppVersion: String read FAppVersion write SetAppVersion;
    property ArchitecturesAllowed: TJDISArchitectures
      read FArchitecturesAllowed write SetArchitecturesAllowed;
    property ArchitecturesInstallIn64BitMode: TJDISArchitectures64
      read FArchitecturesInstallIn64BitMode write SetArchitecturesInstallIn64BitMode;
    property ChangesAssociations: TBoolDefExpression
      read FChangesAssociations write SetChangesAssociations;
    property ChangesEnvironment: TBoolDefExpression
      read FChangesEnvironment write SetChangesEnvironment;
    property CloseApplications: TJDISBoolForce
      read FCloseApplications write SetCloseApplications default TJDISBoolForce.isbfDefault;
    property CloseApplicationsFilter: String
      read FCloseApplicationsFilter write SetCloseApplicationsFilter;
    property CreateAppDir: TBoolDef
      read FCreateAppDir write SetCreateAppDir default TBoolDef.bdDefault;
    property CreateUninstallRegKey: TBoolDefExpression
      read FCreateUninstallRegKey write SetUninstallRegKey;
    property DefaultDialogFontName: String
      read FDefaultDialogFontName write SetDefaultDialogFontName;
    property DefaultDirName: String
      read FDefaultDirName write SetDefaultDirName;
    property DefaultGroupName: String
      read FDefaultGroupName write SetDefaultGroupName;
    property DefaultUserInfoName: String
      read FDefaultUserInfoName write SetDefaultUserInfoName;
    property DefaultUserInfoOrg: String
      read FDefaultUserInfoOrg write SetDefaultUserInfoOrg;
    property DefaultUserInfoSerial: String
      read FDefaultUserInfoSerial write SetDefaultUserInfoSerial;
    property DirExistsWarning: TBoolDefAuto
      read FDirExistsWarning write SetDirExistsWarning;
    property DisableDirPage: TBoolDefAuto
      read FDisableDirPage write SetDisableDirPage;
    property DisableFinishedPage: TBoolDef
      read FDisableFinishedPage write SetDisableFinishedPage default TBoolDef.bdDefault;
    property DisableProgramGroupPage: TBoolDefAuto
      read FDisableProgramGroupPage write SetDisableProgramGroupPage;
    property DisableReadyMemo: TBoolDef
      read FDisableReadyMemo write SetDisableReadyMemo default TBoolDef.bdDefault;
    property DisableReadyPage: TBoolDef
      read FDisableReadyPage write SetDisableReadyPage default TBoolDef.bdDefault;
    property DisableStartupPrompt: TBoolDef
      read FDisableStartupPrompt write SetDisableStartupPrompt default TBoolDef.bdDefault;
    property DisableWelcomePage: TBoolDef
      read FDisableWelcomePage write SetDisableWelcomePage default TBoolDef.bdDefault;
    property EnableDirDoesntExistWarning: TBoolDef
      read FEnableDirDoesntExistWarning write SetEnableDirDoesntExistWarning default TBoolDef.bdDefault;
    property ExtraDiskSpaceRequired: Int64
      read FExtraDiskSpaceRequired write SetExtraDiskSpaceRequired default 0;
    property InfoAfterFile: String
      read FInfoAfterFile write SetInfoAfterFile;
    property InfoBeforeFile: String
      read FInfoBeforeFile write SetInfoBeforeFile;
    property LanguageDetectionMethod: TJDISLanguageDetectMethod
      read FLanguageDetectionMethod write SetLanguageDetectionMethod default TJDISLanguageDetectMethod.isldDefault;
    property LicenseFile: String
      read FLicenseFile write SetLicenseFile;
    property MinVersion: String
      read FMinVersion write SetMinVersion;
    property OnlyBelowVersion: String
      read FOnlyBelowVersion write SetOnlyBelowVersion;
    property Password: String
      read FPassword write SetPassword;
    property PrivilegesRequired: TJDISPrivilegesReq
      read FPrivilegesRequired write SetPrivilegesRequired default TJDISPrivilegesReq.isprDefault;
    property PrivilegesRequiredOverridesAllowed: TJDISPrivilegesReqOverrides
      read FPrivilegesRequiredOverridesAllowed write SetPrivilegesRequiredOverridesAllowed;
    property RestartApplications: TBoolDef
      read FRestartApplications write SetRestartApplications default TBoolDef.bdDefault;
    property RestartIfNeededByRun: TBoolDef
      read FRestartIfNeededByRun write SetRestartIfNeededByRun default TBoolDef.bdDefault;
    property SetupLogging: TBoolDef
      read FSetupLogging write SetSetupLogging default TBoolDef.bdDefault;
    property SetupMutex: String
      read FSetupMutex write SetSetupMutex;
    property ShowLanguageDialog: TBoolDefAuto
      read FShowLanguageDialog write SetShowLanguageDialog default TBoolDefAuto.isbaDefault;
    property TimeStampRounding: Integer
      read FTimeStampRounding write SetTimeStampRounding default 2;
    property TimeStampsInUTC: TBoolDef
      read FTimeStampsInUTC write SetTimeStampsInUTC;
    property TouchDate: TJDISTouchDateTimeType
      read FTouchDate write SetTouchDate default TJDISTouchDateTimeType.isttDefault;
    property TouchDateValue: TDate
      read FTouchDateValue write SetTouchDateValue;
    property TouchTime: TJDISTouchDateTimeType
      read FTouchTime write SetTouchTime default TJDISTouchDateTimeType.isttDefault;
    property TouchTimeValue: TTime
      read FTouchTimeValue write SetTouchTimeValue;
    property Uninstallable: TBoolDefExpression
      read FUninstallable write SetUninstallable;
    property UninstallDisplayIcon: String
      read FUninstallDisplayIcon write SetUninstallDisplayIcon;
    property UninstallDisplayName: String
      read FUninstallDisplayName write SetUninstallDisplayName;
    property UninstallDisplaySize: Int64
      read FUninstallDisplaySize write SetUninstallDisplaySize default 0;
    property UninstallFilesDir: String
      read FUninstallFilesDir write SetUninstallFilesDir;
    property UninstallLogMode: TJDISUninstallLogMode
      read FUninstallLogMode write SetUninstallLogMode default TJDISUninstallLogMode.isulDefault;
    property UninstallRestartComputer: TBoolDef
      read FUninstallRestartComputer write SetUninstallRestartComputer default TBoolDef.bdDefault;
    property UpdateUninstallLogAppName: TBoolDef
      read FUpdateUninstallLogAppName write SetUpdateUninstallLogAppName default TBoolDef.bdDefault;
    property UsePreviousAppDir: TBoolDef
      read FUsePreviousAppDir write SetUsePreviousAppDir default TBoolDef.bdDefault;
    property UsePreviousGroup: TBoolDef
      read FUsePreviousGroup write SetUsePreviousGroup default TBoolDef.bdDefault;
    property UsePreviousLanguage: TBoolDef
      read FUsePreviousLanguage write SetUsePreviousLanguage default TBoolDef.bdDefault;
    property UsePreviousPrivigeles: TBoolDef
      read FUsePreviousPrivigeles write SetUsePreviousPrivigeles default TBoolDef.bdDefault;
    property UsePreviousSetupType: TBoolDef
      read FUsePreviousSetupType write SetUsePreviousSetupType default TBoolDef.bdDefault;
    property UsePreviousTasks: TBoolDef
      read FUsePreviousTasks write SetUsePreviousTasks default TBoolDef.bdDefault;
    property UsePreviousUserInfo: TBoolDef
      read FUsePreviousUserInfo write SetUsePreviousUserInfo default TBoolDef.bdDefault;
    property UserInfoPage: TBoolDef
      read FUserInfoPage write SetUserInfoPage default TBoolDef.bdDefault;
  end;

  TJDISSetupWizardSize = class(TPersistent)
  private
    FOwner: TJDISSetupCosmetic;
    FDefault: Boolean;
    FWidth: Integer;
    FHeight: Integer;
    procedure SetDefault(const Value: Boolean);
    procedure SetHeight(const Value: Integer);
    procedure SetWidth(const Value: Integer);
    function GetHeight: Integer;
    function GetWidth: Integer;
    function IsLengthStored: Boolean;
    function IsWidthStored: Boolean;
  public
    constructor Create(AOwner: TJDISSetupCosmetic);
    destructor Destroy; override;
    function GetText: String;
  published
    property Default: Boolean read FDefault write SetDefault;
    property Width: Integer read GetWidth write SetWidth stored IsWidthStored;
    property Height: Integer read GetHeight write SetHeight stored IsLengthStored;
  end;

  TJDISSetupCosmetic = class(TPersistent)
  private
    FOwner: TJDISSetup;
    FAppCopyright: String;
    FBackColor: String;
    FBackColor2: String;
    FBackColorDirection: TJDISBackColorDir;
    FBackSolid: TBoolDef;
    FShowComponentSizes: TBoolDef;
    FSetupIconFile: String;
    FFlatComponentsList: TBoolDef;
    FShowTasksTreeLines: TBoolDef;
    FWindowResizable: TBoolDef;
    FWindowStartMaximized: TBoolDef;
    FWindowShowCaption: TBoolDef;
    FWindowVisible: TBoolDef;
    FWizardImageStretch: TBoolDef;
    FWizardImageFile: String;
    FWizardResizable: TBoolDef;
    FWizardStyle: TJDISWizardStyle;
    FWizardSmallImageFile: String;
    FWizardImageAlphaFormat: TJDISWizardImageAlphaFormat;
    FWizardSizePercent: TJDISSetupWizardSize;
    procedure SetAppCopyright(const Value: String);
    procedure SetBackColor(const Value: String);
    procedure SetBackColor2(const Value: String);
    procedure SetBackColorDirection(const Value: TJDISBackColorDir);
    procedure SetBackSolid(const Value: TBoolDef);
    procedure SetFlatComponentsList(const Value: TBoolDef);
    procedure SetSetupIconFile(const Value: String);
    procedure SetShowComponentSizes(const Value: TBoolDef);
    procedure SetShowTasksTreeLines(const Value: TBoolDef);
    procedure SetWindowResizable(const Value: TBoolDef);
    procedure SetWindowShowCaption(const Value: TBoolDef);
    procedure SetWindowStartMaximized(const Value: TBoolDef);
    procedure SetWindowVisible(const Value: TBoolDef);
    procedure SetWizardImageFile(const Value: String);
    procedure SetWizardImageStretch(const Value: TBoolDef);
    procedure SetWizardResizable(const Value: TBoolDef);
    procedure SetWizardSmallImageFile(const Value: String);
    procedure SetWizardStyle(const Value: TJDISWizardStyle);
    procedure SetWizardImageAlphaFormat(
      const Value: TJDISWizardImageAlphaFormat);
  public
    constructor Create(AOwner: TJDISSetup);
    destructor Destroy; override;
    procedure AddToScript(AScript: TStrings);
  published
    property AppCopyright: String
      read FAppCopyright write SetAppCopyright;
    property BackColor: String
      read FBackColor write SetBackColor;
    property BackColor2: String
      read FBackColor2 write SetBackColor2;
    property BackColorDirection: TJDISBackColorDir
      read FBackColorDirection write SetBackColorDirection default TJDISBackColorDir.iscdTopToBottom;
    property BackSolid: TBoolDef
      read FBackSolid write SetBackSolid default TBoolDef.bdDefault;
    property FlatComponentsList: TBoolDef
      read FFlatComponentsList write SetFlatComponentsList default TBoolDef.bdDefault;
    property SetupIconFile: String
      read FSetupIconFile write SetSetupIconFile;
    property ShowComponentSizes: TBoolDef
      read FShowComponentSizes write SetShowComponentSizes default TBoolDef.bdDefault;
    property ShowTasksTreeLines: TBoolDef
      read FShowTasksTreeLines write SetShowTasksTreeLines default TBoolDef.bdDefault;
    property WindowShowCaption: TBoolDef
      read FWindowShowCaption write SetWindowShowCaption default TBoolDef.bdDefault;
    property WindowStartMaximized: TBoolDef
      read FWindowStartMaximized write SetWindowStartMaximized default TBoolDef.bdDefault;
    property WindowResizable: TBoolDef
      read FWindowResizable write SetWindowResizable default TBoolDef.bdDefault;
    property WindowVisible: TBoolDef
      read FWindowVisible write SetWindowVisible default TBoolDef.bdDefault;
    property WizardImageAlphaFormat: TJDISWizardImageAlphaFormat
      read FWizardImageAlphaFormat write SetWizardImageAlphaFormat default TJDISWizardImageAlphaFormat.isafNone;
    property WizardImageFile: String
      read FWizardImageFile write SetWizardImageFile;
    property WizardImageStretch: TBoolDef
      read FWizardImageStretch write SetWizardImageStretch default TBoolDef.bdDefault;
    property WizardResizable: TBoolDef
      read FWizardResizable write SetWizardResizable default TBoolDef.bdDefault;
    property WizardSizePercent: TJDISSetupWizardSize read FWizardSizePercent;
    property WizardSmallImageFile: String
      read FWizardSmallImageFile write SetWizardSmallImageFile;
    property WizardStyle: TJDISWizardStyle
      read FWizardStyle write SetWizardStyle default TJDISWizardStyle.iswsClassic;
  end;

  TJDISSetupObsolete = class(TPersistent)
  private
    FOwner: TJDISSetup;
  public
    constructor Create(AOwner: TJDISSetup);
    destructor Destroy; override;
    procedure AddToScript(AScript: TStrings);
  published
    //TODO
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

  TJDISType = class(TJDISBaseCollectionItem)
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
    function GetFullText: String; override;
    function FlagsStr: String;
  published
    property Name: String read FName write SetName;
    property Description: String read FDescription write SetDescription;
    property Flags: TJDISTypeFlags read FFlags write SetFlags;
  end;





  TJDISComponents = class(TJDISBaseCollection)
  public
    constructor Create(AOwner: TJDInnoSetupScript); reintroduce;
  end;

  TJDISComponent = class(TJDISBaseCollectionItem)
  private
    FName: String;
    FExtraDiskSpaceRequired: Integer;
    FDescription: String;
    FTypes: TStringList;
    FFlags: TJDISComponentFlags;
    procedure SetDescription(const Value: String);
    procedure SetExtraDiskSpaceRequired(const Value: Integer);
    procedure SetFlags(const Value: TJDISComponentFlags);
    procedure SetName(const Value: String);
    function GetTypes: TStrings;
    procedure SetTypes(const Value: TStrings);
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
    function GetFullText: String; override;
    function FlagsStr: String;
    function TypesStr: String;
  published
    property Name: String read FName write SetName;
    property Description: String read FDescription write SetDescription;
    property Types: TStrings read GetTypes write SetTypes;
    property ExtraDiskSpaceRequired: Integer read FExtraDiskSpaceRequired write SetExtraDiskSpaceRequired;
    property Flags: TJDISComponentFlags read FFlags write SetFlags;
  end;





  TJDISTasks = class(TJDISBaseCollection)
  public
    constructor Create(AOwner: TJDInnoSetupScript); reintroduce;
  end;

  TJDISTask = class(TJDISBaseCollectionItem)
  private
    FComponents: TStringList;
    FName: String;
    FGroupDescription: String;
    FDescription: String;
    FFlags: TJDISTaskFlags;
    procedure SetDescription(const Value: String);
    procedure SetFlags(const Value: TJDISTaskFlags);
    procedure SetGroupDescription(const Value: String);
    procedure SetName(const Value: String);
    function GetComponents: TStrings;
    procedure SetComponents(const Value: TStrings);
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
    function GetFullText: String; override;
    function FlagsStr: String;
  published
    property Components: TStrings read GetComponents write SetComponents;
    property Name: String read FName write SetName;
    property Description: String read FDescription write SetDescription;
    property GroupDescription: String read FGroupDescription write SetGroupDescription;
    property Flags: TJDISTaskFlags read FFlags write SetFlags;
  end;





  TJDISDirs = class(TJDISBaseCollection)
  public
    constructor Create(AOwner: TJDInnoSetupScript); reintroduce;
  end;

  TJDISDir = class(TJDISBaseCollectionItem)
  private
    FName: String;
    FAttribs: TJDISAttribs;
    FFlags: TJDISDirFlags;
    FPermissions: TJDISPermissions;
    procedure SetAttribs(const Value: TJDISAttribs);
    procedure SetFlags(const Value: TJDISDirFlags);
    procedure SetName(const Value: String);
    procedure SetPermissions(const Value: TJDISPermissions);
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
    function GetFullText: String; override;
    function AttribsStr: String;
    function FlagsStr: String;
  published
    property Name: String read FName write SetName;
    property Attribs: TJDISAttribs read FAttribs write SetAttribs;
    property Permissions: TJDISPermissions read FPermissions write SetPermissions;
    property Flags: TJDISDirFlags read FFlags write SetFlags;
  end;





  TJDISFiles = class(TJDISBaseCollection)
  public
    constructor Create(AOwner: TJDInnoSetupScript); reintroduce;
  end;

  TJDISFile = class(TJDISBaseCollectionItem)
  private
    FSource: String;
    FExternalSize: Int64;
    FStrongAssemblyName: String;
    FDestName: String;
    FDestDir: String;
    FExcludes: String;
    FComponents: TStringList;
    FFlags: TJDISFileFlags;
    FFontInstall: String;
    FAttribs: TJDISAttribs;
    FPermissions: TJDISPermissions;
    procedure SetDestDir(const Value: String);
    procedure SetDestName(const Value: String);
    procedure SetExcludes(const Value: String);
    procedure SetExternalSize(const Value: Int64);
    procedure SetSource(const Value: String);
    procedure SetStrongAssemblyName(const Value: String);
    procedure SetFlags(const Value: TJDISFileFlags);
    function GetComponents: TStrings;
    procedure SetComponents(const Value: TStrings);
    procedure SetFontInstall(const Value: String);
    procedure SetAttribs(const Value: TJDISAttribs);
    procedure SetPermissions(const Value: TJDISPermissions);
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
    function GetFullText: String; override;
    function AttribsStr: String;
  published
    property Source: String read FSource write SetSource;
    property DestDir: String read FDestDir write SetDestDir;
    property DestName: String read FDestName write SetDestName;
    property Excludes: String read FExcludes write SetExcludes;
    property ExternalSize: Int64 read FExternalSize write SetExternalSize;
    //CopyMode: Obsolete
    property Attribs: TJDISAttribs read FAttribs write SetAttribs;
    property Permissions: TJDISPermissions read FPermissions write SetPermissions;
    property FontInstall: String read FFontInstall write SetFontInstall;
    property StrongAssemblyName: String read FStrongAssemblyName write SetStrongAssemblyName;
    property Components: TStrings read GetComponents write SetComponents;
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
    function GetFlagText: String;
  published
    property Is32bit: Boolean read FIs32bit write SetIs32bit default False;
    property Is64bit: Boolean read FIs64bit write SetIs64bit default False;
    property AllowUnsafeFiles: Boolean read FAllowUnsafeFiles write SetAllowUnsafeFiles default False;
    property CompareTimestamp: Boolean read FCompareTimestamp write SetCompareTimestamp default False;
    property ConfirmOverwrite: Boolean read FConfirmOverwrite write SetConfirmOverwrite default False;
    property CreateAllSubdirs: Boolean read FCreateAllSubdirs write SetCreateAllSubdirs default False;
    property DeleteAfterInstall: Boolean read FDeleteAfterInstall write SetDeleteAfterInstall default False;
    property DontCopy: Boolean read FDontCopy write SetDontCopy default False;
    property DontVerifyChecksum: Boolean read FDontVerifyChecksum write SetDontVerifyChecksum default False;
    property External: Boolean read FExternal write SetExternal default False;
    property FontIsntTrueType: Boolean read FFontIsntTrueType write SetFontIsntTrueType default False;
    property GacInstall: Boolean read FGacInstall write SetGacInstall default False;
    property IgnoreVersion: Boolean read FIgnoreVersion write SetIgnoreVersion default False;
    property IsReadme: Boolean read FIsReadme write SetIsReadme default False;
    property NoCompression: Boolean read FNoCompression write SetNoCompression default False;
    property NoEncryption: Boolean read FNoEncryption write SetNoEncryption default False;
    property NoRegError: Boolean read FNoRegError write SetNoRegError default False;
    property OnlyIfDestFileExists: Boolean read FOnlyIfDestFileExists write SetOnlyIfDestFileExists default False;
    property OnlyIfDoesntExists: Boolean read FOnlyIfDoesntExists write SetOnlyIfDoesntExists default False;
    property OverwriteReadOnly: Boolean read FOverwriteReadOnly write SetOverwriteReadOnly default False;
    property PromptIfOlder: Boolean read FPromptIfOlder write SetPromptIfOlder default False;
    property RecurseSubdirs: Boolean read FRecurseSubdirs write SetRecurseSubdirs default False;
    property RegServer: Boolean read FRegServer write SetRegServer default False;
    property RegTypeLib: Boolean read FRegTypeLib write SetRegTypeLib default False;
    property ReplaceSameVersion: Boolean read FReplaceSameVersion write SetReplaceSameVersion default False;
    property RestartReplace: Boolean read FRestartReplace write SetRestartReplace default False;
    property SetNTFSCompression: Boolean read FSetNTFSCompression write SetSetNTFSCompression default False;
    property SharedFile: Boolean read FSharedFile write SetSharedFile default False;
    property Sign: Boolean read FSign write SetSign default False;
    property SignOnce: Boolean read FSignOnce write SetSignOnce default False;
    property SkipIfSourceDoesntExist: Boolean read FSkipIfSourceDoesntExist write SetSkipIfSourceDoesntExist default False;
    property SolidBreak: Boolean read FSolidBreak write SetSolidBreak default False;
    property SortFileByExtension: Boolean read FSortFileByExtension write SetSortFileByExtension default False;
    property SortFileByName: Boolean read FSortFileByName write SetSortFileByName default False;
    property Touch: Boolean read FTouch write SetTouch default False;
    property UninsNoSharedFilePrompt: Boolean read FUninsNoSharedFilePrompt write SetUninsNoSharedFilePrompt default False;
    property UninsRemoveReadOnly: Boolean read FUninsRemoveReadOnly write SetUninsRemoveReadOnly default False;
    property UninsRestartDelete: Boolean read FUninsRestartDelete write SetUninsRestartDelete default False;
    property UninsNeverUninstall: Boolean read FUninsNeverUninstall write SetUninsNeverUninstall default False;
    property UnsetNTFSCompression: Boolean read FUnsetNTFSCompression write SetUnsetNTFSCompression default False;
  end;





  TJDISIcons = class(TJDISBaseCollection)
  public
    constructor Create(AOwner: TJDInnoSetupScript); reintroduce;
  end;

  TJDISIcon = class(TJDISBaseCollectionItem)
  private
    FComponents: TStringList;
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
    function GetComponents: TStrings;
    procedure SetComponents(const Value: TStrings);
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
    function GetFullText: String; override;
    function FlagsStr: String;
  published
    property Components: TStrings read GetComponents write SetComponents;
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

  TJDISIni = class(TJDISBaseCollectionItem)
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
    function GetFullText: String; override;
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

  TJDISInstallDelete = class(TJDISBaseCollectionItem)
  private
    FName: String;
    FType: TJDISInstallDeleteType;
    procedure SetName(const Value: String);
    procedure SetType(const Value: TJDISInstallDeleteType);
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
    function GetFullText: String; override;
  published
    property &Type: TJDISInstallDeleteType read FType write SetType;
    property Name: String read FName write SetName;
  end;





  TJDISLanguages = class(TJDISBaseCollection)
  public
    constructor Create(AOwner: TJDInnoSetupScript); reintroduce;
  end;

  TJDISLanguage = class(TJDISBaseCollectionItem)
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
    function GetFullText: String; override;
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

  TJDISMessage = class(TJDISBaseCollectionItem)
  private
    FName: String;
    FValue: String;
    procedure SetName(const Value: String);
    procedure SetValue(const Value: String);
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
    function GetFullText: String; override;
  published
    property Name: String read FName write SetName;
    property Value: String read FValue write SetValue;
  end;





  TJDISCustomMessages = class(TJDISBaseCollection)
  public
    constructor Create(AOwner: TJDInnoSetupScript); reintroduce;
  end;

  TJDISCustomMessage = class(TJDISBaseCollectionItem)
  private
    FName: String;
    FValue: String;
    procedure SetName(const Value: String);
    procedure SetValue(const Value: String);
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
    function GetFullText: String; override;
  published
    property Name: String read FName write SetName;
    property Value: String read FValue write SetValue;
  end;





  TJDISLangOptions = class(TPersistent)
  private
    FXTextBefore: TStringList;
    FXTextAfter: TStringList;
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
    FRightToLeft: TBoolDef;
    FTitleFontName: String;
    FWelcomeFontName: String;
    procedure SetCopyrightFontName(const Value: String);
    procedure SetCopyrightFontSize(const Value: Integer);
    procedure SetDialogFontName(const Value: String);
    procedure SetDialogFontSize(const Value: Integer);
    procedure SetLanguageCodePage(const Value: Integer);
    procedure SetLanguageID(const Value: String);
    procedure SetLanguageName(const Value: String);
    procedure SetRightToLeft(const Value: TBoolDef);
    procedure SetTitleFontName(const Value: String);
    procedure SetTitleFontSize(const Value: Integer);
    procedure SetWelcomeFontName(const Value: String);
    procedure SetWelcomeFontSize(const Value: Integer);
    function GetXTextAfter: TStrings;
    function GetXTextBefore: TStrings;
    procedure SetXTextAfter(const Value: TStrings);
    procedure SetXTextBefore(const Value: TStrings);
  public
    constructor Create(AOwner: TJDInnoSetupScript);
    destructor Destroy; override;
    procedure AddToScript(AStrings: TStrings);
    function IsAllDefault: Boolean;
  published
    property LanguageName: String read FLanguageName write SetLanguageName;
    property LanguageID: String read FLanguageID write SetLanguageID;
    property LanguageCodePage: Integer read FLanguageCodePage write SetLanguageCodePage default 0;
    property DialogFontName: String read FDialogFontName write SetDialogFontName;
    property DialogFontSize: Integer read FDialogFontSize write SetDialogFontSize default 0;
    property WelcomeFontName: String read FWelcomeFontName write SetWelcomeFontName;
    property WelcomeFontSize: Integer read FWelcomeFontSize write SetWelcomeFontSize default 0;
    property TitleFontName: String read FTitleFontName write SetTitleFontName;
    property TitleFontSize: Integer read FTitleFontSize write SetTitleFontSize default 0;
    property CopyrightFontName: String read FCopyrightFontName write SetCopyrightFontName;
    property CopyrightFontSize: Integer read FCopyrightFontSize write SetCopyrightFontSize default 0;
    property RightToLeft: TBoolDef read FRightToLeft write SetRightToLeft default TBoolDef.bdDefault;
    property XTextBefore: TStrings read GetXTextBefore write SetXTextBefore;
    property XTextAfter: TStrings read GetXTextAfter write SetXTextAfter;
  end;





  TJDISRegistry = class(TJDISBaseCollection)
  public
    constructor Create(AOwner: TJDInnoSetupScript); reintroduce;
  end;

  TJDISRegistryItem = class(TJDISBaseCollectionItem)
  private
    FValueType: TJDISRegType;
    FValueData: String;
    FValueName: String;
    FRoot: TJDISRegRoot;
    FSubkey: String;
    FFlags: TJDISRegFlags;
    FPermissions: TJDISPermissions;
    procedure SetFlags(const Value: TJDISRegFlags);
    procedure SetRoot(const Value: TJDISRegRoot);
    procedure SetSubkey(const Value: String);
    procedure SetValueData(const Value: String);
    procedure SetValueName(const Value: String);
    procedure SetValueType(const Value: TJDISRegType);
    procedure SetPermissions(const Value: TJDISPermissions);
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
    function GetFullText: String; override;
    function FlagsStr: String;
  published
    property Root: TJDISRegRoot read FRoot write SetRoot;
    property Subkey: String read FSubkey write SetSubkey;
    property ValueType: TJDISRegType read FValueType write SetValueType;
    property ValueName: String read FValueName write SetValueName;
    property ValueData: String read FValueData write SetValueData;
    property Permissions: TJDISPermissions read FPermissions write SetPermissions;
    property Flags: TJDISRegFlags read FFlags write SetFlags;
  end;





  TJDISRuns = class(TJDISBaseCollection)
  public
    constructor Create(AOwner: TJDInnoSetupScript); reintroduce;
  end;

  TJDISRun = class(TJDISBaseCollectionItem)
  private
    FComponents: TStringList;
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
    function GetComponents: TStrings;
    procedure SetComponents(const Value: TStrings);
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
    function GetFullText: String; override;
  published
    property Components: TStrings read GetComponents write SetComponents;
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

  TJDISUninstallDelete = class(TJDISBaseCollectionItem)
  private
    FName: String;
    FType: TJDISInstallDeleteType;
    procedure SetName(const Value: String);
    procedure SetType(const Value: TJDISInstallDeleteType);
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
    function GetFullText: String; override;
  published
    property &Type: TJDISInstallDeleteType read FType write SetType;
    property Name: String read FName write SetName;
  end;





  TJDISUninstallRuns = class(TJDISBaseCollection)
  public
    constructor Create(AOwner: TJDInnoSetupScript); reintroduce;
  end;

  TJDISUninstallRun = class(TJDISBaseCollectionItem)
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
    function GetFullText: String; override;
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

  A('; Script generated by the JD Inno Setup Script Component.');
  A('; For more information, visit https://github.com/djjd47130/JDInnoSetupConfig');

  FDefines.AddToScript('', AStrings);

  FSetup.AddToScript(AStrings);

  FLanguages.AddToScript('Languages', AStrings);

  FTypes.AddToScript('Types', AStrings);

  FComponents.AddToScript('Components', AStrings);

  FFiles.AddToScript('Files', AStrings);

  FIcons.AddToScript('Icons', AStrings);

  FTasks.AddToScript('Tasks', AStrings);

  FDirs.AddToScript('Dirs', AStrings);

  FIni.AddToScript('INI', AStrings);

  FInstallDelete.AddToScript('InstallDelete', AStrings);

  FMessages.AddToScript('Messages', AStrings);

  FCustomMessages.AddToScript('CustomMessages', AStrings);

  FLangOptions.AddToScript(AStrings);

  FRegistry.AddToScript('Registry', AStrings);

  FRun.AddToScript('Run', AStrings);

  FUninstallDelete.AddToScript('UninstallDelete', AStrings);

  FUninstallRun.AddToScript('UninstallRun', AStrings);

  if Trim(Self.FCode.Text) <> '' then begin
    AStrings.Append('');
    AStrings.Append('[Code]');
    AStrings.AddStrings(Self.FCode);
  end;

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
  FBaseItemClass:= TJDISBaseCollectionItemClass(ItemClass);
  FXTextBefore:= TStringList.Create;
  FXTextAfter:= TStringList.Create;
end;

destructor TJDISBaseCollection.Destroy;
begin
  FreeAndNil(FXTextAfter);
  FreeAndNil(FXTextBefore);
  inherited;
end;

function TJDISBaseCollection.Add: TJDISBaseCollectionItem;
begin
  Result:= TJDISBaseCollectionItem(inherited Add);
end;

procedure TJDISBaseCollection.AddToScript(const ASectionName: String;
  AScript: TStrings);
var
  X: Integer;
  I: TJDISBaseCollectionItem;
begin
  AScript.AddStrings(FXTextBefore);
  if Count > 0 then begin
    AScript.Append('');
    if ASectionName <> '' then
      AScript.Append('['+ASectionName+']');
    for X := 0 to Count-1 do begin
      I:= TJDISBaseCollectionItem(Items[X]);
      AScript.AddStrings(I.FXTextBefore);
      AScript.Append(I.GetFullText);
      AScript.AddStrings(I.FXTextAfter);
    end;
  end;
  AScript.AddStrings(FXTextAfter);
end;

function TJDISBaseCollection.GetXTextAfter: TStrings;
begin
  Result:= TStrings(FXTextAfter);
end;

function TJDISBaseCollection.GetXTextBefore: TStrings;
begin
  Result:= TStrings(FXTextBefore);
end;

procedure TJDISBaseCollection.SetXTextAfter(const Value: TStrings);
begin
  FXTextAfter.Assign(Value);
end;

procedure TJDISBaseCollection.SetXTextBefore(const Value: TStrings);
begin
  FXTextBefore.Assign(Value);
end;

{ TJDISBaseCollectionItem }

constructor TJDISBaseCollectionItem.Create(Collection: TCollection);
begin
  inherited Create(Collection);
  FXTextBefore:= TStringList.Create;
  FXTextAfter:= TStringList.Create;
end;

destructor TJDISBaseCollectionItem.Destroy;
begin
  FreeAndNil(FXTextAfter);
  FreeAndNil(FXTextBefore);
  inherited;
end;

function TJDISBaseCollectionItem.GetDisplayName: String;
begin
  Result:= GetFullText;
end;

function TJDISBaseCollectionItem.GetFullText: String;
begin
  //Expected inherited to be responsible...
end;

function TJDISBaseCollectionItem.GetXTextAfter: TStrings;
begin
  Result:= TStrings(FXTextAfter);
end;

function TJDISBaseCollectionItem.GetXTextBefore: TStrings;
begin
  Result:= TStrings(FXTextBefore);
end;

procedure TJDISBaseCollectionItem.SetXTextAfter(const Value: TStrings);
begin
  FXTextAfter.Assign(Value);
end;

procedure TJDISBaseCollectionItem.SetXTextBefore(const Value: TStrings);
begin
  FXTextBefore.Assign(Value);
end;

{ TJDISDefines }

constructor TJDISDefines.Create(AOwner: TJDInnoSetupScript);
begin
  inherited Create(AOwner, TJDISDefine);
end;

function TJDISDefines.Add: TJDISDefine;
begin
  Result:= TJDISDefine(inherited Add);
end;

function TJDISDefines.GetExistsByName(const AName: String): Boolean;
begin
  Result:= GetItemByName(AName) <> nil;
end;

function TJDISDefines.GetItem(Index: Integer): TJDISDefine;
begin
  Result:= TJDISDefine(inherited Items[Index]);
end;

function TJDISDefines.GetItemByName(const AName: String): TJDISDefine;
var
  X: Integer;
  D: TJDISDefine;
begin
  Result:= nil;
  for X := 0 to Count-1 do begin
    D:= TJDISDefine(Items[X]);
    if SameText(D.Name, AName) then begin
      Result:= D;
      Break;
    end;
  end;
end;

procedure TJDISDefines.SetItem(Index: Integer; const Value: TJDISDefine);
begin
  inherited Items[Index].Assign(Value);
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

function TJDISDefine.GetFullText: String;
begin
  Result:= '#define '+FName+' "'+FValue+'"';
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
  FXTextBefore:= TStringList.Create;
  FXTextAfter:= TStringList.Create;
  FCompiler:= TJDISSetupCompiler.Create(Self);
  FInstaller:= TJDISSetupInstaller.Create(Self);
  FCosmetic:= TJDISSetupCosmetic.Create(Self);
  //FObsolete:= TJDISSetupObsolete.Create(Self);
end;

destructor TJDISSetup.Destroy;
begin
  //FObsolete.Free;
  FCosmetic.Free;
  FInstaller.Free;
  FCompiler.Free;
  FXTextAfter.Free;
  FXTextBefore.Free;
  inherited;
end;

function TJDISSetup.GetXTextAfter: TStrings;
begin
  Result:= TStrings(FXTextAfter);
end;

function TJDISSetup.GetXTextBefore: TStrings;
begin
  Result:= TStrings(FXTextBefore);
end;

procedure TJDISSetup.AddToScript(AScript: TStrings);
begin
  AScript.Append('');
  AScript.Append('[Setup]');
  FCompiler.AddToScript(AScript);
  FInstaller.AddToScript(AScript);
  FCosmetic.AddToScript(AScript);
  //FObsolete.AddToScript(AScript);
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

procedure TJDISSetup.SetXTextAfter(const Value: TStrings);
begin
  FXTextAfter.Assign(Value);
end;

procedure TJDISSetup.SetXTextBefore(const Value: TStrings);
begin
  FXTextBefore.Assign(Value);
end;

{
procedure TJDISSetup.SetObsolete(const Value: TJDISSetupObsolete);
begin
  FObsolete.Assign(Value);
end;
}

{ TJDISSetupCompression }

constructor TJDISSetupCompression.Create(AOwner: TJDISSetupCompiler);
begin
  FOwner:= AOwner;

end;

destructor TJDISSetupCompression.Destroy;
begin

  inherited;
end;

procedure TJDISSetupCompression.AddToScript(AScript: TStrings);
  procedure A(const S: String);
  begin
    AScript.Append(S);
  end;
  procedure AP(const N, V: String);
  begin
    A(N+'='+V);
  end;
  procedure ABD(const AName: String; const AValue: TBoolDef);
  begin
    case AValue of
      bdDefault:  ;
      bdFalse:    AP(AName, 'no');
      bdTrue:     AP(AName, 'yes');
    end;
  end;
  procedure AST(const AName: String; const AValue: String);
  begin
    if AValue <> '' then
      AP(AName, AValue);
  end;
begin

  case Self.FCompression of
    iscDefault:       ;
    iscZip:           AP('Compression', 'zip');
    iscZipVer:        AP('Compression', 'zip/'+IntToStr(FCompressionVer));
    iscBzip:          AP('Compression', 'bzip');
    iscBzipVer:       AP('Compression', 'bzip/'+IntToStr(FCompressionVer));
    iscLzma:          AP('Compression', 'lzma');
    iscLzmaFast:      AP('Compression', 'lzma/fast');
    iscLzmaNormal:    AP('Compression', 'lzma/normal');
    iscLzmaMax:       AP('Compression', 'lzma/max');
    iscLzmaUltra:     AP('Compression', 'lzma/ultra');
    iscLzmaUltra64:   AP('Compression', 'lzma/ultra64');
    iscLzma2:         AP('Compression', 'lzma2');
    iscLzma2Fast:     AP('Compression', 'lzma2/fast');
    iscLzma2Normal:   AP('Compression', 'lzma2/normal');
    iscLzma2Max:      AP('Compression', 'lzma2/max');
    iscLzma2Ultra:    AP('Compression', 'lzma2/ultra');
    iscLzma2Ultra64:  AP('Compression', 'lzma2/ultra64');
    iscNone:          AP('Compression', 'none');
  end;

  if Self.FCompressionThreads <> 0 then begin
    AP('CompressionThreads', IntToStr(FCompressionThreads));
  end;

  case Self.FInternalCompressLevel of
    isicNormal:       ;
    isicZip:          AP('InternalCompressLevel', 'zip');
    isicZipVer:       AP('InternalCompressLevel', 'zip/'+IntToStr(FCompressionVer));
    isicBzip:         AP('InternalCompressLevel', 'bzip');
    isicBzipVer:      AP('InternalCompressLevel', 'bzip/'+IntToStr(FCompressionVer));
    isicLzma:         AP('InternalCompressLevel', 'lzma');
    isicLzmaFast:     AP('InternalCompressLevel', 'lzma/fast');
    isicLzmaNormal:   AP('InternalCompressLevel', 'lzma/normal');
    isicLzmaMax:      AP('InternalCompressLevel', 'lzma/max');
    isicLzmaUltra:    AP('InternalCompressLevel', 'lzma/ultra');
    isicLzmaUltra64:  AP('InternalCompressLevel', 'lzma/ultra64');
    isicLzma2:        AP('InternalCompressLevel', 'lzma2');
    isicLzma2Fast:    AP('InternalCompressLevel', 'lzma2/fast');
    isicLzma2Normal:  AP('InternalCompressLevel', 'lzma2/normal');
    isicLzma2Max:     AP('InternalCompressLevel', 'lzma2/max');
    isicLzma2Ultra:   AP('InternalCompressLevel', 'lzma2/ultra');
    isicLzma2Ultra64: AP('InternalCompressLevel', 'lzma2/ultra64');
    isicNone:         AP('InternalCompressLevel', 'none');
  end;

  ABD('SolidCompression', FSolidCompression);

  //LZMAAlgorithm
  //TODO: Need a clever way to re-use default specification...

  //LZMABlockSize

  //LZMADictionarySize

  //LZMAMatchFinder

  //LZMANumBlockThreads

  //LZMANumFastBytes

  //LZMAUseSeparateProcess



end;

function TJDISSetupCompression.IsLZMAAlgorithmStored: Boolean;
begin
  //TODO
  Result:= True;
end;

function TJDISSetupCompression.IsLZMABlockSizeStored: Boolean;
begin
  //TODO
  Result:= True;
end;

function TJDISSetupCompression.IsLZMADisctionarySizeStored: Boolean;
begin
  //TODO
  Result:= True;
end;

function TJDISSetupCompression.IsLZMAMatchFinderStored: Boolean;
begin
  //TODO
  Result:= True;
end;

function TJDISSetupCompression.IsLZMANumFastBytesStored: Boolean;
begin
  //TODO
  Result:= True;
end;

procedure TJDISSetupCompression.SetCompression(const Value: TJDISCompression);
begin
  FCompression:= Value;
end;

procedure TJDISSetupCompression.SetCompressionThreads(const Value: Integer);
begin
  FCompressionThreads:= Value;
end;

procedure TJDISSetupCompression.SetCompressionVer(const Value: Integer);
begin
  FCompressionVer:= Value;
end;

procedure TJDISSetupCompression.SetInternalCompressLevel(
  const Value: TJDISInternalCompression);
begin
  FInternalCompressLevel:= Value;
end;

procedure TJDISSetupCompression.SetLZMAAlgorithm(const Value: Integer);
begin
  FLZMAAlgorithm := Value;
end;

procedure TJDISSetupCompression.SetLZMABlockSize(const Value: Int64);
begin
  FLZMABlockSize := Value;
end;

procedure TJDISSetupCompression.SetLZMADictionarySize(const Value: Int64);
begin
  FLZMADictionarySize := Value;
end;

procedure TJDISSetupCompression.SetLZMAMatchFinder(
  const Value: TJDISCompressMatchFinder);
begin
  FLZMAMatchFinder := Value;
end;

procedure TJDISSetupCompression.SetLZMANumBlockThreads(const Value: Integer);
begin
  FLZMANumBlockThreads := Value;
end;

procedure TJDISSetupCompression.SetLZMANumFastBytes(const Value: Integer);
begin
  FLZMANumFastBytes := Value;
end;

procedure TJDISSetupCompression.SetLZMAUseSeparateProcess(
  const Value: TJDISCompressSeparateProcess);
begin
  FLZMAUseSeparateProcess := Value;
end;

procedure TJDISSetupCompression.SetSolidCompression(const Value: TBoolDef);
begin
  FSolidCompression:= Value;
end;

{ TJDISSetupSignature }

constructor TJDISSetupSignature.Create(AOwner: TJDISSetupCompiler);
begin
  FOwner:= AOwner;
  FSignToolRetryCount:= 2;
  FSignToolRetryDelay:= 500;

end;

destructor TJDISSetupSignature.Destroy;
begin

  inherited;
end;

procedure TJDISSetupSignature.AddToScript(AScript: TStrings);
begin

  case FSignedUninstaller of
    bdDefault:  ;
    bdFalse:    AScript.Append('SignedUninstaller=no');
    bdTrue:     AScript.Append('SignedUninstaller=yes');
  end;

  if FSignedUninstallerDir <> '' then
    AScript.Append('SignedUninstallerDir='+FSignedUninstallerDir);

  if FSignTool <> '' then
    AScript.Append('SignTool='+FSignTool);

  if FSignToolMinimumTimeBetween <> 0 then
    AScript.Append('SignToolMinimumTimeBetween='+IntToStr(FSignToolMinimumTimeBetween));

  if FSignToolRetryCount <> 2 then
    AScript.Append('SignToolRetryCount='+IntToStr(FSignToolRetryCount));

  if FSignToolRetryDelay <> 500 then
    AScript.Append('SignToolRetryDelay'+IntToStr(FSignToolRetryDelay));

  case FSignToolRunMinimized of
    bdDefault:  ;
    bdFalse:    AScript.Append('SignToolRunMinimized=no');
    bdTrue:     AScript.Append('SignToolRunMinimized=yes');
  end;



end;

function TJDISSetupSignature.IsSignedUninstallerStored: Boolean;
begin
  Result:= (Self.FSignedUninstaller <> TBoolDef.bdDefault) or
    (Self.FSignTool <> '');
end;

procedure TJDISSetupSignature.SetSignedUninstaller(const Value: TBoolDef);
begin
  FSignedUninstaller := Value;
end;

procedure TJDISSetupSignature.SetSignedUninstallerDir(const Value: String);
begin
  FSignedUninstallerDir := Value;
end;

procedure TJDISSetupSignature.SetSignTool(const Value: String);
begin
  FSignTool := Value;
end;

procedure TJDISSetupSignature.SetSignToolMinimumTimeBetween(
  const Value: Integer);
begin
  FSignToolMinimumTimeBetween := Value;
end;

procedure TJDISSetupSignature.SetSignToolRetryCount(const Value: Integer);
begin
  FSignToolRetryCount := Value;
end;

procedure TJDISSetupSignature.SetSignToolRetryDelay(const Value: Integer);
begin
  FSignToolRetryDelay := Value;
end;

procedure TJDISSetupSignature.SetSignToolRunMinimized(const Value: TBoolDef);
begin
  FSignToolRunMinimized := Value;
end;

{ TJDISSetupCompiler }

constructor TJDISSetupCompiler.Create(AOwner: TJDISSetup);
begin
  FOwner:= AOwner;
  FCompression:= TJDISSetupCompression.Create(Self);
  FSignature:= TJDISSetupSignature.Create(Self);

  //TODO: Set defaults...
  Self.FDiskClusterSize:= 512;
  Self.FDiskSliceSize:= 2100000000;
  Self.FSlicesPerDisk:= 1;

end;

destructor TJDISSetupCompiler.Destroy;
begin

  FreeAndNil(FSignature);
  FreeAndNil(FCompression);
  inherited;
end;

procedure TJDISSetupCompiler.AddToScript(AScript: TStrings);
  procedure A(const S: String);
  begin
    AScript.Append(S);
  end;
  procedure AP(const N, V: String);
  begin
    A(N+'='+V);
  end;
  procedure ABD(const AName: String; const AValue: TBoolDef);
  begin
    case AValue of
      bdDefault:  ;
      bdFalse:    AP(AName, 'no');
      bdTrue:     AP(AName, 'yes');
    end;
  end;
  procedure AST(const AName: String; const AValue: String);
  begin
    if AValue <> '' then
      AP(AName, AValue);
  end;
begin
  Self.FCompression.AddToScript(AScript);

  Self.FSignature.AddToScript(AScript);





  ABD('ASLRCompatible', FASLRCompatible);

  ABD('DEPCompatible', FDEPCompatible);

  if Self.FDiskClusterSize <> 512 then begin
    AP('DiskClusterSize', IntToStr(FDiskClusterSize));
  end;

  if Self.FDiskSliceSize <> 2100000000 then begin
    AP('DiskSliceSize', IntToStr(FDiskSliceSize));
  end;

  ABD('DiskSpanning', FDiskSpanning);

  ABD('Encryption', FEncryption);

  ABD('MergeDuplicateFiles', FMergeDuplicateFiles);

  ABD('Output', FOutput);

  AST('OutputBaseFilename', FOutputBaseFilename);

  AST('OutputDir', FOutputDir);

  AST('OutputManifestFile', FOutputManifestFile);

  if Self.FReserveBytes <> 0 then begin
    AP('ReserveBytes', IntToStr(FReserveBytes));
  end;

  if Self.FSlicesPerDisk <> 1 then begin
    AP('SlicesPerDisk', IntToStr(FSlicesPerDisk));
  end;

  AST('SourceDir', FSourceDir);

  ABD('TerminalServicesAware', FTerminalServicesAware);

  ABD('UsedUserAreasWarning', Self.FUsedUserAreasWarning);

  AST('VersionInfoCompany', FVersionInfoCompany);

  AST('VersionInfoCopyright', FVersionInfoCopyright);

  AST('VersionInfoDescription', FVersionInfoDescription);

  AST('VersionInfoOriginalFileName', FVersionInfoOriginalFileName);

  AST('VersionInfoProductName', FVersionInfoProductName);

  AST('VersionInfoProductTextVersion', FVersionInfoProductTextVersion);

  AST('VersionInfoProductVersion', FVersionInfoProductVersion);

  AST('VersionInfoTextVersion', FVersionInfoTextVersion);

  AST('VersionInfoVersion', FVersionInfoVersion);

end;

procedure TJDISSetupCompiler.SetASLRCompatible(const Value: TBoolDef);
begin
  FASLRCompatible := Value;
end;
procedure TJDISSetupCompiler.SetCompression(const Value: TJDISSetupCompression);
begin
  FCompression.Assign(Value);
end;

procedure TJDISSetupCompiler.SetDEPCompatible(const Value: TBoolDef);
begin
  FDEPCompatible := Value;
end;

procedure TJDISSetupCompiler.SetDiskClusterSize(const Value: Integer);
begin
  FDiskClusterSize := Value;
end;

procedure TJDISSetupCompiler.SetDiskSliceSize(const Value: Int64);
begin
  FDiskSliceSize := Value;
end;

procedure TJDISSetupCompiler.SetDiskSpanning(const Value: TBoolDef);
begin
  FDiskSpanning := Value;
end;

procedure TJDISSetupCompiler.SetEncryption(const Value: TBoolDef);
begin
  FEncryption := Value;
end;

procedure TJDISSetupCompiler.SetMergeDuplicateFiles(const Value: TBoolDef);
begin
  FMergeDuplicateFiles := Value;
end;

procedure TJDISSetupCompiler.SetOutput(const Value: TBoolDef);
begin
  FOutput := Value;
end;

procedure TJDISSetupCompiler.SetOutputBaseFilename(const Value: String);
begin
  FOutputBaseFilename := Value;
end;

procedure TJDISSetupCompiler.SetOutputDir(const Value: String);
begin
  FOutputDir := Value;
end;

procedure TJDISSetupCompiler.SetOutputManifestFile(const Value: String);
begin
  FOutputManifestFile := Value;
end;

procedure TJDISSetupCompiler.SetReserveBytes(const Value: Int64);
begin
  FReserveBytes := Value;
end;

procedure TJDISSetupCompiler.SetSignature(const Value: TJDISSetupSignature);
begin
  FSignature.Assign(Value);
end;

procedure TJDISSetupCompiler.SetSlicesPerDisk(const Value: Integer);
begin
  FSlicesPerDisk := Value;
end;

procedure TJDISSetupCompiler.SetSourceDir(const Value: String);
begin
  FSourceDir := Value;
end;

procedure TJDISSetupCompiler.SetTerminalServicesAware(const Value: TBoolDef);
begin
  FTerminalServicesAware := Value;
end;

procedure TJDISSetupCompiler.SetUsedUserAreasWarning(const Value: TBoolDef);
begin
  FUsedUserAreasWarning := Value;
end;

procedure TJDISSetupCompiler.SetUseSetupLdr(const Value: TBoolDef);
begin
  FUseSetupLdr := Value;
end;

procedure TJDISSetupCompiler.SetVersionInfoCompany(const Value: String);
begin
  FVersionInfoCompany := Value;
end;

procedure TJDISSetupCompiler.SetVersionInfoCopyright(const Value: String);
begin
  FVersionInfoCopyright := Value;
end;

procedure TJDISSetupCompiler.SetVersionInfoDescription(const Value: String);
begin
  FVersionInfoDescription := Value;
end;

procedure TJDISSetupCompiler.SetVersionInfoOriginalFileName(
  const Value: String);
begin
  FVersionInfoOriginalFileName := Value;
end;

procedure TJDISSetupCompiler.SetVersionInfoProductName(const Value: String);
begin
  FVersionInfoProductName := Value;
end;

procedure TJDISSetupCompiler.SetVersionInfoProductTextVersion(
  const Value: String);
begin
  FVersionInfoProductTextVersion := Value;
end;

procedure TJDISSetupCompiler.SetVersionInfoProductVersion(const Value: String);
begin
  FVersionInfoProductVersion := Value;
end;

procedure TJDISSetupCompiler.SetVersionInfoTextVersion(const Value: String);
begin
  FVersionInfoTextVersion := Value;
end;

procedure TJDISSetupCompiler.SetVersionInfoVersion(const Value: String);
begin
  FVersionInfoVersion := Value;
end;

{ TJDISSetupInstaller }

constructor TJDISSetupInstaller.Create(AOwner: TJDISSetup);
begin
  FOwner:= AOwner;

  FChangesAssociations:= TBoolDefExpression.Create;
  FChangesEnvironment:= TBoolDefExpression.Create;
  FCreateUninstallRegKey:= TBoolDefExpression.Create;
  FUninstallable:= TBoolDefExpression.Create;

  //TODO: Set defaults...
  FTimeStampRounding:= 2;


end;

destructor TJDISSetupInstaller.Destroy;
begin

  FreeAndNil(FUninstallable);
  FreeAndNil(FCreateUninstallRegKey);
  FreeAndNil(FChangesEnvironment);
  FreeAndNil(FChangesAssociations);
  inherited;
end;

procedure TJDISSetupInstaller.AddToScript(AScript: TStrings);
var
  T: String;
  procedure A(const S: String);
  begin
    AScript.Append(S);
  end;
  procedure AP(const N, V: String);
  begin
    A(N+'='+V);
  end;
  procedure ABD(const AName: String; const AValue: TBoolDef);
  begin
    case AValue of
      bdDefault:  ;
      bdFalse:    AP(AName, 'no');
      bdTrue:     AP(AName, 'yes');
    end;
  end;
  procedure AST(const AName: String; const AValue: String);
  begin
    if AValue <> '' then
      AP(AName, AValue);
  end;
begin

  ABD('AllowCancelDuringInstall', Self.FAllowCancelDuringInstall);

  ABD('AllowNetworkDrive', Self.FAllowNetworkDrive);

  ABD('AllowNoIcons', Self.FAllowNoIcons);

  ABD('AllowRootDirectory', Self.FAllowRootDirectory);

  ABD('AllowUNCPath', Self.FAllowUNCPath);

  ABD('AlwaysRestart', Self.FAlwaysRestart);

  ABD('AlwaysShowComponentsList', Self.FAlwaysShowComponentsList);

  ABD('AlwaysShowDirOnReadyPage', Self.FAlwaysShowDirOnReadyPage);

  ABD('AlwaysUsePersonalGroup', Self.FAlwaysUsePersonalGroup);

  ABD('AppendDefaultDirName', Self.FAppendDefaultDirName);

  ABD('AppendDefaultGroupName', Self.FAppendDefaultGroupName);

  AST('AppComments', Self.FAppComments);

  AST('AppContact', Self.FAppContact);

  AST('AppId', Self.FAppId);

  AST('AppModifyPath', Self.FAppModifyPath);

  AST('AppMutex', Self.FAppMutex);

  AP('AppName', Self.FAppName);

  AST('AppPublisher', Self.FAppPublisher);

  AST('AppPublisherUrl', Self.FAppPublisherURL);

  AST('AppReadmeFile', Self.FAppReadmeFile);

  AST('AppSupportPhone', Self.FAppSupportPhone);

  AST('AppSupportURL', Self.FAppSupportURL);

  AST('AppUpdatesURL', Self.FAppUpdatesURL);

  AST('AppVerName', Self.FAppVerName);

  AP('AppVersion', Self.FAppVersion);

  T:= '';
  if TJDISArchitecture.isaX86 in Self.FArchitecturesAllowed then
    T:= T + 'x86 ';
  if TJDISArchitecture.isaX64 in Self.FArchitecturesAllowed then
    T:= T + 'x64 ';
  if TJDISArchitecture.isaArm64 in Self.FArchitecturesAllowed then
    T:= T + 'arm64 ';
  if TJDISArchitecture.isaIa64 in Self.FArchitecturesAllowed then
    T:= T + 'ia64 ';
  if T <> '' then
    AP('ArchitecturesAllowed', T);

  T:= '';
  if TJDISArchitecture64.isa64X64 in Self.FArchitecturesInstallIn64BitMode then
    T:= T + 'x64 ';
  if TJDISArchitecture64.isa64Arm64 in Self.FArchitecturesInstallIn64BitMode then
    T:= T + 'arm64 ';
  if TJDISArchitecture64.isa64Ia64 in Self.FArchitecturesInstallIn64BitMode then
    T:= T + 'ia64 ';
  if T <> '' then
    AP('ArchitecturesInstallIn64BitMode', T);

  case FChangesAssociations.Value of
    bdeDefault:     ;
    bdeFalse:       AST('ChangesAssociations', 'no');
    bdeTrue:        AST('ChangesAssociations', 'yes');
    bdeExpression:  AST('ChangesAssociations', FChangesAssociations.Expression);
  end;

  case FChangesEnvironment.Value of
    bdeDefault:     ;
    bdeFalse:       AST('ChangesEnvironment', 'no');
    bdeTrue:        AST('ChangesEnvironment', 'yes');
    bdeExpression:  AST('ChangesEnvironment', FChangesEnvironment.Expression);
  end;

  case Self.FCloseApplications of
    isbfDefault:  ;
    isbfFalse:    AST('CloseApplications', 'no');
    isbfTrue:     AST('CloseApplications', 'yes');
    isbfForce:    AST('CloseApplications', 'force');
  end;

  AST('CloseApplicationsFilter', Self.FCloseApplicationsFilter);

  ABD('CreateAppDir', Self.FCreateAppDir);

  case FCreateUninstallRegKey.Value of
    bdeDefault:     ;
    bdeFalse:       AST('CreateUninstallRegKey', 'no');
    bdeTrue:        AST('CreateUninstallRegKey', 'yes');
    bdeExpression:  AST('CreateUninstallRegKey', FCreateUninstallRegKey.Expression);
  end;

  AST('DefaultDialogFontName', Self.FDefaultDialogFontName);

  AST('DefaultDirName', Self.FDefaultDirName);

  AST('DefaultGroupName', Self.FDefaultGroupName);

  AST('DefaultUserInfoName', Self.FDefaultUserInfoName);

  AST('DefaultUserInfoOrg', Self.FDefaultUserInfoOrg);

  AST('DefaultUserInfoSerial', Self.FDefaultUserInfoSerial);

  case Self.FDirExistsWarning of
    isbaDefault:  ;
    isbaFalse:    AST('DirExistsWarning', 'no');
    isbaTrue:     AST('DirExistsWarning', 'ues');
    isbaAuto:     AST('DirExistsWarning', 'auto');
  end;

  case Self.FDisableDirPage of
    isbaDefault:  ;
    isbaFalse:    AST('DisableDirPage', 'no');
    isbaTrue:     AST('DisableDirPage', 'ues');
    isbaAuto:     AST('DisableDirPage', 'auto');
  end;

  ABD('DisableFinishedPage', Self.FDisableFinishedPage);

  case Self.FDisableProgramGroupPage of
    isbaDefault: ;
    isbaFalse:    AST('DisableProgramGroupPage', 'no');
    isbaTrue:     AST('DisableProgramGroupPage', 'ues');
    isbaAuto:     AST('DisableProgramGroupPage', 'auto');
  end;

  ABD('DisableReadyMemo', Self.FDisableReadyMemo);

  ABD('DisableReadyPage', Self.FDisableReadyPage);

  ABD('DisableStartupPrompt', Self.FDisableStartupPrompt);

  ABD('DisableWelcomePage', Self.FDisableWelcomePage);

  ABD('EnableDirDoesntExistWarning', Self.FEnableDirDoesntExistWarning);

  if Self.FExtraDiskSpaceRequired > 0 then begin
    AP('ExtraDiskSpaceRequired', IntToStr(Self.FExtraDiskSpaceRequired));
  end;

  AST('InfoAfterFile', Self.FInfoAfterFile);

  AST('InfoBeforeFile', Self.FInfoBeforeFile);

  case Self.FLanguageDetectionMethod of
    isldDefault:    ;
    isldUILanguage: AST('LanguageDetectionMethod', 'uilanguage');
    isldLocale:     AST('LanguageDetectionMethod', 'locale');
    isldNone:       AST('LanguageDetectionMethod', 'none');
  end;

  AST('LicenseFile', Self.FLicenseFile);

  AST('MinVersion', Self.FMinVersion);

  AST('OnlyBelowVersion', Self.FOnlyBelowVersion);

  AST('Password', Self.FPassword);

  case Self.FPrivilegesRequired of
    isprDefault:  ;
    isprAdmin:    AST('PrivilegesRequired', 'admin');
    isprLowest:   AST('PrivilegesRequired', 'lowest');
  end;

  if Self.FPrivilegesRequiredOverridesAllowed <> [] then begin
    T:= '';
    if TJDISPrivilegesReqOverride.ispoCommandLine in FPrivilegesRequiredOverridesAllowed then
      T:= T + 'commandline ';
    if TJDISPrivilegesReqOverride.ispoDialog in FPrivilegesRequiredOverridesAllowed then
      T:= T + 'dialog ';
    AST('PrivilegesRequiredOverridesAllowed', T);
  end;

  ABD('RestartApplications', Self.FRestartApplications);

  ABD('RestartIfNeededByRun', Self.FRestartIfNeededByRun);

  ABD('SetupLogging', Self.FSetupLogging);

  AST('SetupMutex', Self.FSetupMutex);

  case Self.FShowLanguageDialog of
    isbaDefault:  ;
    isbaFalse:    AST('ShowLanguageDialog', 'no');
    isbaTrue:     AST('ShowLanguageDialog', 'yes');
    isbaAuto:     AST('ShowLanguageDialog', 'auto');
  end;

  if Self.FTimeStampRounding <> 2 then begin
    AP('TimeStampRounding', IntToStr(Self.FTimeStampRounding));
  end;

  ABD('TimeStampsInUTC', Self.FTimeStampsInUTC);

  case FTouchDate of
    isttDefault:  ;
    isttCurrent:  AST('TouchDate', 'current');
    isttNone:     AST('TouchDate', 'none');
    isttCustom:   AST('TouchDate', DateToStr(FTouchDateValue));
  end;

  case FTouchTime of
    isttDefault:  ;
    isttCurrent:  AST('TouchTime', 'current');
    isttNone:     AST('TouchTime', 'none');
    isttCustom:   AST('TouchTime', TimeToStr(FTouchTimeValue));
  end;

  case FUninstallable.Value of
    bdeDefault:     ;
    bdeFalse:       AST('Uninstallable', 'no');
    bdeTrue:        AST('Uninstallable', 'yes');
    bdeExpression:  AST('Uninstallable', FUninstallable.Expression);
  end;

  AST('UninstallDisplayIcon', FUninstallDisplayIcon);

  AST('UninstallDisplayName', FUninstallDisplayName);

  if FUninstallDisplaySize <> 0 then
    AST('UninstallDisplaySize', IntToStr(FUninstallDisplaySize));

  AST('UninstallFilesDir', FUninstallFilesDir);

  case Self.FUninstallLogMode of
    isulDefault:    ;
    isulAppend:     AST('UninstallLogMode', 'append');
    isulNew:        AST('UninstallLogMode', 'new');
    isulOverwrite:  AST('UninstallLogMode', 'overwrite');
  end;

  case Self.FUninstallRestartComputer of
    bdDefault:  ;
    bdFalse:    AST('UninstallRestartComputer', 'no');
    bdTrue:     AST('UninstallRestartComputer', 'yes');
  end;

  case Self.FUpdateUninstallLogAppName of
    bdDefault:  ;
    bdFalse:    AST('UpdateUninstallLogAppName', 'no');
    bdTrue:     AST('UpdateUninstallLogAppName', 'yes');
  end;

  ABD('UsePreviousAppDir', Self.FUsePreviousAppDir);

  ABD('UsePreviousGroup', Self.FUsePreviousGroup);

  ABD('UsePreviousLanguage', Self.FUsePreviousLanguage);

  ABD('UsePreviousPrivigeles', Self.FUsePreviousPrivigeles);

  ABD('UsePreviousSetupType', Self.FUsePreviousSetupType);

  ABD('UsePreviousTasks', Self.FUsePreviousTasks);

  ABD('UsePreviousUserInfo', Self.FUsePreviousUserInfo);

  ABD('UserInfoPage', Self.FUserInfoPage);

end;

procedure TJDISSetupInstaller.SetAllowCancelDuringInstall(
  const Value: TBoolDef);
begin
  FAllowCancelDuringInstall := Value;
end;

procedure TJDISSetupInstaller.SetAllowNetworkDrive(const Value: TBoolDef);
begin
  FAllowNetworkDrive := Value;
end;

procedure TJDISSetupInstaller.SetAllowNoIcons(const Value: TBoolDef);
begin
  FAllowNoIcons := Value;
end;

procedure TJDISSetupInstaller.SetAllowRootDirectory(const Value: TBoolDef);
begin
  FAllowRootDirectory := Value;
end;

procedure TJDISSetupInstaller.SetAllowUNCPath(const Value: TBoolDef);
begin
  FAllowUNCPath := Value;
end;

procedure TJDISSetupInstaller.SetAlwaysRestart(const Value: TBoolDef);
begin
  FAlwaysRestart := Value;
end;

procedure TJDISSetupInstaller.SetAlwaysShowComponentsList(
  const Value: TBoolDef);
begin
  FAlwaysShowComponentsList := Value;
end;

procedure TJDISSetupInstaller.SetAlwaysShowDirOnReadyPage(
  const Value: TBoolDef);
begin
  FAlwaysShowDirOnReadyPage := Value;
end;

procedure TJDISSetupInstaller.SetAlwaysShowGroupOnReadyPage(
  const Value: TBoolDef);
begin
  FAlwaysShowGroupOnReadyPage := Value;
end;

procedure TJDISSetupInstaller.SetAlwaysUsePersonalGroup(const Value: TBoolDef);
begin
  FAlwaysUsePersonalGroup := Value;
end;

procedure TJDISSetupInstaller.SetAppComments(const Value: String);
begin
  FAppComments := Value;
end;

procedure TJDISSetupInstaller.SetAppContact(const Value: String);
begin
  FAppContact := Value;
end;

procedure TJDISSetupInstaller.SetAppendDefaultDirName(const Value: TBoolDef);
begin
  FAppendDefaultDirName := Value;
end;

procedure TJDISSetupInstaller.SetAppendDefaultGroupName(const Value: TBoolDef);
begin
  FAppendDefaultGroupName := Value;
end;

procedure TJDISSetupInstaller.SetAppId(const Value: String);
begin
  FAppId := Value;
end;

procedure TJDISSetupInstaller.SetAppModifyPath(const Value: String);
begin
  FAppModifyPath := Value;
end;

procedure TJDISSetupInstaller.SetAppMutex(const Value: String);
begin
  FAppMutex := Value;
end;

procedure TJDISSetupInstaller.SetAppName(const Value: String);
begin
  FAppName := Value;
end;

procedure TJDISSetupInstaller.SetAppPublisher(const Value: String);
begin
  FAppPublisher := Value;
end;

procedure TJDISSetupInstaller.SetAppPublisherURL(const Value: String);
begin
  FAppPublisherURL := Value;
end;

procedure TJDISSetupInstaller.SetAppReadmeFile(const Value: String);
begin
  FAppReadmeFile := Value;
end;

procedure TJDISSetupInstaller.SetAppSupportPhone(const Value: String);
begin
  FAppSupportPhone := Value;
end;

procedure TJDISSetupInstaller.SetAppSupportURL(const Value: String);
begin
  FAppSupportURL := Value;
end;

procedure TJDISSetupInstaller.SetAppUpdatesURL(const Value: String);
begin
  FAppUpdatesURL := Value;
end;

procedure TJDISSetupInstaller.SetAppVerName(const Value: String);
begin
  FAppVerName := Value;
end;

procedure TJDISSetupInstaller.SetAppVersion(const Value: String);
begin
  FAppVersion := Value;
end;

procedure TJDISSetupInstaller.SetArchitecturesAllowed(
  const Value: TJDISArchitectures);
begin
  FArchitecturesAllowed := Value;
end;

procedure TJDISSetupInstaller.SetArchitecturesInstallIn64BitMode(
  const Value: TJDISArchitectures64);
begin
  FArchitecturesInstallIn64BitMode := Value;
end;

procedure TJDISSetupInstaller.SetChangesAssociations(
  const Value: TBoolDefExpression);
begin
  FChangesAssociations.Assign(Value);
end;

procedure TJDISSetupInstaller.SetChangesEnvironment(
  const Value: TBoolDefExpression);
begin
  FChangesEnvironment.Assign(Value);
end;

procedure TJDISSetupInstaller.SetCloseApplications(const Value: TJDISBoolForce);
begin
  FCloseApplications := Value;
end;

procedure TJDISSetupInstaller.SetCloseApplicationsFilter(const Value: String);
begin
  FCloseApplicationsFilter := Value;
end;

procedure TJDISSetupInstaller.SetCreateAppDir(const Value: TBoolDef);
begin
  FCreateAppDir := Value;
end;

procedure TJDISSetupInstaller.SetDefaultDialogFontName(const Value: String);
begin
  FDefaultDialogFontName := Value;
end;

procedure TJDISSetupInstaller.SetDefaultDirName(const Value: String);
begin
  FDefaultDirName := Value;
end;

procedure TJDISSetupInstaller.SetDefaultGroupName(const Value: String);
begin
  FDefaultGroupName := Value;
end;

procedure TJDISSetupInstaller.SetDefaultUserInfoName(const Value: String);
begin
  FDefaultUserInfoName := Value;
end;

procedure TJDISSetupInstaller.SetDefaultUserInfoOrg(const Value: String);
begin
  FDefaultUserInfoOrg := Value;
end;

procedure TJDISSetupInstaller.SetDefaultUserInfoSerial(const Value: String);
begin
  FDefaultUserInfoSerial := Value;
end;

procedure TJDISSetupInstaller.SetDirExistsWarning(const Value: TBoolDefAuto);
begin
  FDirExistsWarning := Value;
end;

procedure TJDISSetupInstaller.SetDisableDirPage(const Value: TBoolDefAuto);
begin
  FDisableDirPage := Value;
end;

procedure TJDISSetupInstaller.SetDisableFinishedPage(const Value: TBoolDef);
begin
  FDisableFinishedPage := Value;
end;

procedure TJDISSetupInstaller.SetDisableProgramGroupPage(const Value: TBoolDefAuto);
begin
  FDisableProgramGroupPage := Value;
end;

procedure TJDISSetupInstaller.SetDisableReadyMemo(const Value: TBoolDef);
begin
  FDisableReadyMemo := Value;
end;

procedure TJDISSetupInstaller.SetDisableReadyPage(const Value: TBoolDef);
begin
  FDisableReadyPage := Value;
end;

procedure TJDISSetupInstaller.SetDisableStartupPrompt(const Value: TBoolDef);
begin
  FDisableStartupPrompt := Value;
end;

procedure TJDISSetupInstaller.SetDisableWelcomePage(const Value: TBoolDef);
begin
  FDisableWelcomePage := Value;
end;

procedure TJDISSetupInstaller.SetEnableDirDoesntExistWarning(
  const Value: TBoolDef);
begin
  FEnableDirDoesntExistWarning := Value;
end;

procedure TJDISSetupInstaller.SetExtraDiskSpaceRequired(const Value: Int64);
begin
  FExtraDiskSpaceRequired := Value;
end;

procedure TJDISSetupInstaller.SetInfoAfterFile(const Value: String);
begin
  FInfoAfterFile := Value;
end;

procedure TJDISSetupInstaller.SetInfoBeforeFile(const Value: String);
begin
  FInfoBeforeFile := Value;
end;

procedure TJDISSetupInstaller.SetLanguageDetectionMethod(
  const Value: TJDISLanguageDetectMethod);
begin
  FLanguageDetectionMethod := Value;
end;

procedure TJDISSetupInstaller.SetLicenseFile(const Value: String);
begin
  FLicenseFile := Value;
end;

procedure TJDISSetupInstaller.SetMinVersion(const Value: String);
begin
  FMinVersion := Value;
end;

procedure TJDISSetupInstaller.SetOnlyBelowVersion(const Value: String);
begin
  FOnlyBelowVersion := Value;
end;

procedure TJDISSetupInstaller.SetPassword(const Value: String);
begin
  FPassword := Value;
end;

procedure TJDISSetupInstaller.SetPrivilegesRequired(
  const Value: TJDISPrivilegesReq);
begin
  FPrivilegesRequired := Value;
end;

procedure TJDISSetupInstaller.SetPrivilegesRequiredOverridesAllowed(
  const Value: TJDISPrivilegesReqOverrides);
begin
  FPrivilegesRequiredOverridesAllowed := Value;
end;

procedure TJDISSetupInstaller.SetRestartApplications(const Value: TBoolDef);
begin
  FRestartApplications := Value;
end;

procedure TJDISSetupInstaller.SetRestartIfNeededByRun(const Value: TBoolDef);
begin
  FRestartIfNeededByRun := Value;
end;

procedure TJDISSetupInstaller.SetSetupLogging(const Value: TBoolDef);
begin
  FSetupLogging := Value;
end;

procedure TJDISSetupInstaller.SetSetupMutex(const Value: String);
begin
  FSetupMutex := Value;
end;

procedure TJDISSetupInstaller.SetShowLanguageDialog(const Value: TBoolDefAuto);
begin
  FShowLanguageDialog := Value;
end;

procedure TJDISSetupInstaller.SetTimeStampRounding(const Value: Integer);
begin
  if (Value >= 0) and (Value <= 60) then  
    FTimeStampRounding := Value
  else
    raise Exception.Create('TimeStampRounding must be in the range of 0 to 60.');
end;

procedure TJDISSetupInstaller.SetTimeStampsInUTC(const Value: TBoolDef);
begin
  FTimeStampsInUTC := Value;
end;

procedure TJDISSetupInstaller.SetTouchDate(const Value: TJDISTouchDateTimeType);
begin
  FTouchDate := Value;
end;

procedure TJDISSetupInstaller.SetTouchDateValue(const Value: TDate);
begin
  FTouchDateValue := Value;
  FTouchDate:= isttCustom;
end;

procedure TJDISSetupInstaller.SetTouchTime(const Value: TJDISTouchDateTimeType);
begin
  FTouchTime := Value;
end;

procedure TJDISSetupInstaller.SetTouchTimeValue(const Value: TTime);
begin
  FTouchTimeValue := Value;
  FTouchTime:= isttCustom;
end;

procedure TJDISSetupInstaller.SetUninstallable(const Value: TBoolDefExpression);
begin
  FUninstallable.Assign(Value);
end;

procedure TJDISSetupInstaller.SetUninstallDisplayIcon(const Value: String);
begin
  FUninstallDisplayIcon := Value;
end;

procedure TJDISSetupInstaller.SetUninstallDisplayName(const Value: String);
begin
  FUninstallDisplayName := Value;
end;

procedure TJDISSetupInstaller.SetUninstallDisplaySize(const Value: Int64);
begin
  FUninstallDisplaySize := Value;
end;

procedure TJDISSetupInstaller.SetUninstallFilesDir(const Value: String);
begin
  FUninstallFilesDir := Value;
end;

procedure TJDISSetupInstaller.SetUninstallLogMode(
  const Value: TJDISUninstallLogMode);
begin
  FUninstallLogMode := Value;
end;

procedure TJDISSetupInstaller.SetUninstallRegKey(
  const Value: TBoolDefExpression);
begin
  FCreateUninstallRegKey.Assign(Value);
end;

procedure TJDISSetupInstaller.SetUninstallRestartComputer(const Value: TBoolDef);
begin
  FUninstallRestartComputer := Value;
end;

procedure TJDISSetupInstaller.SetUpdateUninstallLogAppName(
  const Value: TBoolDef);
begin
  FUpdateUninstallLogAppName := Value;
end;

procedure TJDISSetupInstaller.SetUsePreviousAppDir(const Value: TBoolDef);
begin
  FUsePreviousAppDir := Value;
end;

procedure TJDISSetupInstaller.SetUsePreviousGroup(const Value: TBoolDef);
begin
  FUsePreviousGroup := Value;
end;

procedure TJDISSetupInstaller.SetUsePreviousLanguage(const Value: TBoolDef);
begin
  FUsePreviousLanguage := Value;
end;

procedure TJDISSetupInstaller.SetUsePreviousPrivigeles(const Value: TBoolDef);
begin
  FUsePreviousPrivigeles := Value;
end;

procedure TJDISSetupInstaller.SetUsePreviousSetupType(const Value: TBoolDef);
begin
  FUsePreviousSetupType := Value;
end;

procedure TJDISSetupInstaller.SetUsePreviousTasks(const Value: TBoolDef);
begin
  FUsePreviousTasks := Value;
end;

procedure TJDISSetupInstaller.SetUsePreviousUserInfo(const Value: TBoolDef);
begin
  FUsePreviousUserInfo := Value;
end;

procedure TJDISSetupInstaller.SetUserInfoPage(const Value: TBoolDef);
begin
  FUserInfoPage := Value;
end;

{ TJDISSetupWizardSize }

constructor TJDISSetupWizardSize.Create(AOwner: TJDISSetupCosmetic);
begin
  FOwner:= AOwner;
  FDefault:= True;
  FWidth:= 120;
  FHeight:= 120;
end;

destructor TJDISSetupWizardSize.Destroy;
begin

  inherited;
end;

function TJDISSetupWizardSize.GetHeight: Integer;
begin
  if not FDefault then
    Result:= FHeight
  else begin
    case FOwner.FWizardStyle of
      iswsClassic:  Result:= 100;
      iswsModern:   Result:= 120;
      else          Result:= 100;
    end;
  end;
end;

function TJDISSetupWizardSize.GetWidth: Integer;
begin
  if not FDefault then
    Result:= FWidth
  else begin
    case FOwner.FWizardStyle of
      iswsClassic:  Result:= 100;
      iswsModern:   Result:= 120;
      else          Result:= 100;
    end;
  end;
end;

function TJDISSetupWizardSize.IsLengthStored: Boolean;
begin
  Result:= (not FDefault);
end;

function TJDISSetupWizardSize.IsWidthStored: Boolean;
begin
  Result:= (not FDefault);
end;

function TJDISSetupWizardSize.GetText: String;
begin
  if not FDefault then
    Result:= IntToStr(Width)+','+IntToStr(Height);
end;

procedure TJDISSetupWizardSize.SetDefault(const Value: Boolean);
begin
  FDefault := Value;
end;

procedure TJDISSetupWizardSize.SetHeight(const Value: Integer);
begin
  if Value <> FHeight then
    FDefault:= False;
  FHeight := Value;
end;

procedure TJDISSetupWizardSize.SetWidth(const Value: Integer);
begin
  if Value <> FWidth then
    FDefault:= False;
  FWidth := Value;
end;

{ TJDISSetupCosmetic }

procedure TJDISSetupCosmetic.AddToScript(AScript: TStrings);
  procedure A(const S: String);
  begin
    AScript.Append(S);
  end;
  procedure AP(const N, V: String);
  begin
    A(N+'='+V);
  end;
  procedure ABD(const AName: String; const AValue: TBoolDef);
  begin
    case AValue of
      bdDefault:  ;
      bdFalse:    AP(AName, 'no');
      bdTrue:     AP(AName, 'yes');
    end;
  end;
  procedure AST(const AName: String; const AValue: String);
  begin
    if AValue <> '' then
      AP(AName, AValue);
  end;
begin

  AST('AppCopyright', Self.FAppCopyright);

  //TODO: BackColor

  //TODO: BackColor2

  case Self.FBackColorDirection of
    iscdDefault:      ;
    iscdTopToBottom:  AP('BackColorDirection', 'toptobottom');
    iscdLeftToRight:  AP('BackColorDirection', 'lefttoright');
  end;

  ABD('BackSolid', Self.FBackSolid);

  ABD('FlatComponentsList', Self.FFlatComponentsList);

  AST('SetupIconFile', Self.FSetupIconFile);

  ABD('ShowComponentSizes', Self.FShowComponentSizes);

  ABD('ShowTasksTreeLines', Self.FShowTasksTreeLines);

  ABD('WindowShowCaption', Self.FWindowShowCaption);

  ABD('WindowStartMaximized', Self.FWindowStartMaximized);

  ABD('WindowResizable', Self.FWindowResizable);

  ABD('WindowVisible', Self.FWindowVisible);

  case Self.FWizardImageAlphaFormat of
    isafNone:           ;
    isafDefined:        AP('WizardImageAlphaFormat', 'defined');
    isafPreMultiplied:  AP('WizardImageAlphaFormat', 'premultiplied');
  end;

  AST('WizardImageFile', Self.FWizardImageFile);

  ABD('WizardImageStretch', Self.FWizardImageStretch);

  ABD('WizardResizable', Self.FWizardResizable);

  AST('WizardSizePercent', Self.FWizardSizePercent.GetText);

  AST('WizardSmallImageFile', Self.FWizardSmallImageFile);

  case Self.FWizardStyle of
    iswsDefault:  ;
    iswsClassic:  AP('WizardStyle', 'classic');
    iswsModern:   AP('WizardStyle', 'modern');
  end;




end;

constructor TJDISSetupCosmetic.Create(AOwner: TJDISSetup);
begin
  FOwner:= AOwner;
  FWizardSizePercent:= TJDISSetupWizardSize.Create(Self);
end;

destructor TJDISSetupCosmetic.Destroy;
begin
  FreeAndNil(FWizardSizePercent);
  inherited;
end;

procedure TJDISSetupCosmetic.SetAppCopyright(const Value: String);
begin
  FAppCopyright := Value;
end;

procedure TJDISSetupCosmetic.SetBackColor(const Value: String);
begin
  FBackColor := Value;
end;

procedure TJDISSetupCosmetic.SetBackColor2(const Value: String);
begin
  FBackColor2 := Value;
end;

procedure TJDISSetupCosmetic.SetBackColorDirection(
  const Value: TJDISBackColorDir);
begin
  FBackColorDirection := Value;
end;

procedure TJDISSetupCosmetic.SetBackSolid(const Value: TBoolDef);
begin
  FBackSolid := Value;
end;

procedure TJDISSetupCosmetic.SetFlatComponentsList(const Value: TBoolDef);
begin
  FFlatComponentsList := Value;
end;

procedure TJDISSetupCosmetic.SetSetupIconFile(const Value: String);
begin
  FSetupIconFile := Value;
end;

procedure TJDISSetupCosmetic.SetShowComponentSizes(const Value: TBoolDef);
begin
  FShowComponentSizes := Value;
end;

procedure TJDISSetupCosmetic.SetShowTasksTreeLines(const Value: TBoolDef);
begin
  FShowTasksTreeLines := Value;
end;

procedure TJDISSetupCosmetic.SetWindowResizable(const Value: TBoolDef);
begin
  FWindowResizable := Value;
end;

procedure TJDISSetupCosmetic.SetWindowShowCaption(const Value: TBoolDef);
begin
  FWindowShowCaption := Value;
end;

procedure TJDISSetupCosmetic.SetWindowStartMaximized(const Value: TBoolDef);
begin
  FWindowStartMaximized := Value;
end;

procedure TJDISSetupCosmetic.SetWindowVisible(const Value: TBoolDef);
begin
  FWindowVisible := Value;
end;

procedure TJDISSetupCosmetic.SetWizardImageAlphaFormat(
  const Value: TJDISWizardImageAlphaFormat);
begin
  FWizardImageAlphaFormat := Value;
end;

procedure TJDISSetupCosmetic.SetWizardImageFile(const Value: String);
begin
  FWizardImageFile := Value;
end;

procedure TJDISSetupCosmetic.SetWizardImageStretch(const Value: TBoolDef);
begin
  FWizardImageStretch := Value;
end;

procedure TJDISSetupCosmetic.SetWizardResizable(const Value: TBoolDef);
begin
  FWizardResizable := Value;
end;

procedure TJDISSetupCosmetic.SetWizardSmallImageFile(const Value: String);
begin
  FWizardSmallImageFile := Value;
end;

procedure TJDISSetupCosmetic.SetWizardStyle(const Value: TJDISWizardStyle);
begin
  FWizardStyle := Value;
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

procedure TJDISSetupObsolete.AddToScript(AScript: TStrings);
begin
  //TODO

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

function TJDISType.FlagsStr: String;
begin
  Result:= '';
  if TJDISTypeFlag.istfIsCustom in FFlags then
    Result:= Result + 'iscustom ';
end;

function TJDISType.GetFullText: String;
var
  T: String;
begin
  T:= 'Name: "'+FName+'"; Description: "'+FDescription+'"';
  if FFlags <> [] then begin
    T:= T + '; Flags: '+FlagsStr;
  end;
  Result:= T;
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
  FTypes:= TStringList.Create;
end;

destructor TJDISComponent.Destroy;
begin
  FreeAndNil(FTypes);
  inherited;
end;

function TJDISComponent.FlagsStr: String;
begin
  Result:= '';
  if TJDISComponentFlag.iscfCheckAbleAlone in FFlags then
    Result:= Result + ' checkablealone';
  if TJDISComponentFlag.iscfDontInheritCheck in FFlags then
    Result:= Result + ' dontinheritcheck';
  if TJDISComponentFlag.iscfExclusive in FFlags then
    Result:= Result + ' exclusive';
  if TJDISComponentFlag.iscfFixed in FFlags then
    Result:= Result + ' fixed';
  if TJDISComponentFlag.iscfRestart in FFlags then
    Result:= Result + ' restart';
  if TJDISComponentFlag.iscfDisableNounInstallWarning in FFlags then
    Result:= Result + ' disablenouninstallwarning';
end;

function TJDISComponent.GetFullText: String;
var
  T: String;
begin
  T:= 'Name: "'+FName+'"; Description: "'+FDescription+'"';
  if FTypes.Count > 0 then begin
    T:= T + '; Types: '+TypesStr;
  end;
  if FFlags <> [] then begin
    T:= T + '; Flags: '+FlagsStr;
  end;
  Result:= T;
end;

function TJDISComponent.GetTypes: TStrings;
begin
  Result:= TStrings(FTypes);
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

procedure TJDISComponent.SetTypes(const Value: TStrings);
begin
  FTypes.Assign(Value);
end;

function TJDISComponent.TypesStr: String;
begin
  Result:= GetSpacedList(FTypes);
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
  FComponents:= TStringList.Create;
end;

destructor TJDISTask.Destroy;
begin
  FreeAndNil(FComponents);
  inherited;
end;

function TJDISTask.FlagsStr: String;
begin
  Result:= '';
  if TJDISTaskFlag.istfCheckAbleAlone in FFlags then
    Result:= Result + 'checkablealone ';
  if TJDISTaskFlag.istfCheckedOnce in FFlags then
    Result:= Result + 'checkedonce ';
  if TJDISTaskFlag.istfDontInheritCheck in FFlags then
    Result:= Result + 'dontinheritcheck ';
  if TJDISTaskFlag.istfExclusive in FFlags then
    Result:= Result + 'exclusive ';
  if TJDISTaskFlag.istfRestart in FFlags then
    Result:= Result + 'restart ';
  if TJDISTaskFlag.istfUnchecked in FFlags then
    Result:= Result + 'unchecked ';
end;

function TJDISTask.GetComponents: TStrings;
begin
  Result:= TStrings(FComponents);
end;

function TJDISTask.GetFullText: String;
begin
  Result:= 'Name: '+FName+'; Description: "'+FDescription+'"';
  if FGroupDescription <> '' then
    Result:= Result + '; GroupDescription: '+FGroupDescription;
  if FComponents.Count > 0 then begin
    Result:= Result + '; Components: '+GetSpacedList(FComponents);
  end;
  if FFlags <> [] then begin
    Result:= Result + '; Flags: '+FlagsStr;
  end;
end;

procedure TJDISTask.SetComponents(const Value: TStrings);
begin
  FComponents.Assign(Value);
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
  FPermissions:= TJDISPermissions.Create(Self);
end;

destructor TJDISDir.Destroy;
begin
  FreeAndNil(FPermissions);
  inherited;
end;

function TJDISDir.AttribsStr: String;
begin
  Result:= '';
  if TJDISAttrib.isaReadOnly in FAttribs then
    Result:= Result + 'readonly ';
  if TJDISAttrib.isaHidden in FAttribs then
    Result:= Result + 'hidden ';
  if TJDISAttrib.isaSystem in FAttribs then
    Result:= Result + 'system ';
  if TJDISAttrib.isaNotContentIndexed in FAttribs then
    Result:= Result + 'notcontentindexed ';
end;

function TJDISDir.FlagsStr: String;
begin
  Result:= '';
  if TJDISDirFlag.isdfDeleteAfterInstall in FFlags then
    Result:= Result + 'deleteafterinstall ';
  if TJDISDirFlag.isdfSetNTFSCompression in FFlags then
    Result:= Result + 'setntfscompression ';
  if TJDISDirFlag.isdfUninsAlwaysUninstall in FFlags then
    Result:= Result + 'uninsalwaysuninstall ';
  if TJDISDirFlag.isdfUninsNeverUninstall in FFlags then
    Result:= Result + 'uninsneveruninstall ';
  if TJDISDirFlag.isdfUnsetNTFSCompression in FFlags then
    Result:= Result + 'unsetntfscompression ';
end;

function TJDISDir.GetFullText: String;
begin
  Result:= 'Name: "'+FName+'"';
  if FAttribs <> [] then begin
    Result:= Result + '; Attribs: '+AttribsStr;
  end;

  if FPermissions.Count > 0 then begin
    Result:= Result + '; Permissions: '+FPermissions.GetFullText;
  end;

  if FFlags <> [] then begin
    Result:= Result + '; Flags: '+FlagsStr;
  end;

end;

procedure TJDISDir.SetAttribs(const Value: TJDISAttribs);
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

procedure TJDISDir.SetPermissions(const Value: TJDISPermissions);
begin
  FPermissions.Assign(Value);
end;

{ TJDISFiles }

constructor TJDISFiles.Create(AOwner: TJDInnoSetupScript);
begin
  inherited Create(AOwner, TJDISFile);
end;

{ TJDISFile }

function TJDISFile.AttribsStr: String;
begin
  Result:= '';
  if TJDISAttrib.isaReadOnly in FAttribs then
    Result:= Result + 'readonly ';
  if TJDISAttrib.isaHidden in FAttribs then
    Result:= Result + 'hidden ';
  if TJDISAttrib.isaSystem in FAttribs then
    Result:= Result + 'system ';
  if TJDISAttrib.isaNotContentIndexed in FAttribs then
    Result:= Result + 'notcontentindexed ';
end;

constructor TJDISFile.Create(Collection: TCollection);
begin
  inherited;
  FComponents:= TStringList.Create;
  FFlags:= TJDISFileFlags.Create(Self);
  FPermissions:= TJDISPermissions.Create(Self);
end;

destructor TJDISFile.Destroy;
begin
  FreeAndNil(FPermissions);
  FFlags.Free;
  FComponents.Free;
  inherited;
end;

function TJDISFile.GetComponents: TStrings;
begin
  Result:= TStrings(FComponents);
end;

function TJDISFile.GetFullText: String;
var
  T: String;
  procedure AT(const N, V: String; const Q: Boolean);
  begin
    if V <> '' then begin
      T:= T + N + ': ';
      if Q then
        T:= T + '"';
      T:= T + V;
      if Q then
        T:= T + '"';
      T:= T + '; ';
    end;
  end;
begin
  T:= '';
  AT('Source', FSource, True);
  AT('DestDir', FDestDir, True);
  AT('DestName', FDestName, True);
  AT('Excludes', FExcludes, True);
  if FExternalSize <> 0 then
    AT('ExternalSize', IntToStr(FExternalSize), False);

  //CopyMode (Obsolete)

  if FAttribs <> [] then begin
    AT('Attribs', AttribsStr, False);
  end;

  if FPermissions.Count > 0 then begin
    AT('Permissions', FPermissions.GetFullText, False);
  end;

  AT('FontInstall', FFontInstall, True);
  AT('StrongAssemblyName', FStrongAssemblyName, True);
  AT('Components', GetSpacedList(FComponents), False);
  AT('Flags', FFlags.GetFlagText, False);
  Result:= T;
end;

procedure TJDISFile.SetAttribs(const Value: TJDISAttribs);
begin
  FAttribs := Value;
end;

procedure TJDISFile.SetComponents(const Value: TStrings);
begin
  FComponents.Assign(Value);
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

procedure TJDISFile.SetFontInstall(const Value: String);
begin
  FFontInstall := Value;
end;

procedure TJDISFile.SetPermissions(const Value: TJDISPermissions);
begin
  FPermissions.Assign(Value);
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

function TJDISFileFlags.GetFlagText: String;
  procedure A(const Value: Boolean; const Text: String);
  begin
    if Value then begin
      if Result <> '' then
        Result:= Result + ' ';
      Result:= Result + LowerCase(Text);
    end;
  end;
begin
  A(Self.Is32bit, '32bit');
  A(Self.Is64bit, '64bit');
  A(Self.AllowUnsafeFiles, 'AllowUnsafeFiles');
  A(Self.CompareTimestamp, 'CompareTimestamp');
  A(Self.ConfirmOverwrite, 'ConfirmOverwrite');
  A(Self.CreateAllSubdirs, 'CreateAllSubdirs');
  A(Self.DeleteAfterInstall, 'DeleteAfterInstall');
  A(Self.DontCopy, 'DontCopy');
  A(Self.DontVerifyChecksum, 'DontVerifyChecksum');
  A(Self.External, 'External');
  A(Self.FontIsntTrueType, 'FontIsntTrueType');
  A(Self.GacInstall, 'GacInstall');
  A(Self.IgnoreVersion, 'IgnoreVersion');
  A(Self.IsReadme, 'IsReadme');
  A(Self.NoCompression, 'NoCompression');
  A(Self.NoEncryption, 'NoEncryption');
  A(Self.NoRegError, 'NoRegError');
  A(Self.OnlyIfDestFileExists, 'OnlyIfDestFileExists');
  A(Self.OnlyIfDoesntExists, 'OnlyIfDoesntExists');
  A(Self.OverwriteReadOnly, 'OverwriteReadOnly');
  A(Self.PromptIfOlder, 'PromptIfOlder');
  A(Self.RecurseSubdirs, 'RecurseSubdirs');
  A(Self.RegServer, 'RegServer');
  A(Self.RegTypeLib, 'RegTypeLib');
  A(Self.ReplaceSameVersion, 'ReplaceSameVersion');
  A(Self.RestartReplace, 'RestartReplace');
  A(Self.SetNTFSCompression, 'SetNTFSCompression');
  A(Self.SharedFile, 'SharedFile');
  A(Self.Sign, 'Sign');
  A(Self.SignOnce, 'SignOnce');
  A(Self.SkipIfSourceDoesntExist, 'SkipIfSourceDoesntExist');
  A(Self.SolidBreak, 'SolidBreak');
  A(Self.SortFileByExtension, 'SortFileByExtension');
  A(Self.SortFileByName, 'SortFileByName');
  A(Self.Touch, 'Touch');
  A(Self.UninsNoSharedFilePrompt, 'UninsNoSharedFilePrompt');
  A(Self.UninsRemoveReadOnly, 'UninsRemoveReadOnly');
  A(Self.UninsRestartDelete, 'UninsRestartDelete');
  A(Self.UninsNeverUninstall, 'UninsNeverUninstall');
  A(Self.UnsetNTFSCompression, 'UnsetNTFSCompression');

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
  FComponents:= TStringList.Create;
end;

destructor TJDISIcon.Destroy;
begin
  FreeAndNil(FComponents);
  inherited;
end;

function TJDISIcon.FlagsStr: String;
begin
  Result:= '';
  if TJDISIconFlag.isifCloseOnExit in FFlags then
    Result:= Result + 'closeonexit ';
  if TJDISIconFlag.isifCreateOnlyIfFileExists in FFlags then
    Result:= Result + 'createonlyiffileexists ';
  if TJDISIconFlag.isifDontCloseOnExit in FFlags then
    Result:= Result + 'dontcloseonexit ';
  if TJDISIconFlag.isifExcludeFromShowInNewInstall in FFlags then
    Result:= Result + 'excludefromshowinnewinstall ';
  if TJDISIconFlag.isifFolderShortcut in FFlags then
    Result:= Result + 'foldershortcut ';
  if TJDISIconFlag.isifPreventPinning in FFlags then
    Result:= Result + 'preventpinning ';
  if TJDISIconFlag.isifRunMaximized in FFlags then
    Result:= Result + 'runmaximized ';
  if TJDISIconFlag.isifRunMinimized in FFlags then
    Result:= Result + 'runminimized ';
  if TJDISIconFlag.isifUninsNeverUninstall in FFlags then
    Result:= Result + 'uninsneveruninstall ';
  if TJDISIconFlag.isifUseAppPaths in FFlags then
    Result:= Result + 'useapppaths ';
end;

function TJDISIcon.GetComponents: TStrings;
begin
  Result:= TStrings(FComponents);
end;

function TJDISIcon.GetFullText: String;
begin
  Result:= 'Name: "'+FName+'"; ';
  Result:= Result + 'Filename: "'+FFilename+'"';
  if FParameters <> '' then
    Result:= Result + '; Parameters: "'+FParameters+'"';
  if FWorkingDir <> '' then
    Result:= Result + '; WorkingDir: "'+FWorkingDir+'"';
  if FHotKey <> '' then
    Result:= Result + '; HotKey: "'+FHotKey+'"';
  if FComment <> '' then
    Result:= Result + '; Comment: "'+FComment+'"';
  if FIconFilename <> '' then
    Result:= Result + '; IconFilename: "'+FIconFilename+'"';
  if FIconIndex <> 0 then
    Result:= Result + '; IconIndex: '+IntToStr(FIconIndex);
  if FAppUserModelID <> '' then
    Result:= Result + '; AppUserModelID: "'+FAppUserModelID+'"';
  if FComponents.Count > 0 then
    Result:= Result + '; Components: '+GetSpacedList(FComponents);
  if FFlags <> [] then begin
    Result:= Result + '; Flags: '+FlagsStr;
  end;
end;

procedure TJDISIcon.SetAppUserModelID(const Value: String);
begin
  FAppUserModelID := Value;
end;

procedure TJDISIcon.SetComment(const Value: String);
begin
  FComment := Value;
end;

procedure TJDISIcon.SetComponents(const Value: TStrings);
begin
  FComponents.Assign(Value);
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

function TJDISIni.GetFullText: String;
var
  T: String;
begin
  Result:= 'Filename: "'+FFilename+'"';
  Result:= Result + '; Section: "'+FSection+'"';
  if FKey <> '' then
    Result:= Result + '; Key: "'+FKey+'"';
  if FString <> '' then
    Result:= Result + '; String: "'+FString+'"';
  if FFlags <> [] then begin
    T:= '';
    if TJDISIniFlag.isinfCreateKeyIfDoesntExist in FFlags then
      T:= T + 'createkeyifdoesntexist ';
    if TJDISIniFlag.isinfUninsDeleteEntry in FFlags then
      T:= T + 'uninsdeleteentry ';
    if TJDISIniFlag.isinfUninsDeleteSection in FFlags then
      T:= T + 'uninsdeletesection ';
    if TJDISIniFlag.isinfUninsDeleteSectionIfEmpty in FFlags then
      T:= T + 'uninsdeletesectionifempty ';
    Result:= Result + '; Flags: '+T;
  end;
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

function TJDISInstallDelete.GetFullText: String;
begin
  case Self.FType of
    isdtFiles:          Result:= 'Type: files';
    isdtFilesAndOrDirs: Result:= 'Type: filesandordirs';
    isdtDirIfEmpty:     Result:= 'Type: dirifempty';
  end;
  Result:= Result + '; Name: "'+FName+'"';
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

function TJDISLanguage.GetFullText: String;
var
  T: String;
begin
  T:= 'Name: "'+FName+'"; MessagesFile: "'+FMessagesFile+'"';
  if FLicenseFile <> '' then
    T:= T + '; LicenseFile: "'+FLicenseFile+'"';
  if FInfoBeforeFile <> '' then
    T:= T + '; InfoBeforeFile: "'+FInfoBeforeFile+'"';
  if FInfoAfterFile <> '' then
    T:= T + '; InfoAfterFile: "'+FInfoAfterFile+'"';
  Result:= T;
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

function TJDISMessage.GetFullText: String;
begin
  Result:= Self.FName+'='+Self.FValue;
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

function TJDISCustomMessage.GetFullText: String;
begin
  Result:= Self.FName+'='+Self.FValue;
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
  FXTextBefore:= TStringList.Create;
  FXTextAfter:= TStringList.Create;
end;

destructor TJDISLangOptions.Destroy;
begin
  FXTextAfter.Free;
  FXTextBefore.Free;
  inherited;
end;

function TJDISLangOptions.GetXTextAfter: TStrings;
begin
  Result:= TStrings(FXTextAfter);
end;

function TJDISLangOptions.GetXTextBefore: TStrings;
begin
  Result:= TStrings(FXTextBefore);
end;

function TJDISLangOptions.IsAllDefault: Boolean;
  procedure ChkStr(AValue: String; ADefault: String);
  begin
    if Result then
      Result:= (AValue = ADefault);
  end;
  procedure ChkInt(AValue: Integer; ADefault: Integer);
  begin
    if Result then
      Result:= (AValue = ADefault);
  end;
begin
  Result:= True;
  ChkStr(FLanguageName, '');
  ChkStr(FLanguageID, '');
  ChkInt(FLanguageCodePage, 0);
  ChkStr(FDialogFontName, '');
  ChkInt(FDialogFontSize, 0);
  ChkStr(FWelcomeFontName, '');
  ChkInt(FWelcomeFontSize, 0);
  ChkStr(FTitleFontName, '');
  ChkInt(FTitleFontSize, 0);
  ChkStr(FCopyrightFontName, '');
  ChkInt(FCopyrightFontSize, 0);
  if Result then
    Result:= Self.FRightToLeft = TBoolDef.bdDefault;
end;

procedure TJDISLangOptions.AddToScript(AStrings: TStrings);
  procedure AStr(const AName: String; const AValue: String);
  begin
    if AValue <> '' then
      AStrings.Append(AName+'='+AValue);
  end;
  procedure AInt(const AName: String; const AValue: Integer);
  begin
    if AValue <> 0 then
      AStrings.Append(AName+'='+IntToStr(AValue));
  end;
begin
  if not IsAllDefault then begin
    AStrings.Append('');
    AStrings.Append('[LangOptions]');
    AStr('LanguageName', Self.LanguageName);
    AStr('LanguageID', Self.LanguageID);
    AInt('LanguageCodePage', Self.LanguageCodePage);
    AStr('DialogFontName', Self.DialogFontName);
    AInt('DialogFontSize', Self.DialogFontSize);
    AStr('WelcomeFontName', Self.WelcomeFontName);
    AInt('WelcomeFontSize', Self.WelcomeFontSize);
    AStr('TitleFontName', Self.TitleFontName);
    AInt('TitleFontSize', Self.TitleFontSize);
    AStr('CopyrightFontName', Self.CopyrightFontName);
    AInt('CopyrightFontSize', Self.CopyrightFontSize);
    case Self.FRightToLeft of
      bdDefault:  ;
      bdFalse:    AStr('RightToLeft', 'no');
      bdTrue:     AStr('RightToLeft', 'yes');
    end;
  end;
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

procedure TJDISLangOptions.SetRightToLeft(const Value: TBoolDef);
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

procedure TJDISLangOptions.SetXTextAfter(const Value: TStrings);
begin
  FXTextAfter.Assign(Value);
end;

procedure TJDISLangOptions.SetXTextBefore(const Value: TStrings);
begin
  FXTextBefore.Assign(Value);
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
  FPermissions:= TJDISPermissions.Create(Self);
end;

destructor TJDISRegistryItem.Destroy;
begin
  FreeAndNil(FPermissions);
  inherited;
end;

function TJDISRegistryItem.FlagsStr: String;
begin
  Result:= '';
  if TJDISRegFlag.isrfCreateValueIfDoesntExist in FFlags then
    Result:= Result + 'createvalueifdoesntexist ';
  if TJDISRegFlag.isrfDeleteKey in FFlags then
    Result:= Result + 'deletekey ';
  if TJDISRegFlag.isrfDeleteValue in FFlags then
    Result:= Result + 'deletevalue ';
  if TJDISRegFlag.isrfDontCreateKey in FFlags then
    Result:= Result + 'dontcreatekey ';
  if TJDISRegFlag.isrfNoError in FFlags then
    Result:= Result + 'noerror ';
  if TJDISRegFlag.isrfPreserveStringType in FFlags then
    Result:= Result + 'preservestringtype ';
  if TJDISRegFlag.isrfUninsClearValue in FFlags then
    Result:= Result + 'uninsclearvalue ';
  if TJDISRegFlag.isrfUninsDeleteKey in FFlags then
    Result:= Result + 'uninsdeletekey ';
  if TJDISRegFlag.isrfUninsDeleteKeyIfEmpty in FFlags then
    Result:= Result + 'uninsdeletekeyifempty ';
  if TJDISRegFlag.isrfUninsDeleteValue in FFlags then
    Result:= Result + 'uninsdeletevalue ';
end;

function TJDISRegistryItem.GetFullText: String;
begin
  Result:= 'Root: '+RegRootToStr(FRoot);
  Result:= Result + '; Subkey: "'+FSubkey+'"';
  Result:= Result + '; ValueType: '+RegTypeToStr(FValueType);
  if FValueName <> '' then
    Result:= Result + '; ValueName: "'+FValueName+'"';
  if FValueData <> '' then
    Result:= Result + '; ValueData: "'+FValueData+'"';
  if FPermissions.Count > 0 then begin
    Result:= Result + '; Permissions: '+FPermissions.GetFullText;
  end;
  if FFlags <> [] then begin
    Result:= Result + '; Flags: '+FlagsStr;
  end;
end;

procedure TJDISRegistryItem.SetFlags(const Value: TJDISRegFlags);
begin
  FFlags := Value;
end;

procedure TJDISRegistryItem.SetPermissions(const Value: TJDISPermissions);
begin
  FPermissions.Assign(Value);
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
  FComponents:= TStringList.Create;
end;

destructor TJDISRun.Destroy;
begin
  FreeAndNil(FComponents);
  inherited;
end;

function TJDISRun.GetComponents: TStrings;
begin
  Result:= TStrings(FComponents);
end;

function TJDISRun.GetFullText: String;
var
  T: String;
begin
  Result:= 'Filename: "'+FFilename+'"';
  if FDescription <> '' then
    Result:= Result + '; Description: "'+FDescription+'"';
  if FParameters <> '' then
    Result:= Result + '; Parameters: "'+FParameters+'"';
  if FWorkingDir <> '' then
    Result:= Result + '; WorkingDir: "'+FWorkingDir+'"';
  if FStatusMsg <> '' then
    Result:= Result + '; StatusMsg: "'+FStatusMsg+'"';
  if FRunOnceID <> '' then
    Result:= Result + '; RunOnceId: "'+FRunOnceId+'"';
  if FVerb <> '' then
    Result:= Result + '; Verb: "'+FVerb+'"';
  if FComponents.Count > 0 then
    Result:= Result + '; Components: '+GetSpacedList(FComponents);
  if FFlags <> [] then begin
    T:= '';
    if TJDISRunFlag.isrnf32bit in FFlags then
      T:= T + '32bit ';
    if TJDISRunFlag.isrnf64bit in FFlags then
      T:= T + '64bit ';
    if TJDISRunFlag.isrnfHideWizard in FFlags then
      T:= T + 'hidewizard ';
    if TJDISRunFlag.isrnfNoWait in FFlags then
      T:= T + 'nowait ';
    if TJDISRunFlag.isrnfPostInstall in FFlags then
      T:= T + 'postinstall ';
    if TJDISRunFlag.isrnfRunAsCurrentUser in FFlags then
      T:= T + 'runascurrentuser ';
    if TJDISRunFlag.isrnfRunAsOriginalUser in FFlags then
      T:= T + 'runasoriginaluser ';
    if TJDISRunFlag.isrnfRunHidden in FFlags then
      T:= T + 'runhidden ';
    if TJDISRunFlag.isrnfRunMaximized in FFlags then
      T:= T + 'runmaximized ';
    if TJDISRunFlag.isrnfRunMinimized in FFlags then
      T:= T + 'runminimized ';
    if TJDISRunFlag.isrnfShellExec in FFlags then
      T:= T + 'shellexec ';
    if TJDISRunFlag.isrnfSkipIfDoesntExist in FFlags then
      T:= T + 'skipifdoesntexist ';
    if TJDISRunFlag.isrnfSkipIfNotSilent in FFlags then
      T:= T + 'skipifnotsilent ';
    if TJDISRunFlag.isrnfSkipIfSilent in FFlags then
      T:= T + 'skipifsilent ';
    if TJDISRunFlag.isrnfUnchecked in FFlags then
      T:= T + 'unchecked ';
    if TJDISRunFlag.isrnfWaitUntilIdle in FFlags then
      T:= T + 'waituntilidle ';
    if TJDISRunFlag.isrnfWaitUntilTerminated in FFlags then
      T:= T + 'waituntilterminated ';
    Result:= Result + '; Flags: '+T;
  end;
end;

procedure TJDISRun.SetComponents(const Value: TStrings);
begin
  FComponents.Assign(Value);
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

function TJDISUninstallDelete.GetFullText: String;
begin
  case Self.FType of
    isdtFiles:          Result:= 'Type: files';
    isdtFilesAndOrDirs: Result:= 'Type: filesandordirs';
    isdtDirIfEmpty:     Result:= 'Type: dirifempty';
  end;
  Result:= Result + '; Name: "'+FName+'"';
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

function TJDISUninstallRun.GetFullText: String;
var
  T: String;
begin
  Result:= 'Filename: "'+FFilename+'"';
  if FDescription <> '' then
    Result:= Result + '; Description: "'+FDescription+'"';
  if FParameters <> '' then
    Result:= Result + '; Parameters: "'+FParameters+'"';
  if FWorkingDir <> '' then
    Result:= Result + '; WorkingDir: "'+FWorkingDir+'"';
  if FStatusMsg <> '' then
    Result:= Result + '; StatusMsg: "'+FStatusMsg+'"';
  if FRunOnceID <> '' then
    Result:= Result + '; RunOnceId: "'+FRunOnceId+'"';
  if FVerb <> '' then
    Result:= Result + '; Verb: "'+FVerb+'"';
  if FFlags <> [] then begin
    T:= '';
    if TJDISUninstallRunFlag.isurf32bit in FFlags then
      Result:= Result + '32bit ';
    if TJDISUninstallRunFlag.isurf64bit in FFlags then
      Result:= Result + '64bit ';
    if TJDISUninstallRunFlag.isurfHideWizard in FFlags then
      Result:= Result + 'hidewizard ';
    if TJDISUninstallRunFlag.isurfNoWait in FFlags then
      Result:= Result + 'nowait ';
    if TJDISUninstallRunFlag.isurfPostInstall in FFlags then
      Result:= Result + 'postinstall ';
    if TJDISUninstallRunFlag.isurfRunAsCurrentUser in FFlags then
      Result:= Result + 'runascurrentuser ';
    if TJDISUninstallRunFlag.isurfRunAsOriginalUser in FFlags then
      Result:= Result + 'runasoriginaluser ';
    if TJDISUninstallRunFlag.isurfRunHidden in FFlags then
      Result:= Result + 'runhidden ';
    if TJDISUninstallRunFlag.isurfRunMaximized in FFlags then
      Result:= Result + 'runmaximized ';
    if TJDISUninstallRunFlag.isurfRunMinimized in FFlags then
      Result:= Result + 'runminimized ';
    if TJDISUninstallRunFlag.isurfShellExec in FFlags then
      Result:= Result + 'shellexec ';
    if TJDISUninstallRunFlag.isurfSkipIfDoesntExist in FFlags then
      Result:= Result + 'skipifdoesntexist ';
    if TJDISUninstallRunFlag.isurfSkipIfNotSilent in FFlags then
      Result:= Result + 'skipifnotsilent ';
    if TJDISUninstallRunFlag.isurfSkipIfSilent in FFlags then
      Result:= Result + 'skipifsilent ';
    if TJDISUninstallRunFlag.isurfUnchecked in FFlags then
      Result:= Result + 'unchecked ';
    if TJDISUninstallRunFlag.isurfWaitUntilIdle in FFlags then
      Result:= Result + 'waituntilidle ';
    if TJDISUninstallRunFlag.isurfWaitUntilTerminated in FFlags then
      Result:= Result + 'waituntilterminated ';
    Result:= Result + '; Flags: '+T;
  end;
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
