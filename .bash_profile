# ======================================================================#
#	Author:		Leo Gothberg											#
#	Company:															#
#	Website:															#
#	Description:	Bash Profile										#
# ======================================================================#


# ======================================================================#
#	New System Setup Information										#
#		NOTE:  Install all applications first!							#
# ======================================================================#
# Improve animation speed of dock and restart dock process
# Add a system link to the iCloud directory for easy terminal access	==	ln -s ~/Library/Mobile\ Documents/com~apple~CloudDocs iCloud\ Drive
# Add a system link for Sublime Text == ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl
# Install and update homebrew
# Install youtube-dl and node.js via homebrew
# Tap fonts and install 'Fira Code' and 'Inconsolata' fonts via homebrew

alias new-system-setup='defaults write com.apple.dock autohide-time-modifier -float 0.12; killall Dock; ln -s ~/Library/Mobile\ Documents/com~apple~CloudDocs iCloud\ Drive; ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl; /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"; brew update, brew install youtube-dl; brew install node; brew tap caskroom/fonts; brew cask install font-fira-code; brew cask install font-inconsolata'
# ======================================================================#
#	Exports																#
# ======================================================================#
export PATH=$PATH:$HOME/bin
export EDITOR='subl'
export PATH="$PATH:$HOME/.rvm/bin"						# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.

# ======================================================================#
#	Basic Commands & Functions											#
# ======================================================================#
alias install-brew='/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"; brew install youtube-dl'
alias c='clear; new_line=false'
alias ls='ls -oaF'
alias edit='subl'
alias bp='edit ~/.bash_profile'
alias cleartrash='rm -rf ~/.Trash/*'
alias copypath='pwd | pbcopy'
alias sqlite='sqlite3'
alias icloud="cd ~/iCloud\ Drive"
alias mono='mono --arch=32'

alias reload='source ~/.bash_profile; clear; printf "Behold!  I Am Bob, the caveman who has harnessed the free exchange of electrons!\n                                  Hail, Tesla!\n\n"; d=$(pwd)'

function print { printf "$1\n"; }
function youtube { url=$1; youtube-dl -o "$(pwd)/%(title)s--%(upload_date)s.%(ext)s" "$url"; }
function mkdircd { mkdir -p "$1" && cd "$1"; }			# Creates a folder and gets inside of it
function trash { command mv "$@" ~/.Trash ; }			# Moves a file to the Mac OSX trash

# ======================================================================#
#	Tab Completion														#
# ======================================================================#
if [ -f $(brew --prefix)/etc/bash_completion ]; then
	. $(brew --prefix)/etc/bash_completion
fi

# Enable tab completion for `g` by marking it as an alias for `git`
if type _git &> /dev/null && [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
	complete -o default -o nospace -F _git g;
fi

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;

# Add tab completion for `defaults read|write NSGlobalDomain`
complete -W "NSGlobalDomain" defaults;

# Add `killall` tab completion for common apps
complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall;

# ======================================================================#
#	Terminal Prompt Colors												#
# ======================================================================#
Black="\e[0;30m"
Blue="\e[0;34m"
Green="\e[0;32m"
Cyan="\e[0;36m"
Red="\e[0;31m"
Purple="\e[0;35m"
Brown="\e[0;33m"
Gray="\e[0;37m"
Dark_Gray="\e[1;30m"
Dark_Blue="\e[1;34m"
Dark_Green="\e[1;32m"
Dark_Cyan="\e[1;36m"
Dark_Red="\e[1;31m"
Dark_Purple="\e[1;35m"
Yellow="\e[1;33m"
White="\e[1;37m"
end="\e[0m"

# LS Color Options
#a = black			B = bold red
#b = red			C = bold green
#c = green			D = yellow
#d = brown			E = bold blue
#e = blue			F = magenta
#f = magenta		G = cyan
#g = cyan			H = white
#h = grey			x = default
#A = dark grey

export CLICOLOR=true
export CLICOLOR_FORCE=true

new_line=false

function ps_1 {
	if $new_line; then
		echo "-----------------------------------------------------------"
	else
		echo -n
		new_line=true
	fi
}

PROMPT_COMMAND='ps_1'
export PS1="\[$Cyan\]\u \[$Brown\]\w \$ \[$Green\]  "
export LSCOLORS="excxbxdxcxexexfxdxgxdx"
