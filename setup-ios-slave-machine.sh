echo "> Selecting Xcode command line"
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

sudo xcode-select -s /Applications/Xcode.app
echo ""

echo "> Installing additional installation & Agree license"
sudo xcodebuild -runFirstLaunch
echo ""

echo "> Enabling Developer mode"
DevToolsSecurity -enable
echo ""

echo "> Installing Homebrew"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
echo ""

echo "> Installing Homebrew-Cask & Java"
osascript -e 'tell application "terminal" to do script "brew tap caskroom/cask && brew cask install java"'
echo ""

echo "> Installing CMake & GMake"
osascript -e 'tell application "terminal" to do script "brew install cmake && brew install homebrew/core/make"'
echo ""

echo "> Installing pkg-config"
osascript -e 'tell application "terminal" to do script "brew install pkg-config"'
echo ""

echo "> Installing bundler"
sudo gem install bundler 
echo ""

echo "> Adding bitbucket.org to unknown_hosts"
ssh -o StrictHostKeychecking=no bitbucket.org
echo ""

echo "> Adding github.com to unknown_hosts"
ssh -o StrictHostKeychecking=no github.com
echo ""

exit