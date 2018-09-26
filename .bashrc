#Prompt
# \d – Current date
# \t – Current time
# \h – Host name
# \# – Command number
# \u – User name
# \W – Current working directory (i.e: Desktop/)
# \w – Current working directory, full path (i.e: /Users/Admin/Desktop)

# Reset
Color_Off="\[\033[0m\]"       # Text Reset

# Regular Colors
Black="\[\033[0;30m\]"        # Black
Red="\[\033[0;31m\]"          # Red
Green="\[\033[0;32m\]"        # Green
Yellow="\[\033[0;33m\]"       # Yellow
Blue="\[\033[0;34m\]"         # Blue
Purple="\[\033[0;35m\]"       # Purple
Cyan="\[\033[0;36m\]"         # Cyan
White="\[\033[0;37m\]"        # White

# Bold
BBlack="\[\033[1;30m\]"       # Black
BRed="\[\033[1;31m\]"         # Red
BGreen="\[\033[1;32m\]"       # Green
BYellow="\[\033[1;33m\]"      # Yellow
BBlue="\[\033[1;34m\]"        # Blue
BPurple="\[\033[1;35m\]"      # Purple
BCyan="\[\033[1;36m\]"        # Cyan
BWhite="\[\033[1;37m\]"       # White

# High Intensty
IBlack="\[\033[0;90m\]"       # Black
IRed="\[\033[0;91m\]"         # Red
IGreen="\[\033[0;92m\]"       # Green
IYellow="\[\033[0;93m\]"      # Yellow
IBlue="\[\033[0;94m\]"        # Blue
IPurple="\[\033[0;95m\]"      # Purple
ICyan="\[\033[0;96m\]"        # Cyan
IWhite="\[\033[0;97m\]"       # White


function parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/'
}

function prompt_right() {
  if [ "$(parse_git_branch)" != '' ]; then
    echo -e "$Yellow[$(parse_git_branch) ]$Color_Off"
  fi
}

function prompt_left() {
  echo -e "🌟 $IPurple\u@\h:\w$Color_Off"
}

function prompt() {
    compensate=19
    if [ "$(parse_git_branch)" != '' ]; then
      PS1=$(printf "%*s\r%s\n🌟  " "$(($(tput cols)+${compensate}))" "$(prompt_right)" "$(prompt_left)")
    else
      PS1="$IPurple\u@\h:\w 🌟 $Color_Off\$ "
    fi
}
PROMPT_COMMAND=prompt

#Display colors, type indicators, and unit suffixes
#-G: Inhibit display of group information
#-F: Append indicator (one of */=@|) to entries
#-h: Print sizes in human readable format (e.g., 1K 234M 2G)
alias ls='ls -GFh'

#Textedit 
alias textedit='open -a TextEdit'
