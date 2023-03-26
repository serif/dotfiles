#!/bin/bash

# sudo add-apt-repository ppa:neovim-ppa/stable
# sudo apt update
# sudo apt install zsh neovim ripgrep python3 python3-pip
# pip3 install --user pynvim --upgrade msgpack


# ================================== zsh ===================================== #

echo 'export XDG_CONFIG_HOME="$HOME/.config"' > $HOME/.zshenv
echo 'export ZDOTDIR="$XDG_CONFIG_HOME/zsh"' >> $HOME/.zshenv
echo 'source $ZDOTDIR/zshenv' >> $HOME/.zshenv

mv $HOME/.zshenv $HOME/.zshenvold
ln -s "$(pwd)/home/zshenv" $HOME/.zshenv
mkdir $HOME/.config
ln -s "$(pwd)/config/zsh" $HOME/.config/

git clone https://github.com/zdharma-continuum/zinit.git $HOME/.config/zsh/zinit/bin
zsh -c "source $HOME/.config/zsh/zinit/bin/zinit.zsh && zinit update"

# zsh set as default shell
# if ! grep -Fxq "$(which zsh)" /etc/shells
# then
    # echo "Adding $(which zsh) to /etc/shells"
    # echo "$(which zsh)" | sudo tee -a '/etc/shells'
# fi
# sudo chsh -s "$(which zsh)"

# ================================== bash ==================================== #

mv $HOME/.bashrc $HOME/.bashrcold
ln -s "$(pwd)/home/bashrc" $HOME/.bashrc

# ================================== python ==================================== #
python -m ensurepip --upgrade
if [ -d "$HOME/.local/bin" ]
then
    PATH="$HOME/.local/bin:$PATH"
fi

# ================================= neovim =================================== #

ln -s "$(pwd)/config/nvim" ~/.config/
pip3 install --user neovim pynvim

# Python autocomplete and linting
# https://github.com/palantir/python-language-server
# pip3 install --user jedi python-language-server
# py completions and renaming
# pip3 install --user rope
# py complexity checking
# pip3 install --user mccabe
# py error checking
# pip3 install --user pyflakes
# py pep 8 linting
# pip3 install --user pycodestyle
# py import sorting and formatting
# pip3 install --user pyls-isort
# py code formatting using Black
# https://github.com/ambv/black
# pip3 install --user black pyls-black
# py type checking
# pip3 install --user pyls-mypy

nvim -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

# ================================= tmux ===================================== #

ln -s "$(pwd)/config/tmux" ~/.config/
#git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm

# ================================== etc ===================================== #


# bin/scripts
ln -s "$(pwd)/bin" "$HOME/"

