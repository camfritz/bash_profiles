alias subl='open -a "Sublime Text"'
alias osu='ssh fritzcam@access.engr.oregonstate.edu'
alias osu-copy='ssh fritzcam@access.engr.oregonstate.edu "rm -rf ./CS/444/*" && scp -r ~/Desktop/School/CS444/* fritzcam@access.engr.oregonstate.edu:./CS/444'
alias arduino='open -a "Arduino"'
alias reload='source ~/.bash_profile; clear'
alias cleartrash='rm -rf ~/.Trash/*'
alias copypath='pwd | pbcopy'
alias new-system-setup='defaults write com.apple.dock autohide-time-modifier -float 0.12; killall Dock; ln -s ~/Library/Mobile\ Documents/com~apple~CloudDocs iCloud\ Drive; ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl; /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"; brew update, brew install youtube-dl; brew install node; brew tap caskroom/fonts; brew cask install font-fira-code; brew cask install font-inconsolata'

###########################################
# EXPORTS
###########################################
export EDITOR='subl'

# ======================================================================#
#       Terminal Prompt Colors                                                                                          #
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
#a = black                      B = bold red
#b = red                        C = bold green
#c = green                      D = yellow
#d = brown                      E = bold blue
#e = blue                       F = magenta
#f = magenta            G = cyan
#g = cyan                       H = white
#h = grey                       x = default
#A = dark grey

export CLICOLOR=true
export CLICOLOR_FORCE=true

new_line=false

function ps_1 {
	if $new_line; then
		echo "--------------------------------------------------------------------"
	else
		echo -n
		new_line=true
	fi
}

PROMPT_COMMAND='ps_1'
export PS1="\[$Cyan\]\u \[$Brown\]\w \$ \[$Green\]  "
export LSCOLORS="excxbxdxcxexexfxdxgxdx"

#################################
#Functions
#################################
function youtube { url=$1; youtube-dl -o "$(pwd)/%(title)s--%(upload_date)s.%(ext)s" "$url"; }
