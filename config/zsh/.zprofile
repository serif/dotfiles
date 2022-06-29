
# Copied from zshenv
# -U: keep unique, discard duplicates
typeset -U PATH path
# MacPorts
path=("/opt/local/bin" "$path[@]")
path=("/opt/local/sbin" "$path[@]")
path=("${HOME}/z88dk/bin" "$path[@]")
export ZCCCFG=${HOME}/z88dk/lib/config
path=("$HOME/.local/bin" "$path[@]")
path=("$HOME/bin" "$path[@]")
path=("/usr/local/sbin" "$path[@]")
path=("/usr/local/opt/ruby/bin" "$path[@]")
export PATH
