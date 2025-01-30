unit PokeDelphi.Classes.JSON.Imagens.Item;

interface

uses
  REST.Json.Types;

type
  TJSONImagensItem = class
  private
    [JSONName('default')]
    FPadrao: string;
  public
    property Padrao: string read FPadrao write FPadrao;
  end;

implementation

end.
