unit PokeDelphi.Classes.JSON.Linguagem.Detalhe;

interface

uses
  PokeDelphi.Classes.JSON.Nomes, REST.JSON.Types;

type
  TJSONLinguagemDetalhe = class
  private
    [JSONName('id')]
    FID: Integer;
    [JSONName('iso3166')]
    FISO3166: string;
    [JSONName('iso639')]
    FISO639: string;
    [JSONName('name')]
    FNome: string;
    [JSONName('names')]
    FNomes: TArray<TJSONNomes>;
    [JSONName('official')]
    FOficial: Boolean;
  public
    destructor Destroy; override;
    property ID: Integer read FID write FID;
    property ISO3166: string read FISO3166 write FISO3166;
    property ISO639: string read FISO639 write FISO639;
    property Nome: string read FNome write FNome;
    property Nomes: TArray<TJSONNomes> read FNomes write FNomes;
    property Oficial: Boolean read FOficial write FOficial;
  end;

implementation

uses
  PokeDelphi.Helpers.ArrayLista;

{ TJSONLinguagemDetalhe }

destructor TJSONLinguagemDetalhe.Destroy;
begin
  THelperArrayLista.LiberarTodos(TArray<TObject>(FNomes));
  inherited;
end;

end.
