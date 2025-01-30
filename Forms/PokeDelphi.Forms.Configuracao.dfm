object frmConfiguracao: TfrmConfiguracao
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Configura'#231#245'es'
  ClientHeight = 90
  ClientWidth = 237
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 15
  object gbxConfiguracao: TGroupBox
    Left = 8
    Top = 8
    Width = 221
    Height = 49
    TabOrder = 0
    object lblLinguagem: TLabel
      Left = 8
      Top = 16
      Width = 63
      Height = 15
      Caption = 'Linguagem:'
    end
    object cbxLinguagem: TComboBox
      Left = 77
      Top = 13
      Width = 132
      Height = 23
      Style = csDropDownList
      TabOrder = 0
    end
  end
  object btnGravar: TButton
    Left = 154
    Top = 63
    Width = 75
    Height = 25
    Caption = '&Gravar'
    TabOrder = 1
    OnClick = btnGravarClick
  end
end
