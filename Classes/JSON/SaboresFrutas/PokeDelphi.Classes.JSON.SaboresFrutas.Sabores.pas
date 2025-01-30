unit PokeDelphi.Classes.JSON.SaboresFrutas.Sabores;

interface

uses
  PokeDelphi.Classes.JSON.SaboresFrutas, REST.Json.Types;

type
  TJSONSabores = class
  private
    [JSONName('flavor')]
    FSabores: TJSONSaboresFrutas;           
    [JSONName('potency')]
    FPotencia: Integer;
  public
    destructor Destroy; override;
    property Sabores: TJSONSaboresFrutas read FSabores write FSabores;
    property Potencia: Integer read FPotencia write FPotencia;
  end;
  
implementation

uses
  System.SysUtils;

{ TJSONSabores }

destructor TJSONSabores.Destroy;
begin
  FreeAndNil(FSabores);
  inherited;
end;

end.
