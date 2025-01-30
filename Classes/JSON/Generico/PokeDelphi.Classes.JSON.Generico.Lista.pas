unit PokeDelphi.Classes.JSON.Generico.Lista;

interface

uses
  REST.Json.Types;

type
  TJSONGenericoLista = class
  private
    [JSONName('count')]
    FTotal: Integer;
    [JSONName('next')]
    FProximo: string;
    [JSONName('previus')]
    FAnterior: string;
  public
    property Total: Integer read FTotal write FTotal;
    property Proximo: string read FProximo write FProximo;
    property Anterior: string read FAnterior write FAnterior;
  end;

implementation

end.
