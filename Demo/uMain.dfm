object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 368
  ClientWidth = 659
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object InnoSetup: TJDInnoSetupScript
    Defines = <
      item
        Name = 'MyAppName'
        Value = 'Test Application'
      end>
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
        ExtraDiskSpaceRequired = 0
        Flags = [iscfFixed]
      end>
    Tasks = <>
    Dirs = <
      item
        Attribs = []
        Flags = []
      end>
    Files = <
      item
        Source = 'MyProg.exe'
        DestDir = '{app}'
        ExternalSize = 0
        Flags.Is32bit = False
        Flags.Is64bit = False
        Flags.AllowUnsafeFiles = False
        Flags.CompareTimestamp = False
        Flags.ConfirmOverwrite = False
        Flags.CreateAllSubdirs = False
        Flags.DeleteAfterInstall = False
        Flags.DontCopy = False
        Flags.DontVerifyChecksum = False
        Flags.External = False
        Flags.FontIsntTrueType = False
        Flags.GacInstall = False
        Flags.IgnoreVersion = False
        Flags.IsReadme = False
        Flags.NoCompression = False
        Flags.NoEncryption = False
        Flags.NoRegError = False
        Flags.OnlyIfDestFileExists = False
        Flags.OnlyIfDoesntExists = False
        Flags.OverwriteReadOnly = False
        Flags.PromptIfOlder = False
        Flags.RecurseSubdirs = False
        Flags.RegServer = False
        Flags.RegTypeLib = False
        Flags.ReplaceSameVersion = False
        Flags.RestartReplace = False
        Flags.SetNTFSCompression = False
        Flags.SharedFile = False
        Flags.Sign = False
        Flags.SignOnce = False
        Flags.SkipIfSourceDoesntExist = False
        Flags.SolidBreak = False
        Flags.SortFileByExtension = False
        Flags.SortFileByName = False
        Flags.Touch = False
        Flags.UninsNoSharedFilePrompt = False
        Flags.UninsRemoveReadOnly = False
        Flags.UninsRestartDelete = False
        Flags.UninsNeverUninstall = False
        Flags.UnsetNTFSCompression = False
      end>
    Left = 144
    Top = 104
  end
end
