get_tmux_option() {
	local option=$1
	local default_value=$2
	local option_value=$(tmux show-option -gqv "$option")
	if [ -z "$option_value" ]; then
		echo $default_value
	else
		echo $option_value
	fi
}

set_tmux_option() {
	local option=$1
	local value=$2
	tmux set-option -gq "$option" "$value"
}

is_osx() {
	[ $(uname) == "Darwin" ]
}

is_cygwin() {
	command -v WMIC > /dev/null
}

command_exists() {
	local command="$1"
	type "$command" >/dev/null 2>&1
}
