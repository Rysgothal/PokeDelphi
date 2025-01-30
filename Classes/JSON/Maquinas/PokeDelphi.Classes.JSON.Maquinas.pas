unit PokeDelphi.Classes.JSON.Maquinas;

interface

uses

  REST.Json.Types,
  PokeDelphi.Classes.JSON.Maquinas.Maquina,
  PokeDelphi.Classes.JSON.VersaoGrupo;

type
  TJSONMaquinas = class
  private
    [JSONName('machine')]
    FMaquina: TJSONMaquina;
    [JSONName('version_group')]
    FVersaoGrupo: TJSONVersaoGrupo;
  public
    property Maquina: TJSONMaquina read FMaquina write FMaquina;
    property VersaoGrupo: TJSONVersaoGrupo read FVersaoGrupo write FVersaoGrupo;
  end;

implementation

end.
