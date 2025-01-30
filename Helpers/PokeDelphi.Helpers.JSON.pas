unit PokeDelphi.Helpers.JSON;

interface

uses
  System.JSON, PokeDelphi.Classes.JSON.Habilidades, PokeDelphi.Classes.JSON.Habilidades.Detalhes,
  PokeDelphi.Classes.JSON.Linguagem.Lista, PokeDelphi.Classes.JSON.Linguagem.Detalhe,
  PokeDelphi.Classes.JSON.Geracao.Detalhe, PokeDelphi.Classes.JSON.Frutas.Lista,
  PokeDelphi.Classes.JSON.Frutas.Detalhe, PokeDelphi.Classes.JSON.Habilidades.Lista,
  PokeDelphi.Classes.JSON.Itens.Lista, PokeDelphi.Classes.JSON.Itens.Detalhe;

type
  TJSONValueHelper = class Helper for TJSONValue
  public
    function ToJSONAbility: TJSONHabilidadeDetalhes;
    function ToJSONLanguage: TJSONLinguagemDetalhe;
    function ToJSONGeneration: TJSONGeracaoDetalhe;
    function ToJSONBerry: TJSONFrutaDetalhe;
    function ToJSONItem: TJSONItensDetalhe;
    function ToJSONListAbility: TJSONListaHabilidades;
    function ToJSONListLanguage: TJSONListaLinguagem;
    function ToJSONListBerry: TJSONListaFrutas;
    function ToJSONListItens: TJSONListaItens;
  end;

implementation

{ TJSONValueHelper }
uses
  REST.Json;

function TJSONValueHelper.ToJSONBerry: TJSONFrutaDetalhe;
begin
  Result := TJson.JsonToObject<TJSONFrutaDetalhe>(TJSONObject(Self));
end;

function TJSONValueHelper.ToJSONGeneration: TJSONGeracaoDetalhe;
begin
  Result := TJson.JsonToObject<TJSONGeracaoDetalhe>(TJSONObject(Self));
end;

function TJSONValueHelper.ToJSONItem: TJSONItensDetalhe;
begin
  Result := TJson.JsonToObject<TJSONItensDetalhe>(TJSONObject(Self));
end;

function TJSONValueHelper.ToJSONLanguage: TJSONLinguagemDetalhe;
begin
  Result := TJson.JsonToObject<TJSONLinguagemDetalhe>(TJSONObject(Self));
end;

function TJSONValueHelper.ToJSONListAbility: TJSONListaHabilidades;
begin
  Result := TJson.JsonToObject<TJSONListaHabilidades>(TJSONObject(Self));
end;

function TJSONValueHelper.ToJSONListBerry: TJSONListaFrutas;
begin
  Result := TJson.JsonToObject<TJSONListaFrutas>(TJSONObject(Self));
end;

function TJSONValueHelper.ToJSONListItens: TJSONListaItens;
begin
  Result := TJson.JsonToObject<TJSONListaItens>(TJSONObject(Self));
end;

function TJSONValueHelper.ToJSONListLanguage: TJSONListaLinguagem;
begin
  Result := TJson.JsonToObject<TJSONListaLinguagem>(TJSONObject(Self));
end;

function TJSONValueHelper.ToJSONAbility: TJSONHabilidadeDetalhes;
begin
  Result := TJson.JsonToObject<TJSONHabilidadeDetalhes>(TJSONObject(Self));
end;

end.
