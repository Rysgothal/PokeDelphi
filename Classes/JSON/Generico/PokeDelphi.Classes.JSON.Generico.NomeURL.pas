unit PokeDelphi.Classes.JSON.Generico.NomeURL;

interface

uses
  REST.Json.Types;

type
  TJSONGenericoNomeURL = class
  private
    [JSONName('name')]
    FNome: string;
    [JSONName('url')]
    FURL: string;
  public
    property Nome: string read FNome write FNome;
    property URL: string read FURL write FURL;
  end;

implementation

end.
