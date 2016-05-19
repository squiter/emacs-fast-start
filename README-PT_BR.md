Emacs Fast Start
----------------

Esse repositorio tem o propsito de ajudar os usuários a começar a usar o editor Emacs. Nessa base de código eu preferi instalar apenas os pacotes essenciais para que você possa ter um começo feliz com esse editor fantástico.

## Instalação

Antes de começar, garanta que voce não tem `.emacs` ou `.emacs.d` no seu diretório pessoal (HOME):

```
ls -la ~/ | grep emacs
```

Esse comando não deveria retornar nada!

Agora que garantimos que você não tem nenhum arquivo de configuração, vamos começar!  

#### Clone o repositório:

```
git@github.com:squiter/emacs-fast-start.git
```

Entre no diretório:

```
cd emacs-fast-start
```

Execute o `make`:

```
make
```

Isso vai copiar o `.emacs` e o `.emacs.d` para seu diretório pessoal.

Legal, é isso!

## Começando com o Emacs

### Downloading

Para usuários de OSX eu recomento que você use qualquer um desses builds do Emacs:

* [Emacs for OSX ](http://emacsformacosx.com/);
* [Emacs Mac Port](https://github.com/railwaycat/homebrew-emacsmacport/releases);
* Paara entender a diferença entre esses builds eu recomendo essa leitura (em ingles): [Stack Overflow](http://emacs.stackexchange.com/questions/271/what-is-the-difference-between-aquamacs-and-other-mac-versions-of-emacs)

Para usuários de Ubuntu:

```
cd /tmp/
wget http://alpha.gnu.org/gnu/emacs/pretest/emacs-25.0.93.tar.xz
tar -xvf emacs-25.0.93.tar.xz

sudo apt-get build-dep emacs24 -y

cd emacs-25.0.93
./configure
./make
sudo make install

rm -rf /tmp/emacs-25.0.93*
```

### Aprendendo mais

Antes de mais nada, você precisa entender como falar a lingua do Emacs:

* <kbd>C</kbd> is `ctrl`;
* <kbd>M</kbd> is `Meta` que na minha configuração é o `alt`;
* <kbd>S</kbd> is `Super` que na minha configuração é o `command`.

Quando eu disser <kbd>C-h t</kbd> você deve segurar o `ctrl` e `h` simultaneamente, soltá-los e precionar o `t`.


#### Tutorial

Agora eu recomendo que você abre o Emacs e com o <kbd>C-h t</kbd> abra o EmacsTutorial. Esse é o tutorial padrão do Emacs, em inglês, mas é bastante simples de se entender.

## Mais sobre esse repositório

Esse repositório tem um [arquivo de incialização](http://www.gnu.org/software/emacs/manual/html_node/emacs/Init-File.html) chamado de `.emacs`. Nesse arquivo eu chamo todos os arquivos o que precisamos para começar, vamos dar uma olhada em alguns deles:

* `init-packages` contém todas as configurações para instalar novos pacotes;
* `init-constants` contém configurações de diretórios. **Você deve dar uma boa olhada nesse arquivo.**;
* `init-custom-functions` contém algumas funções que eu senti falta quando migrei do VIM, como o `o` que criava uma nova linha;
* `init-mac-switch-meta` contém configurações específicas para OSX.

### Atalhos úties

* <kbd>M-x</kbd> - É uma versão do `M-x` padrão que roda dentro do `Helm`.
* <kbd>C-c o</kbd> - Abrir um projeto, escrito pelo [Renan Ranelli](http://twitter.com/rranelli), essa função usa o `Helm` e o `Projectile` para listar seus projetos;
* <kbd>C-x f</kbd> - Após entrar em um projeto, você pode buscar um arquivo com esse comando;
* <kbd>C-<return></kbd> - Insere uma linha abaixo;
* <kbd>C-a</kbd> - Vai para o inicio da linha, se precionado duas vezes vai para o primeio caracter da linha;
* <kbd>C-c d</kbd> - Duplica a linha;
* <kbd>C-x -</kbd> - Para dividir o buffer horizontalmente;
* <kbd>C-x |</kbd> - Para dividir o buffer verticalmente;
* <kbd>C-x =</kbd> - Para inverter seus buffers;
* <kbd>C-x C-k</kbd> - Para deletar o arquivo do buffer atual;
* <kbd>C-x C-r</kbd> - Para renomear o arquivo do buffer atual;
* <kbd>C-c /</kbd> - Adiciona/Remove os comentários das linhas selecionadas;
* <kbd>C-c j</kbd> - Para juntar linhas;
* <kbd>C-c w</kbd> - Para tirar os espaços em branco do buffer;
* <kbd>C-c i</kbd> - Para identar o buffer atual;

\* *Você precisa configurar seu diretório de projetos no `.emacs.d/conf/init-constants.el` antes de começar a usar*.

### OSX Keybindings

* <kbd>S-a</kbd> - Marcar o buffer inteiro;
* <kbd>S-v</kbd> - Yank (colar);
* <kbd>S-c</kbd> - Kill ring (copiar);
* <kbd>S-s</kbd> - Salvar o buffer atual;
* <kbd>S-l</kbd> - Ir para a linha;
* <kbd>S-w</kbd> - Fechar o buffer atual;
* <kbd>S-z</kbd> - Desfazer;
* <kbd>S-u</kbd> - Reverter as alterações do buffer.

### Pacotes

A ideia desse repositório é deixar que você escolha o que é o mais importante para você, então eu adicionei o mínimo possível de pacotes aqui.

* [auto-package-update](https://github.com/rranelli/auto-package-update.el);
* [helm](https://github.com/emacs-helm/helm);
* [helm-projectile](https://github.com/bbatsov/projectile/blob/master/helm-projectile.el);
* [magit](https://github.com/magit/magit);
* [projectile](https://github.com/bbatsov/projectile).
