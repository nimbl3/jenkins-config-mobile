fancy_echo() {
    echo "> $1"
}

log_new_line() {
    echo ""
}

open_terminal_and_execute() {
    COMMAND=$1
    MESSAGE=$2
    fancy_echo "Openning new terminal and execute \"$COMMAND\""
    osascript -e "tell application \"terminal\" to do script \"$COMMAND\""
}

fancy_echo "Selecting Xcode command line"
sudo xcode-select -s /Applications/Xcode.app
log_new_line

fancy_echo "Installing additional installation & Agree license"
sudo xcodebuild -runFirstLaunch
log_new_line

fancy_echo "Enabling Developer mode"
DevToolsSecurity -enable
log_new_line

fancy_echo "Installing Homebrew"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
log_new_line

open_terminal_and_execute "brew tap caskroom/cask && brew cask install java" "Installing Homebrew-Cask & Java"

open_terminal_and_execute "brew install cmake && brew install homebrew/core/make" "Installing CMake & GMake"

open_terminal_and_execute "brew install pkg-config" "Installing pkg-config"

open_terminal_and_execute "brew tap phrase/brewed && brew install phraseapp" "Installing phraseapp"

fancy_echo "Installing bundler"
sudo gem install bundler 
log_new_line

fancy_echo "Adding bitbucket.org to unknown_hosts"
ssh -o StrictHostKeychecking=no bitbucket.org
log_new_line

fancy_echo "Adding github.com to unknown_hosts"
ssh -o StrictHostKeychecking=no github.com
log_new_line

exit