object frmControlImport: TfrmControlImport
  Left = 0
  Top = 0
  Caption = 'frmControlImport'
  ClientHeight = 348
  ClientWidth = 643
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
  inline framVTEdit1: TframVTEdit
    Left = 72
    Top = 96
    Width = 320
    Height = 21
    TabOrder = 0
    ExplicitLeft = 72
    ExplicitTop = 96
  end
  inline framVTEdit2: TframVTEdit
    Left = 72
    Top = 123
    Width = 320
    Height = 21
    TabOrder = 1
    ExplicitLeft = 72
    ExplicitTop = 123
  end
  inline framVTEdit3: TframVTEdit
    Left = 72
    Top = 150
    Width = 320
    Height = 21
    TabOrder = 2
    ExplicitLeft = 72
    ExplicitTop = 150
  end
  inline framVTEdit4: TframVTEdit
    Left = 72
    Top = 177
    Width = 320
    Height = 21
    TabOrder = 3
    ExplicitLeft = 72
    ExplicitTop = 177
  end
  inline Frame11: TFrame1
    Left = 0
    Top = 0
    Width = 643
    Height = 25
    Align = alTop
    TabOrder = 4
    ExplicitWidth = 643
    inherited btnOK: TButton
      Left = 480
      Images = nil
      OnClick = Frame11btnOKClick
      ExplicitLeft = 480
    end
    inherited btnAnnuler: TButton
      Left = 560
      Images = nil
      OnClick = Frame11btnAnnulerClick
      ExplicitLeft = 560
    end
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 25
    Width = 643
    Height = 40
    ButtonHeight = 33
    ButtonWidth = 65
    Caption = 'ToolBar1'
    Color = clGradientActiveCaption
    Images = ImageList1
    ParentColor = False
    TabOrder = 5
    object ToolButton1: TToolButton
      Left = 0
      Top = 0
      Caption = 'ToolButton1'
      ImageIndex = 0
    end
    object ToolButton2: TToolButton
      Left = 65
      Top = 0
      Caption = 'ToolButton2'
      ImageIndex = 1
    end
    object ToolButton3: TToolButton
      Left = 130
      Top = 0
      Caption = 'ToolButton3'
      ImageIndex = 2
    end
    object ToolButton4: TToolButton
      Left = 195
      Top = 0
      Caption = 'ToolButton4'
      ImageIndex = 3
    end
    object ToolButton5: TToolButton
      Left = 260
      Top = 0
      Caption = 'ToolButton5'
      ImageIndex = 4
    end
  end
  object Button1: TButton
    Left = 223
    Top = 210
    Width = 75
    Height = 25
    Caption = 'Button1'
    ImageIndex = 0
    Images = ImageList1
    TabOrder = 6
  end
  object Button2: TButton
    Left = 304
    Top = 210
    Width = 75
    Height = 25
    Caption = 'Button1'
    ImageIndex = 1
    Images = ImageList1
    TabOrder = 7
  end
  object Button3: TButton
    Left = 304
    Top = 241
    Width = 129
    Height = 25
    Caption = 'Button1'
    ElevationRequired = True
    ImageIndex = 2
    Images = ImageList1
    TabOrder = 8
  end
  object FlowPanel1: TFlowPanel
    Left = 398
    Top = 177
    Width = 185
    Height = 32
    BevelOuter = bvNone
    Caption = 'FlowPanel1'
    TabOrder = 9
    object CRFurtifLight1: TCRFurtifLight
      Left = 0
      Top = 0
      Width = 23
      Height = 22
      Cursor = crHandPoint
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFD5D6D8CBCECECCCFD0FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFBEC4C1D1D3D4FF00FFFF00FFFF00FFFF00
        FF195220328F3D215A29FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB6BEB90A
        3E10325C38BFC5C2FF00FFFF00FFFF00FF1E5E2681D08B22632AFF00FFB3BCB7
        7F95837B927F778F7B748D7925522B0B5A140B5E1617481D9FADA3FF00FFFF00
        FF1F5F2778CC8325652DC7CBCA1B4B20094E11094D1108430F073F0D07420E12
        892065C971258430083E0E91A395FF00FF215F296DC8782966308EA192063C0C
        2FAD3E79D0847AD18575CF8047BF5518AF2A39BA4895DA9E258D31093E0F98A8
        9C25622D61C36D2B6732718B7608470F18AF2A24B33535B9452AB53A18AF2A18
        AF2A18AF2A18AF2A30B7400D691724522A28632F54BD602D6835899D8D08440F
        12912111902011902012922212952215A62718AF2A18AF2A17AE290E771B1B4B
        212B653225AB35316938A4B1A7053C0B10831E118D21118E20118C1F118C2011
        902018AD2916AA2911912108450F9FADA331683816A527356B3CC2C7C514461A
        073C0D073C0D073C0D073C0D07440E119020129121118E200B6316648169FF00
        FF356B3C16A527386C3FFF00FFD0D2D4C0C6C3BEC4C1BDC4C09FADA3073C0D0F
        801C118E200C68172F5A34D2D3D5FF00FF396D4015A4273B6E42FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF335D3807420E0950112F5A34C6CAC9FF00FFFF00
        FF3E6F4415A2263E6F45FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA5B2A91A
        4A1F507255CCCECFFF00FFFF00FFFF00FF5F82641687235E8163FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
    object CRFurtifLight2: TCRFurtifLight
      Left = 23
      Top = 0
      Width = 23
      Height = 22
      Cursor = crHandPoint
    end
    object CRFurtifLight3: TCRFurtifLight
      Left = 46
      Top = 0
      Width = 23
      Height = 22
      Cursor = crHandPoint
    end
    object CRFurtifLight4: TCRFurtifLight
      Left = 69
      Top = 0
      Width = 23
      Height = 22
      Cursor = crHandPoint
    end
    object CRFurtifLight5: TCRFurtifLight
      Left = 92
      Top = 0
      Width = 23
      Height = 22
      Cursor = crHandPoint
    end
  end
  object ImageList1: TImageList
    ColorDepth = cd32Bit
    Left = 48
    Top = 240
    Bitmap = {
      494C010104000600040010001000FFFFFFFF2100FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000001050246041806A0052308C20317059C020D037301050241000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000102011E0317059B0315059501010105000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000208
      0255073B0DFC083F0EFF094410FF063F0DFF083D0EFF073A0DFA010101140000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000102011B06300BE2083D0EFF063E0CFF052208BF010101130000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000001010102010502420104013A0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000010201260103012D000000000000
      0000000000000000000000000000000000000000000000000000000000000419
      06A30C5D16FF29B33AFF19AF2BFF139122FF10801EFF083D0EFF010301330000
      0000000000000000000000000000000000000000000000000000000000000000
      00000101010F052909D20A4C12FF159825FF149223FF0B5613FF062E0ADD0102
      012A000000000000000000000000000000000000000000000000000000000000
      000001020121052809D0083D0EFF073C0DFE0209036000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000206024B07390DF9083D0EFF052308C20101
      011700000000000000000000000000000000000000000000000000000000041A
      06A70D6317FF81D38AFF19AF2BFF128E21FF128D21FF083D0EFF010401360000
      0000000000000000000000000000000000000000000000000000000000000000
      0000041806A1094510FF43B04FFF25B336FF19AF2BFF129322FF0E6D19FF0736
      0CF10103012D0000000000000000000000000000000000000000000000000105
      024307340CEC0B5714FF107B1CFF073E0DFF06300BE301010105000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000001010101052B09D7083D0EFF0E761BFF0A5213FF0630
      0BE301030133000000000000000000000000000000000000000000000000041C
      06AC0C5B15FFB1E4B7FF1AAF2CFF128D20FF128D21FF083D0EFF010301350000
      0000000000000000000000000000000000000000000000000000000000000105
      0247083D0EFF31993DFF87D590FF19AF2BFF19AF2BFF17A828FF118D21FF0D65
      17FF062D0ADC0101011000000000000000000000000000000000010301350739
      0DF70E711AFF128D21FF128C21FF0E6E19FF083D0EFF0313058F020A0362020A
      0365020B0367020A03630105024401010102000000000103012F020702530208
      02560208025502070252020E047B083D0EFF0D6918FF128C21FF128E21FF0E6B
      1AFF07360CF0010201280000000000000000000000000000000000000000041D
      06AF0B5414FFB3E4B9FF1DB02FFF128D21FF128D20FF083D0EFF010301320000
      00000000000000000000000000000000000000000000000000000101010B062E
      0BDF0D6117FFB8E6BDFF32B742FF19AF2BFF19AF2BFF19AF2BFF139123FF128F
      21FF0A4B11FF041C06AA0000000000000000000000000102011A06300BE50F72
      1AFF128D21FF149824FF139022FF128F21FF0C6216FF0C5814FF094D11FF0743
      0EFF073D0DFF083D0EFF083D0EFF020A03620206024D083D0EFF083D0EFF083D
      0EFF073D0DFF08450FFF095012FF0C5C15FF128E22FF128F22FF149623FF128D
      20FF0E6D19FF062D0ADB0101011200000000000000000000000000000000041D
      07B10B5213FF96DA9EFF19AF2BFF139122FF128C21FF073E0EFF0209025E0000
      0000000000000000000000000000000000000000000000000000020F047C083D
      0EFF169B26FF19AF2BFF19AF2BFF19AF2BFF18AE2AFF169F26FF118D21FF128C
      21FF0D6317FF073B0DFC010101160000000001010109052609CB0B5B15FF1495
      23FF18AB29FF19AF2BFF17A628FF128C21FF128C21FF128C21FF128C21FF128C
      21FF128B21FF128A21FF063E0CFF0312058A020E0478083D0EFF118720FF128D
      21FF128C21FF128C21FF128C21FF128C21FF128B21FF17A528FF19AF2BFF17AB
      29FF139423FF0B5613FF052208BE0101010500000000000000000103012C0737
      0CF30B5313FF56C463FF19AF2BFF139322FF128C21FF08440EFF083D0EFF0527
      09CC0104013A0000000000000000000000000000000000000000010502420738
      0CF508400EFF10751CFF22B234FF19AF2BFF149A24FF128C21FF12871FFF0B53
      13FF083D0EFF06300BE40101010D0000000003160597083D0EFF149524FF19AF
      2BFF19AF2BFF19AF2BFF19AF2BFF16A327FF149A24FF149624FF139423FF1393
      23FF139422FF139523FF08450FFF041E07B2041806A1073E0EFF139523FF1392
      22FF139222FF139223FF139523FF149824FF16A126FF19AF2BFF19AF2BFF19AF
      2BFF19AF2BFF149123FF083D0EFF0313058C000000000105024007390DF90A49
      11FF117C1DFF1EB030FF19AF2BFF159D25FF128C21FF138C21FF0C6017FF083D
      0EFF07340CEC0101011200000000000000000000000000000000000000000102
      012507360CF20B5614FF60C76CFF19AF2BFF139323FF128C21FF07410EFF073C
      0DFE041D07B1010201290000000000000000020C036C083D0EFF11811FFF38B9
      48FF19AF2BFF19AF2BFF19AF2BFF19AF2BFF19AF2BFF2FB63FFF48BF56FF40BC
      4FFF23B235FF19AF2BFF0A4C12FF052909D3052308C3094410FF19AF2BFF1EB0
      30FF39BA49FF3FBC4EFF2BB53BFF19AF2BFF19AF2BFF19AF2BFF19AF2BFF19AF
      2BFF35B844FF11811FFF083D0EFF020C036C00000000020A0365083D0EFF1597
      24FF1CB02EFF19AF2BFF19AF2BFF19AF2BFF16A227FF128D21FF128C21FF0D64
      17FF07390DF80101011000000000000000000000000000000000000000000000
      0000052008BA0B5514FFA1DEA8FF19AF2BFF128F21FF128B21FF073D0DFF0206
      024B0000000000000000000000000000000001010107041F07B4073E0EFF218E
      2EFF97DB9FFF62C86EFF19AF2BFF1FB130FF58C465FF84D48EFF8FD898FF8CD7
      95FF7BD185FF2CB33CFF08430FFF041A06A603150594073F0EFF28B039FF7BD1
      85FF94D99CFF96DA9EFF89D692FF5AC567FF20B131FF19AF2BFF5BC567FF95DA
      9EFF269133FF08400EFF052008B9010101090000000001010102052609CA0B55
      14FFB6E5BCFF43BD52FF19AF2BFF19AF2BFF19AF2BFF139123FF128E22FF0845
      0FFF031605960000000000000000000000000000000000000000000000000000
      0000052208BE0C5914FFBBE7C1FF1BAF2DFF118D21FF128D21FF083D0EFF0103
      01330000000000000000000000000000000000000000010101030317059C073D
      0DFF12701EFF95D79DFF1BAF2DFF0F701BFF08420FFF08400EFF08420FFF0A49
      11FF0A5112FF0A5012FF07390DF9010502420103013107370CF40A5213FF0B55
      14FF094D12FF09460FFF094410FF094410FF0E6E1AFF1BAF2DFF9CDBA4FF1574
      21FF073D0DFF0318069F010101040000000000000000000000000103012E073A
      0DFA20852CFF8BD794FF19AF2BFF19AF2BFF17A629FF128D21FF0B5B15FF0526
      09CB010101080000000000000000000000000000000000000000000000000000
      0000052008B90C6017FFB3E4B9FF19AF2BFF128C20FF128D21FF083D0EFF0103
      013500000000000000000000000000000000000000000000000000000000020A
      036207350CEE0A4B11FF138921FF09460FFF06300BE30313058C0313058E0312
      058A03100483020F047D0104023E00000000000000000104023B031004830311
      04870313058C0313058F0314059106300BE5094510FF138921FF0A4D12FF0735
      0CEF020A03640000000000000000000000000000000000000000000000000311
      048408400EFF309F3DFF29B43AFF18AE2AFF139022FF0C6117FF06300BE30102
      011E000000000000000000000000000000000000000000000000000000000000
      0000041E07B30E6719FF7AD084FF19AF2BFF128D21FF118C20FF083D0EFF0104
      0136000000000000000000000000000000000000000000000000000000000000
      000001010118041C06AC083D0EFF07370CF30102012000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000102012007370CF4083D0EFF041C06AD0101
      0119000000000000000000000000000000000000000000000000000000000101
      0105052008B908430FFF128420FF128720FF094D11FF052609C8010101180000
      0000000000000000000000000000000000000000000000000000000000000000
      0000041C06AC0C5D16FF24AD34FF19AF2BFF139122FF107A1CFF083D0EFF0103
      0132000000000000000000000000000000000000000000000000000000000000
      0000000000000000000001050245010201280000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000103012C01050245000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000101010C052709CC083D0EFF083D0EFF041906A301010107000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000002070251073B0DFB083D0EFF073D0DFF083D0EFF083D0EFF07390DF80101
      0111000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000101010C020D0373020D03730000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000104023C03140591041E07B20313058C020A0363010301330000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000}
  end
end