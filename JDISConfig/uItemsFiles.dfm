inherited frmFiles: TfrmFiles
  Caption = 'Files'
  ClientHeight = 448
  ClientWidth = 962
  ExplicitWidth = 978
  ExplicitHeight = 487
  PixelsPerInch = 96
  TextHeight = 13
  inherited ToolBar1: TToolBar
    Top = 414
    Width = 962
    ExplicitTop = 414
    ExplicitWidth = 962
  end
  inherited Details: TPanel
    Top = 200
    Width = 956
    Height = 211
    ExplicitTop = 200
    ExplicitWidth = 956
    ExplicitHeight = 211
    object Label11: TLabel
      Left = 776
      Top = 13
      Width = 25
      Height = 13
      Caption = 'Flags'
    end
    object Label2: TLabel
      Left = 609
      Top = 13
      Width = 60
      Height = 13
      Caption = 'Components'
    end
    object Label9: TLabel
      Left = 16
      Top = 13
      Width = 33
      Height = 13
      Caption = 'Source'
    end
    object Label1: TLabel
      Left = 16
      Top = 61
      Width = 38
      Height = 13
      Caption = 'Dest Dir'
    end
    object Label3: TLabel
      Left = 16
      Top = 109
      Width = 52
      Height = 13
      Caption = 'Dest Name'
    end
    object Label4: TLabel
      Left = 16
      Top = 157
      Width = 42
      Height = 13
      Caption = 'Excludes'
    end
    object Label5: TLabel
      Left = 231
      Top = 61
      Width = 62
      Height = 13
      Caption = 'External Size'
    end
    object Label6: TLabel
      Left = 609
      Top = 109
      Width = 48
      Height = 13
      Caption = 'Attributes'
    end
    object Label7: TLabel
      Left = 231
      Top = 109
      Width = 54
      Height = 13
      Caption = 'Font Install'
    end
    object Label8: TLabel
      Left = 231
      Top = 157
      Width = 110
      Height = 13
      Caption = 'Strong Assembly Name'
    end
    object Label10: TLabel
      Left = 446
      Top = 13
      Width = 55
      Height = 13
      Caption = 'Permissions'
    end
    object lstFlags: TCheckListBox
      Left = 776
      Top = 32
      Width = 161
      Height = 165
      ItemHeight = 13
      Items.Strings = (
        '32bit'
        '64bit'
        'allowunsafefiles'
        'comparetimestamp'
        'confirmoverwrite'
        'createallsubdirs'
        'deleteafterinstall'
        'dontcopy'
        'dontverifychecksum'
        'external'
        'fontisnttruetype'
        'gacinstall'
        'ignoreversion'
        'isreadme'
        'nocompression'
        'noencryption'
        'noregerror'
        'onlyifdestfileexists'
        'onlyifdoesntexist'
        'overwritereadonly'
        'promptifolder'
        'recursesubdirs'
        'regserver'
        'regtypelib'
        'replacesameversion'
        'restartreplace'
        'setntfscompression'
        'sharedfile'
        'sign'
        'signonce'
        'skipifsourcedoesntexist'
        'solidbreak'
        'sortfilesbyextension'
        'sortfilesbyname'
        'touch'
        'uninsnosharedfileprompt'
        'uninsremovereadonly'
        'uninsrestartdelete'
        'uninsneveruninstall'
        'unsetntfscompression')
      TabOrder = 0
    end
    object txtComponents: TMemo
      Left = 609
      Top = 32
      Width = 161
      Height = 73
      ScrollBars = ssBoth
      TabOrder = 1
      WordWrap = False
    end
    object txtSource: TEdit
      Left = 16
      Top = 32
      Width = 424
      Height = 21
      TabOrder = 2
    end
    object txtDestDir: TEdit
      Left = 16
      Top = 80
      Width = 209
      Height = 21
      TabOrder = 3
    end
    object txtDestName: TEdit
      Left = 16
      Top = 128
      Width = 209
      Height = 21
      TabOrder = 4
    end
    object txtExcludes: TEdit
      Left = 16
      Top = 176
      Width = 209
      Height = 21
      TabOrder = 5
    end
    object seExternalSize: TSpinEdit
      Left = 231
      Top = 80
      Width = 110
      Height = 22
      MaxValue = 0
      MinValue = 0
      TabOrder = 6
      Value = 0
    end
    object lstAttribs: TCheckListBox
      Left = 609
      Top = 128
      Width = 161
      Height = 69
      ItemHeight = 13
      Items.Strings = (
        'Read Only'
        'Hidden'
        'System'
        'Not Content Indexed')
      TabOrder = 7
    end
    object txtFontInstall: TEdit
      Left = 231
      Top = 128
      Width = 209
      Height = 21
      TabOrder = 8
    end
    object txtStrongAssemblyName: TEdit
      Left = 231
      Top = 176
      Width = 209
      Height = 21
      TabOrder = 9
    end
    object lstPermissions: TValueListEditor
      Left = 446
      Top = 32
      Width = 157
      Height = 165
      TabOrder = 10
      ColWidths = (
        81
        70)
    end
  end
  inherited Items: TListView
    Width = 956
    Height = 191
    Columns = <
      item
        Caption = 'Name'
        Width = 200
      end>
    ExplicitWidth = 956
    ExplicitHeight = 191
  end
end
