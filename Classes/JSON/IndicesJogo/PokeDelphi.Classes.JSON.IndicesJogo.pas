unit PokeDelphi.Classes.JSON.IndicesJogo;

interface

uses
  PokeDelphi.Classes.JSON.Geracao,
  REST.Json.Types;

type
  TJSONIndicesJogo = class
  private
    [JSONName('game_index')]
    FIndiceJogo: Integer;
    [JSONName('generation')]
    FGeracao: TJSONGeracao;
  public
    destructor Destroy; override;
    property IndiceJogo: Integer read FIndiceJogo write FIndiceJogo;
    property Geracao: TJSONGeracao read FGeracao write FGeracao;
  end;

implementation

uses
  System.SysUtils;

{ TJSONIndicesJogo }

destructor TJSONIndicesJogo.Destroy;
begin
  FreeAndNil(FGeracao);
  inherited;
end;

end.
