unit PokeDelphi.Forms.Habilidades;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, PokeDelphi.Classes.API.Habilidades,
  PokeDelphi.Classes.JSON.Habilidades.Detalhes, Vcl.Buttons, System.Classes, System.ImageList, Vcl.ImgList, 
  PokeDelphi.Helpers.Enums, PokeDelphi.Classes.JSON.Pokemon,
  PokeDelphi.Classes.JSON.TextoEntradaAroma, PokeDelphi.Classes.Configuracao,
  PokeDelphi.Constantes.Configuracao;

type
  TfrmHabilidades = class(TForm)
    pnlNomeHabilidade: TPanel;
    btnAnterior: TButton;
    btnPrimeiroRegistro: TButton;
    btnProximo: TButton;
    btnUltimoRegistro: TButton;
    edtGeracao: TLabeledEdit;
    btnMaisInformacaoGeracao: TSpeedButton;
    edtSeriePrincipal: TLabeledEdit;
    gbxMudancaEfeito: TGroupBox;
    lblEfeito: TLabel;
    memEfeitos: TMemo;
    pnlEfeitoEntrada: TPanel;
    memDescricaoEfeitoEntrada: TMemo;
    imgLista: TImageList;
    btnResumo: TSpeedButton;
    lblDetalheHabilidade: TLabel;
    pnlPokemons: TPanel;
    lblPokemons: TLabel;
    lblNomePokemon: TLabel;
    lblPosicaoPokemon: TLabel;
    btnProximoPokemon: TButton;
    btnAnteriorPokemon: TButton;
    pnlSlot01: TPanel;
    pnlSlot02: TPanel;
    pnlSlot03: TPanel;
    pnlSlot04: TPanel;
    lblHabilidadeEscondida: TLabel;
    gbxFrasesSabor: TGroupBox;
    memFrasesSabor: TMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnPrimeiroRegistroClick(Sender: TObject);
    procedure btnUltimoRegistroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnResumoClick(Sender: TObject);
    procedure btnAnteriorPokemonClick(Sender: TObject);
    procedure btnProximoPokemonClick(Sender: TObject);
  private
    FIndexPokemon: Integer;
    procedure AlimentarComponentes(const pPokeAPI: TPokeApiHabilidades);
    procedure AlimentarComponentesEfeitosMudanca(const pJSON: TJSONHabilidadeDetalhes);
    procedure AlimentarComponentesPokemon(const pPokemons: TArray<TJSONPokemonDetalhe>);
    procedure AlimentarComponentesFrasesSabor(const pFrases: TArray<TJSONTextoEntradaAroma>);
    procedure ObterDetalheHabilidade(pAcao: TAcaoBarraNavegacao);
    procedure ObterDetalhePokemon(pAcao: TAcaoBarraNavegacao);
    function ObterTodosIdiomasFrasesAroma(const pFrases: TArray<TJSONTextoEntradaAroma>): string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmHabilidades: TfrmHabilidades;

implementation

uses
  PokeDelphi.Classes.API.Base, PokeDelphi.Classes.JSON.Habilidades, PokeDelphi.Helpers.JSON, StrUtils, System.Math;

{$R *.dfm}

procedure TfrmHabilidades.AlimentarComponentes(const pPokeAPI: TPokeApiHabilidades);
var
  lJSONDetalhe: TJSONHabilidadeDetalhes;
begin
  lJSONDetalhe := pPokeAPI.JSON.ToJSONAbility;
  
  try
    FIndexPokemon := 0;
    pnlNomeHabilidade.Caption := lJSONDetalhe.ID.ToString.PadLeft(6, '0') + ' - ' + lJSONDetalhe.Nome.ToUpper;
    edtGeracao.Text := lJSONDetalhe.Geracao.Nome.ToUpper;
    edtSeriePrincipal.Text := IfThen(lJSONDetalhe.SeriePrincipal, 'Sim', 'Não');
    edtSeriePrincipal.Font.Color := IfThen(lJSONDetalhe.SeriePrincipal, clGreen, clRed);

    btnResumo.Enabled := Assigned(lJSONDetalhe.EfeitoEntradaLista);

    case Assigned(lJSONDetalhe.EfeitoEntrada) of
      True: memDescricaoEfeitoEntrada.Lines.Text := ' >> ' + lJSONDetalhe.EfeitoEntrada.Efeito;
      else  memDescricaoEfeitoEntrada.Lines.Text := ' >> Sem Efeito';
    end;

    AlimentarComponentesEfeitosMudanca(lJSONDetalhe);
    AlimentarComponentesPokemon(lJSONDetalhe.Pokemons);
    AlimentarComponentesFrasesSabor(lJSONDetalhe.TextoEntradaAroma);
  finally
    FreeAndNil(lJSONDetalhe);
  end;
