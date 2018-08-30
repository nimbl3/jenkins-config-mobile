# Starting off with the Jenkins base Image
FROM jenkinsci/blueocean:latest
 
# Installing the plugins we need using the in-built install-plugins.sh script
RUN /usr/local/bin/install-plugins.sh \ 
    git git-parameter matrix-auth parameterized-trigger workflow-aggregator ssh-agent ssh-slaves \ 
    docker-workflow credentials-binding htmlpublisher xcode-plugin role-strategy

# Setting up environment variables for Jenkins admin user
ENV JENKINS_USER admin \
    JENKINS_PASS admin

# Custom port for Slave Agent if you'd like to customize it, default is 50000
ENV JENKINS_SLAVE_AGENT_PORT 49001
 
# Skip the initial setup wizard
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false
ENV INIT_DIRECTORY /usr/share/jenkins/ref/init.groovy.d/


# Init scripts that run at start-up time:
# 1. Setup some policy configurations and satisfying the Warnings from Jenkins for security purpose
COPY scripts/general-jenkins-config.groovy $INIT_DIRECTORY
# 2. Creating default 'admin' user
COPY scripts/default-user.groovy $INIT_DIRECTORY
# 3. Configure Agent protocol, removing deprecated TCP connection
COPY scripts/agent-protocol-config.groovy $INIT_DIRECTORY
# 4. Configure CSRF protection
COPY scripts/csrf-config.groovy $INIT_DIRECTORY

# Expose Ports
EXPOSE 8080 $JENKINS_SLAVE_AGENT_PORT

VOLUME /var/jenkins_home
