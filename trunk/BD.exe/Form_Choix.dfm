object FrmChoix: TFrmChoix
  Left = 303
  Top = 190
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Gestion BDth'#232'que'
  ClientHeight = 105
  ClientWidth = 128
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 7
    Top = 3
    Width = 113
    Height = 62
    Shape = bsFrame
  end
  object Bevel2: TBevel
    Left = 7
    Top = 70
    Width = 113
    Height = 32
    Shape = bsFrame
  end
  object BtnChoix1: TButton
    Left = 22
    Top = 7
    Width = 83
    Height = 24
    Cursor = crHandPoint
    Caption = 'BtnChoix1'
    ModalResult = 6
    TabOrder = 0
  end
  object BtnChoix2: TButton
    Left = 22
    Top = 37
    Width = 83
    Height = 23
    Cursor = crHandPoint
    Caption = 'BtnChoix2'
    ModalResult = 7
    TabOrder = 1
  end
  object BtnAnnuler: TButton
    Left = 22
    Top = 74
    Width = 83
    Height = 24
    Cursor = crHandPoint
    Hint = 'Annule l'#39'action demand'#233'e'
    Caption = 'Annuler'
    ModalResult = 2
    TabOrder = 2
  end
end
