docker run -d -v $("pwd")/volume-blueocean:/var/jenkins_home -p 8085:8080 -p 50000:50000 --name=jenkins-blueocean -i jenkinsci/blueocean:1.3.3