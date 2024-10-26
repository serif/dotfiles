export XDG_CONFIG_HOME="$HOME/.config"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
source $ZDOTDIR/zshrc

### bling.sh source start
test -f /usr/share/bazzite-cli/bling.sh && source /usr/share/bazzite-cli/bling.sh
### bling.sh source end
