inherited frmComponents: TfrmComponents
  Caption = 'frmComponents'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Details: TPanel
    object Label9: TLabel
      Left = 16
      Top = 13
      Width = 85
      Height = 13
      Caption = 'Component Name'
    end
    object Label10: TLabel
      Left = 16
      Top = 61
      Width = 53
      Height = 13
      Caption = 'Description'
    end
    object Label11: TLabel
      Left = 432
      Top = 13
      Width = 25
      Height = 13
      Caption = 'Flags'
    end
    object Label1: TLabel
      Left = 16
      Top = 109
      Width = 126
      Height = 13
      Caption = 'Extra Disk Space Required'
    end
    object Label2: TLabel
      Left = 248
      Top = 13
      Width = 29
      Height = 13
      Caption = 'Types'
    end
    object txtName: TEdit
      Left = 16
      Top = 32
      Width = 209
      Height = 21
      TabOrder = 0
    end
    object txtDescription: TEdit
      Left = 16
      Top = 80
      Width = 209
      Height = 21
      TabOrder = 1
    end
    object lstFlags: TCheckListBox
      Left = 432
      Top = 32
      Width = 161
      Height = 121
      ItemHeight = 13
      Items.Strings = (
        'checkablealone'
        'dontinheritcheck'
        'exclusive'
        'fixed'
        'restart'
        'disablenouninstallwarning')
      TabOrder = 2
    end
    object seExtraDiskSpaceRequired: TSpinEdit
      Left = 16
      Top = 128
      Width = 209
      Height = 22
      MaxValue = 0
      MinValue = 0
      TabOrder = 3
      Value = 0
    end
    object txtTypes: TMemo
      Left = 248
      Top = 32
      Width = 161
      Height = 121
      ScrollBars = ssBoth
      TabOrder = 4
      WordWrap = False
    end
  end
end
