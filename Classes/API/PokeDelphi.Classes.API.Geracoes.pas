unit PokeDelphi.Classes.API.Geracoes;

interface

uses
  PokeDelphi.Classes.API.Base;

type
  TPokeAPIGeracoes = class(TBasePokeAPI)
  private
    constructor Create;
  public
    class function ObterInstancia: TPokeAPIGeracoes;
  end;

var
  FPokeApiGeracoes: TPokeAPIGeracoes;

implementation

uses
  System.SysUtils, PokeDelphi.Helpers.JSON;

{ TPokeAPIGeracoes }

constructor TPokeAPIGeracoes.Create;
begin
  inherited Create('https://pokeapi.co/api/v2/generation/');
end;

class function TPokeAPIGeracoes.ObterInstancia: TPokeAPIGeracoes;
begin
  if not Assigned(FPokeApiGeracoes) then
  begin
    FPokeApiGeracoes := TPokeAPIGeracoes.Create;
  end;

  Result := FPokeApiGeracoes;
end;

initialization

finalization
begin
  FreeAndNil(FPokeApiGeracoes);
end;

end.
