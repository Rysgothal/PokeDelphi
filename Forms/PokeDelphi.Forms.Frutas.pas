unit PokeDelphi.Forms.Frutas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, PokeDelphi.Classes.JSON.SaboresFrutas.Sabores,
  PokeDelphi.Helpers.Enums, PokeDelphi.Classes.API.Frutas, Vcl.Mask;

type
  TfrmFrutas = class(TForm)
    btnAnterior: TButton;
    btnPrimeiroRegistro: TButton;
    btnProximo: TButton;
    btnUltimoRegistro: TButton;
    pnlDetalhes: TPanel;
    lblNome: TLabel;
    lblNomeValor: TLabel;
    lblCodigo: TLabel;
    bvlImagem: TBevel;
    imgFruta: TImage;
    lblTamanho: TLabel;
    lblTamanhoValor: TLabel;
    gbxDomNatural: TGroupBox;
    edtTipoDomNatural: TLabeledEdit;
    edtForcaDomNatural: TLabeledEdit;
    gbxPropriedades: TGroupBox;
    lblTempoCrescimento: TLabel;
    lblTempoCrescimentoValor: TLabel;
    lblColheitaMaxima: TLabel;
    lblColheitaMaximaValor: TLabel;
    lblSuavidade: TLabel;
    lblSuavidadeValor: TLabel;
    lblAridezSolo: TLabel;
    lblAridezSoloValor: TLabel;
    lblFirmeza: TLabel;
    lblFirmezaValor: TLabel;
    pnlSabores: TPanel;
    lblSabor: TLabel;
    lblSaborValor: TLabel;
    lblPotencia: TLabel;
    btnProximoPokemon: TButton;
    btnAnteriorPokemon: TButton;
    lblPotenciaValor: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnPrimeiroRegistroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnUltimoRegistroClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnAnteriorPokemonClick(Sender: TObject);
    procedure btnProximoPokemonClick(Sender: TObject);
  private
    { Private declarations }
    FIndexSabores: Integer;
    procedure ObterDetalheFruta(pAcao: TAcaoBarraNavegacao);
    procedure ObterDetalheSabor(const pSabores: TArray<TJSONSabores>);
    procedure AlimentarComponentes(const pAPI: TPokeAPIFrutas);
    procedure ObterSabor(pAcao: TAcaoBarraNavegacao);
  public
    { Public declarations }
  end;

var
  frmFrutas: TfrmFrutas;

implementation

uses
  PokeDelphi.Classes.JSON.Frutas.Detalhe, PokeDelphi.Helpers.Imagem, PokeDelphi.Helpers.JSON;

{$R *.dfm}

procedure TfrmFrutas.AlimentarComponentes(const pAPI: TPokeAPIFrutas);
var
  lJSON: TJSONFrutaDetalhe;
begin
  lJSON := pAPI.JSON.ToJSONBerry;

  try
    FIndexSabores := 0;
    lblCodigo.Caption := lJSON.ID.ToString.PadLeft(3, '0');
    lblNomeValor.Caption := lJSON.Nome.ToUpper;
    imgFruta.CarregarImagemURL(pAPI.Imagem);
    lblTamanhoValor.Caption := lJSON.Tamanho.ToString.PadLeft(4, '0');
    edtTipoDomNatural.Text := lJSON.TipoDomNatural.Nome.ToUpper;
    edtForcaDomNatural.Text := lJSON.PoderDomNatural.ToString.PadLeft(4, '0');
    lblTempoCrescimentoValor.Caption := lJSON.TempoCrescimento.ToString.PadLeft(4, '0');
    lblColheitaMaximaValor.Caption := lJSON.ColheitaMaxima.ToString.PadLeft(4, '0');
    lblSuavidadeValor.Caption := lJSON.Suavidade.ToString.PadLeft(4, '0');
    lblAridezSoloValor.Caption := lJSON.AridezSolo.ToString.PadLeft(4, '0');
    lblFirmezaValor.Caption := lJSON.FirmezaFruta.Nome.ToUpper;

    ObterDetalheSabor(lJSON.Sabores);
  finally
    FreeAndNil(lJSON);
  end;
end;

procedure TfrmFrutas.btnAnteriorClick(Sender: TObject);
begin
  ObterDetalheFruta(anAnterior);
end;

procedure TfrmFrutas.btnAnteriorPokemonClick(Sender: TObject);
begin
  ObterSabor(anAnterior);
end;

procedure TfrmFrutas.btnPrimeiroRegistroClick(Sender: TObject);
begin
  ObterDetalheFruta(anPrimeiro);
end;

procedure TfrmFrutas.btnProximoClick(Sender: TObject);
begin
  ObterDetalheFruta(anProximo);
end;

procedure TfrmFrutas.btnProximoPokemonClick(Sender: TObject);
begin
  ObterSabor(anProximo);
end;

procedure TfrmFrutas.btnUltimoRegistroClick(Sender: TObject);
begin
  ObterDetalheFruta(anUltimo);
end;

procedure TfrmFrutas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(frmFrutas);
end;

procedure TfrmFrutas.FormCreate(Sender: TObject);
begin
  ObterDetalheFruta(anPrimeiro);
end;

procedure TfrmFrutas.ObterDetalheFruta(pAcao: TAcaoBarraNavegacao);
var
  lAPIFrutas: TPokeAPIFrutas;
begin
  lAPIFrutas := TPokeAPIFrutas.ObterInstancia;

  case pAcao of
    anNenhum: Exit;
    anPrimeiro: lAPIFrutas.ObterPrimeiro;
    anAnterior: lAPIFrutas.ObterAnterior;
    anProximo: lAPIFrutas.ObterProximo;
    anUltimo: lAPIFrutas.ObterUltimo;
  end;

  AlimentarComponentes(lAPIFrutas);
end;

procedure TfrmFrutas.ObterDetalheSabor(const pSabores: TArray<TJSONSabores>);
begin
  lblSaborValor.Caption := pSabores[FIndexSabores].Sabores.Nome.ToUpper;
  lblPotenciaValor.Caption := pSabores[FIndexSabores].Potencia.ToString.PadLeft(3, '0');
end;

procedure TfrmFrutas.ObterSabor(pAcao: TAcaoBarraNavegacao);
var
  lJSON: TJSONFrutaDetalhe;
begin
  lJSON := TPokeAPIFrutas.ObterInstancia.JSON.ToJSONBerry;

  try
    if (pAcao = anProximo) and (Succ(FIndexSabores) > Pred(Length(lJSON.Sabores))) then
    begin
      Exit;
    end;

    if (pAcao = anAnterior) and (Pred(FIndexSabores) < 0) then
    begin
      Exit;
    end;

    case pAcao of
      anProximo: Inc(FIndexSabores);
      anAnterior: Dec(FIndexSabores);
      else Exit;
    end;

    ObterDetalheSabor(lJSON.Sabores);
  finally
    FreeAndNil(lJSON);
  end;
end;

end.
