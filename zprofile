#
# Executes commands at login pre-zshrc.
#

#
# Browser
#

if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

#
# Editors
#

export EDITOR='nvim'
export VISUAL='nvim'
export PAGER='less'

#
# Language
#

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

#
# Paths
#

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the list of directories that cd searches.
# cdpath=(
#   $cdpath
# )

# Set the list of directories that Zsh searches for programs.
path=(
  /usr/local/{bin,sbin}
  $path
)

#
# Less
#

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-F -g -i -M -R -S -w -X -z-4'

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

#
# Homebrew
#

export HOMEBREW_CASK_OPTS="--appdir=~/Applications"
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_UPGRADE_CLEANUP=1

#
# Powerlevel9k
#

export POWERLEVEL9K_COLOR_SCHEME='light'
export POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir)
export POWERLEVEL9K_MODE='nerdfont-complete'
export POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(vcs status)
export POWERLEVEL9K_SHORTEN_DELIMITER=""
export POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
export POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
export POWERLEVEL9K_STATUS_SHOW_PIPESTATUS=false

#
# Node
#

# Node 10  is extreme with ExperimentalWarning
export NODE_NO_WARNINGS=1

#
# Python
#

export PIPENV_VENV_IN_PROJECT=1
