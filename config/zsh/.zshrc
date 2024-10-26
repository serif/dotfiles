export XDG_CONFIG_HOME="$HOME/.config"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
source $ZDOTDIR/zshrc

### bling.sh source start
test -f /usr/share/bazzite-cli/bling.sh && source /usr/share/bazzite-cli/bling.sh
### bling.sh source end

# bling override
# ls aliases
if [ "$(command -v eza)" ]; then
    EZA_OPT="--icons=auto --group-directories-first --sort=extension"
    EZA_OPT+=" --width=80 --hyperlink --across"
    alias ll="eza -l $EZA_OPT"
    alias l.="eza -d .* $EZA_OPT"
    alias ls="eza $EZA_OPT"
    alias l1="eza -1 $EZA_OPT"
fi

# redefine cd with new ls alias
cd() {
    builtin cd "$@"
    ls
}
