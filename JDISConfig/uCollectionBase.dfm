inherited frmCollectionBase: TfrmCollectionBase
  Caption = 'Collection Base'
  ClientHeight = 457
  ClientWidth = 759
  ExplicitWidth = 775
  ExplicitHeight = 496
  PixelsPerInch = 96
  TextHeight = 13
  inherited ToolBar1: TToolBar
    Top = 423
    Width = 759
    Images = DM.Img24
    ExplicitTop = 423
    ExplicitWidth = 759
    object ToolButton1: TToolButton
      Left = 102
      Top = 0
      Width = 8
      Caption = 'ToolButton1'
      ImageIndex = 5
      Style = tbsSeparator
    end
    object ToolButton2: TToolButton
      Left = 110
      Top = 0
      Action = actAddItem
    end
    object ToolButton4: TToolButton
      Left = 144
      Top = 0
      Action = actDeleteItem
    end
  end
  object Details: TPanel [1]
    AlignWithMargins = True
    Left = 3
    Top = 248
    Width = 753
    Height = 172
    Align = alBottom
    TabOrder = 1
  end
  object Items: TListView [2]
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 753
    Height = 239
    Align = alClient
    Columns = <
      item
        Caption = 'Name'
        Width = 100
      end>
    HideSelection = False
    HotTrackStyles = [htHandPoint, htUnderlineHot]
    ReadOnly = True
    RowSelect = True
    TabOrder = 2
    ViewStyle = vsReport
    OnSelectItem = ItemsSelectItem
  end
  inherited Acts: TActionList
    Images = DM.Img16
    object actAddItem: TAction
      Caption = 'actAddItem'
      ImageIndex = 0
      OnExecute = actAddItemExecute
    end
    object actDeleteItem: TAction
      Caption = 'actDeleteItem'
      ImageIndex = 1
      OnExecute = actDeleteItemExecute
    end
  end
end
