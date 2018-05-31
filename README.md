# Jenkins Configuration for mobile apps projects

## Setup machine:
- For Android development:
    - Start Java as allowed service on Mac OS (required for the Hi-Sierra OS)
    - Run `$ sh init-script.sh`
    - Install Android Studio for the base tools set.
    - Create the desired Emulator profile to use for testing. 
- For iOS development:
   - [iOS Slave machine configurations](ios-slave-machine-setup.md)

## Run jenkins in local machine
- Install Docker.
- Run `$ sh docker_run.sh`.
- Jenkins is up at `http://localhost` without any security. Next step is to re-configure the security and re-new the credentials to access to project's repository.

## Installing to Linux VPS
- Pre-Installation
    - [Git](https://www.digitalocean.com/community/tutorials/how-to-install-git-on-ubuntu-16-04)
    - [Java](https://www.digitalocean.com/community/tutorials/how-to-install-java-with-apt-get-on-ubuntu-16-04) 
    - [Docker](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-16-04)
    - [UFW (Uncomplicated Firewall)](https://www.digitalocean.com/community/tutorials/how-to-setup-a-firewall-with-ufw-on-an-ubuntu-and-debian-cloud-server)
        - UFW should be installed by default in Ubuntu.
- Configurations
    - Enabling ports
        - There are 2 places to enable ports, which are on the `OS` and `Dashboard`. For Digital Ocean, `Ubuntu` is contained inside the droplet. Both `Ubuntu` and `Droplet` need to be enabled on the same port so that `Ubuntu` can be reachable.
        - Ubuntu Configuration
            - Enable Uncomplicated Firewall
                - `sudo ufw enable`
            - Enable port 80 for Jenkins web dashboard.
                - `sudo ufw allow 80`
            - Enable port 50000 for Jenkins nodes connection.
                - `sudo ufw allow 50000` 
            - Enable port 22 for remote SSH connection.
                - `sudo ufw allow 22` 
            - To validate all ports are enabled, 3 mentioned ports should be displayed.
                - `sudo ufw status` 
        - VPS Dashboard Configuration (Digital Ocean)
            - Network -> Firewall -> Create firewall with ports `80`, `50000`, `22` 
- Installing
    - Clone this repository
        - `$ git clone git@github.com:nimbl3/jenkins-config-mobile.git`
    - Get inside 
        - `$ cd jenkins-config-mobile`
    - Run
        - `$ sh docker_run.sh`

## Re-config the Jenkins base security:
- Go to "Manage Jenkins" -> "Configure Global Security" -> "Enable Security" -> "Use Jenkin's own database" -> "Allow users to sign up".
- Under Authorization, select: "Matrix-based security" and add new `admin` user with full permission.
- Restart jenkins by log to `http://<JENKINS_URL>/restart`.
- Signup with `admin` username. From now you can decide to disable `Allow users to sign up`.
