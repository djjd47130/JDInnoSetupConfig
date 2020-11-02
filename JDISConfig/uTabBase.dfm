object frmTabBase: TfrmTabBase
  Left = 0
  Top = 0
  Caption = 'Tab Base'
  ClientHeight = 397
  ClientWidth = 699
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 363
    Width = 699
    Height = 34
    Align = alBottom
    ButtonHeight = 34
    ButtonWidth = 34
    Caption = 'Tools'
    Images = DM.Img24
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    object ToolButton3: TToolButton
      Left = 0
      Top = 0
      Cursor = crHandPoint
      Action = actEditItem
    end
    object ToolButton5: TToolButton
      Left = 34
      Top = 0
      Cursor = crHandPoint
      Action = actSaveItem
    end
    object ToolButton6: TToolButton
      Left = 68
      Top = 0
      Cursor = crHandPoint
      Action = actCancelItem
    end
  end
  object Acts: TActionList
    Images = DM.Img16
    Left = 291
    Top = 83
    object actEditItem: TAction
      Caption = 'Edit'
      Enabled = False
      Hint = 'Edit selected item'
      ImageIndex = 2
      OnExecute = actEditItemExecute
    end
    object actSaveItem: TAction
      Caption = 'Save'
      Enabled = False
      Hint = 'Save changes to item'
      ImageIndex = 3
      OnExecute = actSaveItemExecute
    end
    object actCancelItem: TAction
      Caption = 'Cancel'
      Enabled = False
      Hint = 'Cancel changes to item'
      ImageIndex = 4
      OnExecute = actCancelItemExecute
    end
  end
end
