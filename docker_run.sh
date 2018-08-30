docker run --restart=always -d -v $("pwd")/volume-blueocean:/var/jenkins_home -p 80:8080 -p 50000:50000 --name=jenkins-blueocean -i jenkinsci/blueocean:latest
