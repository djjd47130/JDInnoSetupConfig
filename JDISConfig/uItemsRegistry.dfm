inherited frmRegistry: TfrmRegistry
  Caption = 'Registry'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Details: TPanel
    Top = 232
    Height = 188
    ExplicitTop = 232
    ExplicitHeight = 188
    object Label3: TLabel
      Left = 8
      Top = 4
      Width = 23
      Height = 13
      Caption = 'Root'
    end
    object Label5: TLabel
      Left = 8
      Top = 49
      Width = 35
      Height = 13
      Caption = 'Subkey'
    end
    object Label1: TLabel
      Left = 8
      Top = 92
      Width = 53
      Height = 13
      Caption = 'Value Type'
    end
    object Label2: TLabel
      Left = 175
      Top = 4
      Width = 56
      Height = 13
      Caption = 'Value Name'
    end
    object Label4: TLabel
      Left = 175
      Top = 49
      Width = 52
      Height = 13
      Caption = 'Value Data'
    end
    object Label10: TLabel
      Left = 342
      Top = 4
      Width = 55
      Height = 13
      Caption = 'Permissions'
    end
    object Label11: TLabel
      Left = 505
      Top = 4
      Width = 25
      Height = 13
      Caption = 'Flags'
    end
    object cboRoot: TComboBox
      Left = 8
      Top = 23
      Width = 161
      Height = 21
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 0
      Text = 'HKEY_CURRENT_USER'
      Items.Strings = (
        'HKEY_CURRENT_USER'
        'HKEY_LOCAL_MACHINE'
        'HKEY_CLASSES_ROOT'
        'HKEY_USERS'
        'HKEY_CURRENT_CONFIG'
        'HKEY_AUTO')
    end
    object txtSubkey: TEdit
      Left = 8
      Top = 68
      Width = 161
      Height = 21
      TabOrder = 1
    end
    object cboValueType: TComboBox
      Left = 8
      Top = 111
      Width = 161
      Height = 21
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 2
      Text = 'None'
      Items.Strings = (
        'None'
        'String'
        'ExpandSz'
        'MultiSz'
        'DWord'
        'QWord'
        'Binary')
    end
    object txtValueName: TEdit
      Left = 175
      Top = 23
      Width = 161
      Height = 21
      TabOrder = 3
    end
    object txtValueData: TEdit
      Left = 175
      Top = 68
      Width = 161
      Height = 21
      TabOrder = 4
    end
    object lstPermissions: TValueListEditor
      Left = 342
      Top = 23
      Width = 157
      Height = 154
      TabOrder = 5
      ColWidths = (
        81
        70)
    end
    object lstFlags: TCheckListBox
      Left = 505
      Top = 23
      Width = 161
      Height = 154
      ItemHeight = 13
      Items.Strings = (
        'createvalueifdoesntexist'
        'deletekey'
        'deletevalue'
        'dontcreatekey'
        'noerror'
        'preservestringtype'
        'uninsclearvalue'
        'uninsdeletekey'
        'uninsdeletekeyifempty'
        'uninsdeletevalue')
      TabOrder = 6
    end
  end
  inherited Items: TListView
    Height = 223
  end
end
