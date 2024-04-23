##################################################
# Load theme
##################################################
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
##################################################
# End of Load theme
##################################################

##################################################
# Aliases
##################################################
alias source-terminal='source ~/.zshrc'
alias vim="nvim"
##################################################
# End of Aliases
##################################################

##################################################
# Terminal theme 
##################################################
ZSH_THEME="powerlevel10k/powerlevel10k"

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir rbenv vcs)
# POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator time virtualenv)
# POWERLEVEL9K_PROMPT_ON_NEWLINE=true
##################################################
# End of terminal theme
##################################################

##################################################
# Plugins
##################################################
plugins=(
    git
    web-search
    zsh-autosuggestions
    zsh-syntax-highlighting
    virtualenv
)
##################################################
# End of plugins
##################################################

##################################################
# Oh-my-zsh
##################################################
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh
##################################################
# End of Oh-my-zsh
##################################################

##################################################
# NVM
##################################################
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
##################################################
# End of NVM
##################################################

##################################################
# PyEnv specifics
##################################################
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
##################################################
# End of PyEnv specifics
##################################################
