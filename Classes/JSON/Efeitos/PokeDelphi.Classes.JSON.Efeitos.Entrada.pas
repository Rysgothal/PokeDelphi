unit PokeDelphi.Classes.JSON.Efeitos.Entrada;

interface

uses
  PokeDelphi.Classes.JSON.Linguagem, REST.Json.Types;

type
  TJSONEfeitosEntrada = class
  private
    [JSONName('effect')]
    FEfeito: string;
    [JSONName('language')]
    FLinguagem: TJSONLinguagem;
    [JSONName('short_effect')]
    FEfeitoCurto: string;
  public
    destructor Destroy; override;
    property Efeito: string read FEfeito write FEfeito;
    property Linguagem: TJSONLinguagem read FLinguagem write FLinguagem;
    property EfeitoCurto: string read FEfeitoCurto write FEfeitoCurto;
  end;

implementation

uses
  System.SysUtils;

{ TJSONEfeitosEntrada }

destructor TJSONEfeitosEntrada.Destroy;
begin
  FreeAndNil(FLinguagem);
  inherited;
end;

end.
