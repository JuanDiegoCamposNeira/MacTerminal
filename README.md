# TODO:
Create symbolic links instead of copying .zshrc, .p10k.zsh, vim/

# MacTerminal
This will contain how to cpnfigure your mac terminal with Oh my Zsh.

### To consider
- The first thing to know is that the terminal runs on top of a shell.
- The termial is where you type the commands and read some otuput.
- The Shell is the program that takes the commands and executes them.
- Terminal != Shell.
- The terminal on the lasts MacOS use <b>zsh</b> as shell.
- We will use <b><i>[iTerm2](https://iterm2.com)</i></b> as a terminal and <b><i>[Oh my ZSH](https://ohmyz.sh)</i></b> to manage and have a good looking shell prompt.

### Enabling `Natural Language` key bindings
1. Open iTerm configs with `⌘ ,`
2. Go to `Profiles` -> `Keys` -> `Key Bindings`
3. Open `Presets`
4. Select `Natural Text Editing`

### Instalation and configuration
To configure your terminal, you just need to run the file ```config.sh```
1. Cd into your home directory
```shell
cd ~/
```
2. Clone this repo into your home directory <code> ~/ </code>
```shell
git clone https://github.com/JuanDiegoCamposNeira/MacTerminal.git
```
3. Cd into folder
```shell
cd ~/MacTerminal
```
4. Run bash config script
```shell
bash config.sh
```
5. Import Color Preset into iTerm 
  - Go to iTerm settings `⌘ ,`
  - Profiles → Colors → Import
  - Import the color theme that's in the `Downloads` folder
6. Install powerline font
```shell
p10k configure
```
