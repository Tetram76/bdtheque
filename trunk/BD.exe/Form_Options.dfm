object FrmOptions: TFrmOptions
  Left = 591
  Top = 278
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  BorderIcons = [biHelp]
  BorderStyle = bsDialog
  Caption = 'Options'
  ClientHeight = 424
  ClientWidth = 360
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
    0000FF00FF00FFFF0000FFFFFF007770FFFFFFFFFFFFF0070FFFFFFFFFFFF777
    0FFFFFFFFFFFF07870FFFFFFFFFFFF7770FFFFFFFFFF0788770FFFFFFFFFFFF7
    700FFFFFFFF078877770FFFFFFFFFFFF0070FFFFFF07887FF7770FFFFFFFFFFF
    07870FFFF07887FFFF7770FFFFFFFFF0788770FF07887FFFFFF7770FFFFFFF07
    887777000887FFFFFFFF7770FFFFF07887FF7770087FFF00FFFFF7700FFF0788
    7FFFF77707FFFF0F0FFFFF0070FF7887FFFFFF7770FF0F0FFFFFFF07870F887F
    F0FFFFF7770FF00FFFFFF078877087FF0FFFFFFF7700FFFFFFFF078877777FF0
    F0F0FFFFF0070FFFFFF07887FF770FF0FF0FFFFFF07870FFFF07887FFFF770FF
    00FFFFFF0788770FF07887FFFFFF700FFFFFFFF07887777000887FF0FFFF0070
    FFFFFF07887FF7770087FFF0FFFF07870FFFF07887FFFF77707FF00000FF7887
    70FF07887FFFFFF7770FFFF0FFFF887777000887FFF0FFFF7770FFF0FFFF87FF
    7770087FF0FF0FFFF7700FFFFFFF7FFFF77707FF0F0F0FFFFF0070FFFFFFFFFF
    FF7770FF0FF0FFFFFF07870FFFF0FFFFFFF7770FF0FFFFFFF0788770FF07F00F
    FFFF7700FFFFFFFF0788777700080F0FFFFFF0070FFFFFF07887FF777008FF00
    0FFFF07870FFFF07887FFFF77700FFFF0FFF0788770FF07887FF0FFF7770FFF0
    FFF07887777000887FF0F0FFF777FFF0FF07887FF7770087FF0FF0FFFF77FFFF
    F07887FFFF77707FF0FFF0FFFFF7000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000280000001000000020000000010004000000
    0000C00000000000000000000000000000000000000000000000000080000080
    00000080800080000000800080008080000080808000C0C0C0000000FF0000FF
    000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0070FFFFFFF00FFFFFF70F
    FFFF0870FFFFFF00FFF087F70FFFFF780F087FFF70FFF78F7007F0FFF70F78FF
    F70F00FFF0808F0FFF70FFFF08770FF0FFF70FF087FF70FFFF7870087FFF080F
    F78FF707F00F877078FFFF70FFFF7FF70F000FF00FFFFFFF70FFFFF780F000FF
    F00FFF78F700FF0F0870F78F0F70FFF087F708F0FFF700000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    00000000000000000000000000000000000000000000}
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object BtDef: TButton
    Left = 67
    Top = 253
    Width = 70
    Height = 23
    Caption = 'BtDef'
    Default = True
    TabOrder = 2
    TabStop = False
    OnClick = BtDefClick
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 360
    Height = 394
    Cursor = crHandPoint
    ActivePage = TabSheet1
    Align = alClient
    HotTrack = True
    Images = ImageList1
    MultiLine = True
    Style = tsFlatButtons
    TabHeight = 38
    TabOrder = 0
    TabStop = False
    object options: TTabSheet
      Hint = 'Options diverses'
      Caption = 'Options diverses'
      object PanelImpression: TPanel
        Left = 0
        Top = 209
        Width = 352
        Height = 56
        Align = alTop
        BevelOuter = bvNone
        Caption = ' '
        TabOrder = 1
        object Label11: TLabel
          Left = 0
          Top = 1
          Width = 62
          Height = 11
          Caption = 'Impression :'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object FicheAlbumCouverture: TCheckBox
          Left = 15
          Top = 15
          Width = 242
          Height = 16
          Cursor = crHandPoint
          Caption = 'Imprimer les fiches d'#39'album avec la couverture'
          Checked = True
          State = cbChecked
          TabOrder = 0
        end
        object FicheParaBDCouverture: TCheckBox
          Left = 15
          Top = 31
          Width = 242
          Height = 16
          Cursor = crHandPoint
          Caption = 'Imprimer les fiches de para-BD avec l'#39'image'
          Checked = True
          State = cbChecked
          TabOrder = 1
        end
      end
      object PanelGestion: TPanel
        Left = 0
        Top = 265
        Width = 352
        Height = 74
        Align = alTop
        BevelOuter = bvNone
        Caption = ' '
        TabOrder = 2
        object Label2: TLabel
          Left = 0
          Top = 0
          Width = 73
          Height = 11
          Caption = 'Mode Gestion :'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label14: TLabel
          Left = 15
          Top = 33
          Width = 175
          Height = 13
          Caption = 'R'#233'pertoire de stockage des images :'
        end
        object VDTButton1: TVDTButton
          Left = 15
          Top = 50
          Width = 328
          Height = 16
          Cursor = crHandPoint
          Hint = 'R'#233'pertoire de stockage des images'
          Caption = 'R'#233'pertoire Images'
          Flat = True
          Margin = 1
          OnClick = VDTButton1Click
        end
        object CheckBox2: TCheckBox
          Left = 15
          Top = 15
          Width = 224
          Height = 16
          Cursor = crHandPoint
          Caption = 'Images stock'#233'es dans la base par d'#233'faut'
          Checked = True
          State = cbChecked
          TabOrder = 0
        end
      end
      object PanelGeneral: TPanel
        Left = 0
        Top = 0
        Width = 352
        Height = 209
        Align = alTop
        BevelOuter = bvNone
        Caption = ' '
        TabOrder = 0
        object Label1: TLabel
          Left = 0
          Top = 0
          Width = 45
          Height = 11
          Caption = 'G'#233'n'#233'ral :'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LightComboCheck1: TLightComboCheck
          Left = 30
          Top = 190
          Width = 315
          Height = 16
          Checked = True
          DefaultValueChecked = 4
          DefaultValueUnchecked = 0
          PropertiesStored = False
          CheckVisible = False
          CheckedCaptionBold = False
          ShowCaptionHint = False
          AssignHint = False
          OptionValidValue.ValueOption = [vvoChecked, vvoUnchecked, vvoMissing, vvoUnknown, vvoOthers]
          Items.CaptionComplet = True
          Items.Separateur = ' '
          Items = <
            item
              Valeur = 0
              Caption = 'Jamais v'#233'rifier les mise '#224' jour'
              Visible = True
              Enabled = True
              SubItems.CaptionComplet = True
              SubItems.Separateur = ' '
              SubItems = <>
            end
            item
              Valeur = 1
              Caption = 'V'#233'rifier les mise '#224' jour '#224' chaque d'#233'marrage'
              Visible = True
              Enabled = True
              SubItems.CaptionComplet = True
              SubItems.Separateur = ' '
              SubItems = <>
            end
            item
              Valeur = 2
              Caption = 'V'#233'rifier les mise '#224' jour une fois par jour'
              Visible = True
              Enabled = True
              SubItems.CaptionComplet = True
              SubItems.Separateur = ' '
              SubItems = <>
            end
            item
              Valeur = 3
              Caption = 'V'#233'rifier les mise '#224' jour une fois par semaine'
              Visible = True
              Enabled = True
              SubItems.CaptionComplet = True
              SubItems.Separateur = ' '
              SubItems = <>
            end
            item
              Valeur = 4
              Caption = 'V'#233'rifier les mise '#224' jour une fois par mois'
              Visible = True
              Enabled = True
              SubItems.CaptionComplet = True
              SubItems.Separateur = ' '
              SubItems = <>
            end>
        end
        object LightComboCheck2: TLightComboCheck
          Left = 29
          Top = 117
          Width = 315
          Height = 16
          Checked = True
          DefaultValueChecked = 4
          DefaultValueUnchecked = 0
          PropertiesStored = False
          CheckVisible = False
          CheckedCaptionBold = False
          ShowCaptionHint = False
          AssignHint = False
          OptionValidValue.ValueOption = [vvoChecked, vvoUnchecked, vvoMissing, vvoUnknown, vvoOthers]
          Items.CaptionComplet = True
          Items.Separateur = ' '
          Items = <
            item
              Valeur = 0
              Caption = 'Album (Serie - Tome)'
              Visible = True
              Enabled = True
              SubItems.CaptionComplet = True
              SubItems.Separateur = ' '
              SubItems = <>
            end
            item
              Valeur = 1
              Caption = 'Tome - Album (Serie)'
              Visible = True
              Enabled = True
              SubItems.CaptionComplet = True
              SubItems.Separateur = ' '
              SubItems = <>
            end>
        end
        object Label3: TLabel
          Left = 16
          Top = 104
          Width = 189
          Height = 13
          Caption = 'Format d'#39'affichage des titres d'#39'albums :'
        end
        object OpenStart: TCheckBox
          Left = 15
          Top = 15
          Width = 210
          Height = 16
          Cursor = crHandPoint
          Caption = 'D'#233'marrer l'#39'application en mode Gestion'
          Checked = True
          Ctl3D = True
          ParentCtl3D = False
          State = cbChecked
          TabOrder = 0
        end
        object CheckBox3: TCheckBox
          Left = 15
          Top = 139
          Width = 201
          Height = 16
          Cursor = crHandPoint
          Caption = 'D'#233'corer les fen'#234'tres avec des images'
          Checked = True
          State = cbChecked
          TabOrder = 5
        end
        object CheckBox5: TCheckBox
          Left = 15
          Top = 86
          Width = 266
          Height = 16
          Cursor = crHandPoint
          Caption = 'Utiliser l'#39'anti-aliasing pour redimensionner les images'
          Checked = True
          State = cbChecked
          TabOrder = 4
        end
        object CheckBox6: TCheckBox
          Left = 15
          Top = 32
          Width = 266
          Height = 16
          Cursor = crHandPoint
          Caption = 'Avertir en cas de pr'#234't d'#39'une '#233'dition d'#233'j'#224' emprunt'#233'e'
          Checked = True
          State = cbChecked
          TabOrder = 1
        end
        object GrandesIconesMenu: TCheckBox
          Left = 15
          Top = 156
          Width = 170
          Height = 16
          Caption = 'Grandes icones dans les menus'
          Checked = True
          State = cbChecked
          TabOrder = 6
        end
        object GrandesIconesBarre: TCheckBox
          Left = 15
          Top = 173
          Width = 194
          Height = 16
          Caption = 'Grandes icones dans la barre d'#39'outils'
          Checked = True
          State = cbChecked
          TabOrder = 7
        end
        object CheckBox7: TCheckBox
          Left = 15
          Top = 49
          Width = 298
          Height = 16
          Cursor = crHandPoint
          Caption = 'Saisie d'#39'une s'#233'rie obligatoire pour les albums et les achats'
          Checked = True
          State = cbChecked
          TabOrder = 2
        end
        object CheckBox8: TCheckBox
          Left = 15
          Top = 66
          Width = 242
          Height = 16
          Cursor = crHandPoint
          Caption = 'Saisie d'#39'une s'#233'rie obligatoire pour les para-bd'
          Checked = True
          State = cbChecked
          TabOrder = 3
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Monnaies'
      ImageIndex = 2
      DesignSize = (
        352
        346)
      object Label8: TLabel
        Left = 24
        Top = 36
        Width = 318
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'Taux de conversions'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object SpeedButton1: TVDTButton
        Left = 12
        Top = 182
        Width = 55
        Height = 21
        Cursor = crHandPoint
        Caption = 'Nouveau'
        Flat = True
        OnClick = SpeedButton1Click
      end
      object SpeedButton2: TVDTButton
        Left = 122
        Top = 182
        Width = 55
        Height = 21
        Cursor = crHandPoint
        Caption = 'Supprimer'
        Flat = True
        OnClick = SpeedButton2Click
      end
      object SpeedButton3: TVDTButton
        Left = 67
        Top = 182
        Width = 55
        Height = 21
        Cursor = crHandPoint
        Caption = 'Modifier'
        Flat = True
        OnClick = SpeedButton3Click
      end
      object Label9: TLabel
        Left = 11
        Top = 10
        Width = 98
        Height = 13
        Alignment = taRightJustify
        Caption = 'Symbole mon'#233'taire :'
      end
      object Panel4: TPanel
        Left = 180
        Top = 179
        Width = 165
        Height = 90
        BevelOuter = bvNone
        Caption = ' '
        TabOrder = 2
        Visible = False
        object ComboBox2: TComboBox
          Left = 4
          Top = 3
          Width = 67
          Height = 21
          Cursor = crHandPoint
          BevelKind = bkTile
          Ctl3D = True
          ItemHeight = 0
          ParentCtl3D = False
          TabOrder = 0
          OnChange = ComboBox2Change
        end
        object ComboBox3: TComboBox
          Left = 93
          Top = 3
          Width = 67
          Height = 21
          Cursor = crHandPoint
          BevelKind = bkTile
          Ctl3D = True
          ItemHeight = 0
          ParentCtl3D = False
          TabOrder = 1
          OnChange = ComboBox2Change
        end
        object Panel6: TPanel
          Left = 4
          Top = 47
          Width = 157
          Height = 18
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = ' '
          TabOrder = 3
          object Label10: TLabel
            Left = 2
            Top = 2
            Width = 3
            Height = 13
            Align = alClient
          end
        end
        inline Frame12: TFrame1
          Left = 0
          Top = 67
          Width = 165
          Height = 23
          Align = alBottom
          TabOrder = 4
          inherited btnOK: TBitBtn
            Left = 24
            Width = 64
            Height = 19
            ModalResult = 0
            OnClick = Button2Click
          end
          inherited btnAnnuler: TBitBtn
            Left = 96
            Width = 64
            Height = 19
            ModalResult = 0
            OnClick = Button3Click
          end
        end
        object Edit1: TEditLabeled
          Left = 4
          Top = 27
          Width = 157
          Height = 18
          Hint = 'Prix unitaire d'#39'une cassette vierge de 120 minutes'
          BevelKind = bkTile
          BorderStyle = bsNone
          TabOrder = 2
          Text = '0,00'
          OnChange = ComboBox2Change
          OnExit = Edit1Exit
          OnKeyPress = calculKeyPress
          LinkControls = <>
          TypeDonnee = tdNumeric
          CurrencyChar = #0
        end
      end
      object ComboBox1: TComboBox
        Left = 110
        Top = 6
        Width = 67
        Height = 21
        Cursor = crHandPoint
        BevelKind = bkTile
        Ctl3D = True
        ItemHeight = 0
        ParentCtl3D = False
        TabOrder = 0
      end
      object ListView1: TVDTListView
        Left = 9
        Top = 56
        Width = 336
        Height = 121
        Anchors = [akLeft, akTop, akRight]
        BevelKind = bkTile
        BorderStyle = bsNone
        Columns = <
          item
            Width = 46
          end>
        ColumnClick = False
        HideSelection = False
        ReadOnly = True
        ShowColumnHeaders = False
        TabOrder = 1
        ViewStyle = vsReport
        OnDblClick = ListView1DblClick
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'Site web'
      ImageIndex = 4
      object GroupBox3: TGroupBox
        Left = 0
        Top = 0
        Width = 353
        Height = 129
        Caption = ' Site '
        TabOrder = 0
        object Label4: TLabel
          Left = 8
          Top = 16
          Width = 104
          Height = 13
          Caption = 'Adresse du site web :'
        end
        object Label5: TLabel
          Left = 8
          Top = 56
          Width = 78
          Height = 13
          Caption = 'Cl'#233' de s'#233'curit'#233' :'
        end
        object Label7: TLabel
          Left = 184
          Top = 56
          Width = 41
          Height = 13
          Caption = 'Mod'#232'le :'
        end
        object Label17: TLabel
          Left = 8
          Top = 100
          Width = 93
          Height = 13
          Caption = 'Taille des paquets :'
        end
        object Edit2: TEdit
          Left = 8
          Top = 32
          Width = 337
          Height = 21
          TabOrder = 0
          Text = 'http://bdtheque.tetram.org'
        end
        object Edit3: TEdit
          Left = 8
          Top = 72
          Width = 161
          Height = 21
          TabOrder = 1
          Text = 'blabla'
        end
        object ComboBox4: TComboBox
          Left = 184
          Top = 72
          Width = 161
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 2
        end
        object ComboBox6: TComboBox
          Left = 112
          Top = 96
          Width = 57
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 3
          Items.Strings = (
            '1024'
            '2048'
            '4096'
            '8192'
            '16384')
        end
      end
      object GroupBox4: TGroupBox
        Left = 0
        Top = 136
        Width = 353
        Height = 193
        Caption = ' Base de donn'#233'es '
        TabOrder = 1
        object Label6: TLabel
          Left = 8
          Top = 24
          Width = 81
          Height = 13
          Caption = 'Serveur MySQL :'
        end
        object Label12: TLabel
          Left = 8
          Top = 44
          Width = 44
          Height = 13
          Caption = 'Compte :'
        end
        object Label13: TLabel
          Left = 8
          Top = 112
          Width = 87
          Height = 13
          Caption = 'Pr'#233'fix des tables :'
        end
        object Label15: TLabel
          Left = 184
          Top = 44
          Width = 71
          Height = 13
          Caption = 'Mot de passe :'
        end
        object Label16: TLabel
          Left = 8
          Top = 88
          Width = 139
          Height = 13
          Caption = 'Nom de la base de donn'#233'es :'
        end
        object Edit4: TEdit
          Left = 96
          Top = 20
          Width = 249
          Height = 21
          TabOrder = 0
          Text = 'localhost'
        end
        object Edit5: TEdit
          Left = 8
          Top = 60
          Width = 161
          Height = 21
          TabOrder = 1
          Text = 'thierry.rl'
        end
        object Edit6: TEdit
          Left = 184
          Top = 108
          Width = 161
          Height = 21
          TabOrder = 4
          Text = 'bdt'
        end
        object Edit7: TEdit
          Left = 184
          Top = 60
          Width = 161
          Height = 21
          TabOrder = 2
          Text = '280776'
        end
        object Edit8: TEdit
          Left = 184
          Top = 84
          Width = 161
          Height = 21
          TabOrder = 3
          Text = 'bdtheque'
        end
        object RadioButton5: TRadioButton
          Left = 8
          Top = 144
          Width = 169
          Height = 17
          Caption = 'Mettre '#224' jour automatiquement'
          Checked = True
          TabOrder = 5
          TabStop = True
        end
        object RadioButton4: TRadioButton
          Left = 8
          Top = 168
          Width = 121
          Height = 17
          Caption = 'Maintenir '#224' la version'
          TabOrder = 6
        end
        object ComboBox5: TComboBox
          Left = 136
          Top = 166
          Width = 97
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 7
        end
        object Button1: TButton
          Left = 272
          Top = 160
          Width = 75
          Height = 25
          Caption = 'G'#233'n'#233'rer'
          TabOrder = 8
          OnClick = Button1Click
        end
      end
    end
  end
  inline Frame11: TFrame1
    Left = 0
    Top = 394
    Width = 360
    Height = 30
    Align = alBottom
    TabOrder = 1
    inherited btnOK: TBitBtn
      Left = 203
      Top = 6
      Width = 73
      Height = 19
      OnClick = btnOKClick
    end
    inherited btnAnnuler: TBitBtn
      Left = 284
      Top = 6
      Width = 71
      Height = 19
    end
  end
  object ImageList1: TImageList
    Height = 32
    Width = 32
    Left = 8
    Top = 57
    Bitmap = {
      494C010105000900040020002000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000800000006000000001001000000000000060
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
      000000000000000000000000000000000000007C007C007C007C007C007C007C
      007C007C007C007C007C007C007C007C007C007C007C007C007C007C007C007C
      007C007C007C007C007C007C007C007C007C0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000007CFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F186318631863186318631863186318631863
      18631863FF7FFF7FFF7FFF7FFF7FFF7F007C0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000007C1042FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F18631863186318631863186318631863186318631863
      1863186318631863FF7FFF7FFF7FFF7F007C0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000007C10421042FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7F18631000100010001F001000100010001863186318631863
      18631863186318631863FF7FFF7FFF7F007C0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000007C104210421042FF7FFF7FFF7F
      FF7FFF7FFF7F1000100010001000100010001000100010001000100018631863
      186318631863186318631863FF7FFF7F007C0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000007C1042104210421042FF7FFF7F
      FF7F100010001000100010001F0010001F0010001F0010001F0010001F001000
      1863186318631863186318631863FF7F007C0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000007C10421042104210421042FF7F
      1000100010001000100010001000004210001000100010001000100010001000
      1000186318631863186318631863FF7F007C0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000007C104210421042104210421000
      1F001000100010001F001000004200421F0010001F0010001F0010001F001000
      1F001000186318631863186318631863007C0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000007C104210421042104210001000
      100010001000100010001F000042004210001F001000100010001F0010001000
      10001F00100018631863186318631863007C0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000007C104210421042104210001000
      1F0010001F0010001F001000004200421F0010001F0010001F0010001F001000
      1F0010001F0018631863186318631863007C0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000007C104210421042100010001000
      1000100010001F00100000420042004210001F001F001F0010001F0010001F00
      10001F00100010001863186318631863007C0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000007C104210421042100010001000
      1F0010001F00100000420042004200421F0010001F0010001F0010001F001000
      1F0010001F0000421863186318631863007C0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000007C104210421000100010001000
      10001F0010001000004200420042004200421F001F001F001F001F0010001F00
      1F001F00100000420042186318631863007C0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000007C10421042100010001F001000
      1F0010001F0010000042004200420042004200421F0010001F0010001F001000
      1F0010001F0000420042186318631863007C0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000007C104210421000100010001000
      10001F00100000420042004200420042004200421F001F001F001F001F001F00
      1F001F00100000420042186318631863007C0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000007C104210421000100010001000
      1F0010001F000042004200420042004200421F001F0010001F001F001F001000
      1F0010001F0000420042186318631863007C0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000007C104210421000100010001000
      10001F001000004200420042004200421F001F001F001F001F001F001F001F00
      00420042004200420042186318631863007C0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000007C10421042100010001F001000
      1F0010001F000042004210001F0010001F0010001F001F001F001F001F001F00
      00420042004200420042186318631863007C0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000007C104210421000100010001000
      100010001000004200421F001F001F001F0000421F001F001F001F001F001F00
      0042004200420042004218631863FF7F007C0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000007C104210421042100010001000
      1F0010001F001000004200421F001000004200421F0010001F001F001F001000
      1F00004200420042186318631863FF7F007C0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000007C104210421042100010001000
      10000042100000420042004200420042004200421F001F001F001F001F001F00
      1F001F0010001F0018631863FF7FFF7F007C0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000007C104210421042104210001000
      1F000042004200420042004200420042004200421F0010001F0010001F001000
      004200421F0018631863FF7FFF7FFF7F007C0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000007C104210421042104210001000
      10000042004200420042004200420042004200421F001F001F001F001F001F00
      0042004210001863FF7FFF7FFF7FFF7F007C0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000007C104210421042104210421000
      1F000042004200420042004200420042004200421F0010001F0000421F001000
      00420042FF7FFF7FFF7FFF7FFF7FFF7F007C0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000007C104210421042104210421042
      10000042004200420042004200421F000042004200421F001F00004210000042
      0042FF7FFF7FFF7FFF7FFF7FFF7FFF7F007C0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000007C104210421042104210421042
      104210000042004200420042004210001F000042004200421F0010001F000042
      10421042FF7FFF7FFF7FFF7FFF7FFF7F007C0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000007C104210421042104210421042
      104210421042100010001000004200421000100010001F001000100010421042
      104210421042FF7FFF7FFF7FFF7FFF7F007C0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000007C104210421042104210421042
      1042104210421042104210001F0010001F0010001F0010001042104210421042
      1042104210421042FF7FFF7FFF7FFF7F007C0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000007C104210421042104210421042
      1042104210421042104210421042104210421042104210421042104210421042
      10421042104210421042FF7FFF7FFF7F007C0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000007C104210421042104210421042
      1042104210421042104210421042104210421042104210421042104210421042
      104210421042104210421042FF7FFF7F007C0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000007C104210421042104210421042
      1042104210421042104210421042104210421042104210421042104210421042
      1042104210421042104210421042FF7F007C0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000007C007C007C007C007C007C007C
      007C007C007C007C007C007C007C007C007C007C007C007C007C007C007C007C
      007C007C007C007C007C007C007C007C007C0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000042004200000000104210420000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000042E07F00001042104200001042
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000010421863104218631042
      1042104210421042186300000000000000000000104210421863104218631042
      1042104218631042104210420000000000000000000000000000000000000000
      000000000000000000000000000000000000E07FE07F18630000104200000000
      1042000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      E07F0042E07F0042E07F0042E07F00420042004200420000000000000000E07F
      E07F0042E07F0042000000000000000000000000104218631042186310421863
      1042186310421863104218631042000000001042104210421042186310421042
      1042186310421042104218631042000000000000000000000000000000000000
      000000000000000000000000004200000000E07F000000000000104200000000
      0000104200000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E07F0042E07F
      0042E07F0042E07F0042004200420042004200420042000000420000E07FE07F
      004200420000004200420000000000000000000018631042FF7F104218631042
      186310421863FF7F1863104218630000000010421863104218631042FF7F1042
      1863104218631042FF7F10421042000000000000000000000000000000000000
      0000000000000000000000420042000000001042000000001042000010420000
      0000000010420000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000042004200420042
      0000000000000000000000000000000000000000000000420000E07FE07F0000
      E07F0042E07F0042004200420000000000000000FF7F1863104218631042FF7F
      104218631042186310421863000000000000FF7F104218631042186310421863
      1042186310421863104218631042000000000000000000000000000000000000
      000000000000000000000042E07F000010420000000010420000000000001042
      0000000000001042000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000042004200420042
      E07F1863E07F1863004218630042004200420042000000420042E07FE07FE07F
      E07F004200420042004200420000000000000000FF7FFF7F18631042FF7F1042
      18631042FF7F104218631042186300000000FF7FFF7F1042FF7F1042FF7F1042
      FF7FFF7F18631042186310421863000000000000000000000000000000000000
      00000000000000000000E07FE07F186300000000104200000000000000000000
      1042000000000000104200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000004200420042
      0042004200420042004200420042004200420000E07F0042E07F0042E07FE07F
      00420042E07F0042E07F0042E07F0000000000001863FF7F1042FF7F1042FF7F
      FF7FFF7F104218631042186300000000000018631042FF7F104218631042FF7F
      1042FF7F1042FF7F104218631042000000000000000000000000000000000000
      00000000004200000000E07F0000000000001042000000000000000000000000
      0000104200000000000010420000000000001002100210001000100010001000
      1000100010001000100010001000100010001000100010001000100010001000
      10001000100010001000100010000000000000000000000000000000E07F0042
      E07F0042E07F0042004200420042004200420000E07F0042E07F00420042E07F
      0042E07FE07FE07F00420042004200000000000000001863FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7F186318630000104210420000186318631863FF7FFF7FFF7F
      FF7F1863FF7FFF7F1863FF7F0000000000000000000000000000000000000000
      0000004200420000000010420000000010420000000000000000000000000000
      0000000010420000000000001042000000001002FF0310021002100210021002
      1002100210021002100210021002100210021002100210021002100210021002
      10021002100210021002100210000000000000000000E07F0042E07F0042E07F
      0042E07F0042E07F004200420042004200420000E07F0042E07F004200420042
      E07FE07FE07F004200420042E07F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000042E07F0000104200000000104200000000000000000000000000000000
      0000000000001042000000001042000000001002000010021002000000000000
      1002000000000000100200000000000010020000000000001002000000000000
      0000000000000000100210021000000000000000004200420042004200000000
      0000000000000000000000000000000000000000E07F0042E07F00420042E07F
      E07FE07FE07FE07F0042E07F0042000000000000104200001042000000000000
      1042104218630000104210421863104210420000000000001042104218631042
      1863104210420000104210421042000000000000000000000000000000000000
      0000E07FE07F1863000000001042000000000000000000000000000000000000
      0000000000000000104200001042000000001002FF0310021002000018630000
      1002000018630000100200001863000010020000186300001002000018631863
      1863186318630000100210021000000000000000004200000000000000000000
      E07F0042E07F0042E07F00420042004200420000E07F0042E07F004200420042
      E07FE07F0000E07F00420042E07F000000000000104218631042104200001042
      1042186310421042104210421042186310421042000010421042186310421863
      1042186310421863104210421042186300000000000000000000000000420000
      0000E07F00000000000010420000000000000000000000000000000000001042
      0000000000000000000010421042000000001002000010021002000000000000
      1002000000000000100200000000000010020000000000001002000000000000
      0000000000000000100210021000000000000000000000420000E07F0042E07F
      0042E07F0042E07F0042E07F0042004200420000E07F0042E07F004200420042
      E07FE07FE07FE07F0042E07F004200000000000018631042FF7F10420000FF7F
      18631042104210421863104218631042186310420000186318631042FF7F1042
      1863104218631042186310421863104200000000000000000000004200420000
      0000104200000000104200000000000000000000000000000000000010420000
      0000000000000000000018630000004200421002FF0310021002100210021002
      1002100210021002100210021002100210021002100210021002100210021002
      1002100210021002100210021000000000000000004200000042004200420042
      0042004200420042004200420042004200420000E07F00420042004200420042
      E07FE07FE07F0042E07F0042E07F000000000000FF7FFF7F104218630000FF7F
      104218631042FF7F1042186310421863104218630000FF7F1042186310421042
      10421863104218631042104210421042000000000000000000000042E07F0000
      1042000000001042000000000000000000000000000000000000000000000000
      0000000000000000186300000000004200421002000010021002000000000000
      1002000000000000100200000000000010020000000000001002000000000000
      1002000000000000100210021000000000000000000000000042000000000000
      E07F186318631863004218630042186300420000E07FE07F0042004200420042
      0042004200420042E07FE07F000000000000000018631863186310420000FF7F
      FF7F186318631042FF7F104218631042FF7F10420000FF7FFF7F1042FF7F1042
      FF7F10421042104218631042FF7F186300000000000000000000E07FE07F1863
      0000000010420000000000000000000000000000000000000000000000000000
      00000000000018630000E07FE07FE07FE07F1002FF0310021002000018630000
      1002000018630000100200001863000010020000186300001002000018630000
      1002000018630000100210021000000000000000000000000000004200420042
      00420000000000000000000000000000000000000000E07F00420042E07F0042
      004200420042E07FE07F00420000000000000000FF7FFF7F1042186300001863
      1863FF7F104218631863FF7F1042FF7F1042186300001863FF7F18631042FF7F
      1042FF7F10421863186318631863104200000000004200000000E07F00000000
      0000104200000000000000000000000000000000000010420000000000000000
      000000001863000000000000E07FE07F00001002000010021002000000000000
      1002000000000000100200000000000010020000000000001002000000000000
      1002000000000000100210021000000000000000000000000042004200000000
      0000E07F0042E07F0042E07F0042E07F0042E07F0000E07FE07F004200420042
      00420000E07FE07FE07F000000000000000000001863FF7F1863000010420000
      1863FF7FFF7FFF7FFF7F1863FF7FFF7F1863000010420000FF7FFF7FFF7FFF7F
      FF7FFF7F18631042186310421042000000000042004200000000104200000000
      1042000000000000000000000000000010420000104200000000000000000000
      0000186300000042004200000000000000001002FF0310021002100210021002
      1002100210021002100210021002100210021002100210021002100210021002
      10021002100210021002100210000000000000000000000000000000E07F0042
      E07F0042E07F0042E07F0042E07F0042E07F0042E07F0000E07FE07F00420042
      E07F0042E07FE07F000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000042E07F00001042000000001042
      0000000000000000000000000000104200001042000000000000000000000000
      1863000000000042004200000000000000001002000010021002000000000000
      1002000000000000100200000000000010020000000000001002000000000000
      1002000000000000100210021000000000000000000000000000004200420042
      00420042004200420042004200420042004200420042004200000000E07F0042
      0042004200420000000000000000000000000000000010421042000018631042
      1863104218630000000000001042000018630000186300001863000000000000
      104210421863104210421042104210420000E07FE07F18630000000010420000
      0000000000000000000000001042000010420000000000000000000000001863
      0000E07FE07FE07FE07F00000000000000001002FF0310021002000018630000
      1002000018630000100200001863000010020000186300001002000018630000
      1002000018630000100210021000000000000000000000000000004200000000
      0000E07FE07FE07F186300421863004218630042186300420000000000000042
      0000000000000000000000000000000000000000104200000000186310421863
      1042186310421863104218630000186310421863104218631042186300001042
      104218631042186310421863104218630000E07F000000000000104200000000
      0000000000000000000000000000104200000000000000000000000018630000
      00000000E07FE07F000000000000000000001002000010021002000000000000
      1002000000000000100200000000000010020000000000001002000000000000
      1002000000000000100210021000000000000000000000000000000000420042
      0042004200421863000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000186310420000186318631042
      1863104218631042FF7F104200001863FF7F1042186310421863000000001863
      1863104218631042186310421863104200001042000000001042000000000000
      0000000000000000000000001042000000000000000000000000186300000042
      0042000000000000000000000000000000001002FF0310021002100210021002
      1002100210021002100210021002100210021002100210021002100210021002
      1002100210021002100210021000000000000000000000000000004200420042
      1863000000000000E07F0042E07F0042E07F0042E07F0042E07F0042E07F0000
      0000000000000000000000000000000000000000104218630000FF7F1042FF7F
      1042FF7FFF7FFF7F10421863000018631042FF7F1863FF7F104218630000FF7F
      1042FF7F1042FF7F104218631042186300001042000010420000000000000000
      0000104210421042000000000000000000000000000000001863000000000042
      0042000000000000000000000000000000001002000010021002000018631863
      1863186318631863186318631863186318631863186318631002100210021002
      1002100210021002100210021000000000000000000000000000000000420042
      0000E07F0042E07F0042E07F0042E07F0042E07F0042E07F0042E07F0042E07F
      0042004200000000000000000000000000000000186300000000FF7FFF7F1042
      1863104210421042186310420000FF7F18631042FF7F1042186300000000FF7F
      FF7F104218631042FF7F10421863104200001863104200000000000000000000
      1042000010420000104200000000000000000000000018630000E07FE07FE07F
      E07F000000000000000000000000000000001002FF0310021002000000000000
      0000000000000000000000000000000000000000000018631002100210021002
      1002100210021002100210021000000000000000000000000000000000000000
      0042004200420042FF7FFF7FFF7FFF7FFF7FFF7F004200420042004200420042
      004200420042000000000000000000000000000018630000000018631863FF7F
      FF7FFF7F10421863104218630000FF7F1042FF7F10421863186318630000FF7F
      1863FF7F10421863104218631042186300000000186300000000000000000000
      10421042104210421042000000000000000000001863000000000000E07FE07F
      0000000000000000000000000000000000001002000010021002000018631863
      1863186318631863186318631863186318631863186318631002100210021002
      1002100210021002100210021000000000000000000000000000000000000000
      0042000018631863E07FE07FE07FE07F0042E07F0042E07F0042E07F00420000
      00000000004200000000000000000000000000000000104210420000FF7FFF7F
      FF7FFF7FFF7F186318630000104200001863FF7FFF7F18631863000010420000
      FF7FFF7FFF7FFF7F1863FF7F1863000000000000000018630000000000000000
      1042000010420000104200000000000000001863000000420042000000000000
      0000000000000000000000000000000000001002FF0310021002000000000000
      0000000000000000000000000000000000000000000000001002100210021002
      1002100210021002100210021000000000000000000000000000000000000000
      000000420042004200420042E07FE07FE07FE07FE07F0042E07F0042E07F0042
      0042004200000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001863000000000000
      0000104210421042000000000000000018630000000000420042000000000000
      00000000000000000000000000000000000010020000FF030000FF030000FF03
      0000FF030000FF030000FF030000FF030000FF030000FF030000FF030000FF03
      0000FF030000FF030000FF031000000000000000000000000000000000000000
      004200420042E07F0042E07F0042E07FE07FE07FE07FE07F0042E07F0042E07F
      0042004200420000000000000000000000000000000010421042104210421042
      1863104210420000000010421863104218631042104210421863104210420000
      1042104200001042104210421042000000000000000000000000186300000000
      000000000000000000000000000018630000E07FE07FE07FE07F000000000000
      0000000000000000000000000000000000000000100210021002100210021002
      1002100210021002100210021002100210021002100210021002100210021002
      1002100210021002100210021002000000000000000000000000000000000000
      0000004200420042E07F0042E07FE07FE07FE07FE07FE07FE07F004200420042
      0042004200000000000000000000000000000000104210421042186310421863
      1042186310420000104218631042186310421863104218631042186310421042
      0000000010421863104218631042186300000000000000000000000018630000
      0000000000000000000000001863000000000000E07FE07F0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000042E07F0042E07F0042E07FFF7FFF7FFF7FFF7FE07F0000
      000000000000000000000000000000000000000010421042FF7F104218631863
      FF7F104218630000FF7F1042FF7F1042FF7FFF7FFF7F1042FF7F104218631042
      0000000018631042186310421863104200000000000000000000000000001863
      0000000000000000000018630000004200420000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000001863FF7F1042FF7FFF7F1863
      1042FF7F10420000FF7FFF7F104218631863FF7F1042FF7F1042FF7F10421863
      00000000FF7FFF7F1863FF7F1042186300000000000000000000000000000000
      1863000000000000186300000000004200420000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF7FFF7F18631042FF7F1042
      FF7F104218630000FF7FFF7FFF7F10421863104218631042FF7F104218631042
      00000000FF7F1042FF7F10421863104200000000000000000000000000000000
      00001863000018630000E07FE07FE07FE07F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7F1863186310421863
      1863FF7F00000000186318631042FF7F18631863104218631042186310421863
      000000001863FF7F1042FF7F0000000000000000000000000000000000000000
      000000001863000000000000E07FE07F00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000080000000600000000100010000000000000600000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
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
      00000000000000000000000000000000FFFF33FFFFFFFFFFFFFFFFFF80070003
      FFFF21FFFFFFFFFFFE003C1F00000003FFFF00FFFFFFFFFFF000000F00000001
      FFFB007FFFFFFFFFE000000700000001FFF3003FFFFFFFFFC000000300000001
      FFF2001FFFFFFFFFC000000300000001FFF0000F80000003C000000100000001
      FFB0000700000001C000000180000003FF300003000000018000000180000001
      FF200003400000010000000100000000FF000003088888010000000100000000
      FB0000034CCCCFC10000000100000000F3000000000000010000000100000000
      F2000000400000018000000300000000F000001008888881C000000300000000
      B00000394CCCCCC1C0000007000000013000000F00000001E000000F80000001
      2000000F40000001E000001F800000000000010F08888881E00000FF00000000
      0000039F4CCCCCC1E00000FF00000000000000FF00000001E000007F00000000
      000000FF40000001F000003F00000000000010FF07FFC001F800001F00000000
      800039FF40000001FC00001F80000000C0000FFF00000001FC00001F80000001
      E0000FFF55555551FC00001F80000000F0010FFF80000003FE00003F00000000
      F8039FFFFFFFFFFFFF00007F00000000FC00FFFFFFFFFFFFFFE003FF00000000
      FE00FFFFFFFFFFFFFFFFFFFF00000000FF10FFFFFFFFFFFFFFFFFFFF80000001
      FFB9FFFFFFFFFFFFFFFFFFFFC060018300000000000000000000000000000000
      000000000000}
  end
  object BrowseDirectoryDlg1: TBrowseDirectoryDlg
    Title = 'S'#233'lectionnez le r'#233'pertoire contenant les affiches'
    Options = [bfDirectoriesOnly]
    Caption = 'Affiches'
    ShowSelectionInStatus = True
    Left = 8
    Top = 92
  end
  object BrowseDirectoryDlg2: TBrowseDirectoryDlg
    Title = 'S'#233'lectionnez un r'#233'pertoire dans lequel cr'#233'er le site web'
    Options = [bfDirectoriesOnly]
    Caption = 'Sauvegarder le site web'
    ShowSelectionInStatus = True
    Left = 8
    Top = 124
  end
  object ZipMaster1: TZipMaster
    AddOptions = []
    AddStoreSuffixes = [assGIF, assPNG, assZ, assZIP, assZOO, assARC, assLZH, assARJ, assTAZ, assTGZ, assLHA, assRAR, assACE, assCAB, assGZ, assGZIP, assJAR, assEXE, assJPG, assJPEG, ass7Zp, assMP3, assWMV, assWMA, assDVR, assAVI]
    Dll_Load = False
    ExtrOptions = [ExtrDirNames, ExtrOverWrite, ExtrForceDirs]
    KeepFreeOnAllDisks = 0
    KeepFreeOnDisk1 = 0
    Language = 'fr'
    MaxVolumeSize = 0
    PasswordReqCount = 1
    SFXOptions = []
    SFXOverWriteMode = OvrConfirm
    SFXPath = 'DZSFXUS.bin'
    SpanOptions = []
    Trace = False
    Unattended = False
    Verbose = False
    Version = '1.79.08.07'
    VersionInfo = '1.79.08.07'
    Left = 12
    Top = 156
  end
end
