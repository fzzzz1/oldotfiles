
################################################################################
# Loading Personal Preferences 
################################################################################
source $XDG_CONFIG_HOME/profile
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

autoload -Uz compinit promptinit colors zsh/terminfo vcs_info
compinit
promptinit
colors
precmd() { vcs_info }

zstyle ':completion::complete:*' gain-privileges 1
zstyle ':vcs_info:git:*' formats '%b '

setopt COMPLETE_ALIASES
setopt correctall
setopt hist_ignore_all_dups
setopt autocd
setopt PROMPT_SUBST


PROMPT='${PWD/#$HOME/~} > '
RPROMPT=\$vcs_info_msg_0_


################################################################################
# Path Variable
################################################################################
export PATH=$HOME/bin:$PATH
export PATH=$HOME/.local/bin:$PATH

################################################################################
# History Stuff
################################################################################
HISTFILE=$XDG_CONFIG_HOME/zsh/.histfile
HISTSIZE=1000
SAVEHIST=1000


################################################################################
# Key binding
################################################################################
bindkey -v

################################################################################
# ALIASES
################################################################################
alias buds='bluetoothctl power on && bluetoothctl connect 40:5E:F6:0D:C3:E2' 
alias bose='bluetoothctl power on && bluetoothctl connect 2C:41:A1:AE:50:E1'
alias bt-disconnect='bluetoothctl disconnect && bluetoothctl power off'

################################################################################
# Auto-start Sway
################################################################################
#source $XDG_CONFIG_HOME/sway/autoStart
# zshrc or bashrc
lf () {
	LF_TEMPDIR="$(mktemp -d -t lf-tempdir-XXXXXX)"
	LF_TEMPDIR="$LF_TEMPDIR" lf-run -last-dir-path="$LF_TEMPDIR/lastdir" "$@"
	if [ "$(cat "$LF_TEMPDIR/cdtolastdir" 2>/dev/null)" = "1" ]; then
		cd "$(cat "$LF_TEMPDIR/lastdir")"
	fi
	rm -r "$LF_TEMPDIR"
	unset LF_TEMPDIR
}

################################################################################
# Auto-start KDE
################################################################################
#XDG_SESSION_TYPE=wayland dbus-run-session startplasma-wayland
# ~/.zshrc

eval "$(starship init zsh)"





source /home/fritz/.config/broot/launcher/bash/br