end;

procedure TfrmHabilidades.btnResumoClick(Sender: TObject);
var
  lAPIHabilidades: TPokeApiHabilidades;
  lJSONDetalhe: TJSONHabilidadeDetalhes;
  lDetalhe, lTitulo: string;
begin
  lAPIHabilidades := TPokeApiHabilidades.ObterInstancia;
  lJSONDetalhe := lAPIHabilidades.JSON.ToJSONAbility;

  try
    lDetalhe := lJSONDetalhe.EfeitoEntrada.Efeito;
    lTitulo := 'Detalhe:';

    if lblDetalheHabilidade.Caption = lTitulo then
    begin
      lDetalhe := lJSONDetalhe.EfeitoEntrada.EfeitoCurto;
      lTitulo := 'Resumo:';
    end;

    memDescricaoEfeitoEntrada.Lines.Text := lDetalhe;
    lblDetalheHabilidade.Caption := lTitulo;
  finally
    FreeAndNil(lJSONDetalhe);
  end;
end;

procedure TfrmHabilidades.AlimentarComponentesEfeitosMudanca(const pJSON: TJSONHabilidadeDetalhes);
var
  lPos: Integer;
  lEfeitos, lVersaoGrupo: string;
begin   
  lPos := 0;      
  lEfeitos := EmptyStr;
  lVersaoGrupo := EmptyStr;
  
  for var lEfeito in pJSON.EfeitoMudanca do
  begin
    Inc(lPos);                                                                                
    lVersaoGrupo := lEfeito.VersaoGrupo.Nome;

    lEfeitos := lEfeitos + lPos.ToString.PadLeft(2, '0') + ': ' + lEfeito.EfeitosEntrada.Efeito + #13
      + '>> Versão do Grupo: ' + lVersaoGrupo + #13#13;   
  end;

  if Length(pJSON.EfeitoMudanca) = 0 then
  begin                                  
    lVersaoGrupo := 'Sem Versão do Grupo';
    lEfeitos := 'Sem Efeitos...' + #13 + '>> Versão do Grupo: ' + lVersaoGrupo;  
  end;
    
  memEfeitos.Lines.Text := lEfeitos;
  lblDetalheHabilidade.Caption := 'Detalhe:';
end;

procedure TfrmHabilidades.AlimentarComponentesFrasesSabor(const pFrases: TArray<TJSONTextoEntradaAroma>);
var
  lConfiguracao: TConfiguracao;
  lFrases, lURLLinguagem: string;
  lPos: Integer;
  lPossuiLinguagemSelecionada: Boolean;
begin
  lConfiguracao := TConfiguracao.ObterInstancia;
  lFrases := EmptyStr;
  lPos := 0;
  lURLLinguagem := lConfiguracao.LinguagemURL.ToUpper.Trim;
  
  lPossuiLinguagemSelecionada := ObterTodosIdiomasFrasesAroma(pFrases).Contains(lURLLinguagem);

  if not lPossuiLinguagemSelecionada then
  begin
    lURLLinguagem := PADRAO_LINGUAGEM_URL.ToUpper.Trim;
  end;

  for var lItem in pFrases do
  begin
    if not lItem.Linguagem.URL.ToUpper.Trim.Equals(lURLLinguagem) then
    begin
      Continue;
    end;

    Inc(lPos);
    lFrases := lFrases + '(' + lPos.ToString.PadLeft(2, '0') + ') ' + lItem.AromaTexto + #13 + 
      '>> Versão do Grupo: ' + lItem.VersaoGrupo.Nome + #13#13;
  end;

  memFrasesSabor.Lines.Text := lFrases;
end;

