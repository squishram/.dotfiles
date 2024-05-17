# default text editor (important for sudoedit)
export EDITOR="nvim"
# default browser
export BROWSER="floorp"
# default pdf reader
export READER="zathura"
# location of ripgrep config
export RIPGREP_CONFIG_PATH="$HOME/.config/ripgrep/ripgrep.config"
# where zsh config files are located
export ZDOTDIR="$HOME/.config/zsh"
# where zsh history is stored
export HISTFILE="$HOME/.config/zsh/.zsh_history"

# programming languages
# add local binaries to path (can add and remove binaries from here without sudo)
export PATH="$PATH:/home/squish/.local/bin"
# Rust & software
export PATH="~/.cargo/bin:$PATH"
# Julia & software
export PATH="$PATH:/home/sammy/julia-1.8.1/bin"

# "compile slow, run fast."
export CFLAGS="-Ofast -march=native -pipe -flto -fuse-linker-plugin"
export CXXFLAGS=${CFLAGS}
export LDFLAGS=${CFLAGS}
