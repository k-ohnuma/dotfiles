export EDITOR='nvim'
export VISUAL='nvim'

if [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

typeset -U path PATH
path=(
  /Applications/WezTerm.app/Contents/MacOS
  "$HOME/.local/share/mise/shims"
  "$HOME/.local/bin"
  $path
)
export PATH

for c in awk grep find xargs date sed stat timeout realpath readlink sort uniq cut tr wc head tail; do
  alias $c="g$c"
done

