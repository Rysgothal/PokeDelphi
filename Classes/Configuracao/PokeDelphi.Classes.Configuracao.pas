unit PokeDelphi.Classes.Configuracao;

interface

type
  TConfiguracao = class
  private
    FLinguagem: Integer;
    FLinguagemURL: string;
    constructor Create;
    procedure CarregarIni;
  public
    class function ObterInstancia(const pRecarregar: Boolean = True): TConfiguracao;
    property Linguagem: Integer read FLinguagem;
    property LinguagemURL: string read FLinguagemURL;
    procedure SalvarIni(pIndexLinguagem: Integer);
  end;

var
  FConfiguracao: TConfiguracao;

implementation

uses
  System.SysUtils, System.IniFiles, PokeDelphi.Classes.API.Linguagens, PokeDelphi.Helpers.JSON,
  PokeDelphi.Classes.JSON.Linguagem.Lista;

{ TConfiguracao }

procedure TConfiguracao.CarregarIni;
var
  lINI: TIniFile;
begin
  lINI := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'config.ini');

  try
    FLinguagem := lINI.ReadInteger('CONFIG', 'LINGUAGEM', 9);
    FLinguagemURL := lINI.ReadString('CONFIG', 'LINGUAGEM_URL', 'https://pokeapi.co/api/v2/language/9');
  finally
    FreeAndNil(lINI);
  end;
end;

constructor TConfiguracao.Create;
begin
  inherited;
  CarregarIni;
end;

class function TConfiguracao.ObterInstancia(const pRecarregar: Boolean = True): TConfiguracao;
begin
  if not Assigned(FConfiguracao) then
  begin
    FConfiguracao := TConfiguracao.Create;
  end;

  if pRecarregar then
  begin
    FConfiguracao.CarregarIni;
  end;

  Result := FConfiguracao;
end;

procedure TConfiguracao.SalvarIni(pIndexLinguagem: Integer);
var
  lINI: TIniFile;
  lAPILinguagem: TPokeAPILinguagem;
  lJSONListaLinguagem: TJSONListaLinguagem;
begin
  lINI := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'config.ini');
  lAPILinguagem := TPokeAPILinguagem.ObterInstancia;
  lAPILinguagem.ConfigurarAPI;
  lJSONListaLinguagem := lAPILinguagem.JSON.ToJSONListLanguage;

  try
    lINI.WriteString('CONFIG', 'LINGUAGEM', (pIndexLinguagem).ToString);
    lINI.WriteString('CONFIG', 'LINGUAGEM_URL', lJSONListaLinguagem.Resultados[Pred(pIndexLinguagem)].URL);
  finally
    FreeAndNil(lINI);
    FreeAndNil(lJSONListaLinguagem);
  end;
end;

initialization

finalization
begin
  FreeAndNil(FConfiguracao);
end;

end.
