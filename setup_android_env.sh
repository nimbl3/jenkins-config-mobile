echo 'export ANDROID_HOME="/Users/[USER_NAME]/Library/Android/sdk"' >> ~/.bash_profile

echo 'export PATH=${PATH}:${ANDROID_HOME}/emulator:${ANDROID_HOME}/platform-tools:${ANDROID_HOME}/tools' >> ~/.bash_profile

. ~/.bash_profile
