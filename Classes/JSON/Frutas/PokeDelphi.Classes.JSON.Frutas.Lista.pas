unit PokeDelphi.Classes.JSON.Frutas.Lista;

interface

uses
  PokeDelphi.Classes.JSON.Generico.Lista, REST.Json.Types,
  PokeDelphi.Classes.JSON.Frutas;

type
  TJSONListaFrutas = class(TJSONGenericoLista)
  private
    [JSONName('results')]
    FResultados: TArray<TJSONFruta>;
  public
    destructor Destroy; override;
    property Resultados: TArray<TJSONFruta> read FResultados write FResultados;
  end;

implementation

uses
  PokeDelphi.Helpers.ArrayLista;

{ TJSONListaFrutas }

destructor TJSONListaFrutas.Destroy;
begin
  THelperArrayLista.LiberarTodos(TArray<TObject>(FResultados));
  inherited;
end;

end.
