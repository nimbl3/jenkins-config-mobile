import jenkins.model.*
import hudson.security.*

def env = System.getenv()
def jenkins = Jenkins.getInstance()

def adminId = env['JENKINS_USER']
def adminPassword = env['JENKINS_PASS']

jenkins.setSecurityRealm(new HudsonPrivateSecurityRealm(false))
jenkins.setAuthorizationStrategy(new GlobalMatrixAuthorizationStrategy())

def user = jenkins.getSecurityRealm().createAccount(adminId, adminPassword)
user.save()
println "[INIT-DEBUG] Admin user created..."

jenkins.getAuthorizationStrategy().add(Jenkins.ADMINISTER, adminId)
jenkins.save()
println "[INIT-DEBUG] Admin access role assigned..."