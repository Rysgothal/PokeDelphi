unit PokeDelphi.Classes.JSON.Itens.Lista;

interface

uses
  PokeDelphi.Classes.JSON.Generico.Lista, REST.Json.Types, PokeDelphi.Classes.JSON.Itens;

type
  TJSONListaItens = class(TJSONGenericoLista)
  private
    [JSONName('results')]
    FResultados: TArray<TJSONItens>;
  public
    destructor Destroy; override;
    property Resultados: TArray<TJSONItens> read FResultados write FResultados;
  end;

implementation

uses
  PokeDelphi.Helpers.ArrayLista;

{ TJSONListaItens }

destructor TJSONListaItens.Destroy;
begin
  THelperArrayLista.LiberarTodos(TArray<TObject>(FResultados));
  inherited;
end;

end.