procedure TfrmHabilidades.AlimentarComponentesPokemon(const pPokemons: TArray<TJSONPokemonDetalhe>);
begin
  pnlSlot01.Font.Color := clBlack;
  pnlSlot02.Font.Color := clBlack;
  pnlSlot03.Font.Color := clBlack;
  pnlSlot04.Font.Color := clBlack;

  if Length(pPokemons) = 0 then
  begin
    lblNomePokemon.Caption := 'Sem Pokémon';
    lblPosicaoPokemon.Caption := '00/00';

    Exit;
  end;

  lblNomePokemon.Caption := pPokemons[FIndexPokemon].Pokemon.Nome.ToUpper;
  lblPosicaoPokemon.Caption := (FIndexPokemon + 1).ToString.PadLeft(2, '0') + '/'
    + Length(pPokemons).ToString.PadLeft(2, '0');

  pnlSlot01.Font.Color := IfThen(pPokemons[FIndexPokemon].Slot = 1, clGreen, clBlack);
  pnlSlot02.Font.Color := IfThen(pPokemons[FIndexPokemon].Slot = 2, clGreen, clBlack);
  pnlSlot03.Font.Color := IfThen(pPokemons[FIndexPokemon].Slot = 3, clGreen, clBlack);
  pnlSlot04.Font.Color := clBlack;

  if not (pPokemons[FIndexPokemon].Slot in [1,2,3]) then
  begin
    pnlSlot01.Font.Color := clBlack;
    pnlSlot02.Font.Color := clBlack;
    pnlSlot03.Font.Color := clBlack;
    pnlSlot04.Font.Color := clGreen;
  end;

  lblHabilidadeEscondida.Visible := pPokemons[FIndexPokemon].Escondido;
end;

procedure TfrmHabilidades.btnAnteriorClick(Sender: TObject);
begin
  ObterDetalheHabilidade(anAnterior);
end;

procedure TfrmHabilidades.btnAnteriorPokemonClick(Sender: TObject);
begin
  ObterDetalhePokemon(anAnterior);
end;

procedure TfrmHabilidades.btnPrimeiroRegistroClick(Sender: TObject);
begin
  ObterDetalheHabilidade(anPrimeiro);
end;

procedure TfrmHabilidades.btnProximoClick(Sender: TObject);
begin
  ObterDetalheHabilidade(anProximo);
end;

procedure TfrmHabilidades.btnProximoPokemonClick(Sender: TObject);
begin
  ObterDetalhePokemon(anProximo);
end;

procedure TfrmHabilidades.btnUltimoRegistroClick(Sender: TObject);
begin
  ObterDetalheHabilidade(anUltimo);
end;

procedure TfrmHabilidades.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(frmHabilidades);
end;

procedure TfrmHabilidades.FormCreate(Sender: TObject);
begin
  ObterDetalheHabilidade(anPrimeiro)
end;

procedure TfrmHabilidades.ObterDetalheHabilidade(pAcao: TAcaoBarraNavegacao);
var
  lAPIHabilidades: TPokeApiHabilidades;
begin
  lAPIHabilidades := TPokeApiHabilidades.ObterInstancia;

  case pAcao of
    anNenhum: Exit;
    anPrimeiro: lAPIHabilidades.ObterPrimeiro;
    anAnterior: lAPIHabilidades.ObterAnterior;
    anProximo: lAPIHabilidades.ObterProximo;
    anUltimo: lAPIHabilidades.ObterUltimo;
  end;

  AlimentarComponentes(lAPIHabilidades);
end;

procedure TfrmHabilidades.ObterDetalhePokemon(pAcao: TAcaoBarraNavegacao);
var
  lJSONDetalhe: TJSONHabilidadeDetalhes;
begin
  lJSONDetalhe := TPokeApiHabilidades.ObterInstancia.JSON.ToJSONAbility;

  try
    if (pAcao = anProximo) and (Succ(FIndexPokemon) > Pred(Length(lJSONDetalhe.Pokemons))) then
    begin
      Exit;
    end;

    if (pAcao = anAnterior) and (Pred(FIndexPokemon) < 0) then
    begin
      Exit;
    end;

    case pAcao of
      anProximo: Inc(FIndexPokemon);
      anAnterior: Dec(FIndexPokemon);
      else Exit;
    end;

    AlimentarComponentesPokemon(lJSONDetalhe.Pokemons);
  finally
    FreeAndNil(lJSONDetalhe);
  end;
end;

function TfrmHabilidades.ObterTodosIdiomasFrasesAroma(const pFrases: TArray<TJSONTextoEntradaAroma>): string;
begin
  for var lItem in pFrases do
  begin
    if Result.Contains(lItem.Linguagem.URL.ToUpper.Trim) then
    begin
      Continue;
    end;
    
    Result := Result + ' | ' + lItem.Linguagem.URL.ToUpper.Trim;
  end;

  Result := Copy(Result, 3, Length(Result));
end;

end.
