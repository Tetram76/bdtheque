object FrmEditSerie: TFrmEditSerie
  Left = 432
  Top = 239
  Width = 725
  Height = 674
  Caption = 'Saisie de S'#233'rie'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Icon.Data = {
    0000010002002020100000000000E80200002600000010101000000000002801
    00000E0300002800000020000000400000000100040000000000800200000000
    0000000000000000000000000000000000000000800000800000008080008000
    0000800080008080000080808000C0C0C0000000FF0000FF000000FFFF00FF00
    0000FF00FF00FFFF0000FFFFFF00000000000000000000000000000000000000
    0959595959595959000000000000000095959595959595909500000000000000
    5959595959595950595000000000000595959595959595059595000000000000
    0000000000000009595950000000099999999999999990959595950000000000
    00000000000000595959595000000090FF7F7F7F7FFFFF059595959500000000
    FFFFFFFFFFFFFFF05959595950000000FF7F7F7F7F7FFFFF0595959595000000
    FFFFFFFFFFFFFFFF0059595959500000FF7F7F7FFFFFFFFF0805959595900000
    FFFFFFFFFFFFFFF08F00595959500000000000000009D90FFF08059595900000
    00FFFFFFFFFD9DFFF08F00595950000000000000000777000FFF080595900000
    0000FFFFFFFFF0FFFFF08F0059500000000FFF7FFFFFFF00000FFF0805900000
    00FFF7FFFFFFFFF0FFFFF08F005000000FFF7FFFFFFFFFFF0D900FFF08000000
    FFF7FFF7FFF7FFF0D9DFFFF08F00000FFF7FFF7FFF7FFF007770000FFF0000FF
    FFFFF7FFF7FFF0FFFFFFFFFFF000000FFFFF7FFF7FFF000000009D9000000000
    FFFFFFF7FFF000000000D9D0000000000FFFFF7FFF0000000000000000000000
    00FFFFFFF00000000000000000000000000FFFFF000000000000000000000000
    0000FFF000000000000000000000000000000F00000000000000000000000000
    0000000000000000000000000000F80007FFF00003FFE00001FFE00000FFC000
    007F0000003F0000001F0000000F80000007C0000003E0000001E0000000E000
    0000E0000000F0000000F8000000FC000000FE000000FC000000F8000000F000
    0000E0000001C000000180000003C0000007E000FF1FF001FFFFF803FFFFFC07
    FFFFFE0FFFFFFF1FFFFFFFBFFFFF280000001000000020000000010004000000
    0000C00000000000000000000000000000000000000000000000000080000080
    00000080800080000000800080008080000080808000C0C0C0000000FF0000FF
    000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0000000000000000000059
    59595050000000000000009500000999999909595000000000000095950000FF
    8888FF09595000F888FFFF0095900000009D900009500000FFD9D0FFF090000F
    F877700000F000FF8FF8FFFFFF000FF8FF8FF009D90F00FFF8FF0FFD9DF0000F
    FFF0000777000000FF00000000000000000000000000C01F0000800F00000007
    000000030000000100008000000080000000C0000000E0000000C00000008000
    00000000000080000000C0800000E1FF0000F3FF0000}
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 23
    Width = 717
    Height = 4
    Align = alTop
    Shape = bsBottomLine
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 717
    Height = 23
    Align = alTop
    BevelOuter = bvNone
    Caption = ' '
    TabOrder = 0
    DesignSize = (
      717
      23)
    object btnOK: TBitBtn
      Left = 557
      Top = 2
      Width = 73
      Height = 19
      Cursor = crHandPoint
      Hint = 'Valider les modifcations'
      Anchors = [akRight, akBottom]
      Caption = 'Enregistrer'
      Default = True
      ModalResult = 1
      TabOrder = 0
      OnClick = Frame11btnOKClick
    end
    object btnAnnuler: TBitBtn
      Left = 639
      Top = 2
      Width = 71
      Height = 19
      Cursor = crHandPoint
      Hint = 'Annuler les modifications'
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = 'Annuler'
      ModalResult = 2
      TabOrder = 1
      OnClick = btnAnnulerClick
    end
  end
  object ScrollBox2: TScrollBox
    Left = 0
    Top = 27
    Width = 717
    Height = 620
    Align = alClient
    BorderStyle = bsNone
    Constraints.MinWidth = 650
    TabOrder = 1
    DesignSize = (
      717
      620)
    object Label5: TLabel
      Left = 7
      Top = 301
      Width = 38
      Height = 13
      Alignment = taRightJustify
      Caption = 'Editeur:'
    end
    object VDTButton1: TVDTButton
      Left = 304
      Top = 297
      Width = 20
      Height = 21
      Cursor = crHandPoint
      Caption = '...'
      Flat = True
      OnClick = EditLabeled1Click
    end
    object Label8: TLabel
      Left = 354
      Top = 301
      Width = 50
      Height = 13
      Alignment = taRightJustify
      Caption = 'Collection:'
    end
    object VDTButton2: TVDTButton
      Left = 668
      Top = 297
      Width = 20
      Height = 21
      Cursor = crHandPoint
      Anchors = [akTop, akRight]
      Caption = '...'
      Flat = True
      OnClick = EditLabeled2Click
    end
    object VDTButton9: TVDTButton
      Left = 324
      Top = 297
      Width = 21
      Height = 21
      Cursor = crHandPoint
      Caption = 'N'
      Flat = True
      OnClick = VDTButton9Click
    end
    object VDTButton10: TVDTButton
      Left = 688
      Top = 297
      Width = 21
      Height = 21
      Cursor = crHandPoint
      Anchors = [akTop, akRight]
      Caption = 'N'
      Enabled = False
      Flat = True
      OnClick = VDTButton10Click
    end
    object Label2: TLabel
      Left = 17
      Top = 7
      Width = 29
      Height = 13
      Alignment = taRightJustify
      Caption = ' Titre:'
      FocusControl = edTitre
      Layout = tlCenter
    end
    object Label17: TLabel
      Left = 513
      Top = 147
      Width = 33
      Height = 13
      Caption = 'Genre:'
    end
    object VDTButton3: TVDTButton
      Left = 668
      Top = 143
      Width = 20
      Height = 20
      Cursor = crHandPoint
      Anchors = [akTop, akRight]
      Caption = '...'
      Flat = True
      OnClick = ScanEditClick
    end
    object VDTButton4: TVDTButton
      Left = 688
      Top = 143
      Width = 21
      Height = 20
      Cursor = crHandPoint
      Anchors = [akTop, akRight]
      Caption = 'N'
      Flat = True
      OnClick = VDTButton4Click
    end
    object Label15: TLabel
      Left = 512
      Top = 261
      Width = 197
      Height = 13
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      Caption = ' '
    end
    object Bevel3: TBevel
      Left = 165
      Top = 285
      Width = 386
      Height = 6
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object Bevel2: TBevel
      Left = 165
      Top = 404
      Width = 386
      Height = 7
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object Label6: TLabel
      Left = 6
      Top = 54
      Width = 40
      Height = 13
      Alignment = taRightJustify
      Caption = 'Histoire:'
      FocusControl = histoire
    end
    object Label7: TLabel
      Left = 335
      Top = 54
      Width = 32
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = 'Notes:'
      FocusControl = remarques
    end
    object VDTButton13: TVDTButton
      Left = 687
      Top = 30
      Width = 23
      Height = 18
      Cursor = crHandPoint
      Anchors = [akTop, akRight]
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        5555555555FFFFF555555555544C4C5555555555F777775FF5555554C444C444
        5555555775FF55775F55554C4334444445555575577F55557FF554C4C334C4C4
        335557F5577FF55577F554CCC3334444335557555777F555775FCCCCC333CCC4
        C4457F55F777F555557F4CC33333CCC444C57F577777F5F5557FC4333333C3C4
        CCC57F777777F7FF557F4CC33333333C4C457F577777777F557FCCC33CC4333C
        C4C575F7755F777FF5755CCCCC3333334C5557F5FF777777F7F554C333333333
        CC55575777777777F755553333CC3C33C555557777557577755555533CC4C4CC
        5555555775FFFF77555555555C4CCC5555555555577777555555}
      NumGlyphs = 2
      OnClick = VDTButton13Click
    end
    object Label1: TLabel
      Left = 3
      Top = 32
      Width = 45
      Height = 13
      Hint = 'R'#233'f'#233'rence du support'
      Alignment = taRightJustify
      Caption = 'Site web:'
      Layout = tlCenter
    end
    object btScenariste: TVDTButton
      Tag = 1
      Left = 231
      Top = 146
      Width = 69
      Height = 41
      Cursor = crHandPoint
      Caption = 'Sc'#233'nariste'
      Enabled = False
      Flat = True
      Glyph.Data = {
        B2000000424DB20000000000000052000000280000000C0000000C0000000100
        04000000000060000000120B0000120B00000700000007000000CE636300FF9C
        9C00FFCECE0000FF0000BDBDBD008C8C8C000000000033334333333360603336
        5433333333333336654333333336333616543333333633362065433333363336
        2106543333363336211063333336333621163333333633362163333333363336
        26333333333633366333333333363336333333333336}
      Layout = blGlyphBottom
      OnClick = btColoristeClick
    end
    object btDessinateur: TVDTButton
      Tag = 2
      Left = 231
      Top = 190
      Width = 69
      Height = 41
      Cursor = crHandPoint
      Caption = 'Dessinateur'
      Enabled = False
      Flat = True
      Glyph.Data = {
        B2000000424DB20000000000000052000000280000000C0000000C0000000100
        04000000000060000000120B0000120B00000700000007000000CE636300FF9C
        9C00FFCECE0000FF0000BDBDBD008C8C8C000000000033334333333360603336
        5433333333333336654333333336333616543333333633362065433333363336
        2106543333363336211063333336333621163333333633362163333333363336
        26333333333633366333333333363336333333333336}
      Layout = blGlyphBottom
      OnClick = btColoristeClick
    end
    object VDTButton7: TVDTButton
      Left = 186
      Top = 146
      Width = 21
      Height = 20
      Cursor = crHandPoint
      Caption = '...'
      Flat = True
      OnClick = Edit2Change
    end
    object VDTButton8: TVDTButton
      Left = 207
      Top = 146
      Width = 20
      Height = 20
      Cursor = crHandPoint
      Caption = 'N'
      Flat = True
      OnClick = VDTButton8Click
    end
    object Label19: TLabel
      Left = 7
      Top = 150
      Width = 42
      Height = 13
      Alignment = taRightJustify
      Caption = 'Auteurs:'
      FocusControl = remarques
    end
    object btColoriste: TVDTButton
      Tag = 3
      Left = 231
      Top = 234
      Width = 69
      Height = 41
      Cursor = crHandPoint
      Caption = 'Coloriste'
      Enabled = False
      Flat = True
      Glyph.Data = {
        B2000000424DB20000000000000052000000280000000C0000000C0000000100
        04000000000060000000120B0000120B00000700000007000000CE636300FF9C
        9C00FFCECE0000FF0000BDBDBD008C8C8C000000000033334333333360603336
        5433333333333336654333333336333616543333333633362065433333363336
        2106543333363336211063333336333621163333333633362163333333363336
        26333333333633366333333333363336333333333336}
      Layout = blGlyphBottom
      OnClick = btColoristeClick
    end
    object EditLabeled1: TEditLabeled
      Left = 51
      Top = 297
      Width = 254
      Height = 21
      BevelKind = bkTile
      BorderStyle = bsNone
      TabOrder = 7
      OnChange = EditLabeled1Click
      LinkLabel.LinkLabel.Strings = (
        'Label5'
        'VDTButton1')
      CurrencyChar = #0
    end
    object vtEditeurs: TVirtualStringTree
      Left = 51
      Top = 320
      Width = 294
      Height = 74
      AnimationDuration = 0
      BevelKind = bkTile
      BorderStyle = bsNone
      ButtonFillMode = fmShaded
      Header.AutoSizeIndex = -1
      Header.Font.Charset = DEFAULT_CHARSET
      Header.Font.Color = clWindowText
      Header.Font.Height = -11
      Header.Font.Name = 'Tahoma'
      Header.Font.Style = []
      Header.MainColumn = -1
      Header.Options = [hoAutoResize, hoColumnResize, hoDrag]
      HintAnimation = hatNone
      HintMode = hmTooltip
      HotCursor = crHandPoint
      Indent = 8
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
      OnChange = vtEditeursChange
      OnDblClick = vtEditeursDblClick
      Columns = <>
    end
    object EditLabeled2: TEditLabeled
      Left = 408
      Top = 297
      Width = 261
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      BevelKind = bkTile
      BorderStyle = bsNone
      TabOrder = 9
      OnChange = EditLabeled2Click
      LinkLabel.LinkLabel.Strings = (
        'Label8'
        'VDTButton2')
      CurrencyChar = #0
    end
    object vtCollections: TVirtualStringTree
      Left = 408
      Top = 320
      Width = 301
      Height = 74
      Anchors = [akLeft, akTop, akRight]
      AnimationDuration = 0
      BevelKind = bkTile
      BorderStyle = bsNone
      ButtonFillMode = fmShaded
      Header.AutoSizeIndex = -1
      Header.Font.Charset = DEFAULT_CHARSET
      Header.Font.Color = clWindowText
      Header.Font.Height = -11
      Header.Font.Name = 'Tahoma'
      Header.Font.Style = []
      Header.MainColumn = -1
      Header.Options = [hoAutoResize, hoColumnResize, hoDrag]
      HintAnimation = hatNone
      HintMode = hmTooltip
      HotCursor = crHandPoint
      Indent = 8
      ParentShowHint = False
      ShowHint = True
      TabOrder = 10
      OnDblClick = vtCollectionsDblClick
      Columns = <>
    end
    object edTitre: TEditLabeled
      Left = 51
      Top = 4
      Width = 659
      Height = 20
      Anchors = [akLeft, akTop, akRight]
      BevelKind = bkTile
      BorderStyle = bsNone
      TabOrder = 0
      OnChange = edTitreChange
      LinkLabel.LinkLabel.Strings = (
        'Label2')
      CurrencyChar = #0
    end
    object ScanEdit: TEditLabeled
      Left = 552
      Top = 143
      Width = 117
      Height = 20
      Anchors = [akLeft, akTop, akRight]
      BevelKind = bkTile
      BorderStyle = bsNone
      TabOrder = 4
      OnChange = ScanEditClick
      OnKeyPress = ScanEditKeyPress
      LinkLabel.LinkLabel.Strings = (
        'Label17'
        'VDTButton3'
        'VDTButton4')
      CurrencyChar = #0
    end
    object vtGenres: TVirtualStringTree
      Left = 512
      Top = 167
      Width = 197
      Height = 90
      Anchors = [akLeft, akTop, akRight]
      AnimationDuration = 0
      BevelKind = bkTile
      BorderStyle = bsNone
      Header.AutoSizeIndex = -1
      Header.Font.Charset = DEFAULT_CHARSET
      Header.Font.Color = clWindowText
      Header.Font.Height = -11
      Header.Font.Name = 'Tahoma'
      Header.Font.Style = []
      Header.MainColumn = -1
      Header.Options = [hoAutoResize, hoColumnResize, hoDrag]
      HintAnimation = hatNone
      HintMode = hmTooltip
      HotCursor = crHandPoint
      Indent = 8
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnChecked = vtGenresChecked
      OnDblClick = vtGenresDblClick
      OnInitNode = vtGenresInitNode
      Columns = <>
    end
    object histoire: TMemoLabeled
      Left = 51
      Top = 54
      Width = 275
      Height = 81
      Anchors = [akLeft, akTop, akRight]
      BevelKind = bkTile
      BorderStyle = bsNone
      ScrollBars = ssVertical
      TabOrder = 2
      LinkLabel.LinkLabel.Strings = (
        'Label6')
    end
    object remarques: TMemoLabeled
      Left = 373
      Top = 54
      Width = 337
      Height = 81
      Anchors = [akTop, akRight]
      BevelKind = bkTile
      BorderStyle = bsNone
      ScrollBars = ssVertical
      TabOrder = 3
      LinkLabel.LinkLabel.Strings = (
        'Label7')
    end
    object cbTerminee: TCheckBoxLabeled
      Left = 165
      Top = 417
      Width = 90
      Height = 16
      AllowGrayed = True
      Caption = 'S'#233'rie termin'#233'e'
      State = cbGrayed
      TabOrder = 6
      LinkLabel.LinkLabel.Strings = (
        'cbTerminee')
    end
    object cbComplete: TCheckBoxLabeled
      Left = 51
      Top = 417
      Width = 90
      Height = 16
      Caption = 'S'#233'rie compl'#232'te'
      TabOrder = 11
      LinkLabel.LinkLabel.Strings = (
        'cbComplete')
    end
    object vtAlbums: TVirtualStringTree
      Left = 48
      Top = 442
      Width = 660
      Height = 129
      Anchors = [akLeft, akTop, akRight]
      AnimationDuration = 0
      BevelKind = bkTile
      BorderStyle = bsNone
      ButtonFillMode = fmShaded
      Header.AutoSizeIndex = -1
      Header.Font.Charset = DEFAULT_CHARSET
      Header.Font.Color = clWindowText
      Header.Font.Height = -11
      Header.Font.Name = 'Tahoma'
      Header.Font.Style = []
      Header.MainColumn = -1
      Header.Options = [hoAutoResize, hoColumnResize, hoDrag]
      HintAnimation = hatNone
      HintMode = hmTooltip
      HotCursor = crHandPoint
      Indent = 8
      ParentShowHint = False
      ShowHint = True
      TabOrder = 12
      OnDblClick = vtAlbumsDblClick
      Columns = <>
    end
    object edSite: TEditLabeled
      Left = 51
      Top = 29
      Width = 635
      Height = 20
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      BevelKind = bkTile
      BorderStyle = bsNone
      Ctl3D = True
      ParentCtl3D = False
      TabOrder = 1
      OnChange = edSiteChange
      LinkLabel.LinkLabel.Strings = (
        'Label1')
      CurrencyChar = #0
    end
    object lvScenaristes: TVDTListViewLabeled
      Left = 300
      Top = 146
      Width = 198
      Height = 41
      BevelKind = bkTile
      BorderStyle = bsNone
      Columns = <
        item
        end>
      ColumnClick = False
      HideSelection = False
      ReadOnly = True
      ShowColumnHeaders = False
      SortType = stNone
      TabOrder = 13
      ViewStyle = vsReport
      OnKeyDown = lvColoristesKeyDown
      LinkLabel.LinkLabel.Strings = (
        'btScenariste')
    end
    object lvDessinateurs: TVDTListViewLabeled
      Left = 300
      Top = 190
      Width = 198
      Height = 41
      BevelKind = bkTile
      BorderStyle = bsNone
      Columns = <
        item
        end>
      ColumnClick = False
      HideSelection = False
      ReadOnly = True
      ShowColumnHeaders = False
      SortType = stBoth
      TabOrder = 14
      ViewStyle = vsReport
      OnKeyDown = lvColoristesKeyDown
      LinkLabel.LinkLabel.Strings = (
        'btDessinateur')
    end
    object vtPersonnes: TVirtualStringTree
      Left = 51
      Top = 169
      Width = 177
      Height = 105
      AnimationDuration = 0
      BevelKind = bkTile
      BorderStyle = bsNone
      ButtonFillMode = fmShaded
      Header.AutoSizeIndex = -1
      Header.Font.Charset = DEFAULT_CHARSET
      Header.Font.Color = clWindowText
      Header.Font.Height = -11
      Header.Font.Name = 'Tahoma'
      Header.Font.Style = []
      Header.MainColumn = -1
      Header.Options = [hoAutoResize, hoColumnResize, hoDrag]
      HintAnimation = hatNone
      HintMode = hmTooltip
      HotCursor = crHandPoint
      Indent = 8
      ParentShowHint = False
      ShowHint = True
      TabOrder = 15
      OnChange = vtPersonnesChange
      OnDblClick = vtPersonnesDblClick
      Columns = <>
    end
    object Edit2: TEditLabeled
      Left = 51
      Top = 146
      Width = 135
      Height = 20
      BevelKind = bkTile
      BorderStyle = bsNone
      TabOrder = 16
      OnChange = Edit2Change
      LinkLabel.LinkLabel.Strings = (
        'Label19'
        'VDTButton7'
        'VDTButton8')
      CurrencyChar = #0
    end
    object lvColoristes: TVDTListViewLabeled
      Left = 300
      Top = 234
      Width = 198
      Height = 41
      BevelKind = bkTile
      BorderStyle = bsNone
      Columns = <
        item
        end>
      ColumnClick = False
      HideSelection = False
      ReadOnly = True
      ShowColumnHeaders = False
      SortType = stBoth
      TabOrder = 17
      ViewStyle = vsReport
      OnKeyDown = lvColoristesKeyDown
      LinkLabel.LinkLabel.Strings = (
        'btColoriste')
    end
  end
end
