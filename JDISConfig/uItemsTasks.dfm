inherited frmTasks: TfrmTasks
  Caption = 'Tasks'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Details: TPanel
    object Label9: TLabel
      Left = 16
      Top = 13
      Width = 52
      Height = 13
      Caption = 'Task Name'
    end
    object Label10: TLabel
      Left = 16
      Top = 61
      Width = 53
      Height = 13
      Caption = 'Description'
    end
    object Label1: TLabel
      Left = 16
      Top = 109
      Width = 85
      Height = 13
      Caption = 'Group Description'
    end
    object Label2: TLabel
      Left = 237
      Top = 13
      Width = 60
      Height = 13
      Caption = 'Components'
    end
    object Label11: TLabel
      Left = 412
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
    object txtDescription: TEdit
      Left = 16
      Top = 80
      Width = 209
      Height = 21
      TabOrder = 1
    end
    object txtGroupDescription: TEdit
      Left = 16
      Top = 128
      Width = 209
      Height = 21
      TabOrder = 2
    end
    object txtComponents: TMemo
      Left = 237
      Top = 32
      Width = 161
      Height = 121
      ScrollBars = ssBoth
      TabOrder = 3
      WordWrap = False
    end
    object lstFlags: TCheckListBox
      Left = 412
      Top = 32
      Width = 161
      Height = 121
      ItemHeight = 13
      Items.Strings = (
        'checkablealone'
        'checkedonce'
        'dontinheritcheck'
        'exclusive'
        'restart'
        'unchecked')
      TabOrder = 4
    end
  end
end
