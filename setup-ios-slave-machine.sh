echo "> Selecting Xcode command line"
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

echo "> Installing bundler"
sudo gem install bundler 
echo ""

echo "> Adding bitbucket.org to unknown_hosts"
ssh -o StrictHostKeychecking=no bitbucket.org
echo ""

exit