## how to setup

### brew setup

`https://brew.sh/ja/` をみてね！

### fish setup

めんどくさいのでデフォルトshellをfishに設定してからやってね

```
# install
brew install fish

# 現在利用可能なシェル一覧
cat /etc/shells

# ここにfishを追加
sudo sh -c 'echo "/opt/homebrew/bin/fish" >> /etc/shells'

# デフォルトシェル変更
chsh -s /opt/homebrew/bin/fish

# 確認
echo $SHELL
```

### chezmoi setup

```
# install chezmoi
sh -c "$(curl -fsLS https://chezmoi.io/get)" -- -b ~/.local/bin

# check install chezmoi
chezmoi --version

# apply chezmoi
chezmoi init --apply <this repo url>
```

