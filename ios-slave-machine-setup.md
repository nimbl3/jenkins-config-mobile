# Setting up iOS slave machine. 

## Manual configurations

*  Disable sleep mode
```
# System Preferences > Energy Saver > set Turn display off after to Never
```
* Disable screensaver
```
# System Preferences > Desktop & Screen Saver > set Start after to Never
```
* Allow Accessibility for Terminal in order to allow mocking simulator's location for UI testing
```
# System Preferences > Security & Privacy > Privacy > Accessibility > Add Terminal by tapping + button
```

## Manual setup

* Install **Xcode** 
    * **Xcode** is a set of developer tools used to create iPad, iPod, iPhone, and Mac apps. ... You'll need to know a programming language like C, C++, and Objective-C to create apps with Xcode
```
# Download Xcode from App Store
```

## Automatable setup
### Setup with shell script
* All steps below can be proceed with this following command. 
```
$ sudo sh ./setup-ios-slave-machine.sh
```
### Installations & Configurations
* Xcode Configurations
```
# Select xcode command line.
    $ sudo xcode-select -s /Applications/Xcode.app

# Agree Xcode license & Additional installation 
    $ sudo xcodebuild -runFirstLaunch

# Enable developer mode 
    $ DevToolsSecurity -enable
```

* Install **Homebrew**
    * **Homebrew** is a free and open-source software package management system that simplifies the installation of software on Apple's macOS operating system. 
```
$ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

* Install **Homebrew-Cask**
    * **Homebrew-Cask** extends Homebrew and brings its elegance, simplicity, and speed to macOS applications and large binaries alike.

```
$ brew tap caskroom/cask
```

* Install **Java Runtime Environment**
    * **JRE** is a set of software tools for development of Java applications. It combines the Java Virtual Machine (JVM), platform core classes and supporting libraries. JRE is part of the Java Development Kit (JDK), but can be downloaded separately.

```
$ brew cask install java
```

* Install **Bundler**
    *  **Bundler** is an exit from dependency hell, and ensures that the gems you need are present in development, staging, and production.
```
$ sudo gem install bundler
```

* Add SSH Unknown host
    * All SSH server host need to be added to `known_hosts`. In this case we use SSH for only `git`. Then hosts that need to be added are git provider host which we host are `ios-certificate-repository` and `ios-project-repository`

```
$ ssh -o StrictHostKeychecking=no bitbucket.org
```