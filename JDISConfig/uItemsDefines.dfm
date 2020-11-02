inherited frmDefines: TfrmDefines
  Caption = 'Defines'
  ClientHeight = 361
  ClientWidth = 491
  ExplicitWidth = 507
  ExplicitHeight = 400
  PixelsPerInch = 96
  TextHeight = 13
  inherited ToolBar1: TToolBar
    Top = 327
    Width = 491
    ExplicitTop = 327
    ExplicitWidth = 491
  end
  inherited Details: TPanel
    Top = 202
    Width = 485
    Height = 122
    ExplicitTop = 202
    ExplicitWidth = 485
    ExplicitHeight = 122
    object Label9: TLabel
      Left = 16
      Top = 13
      Width = 27
      Height = 13
      Caption = 'Name'
    end
    object Label10: TLabel
      Left = 16
      Top = 61
      Width = 26
      Height = 13
      Caption = 'Value'
    end
    object txtName: TEdit
      Left = 16
      Top = 32
      Width = 209
      Height = 21
      TabOrder = 0
    end
    object txtValue: TEdit
      Left = 16
      Top = 80
      Width = 209
      Height = 21
      TabOrder = 1
    end
  end
  inherited Items: TListView
    Width = 485
    Height = 193
    ExplicitWidth = 485
    ExplicitHeight = 193
  end
end
