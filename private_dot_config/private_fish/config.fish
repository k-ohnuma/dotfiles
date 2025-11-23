# Set up nvim aliases
alias view "nvim -R"
alias vim "nvim"
alias vi "nvim"
alias rvim "/usr/bin/vim"
alias gs "git status"
alias ggr "git graph"
alias xx "cargo acj"
alias pa "pahcer"
alias tt "nvim +terminal"

set -Ux EDITOR nvim
set -Ux VISUAL nvim


# set up homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Add ~/.local/bin to PATH
set -x PATH "$HOME/.local/bin" $PATH

set -x PATH "/Applications/WezTerm.app/Contents/MacOS" $PATH

set -gx PATH $HOME/.local/share/mise/shims $PATH

for mode in default insert visua
  fish_default_key_bindings -M $mode
end

fish_vi_key_bindings --no-erase
