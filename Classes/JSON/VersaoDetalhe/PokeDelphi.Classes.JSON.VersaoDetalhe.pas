unit PokeDelphi.Classes.JSON.VersaoDetalhe;

interface

uses
  PokeDelphi.Classes.JSON.Versao, REST.Json.Types;

type
  TJSONVersaoDetalhe = class
  private
    [JSONName('rarity')]
    FRaridade: Integer;
    [JSONName('version')]
    FVersao: TJSONVersao;
  public
    destructor Destroy; override;
    property Raridade: Integer read FRaridade write FRaridade;
    property Versao: TJSONVersao read FVersao write FVersao;
  end;

implementation

uses
  System.SysUtils;

{ TJSONVersaoDetalhe }

destructor TJSONVersaoDetalhe.Destroy;
begin
  FreeAndNil(FVersao);
  inherited;
end;

end.
