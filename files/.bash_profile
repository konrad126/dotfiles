# Load the shell dotfiles
for file in $HOME/.{bash_prompt,bash_aliases,bash_exports,bash_functions,bash_extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

## set ls command colors
export LSCOLORS=GxFxCxDxBxegedabagaced

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

## fix problem with ssh
#ssh-add -K &>/dev/null


if [ -f `brew --prefix`/etc/bash_completion.d/git-completion.bash ]; then
  . `brew --prefix`/etc/bash_completion.d/git-completion.bash
fi

