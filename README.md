# TerminalPrompt
This is the .bashrc and .bash_profile I use to personalize my Terminal.

> What is the difference between .bash_profile and .bashrc?
> https://apple.stackexchange.com/questions/51036/what-is-the-difference-between-bash-profile-and-bashrc

.bash_profile is executed for login shells, while .bashrc is executed for interactive non-login shells.

However, if you add the following to your .bash_profile, you can then move everything into your .bashrc file so as to consolidate everything into one place instead of two:

```
if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi
```
