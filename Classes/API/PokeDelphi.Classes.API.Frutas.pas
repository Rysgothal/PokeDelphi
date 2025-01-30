unit PokeDelphi.Classes.API.Frutas;

interface

uses
  PokeDelphi.Classes.API.Base, System.Classes,
  PokeDelphi.Classes.JSON.Frutas.Detalhe, PokeDelphi.Classes.API.Itens,
  PokeDelphi.Classes.JSON.Itens, PokeDelphi.Classes.JSON.Itens.Detalhe;

type
  TPokeAPIFrutas = class(TBasePokeAPI)
  private
    constructor Create;
    procedure AtualizarNomesFrutas;
    function GetImagemURL: string;
  public
    class function ObterInstancia: TPokeAPIFrutas;
    property Imagem: string read GetImagemURL;
  end;

var
  FPokeAPIFrutas: TPokeAPIFrutas;

implementation

uses
  System.SysUtils, PokeDelphi.Classes.JSON.Frutas.Lista, PokeDelphi.Helpers.JSON;

{ TPokeAPIFrutas }

procedure TPokeAPIFrutas.AtualizarNomesFrutas;
var
  lJSON: TJSONListaFrutas;
begin
  ConfigurarAPI;
  lJSON := JSON.ToJSONListBerry;

  try
    try
      ConfigurarAPI('?limit={count}', [lJSON.Total.ToString]);
    finally
      FreeAndNil(lJSON);
    end;

    lJSON := JSON.ToJSONListBerry;

    for var lItem in lJSON.Resultados do
    begin
      FNomes.Add(lItem.Nome.ToUpper);
    end;
  finally
    FreeAndNil(lJSON);
  end;
end;

constructor TPokeAPIFrutas.Create;
begin
  inherited Create('https://pokeapi.co/api/v2/berry/');

  AtualizarNomesFrutas;
end;

function TPokeAPIFrutas.GetImagemURL: string;
var
  lJSONFruta: TJSONFrutaDetalhe;
  lJSONItem: TJSONItensDetalhe;
  lAPIItem: TPokeAPIItens;
begin
  lJSONFruta := JSON.ToJSONBerry;

  try
    try
      lAPIItem := TPokeAPIItens.ObterInstancia;
      lAPIItem.ObterEspecifico(lJSONFruta.Item.Nome.Trim.ToUpper);
    finally
      FreeAndNil(lJSONFruta);
    end;

    lJSONItem := lAPIItem.JSON.ToJSONItem;
    Result := lJSONItem.Imagens.Padrao;
  finally
    FreeAndNil(lJSONItem);
  end;
end;

class function TPokeAPIFrutas.ObterInstancia: TPokeAPIFrutas;
begin
  if not Assigned(FPokeAPIFrutas) then
  begin
    FPokeAPIFrutas := TPokeAPIFrutas.Create;
  end;

  Result := FPokeAPIFrutas;
end;

initialization

finalization
begin
  FreeAndNil(FPokeAPIFrutas);
end;

end.
