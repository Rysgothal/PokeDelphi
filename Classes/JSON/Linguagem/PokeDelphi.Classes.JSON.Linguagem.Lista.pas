unit PokeDelphi.Classes.JSON.Linguagem.Lista;

interface

uses
  PokeDelphi.Classes.JSON.Generico.Lista, PokeDelphi.Classes.JSON.Linguagem, REST.Json.Types;

type
  TJSONListaLinguagem = class(TJSONGenericoLista)
  private
    [JSONName('results')]
    FResultados: TArray<TJSONLinguagem>;
  public
    destructor Destroy; override;
    property Resultados: TArray<TJSONLinguagem> read FResultados write FResultados;
  end;

implementation

uses
  PokeDelphi.Helpers.ArrayLista;

{ TJSONListaLinguagem }

destructor TJSONListaLinguagem.Destroy;
begin
  THelperArrayLista.LiberarTodos(TArray<TObject>(FResultados));
  inherited;
end;

end.
