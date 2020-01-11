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
%B%F{magenta}%n@%m:%f%b
%(?.%F{green}✔.%F{red}✗) %B%F{250}[%*]%f%b ▶ '
PROMPT2='▶'
RPROMPT='%F{yellow}[ %~ ]%f'

# Enable tab-completion library for Git.
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

#Display colors, type indicators, and unit suffixes
#-G: Enable colorized output
#-F: Append indicator (one of */=@|) to entries
#-h: Print sizes in human readable format (e.g., 1K 234M 2G)
alias ls='ls -GFh'

#Textedit
alias textedit='open -a TextEdit'
