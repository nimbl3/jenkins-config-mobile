echo 'export ANDROID_HOME="/Users/[USER_NAME]/Library/Android/sdk"' >> ~/.bash_profile

echo 'export PATH=${PATH}:${ANDROID_HOME}/emulator:${ANDROID_HOME}/platform-tools:${ANDROID_HOME}/tools' >> ~/.bash_profile

echo 'export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_162.jdk/Contents/Home/"' >> ~/.bash_profile

. ~/.bash_profile
