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
iterm_path="/Applications/iTerm.app"
if [[ -d "$iterm_path"  ]]
then
  echo "iTerm found"
else
  echo "iTerm not found ... installing iTerm"
  brew install --cask iterm2
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

# Install Neovim
if [[ $(nvim --version) == '' ]]
then
  echo "Neovim not found ... installing Neovim"
  brew install neovim
else
  echo "Neovim Found"
fi

# Install Autocompletions
# if [[ $(brew list ripgrep) == '' ]]
# then
#  echo "Ripgrep not found ... installing Ripgrep"
#  brew install ripgrep
#else
#  echo "Ripgrep Found"
#fi

# Install Node Version Manager (NVM)
if [[ ${NVM_DIR} == "" ]]
then
  echo "NVM not found ... installing NVM"
  echo $(nvm --version)
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
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
  
# Install Oh-my-zsh
if [[ ${ZSH} != "" ]]
then
  echo "--------------------------------------------"
  echo "|                  WARNING                  |"
  echo "--------------------------------------------"
  echo "Current instalation of Oh-My-Zsh was found, if you continue, everything inside ${ZSH} will be erased"
  echo "Do you want to proceed? [y/n]:"
  read remove_zsh_response
else
  remove_zsh_response="NOT_FOUND"
fi


if [[ ${remove_zsh_response} == [yY] ]]; then
  echo ">>> Removing ${ZSH}"
  rm -rf ${ZSH}
elif [[ ${remove_zsh_response} == "NOT_FOUND" ]]; then
  echo ">>> Oh-My-Zsh not found!"
else
  echo ">>> ${ZSH}/.oh-my-zsh won't be removed, exiting program"
  exit 1
fi

# Install Oh-my-zsh
echo ">>> Installing Oh-My-Zsh"
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Copy zsh configuration
cp ./.zshrc ../

# Install PowerLevel10K Theme
echo ">>> Installing Powerline10K Theme"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"

# Install color theme
downloads_folder="~/Downloads/coolnight.itermcolors" # I couldn't figure out how to extract the folder into a variable, TODO
echo ">>> Installing color theme to [~/Downloads/coolnight.itermcolors]"
curl https://raw.githubusercontent.com/josean-dev/dev-environment-files/main/coolnight.itermcolors --output ~/Downloads/coolnight.itermcolors

# Install ZSH plugins
echo ">>> Installing ZSH pluggins [zsh-autosuggestions, zsh-syntax-highlighting]"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Copy powerline configuration
echo ">>> Moving Powerline10K configuration ..."
cp ./.p10k.zsh ../  


# Copy NeoVim configuration
echo ">>> Copying Neovim configuration ..."
cp -p -r ./nvim ../.config/
