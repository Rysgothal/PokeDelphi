unit PokeDelphi.Classes.API.Itens;

interface

uses
  PokeDelphi.Classes.API.Base, System.Classes;

type
  TPokeAPIItens = class(TBasePokeAPI)
  private
    constructor Create;
    procedure AtualizarNomesItens;
  public
    class function ObterInstancia: TPokeAPIItens;
  end;

var
  FPokeAPIItens: TPokeAPIItens;

implementation

uses
  System.SysUtils, PokeDelphi.Classes.JSON.Itens.Lista, PokeDelphi.Helpers.JSON;

{ TPokeAPIItens }

procedure TPokeAPIItens.AtualizarNomesItens;
var
  lJSON: TJSONListaItens;
begin
  ConfigurarAPI;
  lJSON := JSON.ToJSONListItens;

  try
    try
      ConfigurarAPI('?limit={count}', [lJSON.Total.ToString]);
    finally
      FreeAndNil(lJSON);
    end;

    lJSON := JSON.ToJSONListItens;

    for var lItem in lJSON.Resultados do
    begin
      FNomes.Add(lItem.Nome.ToUpper);
    end;
  finally
    FreeAndNil(lJSON);
  end;
end;

constructor TPokeAPIItens.Create;
begin
  inherited Create('https://pokeapi.co/api/v2/item/');
  AtualizarNomesItens;
end;

class function TPokeAPIItens.ObterInstancia: TPokeAPIItens;
begin
  if not Assigned(FPokeAPIItens) then
  begin
    FPokeAPIItens := TPokeAPIItens.Create;
  end;

  Result := FPokeAPIItens;
end;

initialization

finalization
begin
  FreeAndNil(FPokeAPIItens);
end;

end.
