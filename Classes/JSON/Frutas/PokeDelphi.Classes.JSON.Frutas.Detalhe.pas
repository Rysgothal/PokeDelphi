unit PokeDelphi.Classes.JSON.Frutas.Detalhe;

interface

uses
  PokeDelphi.Classes.JSON.FirmezaFruta, PokeDelphi.Classes.JSON.Itens, REST.Json.Types,
  PokeDelphi.Classes.JSON.SaboresFrutas.Sabores, PokeDelphi.Classes.JSON.Tipos;

type
  TJSONFrutaDetalhe = class
  private
    [JSONName('firmness')]
    FFirmezaFruta: TJSONFirmezaFruta;
    [JSONName('flavors')]
    FSabores: TArray<TJSONSabores>;
    [JSONName('growth_time')]
    FTempoCrescimento: Integer;
    [JSONName('id')]
    FID: Integer;
    [JSONName('item')]
    FItem: TJSONItens;
    [JSONName('max_harvest')]
    FColheitaMaxima: Integer;
    [JSONName('name')]
    FNome: string;
    [JSONName('natural_gift_power')]
    FPoderDomNatural: Integer;
    [JSONName('natural_gift_type')]
    FTipoDomNatural: TJSONTipoDomNatural;
    [JSONName('size')]
    FTamanho: Integer;
    [JSONName('smoothness')]
    FSuavidade: Integer;
    [JSONName('soil_dryness')]
    FAridezSolo: Integer;
  public
    destructor Destroy; override;
    property FirmezaFruta: TJSONFirmezaFruta read FFirmezaFruta write FFirmezaFruta;
    property Sabores: TArray<TJSONSabores> read FSabores write FSabores;
    property TempoCrescimento: Integer read FTempoCrescimento write FTempoCrescimento;
    property ID: Integer read FID write FID;
    property Item: TJSONItens read FItem write FItem;
    property ColheitaMaxima: Integer read FColheitaMaxima write FColheitaMaxima;
    property Nome: string read FNome write FNome;
    property PoderDomNatural: Integer read FPoderDomNatural write FPoderDomNatural;
    property TipoDomNatural: TJSONTipoDomNatural read FTipoDomNatural write FTipoDomNatural;
    property Tamanho: Integer read FTamanho write FTamanho;
    property Suavidade: Integer read FSuavidade write FSuavidade;
    property AridezSolo: Integer read FAridezSolo write FAridezSolo;
  end;

implementation

uses
  PokeDelphi.Helpers.ArrayLista, System.SysUtils;

{ TJSONFrutasDetalhe }

destructor TJSONFrutaDetalhe.Destroy;
begin
  THelperArrayLista.LiberarTodos(TArray<TObject>(FSabores));

  FreeAndNil(FFirmezaFruta);
  FreeAndNil(FItem);
  FreeAndNil(FTipoDomNatural);
  inherited;
end;

end.
