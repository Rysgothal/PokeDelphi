object frmFrutas: TfrmFrutas
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Frutas'
  ClientHeight = 137
  ClientWidth = 299
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
  object btnAnterior: TButton
    Left = 135
    Top = 112
    Width = 33
    Height = 25
    Margins.Left = 20
    Margins.Top = 20
    Margins.Right = 20
    Margins.Bottom = 20
    Caption = #231
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 20
    Font.Name = 'Wingdings'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = btnAnteriorClick
  end
  object btnPrimeiroRegistro: TButton
    Left = 103
    Top = 112
    Width = 33
    Height = 25
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Caption = #235
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 20
    Font.Name = 'Wingdings'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = btnPrimeiroRegistroClick
  end
  object btnProximo: TButton
    Left = 167
    Top = 112
    Width = 33
    Height = 25
    Margins.Left = 20
    Margins.Top = 20
    Margins.Right = 20
    Margins.Bottom = 20
    Caption = #232
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 20
    Font.Name = 'Wingdings'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = btnProximoClick
  end
  object btnUltimoRegistro: TButton
    Left = 199
    Top = 112
    Width = 33
    Height = 25
    Margins.Left = 20
    Margins.Top = 20
    Margins.Right = 20
    Margins.Bottom = 20
    Caption = #238
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 20
    Font.Name = 'Wingdings'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = btnUltimoRegistroClick
  end
  object pnlDetalhes: TPanel
    Left = 0
    Top = 0
    Width = 278
    Height = 89
    BevelInner = bvLowered
    TabOrder = 4
    object lblNome: TLabel
      Left = 48
      Top = 8
      Width = 36
      Height = 15
      Caption = 'Nome:'
    end
    object lblNomeValor: TLabel
      Left = 90
      Top = 8
      Width = 30
      Height = 15
      Caption = 'Teste'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblCodigo: TLabel
      Left = 253
      Top = 8
      Width = 18
      Height = 15
      Alignment = taRightJustify
      Caption = '000'
    end
    object Bevel2: TBevel
      Left = 6
      Top = 6
      Width = 33
      Height = 32
      Shape = bsFrame
    end
    object imgFruta: TImage
      Left = 6
      Top = 6
      Width = 33
      Height = 32
      Center = True
      Proportional = True
    end
    object lblTamanho: TLabel
      Left = 48
      Top = 23
      Width = 53
      Height = 15
      Caption = 'Tamanho:'
    end
    object lblTamanhoValor: TLabel
      Left = 107
      Top = 23
      Width = 12
      Height = 15
      Caption = '00'
    end
  end
end
