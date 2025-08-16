# setup steps

## omz

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

sudo dnf install autojump-zsh
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
```


## fun

```bash
# aquarium
sudo dnf install asciiquarium

# pipes.sh
git clone https://github.com/pipeseroni/pipes.sh.git
make install
```
