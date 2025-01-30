unit PokeDelphi.Classes.JSON.TextoEntradaAroma;

interface

uses
  PokeDelphi.Classes.JSON.VersaoGrupo, PokeDelphi.Classes.JSON.Linguagem, REST.Json.Types;

type
  TJSONTextoEntradaAroma = class
  private
    [JSONName('flavor_text')]
    FAromaTexto: string;
    [JSONName('language')]
    FLinguagem: TJSONLinguagem;
    [JSONName('version_group')]
    FVersaoGrupo: TJSONVersaoGrupo;
    [JSONName('text')]
    FTexto: string;
  public
    destructor Destroy; override;
    property AromaTexto: string read FAromaTexto write FAromaTexto;
    property Texto: string read FTexto write FTexto;
    property Linguagem: TJSONLinguagem read FLinguagem write FLinguagem;
    property VersaoGrupo: TJSONVersaoGrupo read FVersaoGrupo write FVersaoGrupo;
  end;

implementation

uses
  System.SysUtils;

{ TJSONTextoEntradaAroma }

destructor TJSONTextoEntradaAroma.Destroy;
begin
  FreeAndNil(FLinguagem);
  FreeAndNil(FVersaoGrupo);
  inherited;
end;

end.
