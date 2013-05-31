object frmSaisieEmpruntAlbum: TfrmSaisieEmpruntAlbum
  Left = 457
  Top = 358
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Saisie d'#39'un mouvement d'#39'album'
  ClientHeight = 304
  ClientWidth = 549
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    549
    304)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 4
    Top = 260
    Width = 30
    Height = 13
    Hint = 'Date du mouvement'
    Alignment = taRightJustify
    Anchors = [akLeft, akBottom]
    Caption = 'Date :'
    Font.Charset = ANSI_CHARSET
    Font.Color = 12615680
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Layout = tlCenter
  end
  object Label2: TLabel
    Left = 37
    Top = 48
    Width = 179
    Height = 120
    Anchors = [akLeft, akTop, akBottom]
    AutoSize = False
    Caption = ' '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
    WordWrap = True
    ExplicitHeight = 73
  end
  object Label3: TLabel
    Left = 3
    Top = 46
    Width = 36
    Height = 13
    Hint = 'Date du mouvement'
    Alignment = taRightJustify
    Caption = 'Album :'
    Font.Charset = ANSI_CHARSET
    Font.Color = 12615680
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Layout = tlCenter
  end
  object Label4: TLabel
    Left = 8
    Top = 8
    Width = 31
    Height = 13
    Hint = 'Date du mouvement'
    Alignment = taRightJustify
    Caption = 'S'#233'rie :'
    FocusControl = date_pret
    Font.Charset = ANSI_CHARSET
    Font.Color = 12615680
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Layout = tlCenter
  end
  object Label5: TLabel
    Left = 45
    Top = 8
    Width = 171
    Height = 89
    Anchors = [akLeft, akTop, akBottom]
    AutoSize = False
    Caption = ' '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
    WordWrap = True
  end
  object Label6: TLabel
    Left = 8
    Top = 122
    Width = 39
    Height = 13
    Hint = 'Date du mouvement'
    Alignment = taRightJustify
    Caption = 'Edition :'
    Font.Charset = ANSI_CHARSET
    Font.Color = 12615680
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Layout = tlCenter
  end
  object lccEditions: TLightComboCheck
    Left = 53
    Top = 119
    Width = 164
    Height = 20
    Checked = False
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
  inline Frame11: TframBoutons
    Left = 0
    Top = 275
    Width = 549
    Height = 29
    Align = alBottom
    TabOrder = 4
    ExplicitTop = 275
    ExplicitWidth = 549
    inherited btnOK: TButton
      Left = 389
      Width = 73
      Enabled = False
      OnClick = okClick
      ExplicitLeft = 389
      ExplicitWidth = 73
    end
    inherited btnAnnuler: TButton
      Left = 469
      Width = 72
      ExplicitLeft = 469
      ExplicitWidth = 72
    end
  end
  object date_pret: TDateTimePickerLabeled
    Left = 37
    Top = 256
    Width = 90
    Height = 22
    Hint = 'Date du mouvement'
    Anchors = [akLeft, akBottom]
    CalColors.BackColor = clScrollBar
    Date = 36293.507726388900000000
    Time = 36293.507726388900000000
    TabOrder = 2
    LinkControls = <
      item
        Control = Label1
      end>
  end
  object pret: TCheckBoxLabeled
    Left = 153
    Top = 257
    Width = 37
    Height = 19
    Hint = 'Case coch'#233'e = le mouvement est un emprunt'
    Alignment = taLeftJustify
    Anchors = [akLeft, akBottom]
    Caption = 'Pr'#234't :'
    Ctl3D = False
    Font.Charset = ANSI_CHARSET
    Font.Color = 12615680
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 3
    LinkControls = <
      item
        Control = pret
      end>
  end
  object VTreeEmprunteur: TVirtualStringTree
    Left = 223
    Top = 28
    Width = 319
    Height = 247
    Align = alCustom
    Anchors = [akLeft, akTop, akRight, akBottom]
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
    Header.Options = [hoColumnResize, hoDrag]
    Indent = 8
    TabOrder = 1
    OnChange = VTreeEmprunteurChange
    Columns = <>
  end
  inline FrameRechercheRapide1: TframRechercheRapide
    Left = 223
    Top = 6
    Width = 249
    Height = 21
    TabOrder = 0
    ExplicitLeft = 223
    ExplicitTop = 6
    ExplicitWidth = 249
    inherited btNext: TVDTButton
      Left = 208
      ExplicitLeft = 208
    end
    inherited btNew: TVDTButton
      Left = 228
      ExplicitLeft = 228
    end
    inherited edSearch: TEditLabeled
      Width = 209
      ExplicitWidth = 209
    end
  end
end