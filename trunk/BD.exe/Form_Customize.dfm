object FrmCustomize: TFrmCustomize
  Left = 376
  Top = 201
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsDialog
  Caption = 'Personnaliser'
  ClientHeight = 356
  ClientWidth = 514
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  DesignSize = (
    514
    356)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 7
    Top = 7
    Width = 56
    Height = 13
    Caption = 'Cat'#233'gories:'
  end
  object Label4: TLabel
    Left = 7
    Top = 97
    Width = 62
    Height = 13
    Caption = 'Commandes:'
  end
  object VDTButton2: TVDTButton
    Left = 206
    Top = 238
    Width = 83
    Height = 20
    Cursor = crHandPoint
    Caption = 'S'#233'parateur'
    Flat = True
    Glyph.Data = {
      B2000000424DB20000000000000052000000280000000C0000000C0000000100
      04000000000060000000120B0000120B00000700000007000000CE636300FF9C
      9C00FFCECE0000FF0000BDBDBD008C8C8C000000000033334333333360603336
      5433333333333336654333333336333616543333333633362065433333363336
      2106543333363336211063333336333621163333333633362163333333363336
      26333333333633366333333333363336333333333336}
    Layout = blGlyphRight
    Margin = 4
    Spacing = -1
    OnClick = VDTButton2Click
  end
  object VDTButton3: TVDTButton
    Left = 206
    Top = 113
    Width = 83
    Height = 20
    Cursor = crHandPoint
    Caption = 'Ajouter'
    Flat = True
    Glyph.Data = {
      B2000000424DB20000000000000052000000280000000C0000000C0000000100
      04000000000060000000120B0000120B00000700000007000000CE636300FF9C
      9C00FFCECE0000FF0000BDBDBD008C8C8C000000000033334333333360603336
      5433333333333336654333333336333616543333333633362065433333363336
      2106543333363336211063333336333621163333333633362163333333363336
      26333333333633366333333333363336333333333336}
    Layout = blGlyphRight
    Margin = 4
    Spacing = -1
    OnClick = VDTButton3Click
  end
  object VDTButton4: TVDTButton
    Left = 206
    Top = 133
    Width = 83
    Height = 21
    Cursor = crHandPoint
    Caption = 'Retirer'
    Flat = True
    Glyph.Data = {
      B2000000424DB20000000000000052000000280000000C0000000C0000000100
      04000000000060000000120B0000120B00000700000007000000CE636300FF9C
      9C00FFCECE0000FF0000BDBDBD008C8C8C000000000033333333343320603333
      3333654333333333333665433333333333616543333333333610654333333333
      6110654333333336211065433333333362106543333633333621654333333333
      33626543333333333336654333333333333364333333}
    Margin = 4
    Spacing = -1
    OnClick = VDTButton4Click
  end
  object GroupBox1: TGroupBox
    Left = 7
    Top = 267
    Width = 499
    Height = 61
    Anchors = [akLeft, akRight, akBottom]
    Caption = ' Description : '
    TabOrder = 0
    object Label3: TLabel
      Left = 2
      Top = 15
      Width = 495
      Height = 44
      Align = alClient
      Alignment = taCenter
      Caption = 'Label3'
      Layout = tlCenter
      Visible = False
    end
  end
  inline Frame11: TFrame1
    Left = 0
    Top = 332
    Width = 514
    Height = 24
    Align = alBottom
    TabOrder = 1
    inherited btnOK: TBitBtn
      Left = 358
      Width = 74
      Height = 19
      OnClick = Frame11btnOKClick
    end
    inherited btnAnnuler: TBitBtn
      Left = 439
      Width = 72
      Height = 19
    end
  end
  object Cats: TListBox
    Left = 7
    Top = 24
    Width = 186
    Height = 62
    Cursor = crHandPoint
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelKind = bkTile
    BorderStyle = bsNone
    ItemHeight = 13
    TabOrder = 2
    OnClick = CatsClick
  end
  object Commands: TVDTListView
    Left = 7
    Top = 113
    Width = 186
    Height = 151
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelKind = bkTile
    BorderStyle = bsNone
    Columns = <
      item
        Width = 46
      end>
    ColumnClick = False
    DragMode = dmAutomatic
    HideSelection = False
    ReadOnly = True
    RowSelect = True
    ShowColumnHeaders = False
    SmallImages = Fond.boutons_16x16_hot
    TabOrder = 3
    ViewStyle = vsReport
    OnChange = CommandsChange
  end
  object VDTListView1: TVDTListView
    Left = 302
    Top = 24
    Width = 204
    Height = 240
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelKind = bkTile
    BorderStyle = bsNone
    Columns = <
      item
        Width = 46
      end>
    ColumnClick = False
    DragMode = dmAutomatic
    HideSelection = False
    ReadOnly = True
    RowSelect = True
    ShowColumnHeaders = False
    SmallImages = Fond.boutons_16x16_hot
    SortType = stNone
    TabOrder = 4
    ViewStyle = vsReport
    OnChange = CommandsChange
    OnDragDrop = VDTListView1DragDrop
    OnDragOver = VDTListView1DragOver
  end
  object ToolBar1: TToolBar
    Left = 519
    Top = 26
    Width = 23
    Height = 44
    Align = alNone
    AutoSize = True
    Caption = 'ToolBar1'
    EdgeBorders = []
    EdgeOuter = esNone
    Flat = True
    Images = Fond.ImageList1
    TabOrder = 5
    Transparent = True
    object ToolButton1: TToolButton
      Left = 0
      Top = 0
      Cursor = crHandPoint
      Caption = 'ToolButton1'
      ImageIndex = 0
      Wrap = True
      OnClick = ToolButton1Click
    end
    object ToolButton4: TToolButton
      Left = 0
      Top = 22
      Cursor = crHandPoint
      Caption = 'ToolButton4'
      ImageIndex = 1
      OnClick = ToolButton4Click
    end
  end
end
