inherited frmIcons: TfrmIcons
  Caption = 'Icons'
  ClientHeight = 440
  ClientWidth = 929
  ExplicitWidth = 945
  ExplicitHeight = 479
  PixelsPerInch = 96
  TextHeight = 13
  inherited ToolBar1: TToolBar
    Top = 406
    Width = 929
    ExplicitTop = 406
    ExplicitWidth = 929
  end
  inherited Details: TPanel
    Top = 192
    Width = 923
    Height = 211
    ExplicitTop = 192
    ExplicitWidth = 923
    ExplicitHeight = 211
    object Label9: TLabel
      Left = 16
      Top = 13
      Width = 27
      Height = 13
      Caption = 'Name'
    end
    object Label1: TLabel
      Left = 16
      Top = 61
      Width = 42
      Height = 13
      Caption = 'Filename'
    end
    object Label2: TLabel
      Left = 16
      Top = 109
      Width = 55
      Height = 13
      Caption = 'Parameters'
    end
    object Label3: TLabel
      Left = 16
      Top = 157
      Width = 86
      Height = 13
      Caption = 'Working Directory'
    end
    object Label4: TLabel
      Left = 231
      Top = 13
      Width = 38
      Height = 13
      Caption = 'Hot Key'
    end
    object Label5: TLabel
      Left = 231
      Top = 61
      Width = 45
      Height = 13
      Caption = 'Comment'
    end
    object Label6: TLabel
      Left = 231
      Top = 109
      Width = 66
      Height = 13
      Caption = 'Icon Filename'
    end
    object Label16: TLabel
      Left = 231
      Top = 157
      Width = 52
      Height = 13
      Caption = 'Icon Index'
    end
    object Label7: TLabel
      Left = 446
      Top = 13
      Width = 89
      Height = 13
      Caption = 'App User Model ID'
    end
    object Label8: TLabel
      Left = 661
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
    object txtFilename: TEdit
      Left = 16
      Top = 80
      Width = 209
      Height = 21
      TabOrder = 1
    end
    object txtParameters: TEdit
      Left = 16
      Top = 128
      Width = 209
      Height = 21
      TabOrder = 2
    end
    object txtWorkingDir: TEdit
      Left = 16
      Top = 176
      Width = 209
      Height = 21
      TabOrder = 3
    end
    object txtHotKey: TEdit
      Left = 231
      Top = 32
      Width = 209
      Height = 21
      TabOrder = 4
    end
    object txtComment: TEdit
      Left = 231
      Top = 80
      Width = 209
      Height = 21
      TabOrder = 5
    end
    object txtIconFilename: TEdit
      Left = 231
      Top = 128
      Width = 209
      Height = 21
      TabOrder = 6
    end
    object seIconIndex: TSpinEdit
      Left = 231
      Top = 176
      Width = 209
      Height = 22
      MaxValue = 60
      MinValue = 0
      TabOrder = 7
      Value = 2
    end
    object txtAppUserModelID: TEdit
      Left = 446
      Top = 32
      Width = 209
      Height = 21
      TabOrder = 8
    end
    object lstFlags: TCheckListBox
      Left = 661
      Top = 32
      Width = 180
      Height = 166
      ItemHeight = 13
      Items.Strings = (
        'closeonexit'
        'createonlyiffileexists'
        'dontcloseonexit'
        'excludefromshowinnewinstall'
        'foldershortcut'
        'preventpinning'
        'runmaximized'
        'runminimized'
        'uninsneveruninstall'
        'useapppaths')
      TabOrder = 9
    end
  end
  inherited Items: TListView
    Width = 923
    Height = 183
    ExplicitWidth = 923
    ExplicitHeight = 183
  end
end
