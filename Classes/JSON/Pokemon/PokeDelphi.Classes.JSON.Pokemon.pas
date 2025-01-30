unit PokeDelphi.Classes.JSON.Pokemon;

interface

uses
  PokeDelphi.Classes.JSON.Pokemon.Pokemon, REST.Json.Types;

type
  TJSONPokemonDetalhe = class
  private
    [JSONName('is_hidden')]
    FEscondido: Boolean;
    [JSONName('slot')]
    FSlot: Integer;
    [JSONName('pokemon')]
    FPokemon: TJSONPokemon;
  public
    destructor Destroy; override;
    property Escondido: Boolean read FEscondido write FEscondido;
    property Slot: Integer read FSlot write FSlot;
    property Pokemon: TJSONPokemon read FPokemon write FPokemon;
  end;

implementation

uses
  System.SysUtils;

{ TJSONPokemonDetalhe }

destructor TJSONPokemonDetalhe.Destroy;
begin
  FreeAndNil(FPokemon);
  inherited;
end;

end.
