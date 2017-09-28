Brumacs Fast Start
----------------

This repo is proposed to help users to start using Emacs editor. In this code I choose the essential packages and configurations to have a happy start with this amazing editor.

## Installation

Before start, make sure that you don't have `.emacs` and `.emacs.d` in your home directory:

```
ls -la ~/ | grep emacs
```

This command shouldn't return anything!

Since you don't have any files in your home directory, let's begin!  

#### Clone the repo:

```
git@github.com:squiter/brumacs-fast-start.git
```

Then enter in repo directory:

```
cd brumacs-fast-start
```

Then make it:

```
make
```

This will copy `.brumacs` and `.emacs.d` to your home directory.

Ok, that's it! :)

## Starting with Brumacs

### Downloading

I'm a OSX user and I recommend you to use one of these builds for Emacs:

* [Emacs for OSX ](http://emacsformacosx.com/);
* [Emacs Mac Port](https://github.com/railwaycat/homebrew-emacsmacport/releases);
* To know all diferences for the builds I recommend you to read this [Stack Overflow answer](http://emacs.stackexchange.com/questions/271/what-is-the-difference-between-aquamacs-and-other-mac-versions-of-emacs)

For Ubuntu you can:

```
sudo apt-get build-dep emacs24 -y

cd /tmp/

wget http://alpha.gnu.org/gnu/emacs/pretest/emacs-25.0.93.tar.xz
tar -xvf emacs-25.0.93.tar.xz

cd emacs-25.0.93
./configure
make
sudo make install

rm -rf /tmp/emacs-25.0.93*
```

### Learning more

First of all, you must understand how to speak Emacs's Language:

* <kbd>C</kbd> is `ctrl`;
* <kbd>M</kbd> is `Meta` that in my configuration is `alt`;
* <kbd>S</kbd> is `Super` that in my configuration is `command`.

When I said <kbd>C-h t</kbd> you must to push `ctrl` and `h` key simultaneously, release it and press `t` key.


#### Tutorial

Now I recommend you to open your Emacs and type: <kbd>C-h t</kbd> and do the EmacsTutorial.

## More about this repository

This repo has a [init-file](http://www.gnu.org/software/emacs/manual/html_node/emacs/Init-File.html) called `.emacs`. In this file I call all files that we need to start, let's take a look in some of them:

* `init-packages` have all settings to install packages;
* `init-constants` have some configurations for directories and etc. **You should take a especial look here**;
* `init-custom-functions` have some functions that I missed from Vim, like a new line like 'o' command;
* `init-mac-switch-meta` have some specific OSX configurations. If you don't use OSX you can delete this file.

### Usefull keybindings

* <kbd>M-x</kbd> - It's a version of `M-x` in helm! It's awesome!
* <kbd>C-c o</kbd> - Open project from [Renan Ranelli](http://twitter.com/rranelli), this  function use heml and projectile to list your projects*;
* <kbd>C-x f</kbd> - After enter in a project, you can find any file in there with this keybinding;
* <kbd>C-<return></kbd> - Insert a new line (like 'o' of vim);
* <kbd>C-a</kbd> - Smart way to go to start of line, press twice to see the magic;
* <kbd>C-c d</kbd> - Duplicate line;
* <kbd>C-x -</kbd> - To split your buffer horizontally;
* <kbd>C-x |</kbd> - To split your buffer vertically;
* <kbd>C-x =</kbd> - To swap your buffers;
* <kbd>C-x C-k</kbd> - Delete current buffer file;
* <kbd>C-x C-r</kbd> - Rename current buffer file;
* <kbd>C-c /</kbd> - Toggle comments in selected lines;
* <kbd>C-c j</kbd> - Join lines;
* <kbd>C-c w</kbd> - Clean buffer whitespaces;
* <kbd>C-c i</kbd> - Auto indent this buffer.

\* *You must configure your project directory in `.emacs.d/conf/init-constants.el` before use it*.

### OSX Keybindings

* <kbd>S-a</kbd> - Mark whole buffer;
* <kbd>S-v</kbd> - Yank (paste);
* <kbd>S-c</kbd> - Kill ring (copy);
* <kbd>S-s</kbd> - Save current buffer;
* <kbd>S-l</kbd> - Go to line;
* <kbd>S-w</kbd> - Delete window;
* <kbd>S-z</kbd> - Undo;
* <kbd>S-k</kbd> - Kill current buffer;
* <kbd>S-u</kbd> - Revert current buffer.

### Packages

The idea of this repository is to let you choose what is the most important to you, so I add a minimal packages here.

* [auto-package-update](https://github.com/rranelli/auto-package-update.el);
* [helm](https://github.com/emacs-helm/helm);
* [helm-projectile](https://github.com/bbatsov/projectile/blob/master/helm-projectile.el);
* [magit](https://github.com/magit/magit);
* [projectile](https://github.com/bbatsov/projectile).
