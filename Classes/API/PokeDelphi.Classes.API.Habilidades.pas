unit PokeDelphi.Classes.API.Habilidades;

interface

uses
  PokeDelphi.Classes.API.Base, PokeDelphi.Classes.JSON.Habilidades.Detalhes,
  System.Classes;

type
  TPokeAPIHabilidades = class(TBasePokeAPI)
  private
    constructor Create;
    procedure AtualizarNomesHabilidades;
  public
    class function ObterInstancia: TPokeAPIHabilidades;
  end;

var
  FPokeApiHabilidades: TPokeAPIHabilidades;

implementation

uses
  System.SysUtils, PokeDelphi.Helpers.JSON,
  PokeDelphi.Classes.API.Linguagens, PokeDelphi.Classes.JSON.Linguagem.Lista,
  PokeDelphi.Classes.JSON.Habilidades.Lista;

{ TPokeAPIHabilidades }

procedure TPokeAPIHabilidades.AtualizarNomesHabilidades;
var
  lJSON: TJSONListaHabilidades;
begin
  ConfigurarAPI;
  lJSON := JSON.ToJSONListAbility;

  try
    try
      ConfigurarAPI('?limit={count}', [lJSON.Total.ToString]);
    finally
      FreeAndNil(lJSON);
    end;

    lJSON := JSON.ToJSONListAbility;

    for var lItem in lJSON.Resultados do
    begin
      FNomes.Add(lItem.Nome.ToUpper);
    end;
  finally
    FreeAndNil(lJSON);
  end;
end;

constructor TPokeAPIHabilidades.Create;
begin
  inherited Create('https://pokeapi.co/api/v2/ability/');
  AtualizarNomesHabilidades;
end;

class function TPokeAPIHabilidades.ObterInstancia: TPokeAPIHabilidades;
begin
  if not Assigned(FPokeApiHabilidades) then
  begin
    FPokeApiHabilidades := TPokeAPIHabilidades.Create;
  end;

  Result := FPokeApiHabilidades;
end;

initialization

finalization
begin
  FreeAndNil(FPokeApiHabilidades);
end;

end.
