# My vim configuration

This is my vim configuration, part of my dotfiles. I use the font RobotoMono
in my terminal patched for Powerline. You can get it from
[powerline fonts](https://github.com/powerline/fonts).

Run the following command via terminal to get it set up:

```bash
$ cd $HOME
$ git clone --recursive https://github.com/tvieira/dotfiles-vim.git .vim
$ ln -sf $HOME/.vim/vimrc $HOME/.vimrc
$ ln -sf $HOME/.vim/vimencrypt $HOME/.vimencrypt
$ cd $HOME/.vim
$ git submodule update --init
```

Don't forget to create an alias so you can create encrypted files with vim.
Add the line below to your ```$HOME/.bashrc``` file.

```bash
alias vime="vim -u ~/.vimencrypt -x"
```
## Screenshot

This is a screenshot of my vim as it is configured in this repository.

[![screenshot](https://github.com/tvieira/dotfiles-vim/raw/master/screenshot.png)](#screenshot)
