unit PokeDelphi.Helpers.Imagem;

interface

uses
  Vcl.ExtCtrls;

type
  TImageHelper = class Helper for TImage
  public
    procedure CarregarImagemURL(const pURL: string);
  end;

implementation

uses
  System.Classes, System.SysUtils, System.Net.HttpClient;

{ TImageHelper }

procedure TImageHelper.CarregarImagemURL(const pURL: string);
var
  lHttpClient: THTTPClient;
  lMS: TMemoryStream;
begin
  lMS := TMemoryStream.Create;
  lHttpClient := THTTPClient.Create;

  try
    lHttpClient.Get(pURL, lMS);
    Picture.LoadFromStream(lMS);
  finally
    FreeAndNil(lHttpClient);
    FreeAndNil(lMS);
  end;
end;

end.
