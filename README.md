# Benshu's dotfiles / MacOS

## Bootstrap
### Automatic Bootstrap
Automatic bootstrapping is possible by adhering to the [Strap](https://github.com/mikeMcquaid/strap) hooks (`script/setup` and `script/strap-after-setup`)

### Manual Bootstrap
1. Update to latest MacOS
```
softwareupdate -ia
```

2. Instal XCode Command Line Tools
```
sudo xcode-select --install
```

3. Clone this repository
```
git clone git@github.com:benshu/dotfiles.git
```

4. Install [Homebrew](https://brew.sh)
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

5. Install Applications Using Homebrew
```
ln -s $PWD/setup/macos/Brewfile ~/.Brewfile
HOMEBREW_CASK_OPTS="--no-quarantine" brew bundle install --file ~/.Brewfile
```

6. Run setup script
| This will run automatically by [Strap](https://github.com/benshu/strap) hook
```
script/setup
```


## Link dotfiles manually
GNU stow is used to link the configuration files to their proper location.

Each configuration package has a `.stowrc` resource file to specify the target directory, stow directory, and ignored files.
To stow a specific package:
```
cd <package-dir> && stow .
```
This allows for a consistent behaviour of all different configurations by utilizing `.stowrc`

# SSH Setup
1. Setup SSH KEY
[Github SSH generation guide](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)

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
2. Update external services with newly generated public key [Github SSH Keys Settings](https://github.com/settings/keys)
```
pbcopy < ~/.ssh/id_ed25519.pub
```

## Applications
### MacOS Settings

```shell
TIME_ZONE=Asia/Jerusalem ./setup/macos/.macos
```

## Terminal

1. Setup Shell and Terminal 
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

### Git
Since I have .gitconfig under source control, the personal git user details are stored in an external file `~/.gitlocal`.

```shell
cat > ~/.gitlocal << EOF
[user]
	email = <Email>
	name = <Name>
[github]
    user = <Username>
EOF
```

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
