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
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pTop: TPanel
    Left = 0
    Top = 29
    Width = 1035
    Height = 481
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      1035
      481)
    object btnGenerate: TButton
      Left = 872
      Top = 448
      Width = 147
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Generate Script'
      TabOrder = 0
      OnClick = btnGenerateClick
    end
    object Pages: TPageControl
      Left = 0
      Top = 0
      Width = 1035
      Height = 441
      ActivePage = tabSetup
      Align = alTop
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      object tabSetup: TTabSheet
        Caption = 'Setup'
        object SetupPages: TPageControl
          Left = 0
          Top = 0
          Width = 1027
          Height = 377
          ActivePage = tabGeneral
          Align = alTop
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          object tabGeneral: TTabSheet
            Caption = 'General'
          end
          object tabDefines: TTabSheet
            Caption = 'Defines'
            ImageIndex = 18
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 0
            ExplicitHeight = 0
          end
          object tabAppInfo: TTabSheet
            Caption = 'App Info'
            ImageIndex = 13
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 0
            ExplicitHeight = 0
          end
          object tabVersion: TTabSheet
            Caption = 'Version'
            ImageIndex = 6
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 0
            ExplicitHeight = 0
          end
          object tabCompiler: TTabSheet
            Caption = 'Compiler'
            ImageIndex = 2
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 0
            ExplicitHeight = 0
          end
          object tabInstaller: TTabSheet
            Caption = 'Installer'
            ImageIndex = 3
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 0
            ExplicitHeight = 0
          end
          object tabCosmetic: TTabSheet
            Caption = 'Cosmetic'
            ImageIndex = 5
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 0
            ExplicitHeight = 0
          end
          object tabWizard: TTabSheet
            Caption = 'Wizard'
            ImageIndex = 8
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 0
            ExplicitHeight = 0
          end
          object tabCompression: TTabSheet
            Caption = 'Compression'
            ImageIndex = 1
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 0
            ExplicitHeight = 0
          end
          object tabSignature: TTabSheet
            Caption = 'Signature'
            ImageIndex = 4
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 0
            ExplicitHeight = 0
          end
          object tabDiskSlicing: TTabSheet
            Caption = 'Disk Slicing'
            ImageIndex = 7
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 0
            ExplicitHeight = 0
          end
          object tabUpdate: TTabSheet
            Caption = 'Update'
            ImageIndex = 9
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 0
            ExplicitHeight = 0
          end
          object tabUninstall: TTabSheet
            Caption = 'Uninstall'
            ImageIndex = 10
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 0
            ExplicitHeight = 0
          end
        end
      end
      object tabTypes: TTabSheet
        Caption = 'Types'
        ImageIndex = 1
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
      end
      object tabComponents: TTabSheet
        Caption = 'Components'
        ImageIndex = 2
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
      end
      object tabTasks: TTabSheet
        Caption = 'Tasks'
        ImageIndex = 3
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
      end
      object tabDirs: TTabSheet
        Caption = '  Dirs'
        ImageIndex = 4
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
      end
      object tabFiles: TTabSheet
        Caption = '  Files'
        ImageIndex = 5
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
      end
      object tabIcons: TTabSheet
        Caption = 'Icons'
        ImageIndex = 6
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
      end
      object tabINI: TTabSheet
        Caption = '  INI'
        ImageIndex = 7
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
      end
      object tabInstallDelete: TTabSheet
        Caption = 'Install Delete'
        ImageIndex = 8
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
      end
      object tabLanguages: TTabSheet
        Caption = 'Languages'
        ImageIndex = 9
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
      end
      object tabMessages: TTabSheet
        Caption = 'Messages'
        ImageIndex = 10
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
      end
      object tabCustomMessages: TTabSheet
        Caption = 'Custom Messages'
        ImageIndex = 11
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
      end
      object tabLangOptions: TTabSheet
        Caption = 'Lang Options'
        ImageIndex = 12
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
      end
      object tabRegistry: TTabSheet
        Caption = 'Registry'
        ImageIndex = 13
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
      end
      object tabRun: TTabSheet
        Caption = '  Run'
        ImageIndex = 14
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
      end
      object tabUninstallDelete: TTabSheet
        Caption = 'Uninst Delete'
        ImageIndex = 15
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
      end
      object tabUninstallRun: TTabSheet
        Caption = 'Uninst Run'
        ImageIndex = 16
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
      end
      object tabCode: TTabSheet
        Caption = '  Code  '
        ImageIndex = 17
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
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
    TabOrder = 2
    object ToolButton1: TToolButton
      Left = 0
      Top = 0
      Action = actNew
    end
    object ToolButton4: TToolButton
      Left = 32
      Top = 0
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object ToolButton2: TToolButton
      Left = 40
      Top = 0
      Action = actOpen
    end
    object ToolButton3: TToolButton
      Left = 72
      Top = 0
      Action = actSave
    end
    object ToolButton5: TToolButton
      Left = 104
      Top = 0
      Action = actSaveAs
    end
    object ToolButton6: TToolButton
      Left = 136
      Top = 0
      Action = actCloseFile
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
    Left = 72
    Top = 496
  end
  object dlgOpen: TOpenDialog
    Left = 152
    Top = 496
  end
  object dlgSave: TSaveDialog
    Left = 216
    Top = 496
  end
  object SynInno: TSynInnoSyn
    Options.AutoDetectEnabled = False
    Options.AutoDetectLineLimit = 0
    Options.Visible = False
    KeyAttri.Foreground = clSkyBlue
    NumberAttri.Foreground = clRed
    StringAttri.Foreground = clSkyBlue
    Left = 144
    Top = 568
  end
  object MM: TMainMenu
    Images = DM.Img16
    Left = 280
    Top = 496
    object File1: TMenuItem
      Caption = 'File'
      object New1: TMenuItem
        Action = actNew
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object Open1: TMenuItem
        Action = actOpen
      end
      object Save1: TMenuItem
        Action = actSave
      end
      object SaveAs1: TMenuItem
        Action = actSaveAs
      end
      object Close1: TMenuItem
        Action = actCloseFile
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
    Left = 432
    Top = 496
    StyleName = 'Standard'
    object actNew: TAction
      Category = 'File'
      Caption = 'New...'
      ImageIndex = 0
      OnExecute = actNewExecute
    end
    object actOpen: TAction
      Category = 'File'
      Caption = 'Open...'
      ImageIndex = 5
      OnExecute = actOpenExecute
    end
    object actSave: TAction
      Category = 'File'
      Caption = 'Save'
      ImageIndex = 6
      OnExecute = actSaveExecute
    end
    object actSaveAs: TAction
      Category = 'File'
      Caption = 'Save As...'
      ImageIndex = 7
      OnExecute = actSaveAsExecute
    end
    object actCloseFile: TAction
      Category = 'File'
      Caption = 'Close'
      ImageIndex = 8
      OnExecute = actCloseFileExecute
    end
    object actExit: TAction
      Category = 'File'
      Caption = 'Exit'
      ImageIndex = 9
      OnExecute = actOpenExecute
    end
  end
end
