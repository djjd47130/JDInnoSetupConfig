inherited frmDirs: TfrmDirs
  Caption = 'Dirs'
  ClientHeight = 380
  ClientWidth = 772
  ExplicitWidth = 788
  ExplicitHeight = 419
  PixelsPerInch = 96
  TextHeight = 13
  inherited ToolBar1: TToolBar
    Top = 346
    Width = 772
  end
  inherited Details: TPanel
    Top = 171
    Width = 766
    ExplicitTop = 320
    ExplicitWidth = 875
    object Label9: TLabel
      Left = 16
      Top = 13
      Width = 74
      Height = 13
      Caption = 'Directory Name'
    end
    object Label6: TLabel
      Left = 231
      Top = 13
      Width = 48
      Height = 13
      Caption = 'Attributes'
    end
    object Label10: TLabel
      Left = 398
      Top = 13
      Width = 55
      Height = 13
      Caption = 'Permissions'
    end
    object Label1: TLabel
      Left = 561
      Top = 13
      Width = 25
      Height = 13
      Caption = 'Flags'
    end
    object txtName: TEdit
      Left = 16
      Top = 32
      Width = 209
      Height = 21
      TabOrder = 0
    end
    object lstAttribs: TCheckListBox
      Left = 231
      Top = 32
      Width = 161
      Height = 105
      ItemHeight = 13
      Items.Strings = (
        'Read Only'
        'Hidden'
        'System'
        'Not Content Indexed')
      TabOrder = 1
    end
    object lstPermissions: TValueListEditor
      Left = 398
      Top = 32
      Width = 157
      Height = 105
      TabOrder = 2
      ColWidths = (
        81
        70)
    end
    object lstFlags: TCheckListBox
      Left = 561
      Top = 32
      Width = 161
      Height = 105
      ItemHeight = 13
      Items.Strings = (
        'deleteafterinstall'
        'setntfscompression'
        'uninsalwaysuninstall'
        'uninsneveruninstall'
        'unsetntfscompression')
      TabOrder = 3
    end
  end
  inherited Items: TListView
    Width = 766
    Height = 162
  end
end
