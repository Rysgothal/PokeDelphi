unit PokeDelphi.Classes.API.Base;

interface

uses
  REST.Client, JSON, System.Classes;

type
  TBasePokeAPI = class
  protected
    FClient: TRESTClient;
    FRequest: TRESTRequest;
    FIndex: Integer;
    FNomes: TStringList;

    constructor Create(const pUrl: string);
    function GetStatus: Boolean;
    function GetJSON: TJSONValue;
  public
    class function ObterInstancia(const pUrl: string = ''): TBasePokeAPI;
    property Status: Boolean read GetStatus;
    property JSON: TJSONValue read GetJSON;

    destructor Destroy; override;
    procedure ConfigurarAPI(pResource: string = ''; pValores: TArray<string> = []);
    procedure ObterPrimeiro;
    procedure ObterProximo;
    procedure ObterAnterior;
    procedure ObterUltimo;
    procedure ObterEspecifico(const pNome: string);   overload;
    procedure ObterEspecifico(const pIndex: Integer); overload;
  end;

var
  FPokeAPI: TBasePokeAPI;

implementation

uses
  System.SysUtils, System.RegularExpressions;

{ TBasePokeAPI }

procedure TBasePokeAPI.ConfigurarAPI(pResource: string = ''; pValores: TArray<string> = []);
var
  lParametro: string;
  lMatches: TMatchCollection;
begin             
  FRequest.Resource := pResource;
  lMatches := TRegEx.Matches(pResource, '\{([[:alnum:]]+)\}\/?', [roMultiLine]);
  
  for var I := 0 to Pred(Length(pValores)) do
  begin           
    lParametro := lMatches[I].Groups[1].Value;
    FRequest.Params.AddUrlSegment(lParametro, pValores[I]);
  end;
  
  FRequest.Execute;
end;

constructor TBasePokeAPI.Create(const pUrl: string);
begin
  FClient := TRESTClient.Create(pUrl);
  FRequest := TRESTRequest.Create(FClient);
  FIndex := 0;
  FNomes := TStringList.Create;
end;

destructor TBasePokeAPI.Destroy;
begin
  FreeAndNil(FRequest);
  FreeAndNil(FClient);
  FreeAndNil(FNomes);
  inherited;
end;

function TBasePokeAPI.GetJSON: TJSONValue;
begin
  Result := FRequest.Response.JSONValue;
end;

function TBasePokeAPI.GetStatus: Boolean;
begin
  FRequest.Execute;

  case FRequest.Response.StatusCode of
    200..299: Result := True;
    else Result := False;
  end;
end;

class function TBasePokeAPI.ObterInstancia(const pUrl: string = ''): TBasePokeAPI;
begin
  if not Assigned(FPokeAPI) then
  begin
    FPokeAPI := TBasePokeAPI.Create(pURL);
  end;

  Result := FPokeAPI;
end;

procedure TBasePokeAPI.ObterPrimeiro;
begin
  FIndex := 0;
  ConfigurarAPI('/{NOME}', [FNomes[FIndex]]);
end;

procedure TBasePokeAPI.ObterProximo;
begin
  if Succ(FIndex) <= Pred(FNomes.Count) then
  begin
    Inc(FIndex);
  end;

  ConfigurarAPI('/{NOME}', [FNomes[FIndex]]);
end;

procedure TBasePokeAPI.ObterAnterior;
begin
  if Pred(FIndex) >= 0 then
  begin
    Dec(FIndex);
  end;

  ConfigurarAPI('/{NOME}', [FNomes[FIndex]]);
end;

procedure TBasePokeAPI.ObterEspecifico(const pIndex: Integer);
begin
  if (pIndex > Pred(FNomes.Count)) or (pIndex < 0) then
  begin
    Exit;
  end;

  FIndex := pIndex;
  ConfigurarAPI('/{NOME}', [FNomes[FIndex]]);
end;

procedure TBasePokeAPI.ObterEspecifico(const pNome: string);
var
  lIndex: Integer;
begin
  lIndex := FNomes.IndexOf(pNome.ToUpper);

  case lIndex of
    -1: Exit;
    else FIndex := lIndex;
  end;

  ConfigurarAPI('/{NOME}', [FNomes[FIndex]]);
end;

procedure TBasePokeAPI.ObterUltimo;
begin
  FIndex := Pred(FNomes.Count);
  ConfigurarAPI('/{NOME}', [FNomes[FIndex]]);
end;

initialization

finalization
begin
  FreeAndNil(FPokeAPI);
end;

end.
