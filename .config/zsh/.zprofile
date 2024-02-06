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

# programming languages
# Created by `pipx` on 2023-06-09 10:56:40
export PATH="$PATH:/home/squish/.local/bin"
# Rust
export PATH="~/.cargo/bin:$PATH"
# Julia
export PATH="$PATH:/home/sammy/julia-1.8.1/bin"

# "compile slow, run fast."
export CFLAGS="-Ofast -march=native -pipe -flto -fuse-linker-plugin"
export CXXFLAGS=${CFLAGS}
export LDFLAGS=${CFLAGS}
