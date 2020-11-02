inherited frmSetupCompiler: TfrmSetupCompiler
  Caption = 'Compiler'
  ClientHeight = 338
  ClientWidth = 745
  ExplicitWidth = 761
  ExplicitHeight = 377
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel [0]
    Left = 8
    Top = 4
    Width = 81
    Height = 13
    Caption = 'ASLR Compatible'
  end
  object Label1: TLabel [1]
    Left = 8
    Top = 52
    Width = 75
    Height = 13
    Caption = 'DEP Compatible'
  end
  object Label2: TLabel [2]
    Left = 8
    Top = 100
    Width = 51
    Height = 13
    Caption = 'Encryption'
  end
  object Label4: TLabel [3]
    Left = 8
    Top = 148
    Width = 101
    Height = 13
    Caption = 'Merge Duplicate Files'
  end
  object Label5: TLabel [4]
    Left = 8
    Top = 196
    Width = 117
    Height = 13
    Caption = 'Terminal Services Aware'
  end
  object Label6: TLabel [5]
    Left = 175
    Top = 4
    Width = 123
    Height = 13
    Caption = 'Used User Areas Warning'
  end
  object Label7: TLabel [6]
    Left = 175
    Top = 52
    Width = 67
    Height = 13
    Caption = 'Use Setup Ldr'
  end
  object Label8: TLabel [7]
    Left = 175
    Top = 100
    Width = 54
    Height = 13
    Caption = 'Min Version'
  end
  object Label9: TLabel [8]
    Left = 175
    Top = 148
    Width = 91
    Height = 13
    Caption = 'Only Below Version'
  end
  object Label10: TLabel [9]
    Left = 352
    Top = 4
    Width = 104
    Height = 13
    Caption = 'Architectures Allowed'
  end
  object Label11: TLabel [10]
    Left = 503
    Top = 4
    Width = 171
    Height = 13
    Caption = 'Architectures Allowed in 64bit Mode'
  end
  inherited ToolBar1: TToolBar
    Top = 304
    Width = 745
    ExplicitTop = 304
    ExplicitWidth = 745
  end
  object txtMinVersion: TEdit [12]
    Left = 175
    Top = 119
    Width = 161
    Height = 21
    TabOrder = 1
  end
  object txtOnlyBelowVersion: TEdit [13]
    Left = 175
    Top = 167
    Width = 161
    Height = 21
    TabOrder = 2
  end
  object cboASLRCompatible: TComboBox [14]
    Left = 8
    Top = 23
    Width = 161
    Height = 21
    Style = csDropDownList
    ItemIndex = 0
    TabOrder = 3
    Text = 'Default'
    Items.Strings = (
      'Default'
      'False'
      'True')
  end
  object cboDEPCompatible: TComboBox [15]
    Left = 8
    Top = 71
    Width = 161
    Height = 21
    Style = csDropDownList
    ItemIndex = 0
    TabOrder = 4
    Text = 'Default'
    Items.Strings = (
      'Default'
      'False'
      'True')
  end
  object cboEncryption: TComboBox [16]
    Left = 8
    Top = 119
    Width = 161
    Height = 21
    Style = csDropDownList
    ItemIndex = 0
    TabOrder = 5
    Text = 'Default'
    Items.Strings = (
      'Default'
      'False'
      'True')
  end
  object cboMergeDuplicateFiles: TComboBox [17]
    Left = 8
    Top = 167
    Width = 161
    Height = 21
    Style = csDropDownList
    ItemIndex = 0
    TabOrder = 6
    Text = 'Default'
    Items.Strings = (
      'Default'
      'False'
      'True')
  end
  object cboTerminalServicesAware: TComboBox [18]
    Left = 8
    Top = 215
    Width = 161
    Height = 21
    Style = csDropDownList
    ItemIndex = 0
    TabOrder = 7
    Text = 'Default'
    Items.Strings = (
      'Default'
      'False'
      'True')
  end
  object cboUsedUserAreasWarning: TComboBox [19]
    Left = 175
    Top = 23
    Width = 161
    Height = 21
    Style = csDropDownList
    ItemIndex = 0
    TabOrder = 8
    Text = 'Default'
    Items.Strings = (
      'Default'
      'False'
      'True')
  end
  object cboUseSetupLdr: TComboBox [20]
    Left = 175
    Top = 71
    Width = 161
    Height = 21
    Style = csDropDownList
    ItemIndex = 0
    TabOrder = 9
    Text = 'Default'
    Items.Strings = (
      'Default'
      'False'
      'True')
  end
  object lstArchitecturesAllowed: TCheckListBox [21]
    Left = 352
    Top = 23
    Width = 145
    Height = 138
    ItemHeight = 13
    Items.Strings = (
      'x86'
      'x64'
      'arm64'
      'ia64')
    TabOrder = 10
  end
  object lstArchitecturesAllowedIn64BitMode: TCheckListBox [22]
    Left = 503
    Top = 23
    Width = 145
    Height = 138
    ItemHeight = 13
    Items.Strings = (
      'x64'
      'arm64'
      'ia64')
    TabOrder = 11
  end
  inherited Acts: TActionList
    Left = 219
    Top = 211
  end
end
