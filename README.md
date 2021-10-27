# Benshu's dotfiles / MacOS

## Bootstrap
1. Update to latest MacOS
```
softwareupdate -ia
```

1. Instal XCode Command Line Tools
```
sudo xcode-select --install
```

1. Clone this repository
```
git clone git@github.com:benshu/dotfiles.git
```

1. Install [Homebrew](https://brew.sh)
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

1. Install Applications Using Homebrew
```
HOMEBREW_CASK_OPTS="--no-quarantine" brew bundle install --file ./setup/macos/Brewfile
```

1. Setup Shell and Terminal 
Use your newly installed terminal - iterm2 / alacritty
install oh-my-zsh
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

Fetch and extract terminfo database:
```
curl -LO https://invisible-island.net/datafiles/current/terminfo.src.gz && gunzip terminfo.src.gz
```
Compile tmux terminfo using:
```
/usr/bin/tic -xe tmux-256color terminfo.src
```

1. Link dotfiles using stow
```
stow alacritty -t ~/.config/
stow bash -t ~/
stow git -t ~/.config/
stow htop -t ~/.config/
stow nvim -t ~/.config/
stow pyls -t ~/.config/
stow ranger -t ~/.config/
mkdir ~/scripts stow scripts -t ~/scripts/
stow shell -t ~
stow tmux -t ~/.config/ && ln -s ~/.config/tmux/tmux.conf ~/.tmux.conf
stow yapf -t ~/.config/
stow zsh -t ~/
```

1. Setup SSH KEY
[https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent](Github SSH generation guide)

```
ssh-keygen -t ed25519 -C "your_email@example.com"
eval "($ssh-agent -s)"
echo << EOF > ~/.ssh/config
Host *
  AddKeysToAgent yes
  IdentityFile ~/.ssh/id_ed25519
EOF
ssh-add -K ~/.ssh/id_ed25519
```
1. Update external services with newly generated public key [https://github.com/settings/keys](Github SSH Keys Settings)
```
pbcopy < ~/.ssh/id_ed25519.pub
```
## Applications
### Docker
Docker desktop requires to run the GUI docker app first to initially link binaries and prepare docker for the first runtime.
Run docker by using <CMD>+<space> and typing docker, authorize the application and adjust preferences to your liking.
Note that the default resources allocated for docker are quite limited, adjust to your needs.

### Python
Link python3 binary to python command
```
ln -s -f /usr/local/bin/python3 /usr/local/bin/python
```
### Neovim
1. Install packer for neovim package management
```
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```
And bootstrap using the following command
```
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
```
