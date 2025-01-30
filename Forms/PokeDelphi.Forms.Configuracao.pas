unit PokeDelphi.Forms.Configuracao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  PokeDelphi.Classes.API.Linguagens, PokeDelphi.Classes.JSON.Linguagem.Lista;

type
  TfrmConfiguracao = class(TForm)
    gbxConfiguracao: TGroupBox;
    lblLinguagem: TLabel;
    cbxLinguagem: TComboBox;
    btnGravar: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnGravarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure GravarArquivoIni;
    procedure CarregarArquivoIni;
    procedure CarregarLinguagensExistentes;
    procedure CarregarConfiguracoes;
  public
    { Public declarations }
  end;

var
  frmConfiguracao: TfrmConfiguracao;

implementation

uses
  System.SysUtils, PokeDelphi.Helpers.JSON, 
  PokeDelphi.Classes.JSON.Linguagem.Detalhe, PokeDelphi.Classes.Configuracao;

{$R *.dfm}

procedure TfrmConfiguracao.btnGravarClick(Sender: TObject);
begin
  GravarArquivoIni;
  Close;
end;

procedure TfrmConfiguracao.CarregarArquivoIni;
var
  lConfiguracao: TConfiguracao;
  lAPILinguagem: TPokeAPILinguagem;
  lJSONLinguagem: TJSONLinguagemDetalhe;
begin
  lConfiguracao := TConfiguracao.ObterInstancia;
  lAPILinguagem := TPokeAPILinguagem.ObterInstancia;
  lAPILinguagem.ConfigurarAPI('/{ID}/', [lConfiguracao.Linguagem.ToString]);

  lJSONLinguagem := lAPILinguagem.JSON.ToJSONLanguage;

  try
    cbxLinguagem.ItemIndex := cbxLinguagem.Items.IndexOf(lJSONLinguagem.Nome.ToUpper);
  finally
    FreeAndNil(lJSONLinguagem);
  end;
end;

procedure TfrmConfiguracao.CarregarConfiguracoes;
begin
  CarregarLinguagensExistentes;
  CarregarArquivoIni;
end;

procedure TfrmConfiguracao.CarregarLinguagensExistentes;
var
  lAPILinguagem: TPokeAPILinguagem;
  lJSONListaLinguagem: TJSONListaLinguagem;
begin
  lAPILinguagem := TPokeAPILinguagem.ObterInstancia;
  lAPILinguagem.ConfigurarAPI;
  lJSONListaLinguagem := lAPILinguagem.JSON.ToJSONListLanguage;

  try
    for var lItem in lJSONListaLinguagem.Resultados do
    begin
      cbxLinguagem.Items.Add(lItem.Nome.ToUpper);
    end;
  finally
    FreeAndNil(lJSONListaLinguagem);
  end;
end;

procedure TfrmConfiguracao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(frmConfiguracao);
end;

procedure TfrmConfiguracao.FormCreate(Sender: TObject);
begin
  CarregarConfiguracoes;
end;

procedure TfrmConfiguracao.GravarArquivoIni;
var
  lConfiguracao: TConfiguracao;
begin
  lConfiguracao := TConfiguracao.ObterInstancia;
  lConfiguracao.SalvarIni(cbxLinguagem.ItemIndex + 1);
end;

end.
