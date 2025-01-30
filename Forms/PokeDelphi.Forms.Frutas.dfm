object frmFrutas: TfrmFrutas
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Frutas'
  ClientHeight = 180
  ClientWidth = 462
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
    Left = 206
    Top = 152
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
    Left = 174
    Top = 152
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
    Left = 238
    Top = 152
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
    Left = 270
    Top = 152
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
    Left = -3
    Top = 0
    Width = 457
    Height = 137
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
      Left = 86
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
      Left = 223
      Top = 8
      Width = 18
      Height = 15
      Alignment = taRightJustify
      Caption = '000'
    end
    object bvlImagem: TBevel
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
      Left = 105
      Top = 23
      Width = 14
      Height = 15
      Caption = '00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object gbxDomNatural: TGroupBox
      Left = 6
      Top = 38
      Width = 235
      Height = 53
      Caption = 'Dom Natural: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object edtTipoDomNatural: TLabeledEdit
        Left = 42
        Top = 19
        Width = 87
        Height = 23
        Alignment = taCenter
        Color = clBtnFace
        EditLabel.Width = 30
        EditLabel.Height = 15
        EditLabel.Caption = 'Tipo: '
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -12
        EditLabel.Font.Name = 'Segoe UI'
        EditLabel.Font.Style = []
        EditLabel.ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        LabelPosition = lpLeft
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        Text = ''
      end
      object edtForcaDomNatural: TLabeledEdit
        Left = 184
        Top = 19
        Width = 38
        Height = 23
        Alignment = taCenter
        Color = clBtnFace
        EditLabel.Width = 37
        EditLabel.Height = 15
        EditLabel.Caption = 'Poder: '
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -12
        EditLabel.Font.Name = 'Segoe UI'
        EditLabel.Font.Style = []
        EditLabel.ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        LabelPosition = lpLeft
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        Text = ''
      end
    end
    object gbxPropriedades: TGroupBox
      Left = 247
      Top = 8
      Width = 202
      Height = 121
      Caption = 'Propriedades: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object lblTempoCrescimento: TLabel
        Left = 11
        Top = 17
        Width = 127
        Height = 15
        Caption = 'Tempo de crescimento: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object lblTempoCrescimentoValor: TLabel
        Left = 181
        Top = 17
        Width = 14
        Height = 15
        Alignment = taRightJustify
        Caption = '00'
      end
      object lblColheitaMaxima: TLabel
        Left = 11
        Top = 37
        Width = 92
        Height = 15
        Caption = 'Colheita m'#225'xima:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object lblColheitaMaximaValor: TLabel
        Left = 181
        Top = 37
        Width = 14
        Height = 15
        Alignment = taRightJustify
        Caption = '00'
      end
      object lblSuavidade: TLabel
        Left = 11
        Top = 57
        Width = 57
        Height = 15
        Caption = 'Suavidade:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object lblSuavidadeValor: TLabel
        Left = 181
        Top = 57
        Width = 14
        Height = 15
        Alignment = taRightJustify
        Caption = '00'
      end
      object lblAridezSolo: TLabel
        Left = 11
        Top = 77
        Width = 78
        Height = 15
        Caption = 'Aridez do solo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object lblAridezSoloValor: TLabel
        Left = 181
        Top = 77
        Width = 14
        Height = 15
        Alignment = taRightJustify
        Caption = '00'
      end
      object lblFirmeza: TLabel
        Left = 11
        Top = 97
        Width = 44
        Height = 15
        Caption = 'Firmeza:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object lblFirmezaValor: TLabel
        Left = 162
        Top = 97
        Width = 33
        Height = 15
        Alignment = taRightJustify
        Caption = 'TESTE'
      end
    end
    object pnlSabores: TPanel
      Left = 6
      Top = 93
      Width = 236
      Height = 36
      BevelKind = bkSoft
      TabOrder = 2
      object lblSabor: TLabel
        Left = 8
        Top = 7
        Width = 33
        Height = 15
        Caption = 'Sabor:'
      end
      object lblSaborValor: TLabel
        Left = 47
        Top = 7
        Width = 33
        Height = 15
        Caption = 'TESTE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblPotencia: TLabel
        Left = 126
        Top = 7
        Width = 49
        Height = 15
        Alignment = taRightJustify
        Caption = 'Pot'#234'ncia:'
      end
      object lblPotenciaValor: TLabel
        Left = 177
        Top = 7
        Width = 21
        Height = 15
        Alignment = taRightJustify
        Caption = '000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnProximoPokemon: TButton
        Left = 206
        Top = 14
        Width = 24
        Height = 17
        Margins.Left = 20
        Margins.Top = 20
        Margins.Right = 20
        Margins.Bottom = 20
        Caption = #242
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = 15
        Font.Name = 'Wingdings'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = btnProximoPokemonClick
      end
      object btnAnteriorPokemon: TButton
        Left = 206
        Top = -1
        Width = 24
        Height = 17
        Margins.Left = 20
        Margins.Top = 20
        Margins.Right = 20
        Margins.Bottom = 20
        Caption = #241
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = 15
        Font.Name = 'Wingdings'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = btnAnteriorPokemonClick
      end
    end
  end
end
