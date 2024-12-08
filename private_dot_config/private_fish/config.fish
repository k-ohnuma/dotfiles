# Set up nvim aliases
alias view "nvim -R"
alias vim "nvim"
alias vi "nvim"
alias rvim "/usr/bin/vim"

set -Ux EDITOR nvim
set -Ux VISUAL nvim

# set up homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Add ~/.local/bin to PATH
set -x PATH "$HOME/.local/bin" $PATH

set -x PATH "/Applications/WezTerm.app/Contents/MacOS" $PATH


for mode in default insert visua
  fish_default_key_bindings -M $mode
end

fish_vi_key_bindings --no-erase
