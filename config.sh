#!/bin/sh

# Install Homebrew
if [[ $(brew --version) == '' ]]
then
  echo "Homebrew not found ... installing Homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  username=$(whoami)
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/$username/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  echo "Homebrew found"
fi

# Install iTerm
if [[ $(brew list iterm2) == '' ]]
then
  echo "iTerm not found ... installing iTerm"
  brew install --cask iterm2
else
  echo "iTerm found"
fi

# Install git
if [[ $(git -v) == '' ]]
then
  echo "Git not found ... installing Git"
  brew install git
else
  echo "Git found"
fi

# Install x-code developer tools
if [[ $(xcode-select -p) == '' ]]
then
  echo "xcode-select not found ... installing xcode-select"
  xcode-select --install
else
  echo "Xcode-select Found"
fi

# Install Oh-my-zsh
if [[ $(whereis zsh) == '' ]]
then
  echo "zsh not found ... installing Oh-my-zsh"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "Zsh Found"
fi

# Install Neovim
if [[ $(nvim --version) == '' ]]
then
  echo "Neovim not found ... installing Neovim"
  brew install neovim
else
  echo "Neovim Found"
fi

# Install Autocompletions
if [[ $(brew list ripgrep) == '' ]]
then
  echo "Ripgrep not found ... installing Ripgrep"
  brew install ripgrep
else
  echo "Ripgrep Found"
fi

# Install Node Version Manager (NVM)
if [[ $(nvm --version) == '' ]]
then
  echo "NVM not found ... installing NVM"
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
else
  echo "NVM Found"
fi

# Install PyEnv
if [[ $(pyenv --version) == '' ]]
then
  echo "PyEnv not found ... installing PyEnv"
  brew install pyenv
else
  echo "PyEnv Found"
fi


# Install PowerLevel10K Theme
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

# Install color theme
curl https://raw.githubusercontent.com/josean-dev/dev-environment-files/main/coolnight.itermcolors --output ~/Downloads/coolnight.itermcolors

# Install ZSH plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlightingo


# Copy zsh configuration
cp ./.zshrc ../

# Copy powerline configuration
cp ./.p10k.zsh ../

# Copy NeoVim configuration
cp -r ./nvim ../.cofig/nvim


# Source terminal
source ~/.zshrc
