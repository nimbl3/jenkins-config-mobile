# Starting off with the Jenkins base Image
FROM jenkinsci/blueocean:latest
 
# Installing the plugins we need using the in-built install-plugins.sh script
RUN /usr/local/bin/install-plugins.sh \ 
    git git-parameter matrix-auth parameterized-trigger workflow-aggregator ssh-agent ssh-slaves \ 
    docker-workflow credentials-binding htmlpublisher gradle xcode-plugin

# Setting up environment variables for Jenkins admin user
ENV JENKINS_USER admin
ENV JENKINS_PASS admin

# Custom port for Slave Agent if you'd like to customize it, default is 50000
ENV JENKINS_SLAVE_AGENT_PORT 49001
 
# Skip the initial setup wizard
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

# Expose Ports
EXPOSE 8080 $JENKINS_SLAVE_AGENT_PORT

# Start-up scripts to set number of executors and creating the admin user
COPY executors.groovy /usr/share/jenkins/ref/init.groovy.d/
COPY default-user.groovy /usr/share/jenkins/ref/init.groovy.d/

VOLUME /var/jenkins_home
