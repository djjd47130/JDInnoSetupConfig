inherited frmCode: TfrmCode
  Caption = 'Code'
  PixelsPerInch = 96
  TextHeight = 13
  object Txt: TSynEdit [1]
    Left = 0
    Top = 0
    Width = 699
    Height = 265
    Align = alTop
    Color = clBlack
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    TabOrder = 1
    CodeFolding.GutterShapeSize = 11
    CodeFolding.CollapsedLineColor = clGrayText
    CodeFolding.FolderBarLinesColor = clGrayText
    CodeFolding.IndentGuidesColor = clGray
    CodeFolding.IndentGuides = True
    CodeFolding.ShowCollapsedLine = False
    CodeFolding.ShowHintMark = True
    UseCodeFolding = False
    Gutter.Color = clBlack
    Gutter.Font.Charset = DEFAULT_CHARSET
    Gutter.Font.Color = clWhite
    Gutter.Font.Height = -11
    Gutter.Font.Name = 'Courier New'
    Gutter.Font.Style = []
    Gutter.ShowLineNumbers = True
    Highlighter = SynPas
    RightEdge = 0
    WantTabs = True
    FontSmoothing = fsmNone
  end
  inherited Acts: TActionList
    Top = 139
  end
  object SynPas: TSynPasSyn
    Options.AutoDetectEnabled = False
    Options.AutoDetectLineLimit = 0
    Options.Visible = False
    DirectiveAttri.Foreground = clOlive
    KeyAttri.Foreground = clWhite
    NumberAttri.Foreground = clRed
    FloatAttri.Foreground = clRed
    StringAttri.Foreground = clMoneyGreen
    Left = 240
    Top = 136
  end
end
