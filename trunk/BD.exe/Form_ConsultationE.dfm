object FrmConsultationE: TFrmConsultationE
  Left = 497
  Top = 243
  Width = 513
  Height = 486
  Caption = 'Fiche d'#39'emprunteur'
  Color = clWindow
  Ctl3D = False
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
    0007777FF77F777F777FF7770000000000077F77F777F77F7777777700000000
    00077F7777777F7777F7777F00000000000777777FFF777777777F7F00000000
    000F77FF777777FF77777F7F0000000000077F77F7777FF77F77777700000000
    00077777F77FF77F7F77F77700000000000F777F77FF77777777F77F00000000
    0007777777F7F777F77FFF7700000000000F7777F77777F77F777F7700000000
    000F7FF7777777FF77777F7700000000000F77F7FF7F7777FFF7777700000000
    0007FF7F7F7FF7F7FFF777F700000000000F7777FF77FFF77777777700000000
    0007777777FF7F7FFF7F777700000000000F7F77FF77F77777F7F77700000000
    0007FFF7777F777F7F777F7700000000000777777FF77F7F777F7F7700000000
    00077F7FF000000000FF777F00000000000777FF0FFFFFFFFF07F77700000000
    000FF7770FFFFFFFFF07777F0000000000077FF70FFFFFFFFF077F7F00000000
    000FF7770FFFFFFFFF07777F000000000007777F0FFFFFFFFF0F777F00000000
    00077FFF0FFFFFFFFF0FF77700000000000F77F7F0000000007F77FF00000000
    0007F777F777F777FFF7777700000000000F7F777777F777777F777700000000
    000FF7F777F7777777F7F7770000000000077F7F7FF777777FF7777F00000000
    0000000000000000000000000000E000000FE0000007E0000007E0000007E000
    0007E0000007E0000007E0000007E0000007E0000007E0000007E0000007E000
    0007E0000007E0000007E0000007E0000007E0000007E0000007E0000007E000
    0007E0000007E0000007E0000007E0000007E0000007E0000007E0000007E000
    0007E0000007E0000007E000000F280000001000000020000000010004000000
    0000C00000000000000000000000000000000000000000000000000080000080
    00000080800080000000800080008080000080808000C0C0C0000000FF0000FF
    000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0000000000000000000000
    777F7F77F7000000F7F777FFFF0000007F77FF77770000007777F7FF7F000000
    7FF77777770000007777F7F7F70000007F7F7F777F000000FF7777FF77000000
    FF700007F7000000770FFFF07F000000FF0FFFF07F000000770FFFF0F7000000
    F770000777000000F7F777F7F700000000000000000080030000800100008001
    0000800100008001000080010000800100008001000080010000800100008001
    00008001000080010000800100008001000080030000}
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    505
    439)
  PixelsPerInch = 96
  TextHeight = 13
  object l_emprunts: TLabel
    Left = 4
    Top = 226
    Width = 42
    Height = 11
    Hint = 'Nombre d'#39'emprunts de l'#39'emprunteur'
    Alignment = taRightJustify
    Caption = 'Emprunts:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clHotLight
    Font.Height = -9
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ShowAccelChar = False
    Transparent = True
  end
  object emprunts: TLabel
    Left = 49
    Top = 225
    Width = 3
    Height = 13
    Hint = 'Nombre d'#39'emprunts de l'#39'emprunteur'
    Alignment = taCenter
    Transparent = True
  end
  object Bevel4: TBevel
    Left = 80
    Top = 59
    Width = 418
    Height = 135
    Anchors = [akLeft, akTop, akRight]
    Style = bsRaised
  end
  object Bevel2: TBevel
    Left = 7
    Top = 247
    Width = 491
    Height = 155
    Anchors = [akLeft, akTop, akRight, akBottom]
    Style = bsRaised
  end
  object Label6: TLabel
    Left = 52
    Top = 41
    Width = 23
    Height = 11
    Alignment = taRightJustify
    Caption = 'Nom:'
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = clHotLight
    Font.Height = -9
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    ShowAccelChar = False
    Transparent = True
  end
  object nom: TLabel
    Left = 82
    Top = 34
    Width = 415
    Height = 24
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
    Layout = tlCenter
    WordWrap = True
  end
  object Label1: TLabel
    Left = 39
    Top = 61
    Width = 36
    Height = 11
    Alignment = taRightJustify
    Caption = 'Adresse:'
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = clHotLight
    Font.Height = -9
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    ShowAccelChar = False
    Transparent = True
  end
  object adresse: TMemo
    Left = 82
    Top = 59
    Width = 415
    Height = 134
    Hint = 'Coordonn'#233'es de l'#39'emprunteur'
    Anchors = [akLeft, akTop, akRight]
    BorderStyle = bsNone
    ReadOnly = True
    TabOrder = 0
  end
  object btAjouter: TButton
    Left = 426
    Top = 225
    Width = 72
    Height = 18
    Cursor = crHandPoint
    Anchors = [akTop, akRight]
    Caption = 'Ajouter'
    TabOrder = 1
    OnClick = btAjouterClick
  end
  object ListeEmprunts: TVirtualStringTree
    Left = 6
    Top = 245
    Width = 491
    Height = 156
    Anchors = [akLeft, akTop, akRight, akBottom]
    AnimationDuration = 0
    BorderStyle = bsNone
    Header.AutoSizeIndex = 1
    Header.Font.Charset = DEFAULT_CHARSET
    Header.Font.Color = clWindowText
    Header.Font.Height = -11
    Header.Font.Name = 'Tahoma'
    Header.Font.Style = []
    Header.Images = Fond.ImageList1
    Header.MainColumn = 1
    Header.Options = [hoColumnResize, hoShowImages, hoVisible]
    Header.Style = hsPlates
    HotCursor = crHandPoint
    Images = Fond.ImageList1
    TabOrder = 2
    TreeOptions.PaintOptions = [toHideFocusRect, toHotTrack, toShowDropmark, toThemeAware, toUseBlendedImages]
    TreeOptions.SelectionOptions = [toFullRowSelect, toMultiSelect]
    OnDblClick = ListeEmpruntsDblClick
    OnGetText = ListeEmpruntsGetText
    OnGetImageIndex = ListeEmpruntsGetImageIndex
    OnHeaderClick = ListeEmpruntsHeaderClick
    Columns = <
      item
        Position = 0
        WideText = 'Date'
      end
      item
        Position = 1
        WideText = 'Album'
      end
      item
        Position = 2
        Width = 250
        WideText = 'Edition'
      end>
  end
  object Button1: TButton
    Left = 329
    Top = 225
    Width = 90
    Height = 18
    Cursor = crHandPoint
    Action = Retour1
    Anchors = [akTop, akRight]
    TabOrder = 3
  end
  object ActionList1: TActionList
    OnUpdate = ActionList1Update
    Left = 52
    Top = 12
    object FicheApercu: TAction
      Tag = 1
      Category = 'Fiche'
      Caption = 'Aper'#231'u avant impression'
      ImageIndex = 4
      OnExecute = Imprimer2Click
    end
    object FicheImprime: TAction
      Tag = 2
      Category = 'Fiche'
      Caption = 'Imprimer'
      ImageIndex = 3
      OnExecute = Imprimer2Click
    end
    object EmpruntApercu: TAction
      Tag = 1
      Category = 'Emprunts'
      Caption = 'Aper'#231'u avant impression'
      ImageIndex = 4
      OnExecute = Imprimer1Click
    end
    object EmpruntImprime: TAction
      Tag = 2
      Category = 'Emprunts'
      Caption = 'Imprimer'
      ImageIndex = 3
      OnExecute = Imprimer1Click
    end
    object Retour1: TAction
      Caption = 'Pr'#234't / Retour'
      OnExecute = Retour1Execute
    end
  end
  object MainMenu1: TMainMenu
    Left = 120
    Top = 16
    object Fiche1: TMenuItem
      Caption = 'Fiche'
      object Aperuavantimpression1: TMenuItem
        Action = FicheApercu
      end
      object Aperuavantimpression2: TMenuItem
        Action = FicheImprime
      end
    end
    object Emprunts1: TMenuItem
      Caption = 'Emprunts'
      object Aperuavantimpression3: TMenuItem
        Action = EmpruntApercu
      end
      object Aperuavantimpression4: TMenuItem
        Action = EmpruntImprime
      end
    end
  end
end
