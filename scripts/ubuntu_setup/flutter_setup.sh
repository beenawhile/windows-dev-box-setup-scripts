# -- Flutter Dev Environment Specific --
# 1. Java SDK Path Setting
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
PATH=$PATH:$JAVA_HOME/bin
# run command below after setup
# echo "\n\nexport JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64\nexport PATH=\$PATH:\$JAVA_HOME/bin\n" >> ~/.zshrc

# 2. SDK Manager
mkdir -p ~/Android/SDK/cmdline-tools
wget https://dl.google.com/android/repository/commandlinetools-linux-7302050_latest.zip -O latest.zip
unzip latest.zip
mv cmdline-tools ~/Android/SDK/cmdline-tools/latest
rm -rf latest.zip
export ANDROID_SDK_ROOT=$HOME/Android/SDK
export PATH=$PATH:$ANDROID_SDK_ROOT/cmdline-tools/latest/bin
# run command below after setup
# echo "\nexport ANDROID_SDK_ROOT=\$HOME/Android/SDK\nexport PATH=\$PATH:\$ANDROID_SDK_ROOT/cmdline-tools/latest/bin\n" >> ~/.zshrc


# 3. make adb available
sdkmanager --install "platform-tools"
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools
# run command below after setup
# echo "export PATH=\$PATH:\$ANDROID_SDK_ROOT/platform-tools\n" >> ~/.zshrc

# 4. install Android image
sdkmanager --install "system-images;android-30;google_apis;x86" "platforms;android-30" "build-tools;30.0.3"
sdkmanager --licenses
