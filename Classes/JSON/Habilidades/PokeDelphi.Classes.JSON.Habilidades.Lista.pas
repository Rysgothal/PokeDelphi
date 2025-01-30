unit PokeDelphi.Classes.JSON.Habilidades.Lista;

interface

uses
  REST.Json.Types, System.SysUtils, PokeDelphi.Classes.JSON.Habilidades,
  PokeDelphi.Classes.JSON.Generico.Lista;

type
  TJSONListaHabilidades = class(TJSONGenericoLista)
  private
    [JSONName('results')]
    FResultados: TArray<TJSONHabilidades>;
  public
    destructor Destroy; override;
    property Resultados: TArray<TJSONHabilidades> read FResultados write FResultados;
  end;

implementation

uses
  PokeDelphi.Helpers.ArrayLista;

{ TJSONListaHabilidades }

destructor TJSONListaHabilidades.Destroy;
begin
  THelperArrayLista.LiberarTodos(TArray<TObject>(FResultados));

  inherited;
end;

end.
