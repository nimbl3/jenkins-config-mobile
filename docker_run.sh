docker run -d -v $("pwd")/volume-blueocean:/var/jenkins_home -p 8081:8080 -p 49001:49001 --env JENKINS_SLAVE_AGENT_PORT=49001 --name=jenkins-blueocean  -i jenkinsci/blueocean
