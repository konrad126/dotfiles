# Always use color output for `ls` and display additional info for entries
# (slashes for directories, @ for symlinks, etc.), and some aditional ls aliases
alias ls="ls -GF"
alias ll="ls -la"

# Easier navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../"

# Show/hide hidden files in Finder
alias showdotfiles="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hidedotfiles="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Open in current directory when running subl
alias subl="subl ."