object FrmGestions: TFrmGestions
  Left = 414
  Top = 314
  BorderIcons = [biMinimize]
  BorderStyle = bsSingle
  Caption = 'FrmGestions'
  ClientHeight = 345
  ClientWidth = 644
  Color = clBtnFace
  Constraints.MinHeight = 230
  Constraints.MinWidth = 485
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
    0000000000000000000000000000000000000000000000000000000000000000
    00000FFF00FFFFFFFF00FFF00000000000000FFFFFFFFFFFFFFFFFF000000000
    00000FFFFFFFFFFFFFFFFFF00000000000000FF77777777777777FF000000000
    08880FFFFFFFFFFFFFFFFFF00000000088880FF77777777777777FF000000000
    77770FFFFFFFFFFFFFFFFFF00000000000000FFFFFFFFFFFFFFFFFF000000088
    88880FF77777777777FFFFF00000008888880FFFFFFFFFFFFFFFFFF000000000
    00000FF77777777777FFFFF00000000708F80FFFFFFFFFFFFFFFFFF070000000
    0F870FFFFFFFFFFFFFFFFFF07700000008F8F000000000000000000777000000
    0F8F8F8F8F8F8F8F800777777700000008F77777777777F8F000777777000000
    0F8F8F8F8F8F8F8F808007777700000008F8F8F8F8F8F8F80880007777000000
    00000000000000008F808007770000000008F8F8F8F8F8F8F808800077000000
    0000000000000000008F808007000000000008F8F8F8F8F8F8F8088000000000
    000000000000000000008F808000000000000008F8F8F8F8F8F8F80880000000
    00000000000000000000008F800000000000000008F8F8F8F8F8F8F800000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000FFFFFFFFFFFFFFFFFF08030FFF00000FFF00
    000FFF00000FF000000FF000000FE000000FE000000FC000000F8000000F8000
    000F80000007C0000003E0000001F0000001F0000001F0000001F0000001F000
    0001F8000001FC000001FE000001FF000001FF800003FFC00003FFE00003FFF0
    0007FFF8000FFFFFFFFFFFFFFFFF280000001000000020000000010004000000
    0000C00000000000000000000000000000000000000000000000000080000080
    00000080800080000000800080008080000080808000C0C0C0000000FF0000FF
    000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0000000000000000000000
    00000000000000000FF00FF0F00000088FFFFFFFF00000777F777777F0000000
    0FFFFFFFF00008888F7777FFF00000000FFFFFFFF000000F8888800000700008
    8888F8000770000F8F8F8F8000700000F8F8F8F8000000000F8F8F8F80000000
    00F8F8F8F8000000000F8F8F8F800000000000000000FFFF0000F1130000E003
    0000C003000080030000000300000001000080000000C0000000C0000000C000
    0000E0000000F0000000F8010000FC010000FFFF0000}
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  DesignSize = (
    644
    345)
  PixelsPerInch = 96
  TextHeight = 13
  object VDTButton1: TVDTButton
    Left = 452
    Top = 41
    Width = 21
    Height = 18
    Cursor = crHandPoint
    Caption = '...'
    Flat = True
    OnClick = VDTButton1Click
  end
  object Panel3: TPanel
    Left = 104
    Top = 0
    Width = 540
    Height = 36
    Anchors = [akLeft, akTop, akRight]
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Caption = ' '
    ParentBackground = True
    TabOrder = 2
    object VDTButton2: TVDTButton
      Left = 5
      Top = 7
      Width = 88
      Height = 22
      Cursor = crHandPoint
      Hint = 'Ajouter un genre'
      Caption = 'Rafra'#238'chir'
      Flat = True
      OnClick = VDTButton2Click
    end
    object Bevel4: TBevel
      Left = 97
      Top = 7
      Width = 8
      Height = 22
      Shape = bsLeftLine
    end
    object ajouter: TVDTButton
      Left = 101
      Top = 7
      Width = 88
      Height = 22
      Cursor = crHandPoint
      Hint = 'Ajouter un genre'
      Caption = 'Nouveau'
      Flat = True
      OnClick = ajouterClick
    end
    object modifier: TVDTButton
      Left = 190
      Top = 7
      Width = 89
      Height = 22
      Cursor = crHandPoint
      Hint = 'Modifier le genre s'#233'lectionn'#233
      Caption = 'Modifier'
      Flat = True
      OnClick = modifierClick
    end
    object supprimer: TVDTButton
      Left = 280
      Top = 7
      Width = 88
      Height = 22
      Cursor = crHandPoint
      Hint = 'Supprimer le genre s'#233'lectionn'#233
      Caption = 'Supprimer'
      Flat = True
      OnClick = supprimerClick
    end
    object Bevel7: TBevel
      Left = 372
      Top = 7
      Width = 6
      Height = 22
      Shape = bsLeftLine
    end
    object VDTButton3: TVDTButton
      Left = 377
      Top = 7
      Width = 88
      Height = 22
      Cursor = crHandPoint
      Hint = 'Ajouter un genre'
      Caption = 'Acheter'
      Flat = True
      Visible = False
      OnClick = VDTButton3Click
    end
  end
  object VirtualTreeView: TVirtualStringTree
    Left = 105
    Top = 62
    Width = 537
    Height = 281
    Anchors = [akLeft, akTop, akRight, akBottom]
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
    Header.Options = [hoColumnResize, hoDrag]
    HintAnimation = hatNone
    HintMode = hmTooltip
    HotCursor = crHandPoint
    Indent = 8
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    TreeOptions.MiscOptions = [toAcceptOLEDrop, toInitOnSave, toToggleOnDblClick, toWheelPanning]
    OnDblClick = modifierClick
    Columns = <
      item
        Position = 0
      end
      item
        Position = 1
      end
      item
        Position = 2
      end
      item
        Position = 3
      end>
  end
  object Panel14: TPanel
    Left = 0
    Top = 0
    Width = 104
    Height = 345
    Anchors = [akLeft, akTop, akBottom]
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Caption = ' '
    ParentBackground = True
    TabOrder = 1
    DesignSize = (
      104
      345)
    object btAlbums: TVDTButton
      Left = 5
      Top = 7
      Width = 95
      Height = 22
      Cursor = crHandPoint
      Anchors = [akLeft, akTop, akRight]
      GroupIndex = 1
      Caption = 'Albums'
      Flat = True
      OnClick = SpeedButton1Click
    end
    object btEditeurs: TVDTButton
      Left = 5
      Top = 115
      Width = 95
      Height = 23
      Cursor = crHandPoint
      Anchors = [akLeft, akTop, akRight]
      GroupIndex = 1
      Caption = 'Editeurs'
      Flat = True
      OnClick = SpeedButton1Click
    end
    object btAuteurs: TVDTButton
      Left = 5
      Top = 86
      Width = 95
      Height = 22
      Cursor = crHandPoint
      Anchors = [akLeft, akTop, akRight]
      GroupIndex = 1
      Caption = 'Auteurs'
      Flat = True
      OnClick = SpeedButton1Click
    end
    object btGenre: TVDTButton
      Left = 5
      Top = 167
      Width = 95
      Height = 23
      Cursor = crHandPoint
      Anchors = [akLeft, akTop, akRight]
      GroupIndex = 1
      Caption = 'Genres'
      Flat = True
      OnClick = SpeedButton1Click
    end
    object btCollections: TVDTButton
      Left = 5
      Top = 138
      Width = 95
      Height = 22
      Cursor = crHandPoint
      Anchors = [akLeft, akTop, akRight]
      GroupIndex = 1
      Caption = 'Collections'
      Flat = True
      OnClick = SpeedButton1Click
    end
    object btSeries: TVDTButton
      Left = 5
      Top = 29
      Width = 95
      Height = 22
      Cursor = crHandPoint
      Anchors = [akLeft, akTop, akRight]
      GroupIndex = 1
      Caption = 'S'#233'ries'
      Flat = True
      OnClick = SpeedButton1Click
    end
    object btEmprunteurs: TVDTButton
      Left = 5
      Top = 197
      Width = 95
      Height = 22
      Cursor = crHandPoint
      Anchors = [akLeft, akTop, akRight]
      GroupIndex = 1
      Caption = 'Emprunteurs'
      Flat = True
      OnClick = SpeedButton1Click
    end
    object Bevel1: TBevel
      Left = 20
      Top = 109
      Width = 65
      Height = 3
      Anchors = [akLeft, akTop, akRight]
      Shape = bsBottomLine
    end
    object Bevel3: TBevel
      Left = 20
      Top = 161
      Width = 65
      Height = 3
      Anchors = [akLeft, akTop, akRight]
      Shape = bsBottomLine
    end
    object Bevel2: TBevel
      Left = 20
      Top = 52
      Width = 65
      Height = 4
      Anchors = [akLeft, akTop, akRight]
      Shape = bsBottomLine
    end
    object Bevel5: TBevel
      Left = 20
      Top = 190
      Width = 65
      Height = 4
      Anchors = [akLeft, akTop, akRight]
      Shape = bsBottomLine
    end
    object btAchats: TVDTButton
      Left = 5
      Top = 58
      Width = 95
      Height = 22
      Cursor = crHandPoint
      Anchors = [akLeft, akTop, akRight]
      GroupIndex = 1
      Caption = 'Achats'
      Flat = True
      OnClick = SpeedButton1Click
    end
    object Bevel6: TBevel
      Left = 24
      Top = 81
      Width = 65
      Height = 3
      Anchors = [akLeft, akTop, akRight]
      Shape = bsBottomLine
    end
  end
  object ScanEdit: TEdit
    Left = 105
    Top = 41
    Width = 345
    Height = 18
    BevelKind = bkTile
    BorderStyle = bsNone
    TabOrder = 3
    OnChange = VDTButton1Click
    OnKeyPress = ScanEditKeyPress
  end
end
