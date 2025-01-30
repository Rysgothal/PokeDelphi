unit PokeDelphi.Classes.API.Linguagens;

interface

uses
  PokeDelphi.Classes.API.Base;

type
  TPokeAPILinguagem = class(TBasePokeAPI)
  private
    constructor Create;
  public
    class function ObterInstancia: TPokeAPILinguagem;
  end;

var
  FPokeAPILinguagem: TPokeAPILinguagem;

implementation

uses
  System.SysUtils;

{ TPokeAPILinguagem }

constructor TPokeAPILinguagem.Create;
begin
  inherited Create('https://pokeapi.co/api/v2/language/');
end;

class function TPokeAPILinguagem.ObterInstancia: TPokeAPILinguagem;
begin
  if not Assigned(FPokeAPILinguagem) then
  begin
    FPokeAPILinguagem := TPokeAPILinguagem.Create;
  end;

  Result := FPokeAPILinguagem;
end;

initialization

finalization
begin
  FreeAndNil(FPokeAPILinguagem);
end;

end.
