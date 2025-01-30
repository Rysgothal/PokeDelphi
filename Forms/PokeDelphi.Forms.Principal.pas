unit PokeDelphi.Forms.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.Imaging.pngimage;

type
  TfrmPrincipal = class(TForm)
    mnuMenuPrincipal: TMainMenu;
    meiBuscar: TMenuItem;
    meiBuscarHabilidades: TMenuItem;
    stbBarraDeStatus: TStatusBar;
    tmrHorario: TTimer;
    imgLogoAPI: TImage;
    meiConfiguracao: TMenuItem;
    meiBuscarFrutas: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure tmrHorarioTimer(Sender: TObject);
    procedure meiBuscarHabilidadesClick(Sender: TObject);
    procedure imgLogoAPIMouseEnter(Sender: TObject);
    procedure imgLogoAPIMouseLeave(Sender: TObject);
    procedure meiConfiguracaoClick(Sender: TObject);
    procedure meiBuscarFrutasClick(Sender: TObject);
  private
    { Private declarations }
    procedure AbrirTelaHabilidades;
    procedure AbrirTelaConfiguracao;
    procedure AbrirTelaFrutas;
    procedure EstabelecerConexaoAPI;
    procedure AtualizarHorario;
    procedure CarregarImagemCentral(pNomeImagem: string);
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  PokeDelphi.Classes.API.Base, PokeDelphi.Forms.Habilidades,
  PokeDelphi.Forms.Configuracao, PokeDelphi.Forms.Frutas;

{$R *.dfm}

procedure TfrmPrincipal.AbrirTelaFrutas;
begin
  if not Assigned(frmFrutas) then
  begin
    frmFrutas := TfrmFrutas.Create(Self);
  end;

  frmFrutas.Show;
end;

procedure TfrmPrincipal.AbrirTelaHabilidades;
begin
  if not Assigned(frmHabilidades) then
  begin
    frmHabilidades := TfrmHabilidades.Create(Self);
  end;

  frmHabilidades.Show;
end;

procedure TfrmPrincipal.AtualizarHorario;
begin
  stbBarraDeStatus.Panels[0].Text := FormatDateTime('ddddddd', Now);
  stbBarraDeStatus.Panels[1].Text := TimeToStr(Now);
end;

procedure TfrmPrincipal.CarregarImagemCentral(pNomeImagem: string);
var
  lRStream: TResourceStream;
  lLogo: TPngImage;
begin
  lRStream := TResourceStream.Create(HInstance, pNomeImagem, RT_RCDATA);
  lLogo := TPngImage.Create;

  try
    lLogo.LoadFromStream(lRStream);
    imgLogoAPI.Picture.Graphic := lLogo;

  finally
    FreeAndNil(lLogo);
    FreeAndNil(lRStream);
  end;
end;

procedure TfrmPrincipal.AbrirTelaConfiguracao;
begin
  if not Assigned(frmConfiguracao) then
  begin
    frmConfiguracao := TfrmConfiguracao.Create(Self);
  end;
  frmConfiguracao.Show;
end;

procedure TfrmPrincipal.EstabelecerConexaoAPI;
var
  lPokeAPI: TBasePokeAPI;
begin
  lPokeAPI := TBasePokeAPI.ObterInstancia('https://pokeapi.co/api/v2/');

  if not lPokeAPI.Status then
  begin
    Application.MessageBox('Não foi possível se comunicar com a API', 'Desconectado');
    Close;
  end;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  EstabelecerConexaoAPI;
end;

procedure TfrmPrincipal.imgLogoAPIMouseEnter(Sender: TObject);
begin
  CarregarImagemCentral('PokeAPi');
end;

procedure TfrmPrincipal.imgLogoAPIMouseLeave(Sender: TObject);
begin
  CarregarImagemCentral('PokeAPi_OFF');
end;

procedure TfrmPrincipal.meiBuscarFrutasClick(Sender: TObject);
begin
  AbrirTelaFrutas;
end;

procedure TfrmPrincipal.meiBuscarHabilidadesClick(Sender: TObject);
begin
  AbrirTelaHabilidades;
end;

procedure TfrmPrincipal.meiConfiguracaoClick(Sender: TObject);
begin
  AbrirTelaConfiguracao;
end;

procedure TfrmPrincipal.tmrHorarioTimer(Sender: TObject);
begin
  AtualizarHorario;
end;

end.
