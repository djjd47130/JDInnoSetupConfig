object frmNewScriptWizard: TfrmNewScriptWizard
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'JD Inno Setup New Script Wiizard'
  ClientHeight = 474
  ClientWidth = 805
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 805
    Height = 69
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitWidth = 811
    object lblTitle: TLabel
      Left = 16
      Top = 8
      Width = 58
      Height = 19
      Caption = 'lblTitle'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblSubtitle: TLabel
      Left = 32
      Top = 33
      Width = 46
      Height = 13
      Caption = 'lblSubtitle'
    end
  end
  object Pages: TPageControl
    Left = 0
    Top = 69
    Width = 805
    Height = 270
    ActivePage = tabAppFolder
    Align = alTop
    TabOrder = 1
    OnChange = PagesChange
    OnChanging = PagesChanging
    ExplicitTop = 51
    ExplicitWidth = 717
    object tabWelcome: TTabSheet
      Caption = 'tabWelcome'
      ExplicitWidth = 658
      ExplicitHeight = 212
      DesignSize = (
        797
        242)
      object chkEmpty: TCheckBox
        Left = 12
        Top = 216
        Width = 237
        Height = 17
        Anchors = [akLeft, akBottom]
        Caption = 'Create a New Empty Script'
        TabOrder = 0
      end
    end
    object tabAppInfo: TTabSheet
      Caption = 'tabAppInfo'
      ImageIndex = 1
      ExplicitWidth = 709
    end
    object tabAppType: TTabSheet
      Caption = 'tabAppType'
      ImageIndex = 2
      ExplicitWidth = 709
    end
    object tabAppFolder: TTabSheet
      Caption = 'tabAppFolder'
      ImageIndex = 3
      ExplicitWidth = 709
    end
    object tabAppFiles: TTabSheet
      Caption = 'tabAppFiles'
      ImageIndex = 4
      ExplicitWidth = 709
    end
    object tabShortcuts: TTabSheet
      Caption = 'tabShortcuts'
      ImageIndex = 5
      ExplicitWidth = 709
    end
    object tabDocs: TTabSheet
      Caption = 'tabDocs'
      ImageIndex = 6
      ExplicitWidth = 709
    end
    object tabInstallMode: TTabSheet
      Caption = 'tabInstallMode'
      ImageIndex = 7
      ExplicitWidth = 709
    end
    object tabLanguages: TTabSheet
      Caption = 'tabLanguages'
      ImageIndex = 8
      ExplicitWidth = 709
    end
    object tabCompiler: TTabSheet
      Caption = 'tabCompiler'
      ImageIndex = 9
      ExplicitWidth = 709
    end
    object tabFinished: TTabSheet
      Caption = 'tabFinished'
      ImageIndex = 10
      ExplicitWidth = 709
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 436
    Width = 805
    Height = 38
    Align = alBottom
    TabOrder = 2
    ExplicitTop = 416
    ExplicitWidth = 811
    object btnCancel: TFontButton
      AlignWithMargins = True
      Left = 701
      Top = 4
      Width = 100
      Height = 30
      Cursor = crHandPoint
      Margins.Left = 8
      Align = alRight
      DrawStyle = fdTransparent
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Image.AutoSize = False
      Image.Text = #61453
      Image.Font.Charset = ANSI_CHARSET
      Image.Font.Color = clWindowText
      Image.Font.Height = -21
      Image.Font.Name = 'FontAwesome'
      Image.Font.Style = []
      Image.Font.Quality = fqAntialiased
      Image.StandardColor = fcRed
      TabOrder = 0
      Text = 'Cancel'
      OnClick = btnCancelClick
      ExplicitLeft = 584
      ExplicitTop = 16
    end
    object btnNext: TFontButton
      AlignWithMargins = True
      Left = 598
      Top = 4
      Width = 92
      Height = 30
      Cursor = crHandPoint
      Align = alRight
      DrawStyle = fdTransparent
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Image.AutoSize = False
      Image.Text = #61524
      Image.Font.Charset = DEFAULT_CHARSET
      Image.Font.Color = clWindowText
      Image.Font.Height = -21
      Image.Font.Name = 'FontAwesome'
      Image.Font.Style = []
      Image.Font.Quality = fqAntialiased
      Image.StandardColor = fcGreen
      ImagePosition = fpImgRight
      Margin = 10
      Spacing = 8
      TabOrder = 1
      Text = 'Next'
      OnClick = btnNextClick
      ExplicitLeft = 603
    end
    object btnBack: TFontButton
      AlignWithMargins = True
      Left = 500
      Top = 4
      Width = 92
      Height = 30
      Cursor = crHandPoint
      Align = alRight
      DrawStyle = fdTransparent
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Image.AutoSize = False
      Image.Text = #61523
      Image.Font.Charset = DEFAULT_CHARSET
      Image.Font.Color = clWindowText
      Image.Font.Height = -21
      Image.Font.Name = 'FontAwesome'
      Image.Font.Style = []
      Image.Font.Quality = fqAntialiased
      Image.StandardColor = fcGreen
      Margin = 10
      Spacing = 8
      TabOrder = 2
      Text = 'Back'
      OnClick = btnBackClick
      ExplicitLeft = 505
    end
  end
end
