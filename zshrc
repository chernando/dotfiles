#
# Executes commands at the start of an interactive session.
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# Use ccat when available
if (( $+commands[ccat] )); then
  alias cat='ccat -G String=teal -G Keyword=darkyellow -G Comment=standout -G Type=darkgreen -G Literal=darkgreen -G Punctuation=reset -G Plaintext=reset -G Tag=darkblue -G HTMLTag=darkblue -G Decimal=teal'
fi

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/chernando/Work/homebrew/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/chernando/Work/homebrew/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/chernando/Work/homebrew/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/chernando/Work/homebrew/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /Users/chernando/Work/homebrew/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh ]] && . /Users/chernando/Work/homebrew/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh
