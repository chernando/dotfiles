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

# Google Cloud SDK
if [[ -r  '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc' ]]; then
  source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'
fi

# Serverless framework
if [[ -r '/usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh' ]]; then
  source /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
fi
