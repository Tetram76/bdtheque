object FrmEditAuteur: TFrmEditAuteur
  Left = 537
  Top = 280
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'FrmEditAuteur'
  ClientHeight = 219
  ClientWidth = 717
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
  OldCreateOrder = True
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel2: TBevel
    Left = 0
    Top = 23
    Width = 717
    Height = 4
    Align = alTop
    Shape = bsBottomLine
  end
  object ScrollBox1: TScrollBox
    Left = 0
    Top = 27
    Width = 717
    Height = 192
    Align = alClient
    BorderStyle = bsNone
    TabOrder = 0
    DesignSize = (
      717
      192)
    object Label3: TLabel
      Left = 28
      Top = 8
      Width = 28
      Height = 13
      Alignment = taRightJustify
      Caption = 'Nom :'
      FocusControl = edNom
      Transparent = True
      Layout = tlCenter
    end
    object Label1: TLabel
      Left = 4
      Top = 55
      Width = 57
      Height = 13
      Alignment = taRightJustify
      Caption = 'Biographie :'
      FocusControl = edNom
      Transparent = True
      Layout = tlCenter
    end
    object Label2: TLabel
      Left = 11
      Top = 32
      Width = 45
      Height = 13
      Hint = 'R'#233'f'#233'rence du support'
      Alignment = taRightJustify
      Caption = 'Site web:'
      Layout = tlCenter
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
    object edBiographie: TMemoLabeled
      Left = 64
      Top = 54
      Width = 648
      Height = 133
      Anchors = [akLeft, akTop, akRight, akBottom]
      BevelKind = bkTile
      BorderStyle = bsNone
      ScrollBars = ssBoth
      TabOrder = 2
      LinkLabel.LinkLabel.Strings = (
        'Label1')
    end
    object edNom: TEditLabeled
      Left = 64
      Top = 4
      Width = 648
      Height = 20
      Anchors = [akLeft, akTop, akRight]
      BevelKind = bkTile
      BorderStyle = bsNone
      TabOrder = 0
      LinkLabel.LinkLabel.Strings = (
        'Label3')
      CurrencyChar = #0
    end
    object edSite: TEditLabeled
      Left = 64
      Top = 29
      Width = 622
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
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 717
    Height = 23
    Align = alTop
    BevelOuter = bvNone
    Caption = ' '
    TabOrder = 1
    DesignSize = (
      717
      23)
    object btnOK: TBitBtn
      Left = 557
      Top = 2
      Width = 73
      Height = 19
      Cursor = crHandPoint
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
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = 'Annuler'
      ModalResult = 2
      TabOrder = 1
      OnClick = btnAnnulerClick
    end
  end
end
