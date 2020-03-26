#------------------------------
# Prompt
#------------------------------
# Left-sided prompt PS1 (PROMPT, prompt)
# Right-sided prompt RPS1 (RPROMPT)
# Other special purpose prompts, such as PS2 (PROMPT2),
# PS3 (PROMPT3), PS4 (PROMPT4), RPS1 (RPROMPT),
# RPS2 (RPROMPT2) and SPROMPT, are explained in zshparam(1).
# The available prompt escapes are listed in zshmisc(1)
# https://wiki.archlinux.org/index.php/Zsh#Prompts

# %m The hostname up to the first `.' (first element).
# %n $USERNAME.
# %d %/ %~ Current working directory.
# %2d %n~ Last n elements of the path.
# %T Current time of day, in 24-hour format. yy-mm-dd.
# %* Current time of day in 24-hour format, with seconds.
# %D{%H:%M:%S.%.}
# %# shows a # when the current prompt has super-user privileges
# (e.g. after a sudo -s) and otherwise the % symbol
# (the default zsh prompt symbol).
# %F ‘Foreground color.’
# black, red, green, yellow, blue, magenta, cyan and white
# %f Resets to the default text color.
# %F{0} through %F{255} 256 color pallet
# %B Bold
# %(?.<success expression>.<failure expression>)
# ✔✓☑.✘✖✗
# http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Conditional-Substrings-in-Prompts
PROMPT='
%B%F{magenta}%n@%m: %d%f%b
%(?.%F{green}✔.%F{red}✗) %B%F{250}[%*]%f%b ▶ '
PROMPT2='▶'
RPROMPT='%F{yellow}[ %~ ]%f'

# Enable tab-completion library for Git.
# zsh compinit: insecure directories, run compaudit for list.
# Ignore insecure directories and continue [y] or abort compinit [n]? 
# compaudit | xargs chmod g-w
autoload -Uz compinit && compinit
# Get information from version control systems,
autoload -Uz vcs_info
precmd_vcs_info() {
  vcs_info
  if [ -n "$vcs_info_msg_0_" ]; then
    RPROMPT='%F{yellow}[ ${vcs_info_msg_0_} ]%f'
  else
    RPROMPT='%F{yellow}[ %~ ]%f'
  fi
}
precmd_functions+=(precmd_vcs_info)
setopt prompt_subst
zstyle ':vcs_info:git:*' formats '%b'

export LS_COLORS='no=00;37:fi=00:di=00;93:ln=04;36:pi=40;33:so=01;35:bd=40;33;01:'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

#Display colors, type indicators, and unit suffixes
#-G or --color: Enable colorized output
#-F: Append indicator (one of */=@|) to entries
#-h: Print sizes in human readable format (e.g., 1K 234M 2G)
# brew install coreutils
alias ls='gls --color -Fh --quoting-style=literal'

#AndroidStudio
export ANDROID_HOME="$HOME/Library/Android/sdk"
# export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk
# export PATH=$PATH:$ANDROID_HOME/emulator
# export PATH=$PATH:$ANDROID_HOME/tools
# export PATH=$PATH:$ANDROID_HOME/tools/bin
# export ANDROID_SDK_ROOT="/usr/local/share/android-sdk"
# alias adb='/Users/mili/Library/Android/sdk/platform-tools/platform-tools/adb'
export PATH="$PATH:$ANDROID_HOME/platform-tools/platform-tools"

#brew
alias brewski='brew update && brew upgrade && brew cleanup; brew doctor'
