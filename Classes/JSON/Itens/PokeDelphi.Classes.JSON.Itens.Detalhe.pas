unit PokeDelphi.Classes.JSON.Itens.Detalhe;

interface

uses
  REST.Json.Types,
  PokeDelphi.Classes.JSON.ItemAtributos, PokeDelphi.Classes.JSON.CadeiasEvolucoes,
  PokeDelphi.Classes.JSON.ItemCategorias, PokeDelphi.Classes.JSON.Efeitos.Entrada,
  PokeDelphi.Classes.JSON.TextoEntradaAroma, PokeDelphi.Classes.JSON.EfeitosItemArremesso,
  PokeDelphi.Classes.JSON.IndicesJogo, PokeDelphi.Classes.JSON.ItensSegurados,
  PokeDelphi.Classes.JSON.Maquinas, PokeDelphi.Classes.JSON.Nomes,
  PokeDelphi.Classes.JSON.Imagens.Item;

type
  TJSONItensDetalhe = class
  private
    [JSONName('attributes')]
    FAtributos: TArray<TJSONAtributos>;
    [JSONName('baby_trigger_for')]
    FGatilhoBebe: TJSONGatilhoBebe;
    [JSONName('category')]
    FCategoria: TJSONCategoria;
    [JSONName('cost')]
    FCusto: Integer;
    [JSONName('effect_entries')]
    FEfeitosEntrada: TArray<TJSONEfeitosEntrada>;
    [JSONName('flavor_text_entries')]
    FFrasesAroma: TArray<TJSONTextoEntradaAroma>;
    [JSONName('fling_power')]
    FForcaArremesso: Integer;
    [JSONName('fling_effect')]
    FEfeitoArremesso: TJSONEfeitosItemArremesso;
    [JSONName('game_indices')]
    FIndicesJogo: TArray<TJSONIndicesJogo>;
    [JSONName('held_by_pokemon')]
    FItemSeguradoPokemon: TArray<TJSONItensSegurados>;
    [JSONName('id')]
    FID: Integer;
    [JSONName('machines')]
    FMaquinas: TArray<TJSONMaquinas>;
    [JSONName('name')]
    FNome: string;
    [JSONName('names')]
    FNomes: TArray<TJSONNomes>;
    [JSONName('sprites')]
    FImagens: TJSONImagensItem;
  public
    destructor Destroy; override;
    property Atributos: TArray<TJSONAtributos> read FAtributos write FAtributos;
    property GatilhoBebe: TJSONGatilhoBebe read FGatilhoBebe write FGatilhoBebe;
    property Categoria: TJSONCategoria read FCategoria write FCategoria;
    property Custo: Integer read FCusto write FCusto;
    property EfeitosEntrada: TArray<TJSONEfeitosEntrada> read FEfeitosEntrada write FEfeitosEntrada;
    property FrasesAroma: TArray<TJSONTextoEntradaAroma> read FFrasesAroma write FFrasesAroma;
    property ForcaArremesso: Integer read FForcaArremesso write FForcaArremesso;
    property EfeitoArremesso: TJSONEfeitosItemArremesso read FEfeitoArremesso write FEfeitoArremesso;
    property IndicesJogo: TArray<TJSONIndicesJogo> read FIndicesJogo write FIndicesJogo;
    property ItemSeguradoPokemon: TArray<TJSONItensSegurados> read FItemSeguradoPokemon write FItemSeguradoPokemon;
    property ID: Integer read FID write FID;
    property Maquinas: TArray<TJSONMaquinas> read FMaquinas write FMaquinas;
    property Nome: string read FNome write FNome;
    property Nomes: TArray<TJSONNomes> read FNomes write FNomes;
    property Imagens: TJSONImagensItem read FImagens write FImagens;
  end;

implementation

uses
  PokeDelphi.Helpers.ArrayLista, System.SysUtils;

{ TJSONItensDetalhe }

destructor TJSONItensDetalhe.Destroy;
begin
  THelperArrayLista.LiberarTodos(TArray<TObject>(FAtributos));
  THelperArrayLista.LiberarTodos(TArray<TObject>(FEfeitosEntrada));
  THelperArrayLista.LiberarTodos(TArray<TObject>(FFrasesAroma));
  THelperArrayLista.LiberarTodos(TArray<TObject>(FIndicesJogo));
  THelperArrayLista.LiberarTodos(TArray<TObject>(FItemSeguradoPokemon));
  THelperArrayLista.LiberarTodos(TArray<TObject>(FMaquinas));
  THelperArrayLista.LiberarTodos(TArray<TObject>(FNomes));

  FreeAndNil(FImagens);
  FreeAndNil(FCategoria);
  FreeAndNil(FEfeitoArremesso);
  inherited;
end;

end.
