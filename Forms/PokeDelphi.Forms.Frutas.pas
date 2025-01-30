unit PokeDelphi.Forms.Frutas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  PokeDelphi.Helpers.Enums, PokeDelphi.Classes.API.Frutas;

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
    Bevel2: TBevel;
    imgFruta: TImage;
    lblTamanho: TLabel;
    lblTamanhoValor: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnPrimeiroRegistroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnUltimoRegistroClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
  private
    { Private declarations }
    procedure ObterDetalheFruta(pAcao: TAcaoBarraNavegacao);
    procedure AlimentarComponentes(const pAPI: TPokeAPIFrutas);
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
    lblCodigo.Caption := lJSON.ID.ToString.PadLeft(3, '0');
    lblNomeValor.Caption := lJSON.Nome.ToUpper;
    imgFruta.CarregarImagemURL(pAPI.Imagem);
    lblTamanhoValor.Caption := lJSON.Tamanho.ToString.PadLeft(2, '0');
  finally
    FreeAndNil(lJSON);
  end;
end;

procedure TfrmFrutas.btnAnteriorClick(Sender: TObject);
begin
  ObterDetalheFruta(anAnterior);
end;

procedure TfrmFrutas.btnPrimeiroRegistroClick(Sender: TObject);
begin
  ObterDetalheFruta(anPrimeiro);
end;

procedure TfrmFrutas.btnProximoClick(Sender: TObject);
begin
  ObterDetalheFruta(anProximo);
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

end.
