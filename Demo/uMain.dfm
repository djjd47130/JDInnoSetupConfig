object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'JD Inno Setup Script Demo'
  ClientHeight = 458
  ClientWidth = 838
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object txtScript: TMemo
    Left = 0
    Top = 39
    Width = 838
    Height = 419
    Align = alBottom
    Anchors = [akLeft, akTop, akRight, akBottom]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Consolas'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 0
    WordWrap = False
  end
  object Button1: TButton
    Left = 8
    Top = 8
    Width = 113
    Height = 25
    Caption = 'Generate Script'
    TabOrder = 1
    OnClick = Button1Click
  end
  object InnoSetup: TJDInnoSetupScript
    Defines = <
      item
        Name = 'MyAppName'
        Value = 'Test Application'
      end
      item
        Name = 'MyAppVersion'
        Value = '1.0'
      end
      item
        Name = 'MyAppPublisher'
        Value = 'JD Software Inc'
      end
      item
        Name = 'MyAppURL'
        Value = 'http://www.jerrydodge.com'
      end>
    Code.Strings = (
      'procedure DoSomething;'
      'begin'
      ''
      'end;'
      ''
      'procedure DoTest;'
      'begin'
      '  DoSomething;'
      'end;')
    Setup.Compiler.Compression.Compression = iscLzma
    Setup.Compiler.Compression.CompressionVer = 0
    Setup.Compiler.Compression.LZMAAlgorithm = 0
    Setup.Compiler.Compression.LZMABlockSize = 0
    Setup.Compiler.Compression.LZMADictionarySize = 0
    Setup.Compiler.Compression.LZMAMatchFinder = iscmfDefault
    Setup.Compiler.Compression.LZMANumBlockThreads = 0
    Setup.Compiler.Compression.LZMANumFastBytes = 0
    Setup.Compiler.Compression.SolidCompression = bdTrue
    Setup.Compiler.OutputBaseFilename = 'MySetup'
    Setup.Compiler.OutputDir = '.\'
    Setup.Installer.AppId = '{{61571CEE-9CE0-4104-A2BB-B1B7AF19DFE2}'
    Setup.Installer.AppName = '{#MyAppName}'
    Setup.Installer.AppPublisher = '{#MyAppPublisher}'
    Setup.Installer.AppPublisherURL = '{#MyAppURL}'
    Setup.Installer.AppSupportURL = '{#MyAppURL}'
    Setup.Installer.AppUpdatesURL = '{#MyAppURL}'
    Setup.Installer.AppVerName = '{#MyAppName}'
    Setup.Installer.AppVersion = '{#MyAppVersion}'
    Setup.Installer.ArchitecturesAllowed = []
    Setup.Installer.ArchitecturesInstallIn64BitMode = []
    Setup.Installer.DefaultDirName = '{autopf}\{#MyAppPublisher}\{#MyAppName}'
    Setup.Installer.DefaultGroupName = '{#MyAppPublisher}\{#MyAppName}'
    Setup.Installer.DirExistsWarning = isbaDefault
    Setup.Installer.DisableDirPage = isbaDefault
    Setup.Installer.DisableProgramGroupPage = isbaDefault
    Setup.Installer.PrivilegesRequiredOverridesAllowed = []
    Setup.Installer.TimeStampsInUTC = bdDefault
    Setup.Cosmetic.WizardStyle = iswsModern
    Types = <
      item
        Name = 'basic'
        Description = 'Basic Installation'
        Flags = []
      end
      item
        Name = 'full'
        Description = 'Full Installation'
        Flags = []
      end
      item
        Name = 'custom'
        Description = 'Custom Installation'
        Flags = [istfIsCustom]
      end>
    Components = <
      item
        Name = 'critical'
        Description = 'Critical Files'
        Types.Strings = (
          'full'
          'basic'
          'custom')
        ExtraDiskSpaceRequired = 0
        Flags = [iscfFixed]
      end
      item
        Name = 'additional'
        Description = 'Additional Files'
        Types.Strings = (
          'full')
        ExtraDiskSpaceRequired = 0
        Flags = []
      end>
    Tasks = <>
    Dirs = <>
    Files = <
      item
        XTextBefore.Strings = (
          'This is before.')
        XTextAfter.Strings = (
          'This is after.')
        Source = 'MyProg.exe'
        DestDir = '{app}'
        ExternalSize = 0
        Attribs = [isaReadOnly, isaHidden]
        Permissions = <>
        Components.Strings = (
          'critical')
        Flags.External = True
        Flags.IgnoreVersion = True
      end
      item
        Source = 'MyProgConfig.ini'
        DestDir = '{app}'
        ExternalSize = 0
        Attribs = []
        Permissions = <
          item
            AccessType = ispaModify
            Identifier = 'users'
          end>
        Components.Strings = (
          'critical'
          'additional')
        Flags.External = True
        Flags.IgnoreVersion = True
      end>
    Icons = <>
    Ini = <>
    InstallDelete = <>
    Languages = <
      item
        Name = 'english'
        MessagesFile = 'compiler:Default.isl'
      end>
    Messages = <>
    CustomMessages = <>
    LangOptions.RightToLeft = bdFalse
    Registry = <
      item
        Root = isrrLocalMachine
        Subkey = 'Software\MyApp'
        ValueType = isrtNone
        Permissions = <>
        Flags = [isrfUninsDeleteKey]
      end>
    Run = <>
    UninstallDelete = <>
    UninstallRun = <>
    Left = 288
    Top = 64
  end
end
