
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

# MacPorts Installer addition on 2022-06-08_at_14:56:37: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

