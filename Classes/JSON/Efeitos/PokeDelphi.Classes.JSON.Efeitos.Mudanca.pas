unit PokeDelphi.Classes.JSON.Efeitos.Mudanca;

interface

uses
  PokeDelphi.Classes.JSON.Efeitos.Entrada, REST.Json.Types,
  PokeDelphi.Classes.JSON.VersaoGrupo, System.SysUtils, 
  PokeDelphi.Helpers.StringHelper, PokeDelphi.Constantes.Configuracao;

type
  TJSONEfeitosMudanca = class
  private
    [JSONName('effect_entries')]
    FEfeitosEntrada: TArray<TJSONEfeitosEntrada>;
    [JSONName('version_group')]
    FVersaoGrupo: TJSONVersaoGrupo;
    function GetEfeitosEntrada: TJSONEfeitosEntrada;
  public
    destructor Destroy; override;
    property EfeitosEntrada: TJSONEfeitosEntrada read GetEfeitosEntrada; 
    property VersaoGrupo: TJSONVersaoGrupo read FVersaoGrupo write FVersaoGrupo;
    property EfeitosEntradaLista: TArray<TJSONEfeitosEntrada> read FEfeitosEntrada write FEfeitosEntrada;  
  end;

implementation

uses
  PokeDelphi.Helpers.ArrayLista, PokeDelphi.Classes.Configuracao;

{ TJSONEfeitosMudanca }

destructor TJSONEfeitosMudanca.Destroy;
begin
  THelperArrayLista.LiberarTodos(TArray<TObject>(FEfeitosEntrada));
  FreeAndNil(FVersaoGrupo);

  inherited;
end;

function TJSONEfeitosMudanca.GetEfeitosEntrada: TJSONEfeitosEntrada;
var                                
  lConfiguracao: TConfiguracao;
  lPadrao: TJSONEfeitosEntrada;
begin                            
  lConfiguracao := TConfiguracao.ObterInstancia;
  Result := nil;
  lPadrao := nil;

  for var lItem in EfeitosEntradaLista do
  begin
    if lItem.Linguagem.URL.ToUpper.Equals(PADRAO_LINGUAGEM_URL.Trim.ToUpper) then
    begin
      lPadrao := lItem;
    end;

    if not TStringHelper.ObterNomeUltimoCaminho(lItem.Linguagem.URL).Equals(lConfiguracao.Linguagem.ToString) then
    begin
      Continue;
    end;

    Result := lItem;
    Break;
  end;

  if not Assigned(Result) then
  begin
    Result := lPadrao;
  end;
end;

end.
