inherited frmSetupInstaller: TfrmSetupInstaller
  Caption = 'Installer'
  ClientHeight = 339
  ClientWidth = 829
  ExplicitWidth = 845
  ExplicitHeight = 378
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel [0]
    Left = 8
    Top = 4
    Width = 73
    Height = 13
    Caption = 'Always Restart'
  end
  object Label1: TLabel [1]
    Left = 8
    Top = 190
    Width = 104
    Height = 13
    Caption = 'Changes Associations'
  end
  object Label2: TLabel [2]
    Left = 175
    Top = 190
    Width = 105
    Height = 13
    Caption = 'Changes Environment'
  end
  object Label4: TLabel [3]
    Left = 8
    Top = 51
    Width = 86
    Height = 13
    Caption = 'Close Applications'
  end
  object Label5: TLabel [4]
    Left = 8
    Top = 97
    Width = 113
    Height = 13
    Caption = 'Close Applications Filter'
  end
  object Label6: TLabel [5]
    Left = 175
    Top = 4
    Width = 71
    Height = 13
    Caption = 'Create App Dir'
  end
  object Label7: TLabel [6]
    Left = 175
    Top = 52
    Width = 87
    Height = 13
    Caption = 'Dir Exists Warning'
  end
  object Label8: TLabel [7]
    Left = 175
    Top = 97
    Width = 156
    Height = 13
    Caption = 'Enable Dir Doesn'#39't Exist Warning'
  end
  object Label9: TLabel [8]
    Left = 8
    Top = 143
    Width = 164
    Height = 13
    Caption = 'Extra Disk Space Required (bytes)'
  end
  object Label10: TLabel [9]
    Left = 175
    Top = 144
    Width = 135
    Height = 13
    Caption = 'Language Detection Method'
  end
  object Label11: TLabel [10]
    Left = 342
    Top = 4
    Width = 96
    Height = 13
    Caption = 'Restart Applications'
  end
  object Label12: TLabel [11]
    Left = 342
    Top = 51
    Width = 124
    Height = 13
    Caption = 'Restart If Needed By Run'
  end
  object Label13: TLabel [12]
    Left = 342
    Top = 97
    Width = 68
    Height = 13
    Caption = 'Setup Logging'
  end
  object Label14: TLabel [13]
    Left = 342
    Top = 143
    Width = 61
    Height = 13
    Caption = 'Setup Mutex'
  end
  object Label15: TLabel [14]
    Left = 509
    Top = 97
    Width = 108
    Height = 13
    Caption = 'Show Language Dialog'
  end
  object Label16: TLabel [15]
    Left = 509
    Top = 4
    Width = 99
    Height = 13
    Caption = 'Timestamp Rounding'
  end
  object Label17: TLabel [16]
    Left = 509
    Top = 51
    Width = 92
    Height = 13
    Caption = 'Timestamps In UTC'
  end
  object Label18: TLabel [17]
    Left = 342
    Top = 190
    Width = 55
    Height = 13
    Caption = 'Touch Date'
  end
  object Label19: TLabel [18]
    Left = 509
    Top = 190
    Width = 54
    Height = 13
    Caption = 'Touch Time'
  end
  inherited ToolBar1: TToolBar
    Top = 305
    Width = 829
    ExplicitTop = 305
    ExplicitWidth = 829
  end
  object cboAlwaysRestart: TComboBox [20]
    Left = 8
    Top = 23
    Width = 161
    Height = 21
    Style = csDropDownList
    ItemIndex = 0
    TabOrder = 1
    Text = 'Default'
    Items.Strings = (
      'Default'
      'False'
      'True')
  end
  object cboChangesAssociations: TComboBox [21]
    Left = 8
    Top = 209
    Width = 161
    Height = 21
    Style = csDropDownList
    ItemIndex = 0
    TabOrder = 2
    Text = 'Default'
    OnClick = cboChangesAssociationsClick
    Items.Strings = (
      'Default'
      'False'
      'True'
      'Expression...')
  end
  object cboChangesEnvironment: TComboBox [22]
    Left = 175
    Top = 209
    Width = 161
    Height = 21
    Style = csDropDownList
    ItemIndex = 0
    TabOrder = 3
    Text = 'Default'
    OnClick = cboChangesEnvironmentClick
    Items.Strings = (
      'Default'
      'False'
      'True'
      'Expression...')
  end
  object txtChangesAssociations: TEdit [23]
    Left = 8
    Top = 235
    Width = 161
    Height = 21
    TabOrder = 4
    Visible = False
  end
  object txtChangesEnvironment: TEdit [24]
    Left = 175
    Top = 236
    Width = 161
    Height = 21
    TabOrder = 5
    Visible = False
  end
  object cboCloseApplications: TComboBox [25]
    Left = 8
    Top = 70
    Width = 161
    Height = 21
    Style = csDropDownList
    ItemIndex = 0
    TabOrder = 6
    Text = 'Default'
    OnClick = cboChangesEnvironmentClick
    Items.Strings = (
      'Default'
      'False'
      'True'
      'Force')
  end
  object txtCloseApplicationsFilter: TEdit [26]
    Left = 8
    Top = 116
    Width = 161
    Height = 21
    TabOrder = 7
  end
  object cboCreateAppDir: TComboBox [27]
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
  object cboDirExistsWarning: TComboBox [28]
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
      'True'
      'Auto')
  end
  object cboEnableDirDoesntExistWarning: TComboBox [29]
    Left = 175
    Top = 116
    Width = 161
    Height = 21
    Style = csDropDownList
    ItemIndex = 0
    TabOrder = 10
    Text = 'Default'
    Items.Strings = (
      'Default'
      'False'
      'True')
  end
  object seExtraDiskSpaceRequired: TSpinEdit [30]
    Left = 8
    Top = 162
    Width = 161
    Height = 22
    MaxValue = 0
    MinValue = 0
    TabOrder = 11
    Value = 0
  end
  object cboLanguageDetectionMethod: TComboBox [31]
    Left = 175
    Top = 163
    Width = 161
    Height = 21
    Style = csDropDownList
    ItemIndex = 0
    TabOrder = 12
    Text = 'Default'
    Items.Strings = (
      'Default'
      'UI Language'
      'Locale'
      'None')
  end
  object cboRestartApplications: TComboBox [32]
    Left = 342
    Top = 23
    Width = 161
    Height = 21
    Style = csDropDownList
    ItemIndex = 0
    TabOrder = 13
    Text = 'Default'
    Items.Strings = (
      'Default'
      'False'
      'True')
  end
  object cboRestartIfNeededByRun: TComboBox [33]
    Left = 342
    Top = 70
    Width = 161
    Height = 21
    Style = csDropDownList
    ItemIndex = 0
    TabOrder = 14
    Text = 'Default'
    Items.Strings = (
      'Default'
      'False'
      'True')
  end
  object cboSetupLogging: TComboBox [34]
    Left = 342
    Top = 116
    Width = 161
    Height = 21
    Style = csDropDownList
    ItemIndex = 0
    TabOrder = 15
    Text = 'Default'
    Items.Strings = (
      'Default'
      'False'
      'True')
  end
  object txtSetupMutex: TEdit [35]
    Left = 342
    Top = 162
    Width = 161
    Height = 21
    TabOrder = 16
  end
  object cboShowLanguageDialog: TComboBox [36]
    Left = 509
    Top = 116
    Width = 161
    Height = 21
    Style = csDropDownList
    ItemIndex = 0
    TabOrder = 17
    Text = 'Default'
    Items.Strings = (
      'Default'
      'False'
      'True'
      'Auto')
  end
  object seTimestampRounding: TSpinEdit [37]
    Left = 509
    Top = 23
    Width = 161
    Height = 22
    MaxValue = 60
    MinValue = 0
    TabOrder = 18
    Value = 2
  end
  object cboTimeStampsInUTC: TComboBox [38]
    Left = 509
    Top = 70
    Width = 161
    Height = 21
    Style = csDropDownList
    ItemIndex = 0
    TabOrder = 19
    Text = 'Default'
    Items.Strings = (
      'Default'
      'False'
      'True')
  end
  object cboTouchDate: TComboBox [39]
    Left = 342
    Top = 209
    Width = 161
    Height = 21
    Style = csDropDownList
    ItemIndex = 0
    TabOrder = 20
    Text = 'Default'
    OnClick = cboTouchDateClick
    Items.Strings = (
      'Default'
      'Current'
      'None'
      'Custom...')
  end
  object cboTouchTime: TComboBox [40]
    Left = 509
    Top = 209
    Width = 161
    Height = 21
    Style = csDropDownList
    ItemIndex = 0
    TabOrder = 21
    Text = 'Default'
    OnClick = cboTouchTimeClick
    Items.Strings = (
      'Default'
      'Current'
      'None'
      'Custom...')
  end
  object dtTouchDate: TDateTimePicker [41]
    Left = 342
    Top = 236
    Width = 161
    Height = 21
    Date = 44142.000000000000000000
    Time = 0.503789340276853200
    TabOrder = 22
    Visible = False
  end
  object dtTouchTime: TDateTimePicker [42]
    Left = 509
    Top = 236
    Width = 161
    Height = 21
    Date = 44142.000000000000000000
    Time = 0.503789340276853200
    Kind = dtkTime
    TabOrder = 23
    Visible = False
  end
  inherited Acts: TActionList
    Left = 691
    Top = 251
  end
end
