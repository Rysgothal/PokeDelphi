unit PokeDelphi.Classes.JSON.Geracao.Detalhe;

interface

uses
  PokeDelphi.Classes.JSON.Habilidades, PokeDelphi.Classes.JSON.Nomes, PokeDelphi.Classes.JSON.Tipos,
  PokeDelphi.Classes.JSON.Regioes, PokeDelphi.Classes.JSON.Pokemon.Especies, REST.Json.Types,
  PokeDelphi.Classes.JSON.Movimentos, PokeDelphi.Classes.JSON.VersaoGrupo,
  System.SysUtils;

type
  TJSONGeracaoDetalhe = class
  private
    [JSONName('abilities')]
    FHabilidades: TArray<TJSONHabilidades>;
    [JSONName('id')]
    FID: Integer;
    [JSONName('main_region')]
    FRegiaoPrincipal: TJSONRegiao;
    [JSONName('moves')]
    FMovimentos: TArray<TJSONMovimentos>;
    [JSONName('name')]
    FNome: string;
    [JSONName('names')]
    FNomes: TArray<TJSONNomes>;
    [JSONName('pokemon_species')]
    FEspeciesPokemon: TArray<TJSONPokemonEspecie>;
    [JSONName('version_groups')]
    FVersaoGrupos: TArray<TJSONVersaoGrupo>;
    [JSONName('types')]
    FTipos: TArray<TJSONTipos>;
    function GetNome: string;
  public
    destructor Destroy; override;
    property Habilidades: TArray<TJSONHabilidades> read FHabilidades write FHabilidades;
    property ID: Integer read FID write FID;
    property RegiaoPrincipal: TJSONRegiao read FRegiaoPrincipal write FRegiaoPrincipal;
    property Movimentos: TArray<TJSONMovimentos> read FMovimentos write FMovimentos;
    property Nome: string read GetNome write FNome;
    property Nomes: TArray<TJSONNomes> read FNomes write FNomes;
    property EspeciesPokemon: TArray<TJSONPokemonEspecie> read FEspeciesPokemon write FEspeciesPokemon;
    property VersaoGrupos: TArray<TJSONVersaoGrupo> read FVersaoGrupos write FVersaoGrupos;
    property Tipos: TArray<TJSONTipos> read FTipos write FTipos;
  end;

implementation

uses
  System.StrUtils, PokeDelphi.Helpers.ArrayLista, PokeDelphi.Classes.Configuracao, PokeDelphi.Helpers.StringHelper;

{ TJSONGeracaoDetalhe }

destructor TJSONGeracaoDetalhe.Destroy;
begin
  THelperArrayLista.LiberarTodos(TArray<TObject>(FHabilidades));
  THelperArrayLista.LiberarTodos(TArray<TObject>(FMovimentos));
  THelperArrayLista.LiberarTodos(TArray<TObject>(FNomes));
  THelperArrayLista.LiberarTodos(TArray<TObject>(FEspeciesPokemon));
  THelperArrayLista.LiberarTodos(TArray<TObject>(FVersaoGrupos));
  THelperArrayLista.LiberarTodos(TArray<TObject>(FTipos));
  FreeAndNil(FRegiaoPrincipal);

  inherited;
end;

function TJSONGeracaoDetalhe.GetNome: string;
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
