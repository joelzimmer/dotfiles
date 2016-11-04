alias git=hub

function title() {
	TITLE=$*
	export PROMPT_COMMAND='echo -ne "\033]0;$TITLE\007"'
}

#eval "$(thefuck --alias)"
eval "$(nodenv init -)"

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

source ~/.profile
