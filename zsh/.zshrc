export ZSH="$HOME/.oh-my-zsh"

DISABLE_AUTO_UPDATE="true"

plugins=(
	git 
	zsh-autosuggestions
	zsh-syntax-highlighting
	yarn
	fzf-tab
)

source $ZSH/oh-my-zsh.sh

bindkey -s '^z' '^Qfg^M'
bindkey -s '^[l' '^Qls^M'
bindkey '^ ' autosuggest-accept
bindkey '^[e' edit-command-line

function PATH_add() {
	while [ $# -gt 0 ]; do
		[[ ":$EXTRA_PATH:" != *":$1:"* ]] && EXTRA_PATH="${EXTRA_PATH:+"$EXTRA_PATH:"}$1"
		shift
	done

	export EXTRA_PATH
}

source $HOME/.cfg/env
autoload zmv

[[ ":$PATH:" != *":$EXTRA_PATH:"* ]] && PATH="$EXTRA_PATH:$PATH"
export PATH

HISTDUP=erase

setopt sharehistory
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
