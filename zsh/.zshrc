
# Path to oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# CASE_SENSITIVE="true"
# HYPHEN_INSENSITIVE="true"
# DISABLE_AUTO_UPDATE="true"
# export UPDATE_ZSH_DAYS=13
# DISABLE_LS_COLORS="true"
# DISABLE_AUTO_TITLE="true"
# ENABLE_CORRECTION="true"
# COMPLETION_WAITING_DOTS="true"
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"
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

