inherited frmTypes: TfrmTypes
  Caption = 'Types'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Details: TPanel
    Top = 280
    Height = 140
    ExplicitTop = 280
    ExplicitHeight = 140
    object Label9: TLabel
      Left = 16
      Top = 13
      Width = 54
      Height = 13
      Caption = 'Type Name'
    end
    object Label10: TLabel
      Left = 16
      Top = 61
      Width = 53
      Height = 13
      Caption = 'Description'
    end
    object Label11: TLabel
      Left = 240
      Top = 13
      Width = 25
      Height = 13
      Caption = 'Flags'
    end
    object txtTypeName: TEdit
      Left = 16
      Top = 32
      Width = 209
      Height = 21
      TabOrder = 0
    end
    object txtTypeDescription: TEdit
      Left = 16
      Top = 80
      Width = 209
      Height = 21
      TabOrder = 1
    end
    object lstTypeFlags: TCheckListBox
      Left = 240
      Top = 32
      Width = 129
      Height = 73
      ItemHeight = 13
      Items.Strings = (
        'iscustom')
      TabOrder = 2
    end
  end
  inherited Items: TListView
    Height = 271
    ExplicitHeight = 271
  end
end
