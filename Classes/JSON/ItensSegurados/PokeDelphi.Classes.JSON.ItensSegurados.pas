unit PokeDelphi.Classes.JSON.ItensSegurados;

interface

uses
  PokeDelphi.Classes.JSON.Pokemon.Pokemon,
  REST.Json.Types,
  PokeDelphi.Classes.JSON.VersaoDetalhe;

type
  TJSONItensSegurados = class
  private
    [JSONName('pokemon')]
    FPokemon: TJSONPokemon;
    [JSONName('version_details')]
    FDetalheVersao: TArray<TJSONVersaoDetalhe>;
  public
    destructor Destroy; override;
    property Pokemon: TJSONPokemon read FPokemon write FPokemon;
    property DetalheVersao: TArray<TJSONVersaoDetalhe> read FDetalheVersao write FDetalheVersao;
  end;

implementation

uses
  System.SysUtils, PokeDelphi.Helpers.ArrayLista;

{ TJSONItensSegurados }

destructor TJSONItensSegurados.Destroy;
begin
  FreeAndNil(FPokemon);
  THelperArrayLista.LiberarTodos(TArray<TObject>(FDetalheVersao));
  inherited;
end;

end.
