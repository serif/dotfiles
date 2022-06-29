
# MacPorts Installer addition on 2020-11-10_at_18:36:32: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

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
path=("/Users/avx/Library/Python/3.8/bin" "$path[@]")
export PATH
