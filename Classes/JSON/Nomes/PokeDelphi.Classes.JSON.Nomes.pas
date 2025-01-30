unit PokeDelphi.Classes.JSON.Nomes;

interface

uses
  PokeDelphi.Classes.JSON.Linguagem, REST.Json.Types;

type
  TJSONNomes = class
  private
    [JSONName('language')]
    FLinguagem: TJSONLinguagem;
    [JSONName('name')]
    FNome: string;
  public
    destructor Destroy; override;
    property Linguagem: TJSONLinguagem read FLinguagem write FLinguagem;
    property Nome: string read FNome write FNome;
  end;

implementation

uses
  System.SysUtils;

{ TJSONNomes }

destructor TJSONNomes.Destroy;
begin
  FreeAndNil(FLinguagem);
  inherited;
end;

end.
