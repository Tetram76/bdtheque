object FrmSaisie_EmpruntEmprunteur: TFrmSaisie_EmpruntEmprunteur
  Left = 204
  Top = 359
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Saisie d'#39'un mouvement'
  ClientHeight = 363
  ClientWidth = 525
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Icon.Data = {
    0000010001002020040000000000E80200001600000028000000200000004000
    0000010004000000000000020000000000000000000010000000000000000000
    0000000080000080000000808000800000008000800080800000C0C0C0008080
    80000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    0000000000000000000000000000000000000000000000000000000100000000
    0000000000000000000000170000000000000000000000000000001710000000
    0000888800000000000000017100000000880000110000000000000071007777
    0000001100333300000877701810777007777800000000884440000004107708
    7777777780000000088888830107708778000087778000008008888800777077
    7001880877778000088000007777087777001880778878000088087777770780
    7770011078000780000880877777070107770000708880780000808777770700
    1077700770188807800088087777088001077777700118107800080877777070
    0000777770001110870008808777707800007777770000008780008087777087
    7777777007700008777000808777770777777770007777777778008807777708
    7780007700777800087700080777777078001107777770118087000807777770
    8700011077777001180780080777777708700010777777001107700807777777
    7087000077007770000770807777777777087008770107770007708077777777
    7770878777011077708780077777000000000877770001077777000000000000
    0000000877800000777800000000000000000000087780087780000000000000
    000000000000877780000000000000000000000000000000000000000000FFFF
    FFEFFFFFFFC7FFFFFF87FF07FF83FC00FFC1F8003FE100000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    00000000000000000000FF00003FFF80007FFFE000FFFFF801FFFFFF07FF}
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel4: TPanel
    Left = 0
    Top = 0
    Width = 525
    Height = 332
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Panel4'
    TabOrder = 0
    object Splitter1: TSplitter
      Left = 0
      Top = 172
      Width = 525
      Height = 3
      Cursor = crVSplit
      Align = alTop
    end
    object Panel2: TPanel
      Left = 0
      Top = 175
      Width = 525
      Height = 157
      Align = alClient
      BevelOuter = bvNone
      Caption = 'Panel2'
      TabOrder = 0
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 525
        Height = 129
        Align = alClient
        BevelOuter = bvNone
        Caption = ' '
        TabOrder = 0
        DesignSize = (
          525
          129)
        object ListView1: TVDTListView
          Left = 2
          Top = 2
          Width = 500
          Height = 127
          Anchors = [akLeft, akTop, akRight, akBottom]
          BevelKind = bkTile
          BorderStyle = bsNone
          Columns = <
            item
              AutoSize = True
              Caption = 'Album'
            end
            item
              Caption = 'Date'
              Width = 74
            end
            item
              Caption = 'Mvt'
              Width = 46
            end>
          ColumnClick = False
          HideSelection = False
          ReadOnly = True
          RowSelect = True
          ShowColumnHeaders = False
          TabOrder = 0
          ViewStyle = vsReport
          OnDblClick = ListView1DblClick
          OnSelectItem = ListView1SelectItem
        end
        object Panel9: TPanel
          Left = 504
          Top = 0
          Width = 21
          Height = 129
          Align = alRight
          AutoSize = True
          BevelOuter = bvNone
          Caption = ' '
          TabOrder = 1
          object VDTButton2: TVDTButton
            Left = 0
            Top = 0
            Width = 21
            Height = 20
            Cursor = crHandPoint
            Flat = True
            Glyph.Data = {
              B2000000424DB20000000000000052000000280000000C0000000C0000000100
              04000000000060000000120B0000120B00000700000007000000CE636300FF9C
              9C00FFCECE0000FF0000BDBDBD008C8C8C000000000033333333333360603444
              4444444333334555555555543444666666666663455536210000163366663362
              1111633336213336211633333362333362633333333633333633333333333333
              33333333333333333333333333333333333333333333}
            OnClick = ToolButton1Click
          end
          object VDTButton3: TVDTButton
            Left = 0
            Top = 20
            Width = 21
            Height = 21
            Cursor = crHandPoint
            Flat = True
            Glyph.Data = {
              B2000000424DB20000000000000052000000280000000C0000000C0000000100
              04000000000060000000120B0000120B00000700000007000000CE636300FF9C
              9C00FFCECE0000FF0000BDBDBD008C8C8C0000000000333333333333C0603333
              3333333333333333334333333333333336543333333333336065433333333336
              1106543333333361111065433336362222221654336166666666666336223333
              33333333666633333333333333333333333333333333}
            OnClick = ToolButton4Click
          end
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 129
        Width = 525
        Height = 28
        Align = alBottom
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = ' '
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 1
        object Label3: TLabel
          Left = 7
          Top = 7
          Width = 27
          Height = 13
          Hint = 'Date du mouvement'
          Caption = 'Date:'
          Layout = tlCenter
        end
        object lccEditions: TLightComboCheck
          Left = 205
          Top = 4
          Width = 300
          Height = 20
          Checked = False
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          PropertiesStored = False
          CheckVisible = False
          OnChange = lccEditionsChange
          ShowCaptionHint = False
          AssignHint = False
          OptionValidValue.ValueOption = [vvoChecked, vvoUnchecked, vvoMissing, vvoUnknown, vvoOthers]
          Items.CaptionComplet = True
          Items.Separateur = ' '
          Items = <>
        end
        object pret: TCheckBoxLabeled
          Left = 141
          Top = 5
          Width = 38
          Height = 19
          Hint = 'Case coch'#233'e = le mouvement est un emprunt'
          Caption = 'Pr'#234't'
          Ctl3D = False
          Enabled = False
          ParentCtl3D = False
          TabOrder = 1
          OnClick = pretClick
          LinkLabel.LinkLabel.Strings = (
            'pret')
        end
        object date_pret: TDateTimePickerLabeled
          Left = 34
          Top = 4
          Width = 93
          Height = 22
          Hint = 'Date du mouvement'
          CalColors.BackColor = clScrollBar
          Date = 36293.507726388900000000
          Time = 36293.507726388900000000
          Enabled = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 0
          OnChange = date_pretChange
          LinkLabel.LinkLabel.Strings = (
            'Label1')
        end
      end
    end
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 525
      Height = 23
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Caption = ' '
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
      object Label2: TLabel
        Left = 2
        Top = 2
        Width = 521
        Height = 19
        Align = alClient
        AutoSize = False
      end
    end
    object Panel6: TPanel
      Left = 0
      Top = 23
      Width = 525
      Height = 149
      Align = alTop
      BevelOuter = bvNone
      Caption = 'Panel6'
      TabOrder = 2
      DesignSize = (
        525
        149)
      object VDTButton1: TVDTButton
        Left = 499
        Top = 2
        Width = 26
        Height = 20
        Cursor = crHandPoint
        Anchors = [akTop, akRight]
        Caption = '...'
        Flat = True
        OnClick = VDTButton1Click
      end
      object vtAlbums: TVirtualStringTree
        Left = 0
        Top = 24
        Width = 525
        Height = 125
        Align = alBottom
        AnimationDuration = 0
        BevelKind = bkTile
        BorderStyle = bsNone
        Header.AutoSizeIndex = 0
        Header.Font.Charset = DEFAULT_CHARSET
        Header.Font.Color = clWindowText
        Header.Font.Height = -11
        Header.Font.Name = 'Tahoma'
        Header.Font.Style = []
        Header.Options = [hoAutoResize, hoColumnResize, hoDrag]
        HintAnimation = hatNone
        HintMode = hmTooltip
        HotCursor = crHandPoint
        Indent = 8
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        TreeOptions.PaintOptions = [toHotTrack, toShowBackground, toShowButtons, toShowDropmark, toShowRoot, toThemeAware, toUseBlendedImages]
        TreeOptions.StringOptions = [toSaveCaptions]
        OnDblClick = vtAlbumsDblClick
        Columns = <
          item
            Options = [coAllowClick, coEnabled, coParentBidiMode, coParentColor, coResizable, coShowDropMark, coVisible]
            Position = 0
            Width = 521
          end>
      end
      object ScanEditAlbum: TEdit
        Left = 0
        Top = 2
        Width = 495
        Height = 20
        Anchors = [akLeft, akTop, akRight]
        BevelKind = bkTile
        BorderStyle = bsNone
        TabOrder = 1
        OnChange = VDTButton1Click
      end
    end
  end
  inline Frame11: TFrame1
    Left = 0
    Top = 332
    Width = 525
    Height = 31
    Align = alBottom
    TabOrder = 1
    inherited btnOK: TBitBtn
      Left = 370
      Top = 6
      Width = 73
      Height = 19
      Caption = 'Ok'
      Enabled = False
      OnClick = BtnOkExecute
    end
    inherited btnAnnuler: TBitBtn
      Left = 450
      Top = 6
      Width = 72
      Height = 19
    end
  end
end
