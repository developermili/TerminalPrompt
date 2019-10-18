#------------------------------
# Prompt
#------------------------------
# Left-sided prompt PS1 (PROMPT, prompt)
# Right-sided prompt RPS1 (RPROMPT)
# Other special purpose prompts, such as PS2 (PROMPT2), PS3 (PROMPT3), PS4 (PROMPT4), RPS1 (RPROMPT), RPS2 (RPROMPT2) and SPROMPT, are explained in zshparam(1).
# The available prompt escapes are listed in zshmisc(1)
# https://wiki.archlinux.org/index.php/Zsh#Prompts

# %m The hostname up to the first `.'. 
# %n $USERNAME.
# %d %/ Current working directory.
# %T Current time of day, in 24-hour format.
# %D{%H:%M:%S.%.}


# %TODO $(echotc UP 1) 
# precmd() { print -rP "[%D %D{%H:%M:%S}] %F{magenta}%n@%m: %F{blue}%d%f" }
# export PROMPT="🌟 "

function parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/'
}

PROMPT='
%F{magenta}%n@%m:%f
[%D{%H:%M:%S}] ▶ '
PROMPT2='▶'
RPROMPT='%F{yellow}[ %~ ]%f'
function prompt() {
    if [ "$(parse_git_branch)" != '' ]; then
        PROMPT='▶ %F{magenta}%n@%m: %d%f '
        RPROMPT='%F{yellow}[$(parse_git_branch) ]%f'
    else
        
    fi
}
prompt



#Display colors, type indicators, and unit suffixes
#-G: Inhibit display of group information
#-F: Append indicator (one of */=@|) to entries
#-h: Print sizes in human readable format (e.g., 1K 234M 2G)
alias ls='ls -GFh'

#Textedit 
alias textedit='open -a TextEdit'
