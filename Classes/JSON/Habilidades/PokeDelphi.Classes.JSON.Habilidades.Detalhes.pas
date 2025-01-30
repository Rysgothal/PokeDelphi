unit PokeDelphi.Classes.JSON.Habilidades.Detalhes;

interface

uses
  REST.Json.Types, PokeDelphi.Classes.JSON.Efeitos.Mudanca, System.SysUtils, PokeDelphi.Classes.JSON.Efeitos.Entrada, 
  PokeDelphi.Classes.JSON.TextoEntradaAroma, PokeDelphi.Classes.JSON.Geracao, PokeDelphi.Classes.JSON.Nomes,
  PokeDelphi.Classes.JSON.Pokemon, PokeDelphi.Helpers.StringHelper,
  PokeDelphi.Constantes.Configuracao;

type
  TJSONHabilidadeDetalhes = class
  private
    [JSONName('id')]
    FID: Integer;
    [JSONName('name')]
    FNome: string;
    [JSONName('is_main_series')]
    FSeriePrincipal: Boolean;
    [JSONName('effect_changes')]
    FEfeitoMudanca: TArray<TJSONEfeitosMudanca>;
    [JSONName('effect_entries')]
    FEfeitoEntrada: TArray<TJSONEfeitosEntrada>;
    [JSONName('flavor_text_entries')]
    FTextoEntradaAroma: TArray<TJSONTextoEntradaAroma>;
    [JSONName('generation')]
    FGeracao: TJSONGeracao;
    [JSONName('names')]
    FNomes: TArray<TJSONNomes>;
    [JSONName('pokemon')]
    FPokemons: TArray<TJSONPokemonDetalhe>;
    function GetNome: string;
    function GetGeracao: TJSONGeracao;
    function GetEfeitoEntrada: TJSONEfeitosEntrada;
  public
    destructor Destroy; override;
    property ID: Integer read FID write FID;
    property Nome: string read GetNome write FNome;
    property SeriePrincipal: Boolean read FSeriePrincipal write FSeriePrincipal;
    property EfeitoMudanca: TArray<TJSONEfeitosMudanca> read FEfeitoMudanca write FEfeitoMudanca;
    property EfeitoEntradaLista: TArray<TJSONEfeitosEntrada> read FEfeitoEntrada write FEfeitoEntrada;
    property EfeitoEntrada: TJSONEfeitosEntrada read GetEfeitoEntrada;
    property TextoEntradaAroma: TArray<TJSONTextoEntradaAroma> read FTextoEntradaAroma write FTextoEntradaAroma;
    property Geracao: TJSONGeracao read GetGeracao write FGeracao;
    property Nomes: TArray<TJSONNomes> read FNomes write FNomes;
    property Pokemons: TArray<TJSONPokemonDetalhe> read FPokemons write FPokemons;
  end;

implementation

uses
  PokeDelphi.Helpers.ArrayLista, System.StrUtils, PokeDelphi.Classes.Configuracao, PokeDelphi.Helpers.JSON,
  PokeDelphi.Classes.API.Geracoes, PokeDelphi.Classes.JSON.Geracao.Detalhe;

{ TJSONHabilidadeDetalhes }

destructor TJSONHabilidadeDetalhes.Destroy;
begin
  THelperArrayLista.LiberarTodos(TArray<TObject>(FEfeitoMudanca));
  THelperArrayLista.LiberarTodos(TArray<TObject>(FEfeitoEntrada));
  THelperArrayLista.LiberarTodos(TArray<TObject>(FNomes));
  THelperArrayLista.LiberarTodos(TArray<TObject>(FPokemons));
  THelperArrayLista.LiberarTodos(TArray<TObject>(FTextoEntradaAroma));
  FreeAndNil(FGeracao);

  inherited;
end;

function TJSONHabilidadeDetalhes.GetEfeitoEntrada: TJSONEfeitosEntrada;
var
  lConfiguracao: TConfiguracao;
  lPadrao: TJSONEfeitosEntrada;
begin
  lConfiguracao := TConfiguracao.ObterInstancia;
  Result := nil;
  lPadrao := nil;

  for var lItem in EfeitoEntradaLista do
  begin
    if lItem.Linguagem.URL.ToUpper.Equals(PADRAO_LINGUAGEM_URL.Trim.ToUpper) then
    begin
      lPadrao := lItem;
    end;

    if not TStringHelper.ObterNomeUltimoCaminho(lItem.Linguagem.URL).Equals(lConfiguracao.Linguagem.ToString) then
    begin
      Continue;
    end;

    Result := lItem;
  end;

  if not Assigned(Result) then
  begin
    Result := lPadrao;
  end;
end;

function TJSONHabilidadeDetalhes.GetGeracao: TJSONGeracao;
var
  lPokeAPIGeracoes: TPokeAPIGeracoes;
  lJSONGeracaoDetalhe: TJSONGeracaoDetalhe;
  lGeracao: string;
  lConfiguracao: TConfiguracao;
begin
  lGeracao := FGeracao.Nome;
  lPokeAPIGeracoes := TPokeAPIGeracoes.ObterInstancia;
  lPokeAPIGeracoes.ConfigurarAPI('/{NOME}', [FGeracao.Nome]);
  lJSONGeracaoDetalhe := lPokeAPIGeracoes.JSON.ToJSONGeneration;
  lConfiguracao := TConfiguracao.ObterInstancia;

  try
    for var lItem in lJSONGeracaoDetalhe.Nomes do
    begin
      if not TStringHelper.ObterNomeUltimoCaminho(lItem.Linguagem.URL).Equals(lConfiguracao.Linguagem.ToString) then
      begin
        Continue;
      end;

      lGeracao := lItem.Nome;
      Break;
    end;
  finally
    FreeAndNil(lJSONGeracaoDetalhe);
  end;

  FGeracao.Nome := lGeracao;
  Result := FGeracao;
end;

function TJSONHabilidadeDetalhes.GetNome: string;
var
  lConfiguracao: TConfiguracao;
  lNome: string;
begin
  lConfiguracao := TConfiguracao.ObterInstancia;
  lNome := FNome;

  for var lItem in FNomes do
  begin
    if not TStringHelper.ObterNomeUltimoCaminho(lItem.Linguagem.URL).Equals(lConfiguracao.Linguagem.ToString) then
    begin
      Continue;
    end;

    lNome := lItem.Nome;
    Break;
  end;

  Result := lNome;
end;

end.
