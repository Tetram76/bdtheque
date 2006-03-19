object FrmRecherche: TFrmRecherche
  Left = 212
  Top = 321
  Width = 400
  Height = 469
  Caption = 'FrmRecherche'
  Color = clBtnFace
  Constraints.MinWidth = 400
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 222
    Width = 392
    Height = 3
    Cursor = crVSplit
    Align = alTop
  end
  object lbResult: TLabel
    Left = 0
    Top = 225
    Width = 392
    Height = 17
    Align = alTop
    AutoSize = False
    Caption = ' '
    Layout = tlCenter
  end
  object PageControl2: TPageControl
    Left = 0
    Top = 0
    Width = 392
    Height = 222
    Cursor = crHandPoint
    ActivePage = TabSheet4
    Align = alTop
    Style = tsFlatButtons
    TabOrder = 0
    object TabSheet3: TTabSheet
      Caption = 'Recherche simple'
      DesignSize = (
        384
        191)
      object VDTButton7: TVDTButton
        Left = 359
        Top = 2
        Width = 24
        Height = 18
        Cursor = crHandPoint
        Anchors = [akTop, akRight, akBottom]
        Caption = '...'
        Flat = True
        OnClick = Edit2Change
      end
      object LightComboCheck1: TLightComboCheck
        Left = 2
        Top = 1
        Width = 119
        Height = 19
        Checked = True
        Border = CCBflat
        DefaultValueChecked = -1
        PropertiesStored = True
        Transparent = True
        CheckVisible = False
        FillCaption = False
        CheckedCaptionBold = False
        OnChange = LightComboCheck1Change
        ShowCaptionHint = False
        AssignHint = False
        OptionValidValue.ValueOption = [vvoChecked, vvoUnchecked, vvoMissing, vvoUnknown, vvoOthers]
        Items.CaptionComplet = True
        Items.Separateur = ' '
        Items = <
          item
            Valeur = 0
            Caption = 'Auteur'
            Visible = True
            Enabled = True
            SubItems.CaptionComplet = True
            SubItems.Separateur = ' '
            SubItems = <>
          end
          item
            Valeur = 1
            Caption = 'Serie'
            Visible = True
            Enabled = True
            SubItems.CaptionComplet = True
            SubItems.Separateur = ' '
            SubItems = <>
          end
          item
            Valeur = 2
            Caption = 'Editeur'
            Visible = True
            Enabled = True
            SubItems.CaptionComplet = True
            SubItems.Separateur = ' '
            SubItems = <>
          end
          item
            Valeur = 4
            Caption = 'Collection'
            Visible = True
            Enabled = True
            SubItems.CaptionComplet = True
            SubItems.Separateur = ' '
            SubItems = <>
          end
          item
            Valeur = 3
            Caption = 'Genre'
            Visible = True
            Enabled = True
            SubItems.CaptionComplet = True
            SubItems.Separateur = ' '
            SubItems = <>
          end>
      end
      object vtPersonnes: TVirtualStringTree
        Left = 2
        Top = 22
        Width = 383
        Height = 167
        Anchors = [akLeft, akTop, akRight, akBottom]
        AnimationDuration = 0
        BackgroundOffsetX = -96
        BevelKind = bkTile
        BorderStyle = bsNone
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
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
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnDblClick = SpeedButton1Click
        Columns = <>
      end
      object Edit2: TEdit
        Left = 128
        Top = 2
        Width = 233
        Height = 18
        Anchors = [akLeft, akTop, akRight]
        BevelKind = bkTile
        BorderStyle = bsNone
        TabOrder = 1
        OnChange = Edit2Change
        OnKeyPress = Edit2KeyPress
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Recherche avanc'#233'e'
      ImageIndex = 1
      DesignSize = (
        384
        191)
      object plus: TButton
        Left = 1
        Top = 23
        Width = 51
        Height = 20
        Cursor = crHandPoint
        Hint = 'Ajouter le crit'#232're (recherche multi-crit'#232'res)'
        Caption = 'Ajouter'
        TabOrder = 0
        OnClick = plusClick
      end
      object Modif: TButton
        Left = 1
        Top = 46
        Width = 51
        Height = 19
        Cursor = crHandPoint
        Hint = 'Modifier le crit'#232're s'#233'lectionn'#233' (recherche multi-crit'#232'res)'
        Caption = 'Modifier'
        Enabled = False
        TabOrder = 1
        OnClick = ModifClick
      end
      object moins: TButton
        Left = 1
        Top = 72
        Width = 51
        Height = 19
        Cursor = crHandPoint
        Hint = 'Retirer le crit'#232're s'#233'lectionn'#233' (recherche multi-crit'#232'res)'
        Caption = 'Retirer'
        Enabled = False
        TabOrder = 2
        OnClick = moinsClick
      end
      object methode: TComboBox
        Left = 1
        Top = 113
        Width = 51
        Height = 21
        Cursor = crHandPoint
        Hint = 'M'#233'thode (recherche multi-crit'#232'res)'
        BevelKind = bkTile
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 3
        Visible = False
        OnChange = methodeChange
        Items.Strings = (
          'ET'
          'OU')
      end
      object btnRecherche: TButton
        Left = 303
        Top = 0
        Width = 75
        Height = 20
        Cursor = crHandPoint
        Hint = 'Rechercher en fonctions des crit'#232'res (recherche multi-crit'#232'res)'
        Anchors = [akTop, akRight]
        Caption = 'Recherche'
        TabOrder = 4
        OnClick = btnRechercheClick
      end
      object TreeView1: TTreeView
        Left = 61
        Top = 24
        Width = 324
        Height = 165
        Anchors = [akLeft, akTop, akRight, akBottom]
        AutoExpand = True
        BevelKind = bkTile
        BorderStyle = bsNone
        HideSelection = False
        Indent = 19
        ReadOnly = True
        ShowButtons = False
        ShowRoot = False
        TabOrder = 5
        OnChange = TreeView1Change
        OnCollapsing = TreeView1Collapsing
        OnDblClick = ModifClick
        OnDeletion = TreeView1Deletion
      end
    end
  end
  object VTResult: TVirtualStringTree
    Left = 0
    Top = 242
    Width = 392
    Height = 175
    Align = alClient
    BevelKind = bkTile
    BorderStyle = bsNone
    Header.AutoSizeIndex = 0
    Header.Font.Charset = DEFAULT_CHARSET
    Header.Font.Color = clWindowText
    Header.Font.Height = -11
    Header.Font.Name = 'Tahoma'
    Header.Font.Style = []
    Header.Images = Fond.ImageList1
    Header.Options = [hoAutoResize, hoColumnResize, hoShowImages, hoVisible]
    Header.Style = hsPlates
    TabOrder = 1
    TreeOptions.SelectionOptions = [toFullRowSelect]
    OnDblClick = VTResultDblClick
    OnGetText = VTResultGetText
    OnPaintText = VTResultPaintText
    OnHeaderClick = VTResultHeaderClick
    Columns = <
      item
        Position = 0
        Width = 148
        WideText = 'Album'
      end
      item
        Position = 1
        Width = 40
        WideText = 'Tome'
      end
      item
        Position = 2
        Width = 200
        WideText = 'Serie'
      end>
  end
  object PopupMenu1: TPopupMenu
    Left = 352
    object Critre1: TMenuItem
      Caption = 'Crit'#232're'
      OnClick = Critre1Click
    end
    object Groupedecritre1: TMenuItem
      Caption = 'Groupe de crit'#232're'
      OnClick = Groupedecritre1Click
    end
  end
  object ActionList1: TActionList
    Left = 224
    object RechercheApercu: TAction
      Tag = 1
      Category = 'Recherche'
      Caption = 'Aper'#231'u avant impression'
      ImageIndex = 4
      OnExecute = RechPrint
    end
    object RechercheImprime: TAction
      Tag = 2
      Category = 'Recherche'
      Caption = 'Imprimer'
      ImageIndex = 3
      OnExecute = RechPrint
    end
  end
  object MainMenu1: TMainMenu
    Left = 256
    object Recherche1: TMenuItem
      Caption = 'Recherche'
      object Exporter1: TMenuItem
        Action = RechercheApercu
      end
      object Imprimer1: TMenuItem
        Action = RechercheImprime
      end
    end
  end
end
