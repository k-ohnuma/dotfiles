# dotfiles

This repository assumes that Homebrew, fish, and mise are installed before running chezmoi.

## Quick Start

```sh
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply -S https://github.com/k-ohnuma/dotfiles.git
```

## Preinstall

### 1. Homebrew

Install Homebrew:

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

After installation, follow the instructions printed in the Homebrew installer output to configure your PATH properly.

### 2. fish

Install:

```sh
brew install fish
```

Add fish to /etc/shells:

```sh
echo "$(brew --prefix)/bin/fish" | sudo tee -a /etc/shells
```

Set fish as your default shell:

```sh
chsh -s "$(brew --prefix)/bin/fish"
```

check current shell

```sh
echo $SHELL
```

### 3. mise

Install:

```sh
brew install mise
```

Create ~/.config/chezmoi/chezmoi.toml

Create the following file and set the keys below as needed:

```toml
[data]
# Template used when `cargo-atcoder` runs `setup`
cargo_atcoder_template = """
fn main() {}
"""

# GitHub user information
name  = "your-github-name"
email = "your-email@example.com"

# Whether to run `brew install` during `chezmoi apply`
brew_install = "false"

# Whether to run `mise install` during `chezmoi apply`
mise_install = "false"

# Whether to install Neovim during `chezmoi apply`
neovim_install = "false"

# Neovim version to install
neovim_version = "v0.11.5"

# Whether to install fonts during `chezmoi apply`
font_install = "false"

# Whether to run `apt install` during `chezmoi apply` (Linux only)
apt_install = "false"
```
