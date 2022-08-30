#!/bin/bash

# ================================ prerec ==================================== #

# sudo dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm

sudo dnf makecache
sudo dnf upgrade

sudo dnf install zsh neovim python3 python3-pip python3-neovim

# sudo dnf install ripgrep
sudo dnf install rust cargo
cargo install ripgrep
sudo cp $HOME/.cargo/bin/rg /usr/local/bin/

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
if ! grep -Fxq "$(which zsh)" /etc/shells
then
    echo "Adding $(which zsh) to /etc/shells"
    echo "$(which zsh)" | sudo tee -a '/etc/shells'
fi
sudo chsh -s "$(which zsh)"

# ================================== bash ==================================== #

mv $HOME/.bashrc $HOME/.bashrcold
ln -s "$(pwd)/home/bashrc" $HOME/.bashrc

# ================================= neovim =================================== #

ln -s "$(pwd)/config/nvim" ~/.config/
pip3 install --user neovim pynvim

# Python autocomplete and linting
# https://github.com/palantir/python-language-server
pip3 install --user jedi python-language-server
# py completions and renaming
pip3 install --user rope
# py complexity checking
pip3 install --user mccabe
# py error checking
pip3 install --user pyflakes
# py pep 8 linting
pip3 install --user pycodestyle
# py import sorting and formatting
pip3 install --user pyls-isort
# py code formatting using Black
# https://github.com/ambv/black
pip3 install --user black pyls-black
# py type checking
pip3 install --user pyls-mypy

nvim +PlugInstall +UpdateRemotePlugins +qall


# ================================= tmux ===================================== #

ln -s "$(pwd)/config/tmux" ~/.config/
#git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm

# ================================== etc ===================================== #


# bin/scripts
ln -s "$(pwd)/bin" "$HOME/"

