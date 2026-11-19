# Waves LV1 para o Companion: versões beta

Aqui ficam as versões beta do módulo **Waves eMotion LV1** para o
[Bitfocus Companion](https://bitfocus.io/companion), antes de chegarem à loja de módulos do
Companion. São versões de teste: podem ter falhas. Se encontrares alguma, avisa o Miguel.

Precisas do **Companion 5.0 ou mais recente**.

## Instalar

Vai a **[Releases](../../releases)** e descarrega da versão mais recente:

| Ficheiro | Para quê |
| --- | --- |
| `WavesLV1-Companion-…-Setup.exe` | instala o módulo no Companion, em **Windows** |
| `WavesLV1-Companion-….pkg` | instala o módulo no Companion, em **macOS** |
| `waves-lv1-….tgz` | o módulo em si, para importar à mão (qualquer sistema) |
| `CompanionSurface-Setup.exe` / `.pkg` | o driver **Companion Surface**, no computador da eMotion (Windows / macOS) |

1. Abre o instalador do teu sistema no computador onde corre o **Companion**.
   - Windows: se aparecer "O Windows protegeu o computador", carrega em *Mais informações* →
     *Executar mesmo assim* (o instalador não está assinado).
   - macOS: se o Mac não o deixar abrir, carrega com o botão direito no `.pkg` → *Abrir*.
2. **Fecha o Companion** (ícone junto ao relógio / na barra de menus → *Quit*) e abre-o outra vez.
3. Na ligação **Waves LV1**, escolhe a versão beta (aparece como *Beta*). Numa ligação nova,
   escolhe-a ao adicionar.

Sem instalador: no Companion, na página **Modules**, importa o ficheiro `waves-lv1-….tgz`. Assim
nem é preciso reiniciar o Companion. O Companion só aceita esta importação a partir do próprio
computador onde ele corre (o browser desse computador), a não ser que a ative nas definições do
launcher, em *Dangerous Features*.

### O driver Companion Surface

O modo **Companion Surface** precisa do driver no computador onde corre a eMotion LV1 (pode ser
outro computador). Instala-o com a eMotion fechada. Depois abre a eMotion e, em *Controls*, junta
o **Companion Surface**. O módulo também mostra esses instaladores na página de instalação que
aparece nas definições da ligação.

## Voltar à versão normal

Na ligação Waves LV1, escolhe outra vez a versão estável. Para tirar a beta do computador:

- Windows: *Definições → Aplicações* → *Waves LV1 for Companion …* → Desinstalar.
- macOS: apaga a pasta `~/Library/Application Support/companion/modules/waves-lv1-…-beta…`.
