#Prompt
function parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/'
}

function prompt_right() {
  if [ "$(parse_git_branch)" != '' ]; then
    echo -e "\[\033[0;33\]m[$(parse_git_branch) ]\[\033[0m\]"
  fi
}

function prompt_left() {
  echo -e "🌟  \[\033[95m\]\u@\h:\w\[\033[0m\]"
}

function prompt() {
    compensate=19
    if [ "$(parse_git_branch)" != '' ]; then
      PS1=$(printf "%*s\r%s\n🌟  " "$(($(tput cols)+${compensate}))" "$(prompt_right)" "$(prompt_left)")
    else
      PS1="\[\033[95m\]\u@\h:\w 🌟 \[\033[0m\]\$ "
    fi
}
PROMPT_COMMAND=prompt

#Display colors, type indicators, and unit suffixes
#-G: Inhibit display of group information
#-F: Append indicator (one of */=@|) to entries
#-h: Print sizes in human readable format (e.g., 1K 234M 2G)
alias ls='ls -GFh'
