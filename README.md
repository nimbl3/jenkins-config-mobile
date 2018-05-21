# Jenkins Configuration for mobile apps projects

## Setup machine:
- Run `$ sh init-script.sh`
- Start Java as allowed service on Mac OS (required for the Hi-Sierra OS)
- For Android development:
   - Install Android Studio for the base tools set.
   - Create the desired Emulator profile to use for testing. 
- For iOS development:
   - Install Xcode with the specific version the project is currently using
   - Disable screensaver mode and set 'Turn display off' to Never. This is required for UI testing with Appium.
   ```
   # disable sleep mode
   System Preferences > Energy Saver > set Turn display off after to Never

   # disable screensaver
   System Preferences > Desktop & Screen Saver > set Start after to Never
   ```
   - Allow Accessibility for Terminal in order to allow mocking simulator's location for UI testing
   ```
   System Preferences > Security & Privacy > Privacy > Accessibility > Add Terminal by tapping + button
   ```
   - Open Terminal and run command
   ```
   $ sh setup_ios_environment.sh
   ```

## HOW-TO run jenkins in docker and attach the volume:
- Install Docker.
- Run `$ sh docker_run.sh`.
- Jenkins is up at `https://localhost:8085` without any security. Next step is to re-configure the security and re-new the credentials to access to project's repository.

# Re-config the Jenkins base security:
- Go to "Manage Jenkins" -> "Configure Global Security" -> "Enable Security" -> "Use Jenkin's own database" -> "Allow users to sign up".
- Under Authorization, select: "Matrix-based security" and add new `admin` user with full permission.
- Restart jenkins by log to `https://localhost:8085/restart`.
- Signup with `admin` username. From now you can decide to disable `Allow users to sign up`.
