object FrmEditEmprunteur: TFrmEditEmprunteur
  Left = 550
  Top = 342
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'FrmEditEmprunteur'
  ClientHeight = 144
  ClientWidth = 215
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
    Width = 215
    Height = 4
    Align = alTop
    Shape = bsBottomLine
  end
  object ScrollBox1: TScrollBox
    Left = 0
    Top = 27
    Width = 215
    Height = 117
    Align = alClient
    BorderStyle = bsNone
    TabOrder = 0
    DesignSize = (
      215
      117)
    object emprunts: TLabel
      Left = 60
      Top = 100
      Width = 3
      Height = 13
      Alignment = taCenter
      Anchors = [akLeft, akBottom]
      Transparent = True
    end
    object Label2: TLabel
      Left = 6
      Top = 100
      Width = 49
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = 'Emprunts:'
      Transparent = True
    end
    object Label3: TLabel
      Left = 4
      Top = 9
      Width = 28
      Height = 13
      Caption = 'Nom :'
      FocusControl = edNom
      Transparent = True
      Layout = tlCenter
    end
    object coord: TMemo
      Left = 4
      Top = 30
      Width = 206
      Height = 68
      Anchors = [akLeft, akTop, akRight, akBottom]
      BevelKind = bkTile
      BorderStyle = bsNone
      ScrollBars = ssBoth
      TabOrder = 0
    end
    object edNom: TEditLabeled
      Left = 37
      Top = 6
      Width = 173
      Height = 20
      Anchors = [akLeft, akTop, akRight]
      BevelKind = bkTile
      BorderStyle = bsNone
      TabOrder = 1
      LinkLabel.LinkLabel.Strings = (
        'Label3')
      CurrencyChar = #0
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 215
    Height = 23
    Align = alTop
    BevelOuter = bvNone
    Caption = ' '
    TabOrder = 1
    DesignSize = (
      215
      23)
    object btnOK: TBitBtn
      Left = 55
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
      Left = 137
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
