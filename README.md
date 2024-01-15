# MacTerminal
This will contain how to cpnfigure your mac terminal with Oh my Zsh.

### To consider
- The first thing to know is that the terminal runs on top of a shell.
- The termial is where you type the commands and read some otuput.
- The Shell is the program that takes the commands and executes them.
- Terminal != Shell.
- The terminal on the lasts MacOS use <b>zsh</b> as shell.
- We will use <b><i>[iTerm2](https://iterm2.com)</i></b> as a terminal and <b><i>[Oh my ZSH](https://ohmyz.sh)</i></b> to manage and have a good looking shell prompt.

### Prerequisites
- Install brew, download [here](https://brew.sh) and follow the prompts in order to add brew to your path.
- Install Command line tools with <code>xcode-select --install</code>.
- Have Git installed, download [here](https://git-scm.com)

### Installation guide
1. Install iTerm2 [here](https://iterm2.com/downloads.html) and open it. <br />
<b>Note:</b> From Now on, we will use iTerm to install everithing else
2. Install Command line tools:
```shell
$ xcode-select --install
```
3. Install Oh my ZSH: 
```shell
$ sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
4. Set powerline theme
  - Clone the powerline repo
    ```shell
    git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
    ```
  - Open your .zshrc file
    ```shell
    ZSH_THEME="powerlevel9k/powerlevel9k"
    POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir rbenv vcs)
    POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs history time)
    POWERLEVEL9K_PROMPT_ON_NEWLINE=true
    ```
5. Install Autocompletion
   - Clone the repo
     ```shell
     git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
     ```
   - Add the plugin into the <code>.zshrc</code>
     ```shell
     plugins=(
       …
       zsh-autosuggestions
     )
     ```
7. Install powerfonts
```shell 
$ git clone https://github.com/powerline/fonts   # Clone repo
$ cd fonts                                       # Enter repo
$ ./install.sh                                   # Install fonts
$ cd ..                                          # Go back
$ rm -rf fonts                                   # Delete fonts repo
```
7. Add monokai color theme
```shell 
$ git clone https://github.com/logicseed/monokai-pro-themes  # Clone repo
```
8. Set font and monokai theme to iTerm2
  - Go to iTerm2
  - Settings/Preferences
  - Profiles
  - To select ***Monokai Color:***
    - Colors
    - Colors presets
    - Import
    - Import the file on the monokai repo inside of the iTerm2 folder
    - Select Monokai Pro Color from "Color Presets" dropdown
  - To select ***Powerline Font:***
    - Text
    - Font
    - Select the font *Meslo LG M for Powerline*
9. Remove monokai-pro-themes repo
```shell
$ rm -rf monokai-pro-themes
```
10. Add color highligh
  - Install the package
    ```shell
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    ```
  - Add the following at the end of the <code>.zshrc</code> file:
    ```shell
    plugins=(
       …
       zsh-syntax-highlighting
     )
    ```
