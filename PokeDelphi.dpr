program PokeDelphi;

{$R *.dres}

uses
  Vcl.Forms,
  PokeDelphi.Forms.Principal in 'Forms\PokeDelphi.Forms.Principal.pas' {frmPrincipal},
  PokeDelphi.Forms.Habilidades in 'Forms\PokeDelphi.Forms.Habilidades.pas' {frmHabilidades},
  PokeDelphi.Forms.Configuracao in 'Forms\PokeDelphi.Forms.Configuracao.pas' {frmConfiguracao},
  PokeDelphi.Forms.Frutas in 'Forms\PokeDelphi.Forms.Frutas.pas' {frmFrutas},
  PokeDelphi.Helpers.JSON in 'Helpers\PokeDelphi.Helpers.JSON.pas',
  PokeDelphi.Helpers.ArrayLista in 'Helpers\PokeDelphi.Helpers.ArrayLista.pas',
  PokeDelphi.Helpers.StringHelper in 'Helpers\PokeDelphi.Helpers.StringHelper.pas',
  PokeDelphi.Helpers.Imagem in 'Helpers\PokeDelphi.Helpers.Imagem.pas',
  PokeDelphi.Helpers.Enums in 'Helpers\PokeDelphi.Helpers.Enums.pas',
  PokeDelphi.Constantes.Configuracao in 'Constantes\PokeDelphi.Constantes.Configuracao.pas',
  PokeDelphi.Classes.JSON.Habilidades.Detalhes in 'Classes\JSON\Habilidades\PokeDelphi.Classes.JSON.Habilidades.Detalhes.pas',
  PokeDelphi.Classes.JSON.Habilidades.Lista in 'Classes\JSON\Habilidades\PokeDelphi.Classes.JSON.Habilidades.Lista.pas',
  PokeDelphi.Classes.JSON.Efeitos.Mudanca in 'Classes\JSON\Efeitos\PokeDelphi.Classes.JSON.Efeitos.Mudanca.pas',
  PokeDelphi.Classes.JSON.Efeitos.Entrada in 'Classes\JSON\Efeitos\PokeDelphi.Classes.JSON.Efeitos.Entrada.pas',
  PokeDelphi.Classes.JSON.Linguagem in 'Classes\JSON\Linguagem\PokeDelphi.Classes.JSON.Linguagem.pas',
  PokeDelphi.Classes.JSON.Generico.NomeURL in 'Classes\JSON\Generico\PokeDelphi.Classes.JSON.Generico.NomeURL.pas',
  PokeDelphi.Classes.JSON.Habilidades in 'Classes\JSON\Habilidades\PokeDelphi.Classes.JSON.Habilidades.pas',
  PokeDelphi.Classes.JSON.VersaoGrupo in 'Classes\JSON\VersaoGrupo\PokeDelphi.Classes.JSON.VersaoGrupo.pas',
  PokeDelphi.Classes.JSON.TextoEntradaAroma in 'Classes\JSON\TextoEntradaAroma\PokeDelphi.Classes.JSON.TextoEntradaAroma.pas',
  PokeDelphi.Classes.JSON.Geracao in 'Classes\JSON\Geracao\PokeDelphi.Classes.JSON.Geracao.pas',
  PokeDelphi.Classes.JSON.Nomes in 'Classes\JSON\Nomes\PokeDelphi.Classes.JSON.Nomes.pas',
  PokeDelphi.Classes.JSON.Pokemon in 'Classes\JSON\Pokemon\PokeDelphi.Classes.JSON.Pokemon.pas',
  PokeDelphi.Classes.JSON.Pokemon.Pokemon in 'Classes\JSON\Pokemon\PokeDelphi.Classes.JSON.Pokemon.Pokemon.pas',
  PokeDelphi.Classes.API.Base in 'Classes\API\PokeDelphi.Classes.API.Base.pas',
  PokeDelphi.Classes.API.Habilidades in 'Classes\API\PokeDelphi.Classes.API.Habilidades.pas',
  PokeDelphi.Classes.JSON.Linguagem.Lista in 'Classes\JSON\Linguagem\PokeDelphi.Classes.JSON.Linguagem.Lista.pas',
  PokeDelphi.Classes.JSON.Generico.Lista in 'Classes\JSON\Generico\PokeDelphi.Classes.JSON.Generico.Lista.pas',
  PokeDelphi.Classes.API.Linguagens in 'Classes\API\PokeDelphi.Classes.API.Linguagens.pas',
  PokeDelphi.Classes.JSON.Linguagem.Detalhe in 'Classes\JSON\Linguagem\PokeDelphi.Classes.JSON.Linguagem.Detalhe.pas',
  PokeDelphi.Classes.JSON.Geracao.Detalhe in 'Classes\JSON\Geracao\PokeDelphi.Classes.JSON.Geracao.Detalhe.pas',
  PokeDelphi.Classes.JSON.Regioes in 'Classes\JSON\Regioes\PokeDelphi.Classes.JSON.Regioes.pas',
  PokeDelphi.Classes.JSON.Movimentos in 'Classes\JSON\Movimentos\PokeDelphi.Classes.JSON.Movimentos.pas',
  PokeDelphi.Classes.JSON.Pokemon.Especies in 'Classes\JSON\Pokemon\PokeDelphi.Classes.JSON.Pokemon.Especies.pas',
  PokeDelphi.Classes.JSON.Tipos in 'Classes\JSON\Tipos\PokeDelphi.Classes.JSON.Tipos.pas',
  PokeDelphi.Classes.Configuracao in 'Classes\Configuracao\PokeDelphi.Classes.Configuracao.pas',
  PokeDelphi.Classes.API.Geracoes in 'Classes\API\PokeDelphi.Classes.API.Geracoes.pas',
  PokeDelphi.Classes.JSON.Frutas.Detalhe in 'Classes\JSON\Frutas\PokeDelphi.Classes.JSON.Frutas.Detalhe.pas',
  PokeDelphi.Classes.JSON.Frutas.Lista in 'Classes\JSON\Frutas\PokeDelphi.Classes.JSON.Frutas.Lista.pas',
  PokeDelphi.Classes.JSON.Frutas in 'Classes\JSON\Frutas\PokeDelphi.Classes.JSON.Frutas.pas',
  PokeDelphi.Classes.API.Frutas in 'Classes\API\PokeDelphi.Classes.API.Frutas.pas',
  PokeDelphi.Classes.JSON.FirmezaFruta in 'Classes\JSON\FirmezaFruta\PokeDelphi.Classes.JSON.FirmezaFruta.pas',
  PokeDelphi.Classes.JSON.SaboresFrutas.Sabores in 'Classes\JSON\SaboresFrutas\PokeDelphi.Classes.JSON.SaboresFrutas.Sabores.pas',
  PokeDelphi.Classes.JSON.SaboresFrutas in 'Classes\JSON\SaboresFrutas\PokeDelphi.Classes.JSON.SaboresFrutas.pas',
  PokeDelphi.Classes.JSON.Itens in 'Classes\JSON\Itens\PokeDelphi.Classes.JSON.Itens.pas',
  PokeDelphi.Classes.API.Itens in 'Classes\API\PokeDelphi.Classes.API.Itens.pas',
  PokeDelphi.Classes.JSON.Itens.Lista in 'Classes\JSON\Itens\PokeDelphi.Classes.JSON.Itens.Lista.pas',
  PokeDelphi.Classes.JSON.Itens.Detalhe in 'Classes\JSON\Itens\PokeDelphi.Classes.JSON.Itens.Detalhe.pas',
  PokeDelphi.Classes.JSON.ItemAtributos in 'Classes\JSON\ItemAtributos\PokeDelphi.Classes.JSON.ItemAtributos.pas',
  PokeDelphi.Classes.JSON.CadeiasEvolucoes in 'Classes\JSON\CadeiasEvolucoes\PokeDelphi.Classes.JSON.CadeiasEvolucoes.pas',
  PokeDelphi.Classes.JSON.ItemCategorias in 'Classes\JSON\ItemCategorias\PokeDelphi.Classes.JSON.ItemCategorias.pas',
  PokeDelphi.Classes.JSON.EfeitosItemArremesso in 'Classes\JSON\EfeitosItemAremesso\PokeDelphi.Classes.JSON.EfeitosItemArremesso.pas',
  PokeDelphi.Classes.JSON.IndicesJogo in 'Classes\JSON\IndicesJogo\PokeDelphi.Classes.JSON.IndicesJogo.pas',
  PokeDelphi.Classes.JSON.ItensSegurados in 'Classes\JSON\ItensSegurados\PokeDelphi.Classes.JSON.ItensSegurados.pas',
  PokeDelphi.Classes.JSON.VersaoDetalhe in 'Classes\JSON\VersaoDetalhe\PokeDelphi.Classes.JSON.VersaoDetalhe.pas',
  PokeDelphi.Classes.JSON.Versao in 'Classes\JSON\Versao\PokeDelphi.Classes.JSON.Versao.pas',
  PokeDelphi.Classes.JSON.Maquinas.Maquina in 'Classes\JSON\Maquinas\PokeDelphi.Classes.JSON.Maquinas.Maquina.pas',
  PokeDelphi.Classes.JSON.Maquinas in 'Classes\JSON\Maquinas\PokeDelphi.Classes.JSON.Maquinas.pas',
  PokeDelphi.Classes.JSON.Imagens.Item in 'Classes\JSON\Imagens\PokeDelphi.Classes.JSON.Imagens.Item.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
