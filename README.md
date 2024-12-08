## how to setup

```
# install curl
apt update && apt install -y curl
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc

# install chezmoi
sh -c "$(curl -fsLS https://chezmoi.io/get)" -- -b ~/.local/bin

# check install chezmoi
chezmoi --version

# apply chezmoi
chezmoi init --apply <this repo url>
```
