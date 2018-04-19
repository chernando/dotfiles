#
# Executes commands at the start of an interactive session.
#

#
# Powerlevel9k conf (config before loading)
#
export POWERLEVEL9K_COLOR_SCHEME='light'
export POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir)
export POWERLEVEL9K_MODE='nerdfont-complete'
export POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(vcs status)
export POWERLEVEL9K_SHORTEN_DELIMITER=""
export POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
export POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# Use ccat when available
if (( $+commands[ccat] )); then
  alias cat=ccat
fi
