unit PokeDelphi.Helpers.StringHelper;

interface

uses
  System.SysUtils;

type
  TStringHelper = class abstract
  public
    class function ObterNomeUltimoCaminho(const pValor: string; const pSeparador: string = '/'): string;
  end;

implementation

uses
  System.StrUtils;

{ TStringHelper }

class function TStringHelper.ObterNomeUltimoCaminho(const pValor: string; const pSeparador: string = '/'): string;
var
  lLista: TArray<string>;
begin
  lLista := SplitString(pValor, pSeparador);

  for var I := Pred(Length(lLista)) downto 0 do
  begin
    if Trim(lLista[I]) = EmptyStr then
    begin
      Continue;
    end;

    Exit(lLista[I]);
  end;
end;

end.
