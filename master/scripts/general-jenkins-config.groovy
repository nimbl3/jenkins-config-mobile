/**
 * Some general configurations and security setups, this also satisfies all the Jenkins's Warnings
 */
import jenkins.model.*
import jenkins.security.s2m.AdminWhitelistRule

String DEFAULT_JENKINS_URL = "https://localhost:8080"
Jenkins jenkinsInstance = Jenkins.instance

jenkinsInstance.setNumExecutors(0)

// See https://jenkins.io/blog/2017/04/11/new-cli/
jenkinsInstance.getDescriptor("jenkins.CLI").get().setEnabled(false)

// Setup the jenkins root url, this is changeable after that at: JENKINS_URL/configure -> Jenkins URL
JenkinsLocationConfiguration location = jenkinsInstance.getExtensionList('jenkins.model.JenkinsLocationConfiguration')[0]
location.url = DEFAULT_JENKINS_URL
location.save()

// https://wiki.jenkins.io/display/JENKINS/Slave+To+Master+Access+Control
jenkinsInstance.injector.getInstance(AdminWhitelistRule.class).setMasterKillSwitch(false);
jenkinsInstance.save()