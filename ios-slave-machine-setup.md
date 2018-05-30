# Setting up iOS slave machine. 

## Prerequisite

* **Xcode** is a set of developer tools used to create iPad, iPod, iPhone, and Mac apps.

## Setup
1. Run the following command
    ```
    $ sudo sh ./setup-ios-slave-machine.sh
    ```
2. Setup MacOS's system preferences

    *  Disable sleep mode
    ```
    # System Preferences > Energy Saver > set Turn display off after to Never
    ```
    * Disable screensaver
    ```
    # System Preferences > Desktop & Screen Saver > set Start after to Never
    ```
3. Everything is all set 🎉

### What it does
Below is what the script actually does in background
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
    As all SSH server hosts need to be added to `known_hosts`, we need to add our git provider that hosts our `iOS-certificate-repository` and the project's repository so that our slave can use SSH for git command. In our case, it's Bitbucket.

```
$ ssh -o StrictHostKeychecking=no bitbucket.org
```