object FrmConvers: TFrmConvers
  Left = 472
  Top = 177
  BorderStyle = bsNone
  Caption = 'FrmConvers'
  ClientHeight = 72
  ClientWidth = 189
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 189
    Height = 72
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Caption = ' '
    TabOrder = 0
    inline Frame11: TframBoutons
      Left = 2
      Top = 46
      Width = 185
      Height = 24
      Align = alBottom
      TabOrder = 0
      ExplicitLeft = 2
      ExplicitTop = 46
      ExplicitWidth = 185
      ExplicitHeight = 24
      inherited btnOK: TButton
        Left = 54
        Width = 54
        Height = 19
        ExplicitLeft = 54
        ExplicitWidth = 54
        ExplicitHeight = 19
      end
      inherited btnAnnuler: TButton
        Left = 112
        Width = 68
        Height = 19
        ExplicitLeft = 112
        ExplicitWidth = 68
        ExplicitHeight = 19
      end
    end
  end
end