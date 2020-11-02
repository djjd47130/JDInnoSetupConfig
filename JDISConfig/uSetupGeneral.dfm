inherited frmSetupGeneral: TfrmSetupGeneral
  Caption = 'Setup General'
  ClientHeight = 337
  ClientWidth = 794
  ExplicitWidth = 810
  ExplicitHeight = 376
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 8
    Top = 11
    Width = 82
    Height = 13
    Caption = 'Application Name'
  end
  object Label2: TLabel [1]
    Left = 8
    Top = 103
    Width = 57
    Height = 13
    Caption = 'App Version'
  end
  object Label5: TLabel [2]
    Left = 8
    Top = 57
    Width = 33
    Height = 13
    Caption = 'App ID'
  end
  object Label6: TLabel [3]
    Left = 8
    Top = 197
    Width = 105
    Height = 13
    Caption = 'Output Base Filename'
  end
  object Label7: TLabel [4]
    Left = 8
    Top = 245
    Width = 81
    Height = 13
    Caption = 'Output Directory'
  end
  object Label8: TLabel [5]
    Left = 8
    Top = 151
    Width = 68
    Height = 13
    Caption = 'App Ver Name'
  end
  object btnGenAppID: TSpeedButton [6]
    Left = 257
    Top = 76
    Width = 23
    Height = 22
    Caption = '...'
    OnClick = btnGenAppIDClick
  end
  object Label3: TLabel [7]
    Left = 296
    Top = 11
    Width = 49
    Height = 13
    Caption = 'Source Dir'
  end
  object Label4: TLabel [8]
    Left = 296
    Top = 57
    Width = 79
    Height = 13
    Caption = 'App Modify Path'
  end
  object Label9: TLabel [9]
    Left = 296
    Top = 103
    Width = 52
    Height = 13
    Caption = 'App Mutex'
  end
  object Label10: TLabel [10]
    Left = 296
    Top = 151
    Width = 34
    Height = 13
    Caption = 'Output'
  end
  inherited ToolBar1: TToolBar
    Top = 303
    Width = 794
    ExplicitTop = 303
    ExplicitWidth = 794
  end
  object txtAppName: TEdit [12]
    Left = 8
    Top = 30
    Width = 272
    Height = 21
    TabOrder = 1
  end
  object txtAppVersion: TEdit [13]
    Left = 8
    Top = 122
    Width = 272
    Height = 21
    TabOrder = 2
  end
  object txtAppID: TEdit [14]
    Left = 8
    Top = 76
    Width = 250
    Height = 21
    TabOrder = 3
  end
  object txtOutputBaseFilename: TEdit [15]
    Left = 8
    Top = 216
    Width = 272
    Height = 21
    TabOrder = 4
  end
  object txtOutputDir: TEdit [16]
    Left = 8
    Top = 264
    Width = 272
    Height = 21
    TabOrder = 5
  end
  object txtAppVerName: TEdit [17]
    Left = 8
    Top = 170
    Width = 272
    Height = 21
    TabOrder = 6
  end
  object txtSourceDir: TEdit [18]
    Left = 296
    Top = 30
    Width = 272
    Height = 21
    TabOrder = 7
  end
  object txtAppModifyPath: TEdit [19]
    Left = 296
    Top = 76
    Width = 272
    Height = 21
    TabOrder = 8
  end
  object txtAppMutex: TEdit [20]
    Left = 296
    Top = 122
    Width = 272
    Height = 21
    TabOrder = 9
  end
  object cboOutput: TComboBox [21]
    Left = 296
    Top = 170
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
  inherited Acts: TActionList
    Left = 403
    Top = 251
  end
end
