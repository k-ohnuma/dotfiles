# Set up nvim aliases
alias view "nvim -R"
alias vim "nvim"
alias vi "nvim"
alias rvim "vim"

# Set up NVM
set -x PATH "$HOME/.nvm" $PATH

# Add ~/.local/bin to PATH
set -x PATH "$HOME/.local/bin" $PATH

# Set up rbenv
set -x PATH "$HOME/.rbenv/bin" $PATH

# Set up pyenv
set -x PYENV_ROOT "$HOME/.pyenv"
set -x PATH "$PYENV_ROOT/bin" $PATH

# Set up cargo
set -x PATH "$HOME/.cargo/bin" $PATH

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
# eval (avn setup)
eval "$(thefuck --alias)"
set -Ux TERM xterm-256color

bind \e\[A history-search-backward
bind \e\[B history-search-forward
