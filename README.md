# Jenkins Configuration for mobile apps projects

## Setup machine:
- Run `$ sh android-init-script.sh`
- Start Java as allowed service on Mac OS (required for the Hi-Sierra OS)
- For Android development:
   - Install Android Studio for the base tools set.
   - Create the desired Emulator profile to use for testing. 

## HOW-TO run jenkins in docker and attach the volume:
- Install Docker.
- Run `$sh docker_run.sh`.
- Jenkins is up at `https://localhost:8085` without any security. Next step is to re-configure the security and re-new the credentials to access to project's repository.

## Re-config the Jenkins base security:
- Go to "Manage Jenkins" -> "Configure Global Security" -> "Enable Security" -> "Use Jenkin's own database" -> "Allow users to sign up".
- Under Authorization, select: "Matrix-based security" and add new `admin` user with full permission.
- Restart jenkins by log to `https://localhost:8085/restart`.
- Signup with `admin` username. From now you can decide to disable `Allow users to sign up`.
