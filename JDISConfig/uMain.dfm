object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'JD Inno Setup Config'
  ClientHeight = 645
  ClientWidth = 1035
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MM
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pTop: TPanel
    Left = 0
    Top = 29
    Width = 1035
    Height = 436
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Pages: TPageControl
      Left = 0
      Top = 0
      Width = 1035
      Height = 396
      ActivePage = tabSetup
      Align = alTop
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      ExplicitTop = 6
      ExplicitHeight = 428
      object tabSetup: TTabSheet
        Caption = 'Setup'
        ExplicitHeight = 400
        object SetupPages: TPageControl
          Left = 0
          Top = 0
          Width = 1027
          Height = 332
          ActivePage = tabGeneral
          Align = alTop
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          ExplicitHeight = 364
          object tabGeneral: TTabSheet
            Caption = 'General'
            ExplicitLeft = 0
            ExplicitHeight = 336
          end
          object tabDefines: TTabSheet
            Caption = 'Defines'
            ImageIndex = 18
            ExplicitHeight = 336
          end
          object tabAppInfo: TTabSheet
            Caption = 'App Info'
            ImageIndex = 13
            ExplicitHeight = 336
          end
          object tabVersion: TTabSheet
            Caption = 'Version'
            ImageIndex = 6
            ExplicitHeight = 336
          end
          object tabCompiler: TTabSheet
            Caption = 'Compiler'
            ImageIndex = 2
            ExplicitHeight = 336
          end
          object tabInstaller: TTabSheet
            Caption = 'Installer'
            ImageIndex = 3
            ExplicitHeight = 336
          end
          object tabCosmetic: TTabSheet
            Caption = 'Cosmetic'
            ImageIndex = 5
            ExplicitHeight = 336
          end
          object tabWizard: TTabSheet
            Caption = 'Wizard'
            ImageIndex = 8
            ExplicitHeight = 336
          end
          object tabCompression: TTabSheet
            Caption = 'Compression'
            ImageIndex = 1
            ExplicitHeight = 336
          end
          object tabSignature: TTabSheet
            Caption = 'Signature'
            ImageIndex = 4
            ExplicitHeight = 336
          end
          object tabDiskSlicing: TTabSheet
            Caption = 'Disk Slicing'
            ImageIndex = 7
            ExplicitHeight = 336
          end
          object tabUpdate: TTabSheet
            Caption = 'Update'
            ImageIndex = 9
            ExplicitHeight = 336
          end
          object tabUninstall: TTabSheet
            Caption = 'Uninstall'
            ImageIndex = 10
            ExplicitHeight = 336
          end
        end
      end
      object tabTypes: TTabSheet
        Caption = 'Types'
        ImageIndex = 1
        ExplicitHeight = 400
      end
      object tabComponents: TTabSheet
        Caption = 'Components'
        ImageIndex = 2
        ExplicitHeight = 400
      end
      object tabTasks: TTabSheet
        Caption = 'Tasks'
        ImageIndex = 3
        ExplicitHeight = 400
      end
      object tabDirs: TTabSheet
        Caption = '  Dirs'
        ImageIndex = 4
        ExplicitHeight = 400
      end
      object tabFiles: TTabSheet
        Caption = '  Files'
        ImageIndex = 5
        ExplicitHeight = 400
      end
      object tabIcons: TTabSheet
        Caption = 'Icons'
        ImageIndex = 6
        ExplicitHeight = 400
      end
      object tabINI: TTabSheet
        Caption = '  INI'
        ImageIndex = 7
        ExplicitHeight = 400
      end
      object tabInstallDelete: TTabSheet
        Caption = 'Install Delete'
        ImageIndex = 8
        ExplicitHeight = 400
      end
      object tabLanguages: TTabSheet
        Caption = 'Languages'
        ImageIndex = 9
        ExplicitHeight = 400
      end
      object tabMessages: TTabSheet
        Caption = 'Messages'
        ImageIndex = 10
        ExplicitHeight = 400
      end
      object tabCustomMessages: TTabSheet
        Caption = 'Custom Messages'
        ImageIndex = 11
        ExplicitHeight = 400
      end
      object tabLangOptions: TTabSheet
        Caption = 'Lang Options'
        ImageIndex = 12
        ExplicitHeight = 400
      end
      object tabRegistry: TTabSheet
        Caption = 'Registry'
        ImageIndex = 13
        ExplicitHeight = 400
      end
      object tabRun: TTabSheet
        Caption = '  Run'
        ImageIndex = 14
        ExplicitHeight = 400
      end
      object tabUninstallDelete: TTabSheet
        Caption = 'Uninst Delete'
        ImageIndex = 15
        ExplicitHeight = 400
      end
      object tabUninstallRun: TTabSheet
        Caption = 'Uninst Run'
        ImageIndex = 16
        ExplicitHeight = 400
      end
      object tabCode: TTabSheet
        Caption = '  Code  '
        ImageIndex = 17
        ExplicitHeight = 400
      end
    end
  end
  object Txt: TSynEdit
    Left = 0
    Top = 536
    Width = 1035
    Height = 109
    Align = alBottom
    Anchors = [akLeft, akTop, akRight, akBottom]
    Color = clBlack
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    TabOrder = 1
    CodeFolding.GutterShapeSize = 11
    CodeFolding.CollapsedLineColor = clGrayText
    CodeFolding.FolderBarLinesColor = clGrayText
    CodeFolding.IndentGuidesColor = clGray
    CodeFolding.IndentGuides = True
    CodeFolding.ShowCollapsedLine = False
    CodeFolding.ShowHintMark = True
    UseCodeFolding = False
    Gutter.Color = clBlack
    Gutter.Font.Charset = DEFAULT_CHARSET
    Gutter.Font.Color = clWhite
    Gutter.Font.Height = -11
    Gutter.Font.Name = 'Courier New'
    Gutter.Font.Style = []
    Gutter.ShowLineNumbers = True
    Highlighter = SynInno
    ReadOnly = True
    RightEdge = 0
    WantTabs = True
    FontSmoothing = fsmNone
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 1035
    Height = 29
    ButtonHeight = 32
    ButtonWidth = 32
    Caption = 'ToolBar1'
    Images = DM.Img24
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    object ToolButton1: TToolButton
      Left = 0
      Top = 0
      Cursor = crHandPoint
      Action = actNew
    end
    object ToolButton2: TToolButton
      Left = 32
      Top = 0
      Cursor = crHandPoint
      Action = actOpen
    end
    object ToolButton4: TToolButton
      Left = 64
      Top = 0
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object ToolButton3: TToolButton
      Left = 72
      Top = 0
      Cursor = crHandPoint
      Action = actSave
    end
    object ToolButton5: TToolButton
      Left = 104
      Top = 0
      Cursor = crHandPoint
      Action = actSaveAs
    end
    object ToolButton6: TToolButton
      Left = 136
      Top = 0
      Width = 8
      Caption = 'ToolButton6'
      ImageIndex = 8
      Style = tbsSeparator
    end
    object ToolButton7: TToolButton
      Left = 144
      Top = 0
      Cursor = crHandPoint
      Action = actGenerate
    end
  end
  object Script: TJDInnoSetupScript
    Defines = <>
    Setup.Compiler.Compression.Compression = iscDefault
    Setup.Compiler.Compression.CompressionVer = 0
    Setup.Compiler.Compression.LZMAAlgorithm = 0
    Setup.Compiler.Compression.LZMABlockSize = 0
    Setup.Compiler.Compression.LZMADictionarySize = 0
    Setup.Compiler.Compression.LZMAMatchFinder = iscmfDefault
    Setup.Compiler.Compression.LZMANumBlockThreads = 0
    Setup.Compiler.Compression.LZMANumFastBytes = 0
    Setup.Installer.ArchitecturesAllowed = []
    Setup.Installer.ArchitecturesInstallIn64BitMode = []
    Setup.Installer.DirExistsWarning = isbaDefault
    Setup.Installer.DisableDirPage = isbaDefault
    Setup.Installer.DisableProgramGroupPage = isbaDefault
    Setup.Installer.PrivilegesRequiredOverridesAllowed = []
    Setup.Installer.TimeStampsInUTC = bdDefault
    Setup.Cosmetic.WizardStyle = iswsModern
    Types = <>
    Components = <>
    Tasks = <>
    Dirs = <>
    Files = <>
    Icons = <>
    Ini = <>
    InstallDelete = <>
    Languages = <>
    Messages = <>
    CustomMessages = <>
    Registry = <>
    Run = <>
    UninstallDelete = <>
    UninstallRun = <>
    Left = 40
    Top = 472
  end
  object dlgOpen: TOpenDialog
    DefaultExt = '.jdis'
    Filter = 'JD Inno Setup Config Files (*.jdis)|*.jdis|All Files (*.*)|*.*'
    Options = [ofHideReadOnly, ofFileMustExist, ofEnableSizing]
    Title = 'Open JD Inno Setup Config File'
    Left = 120
    Top = 472
  end
  object dlgSave: TSaveDialog
    DefaultExt = '.jdis'
    Filter = 'JD Inno Setup Config Files (*.jdis)|*.jdis|All Files (*.*)|*.*'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Title = 'Save JD Inno Setup Config File'
    Left = 184
    Top = 472
  end
  object SynInno: TSynInnoSyn
    Options.AutoDetectEnabled = False
    Options.AutoDetectLineLimit = 0
    Options.Visible = False
    KeyAttri.Foreground = clSkyBlue
    NumberAttri.Foreground = clRed
    StringAttri.Foreground = clMoneyGreen
    Left = 352
    Top = 472
  end
  object MM: TMainMenu
    Images = DM.Img16
    Left = 248
    Top = 472
    object File1: TMenuItem
      Caption = 'File'
      object New1: TMenuItem
        Action = actNew
      end
      object Open1: TMenuItem
        Action = actOpen
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object Save1: TMenuItem
        Action = actSave
      end
      object SaveAs1: TMenuItem
        Action = actSaveAs
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Exit1: TMenuItem
        Action = actExit
      end
    end
    object View1: TMenuItem
      Caption = 'View'
      object RefreshScript1: TMenuItem
        Caption = 'Refresh Script'
      end
    end
    object Options1: TMenuItem
      Caption = 'Options'
      object Settings1: TMenuItem
        Caption = 'Settings...'
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object GenerateScript1: TMenuItem
        Action = actGenerate
      end
    end
    object Help1: TMenuItem
      Caption = 'Help'
      object HelpContents1: TMenuItem
        Caption = 'Help Contents'
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object About1: TMenuItem
        Caption = 'About'
      end
    end
  end
  object Acts: TActionManager
    Images = DM.Img16
    Left = 400
    Top = 472
    StyleName = 'Standard'
    object actNew: TAction
      Category = 'File'
      Caption = 'New...'
      Hint = 'Create new config file'
      ImageIndex = 0
      ShortCut = 16462
      OnExecute = actNewExecute
    end
    object actOpen: TAction
      Category = 'File'
      Caption = 'Open...'
      Hint = 'Open existing config file'
      ImageIndex = 5
      ShortCut = 16463
      OnExecute = actOpenExecute
    end
    object actSave: TAction
      Category = 'File'
      Caption = 'Save'
      Hint = 'Save current config file'
      ImageIndex = 6
      ShortCut = 16467
      OnExecute = actSaveExecute
    end
    object actSaveAs: TAction
      Category = 'File'
      Caption = 'Save As...'
      Hint = 'Save current config file as'
      ImageIndex = 7
      OnExecute = actSaveAsExecute
    end
    object actExit: TAction
      Category = 'File'
      Caption = 'Exit'
      Hint = 'Exit application'
      ImageIndex = 9
      OnExecute = actExitExecute
    end
    object actGenerate: TAction
      Category = 'Options'
      Caption = 'Generate Script'
      Hint = 'Generate script'
      ImageIndex = 10
      ShortCut = 16455
      OnExecute = actGenerateExecute
    end
  end
end
